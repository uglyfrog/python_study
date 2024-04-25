local EnergyBeamDefence = {}

--[[
The defence has a base power use.
It starts with full charge.
When under attack energy usage is increased based on the attack strength.
If the buffer has not recoverd sufficently between ticks then the structure is not providing defence.


Make a list of defences per zone
When an attack comes in, disrtibute the load of the attack on all enemy defences weighted by the defences current energy vs energy max.
Update once per second?

zone.energy_beams = {}
zone.energy_beam_defences = {}
beam.stress_factores = {beams}
Apply a share of the load (energy)

]]
EnergyBeamDefence.name_energy_beam_defence = mod_prefix.."energy-beam-defence"
EnergyBeamDefence.name_energy_beam_defence_glow = mod_prefix.."energy-beam-defence-glow"
EnergyBeamDefence.beam_defence_passive_draw = 10000000 --10MW
EnergyBeamDefence.beam_defence_buffer = 1000000000 --1GJ
EnergyBeamDefence.beam_defence_efficiency = 10 -- takes 1/10th the power of the emitter
EnergyBeamDefence.beam_defence_peak_flare_power = 2000000000 -- 2GW
EnergyBeamDefence.beam_defence_required = 0.5 --

function EnergyBeamDefence.zone_is_defended(zone, pressure_force_name)
  -- force == nil == neutral
  for force_name, forcedata in pairs(global.forces) do
    local force = game.forces[force_name]
    if pressure_force_name == nil or ((force_name ~= pressure_force_name) and (not (force.get_friend(pressure_force_name) or force.get_cease_fire(pressure_force_name)))) then
      local zone_assets = Zone.get_force_assets(force_name, zone.index)
      if zone_assets and zone_assets.energy_beam_defence then
        for unit_number, defence in pairs(zone_assets.energy_beam_defence) do
          --Log.trace(defence.entity.energy)
          if defence.operational then
            --Log.trace("defended")
            return true
          end
        end
      end
    end
  end
  --Log.trace("not defended")
  return false
end

function EnergyBeamDefence.zone_add_pressure(zone, pressure)

  global.energy_beam_target_zones = global.energy_beam_target_zones or {}
  global.energy_beam_target_zones[zone.index] = zone
  zone.energy_beam_pressures = zone.energy_beam_pressures or {
    solar = {},
    emitters = {},
  }

  if pressure.type == "solar-flare" then
    if not zone.energy_beam_pressures.solar[pressure.id] then
      --TODO: print message to defenecs
      zone.energy_beam_pressures.solar[pressure.id] = pressure
      EnergyBeamDefence.defences_apply_pressure(zone)
    end
  else --if pressure.type == "energy-beam-emitter-tree" then -- restore later, legacy test is missing this property
    if not zone.energy_beam_pressures.emitters[pressure.unit_number] then
      --TODO: print message to defenecs
      zone.energy_beam_pressures.emitters[pressure.unit_number] = pressure
      EnergyBeamDefence.defences_apply_pressure(zone)
    end
  end


end

function EnergyBeamDefence.defences_apply_pressure(zone)
  -- validate
  if not zone.energy_beam_pressures then
    global.energy_beam_target_zones[zone.index] = nil
    return
  end

  -- gather and validate
  local pressures_count = 0
  local force_emitter_pressures = {}

  for id, tick_task in pairs(zone.energy_beam_pressures.solar) do
    if tick_task.valid then
      pressures_count = pressures_count + 1
      if not force_emitter_pressures["-"] then
        force_emitter_pressures["-"] = 0
      end
      force_emitter_pressures["-"] = force_emitter_pressures["-"] + (0.1 + 0.9 * (tick_task.age_peak or 0.0001)) * EnergyBeamDefence.beam_defence_peak_flare_power * tick_task.power_multiplier
    else
      zone.energy_beam_pressures.solar[id] = nil
    end
  end
  --Log.trace(table_size(zone.energy_beam_pressures.emitters))
  for unit_number, emitter_tree in pairs(zone.energy_beam_pressures.emitters) do
    --Log.trace(emitter_tree.last_temperature)
    if emitter_tree.destination and emitter_tree.destination.zone and emitter_tree.destination.zone.index == zone.index and emitter_tree.emitter.valid and (emitter_tree.mode == "glaive" or emitter_tree.mode == "auto-glaive") then
      pressures_count = pressures_count + 1
      if not force_emitter_pressures[emitter_tree.force_name] then
        force_emitter_pressures[emitter_tree.force_name] = 0
      end
      force_emitter_pressures[emitter_tree.force_name] = force_emitter_pressures[emitter_tree.force_name]
        + emitter_tree.last_temperature * emitter_tree.last_efficiency * EnergyBeam.specific_heat / EnergyBeamDefence.beam_defence_efficiency
    else
      zone.energy_beam_pressures.emitters[unit_number] = nil
    end
  end

  for force_name, forcedata in pairs(global.forces) do
    local zone_assets = Zone.get_force_assets(force_name, zone.index)
    if zone_assets and zone_assets.energy_beam_defence then
      for unit_number, defence in pairs(zone_assets.energy_beam_defence) do
        if defence.entity and defence.entity.valid then
          defence.pressure = 0
          defence.operational = true
          defence.entity.power_usage = EnergyBeamDefence.beam_defence_passive_draw/60
          if defence.glow_id and rendering.is_valid(defence.glow_id) then
            rendering.destroy(defence.glow_id)
            defence.glow_id = nil
          end
        else
          zone_assets.energy_beam_defence[unit_number] = nil
        end
      end
    end
  end

  if pressures_count == 0 then
    zone.energy_beam_pressures = nil
    return
  end

  -- equalise
  for pressure_force_name, pressure in pairs(force_emitter_pressures) do

    local defences = {}
    local defences_total_energy = 0
    for force_name, forcedata in pairs(global.forces) do
      local force = game.forces[force_name]
      if pressure_force_name == "-" or ((force_name ~= pressure_force_name) and (not (force.get_friend(pressure_force_name) or force.get_cease_fire(pressure_force_name)))) then
        local zone_assets = Zone.get_force_assets(force_name, zone.index)
        if zone_assets and zone_assets.energy_beam_defence then
          for unit_number, defence in pairs(zone_assets.energy_beam_defence) do
            table.insert(defences, defence)
            defences_total_energy = defences_total_energy + defence.entity.energy
          end
        end
      end
    end
    for _, defence in pairs(defences) do
      local defence_share = defences_total_energy > 0 and (defence.entity.energy / defences_total_energy) or 0.01
      defence.pressure = defence.pressure + pressure * defence_share
    end
  end

  for force_name, forcedata in pairs(global.forces) do
    local force = game.forces[force_name]
    local zone_assets = Zone.get_force_assets(force_name, zone.index)
    if zone_assets and zone_assets.energy_beam_defence then
      for unit_number, defence in pairs(zone_assets.energy_beam_defence) do
        defence.entity.power_usage = (EnergyBeamDefence.beam_defence_passive_draw + defence.pressure)/60
        defence.operational = defence.entity.energy / EnergyBeamDefence.beam_defence_buffer > EnergyBeamDefence.beam_defence_required
        if defence.pressure > 0.001 then
          defence.glow_id = rendering.draw_sprite{
            sprite = EnergyBeamDefence.name_energy_beam_defence_glow,
            target = defence.entity,
            surface = defence.entity.surface
          }
        end
      end
    end
  end

end

function EnergyBeamDefence.on_entity_created(event)
  local entity
  if event.entity and event.entity.valid then
    entity = event.entity
  end
  if event.created_entity and event.created_entity.valid then
    entity = event.created_entity
  end
  if not entity then return end
  if entity.name == EnergyBeamDefence.name_energy_beam_defence then
    local zone = Zone.from_surface(entity.surface)
    if not zone then
      return cancel_entity_creation(entity, event.player_index, "Invalid location")
    end
    local force = entity.force
    local force_name = force.name
    local force_data = global.forces[force.name]
    if force_data then
      local zone_assets = Zone.get_force_assets(force_name, zone.index)
      zone_assets.energy_beam_defence = zone_assets.energy_beam_defence or {}
      local defence = {
        type = "energy-beam-defence",
        unit_number = entity.unit_number,
        force_name = force_name,
        entity = entity,
        zone_index = zone.index,
        pressures = {
          solar = {},
          emitters = {},
        },
        operational = false
      }
      zone_assets.energy_beam_defence[defence.unit_number] = defence

      entity.power_usage = EnergyBeamDefence.beam_defence_passive_draw/60
      entity.electric_buffer_size = EnergyBeamDefence.beam_defence_buffer
    end
  end
end
Event.addListener(defines.events.on_built_entity, EnergyBeamDefence.on_entity_created)
Event.addListener(defines.events.on_robot_built_entity, EnergyBeamDefence.on_entity_created)
Event.addListener(defines.events.script_raised_built, EnergyBeamDefence.on_entity_created)
Event.addListener(defines.events.script_raised_revive, EnergyBeamDefence.on_entity_created)

function EnergyBeamDefence.on_nth_tick_60()
  if global.energy_beam_target_zones then
    for zone_index, zone in pairs(global.energy_beam_target_zones) do
      EnergyBeamDefence.defences_apply_pressure(zone)
    end
  end
end
Event.addListener("on_nth_tick_60", EnergyBeamDefence.on_nth_tick_60) -- 1 minute

return EnergyBeamDefence

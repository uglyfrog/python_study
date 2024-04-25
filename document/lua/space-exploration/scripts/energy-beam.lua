-- Used for energy transmission and cross-surface energy beam weapons.
--[[
TODO: When emitter is selected show GUI. Similar to delivery cannon

]]
local EnergyBeam = {}

EnergyBeam.name_emitter = mod_prefix.."energy-transmitter-emitter"
EnergyBeam.name_chamber = mod_prefix.."energy-transmitter-chamber"
EnergyBeam.name_injector = mod_prefix.."energy-transmitter-injector"
EnergyBeam.name_injector_reactor = mod_prefix.."energy-transmitter-injector-reactor"
EnergyBeam.name_receiver = mod_prefix.."energy-receiver"
EnergyBeam.name_receiver_beam = mod_prefix.."energy-receiver-beam" -- projectile
EnergyBeam.name_glaive_beam = mod_prefix.."energy-glaive-beam" -- projectile
EnergyBeam.name_glaive_beam_sprite = mod_prefix.."energy-glaive-beam-sprite" -- sprite
EnergyBeam.name_glaive_path_fx = mod_prefix.."energy-glaive-path-fx"
EnergyBeam.name_glaive_damage_projectile = mod_prefix.."energy-glaive-damage-projectile"
EnergyBeam.name_glaive_damage_aoe = mod_prefix.."energy-glaive-damage-aoe"
EnergyBeam.name_glaive_damage_aoe_large = mod_prefix.."energy-glaive-damage-aoe-large"

EnergyBeam.emitter_width = 10
EnergyBeam.chamber_box = {x=8, y=4}
EnergyBeam.injector_length = 5

EnergyBeam.name_transmitter_targeter = mod_prefix .. "energy-transmitter-targeter"
EnergyBeam.name_target_activity_type = "energy-transmitter-target"
EnergyBeam.name_transmitter_gui_root = "energy_transmitter"
EnergyBeam.name_transmitter_effect = mod_prefix .. "energy-transmitter-beam"
EnergyBeam.transfer_interval = 60
EnergyBeam.specific_heat = 1000000000 -- 1GJ
EnergyBeam.injector_donate_rate = 0.05
EnergyBeam.injector_waste_rate = 0.005
EnergyBeam.beam_speed_base = 0.05
EnergyBeam.beam_speed_temperature_multiplier = 0.05
EnergyBeam.beam_speed_temperature_exponent = 0.9
EnergyBeam.large_aoe_heat = 100

EnergyBeam.glaive_cost_aoe = 0.5
EnergyBeam.glaive_cost_aoe_large = 1.2

function EnergyBeam.get_gui(player)
  -- TODO: mod option for this stuff
  return "left"
end

function EnergyBeam.from_unit_number (unit_number)
  unit_number = tonumber(unit_number)
  if global.energy_transmitters then
    return global.energy_transmitters[unit_number]
  end
end

function EnergyBeam.from_entity (entity)
  if not(entity and entity.valid) then
    Log.trace("EnergyBeam.from_entity: invalid entity")
    return
  end
  return EnergyBeam.from_unit_number(entity.unit_number)
end

function EnergyBeam.get_transmission_efficiency(origin, destination)
  if origin and destination then
    local delta_v = Zone.get_launch_delta_v(origin) + Zone.get_travel_delta_v(origin, destination)
    local efficiency = 1- delta_v/(delta_v+10000)

    local origin_stellar_position = Zone.get_stellar_position(origin)
    local destination_stellar_position = Zone.get_stellar_position(destination)

    if destination.type == "anomaly" or origin.type == "anomaly" then
      efficiency = efficiency * 0.01
    else
      if origin_stellar_position and destination_stellar_position then -- interstellar less effective
        if Util.vectors_delta_length(origin_stellar_position, destination_stellar_position) > 0.001 then
          efficiency = efficiency * 0.5
        end
      else
        efficiency = efficiency * 0.5
      end
    end

    if Zone.is_solid(origin) then
      efficiency = efficiency * 0.5
    end
    return efficiency
  end
end

function EnergyBeam.gui_close (player)
  if player.gui[EnergyBeam.get_gui(player)][EnergyBeam.name_transmitter_gui_root] then
    player.gui[EnergyBeam.get_gui(player)][EnergyBeam.name_transmitter_gui_root].destroy()
  end
end

function EnergyBeam.get_coordinate(tree)
  if tree.destination and tree.destination.coordinate then
    return tree.destination.coordinate
  end
  --return tree.emitter.position -- return nil
end

function EnergyBeam.clear_end_beam(tree)
  if tree.receiver_beam and tree.receiver_beam.valid then
    tree.receiver_beam.destroy()
    tree.receiver_beam = nil
  end
  if tree.glaive_beam and tree.glaive_beam.valid then
    tree.glaive_beam.destroy()
    tree.glaive_beam = nil
  end
  EnergyBeam.remove_markers(tree)
end

function EnergyBeam.collect_heat(tree, waste)
  local temperature = 0
  for _, injector_reactor in pairs(tree.injector_reactors) do
    if injector_reactor.valid then
      local heat = (injector_reactor.temperature - 15) * EnergyBeam.injector_donate_rate
      if heat > 1 then heat = math.pow(heat, 0.5) end -- reduce overload charge efficiency
      local remove = (injector_reactor.temperature - 15) * (waste and EnergyBeam.injector_waste_rate or EnergyBeam.injector_donate_rate)
      injector_reactor.temperature = injector_reactor.temperature - remove
      temperature = temperature + heat
    end
  end
  return temperature
end

function EnergyBeam.beam_step_idle(tree)
  EnergyBeam.clear_end_beam(tree)
  if tree.emitter_beam and tree.emitter_beam.valid then
    tree.emitter_beam.destroy()
  end

  local temperature = EnergyBeam.collect_heat(tree, true) -- waste
  tree.last_temperature = temperature

  if tree.destination and tree.destination.zone then
    local efficiency = EnergyBeam.get_transmission_efficiency(tree.zone, tree.destination.zone)
    tree.last_efficiency = efficiency
  else
    tree.last_efficiency = 0
  end
end

function EnergyBeam.find_enemy(tree)
  local destination_surface = Zone.get_make_surface(tree.destination.zone)
  local position = tree.destination.coordinate or {x = 0, y = 0}
  local force = game.forces[tree.force_name]
  local enemy = find_enemy(force, destination_surface, position)

  if enemy then
    tree.destination.coordinate = enemy.position
    force.chart(destination_surface, Util.position_to_area(enemy.position, 32))
    return
  end
  -- nothing found
  game.forces[tree.force_name].print({
    "space-exploration.energy-transmitter-no-enemies-found",
    "[gps="..math.floor(tree.emitter.position.x)..","..math.floor(tree.emitter.position.y)..","..destination_surface.name.."]"
    })
  tree.mode = "off"
end

function EnergyBeam.scale_glaive_sprite(tree)
  local position = EnergyBeam.get_coordinate(tree)
  if not position then
    if not (tree.glaive_beam and tree.glaive_beam.valid) then return end
    position = tree.glaive_beam.position
  end

  if not (tree.glaive_beam and tree.glaive_beam.valid) then
    local destination_surface = Zone.get_make_surface(tree.destination.zone)
    tree.glaive_beam =  destination_surface.create_entity{
      name = EnergyBeam.name_glaive_beam,
      position = position,
      target = Util.vectors_add(position, {x=0,y=-1}),
      speed = 0,
      force = tree.force_name
    }
  end
  if not (tree.glaive_beam_sprite_id and rendering.is_valid(tree.glaive_beam_sprite_id)) then
    tree.glaive_beam_sprite_id = rendering.draw_sprite{
      target = tree.glaive_beam,
      sprite = EnergyBeam.name_glaive_beam_sprite,
      surface = tree.glaive_beam.surface,
    }
  end
  rendering.set_y_scale(tree.glaive_beam_sprite_id, 0.5 + 1.5 * math.min(1, tree.last_temperature / 100))
  rendering.set_x_scale(tree.glaive_beam_sprite_id, 0.4 + 2 * math.min(1, tree.last_temperature / 100))
  rendering.set_color(tree.glaive_beam_sprite_id, {
    r = 1,
    g = 0.5 + 0.5 * math.min(1, tree.last_temperature / 100),
    b = 0.5 + 0.5 * math.min(1, tree.last_temperature / 100) })

end

function EnergyBeam.remove_markers(tree)
  if tree.markers then
    for _, marker in pairs(tree.markers) do
      if marker and marker.valid then
        marker.destroy()
      end
    end
  end
  tree.markers = nil
end

function EnergyBeam.add_markers(tree)
  EnergyBeam.remove_markers(tree)
  if tree.glaive_beam and tree.glaive_beam.valid then
    tree.markers = {}
    for force_name, forcedata in pairs(global.forces) do
      if force_name ~= "friendly" and force_name ~= "ignore" and force_name ~= "capture" then
        tree.markers[force_name] = game.forces[force_name].add_chart_tag(tree.glaive_beam.surface, {
          icon = {type = "virtual", name = mod_prefix.."heat"},
          position = tree.glaive_beam.position,
          text = "Energy Glaive"
        })
      end
    end
  end
end

function EnergyBeam.beam_step(tree)
  local mode = tree.mode or "off"
  local position = EnergyBeam.get_coordinate(tree)
  if position == nil and mode == "auto-glaive" then
    EnergyBeam.find_enemy(tree)
    position = EnergyBeam.get_coordinate(tree)
  end

  if mode == "off" or (not position) or not (tree.destination and tree.destination.zone) then
    EnergyBeam.beam_step_idle(tree)
  else

    local zone = tree.zone
    local efficiency = EnergyBeam.get_transmission_efficiency(zone, tree.destination.zone)
    tree.last_efficiency = efficiency
    local destination_surface = Zone.get_make_surface(tree.destination.zone)
    local emitter_beam = false

    if mode == "energise" then
      local receiver = destination_surface.find_entity(EnergyBeam.name_receiver, position)
      if receiver then
        local temperature = EnergyBeam.collect_heat(tree)
        tree.last_temperature = temperature
        if temperature > 0.1 then
          emitter_beam = true
          if tree.glaive_beam then EnergyBeam.clear_end_beam(tree) end
          receiver.temperature = receiver.temperature + temperature * efficiency
          if not (tree.receiver_beam and tree.receiver_beam.valid) then
            tree.receiver_beam = destination_surface.create_entity{
              name = EnergyBeam.name_receiver_beam,
              position = receiver.position,
              target = Util.vectors_add(receiver.position, {x=0,y=-1}),
              speed = 0
            }
          end
        end
      else
        EnergyBeam.beam_step_idle(tree)
      end
      if emitter_beam == false then EnergyBeam.clear_end_beam(tree) end

    elseif mode == "glaive" or mode == "auto-glaive" then

      local temperature = EnergyBeam.collect_heat(tree)
      tree.last_temperature = temperature
      if temperature > 0.1 then
        EnergyBeamDefence.zone_add_pressure(tree.destination.zone, tree)

        if tree.receiver_beam then EnergyBeam.clear_end_beam(tree) end
        tree.glaive_energy = (tree.glaive_energy or 0) + temperature * efficiency
        if EnergyBeamDefence.zone_is_defended(tree.destination.zone, tree.force_name) then
          -- the beam is blocked but pressure is being applied
          if tree.glaive_beam and tree.glaive_beam.valid then
            tree.glaive_beam.destroy()
            tree.glaive_beam = nil
          end
          tree.glaive_energy = 0
          emitter_beam = true
        else
          if tree.glaive_energy > 0.1 then
            emitter_beam = true
          end
          if emitter_beam == false then
            EnergyBeam.beam_move(tree) -- removes?
          else
            EnergyBeam.scale_glaive_sprite(tree)
            if mode == "auto-glaive" then
              -- find target
              if tree.destination.coordinate == nil or Util.vectors_delta_length(tree.destination.coordinate, tree.glaive_beam.position) < 0.1 then
                EnergyBeam.find_enemy(tree)
              end
            end
            tree.glaive_beam.surface.create_entity{
              name = "fire-flame-on-tree",
              position = tree.glaive_beam.position,
              force = tree.force_name
            }

            EnergyBeam.add_markers(tree)

          end
        end
      end
    end

    if emitter_beam then
      if not (tree.emitter_beam and tree.emitter_beam.valid) then
        tree.emitter_beam = tree.emitter.surface.create_entity{
          name = EnergyBeam.name_transmitter_effect,
          position = tree.emitter.position,
          target = {x = tree.emitter.position.x, y = tree.emitter.position.y - 1},
          speed = 0}
      end
    else
      if tree.emitter_beam and tree.emitter_beam.valid then
        tree.emitter_beam.destroy()
      end
    end

  end

end

function EnergyBeam.beam_move(tree)
  if not tree.destination.zone then
    tree.mode = "off"
    EnergyBeam.beam_step_idle(tree)
    return
  end
  local position = EnergyBeam.get_coordinate(tree)
  if not position then
    if not (tree.glaive_beam and tree.glaive_beam.valid) then return end
    position = tree.glaive_beam.position
  end

  EnergyBeam.scale_glaive_sprite(tree)
  local curent_position = tree.glaive_beam.position

  local move_speed = EnergyBeam.beam_speed_base * (1 + math.pow(EnergyBeam.beam_speed_temperature_multiplier * tree.last_temperature, EnergyBeam.beam_speed_temperature_exponent))
  local new_position = util.move_to(curent_position, position, move_speed, false)
  tree.glaive_beam.teleport(new_position)
  if Util.vectors_delta_length(new_position, position) < 0.1 and tree.mode == "auto-glaive" then
    EnergyBeam.find_enemy(tree)
  end

  tree.glaive_energy_2 = tree.glaive_energy_2 or 0
  if tree.glaive_energy_2 < tree.glaive_energy then
    tree.glaive_energy_2 = tree.glaive_energy_2 + tree.glaive_energy / 600
    tree.glaive_energy = tree.glaive_energy - tree.glaive_energy / 600
  end

  local energy_to_use = tree.glaive_energy_2 / 100
  local energy_used = 0
  --local cost_projectile = 0.05

  if new_position.x ~= curent_position.x and new_position.y ~= curent_position.y and math.random() < 0.1 then
    tree.glaive_beam.surface.create_entity{
      name = "fire-flame-on-tree",
      position = tree.glaive_beam.position,
      force = tree.force_name
    }
    tree.glaive_beam.surface.create_entity{
      name = EnergyBeam.name_glaive_path_fx,
      position = tree.glaive_beam.position,
      force = tree.force_name
    }
  end

  while energy_used + EnergyBeam.glaive_cost_aoe_large <= energy_to_use do
    local r = math.random()
    if r < tree.last_temperature/EnergyBeam.large_aoe_heat then -- transition the damage to lower direct dps but larger area as it gets towards 100 GW
      energy_used = energy_used + EnergyBeam.glaive_cost_aoe_large
      tree.glaive_beam.surface.create_entity{
        name = EnergyBeam.name_glaive_damage_aoe_large,
        position = tree.glaive_beam.position,
        force = tree.force_name
      }
    else
      energy_used = energy_used + EnergyBeam.glaive_cost_aoe
      tree.glaive_beam.surface.create_entity{
        name = EnergyBeam.name_glaive_damage_aoe,
        position = tree.glaive_beam.position,
        force = tree.force_name
      }
    end
    --[[else
      energy_used = energy_used + cost_projectile
      tree.glaive_beam.surface.create_entity{
        name = EnergyBeam.name_glaive_damage_projectile,
        position = tree.glaive_beam.position,
        target = Util.vectors_add(tree.glaive_beam.position, Util.orientation_to_vector(math.random(), 5)),
        speed = 1,
        max_range = 5,
        force = tree.force_name
      }
    end]]
  end
  tree.glaive_energy_2 = tree.glaive_energy_2 - energy_used
end

function EnergyBeam.gui_update(player)
  local root = player.gui[EnergyBeam.get_gui(player)][EnergyBeam.name_transmitter_gui_root]
  if (root and root.unit_number) then
    local tree = EnergyBeam.from_unit_number(root.unit_number.children_names[1])
    if tree then
      local transfer_per_tick = (tree.last_temperature or 0) / EnergyBeam.transfer_interval
      local energy_per_tick = transfer_per_tick * EnergyBeam.specific_heat
      local format_energy = function(energy)
        return string.format("%.2f",energy*60/1000000000) .. "GW"
      end
      if root["energy"] then
        root["energy"].caption={
          "space-exploration.energy_transmitter_label_transfer",
          format_energy(energy_per_tick)
        }
      end
      if root["efficiency"] then
        if Zone.is_solid(tree.zone) then
          root["efficiency"].caption={
            "space-exploration.energy_transmitter_label_efficiency_atmo",
            string.format("%.2f", (tree.last_efficiency or 0) * 100).."%"
          }
        else
          root["efficiency"].caption={
            "space-exploration.energy_transmitter_label_efficiency",
            string.format("%.2f", (tree.last_efficiency or 0) * 100).."%"
          }
        end
      end

      local mode = tree.mode or "off"
      for _, child in pairs(root.mode_table.children) do
        if child.name == mode then
          child.style = "zonelist_row_button_selected"
        else
          child.style = "zonelist_row_button"
        end
     end

      if root.destination_location_table and root.destination_location_table.destination_location_coordinates then
        local coordinate = EnergyBeam.get_coordinate(tree)
        if coordinate then
          root.destination_location_table.destination_location_coordinates.caption = "X:"..string.format("%.0f", coordinate.x) .. "  Y:"..string.format("%.0f", coordinate.y)
        else
          root.destination_location_table.destination_location_coordinates.caption = {"space-exploration.no-coordinates-set"}
        end
      end
    end
  end
end



function EnergyBeam.gui_open(player, tree)

  if not tree then
    Log.trace('EnergyBeam.gui_open tree not found')
    return
  end

  local gui_name = EnergyBeam.get_gui(player)
  local gui = player.gui[gui_name]
  player.opened = nil
  EnergyBeam.gui_close (player)
  local playerdata = get_make_playerdata(player)

  local container = gui.add{ type = "frame", name = EnergyBeam.name_transmitter_gui_root, direction="vertical"}
  player.opened = container

  local title_flow = container.add{ type="flow", name="unit_number", direction="horizontal"}
  -- NOTE: [EnergyBeam.name_transmitter_gui_root].unit_number.child_names()[1] gets unit number
  local title = title_flow.add{ type="label", name=tree.unit_number, caption={"space-exploration.energy_transmitter_gui_title"}, style="heading_1_label"}
  title.ignored_by_interaction = true
  if gui_name == "screen" then title_flow.drag_target=container end

  -- Trying to make the fancy "Drag me" vertical bars...
  local drag_handle = title_flow.add{type = "empty-widget", style = "draggable_space_header", direction="horizontal"}
  if gui_name == "screen" then drag_handle.drag_target = container end
  drag_handle.style.minimal_width = 20
  drag_handle.style.horizontally_stretchable = true
  drag_handle.style.vertically_stretchable = true

  local close = title_flow.add{type="sprite-button", name=mod_prefix .. "-energy-transmission-close", sprite = "utility/close_white", style="informatron_close_button"}
  close.style.width = 28
  close.style.height = 28
  close.style.top_margin = 0

  local mode_table = container.add{type="table", name="mode_table", column_count=4, draw_horizontal_lines=false}
  mode_table.style.horizontally_stretchable = true
  mode_table.style.top_margin = 10
  mode_table.style.bottom_margin = 10
  mode_table.add{type = "button", name = "off", caption = {"space-exploration.energy_transmitter_label_off"}, tooltip={"space-exploration.energy_transmitter_tooltip_off"}}
  mode_table.add{type = "button", name = "energise", caption = {"space-exploration.energy_transmitter_label_energise"}, tooltip = {"space-exploration.energy_transmitter_tooltip_energise"}}
  mode_table.add{type = "button", name = "glaive", caption = {"space-exploration.energy_transmitter_label_glaive"}, tooltip = {"space-exploration.energy_transmitter_tooltip_glaive"}}
  mode_table.add{type = "button", name = "auto-glaive", caption = {"space-exploration.energy_transmitter_label_auto_glaive"}, tooltip = {"space-exploration.energy_transmitter_tooltip_auto_glaive"}}

  --container.add{type="switch", name="on_switch", allow_none_state = false, left_label_caption = "Off", right_label_caption="On"}

  container.add{ type="label", name="energy", caption="Energy: "}
  container.add{ type="label", name="efficiency", caption="Efficiency: "}


  container.add{ type="label", name="destination-label", caption="Destination:"}
  container.add{type="checkbox", name="list-zones-alphabetical", caption="List destinations alphabetically", state=playerdata.zones_alphabetical and true or false}

  local filter_container = container.add{ type="flow", name="filter_flow", direction="horizontal"}
  local filter_field = filter_container.add{ type="textfield", name="filter_list"}
  filter_field.style.width = 275
  local filter_button = filter_container.add{ type = "sprite-button", name="clear_filter", sprite="utility/search_icon",
    tooltip={"space-exploration.clear-filter"},}
  filter_button.style.left_margin = 5
  filter_button.style.width = 28
  filter_button.style.height = 28

  local destination_zone = tree.destination and tree.destination.zone

  local list, selected_index, values = Zone.dropdown_list_zone_destinations(
    tree.force_name,
    destination_zone,
    playerdata.zones_alphabetical,
    nil,
    {list = "None", value = {type = "none"}} -- wildcard
  )
  if selected_index == 1 then selected_index = 2 end
  local zones_dropdown = container.add{ type="drop-down", name="energy-transmitter-list-zones", items=list, selected_index=selected_index or 2}
  zones_dropdown.style.horizontally_stretchable  = true
  player_set_dropdown_values(player, "energy-transmitter-list-zones", values)

  container.add{ type="label", name="destination-location-label", caption="Destination Position:"}

  local destination_location_table = container.add{type="table", name="destination_location_table", column_count=2, draw_horizontal_lines=false}
  destination_location_table.style.horizontally_stretchable = true
  destination_location_table.style.column_alignments[1] = "left" -- title, search, zone list table
  destination_location_table.style.column_alignments[2] = "right" -- starmap, close, selected zone info

  destination_location_table.add{ type="sprite-button", name="destination_location_button",
    sprite="item/artillery-targeting-remote", tooltip = "Choose coordinates"}
  destination_location_table.destination_location_button.style.right_margin = 10
  destination_location_table.add{ type="label", name="destination_location_coordinates", caption=""}

  EnergyBeam.gui_update(player)

  if gui_name == "screen" then container.force_auto_center() end

end

function EnergyBeam.on_gui_click(event)
  if not (event.element and event.element.valid) then return end
  local element = event.element
  local player = game.players[event.player_index]
  root = gui_element_or_parent(element, EnergyBeam.name_transmitter_gui_root)
  if not (root and root.unit_number) then return end
  tree = EnergyBeam.from_unit_number(root.unit_number.children_names[1])
  if not tree then return end
  if element.name == "energy-transmitter-list-zones" then

    local value = player_get_dropdown_value(player, element.name, element.selected_index)
    if type(value) == "table" then
      if value.type == "zone" then
        local zone_index = value.index
        local zone = Zone.from_zone_index(zone_index)
        if zone then
          tree.destination.zone = zone
          tree.destination.coordinate = nil
          Log.trace("set destination to location: " .. zone.name )
        else
          tree.destination.zone = nil
        end
      else
        tree.destination.zone = nil
      end
      EnergyBeam.gui_update(player)
    else
      EnergyBeam.gui_close(player)
      Log.trace("Error: Non-table value ")
    end
  elseif element.name == "clear_filter" then
    element.parent.filter_list.text = ""
    EnergyBeam.gui_update_destinations_list(player)
  elseif element.name == "destination_location_button" then
    if RemoteView.is_unlocked(player) then
      if not player.cursor_stack then
        player.print("Error, invalid player control mode. Cannot set player.cursor_stack")
      else
        local playerdata = get_make_playerdata(player)
        RemoteView.start(player, tree.destination and tree.destination.zone)
        local coordinate = EnergyBeam.get_coordinate(tree)
        if coordinate then player.teleport(EnergyBeam.get_coordinate(tree)) end
        playerdata.remote_view_activity = {
          type = EnergyBeam.name_target_activity_type,
          tree = tree
        }
        player.cursor_stack.set_stack({name = EnergyBeam.name_transmitter_targeter, count = 1})
      end
    else
      player.print({"space-exploration.satellite-required"})
    end
  elseif element.parent.name == "mode_table" then
    tree.mode = element.name
    EnergyBeam.gui_update(player)
    Log.trace(tree.mode)
  elseif element.name == mod_prefix .. "-energy-transmission-close" then
    root.destroy()
    return
  end
end
Event.addListener(defines.events.on_gui_click, EnergyBeam.on_gui_click)
Event.addListener(defines.events.on_gui_selection_state_changed, EnergyBeam.on_gui_click)

function EnergyBeam.gui_update_destinations_list(player)
  local playerdata = get_make_playerdata(player)
  local root = player.gui[EnergyBeam.get_gui(player)][EnergyBeam.name_transmitter_gui_root]
  if root then

    local filter = nil
    if root.filter_flow and root.filter_flow.filter_list then
      filter = string.trim(root.filter_flow.filter_list.text)
      if filter == "" then
        filter = nil
      end
    end

    -- update the list
    local unit_number = root.unit_number.children[1].name
    local tree = EnergyBeam.from_unit_number(unit_number)
    if not tree then
      EnergyBeam.gui_close(player)
      return
    end
    local destination_zone
    if tree then destination_zone = tree.destination.zone end

    local list, selected_index, values = Zone.dropdown_list_zone_destinations(
      tree.force_name,
      destination_zone,
      playerdata.zones_alphabetical,
      filter,
      {list = "None", value = {type = "none"}} -- wildcard
    )
    if selected_index == 1 then selected_index = 2 end
    root["energy-transmitter-list-zones"].items = list
    root["energy-transmitter-list-zones"].selected_index = selected_index or 2
    player_set_dropdown_values(player, "energy-transmitter-list-zones", values)

  end
end

function EnergyBeam.on_gui_checked_state_changed(event)
  if not (event.element and event.element.valid) then return end
  local element = event.element
  local player = game.players[event.player_index]
  local root = gui_element_or_parent(element, EnergyBeam.name_transmitter_gui_root)
  if not (root and root.unit_number) then return end
  tree = EnergyBeam.from_unit_number(root.unit_number.children_names[1])
  if not tree then return end
  if element.name == "list-zones-alphabetical" then
    local playerdata = get_make_playerdata(player)
    playerdata.zones_alphabetical = element.state
    EnergyBeam.gui_update_destinations_list(player)
  end
end
Event.addListener(defines.events.on_gui_checked_state_changed, EnergyBeam.on_gui_checked_state_changed)

function EnergyBeam.on_gui_text_changed(event)
  if not (event.element and event.element.valid) then return end
  local element = event.element
  local player = game.players[event.player_index]
  local root = gui_element_or_parent(element, EnergyBeam.name_transmitter_gui_root)
  if root then -- remote view
    if element.name == "filter_list" then
      EnergyBeam.gui_update_destinations_list(player)
    end
  end
end
Event.addListener(defines.events.on_gui_text_changed, EnergyBeam.on_gui_text_changed)

function EnergyBeam.destroy(tree)
  if not tree then
    Log.trace("tree_destroy: no tree")
    return
  end

  tree.valid = false
  EnergyBeam.clear_end_beam(tree)
  if tree.emitter_beam and tree.emitter_beam.valid then
    tree.emitter_beam.destroy()
  end
  global.energy_transmitters[tree.unit_number] = nil

  -- if a player has this gui open then close it
  local gui_name = EnergyBeam.name_transmitter_gui_root
  for _, player in pairs(game.connected_players) do
    if player.gui[EnergyBeam.get_gui(player)][gui_name]
      and player.gui[EnergyBeam.get_gui(player)][gui_name].unit_number.children_names[1] == ""..tree.unit_number
    then
      player.gui[EnergyBeam.get_gui(player)][gui_name].destroy()
    end
  end

end


function EnergyBeam.on_gui_opened(event)
  local player = game.players[event.player_index]
  if event.entity and event.entity.valid and event.entity.name == EnergyBeam.name_emitter then
    EnergyBeam.gui_open(player, EnergyBeam.from_entity(event.entity))
  else
    --EnergyBeam.gui_close(player)
  end
end
Event.addListener(defines.events.on_gui_opened, EnergyBeam.on_gui_opened)

function EnergyBeam.on_tick(tree)
  if global.energy_transmitters then
    for _, tree in pairs(global.energy_transmitters) do
      if (game.tick + tree.unit_number) % 60 == 0 then
        EnergyBeam.beam_step(tree)
      elseif tree.glaive_beam then
        EnergyBeam.beam_move(tree)
      end
    end
    if game.tick % 60 == 0 then
      for _, player in pairs(game.connected_players) do
        EnergyBeam.gui_update(player)
      end
    end
  end
end
Event.addListener(defines.events.on_tick, EnergyBeam.on_tick)

function EnergyBeam.on_player_selected_area(event)
  if (event.item == EnergyBeam.name_transmitter_targeter) then
    local player = game.players[event.player_index]
    local playerdata = get_make_playerdata(player)
    if playerdata.remote_view_activity and playerdata.remote_view_activity.type == EnergyBeam.name_target_activity_type then
      local tree = playerdata.remote_view_activity.tree
      if tree.emitter and tree.emitter.valid then
        tree.destination.coordinate = {
          x = (event.area.left_top.x + event.area.right_bottom.x) / 2,
          y = (event.area.left_top.y + event.area.right_bottom.y) / 2
        }
        player.print({"space-exploration.energy-transmitter-coordinates-set", math.floor(tree.destination.coordinate.x), math.floor(tree.destination.coordinate.y)})
        if tree.mode == "energise" then
          EnergyBeam.clear_end_beam(tree)
        end
        --RemoteView.stop(player)
      end
    end
  end
end
Event.addListener(defines.events.on_player_selected_area, EnergyBeam.on_player_selected_area)

function EnergyBeam.on_init(event)
    global.energy_transmitters = {}
end
Event.addListener("on_init", EnergyBeam.on_init, true)

function EnergyBeam.chamber_connections(entity, update_neighbours)
  local surface = entity.surface
  local is_horizontal = entity.direction == defines.direction.east or entity.direction == defines.direction.west
  local x = (is_horizontal and EnergyBeam.chamber_box.x or EnergyBeam.chamber_box.y)/2
  local y = (is_horizontal and EnergyBeam.chamber_box.y or EnergyBeam.chamber_box.x)/2

  local north = surface.find_entity(EnergyBeam.name_chamber, Util.vectors_add(entity.position, {x=0, y= -y -1}))
  if north and north.position.x == entity.position.x then
    if north.position.y == entity.position.y - y - EnergyBeam.chamber_box.y / 2 then -- north is connected by side
      --Log.trace("north is connected by side")
      if not is_horizontal then
        surface.create_entity{
          name=mod_prefix .. "energy-transmitter-chamber-addon-bottom",
          position= Util.vectors_add(north.position, {x=0, y=1}),
          surface=surface,
        }
      end
    elseif north.position.y == entity.position.y - y - EnergyBeam.chamber_box.x / 2 then -- north is connected by end
      --Log.trace("north is connected by end")
      if is_horizontal then
        surface.create_entity{
          name=mod_prefix .. "energy-transmitter-chamber-addon-top",
          position= Util.vectors_add(entity.position, {x=0, y=0.5}),
          surface=surface,
        }
      end
    end
  end
  local south = surface.find_entity(EnergyBeam.name_chamber, Util.vectors_add(entity.position, {x=0, y= y +1}))
  if south and south.position.x == south.position.x then
    if south.position.y == entity.position.y + y + EnergyBeam.chamber_box.y / 2 then -- south is connected by side
      --Log.trace("south is connected by side")
      if not is_horizontal then
        surface.create_entity{
          name=mod_prefix .. "energy-transmitter-chamber-addon-top",
          position= Util.vectors_add(south.position, {x=0, y=0.5}),
          surface=surface,
        }
      end
    elseif south.position.y == entity.position.y + y + EnergyBeam.chamber_box.x / 2 then -- south is connected by end
      --Log.trace("south is connected by end")
      if is_horizontal then
        surface.create_entity{
          name=mod_prefix .. "energy-transmitter-chamber-addon-bottom",
          position= Util.vectors_add(entity.position, {x=0, y=1}),
          surface=surface,
        }
      end
    end
  end
  local east = surface.find_entity(EnergyBeam.name_chamber, Util.vectors_add(entity.position, {x=x+1, y=0}))
  if east and east.position.y == entity.position.y then
    if east.position.x == entity.position.x + x + EnergyBeam.chamber_box.y / 2 then -- east is connected by side
      --Log.trace("east is connected by side")
      if is_horizontal then
        surface.create_entity{
          name=mod_prefix .. "energy-transmitter-chamber-addon-left",
          position= Util.vectors_add(east.position, {x=-1, y=0.01}),
          surface=surface,
        }
      end
    elseif east.position.x == entity.position.x + x + EnergyBeam.chamber_box.x / 2 then -- east is connected by end
      --Log.trace("east is connected by end")
      if not is_horizontal then
        surface.create_entity{
          name=mod_prefix .. "energy-transmitter-chamber-addon-right",
          position= Util.vectors_add(entity.position, {x=1, y=0}),
          surface=surface,
        }
      end
    end
  end
  local west = surface.find_entity(EnergyBeam.name_chamber, Util.vectors_add(entity.position, {x=-x-1, y=0}))
  if west and west.position.y == entity.position.y then
    if west.position.x == entity.position.x - x - EnergyBeam.chamber_box.y / 2 then -- west is connected by side
      --Log.trace("west is connected by side")
      if is_horizontal then
        surface.create_entity{
          name=mod_prefix .. "energy-transmitter-chamber-addon-right",
          position= Util.vectors_add(west.position, {x=1, y=0}),
          surface=surface,
        }
      end
    elseif west.position.x == entity.position.x - x - EnergyBeam.chamber_box.x / 2 then -- west is connected by end
      --Log.trace("west is connected by end")
      if not is_horizontal then
        surface.create_entity{
          name=mod_prefix .. "energy-transmitter-chamber-addon-left",
          position= Util.vectors_add(entity.position, {x=-1, y=0.01}),
          surface=surface,
        }
      end
    end
  end

  -- injector connections
  local leaves
  if is_horizontal then
    leaves = surface.find_entities_filtered{
      name = EnergyBeam.name_injector,
      area = Util.area_add_position({{-EnergyBeam.chamber_box.x / 2 + 1, -EnergyBeam.chamber_box.y / 2 - 1}, {EnergyBeam.chamber_box.x / 2 - 1, EnergyBeam.chamber_box.y / 2 + 1}}, entity.position)
    }
  else
    leaves = surface.find_entities_filtered{
      name = EnergyBeam.name_injector,
      area = Util.area_add_position({{-EnergyBeam.chamber_box.y / 2 - 1, -EnergyBeam.chamber_box.x / 2 + 1}, {EnergyBeam.chamber_box.y / 2 + 1, EnergyBeam.chamber_box.x / 2 - 1}}, entity.position)
    }
  end
  for _, injector in pairs(leaves) do
    -- update
    EnergyBeam.remove_injector_connections(injector)
    EnergyBeam.injector_connections(injector)
  end

end

function EnergyBeam.remove_chamber_connections(entity)
  local surface = entity.surface
  local is_horizontal = entity.direction == defines.direction.east or entity.direction == defines.direction.west
  local x = is_horizontal and (EnergyBeam.chamber_box.x / 2 + 1) or (EnergyBeam.chamber_box.y / 2)
  local y = is_horizontal and (EnergyBeam.chamber_box.y / 2) or (EnergyBeam.chamber_box.x / 2 + 1)
  local addons = surface.find_entities_filtered{
    name = {
      mod_prefix .. "energy-transmitter-chamber-addon-top",
      mod_prefix .. "energy-transmitter-chamber-addon-bottom",
      mod_prefix .. "energy-transmitter-chamber-addon-left",
      mod_prefix .. "energy-transmitter-chamber-addon-right",
    },
    area = {{entity.position.x-x, entity.position.y-y}, {entity.position.x+x,entity.position.y+y+1.5}}
  }
  for _, addon in pairs(addons) do
    addon.destroy()
  end
end

function EnergyBeam.injector_connections(entity)
  local surface = entity.surface
  local direction = entity.direction
  local is_horizontal = direction == defines.direction.east or direction == defines.direction.west
  local vector = Util.direction_to_vector(direction)

  local chamber = surface.find_entity(EnergyBeam.name_chamber, Util.vectors_add(entity.position, Util.vector_multiply(vector, (EnergyBeam.injector_length + 1)/2)))
  if chamber then
    local chamber_is_horizontal = chamber.direction == defines.direction.east or chamber.direction == defines.direction.west
    if is_horizontal ~= chamber_is_horizontal then
      local addon = surface.create_entity{
        name = mod_prefix .. "energy-transmitter-injector-addon",
        position = Util.vectors_add(entity.position, Util.vector_multiply(vector, (EnergyBeam.injector_length)/2))
      }
      addon.graphics_variation = (direction + 2) / 2
    end
  end
end

function EnergyBeam.remove_injector_connections(entity)
  local surface = entity.surface
  local direction = entity.direction
  local addons
  if entity.name == EnergyBeam.name_injector then
    local vector = Util.direction_to_vector(direction)
    addons = {surface.find_entity(mod_prefix .. "energy-transmitter-injector-addon", Util.vectors_add(entity.position, Util.vector_multiply(vector, (EnergyBeam.injector_length)/2)))}
  elseif entity.name == EnergyBeam.name_chamber then
    local is_horizontal = direction == defines.direction.east or direction == defines.direction.west
    local x = (is_horizontal and EnergyBeam.chamber_box.x or EnergyBeam.chamber_box.y)/2+0.5
    local y = (is_horizontal and EnergyBeam.chamber_box.y or EnergyBeam.chamber_box.x)/2+0.5
    addons = surface.find_entities_filtered{
      name = mod_prefix .. "energy-transmitter-injector-addon",
      area = Util.area_add_position({{-x,-y},{x,y}}, entity.position)
    }
  end
  if addons then
    for _, addon in pairs(addons) do
      addon.destroy()
    end
  end
end

function EnergyBeam.rebuild_trees(zone, immediate)

  -- remove old tick tasks
  if global.tick_tasks then
    for _, tick_task in pairs(global.tick_tasks) do
      if tick_task.type == "grow_energy_tree" and tick_task.zone == zone then
        tick_task.valid = false
        global.tick_tasks[tick_task.id] = nil
      end
    end
  end

  local tick_task = new_tick_task("grow_energy_tree")
  tick_task.zone = zone

  if immediate then
    EnergyBeam.grow_energy_tree(tick_task)
  end
end

function EnergyBeam.grow_energy_tree(tick_task)
  local zone = tick_task.zone
  local surface = Zone.get_make_surface(zone)

  if not tick_task.emitters then
    -- init
    zone.energy_transmitters = zone.energy_transmitters or {}
    global.energy_transmitters = global.energy_transmitters or {}
    for unit_number, tree in pairs(zone.energy_transmitters) do
      if not tree.emitter.valid then
        -- remove invalid trees
        zone.energy_transmitters[unit_number] = nil
        global.energy_transmitters[unit_number] = nil

      else
        tree.chamberes = {}
        tree.leaves = {}
        tree.injector_reactors = {}
        tree.open = {tree.emitter}
      end
    end

    tick_task.emitters = surface.find_entities_filtered{name = EnergyBeam.name_emitter}
    for _, emitter in pairs(tick_task.emitters) do
      if not zone.energy_transmitters[emitter.unit_number] then
        zone.energy_transmitters[emitter.unit_number] = {
          type = "energy-beam-emitter-tree",
          unit_number = emitter.unit_number,
          valid = true,
          zone = zone,
          force_name = emitter.force.name,
          emitter = emitter,
          chamberes = {},
          leaves = {},
          injector_reactors = {},
          open = {emitter},
          destination = {type = "zone", zone = zone}
        }
        global.energy_transmitters[emitter.unit_number] = zone.energy_transmitters[emitter.unit_number]
      end
    end
    -- chamberes are moreved from the list as they are assigned to trees
    tick_task.chamberes = surface.find_entities_filtered{name = EnergyBeam.name_chamber}

    -- when a chamber is added to a tree, trach the tree for the chamber (so leaves can find the tree by finding the chamber)
    tick_task.chamber_trees = {}
  end

  tick_task.valid = false -- end unless chamberes are found

  for _, tree in pairs(zone.energy_transmitters) do
    local open = tree.open
    tree.open = {}
    for _, entity in pairs(open) do
      if entity.name == EnergyBeam.name_emitter then
        -- find chamberes connected end-on
        local extent = (EnergyBeam.emitter_width + EnergyBeam.chamber_box.x)/2
        for i, chamber in pairs(tick_task.chamberes) do
          if (chamber.position.x == entity.position.x and (chamber.position.y == entity.position.y + extent or chamber.position.y == entity.position.y - extent))
           or (chamber.position.y == entity.position.y and (chamber.position.x == entity.position.x + extent or chamber.position.x == entity.position.x - extent)) then
            tree.chamberes[chamber.unit_number] = chamber
            tree.open[chamber.unit_number] = chamber
            tick_task.chamber_trees[chamber.unit_number] = tree
            tick_task.chamberes[i] = nil
            tick_task.valid = true
          end
        end
      elseif entity.name == EnergyBeam.name_chamber then
        -- find chamberes connected
        local extent_short = (EnergyBeam.chamber_box.x + EnergyBeam.chamber_box.y) / 2
        local extent_long = (EnergyBeam.chamber_box.x + EnergyBeam.chamber_box.x) / 2
        local is_horizontal = entity.direction == defines.direction.east or entity.direction == defines.direction.west
        for i, chamber in pairs(tick_task.chamberes) do
          local chamber_is_horizontal = chamber.direction == defines.direction.east or chamber.direction == defines.direction.west
          if (is_horizontal ~= chamber_is_horizontal and ((chamber.position.x == entity.position.x and (chamber.position.y == entity.position.y + extent_short or chamber.position.y == entity.position.y - extent_short))
           or (chamber.position.y == entity.position.y and (chamber.position.x == entity.position.x + extent_short or chamber.position.x == entity.position.x - extent_short))))
           or (is_horizontal == chamber_is_horizontal and ((chamber.position.x == entity.position.x and (chamber.position.y == entity.position.y + extent_long or chamber.position.y == entity.position.y - extent_long))
            or (chamber.position.y == entity.position.y and (chamber.position.x == entity.position.x + extent_long or chamber.position.x == entity.position.x - extent_long)))) then
              tree.chamberes[chamber.unit_number] = chamber
              tick_task.chamber_trees[chamber.unit_number] = tree
              tree.open[chamber.unit_number] = chamber
              tick_task.chamberes[i] = nil
              tick_task.valid = true
          end
        end
      end
    end
  end

  if not tick_task.valid then -- finished the chamberes, add the leaves
    for _, entity in pairs(surface.find_entities_filtered{name = EnergyBeam.name_injector}) do
      local direction = entity.direction
      local is_horizontal = direction == defines.direction.east or direction == defines.direction.west
      local vector = Util.direction_to_vector(direction)

      local chamber = surface.find_entity(EnergyBeam.name_chamber, Util.vectors_add(entity.position, Util.vector_multiply(vector, (EnergyBeam.injector_length + 1)/2)))
      if chamber then
        local chamber_is_horizontal = chamber.direction == defines.direction.east or chamber.direction == defines.direction.west
        if is_horizontal ~= chamber_is_horizontal then
          -- if the chamber is part of a tree
          if tick_task.chamber_trees[chamber.unit_number] then
            -- add the injector to the tree
            local injector_reactor = surface.find_entity(EnergyBeam.name_injector_reactor, entity.position)
            if injector_reactor then
              tick_task.chamber_trees[chamber.unit_number].leaves[entity.unit_number] = entity
              tick_task.chamber_trees[chamber.unit_number].injector_reactors[injector_reactor.unit_number] = injector_reactor
            end
          end
        end
      end
    end
    for _, tree in pairs(zone.energy_transmitters) do
      Log.trace(table_size(tree.leaves))
    end
  end

end


function EnergyBeam.on_entity_created(event)
  local entity
  if event.entity and event.entity.valid then
    entity = event.entity
  end
  if event.created_entity and event.created_entity.valid then
    entity = event.created_entity
  end
  if not entity then return end
  if entity.name == EnergyBeam.name_chamber or entity.name == EnergyBeam.name_injector or entity.name == EnergyBeam.name_emitter then
    local zone = Zone.from_surface(entity.surface)
    if zone and zone.type ~= "spaceship" then
      if entity.name == EnergyBeam.name_chamber then
        -- check connections
        EnergyBeam.chamber_connections(entity, true)
      elseif entity.name == EnergyBeam.name_injector then
        -- check connections
        EnergyBeam.injector_connections(entity, true)
        local reactor = entity.surface.create_entity{ name = EnergyBeam.name_injector_reactor, position = entity.position, force = entity.force}
        reactor.destructible = false
      end
      EnergyBeam.rebuild_trees(zone, true)
      if entity.name == EnergyBeam.name_emitter and event.player_index and game.players[event.player_index] and game.players[event.player_index].connected then
        local tree = global.energy_transmitters[entity.unit_number]
        if tree then
          EnergyBeam.gui_open(game.players[event.player_index], tree)
        end
      end
    else
      cancel_entity_creation(entity, event.player_index, "Invalid surface.")
      return
    end
  end

end
Event.addListener(defines.events.on_built_entity, EnergyBeam.on_entity_created)
Event.addListener(defines.events.on_robot_built_entity, EnergyBeam.on_entity_created)
Event.addListener(defines.events.script_raised_built, EnergyBeam.on_entity_created)
Event.addListener(defines.events.script_raised_revive, EnergyBeam.on_entity_created)


function EnergyBeam.on_entity_removed(event)
  local entity
  if event.entity and event.entity.valid then
    entity = event.entity
  end
  if event.created_entity and event.created_entity.valid then
    entity = event.created_entity
  end
  if not entity then return end
  if entity.name == EnergyBeam.name_chamber then
    EnergyBeam.remove_chamber_connections(entity, true)
    EnergyBeam.remove_injector_connections(entity, true)
    EnergyBeam.rebuild_trees(Zone.from_surface(entity.surface))
  elseif entity.name == EnergyBeam.name_injector then
    EnergyBeam.remove_injector_connections(entity, true)
    EnergyBeam.rebuild_trees(Zone.from_surface(entity.surface))
    local reactor = entity.surface.find_entity(EnergyBeam.name_injector_reactor, entity.position)
    if reactor then reactor.destroy() end
  elseif entity.name == EnergyBeam.name_emitter then
    EnergyBeam.rebuild_trees(Zone.from_surface(entity.surface))
    local tree = EnergyBeam.from_entity(entity)
    if tree then
      EnergyBeam.destroy(tree)
    end
  elseif entity.name == EnergyBeam.name_receiver then
    local beam = entity.surface.find_entity(EnergyBeam.name_receiver_beam, entity.position)
    if beam then beam.destroy() end
  end

end
Event.addListener(defines.events.on_player_mined_entity, EnergyBeam.on_entity_removed)
Event.addListener(defines.events.on_robot_mined_entity, EnergyBeam.on_entity_removed)
Event.addListener(defines.events.on_entity_died, EnergyBeam.on_entity_removed)
Event.addListener(defines.events.script_raised_destroy, EnergyBeam.on_entity_removed)

function close_gui(event)
    if (event.element and event.element.valid) and event.element.name == EnergyBeam.name_transmitter_gui_root then
        event.element.destroy()
    end
end
script.on_event(defines.events.on_gui_closed, close_gui)


return EnergyBeam

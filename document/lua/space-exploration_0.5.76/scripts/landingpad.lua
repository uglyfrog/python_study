local Landingpad = {}

-- constants
Landingpad.name_rocket_landing_pad = mod_prefix.."rocket-landing-pad"
Landingpad.name_rocket_landing_pad_settings = mod_prefix.."rocket-landing-pad-settings"

---@class LandingPad All data necessary to maintain the state of a delivery cannon

--- Gets the Landingpad for this unit_number
---@param unit_number number
function Landingpad.from_unit_number (unit_number)
  if not unit_number then Log.trace("Landingpad.from_unit_number: invalid unit_number: nil") return end
  unit_number = tonumber(unit_number)
  -- NOTE: only supports container as the entity
  if global.rocket_landing_pads[unit_number] then
    return global.rocket_landing_pads[unit_number]
  else
    Log.trace("Landingpad.from_unit_number: invalid unit_number: " .. unit_number)
  end
end

--- Gets the Landingpad for this entity
---@param entity LuaEntity
function Landingpad.from_entity (entity)
  if not(entity and entity.valid) then
    Log.trace("Landingpad.from_entity: invalid entity")
    return
  end
  -- NOTE: only suppors container as the entity
  return Landingpad.from_unit_number(entity.unit_number)
end

-- returns the available struct
function Landingpad.get_force_landing_pads_availability(force_name, landing_pad_name)

  local empty_landing_pads = {}
  local filled_landing_pads = {}
  local blocked_landing_pads = {}

  if global.forces[force_name] and global.forces[force_name].rocket_landing_pad_names and global.forces[force_name].rocket_landing_pad_names[landing_pad_name] then
    local landing_pads = global.forces[force_name].rocket_landing_pad_names[landing_pad_name]

    for _, landing_pad in pairs(landing_pads) do
      if landing_pad.container and landing_pad.container.valid then
        if landing_pad.inbound_rocket then
          table.insert(blocked_landing_pads, landing_pad)
        elseif landing_pad.container.get_inventory(defines.inventory.chest).is_empty() then
          table.insert(empty_landing_pads, landing_pad)
        else
          table.insert(filled_landing_pads, landing_pad)
        end
      else
        Landingpad.destroy(landing_pad)
      end
    end

  end

  return {
    empty_landing_pads = empty_landing_pads,
    filled_landing_pads = filled_landing_pads,
    blocked_landing_pads = blocked_landing_pads,
  }

end

-- returns the available struct
function Landingpad.get_zone_landing_pads_availability(force_name, zone, landing_pad_name)

  local empty_landing_pads = {}
  local filled_landing_pads = {}
  local blocked_landing_pads = {}

  local zone_assets = Zone.get_force_assets(force_name, zone.index)
  if zone_assets.rocket_landing_pad_names and zone_assets.rocket_landing_pad_names[landing_pad_name] then
    local landing_pads = zone_assets.rocket_landing_pad_names[landing_pad_name]


    for _, landing_pad in pairs(landing_pads) do
      if landing_pad.container and landing_pad.container.valid then
        if landing_pad.inbound_rocket then
          table.insert(blocked_landing_pads, landing_pad)
        elseif landing_pad.container.get_inventory(defines.inventory.chest).is_empty() then
          table.insert(empty_landing_pads, landing_pad)
        else
          table.insert(filled_landing_pads, landing_pad)
        end
      else
        Landingpad.destroy(landing_pad)
      end
    end

  end

  return {
    empty_landing_pads = empty_landing_pads,
    filled_landing_pads = filled_landing_pads,
    blocked_landing_pads = blocked_landing_pads,
  }

end

function Landingpad.on_entity_created(event)
  local entity = util.get_entity_from_event(event)

  if not entity then return end
  if entity.name == Landingpad.name_rocket_landing_pad then
    local zone = Zone.from_surface(entity.surface)
    if not zone then
      return cancel_entity_creation(entity, event.player_index, {"space-exploration.construction-denied"})
    end
    local fn = entity.force.name

    local default_name = zone.name .. " Landing Pad"

    local struct = {
      type = Landingpad.name_rocket_landing_pad,
      valid = true,
      force_name = fn,
      unit_number = entity.unit_number,
      container = entity,
      name = default_name,
      zone = zone
    }
    global.rocket_landing_pads = global.rocket_landing_pads or {}
    global.rocket_landing_pads[entity.unit_number] = struct

    Landingpad.name(struct) -- assigns to zone_assets

    -- set settings
    local tags = util.get_tags_from_event(event, Landingpad.serialize)
    if tags then
      Landingpad.deserialize(entity, tags)
    end

    if event.player_index and game.players[event.player_index] and game.players[event.player_index].connected then
      LandingpadGUI.gui_open(game.players[event.player_index], struct)
    end
  end
end
Event.addListener(defines.events.on_entity_cloned, Landingpad.on_entity_created)
Event.addListener(defines.events.on_built_entity, Landingpad.on_entity_created)
Event.addListener(defines.events.on_robot_built_entity, Landingpad.on_entity_created)
Event.addListener(defines.events.script_raised_built, Landingpad.on_entity_created)
Event.addListener(defines.events.script_raised_revive, Landingpad.on_entity_created)

function Landingpad.remove_struct_from_tables(struct)

  -- force
  local force_data = global.forces[struct.force_name]
  force_data.rocket_landing_pad_names = force_data.rocket_landing_pad_names or {}
  local force_type_table = force_data.rocket_landing_pad_names

  if not force_type_table[struct.name] then return end
  force_type_table[struct.name][struct.unit_number] = nil
  local count_remaining = 0
  for _, remaining in pairs(force_type_table[struct.name]) do
    count_remaining = count_remaining + 1
  end
  if count_remaining == 0 then
    force_type_table[struct.name] = nil
  end

  -- zone
  local zone_assets = Zone.get_force_assets(struct.force_name, struct.zone.index)
  zone_assets.rocket_landing_pad_names = zone_assets.rocket_landing_pad_names or {}
  local zone_type_table = zone_assets.rocket_landing_pad_names

  if not zone_type_table[struct.name] then return end
  zone_type_table[struct.name][struct.unit_number] = nil
  local count_remaining = 0
  for _, remaining in pairs(zone_type_table[struct.name]) do
    count_remaining = count_remaining + 1
  end
  if count_remaining == 0 then
    zone_type_table[struct.name] = nil
  end

end

function Landingpad.destroy_sub(struct, key)
  if struct[key] and struct[key].valid then
    struct[key].destroy()
    struct[key] = nil
  end
end

function Landingpad.destroy(struct)
  if not struct then
    Log.trace("Landingpad.destroy: no struct")
    return
  end
  struct.valid = false
  Landingpad.destroy_sub(struct, 'container')

  Landingpad.remove_struct_from_tables(struct)
  global.rocket_landing_pads[struct.unit_number] = nil

  -- if a player has this gui open then close it
  local gui_name = LandingpadGUI.name_rocket_landing_pad_gui_root
  for _, player in pairs(game.connected_players) do
    local root = player.gui.relative[gui_name]
    if root and root.tags and root.tags.unit_number == struct.unit_number then
      player.gui.relative[gui_name].destroy()
    end
  end
end

function Landingpad.name(struct, new_name)
    struct.name = (new_name or struct.name)

    -- force
    local force_data = global.forces[struct.force_name]
    force_data.rocket_landing_pad_names = force_data.rocket_landing_pad_names or {}
    local force_type_table = force_data.rocket_landing_pad_names

    force_type_table[struct.name] = force_type_table[struct.name] or {}
    force_type_table[struct.name][struct.unit_number] = struct

    local zone_assets = Zone.get_force_assets(struct.force_name, struct.zone.index)
    zone_assets.rocket_landing_pad_names = zone_assets.rocket_landing_pad_names or {}
    local zone_type_table = zone_assets.rocket_landing_pad_names

    zone_type_table[struct.name] = zone_type_table[struct.name] or {}
    zone_type_table[struct.name][struct.unit_number] = struct
end

function Landingpad.rename(struct, new_name)
    local old_name = struct.name
    Landingpad.remove_struct_from_tables(struct)
    Landingpad.name(struct, new_name)
end

function Landingpad.dropdown_list_zone_landing_pad_names(force_name, zone, current)
  local selected_index
  local list = {} -- names with optional [count]
  local values = {} -- raw names
  table.insert(list, {"space-exploration.none_general_vicinity"})
  table.insert(values, "") -- not sure if nil would work

  if zone and zone.type ~= "spaceship" then
    local zone_assets = Zone.get_force_assets(force_name, zone.index)
    for name, sites in pairs(zone_assets["rocket_landing_pad_names"]) do
      local count = 0
      for _, struct in pairs(sites) do
        count = count + 1
      end
      if count == 1 then
        table.insert(list, name)
        table.insert(values, name)
        if name == current then selected_index = #list end
      elseif count > 1 then
        table.insert(list, name .. " ["..count.."]")
        table.insert(values, name)
        if name == current then selected_index = #list end
      end
    end
  end
  return list, (selected_index or 1), values
end

function Landingpad.dropdown_list_force_landing_pad_names(force_name, current)
  local selected_index
  local list = {} -- names with optional [count]
  local values = {} -- raw names
  table.insert(list, {"space-exploration.none_cannot_launch"})
  table.insert(values, "") -- not sure if nil would work

  local force_data = global.forces[force_name]
  if force_data.rocket_landing_pad_names then
    for name, sites in pairs(force_data.rocket_landing_pad_names) do
      local count = 0
      for _, struct in pairs(sites) do
        count = count + 1
      end
      if count == 1 then
        table.insert(list, name)
        table.insert(values, name)
        if name == current then selected_index = #list end
      elseif count > 1 then
        table.insert(list, name .. " ["..count.."]")
        table.insert(values, name)
        if name == current then selected_index = #list end
      end
    end
  end
  return list, (selected_index or 1), values
end

function Landingpad.on_entity_removed(event)
  local entity = event.entity
  if entity and entity.valid and entity.name == Landingpad.name_rocket_landing_pad then
    Landingpad.destroy(Landingpad.from_entity(entity))
  end
end
Event.addListener(defines.events.on_entity_died, Landingpad.on_entity_removed)
Event.addListener(defines.events.on_robot_mined_entity, Landingpad.on_entity_removed)
Event.addListener(defines.events.on_player_mined_entity, Landingpad.on_entity_removed)
Event.addListener(defines.events.script_raised_destroy, Landingpad.on_entity_removed)

function Landingpad.serialize(entity)
  local landing_pad = Landingpad.from_entity(entity)
  if landing_pad then
    local tags = {}
    tags.name = landing_pad.name
    return tags
  end
end

function Landingpad.deserialize(entity, tags)
  local landing_pad = Landingpad.from_entity(entity)
  if landing_pad then
    Landingpad.rename(landing_pad, tags.name)
  end
end

--- Handles the player creating a blueprint by setting tags to store the state of landing pads
---@param event any
function Landingpad.on_player_setup_blueprint(event)
  util.setup_blueprint(event, Landingpad.name_rocket_landing_pad, Landingpad.serialize)
end
Event.addListener(defines.events.on_player_setup_blueprint, Landingpad.on_player_setup_blueprint)

--- Handles the player copy/pasting settings between landing pads
---@param event any
function Landingpad.on_entity_settings_pasted(event)
  util.settings_pasted(event, Landingpad.name_rocket_landing_pad, Landingpad.serialize, Landingpad.deserialize)
end
Event.addListener(defines.events.on_entity_settings_pasted, Landingpad.on_entity_settings_pasted)

function Landingpad.on_init(event)
  global.rocket_landing_pads = {} -- all landing pads sorted by struct[unit_unumber]
end
Event.addListener("on_init", Landingpad.on_init, true)

return Landingpad

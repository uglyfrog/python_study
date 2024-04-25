require("stdlib/table")
require("stdlib/string")
mod_gui = require("__core__/lualib/mod-gui")
collision_mask_util_extended = require("__space-exploration__/collision-mask-util-extended/control/collision-mask-util-control")

version = 0005050 -- 0.5.050
local mod_display_name = "Space Exploration"
is_debug_mode = false

Util = require("scripts/util") util = Util
sha2 = require('scripts/sha2')
Essential = require('scripts/essential')

Log = require('scripts/log')
Event = require('scripts/event')
Profiler = require( 'scripts/profiler')

Shared = require("shared")
UniverseRaw = require("scripts/universe-raw")
Universe = require("scripts/universe")
Location = require('scripts/location')
Pin = require('scripts/pin')
RemoteView = require('scripts/remote-view')
MapView = require( 'scripts/map-view')
Respawn = require('scripts/respawn')
Launchpad = require('scripts/launchpad')
Landingpad = require('scripts/landingpad')
Capsule = require('scripts/capsule')
Zone = require('scripts/zone')
Zonelist = require('scripts/zonelist')
Weapon = require('scripts/weapon')
Medpack = require('scripts/medpack')
Spaceship = require('scripts/spaceship')
Coreminer = require('scripts/core-miner')
CondenserTurbine = require('scripts/condenser-turbine')
BigTurbine = require('scripts/big-turbine')
Meteor = require('scripts/meteor')
Beacon = require('scripts/beacon')
Lifesupport = require('scripts/lifesupport')
ShieldProjector = require('scripts/shield-projector')
DeliveryCannon = require('scripts/delivery-cannon')
Composites = require('scripts/composites')
EnergyBeam = require('scripts/energy-beam')
EnergyBeamDefence = require('scripts/energy-beam-defence')
SolarFlare = require('scripts/solar-flare')
Nexus = require('scripts/nexus')
Arco = require('scripts/arco')
Interburbulator = require('scripts/interburbulator')
LinkedContainer = require('scripts/linked-container')

Ancient = require('scripts/ancient')
DAnchor = require('scripts/dimensional-anchor')
Ruin = require('scripts/ruin')

Informatron = require('scripts/informatron')

require('scripts/compatibility/miniloaders')
EntityMove = require('scripts/compatibility/entity-move')
AbandonedRuins = require('scripts/compatibility/abandoned-ruins')

Migrate = require('scripts/migrate')

sp_tile_scaffold = mod_prefix.."space-platform-scaffold"
sp_tile_plate = mod_prefix.."space-platform-plating"
name_space_tile = mod_prefix.."space"
name_out_of_map_tile = "out-of-map"
space_tiles = {
  name_space_tile
}
name_asteroid_tile = mod_prefix.."asteroid"

tiles_allowed_in_space = {
  name_out_of_map_tile,
  name_space_tile,
  name_asteroid_tile,
  sp_tile_scaffold,
  sp_tile_plate,
  mod_prefix .. "spaceship-floor",
  "transport-drone-road",
  "transport-drone-proxy-tile",
}

name_fluid_rocket_fuel = mod_prefix.."liquid-rocket-fuel"
name_thermofluid_hot = mod_prefix.."space-coolant-hot"
name_thermofluid_supercooled = mod_prefix.."space-coolant-supercooled"
name_suffix_spaced = "-spaced"
name_suffix_grounded = "-grounded"

name_thruster_suits = {
  mod_prefix.."thruster-suit",
  mod_prefix.."thruster-suit-2",
  mod_prefix.."thruster-suit-3",
  mod_prefix.."thruster-suit-4",
}
base_space_thrust = 1
thruster_suit_thrust = {
  [mod_prefix.."thruster-suit"] = 2,
  [mod_prefix.."thruster-suit-2"] = 3,
  [mod_prefix.."thruster-suit-3"] = 4,
  [mod_prefix.."thruster-suit-4"] = 5,
}

first_starting_item_stacks = {
  {name = mod_prefix.."medpack", count = 5},
  {name = mod_prefix.."capsule-big-biter", count = 1},
}
starting_item_stacks = {
  {name = mod_prefix.."medpack", count = 1}
}

suffocation_interval = 120

collision_player = mod_prefix.."collision-player"
collision_player_not_space = mod_prefix.."collision-player-not-space"
collision_rocket_destination_surface = mod_prefix.."collision-rocket-destination-surface"
collision_rocket_destination_orbit = mod_prefix.."collision-rocket-destination-orbital"


function get_make_playerdata(player)
  global.playerdata = global.playerdata or {}
  global.playerdata[player.index] = global.playerdata[player.index] or {}
  return global.playerdata[player.index]
end

function player_set_dropdown_values(player, key, values)
   local playerdata = get_make_playerdata(player)
   playerdata.dropdown_values = playerdata.dropdown_values or {}
   playerdata.dropdown_values[key] = values
end

function player_get_dropdown_value(player, key, index)
   local playerdata = get_make_playerdata(player)
   if playerdata.dropdown_values and playerdata.dropdown_values[key] then
     return playerdata.dropdown_values[key][index]
   end
end

function player_clear_dropdown_values(player, key)
   local playerdata = get_make_playerdata(player)
   if playerdata.dropdown_values then playerdata.dropdown_values[key] = nil end
end

function player_clear_all_dropdown_values(player)
   local playerdata = get_make_playerdata(player)
   playerdata.dropdown_values = nil
end

function player_get_character(player)
  if player.character then return player.character end
  local playerdata = get_make_playerdata(player)
  if playerdata.character then
    if playerdata.character.valid then
      return playerdata.character
    else
      playerdata.character = nil
    end
  end
end

-- creation must contain position
-- returns entity, position
function create_non_colliding(surface, creation, radius, precision)
    radius = radius or 32
    precision = precision or 1
    local try_pos = creation.position
    local safe_pos = surface.find_non_colliding_position(creation.name, try_pos, radius, 1)or try_pos
    creation.position = safe_pos
    return surface.create_entity(creation), safe_pos
end

-- returns entity, position
function teleport_non_colliding(entity, position, radius, precision)
  if entity then
    radius = radius or 32
    precision = precision or 1
    local try_pos = position
    local safe_pos = entity.surface.find_non_colliding_position(entity.name, try_pos, radius, 1) or try_pos
    entity.teleport(safe_pos)
    return entity, safe_pos
  end
end

function teleport_non_colliding_player(player, position, surface, radius, precision)
  surface = surface or player.surface
  radius = radius or 32
  precision = precision or 1
  local try_pos = position
  local safe_pos = surface.find_non_colliding_position(player.character.name, try_pos, radius, 1) or try_pos
  player.teleport(safe_pos, surface)
  return player, safe_pos
end

function teleport_character_to_surface(character, surface, position)
  local try_pos = position
  local safe_pos = surface.find_non_colliding_position(character.name, try_pos, 32, 1) or try_pos
  if surface == character.surface then
    -- easy
    character.teleport(safe_pos)
    return character, safe_pos
  end
  local zone = Zone.from_surface(surface)
  if zone then
    Zone.discover(character.force.name, zone)
  end
  if character.player then
    -- use the player to do it
    local player = character.player
    player.teleport(safe_pos, surface) -- surface change breaks character reference
    local playerdata = get_make_playerdata(player)
    playerdata.last_position = nil
    playerdata.set_postition = nil
    playerdata.velocity = nil
    return player.character, safe_pos
  end

  -- attach a player to do it
  for player_index, playerdata in pairs(global.playerdata) do
    local player = game.players[player_index]
    if player and player.connected then
      if RemoteView.is_active(player) and playerdata.character and playerdata.character == character then
        local player_pos = player.position
        local player_surface = player.surface
        player.teleport(playerdata.character.position, playerdata.character.surface)
        player.set_controller{type = defines.controllers.character, character = playerdata.character}
        player.teleport(safe_pos, surface) -- surface change breaks character reference
        playerdata.character = player.character
        player.set_controller{type = defines.controllers.ghost}
        --player.set_controller{type = defines.controllers.spectator}
        player.teleport(player_pos, player_surface)
        playerdata.last_position = nil
        playerdata.set_postition = nil
        playerdata.velocity = nil
        Log.trace("character moved by reassociation")
        return playerdata.character, safe_pos
      end
    end
  end

  -- clone the character and destroy the original
  -- what could possibly go wrong?
  surface.clone_entities{
    entities = {character},
    destination_offset = util.vectors_delta(character.position, safe_pos),
    destination_surface = surface,
    destination_force = character.force,
    snap_to_grid = false
  }
  local candidate = surface.find_entity(character.name, safe_pos)
  if candidate and candidate.player == nil
    and candidate.color.r == character.color.r
    and candidate.color.g == character.color.g
    and candidate.color.b == character.color.b then
      candidate.teleport(safe_pos)
      for player_index, playerdata in pairs(global.playerdata) do
        if playerdata.character and playerdata.character == character then
          playerdata.character = candidate
        end
      end
      character.destroy()
      Log.trace("character moved by cloning")
      return clone, safe_pos
  end
  local candidates = surface.find_entities_filtered{
    type = character.type,
    name = character.name,
    force = character.force
  }
  for _, candidate in pairs(candidates) do
    if candidate.player == nil
      and candidate.color.r == character.color.r
      and candidate.color.g == character.color.g
      and candidate.color.b == character.color.b then
        candidate.teleport(safe_pos)

        for player_index, playerdata in pairs(global.playerdata) do
          if playerdata.character and playerdata.character == character then
            playerdata.character = candidate
          end
        end
        character.destroy()
        Log.trace("character moved by cloning")
        return clone, safe_pos
    end
  end

  Log.trace("character move by cloning but failed")
  -- failed
  return nil, safe_pos
end

function surface_set_area_tiles(data)
  -- data.surface
  -- data.name (tile type)
  -- data.area
  if not (data.surface and data.name and data.area) then return end

  local tiles = {}
  for y = data.area.left_top.y, data.area.right_bottom.y, 1 do
    for x = data.area.left_top.x, data.area.right_bottom.x, 1 do
      table.insert(tiles, {
        name = data.name,
        position = {x = x, y = y}})
    end
  end
  data.surface.set_tiles(tiles, true)
end

function surface_set_space_tiles(data)
  -- data.surface
  -- data.area
  if not (data.surface and data.area) then return end

  local tiles = {}
  for y = data.area.left_top.y, data.area.right_bottom.y, 1 do
    for x = data.area.left_top.x, data.area.right_bottom.x, 1 do
      table.insert(tiles, {
        name = name_space_tile,
        position = {x = x, y = y}})
    end
  end
  data.surface.set_tiles(tiles, true)
end

function position_2d_array_add(array, position)
    if not array[position.y] then array[position.y] = {} end
    if not array[position.y][position.x] then array[position.y][position.x] = position end
end

function position_2d_array_add_range(array, position, range)
    for y = position.y - range, position.y + range, 1 do
      for x = position.x - range, position.x + range, 1 do
            position_2d_array_add(array, {x = x, y = y})
      end
    end
end

function tile_is_space(tile)
    for _, name in pairs(space_tiles) do
      if tile.name == name then return true end
    end
    return false
end

function tile_is_space_platform(tile)
    return tile.name == sp_tile_plate or tile.name == sp_tile_scaffold
end

function tile_is_space_platform(tile)
    return tile.name == sp_tile_plate or tile.name == sp_tile_scaffold
end


--[[function on_player_created(event)
    --local player = game.players[event.player_index]
    --TODO: capsule crash sequence
end
Event.addListener(defines.events.on_player_created, on_player_created)]]--

function close_own_guis(player)
  -- NOTE: don't close remote view gui here
  Launchpad.gui_close(player)
  Landingpad.gui_close(player)
  Capsule.gui_close(player)
  Spaceship.gui_close(player)
  DeliveryCannon.gui_close(player)
  --player_clear_all_dropdown_values(player)
end


--[[
  tag: {
    surface_name (optional)
    force_name
    position
    icon_type (item/virtual)
    icon_name
    text
    chart_range (optional)
  }
]]
function chart_tag_buffer_add(tag)
  local surface = tag.surface
  local force_name = tag.force_name
  local force = game.forces[force_name]
  local range = tag.chart_range or Zone.discovery_scan_radius

  force.chart(surface, util.position_to_area(tag.position, range))

  global.chart_tag_buffer = global.chart_tag_buffer or {}
  global.chart_tag_next_id = (global.chart_tag_next_id or 0) + 1
  global.chart_tag_buffer[global.chart_tag_next_id] = tag
end

function process_chart_tag_buffer()
  if global.chart_tag_buffer then
    local tags_remaining = 0
    for _, tag in pairs(global.chart_tag_buffer) do
      local surface = tag.surface
      local force_name = tag.force_name
      local force = game.forces[force_name]
      if force then
        local chart_tag = force.add_chart_tag(surface, {
          icon = {type = tag.icon_type, name = tag.icon_name},
          position = tag.position,
          text = tag.text
        })
        if chart_tag then
          global.chart_tag_buffer[_] = nil
        else
          tags_remaining = tags_remaining + 1
        end
      else
        global.chart_tag_buffer[_] = nil
      end
    end
    if tags_remaining == 0 then
      -- cleanup
      global.chart_tag_buffer = nil
      global.chart_tag_next_id = nil
    end
  end
end

function player_capture_selected(player)
  local playerdata = get_make_playerdata(player)
  if playerdata.capture_text and rendering.is_valid(playerdata.capture_text) then
    rendering.destroy(playerdata.capture_text)
  end
  local entity = player.selected
  if entity and (entity.force.name == "capture" or entity.force.name == "conquest") and entity.type ~= "wall" then
    local range = 1
    local box = entity.bounding_box
    local pos = player.position
    if player.character and pos.x > box.left_top.x - range
      and pos.x < box.right_bottom.x + range
      and pos.y > box.left_top.y - range
      and pos.y < box.right_bottom.y + range then
        local blocker = entity.surface.find_nearest_enemy{position=entity.position, max_distance=32, force=player.force}
        if blocker then
          entity.surface.create_entity{
             name = "flying-text",
             position = entity.position,
             text = {"space-exploration.capture-blocked"},
             render_player_index = player.index,
          }
        else
          entity.force = player.force
          local zone = Zone.from_surface(entity.surface)
          if zone then
            local inventory = entity.get_inventory(defines.inventory.chest)
            if inventory then
              for _, item_name in pairs(Ruin.track_loot_items) do
                local count = inventory.get_item_count(item_name)
                if count > 0 then
                  zone.looted_items = zone.looted_items or {}
                  zone.looted_items[item_name] = (zone.looted_items[item_name] or 0) + count
                end
              end
            end
          end
        end
    else
      if not Util.table_contains(
      {"turret", "ammo-turret", "electric-turret", "fluid-turret", "artillery-turret",
        "combat-robot", "logistic-robot", "construction-robot",
        "wall", "gate"}, entity.type) then
          playerdata.capture_text = rendering.draw_text{
            text = {"space-exploration.touch-to-capture"},
            surface = entity.surface,
            target = entity,
            target_offset = {0, -0.5},
            players={player},
            color={r=0.8,g=0.8,b=0.8,a=0.8},
            alignment="center",
            scale = (1 + box.right_bottom.x-box.left_top.x)/3,
        }
      end
    end
  end
end

function on_selected_entity_changed(event)
  local player = game.players[event.player_index]
  player_capture_selected(player)
end
Event.addListener(defines.events.on_selected_entity_changed, on_selected_entity_changed)


function get_selected_index(array, current)
  local i = 0
  for _, item in ipairs(array) do
    i = i + 1
    if item == current then return i end
  end
end

function get_dropdown_string(element, relevant_value)
  if not relevant_value then relevant_value = 1 end
  if element.selected_index and element.items[element.selected_index] then
    local selected = element.items[element.selected_index]
    if type(selected) == "string" then
      return selected
    elseif type(selected) == "table" and selected[relevant_value] then
      return selected[relevant_value]
    end
  end
end

function selected_name_from_dropdown_preset(element, preset)
  -- options eg:  destination_type_options

  local selected_string = get_dropdown_string(element)
  for _, option in pairs(preset) do
    if type(option.display) == "string" then
      if option.display == selected_string then
        return option.name
      end
    elseif type(option.display) == "table" and option.display[1] == selected_string then
      return option.name
    end
  end
end

function dropdown_from_preset(preset, current)
  -- options eg:  destination_type_options
  local selected_index
  local list = {}
  for _, option in pairs(preset) do
    table.insert(list, option.display)
    if option.name == current then selected_index = #list end
  end
  return list, selected_index
end

function count_inventory_slots_used(inv)
  return #inv - inv.count_empty_stacks()
end

function gui_element_or_parent(element, name)
  if not element then return end
  if element.name == name then
    return element
  elseif element.parent then
    return gui_element_or_parent(element.parent, name)
  end
end

function on_tick_player(player)

  local playerdata = get_make_playerdata(player)

  --on_tick_player_gui(player)

  -- save position
  playerdata.surface_positions = playerdata.surface_positions or {}
  playerdata.surface_positions[player.surface.index] = player.position
end

function on_surface_deleted(event)
  if global.playerdata then
    for _, playerdata in pairs(global.playerdata) do
      if playerdata.surface_positions then
        playerdata.surface_positions[event.surface_index] = nil
      end
    end
  end
  Zone.rebuild_surface_index()
end
Event.addListener(defines.events.on_surface_deleted, on_surface_deleted)


function on_marked_for_deconstruction(event)
  if event.entity and event.entity.valid and event.entity.type == "deconstructible-tile-proxy" then
    local position = event.entity.position
    local area = Util.tile_to_area(position)
    local surface = event.entity.surface
    local tile_under = surface.get_hidden_tile(position)
    if tile_under then
      local tile_proto = game.tile_prototypes[tile_under]
      local collision_mask = {}
      for name, blocks in pairs(tile_proto.collision_mask) do
        if blocks then table.insert(collision_mask, name) end
      end
      local blocking_entities = 0
      for _, entity in pairs(event.entity.surface.find_entities_filtered{area = area, collision_mask = collision_mask}) do
        if entity.type ~= "deconstructible-tile-proxy" and entity.type ~= "corpse" then
          blocking_entities = blocking_entities + 1
        end
      end
      if blocking_entities > 0 then
        event.entity.destroy()
        --[[surface.create_entity{
           name = "flying-text",
           position = position,
           text = "Blocked",
           render_player_index = event.player_index,
        }]]
      end
    end
  end
end
Event.addListener(defines.events.on_marked_for_deconstruction, on_marked_for_deconstruction)

function is_character_passenger(character)
  if character and character.vehicle then return true end
  if global.tick_tasks then
    for _, tick_task in pairs(global.tick_tasks) do
      if tick_task.passengers then
        for _, passenger in pairs(tick_task.passengers) do
          if passenger == character then
            return true
          end
        end
      end
    end
  end
  return false
end

function on_player_changed_position(event)
  local player = game.players[event.player_index]
  if not player.character then return end
  local playerdata = get_make_playerdata(player)
  player_capture_selected(player)
  local zone = Zone.from_surface(player.surface)
  if zone then
    if player.vehicle and player.vehicle.type == "spider-vehicle" then
      local tile = player.surface.get_tile(player.vehicle.position)
      if tile.name == "interior-divider" then
        playerdata.interior_divider_collisions = (playerdata.interior_divider_collisions or 0) + 1
        local max_health = player.vehicle.prototype.max_health
        player.vehicle.health = math.min(max_health - max_health * playerdata.interior_divider_collisions / 10, player.vehicle.health - player.vehicle.health / 10)
        if player.vehicle.health <= 1 then
          player.vehicle.die()
          playerdata.interior_divider_collisions = nil
          teleport_non_colliding_player(player, player.position)
        end
      end
    end
    -- track visited
    if not playerdata.visited_zone then playerdata.visited_zone = {} end
    if zone.type ~= "spaceship" and not playerdata.visited_zone[zone.index] then playerdata.visited_zone[zone.index] = game.tick end

    if (not playerdata.has_entered_anomaly) and zone.type == "anomaly" and player.character then
      playerdata.has_entered_anomaly = true
      player.print({"space-exploration.galaxy_ship_authenticated"})
      for _, entity in pairs(player.surface.find_entities_filtered{force="ignore"}) do
        entity.force = "friendly"
      end
      player.force.chart(player.surface, util.position_to_area(Ancient.galaxy_ship_default_position, 2))
      player.force.chart_all(player.surface)
    end
    if zone.vault_pyramid_position then
      if (not player.vehicle) then
        if not (zone.vault_pyramid and zone.vault_pyramid.valid) then
          -- make the pyramid again.
          Ancient.make_vault_exterior(zone)
        end
        -- check if touching the pyramid
        local x_test = Ancient.pyramid_width/2
        local y_test = Ancient.pyramid_height/2
        local buffer = 1
        if player.position.x < zone.vault_pyramid_position.x + x_test + buffer
          and player.position.x > zone.vault_pyramid_position.x - x_test - buffer
          and player.position.y < zone.vault_pyramid_position.y + y_test + buffer
          and player.position.y > zone.vault_pyramid_position.y - y_test - buffer then
            if (not string.find(player.character.name, "jetpack", 1, true)) and (not is_character_passenger(player.character)) then
              Ancient.make_vault_interior(zone)
              local vault = global.glyph_vaults[zone.glyph][zone.index]
              local vault_surface = game.surfaces[vault.surface_index]
              player.teleport({0, Ancient.cartouche_path_end-2}, vault_surface)
              local corpses = vault_surface.find_entities_filtered{type="corpse"}
              for _, corpse in pairs(corpses) do corpse.destroy() end
              if not playerdata.first_entered_vault then
                playerdata.first_entered_vault = zone
              end
            end
        end
      end
    end
  else -- no zone
    local vault = Ancient.vault_from_surface(player.surface)
    if vault then
      -- check if on the entrance/exit section
      if player.position.x <=4 and player.position.x >= -4 and player.position.y > Ancient.cartouche_path_end -1 and player.position.y < Ancient.cartouche_path_end +1 then
        local zone = Zone.from_zone_index(vault.zone_index)
        local zone_surface = Zone.get_make_surface(zone)
        local pos = table.deepcopy(zone.vault_pyramid_position) or {x = 0, y = 0}
        pos.y = pos.y + Ancient.pyramid_height/2 + 1
        teleport_character_to_surface(player.character, zone_surface, pos)
      end
    end
  end
end
Event.addListener(defines.events.on_player_changed_position, on_player_changed_position)


function on_trigger_created_entity(event)
  if event.entity and event.entity.valid and event.entity.name == mod_prefix.."trigger-movable-debris" then
    -- meteor and rocket fragments

    local surface = event.entity.surface
    local deconstruct = false
    for force in pairs(game.forces) do
      local networks = surface.find_logistic_networks_by_construction_area(event.entity.position, force)
      if networks and #networks > 0 then
        for _, network in pairs(networks) do
          if network.storages and #network.storages > 1 then
            local entities = surface.find_entities_filtered{position = event.entity.position, type = "simple-entity"}
            for _, entity in pairs(entities) do
              entity.order_deconstruction(force)
              deconstruct = true
            end
          end
        end
      end
    end
    if not deconstruct then
      local tile = surface.get_tile(event.entity.position.x, event.entity.position.y)
      local meteors = surface.find_entities_filtered{ type = "simple-entity", area = Util.position_to_area(event.entity.position, 1) }
      for _, meteor in pairs(meteors) do
        if string.find(meteor.name, "meteor", 1, true) then
          if tile.collides_with("player-layer") then
            meteor.destroy()
          else
            --[[
            local size = math.random() < 0.5 and "crater2-medium" or "crater1-large"
            surface.create_decoratives{
              check_collision = true,
              decoratives={
                {
                  name=size,
                  position = event.entity.position,
                  amount = 1
                }
              }
            }
            ]]--
          end
        end
      end
    end
  end
end
Event.addListener(defines.events.on_trigger_created_entity, on_trigger_created_entity)

function cancel_entity_creation(entity, player_index, message)
  -- put an item back in the inventory or drop to ground
  -- display flying text
  local player
  if player_index then
    player = game.players[player_index]
  end
  local inserted = 0
  local item_to_place = entity.prototype.items_to_place_this[1]
  local surface = entity.surface
  local position = entity.position
  if player then
    if player.mine_entity(entity, false) then
      inserted = 1
    elseif item_to_place and item_to_place.name then
      inserted = player.insert{name = item_to_place.name, count = 1}
    end
  end
  if inserted == 0 and item_to_place and item_to_place.name then
   surface.create_entity{
      name = "item-on-ground",
      position = position,
      stack = {name = item_to_place.name, count = 1}
    }
  end
  surface.create_entity{
     name = "flying-text",
     position = position,
     text = message,
     render_player_index = player_index,
  }
  if entity and entity.valid then
    entity.destroy()
  end
end

function cancel_tile_placement(surface, tile, old_tiles, player_index, message)
  -- put an item back in the inventory or drop to ground
  -- display flying text
  local player
  if player_index then
    player = game.players[player_index]
    if player.controller_type == defines.controllers.editor then
      -- tile placement could be allowed for testing but it will create errors further down the line so this should not be enabled.
      -- e.g:
        -- space platform on a spaceship surface will break cause errors.
        -- water and/or land in space will cause entity problems.
        -- space surfaces on planets will cause entity problems and maybe errors.
    end
  end
  local set_tiles = {}
  for i, old_tile in pairs(old_tiles) do
    if tile.items_to_place_this and tile.items_to_place_this[1] then
      local inserted = 0
      if player then
        inserted = player.insert{name = tile.items_to_place_this[1].name, count = 1}
      end
      if inserted == 0 then
       surface.create_entity{
          name = "item-on-ground",
          position = old_tile.position,
          --["item-entity"] = {name = tile.items_to_place_this[1].name, count = 1}
          stack = {name = tile.items_to_place_this[1].name, count = 1}
        }
      end
    end
    if i == 1 then
      surface.create_entity{
         name = "flying-text",
         position = old_tile.position,
         text = message,
         render_player_index = player_index,
       }
     end
     local hidden = surface.get_hidden_tile(old_tile.position)
    table.insert(set_tiles, {name = hidden or old_tile.old_tile.name, position = old_tile.position})
  end
  surface.set_tiles(set_tiles)
end

function swap_structure(entity, prototype_name)
  local surface = entity.surface
  local recipe = entity.get_recipe()
  local clone = surface.create_entity{
    name = prototype_name,
    position = entity.position,
    force = entity.force,
    direction = entity.direction,
    recipe = recipe and recipe.name
  }
  clone.operable = entity.operable
  clone.active = entity.active
  clone.destructible = entity.destructible
  clone.rotatable = entity.rotatable
  local inventories = {}
  for _, inv_type in pairs({
    defines.inventory.fuel,
    defines.inventory.burnt_result,
    defines.inventory.furnace_source,
    defines.inventory.furnace_result,
    defines.inventory.furnace_modules,
    defines.inventory.assembling_machine_input,
    defines.inventory.assembling_machine_output,
    defines.inventory.assembling_machine_modules
  }) do
    inventories[inv_type] = inv_type -- no duplicate indexes
  end
  for _, inv_type in pairs(inventories) do
    local inv_a = entity.get_inventory(inv_type)
    local inv_b = clone.get_inventory(inv_type)
    if inv_a and inv_b then
      util.move_inventory_items(inv_a, inv_b)
    end
  end
  entity.destroy()
  clone.teleport(clone.position) -- reconnect pipes
  return clone
end

function on_entity_created(event)
  local entity
  if event.entity and event.entity.valid then
    entity = event.entity
  end
  if event.created_entity and event.created_entity.valid then
    entity = event.created_entity
  end
  if (not entity) or entity.type == "entity-ghost" or entity.type == "tile-ghost" then return end

  if entity.type ~= "deconstructible-tile-proxy" and entity.type ~= "car" and entity.type ~= "spider-vehicle" then
    local area = entity.bounding_box
    local surface = entity.surface
    local proxies = surface.find_entities_filtered{area = area, type = "deconstructible-tile-proxy"}
    for _, proxy in pairs(proxies) do
      proxy.destroy()
    end
  end

  local zone = Zone.from_surface(entity.surface)
  if zone and Zone.is_space(zone) then
    if (entity.type == "car")
      and (not string.find(entity.name, mod_prefix.."space", 1, true))
      and entity.prototype.effectivity > 0 then
      return cancel_entity_creation(entity, event.player_index, {"space-exploration.construction-denied-vehicle-in-space"})
    end
    if game.entity_prototypes[entity.name..name_suffix_spaced] then
      -- replace with spaced
      return swap_structure(entity, entity.name..name_suffix_spaced)
    end
    if string.find(entity.name, name_suffix_grounded, 1, true) then
      -- replace with non-grounded
      return swap_structure(entity, util.replace(entity.name, name_suffix_grounded, ""))
    end
    if entity.type == "offshore-pump" then
      return cancel_entity_creation(entity, event.player_index, {"space-exploration.construction-denied"})
    end
  else -- not space
    if string.find(entity.name, name_suffix_spaced, 1, true) then
      -- replace with non-spaced
      return swap_structure(entity, util.replace(entity.name, name_suffix_spaced, ""))
    end
    if game.entity_prototypes[entity.name..name_suffix_grounded] then
      -- replace with grounded
      return swap_structure(entity, entity.name..name_suffix_grounded)
    end
    if zone and entity.name == "kr-atmospheric-condenser" and (not zone.is_homeworld) and zone.tags and util.table_contains(zone.tags, "water_none") then
      return cancel_entity_creation(entity, event.player_index, {"space-exploration.construction-denied-no-water"})
    end
    if zone and entity.type == "offshore-pump" and (not zone.is_homeworld) and zone.tags and util.table_contains(zone.tags, "water_none") then
      if entity.prototype.fluid == "water" then -- there is no water on this planet, send via rocket, cannon, or ship
        return cancel_entity_creation(entity, event.player_index, {"space-exploration.construction-denied-no-water"})
      end
    end
  end

end
Event.addListener(defines.events.on_robot_built_entity, on_entity_created)
Event.addListener(defines.events.on_built_entity, on_entity_created)
Event.addListener(defines.events.script_raised_built, on_entity_created)
Event.addListener(defines.events.script_raised_revive, on_entity_created)

--[[
When the player kills themself by placing water under themselves, the on_built_tile event does not fire.
Instead we listen to the on_player_died event, and replace any nearby water tiles with some non-water tile next to it.
]]
function on_pre_player_died(event)
  local player = game.players[event.player_index]
  local zone = Zone.from_surface(player.surface)
  if (not zone) or Zone.is_solid(zone) then -- treat as land
    if zone and (not zone.is_homeworld) and (zone.tags and (util.table_contains(zone.tags, "water_none"))) then
      -- water should not be here
      local area = {left_top = {player.position.x - 20, player.position.y - 20}, right_bottom = {player.position.x + 20, player.position.y + 20}}
      local tick_task = new_tick_task("remove-water")
      tick_task.delay_until = game.tick + 1
      tick_task.surface = player.surface
      tick_task.area = area
      tick_task.position = player.position
    end
  end
end
Event.addListener(defines.events.on_pre_player_died, on_pre_player_died)

function remove_water_tiles(surface, area, position)
  local bad_tiles = {}
  local good_tile_name
  for _, tile in pairs(surface.find_tiles_filtered({
    area = area
  })) do
    if string.find(tile.name, "water", 1, true) then
      table.insert(bad_tiles, tile)
    else
      good_tile_name = tile.name
    end
  end
  if not good_tile_name then -- if we cant find a tile type to replace the water with use landfill as a default
    good_tile_name = "landfill"
  end
  if #bad_tiles > 0 then
    -- there is no water on this planet, send via rocket, cannon, or ship
    surface.create_entity({
      name = "flying-text",
      position = position,
      text = {"space-exploration.construction-denied-no-water"}
    })
    local tiles = {}
    for _, tile in pairs(bad_tiles) do
      table.insert(tiles, {
        name = good_tile_name,
        position = tile.position
      })
    end
    surface.set_tiles(tiles)
  end
end

function on_built_tile(event)
  if not event.surface_index then return end
  local surface = game.surfaces[event.surface_index]
  if not surface then return end
  local player
  local tile = event.tile -- top left tile
  local old_tiles = event.tiles -- all tiles over a large square
  local stack = event.stack -- used to create, may be empty

  for _, old_tile in pairs(old_tiles) do
    if old_tile.old_tile.name == "interior-divider" then
      if tile.name == "transport-drone-proxy-tile" then return error("Invalid map state") end
      return cancel_tile_placement(surface, tile, old_tiles, event.player_index, {"space-exploration.construction-denied"})
    end
  end
  --tile_is_space(tile)
  local zone = Zone.from_surface(surface)
  -- temp due to issue with transport drones script
  if tile.name == "transport-drone-proxy-tile" then return end

  if (not zone) or Zone.is_solid(zone) then -- treat as land
    if Util.table_contains(tiles_allowed_in_space, tile.name) and tile.name ~= name_out_of_map_tile and tile.name ~= "transport-drone-road" and tile.name ~= "transport-drone-proxy-tile" then
      if not (zone and Util.table_contains(Spaceship.names_spaceship_floors, tile.name)) then
        return cancel_tile_placement(surface, tile, old_tiles, event.player_index, {"space-exploration.construction-denied"})
      end
    elseif string.find(tile.name, "water", 1, true) then
      if zone and (not zone.is_homeworld) and (zone.tags and (util.table_contains(zone.tags, "water_none"))) then
        -- should not be here
        return cancel_tile_placement(surface, tile, old_tiles, event.player_index, {"space-exploration.construction-denied-no-water"})
      end
    end
  else -- treat as space
    if zone.type == "spaceship" and (not Util.table_contains(Spaceship.names_spaceship_floors, tile.name)) then
      return cancel_tile_placement(surface, tile, old_tiles, event.player_index, {"space-exploration.construction-denied"})
    elseif not Util.table_contains(tiles_allowed_in_space, tile.name) then
      return cancel_tile_placement(surface, tile, old_tiles, event.player_index, {"space-exploration.construction-denied"})
    end
  end
end
Event.addListener(defines.events.on_player_built_tile, on_built_tile)
Event.addListener(defines.events.on_robot_built_tile, on_built_tile)

function on_script_raised_set_tiles(event)
  if not event.surface_index then return end
  local surface = game.surfaces[event.surface_index]
  if not surface then return end

  local zone = Zone.from_surface(surface)
  local set_tiles = {}
  for _, tile in pairs(event.tiles) do
    if (not zone) or Zone.is_solid(zone) then -- treat as land
      if Util.table_contains(tiles_allowed_in_space, tile.name) and tile.name ~= "transport-drone-road" and tile.name ~= "transport-drone-proxy-tile" then
        if not (zone and Util.table_contains(Spaceship.names_spaceship_floors, tile.name)) then
          table.insert(set_tiles, {name="mineral-black-dirt-1", position=tile.position})
        end
      elseif string.find(tile.name, "water", 1, true) then
        if zone and (not zone.is_homeworld) and (zone.tags and (util.table_contains(zone.tags, "water_none"))) then
          -- should not be here
          table.insert(set_tiles, {name="mineral-black-dirt-1", position=tile.position})
        end
      end
    else -- treat as space
      if zone.type == "spaceship" and (not Util.table_contains(Spaceship.names_spaceship_floors, tile.name)) then
        table.insert(set_tiles, {name=name_space_tile, position=tile.position})
      elseif not Util.table_contains(tiles_allowed_in_space, tile.name) then
        table.insert(set_tiles, {name=name_space_tile, position=tile.position})
      end
    end
  end
  if #set_tiles > 0 then
    surface.set_tiles(set_tiles, true) -- DO NOT raise an event or it might cause a loop
  end
end
Event.addListener(defines.events.script_raised_set_tiles, on_script_raised_set_tiles)

function spiral_next(input)
  local x = input.x
  local y = input.y
  local output = table.deepcopy(input)
  if x > y and x >= -y then
    output.y = y + 1
  elseif -y >= -x and -y > x then
    output.x = x + 1
  elseif -x > y and -x > -y then
    output.y = y - 1
  elseif y >= -x and y > x then
    output.x = x - 1
  else
    output.x = x - 1
  end
  return output
end

function zigzag_next(input, y_limit)
  local x = input.x
  local y = input.y
  local output = table.deepcopy(input)
  if y > -y_limit then
    output.y = y - 1
  elseif x >= 0 then
    output.x = -x - 1
    output.y = y_limit
  else
    output.x = -x
    output.y = y_limit
  end
  return output
end

function chart_position(force, surface, position)
  force.chart(surface, {
    {
      x = position.x*32,
      y = position.y*32
    },
    {
      x = (position.x+0.5)*32, -- +1 actually scanes 4 chunks
      y = (position.y+0.5)*32 -- +1 actually scanes 4 chunks
    }
  })
end
function process_force_scanning(forcedata, force)
  if forcedata.is_scanning and forcedata.scanning_zone then
    local y_limit = nil
    if forcedata.scanning_zone.type == "asteroid-belt" or forcedata.scanning_zone.type == "orbit" then
      y_limit = 8 -- changes spiral pattern to different method
      if not forcedata.scanning_cursor  then
        forcedata.scanning_cursor = {x=0,y=16}
      end
    else
      if not forcedata.scanning_cursor  then
        forcedata.scanning_cursor = {x=0,y=0}
      end
    end
    local surface = Zone.get_surface(forcedata.scanning_zone)
    if not surface then
      forcedata.is_scanning = nil
      forcedata.scanning_zone = nil
      forcedata.scanning_cursor = nil
      return
    end
    if forcedata.scanning_zone.radius and -- exit if out of bounds
     ((math.abs(forcedata.scanning_cursor.x) - 1.5)*32 > forcedata.scanning_zone.radius
     or (math.abs(forcedata.scanning_cursor.y) - 1.5)*32 > forcedata.scanning_zone.radius) then
      forcedata.is_scanning = nil
      forcedata.scanning_zone = nil
      forcedata.scanning_cursor = nil
      return
    end
    local search_budget = settings.global["se-scan-search-budget"].value -- 1000
    local searched = 0
    local chart_budget = settings.global["se-scan-chart-budget"].value -- 10
    local charted = 0
    local cursor = table.deepcopy(forcedata.scanning_cursor)
    while searched < search_budget and charted < chart_budget do
      searched = searched + 1
      if (not forcedata.scanning_zone.radius) or (Util.vector_length(cursor) - 1.5)*32 < forcedata.scanning_zone.radius then
        if force.is_chunk_charted(surface, cursor) then
          forcedata.scanning_cursor = cursor
        else
          charted = charted + 1
          chart_position(force, surface, cursor)
        end
      else -- outside radius
        if charted == 0 then -- skip ahead
          forcedata.scanning_cursor = cursor
        end
      end
      if y_limit then
        cursor = zigzag_next(cursor, y_limit)
      else
        cursor = spiral_next(cursor)
      end
    end

    if settings.global["se-scan-alert-interval"].value > 0 then
      if game.tick % (60 * settings.global["se-scan-alert-interval"].value) == 0 then
        force.print({"space-exploration.scan-progress-update", forcedata.scanning_zone.name, cursor.x, cursor.y})
      end
    end

  end
end

function process_forces_scanning()
  for force_name, forcedata in pairs(global.forces) do
    local force = game.forces[force_name]
    if not force then
      global.forces[force_name] = nil
    else
      process_force_scanning(forcedata, force)
    end
  end
end

function on_tick()

  process_chart_tag_buffer()

  if game.tick % 60 == 0 then -- varaible rate
    process_forces_scanning()
  end

  for _, player in pairs(game.connected_players) do
    on_tick_player(player)
  end

  for _, tick_task in pairs(global.tick_tasks) do
    if (not tick_task.delay_until) or game.tick >= tick_task.delay_until then
      if tick_task.type == "chain-beam" then
        Weapon.chain_beam(tick_task)
      elseif tick_task.type == "plague-tick" then
        Weapon.plague_tick(tick_task)
      elseif tick_task.type == "cryogun-unfreeze" then
        Weapon.cryogun_unfreeze(tick_task)
      elseif tick_task.type == "bind-corpse" then
        Respawn.tick_task_bind_corpse(tick_task)
      elseif tick_task.type == "launchpad-journey" then
        Launchpad.tick_journey(tick_task)
      elseif tick_task.type == "grow_energy_tree" then
        EnergyBeam.grow_energy_tree(tick_task)
      elseif tick_task.type == "solar-flare" then
        SolarFlare.tick_flare(tick_task)
      elseif tick_task.type == "force-message" then
        if tick_task.force_name then
          local force = game.forces[tick_task.force_name]
          if force then
            force.print(tick_task.message)
          end
        end
        tick_task.valid = false
      elseif tick_task.type == "remove-water" then
        remove_water_tiles(tick_task.surface, tick_task.area, tick_task.position)
        tick_task.valid = false
      else
        tick_task.valid = false
      end
      if not tick_task.valid then
        global.tick_tasks[tick_task.id] = nil
      end
    end
  end

end
Event.addListener(defines.events.on_tick, on_tick)

function new_tick_task(type)
  global.next_tick_task_id = global.next_tick_task_id or 1
  local new_tick_task = {
    id = global.next_tick_task_id,
    valid = true,
    type = type
  }
  global.tick_tasks[new_tick_task.id] = new_tick_task
  global.next_tick_task_id = global.next_tick_task_id + 1
  return new_tick_task
end

function on_entity_damaged (event)
  if event.entity and event.entity.valid and event.entity.name ~= ShieldProjector.name_barrier then
    if event.entity.health < 0 and event.entity.active == false then
      event.entity.destroy()
    end
  end
end
Event.addListener(defines.events.on_entity_damaged, on_entity_damaged)

function build_satellite(force_name)
  Log.debug_log("build_satellite: " .. force_name)
  local home_zone = Zone.get_force_home_zone(force_name)
  if not home_zone then home_zone = Zone.get_default() end
  local zone = home_zone.orbit
  local surface = Zone.get_make_surface(zone)
  local satellite_position = Zone.find_zone_landing_position(zone, {
    x = (-0.5+math.random()) * 256,
    y = (-0.5+math.random()) * 64})

  surface.request_to_generate_chunks(satellite_position, 2)
  surface.force_generate_chunk_requests() -- must be generated to place

  Ruin.build({
    ruin_name = "satellite",
    surface_index = surface.index,
    position = satellite_position,
    force_name_override = force_name
  })
  local range = Zone.discovery_scan_radius
  game.forces[force_name].chart(surface, {
      {satellite_position.x - range, satellite_position.y - range},
      {satellite_position.x + range, satellite_position.y + range}
  })
  game.forces[force_name].print({"space-exploration.satellite-discovered-platform", zone.name})
  chart_tag_buffer_add({
    force_name = force_name,
    surface = Zone.get_make_surface(zone),
    position = satellite_position,
    icon_type = "item",
    icon_name = "satellite",
    text = "Space Platform",
    chart_range = Zone.discovery_scan_radius,
  })
  global.forces[force_name].nauvis_satellite = satellite_position
end


function on_satellite_launched(force_name, surface)
  Log.debug_log("on_satellite_launched: " .. force_name)
  local starting_zone = Zone.from_surface(surface)
  if not starting_zone then
    return game.forces[force_name].print("Satellite error: Invalid launch location.")
  end
  global.forces[force_name] = global.forces[force_name] or {}
  global.forces[force_name].satellites_launched = (global.forces[force_name].satellites_launched or 0) + 1

  -- discovery options are:
    -- discover the satellite (always on 1st launch) either in orbit or deadsapce
    -- discover a planet or moon (always on 1st - 5rd launches), 90% chance after
    -- if nothing else discovered, discover an asteroid in deadpsace

  local dicovered_something = false
  if global.forces[force_name].satellites_launched == 1 then
    -- nauvis satellite station

    build_satellite(force_name)
    Zone.discover_next_satellite(force_name, "The Satellite", starting_zone)
    dicovered_something = true
    game.forces[force_name].print({"space-exploration.satellite-view-unlocked"})
  --elseif global.forces[force_name].satellites_launched < 6
  --    or math.random() < 0.9 then
  else
    dicovered_something = Zone.discover_next_satellite(force_name, "Satellite", starting_zone)
    if not dicovered_something then
      for _, player in pairs(game.forces[force_name].connected_players) do
        if player.surface.index == surface.index then
          if settings.get_player_settings(player)["se-print-satellite-discovered-nothing"].value then
            player.print({"space-exploration.satellite-discovered-nothing"})
          end
        end
      end
    end
  end

end


function on_rocket_launched(event)
	game.set_game_state{game_finished=false, player_won=false, can_continue=true}
  if event.rocket and event.rocket.valid then
    if event.rocket.get_item_count("satellite") > 0 then
      on_satellite_launched(event.rocket.force.name, event.rocket.surface)
    end
  end
end
Event.addListener(defines.events.on_rocket_launched, on_rocket_launched)

function on_rocket_launch_ordered(event)
  if event.rocket and event.rocket.valid then
    local zone = Zone.from_surface(event.rocket.surface)
    if event.rocket.get_item_count(mod_prefix.."star-probe") > 0 then
      if not (zone and zone.type == "orbit" and zone.parent.type == "star") then
        event.rocket.remove_item({name=mod_prefix.."star-probe", count=1})
        local tick_task = new_tick_task("force-message")
        tick_task.force_name = event.rocket.force.name
        tick_task.message = {"space-exploration.probe_invalid_launch_star"}
        tick_task.delay_until = game.tick + 750 --5s
      end
    elseif event.rocket.get_item_count(mod_prefix.."belt-probe") > 0 then
      if not (zone and zone.type == "asteroid-belt") then
        event.rocket.remove_item({name=mod_prefix.."belt-probe", count=1})
        game.print(event.rocket.get_item_count(mod_prefix.."belt-probe"))
        local tick_task = new_tick_task("force-message")
        tick_task.force_name = event.rocket.force.name
        tick_task.message = {"space-exploration.probe_invalid_launch_belt"}
        tick_task.delay_until = game.tick + 750 --5s
      end
    elseif event.rocket.get_item_count(mod_prefix.."void-probe") > 0 then
      if not (zone and zone.type == "asteroid-field") then
        event.rocket.remove_item({name=mod_prefix.."void-probe", count=1})
        local tick_task = new_tick_task("force-message")
        tick_task.force_name = event.rocket.force.name
        tick_task.message = {"space-exploration.probe_invalid_launch_field"}
        tick_task.delay_until = game.tick + 750 --5s
      end
    end
  end
end
Event.addListener(defines.events.on_rocket_launch_ordered, on_rocket_launch_ordered)

function setup_force(force)
  if is_system_force(force.name) then return end

  local force_name = force.name
  if global.forces[force_name] then return end
  Log.debug_log("setup_force: "..force_name)
  global.forces = global.forces or {}
  global.forces[force_name] = {
    force_name = force_name,
    zones_discovered_count = 0, -- planets and moons discovered
    zones_discovered = {}, -- name = ForceZoneData{discovered_at = tick discovered, marker = map marker}
    satellites_launched = 0,
    cargo_rockets_launched = 0,
    cargo_rockets_crashed = 0,
    zone_assets = {}, -- zone_index > (rocket_launch_pad_names/ rocket_landing_pad_names)
    zone_priorities = {}
  }
  local homeworld = Zone.from_name("Nauvis")
  global.forces[force_name].homeworld_index = homeworld.index
  Zone.discover(force_name, homeworld)
  Zone.discover(force_name, homeworld.parent)
  for _, zone in pairs(global.zone_index) do
    if zone.is_homeworld then
      global.forces[force_name].zone_priorities[zone.index] = global.forces[force_name].zone_priorities[zone.index] or 1
    end
  end

  local friendly = game.forces["friendly"]
  if friendly then
    friendly.set_friend(force, true)
    force.set_friend(friendly, true)
  end

  local ignore = game.forces["ignore"]
  if ignore then
    ignore.set_cease_fire(force, true)
    force.set_cease_fire(ignore, true)
  end

  local capture = game.forces["capture"]
  if capture then
    capture.set_cease_fire(force, true)
    force.set_cease_fire(capture, true)
  end
end

function allied_forces(force)
  local allied_forces = {}
  for _, oforce in pairs(game.forces) do
    if oforce.name == force.name or force.get_friend(oforce) then
      table.insert(allied_forces, oforce.name)
    end
  end
  return allied_forces
end

function ceasefire_forces(force)
  local ceasefire_forces = {}
  for _, oforce in pairs(game.forces) do
    if oforce.name == force.name or force.get_cease_fire(oforce) then
      table.insert(ceasefire_forces, oforce.name)
    end
  end
  return ceasefire_forces
end

function enemy_forces(force)
  local enemy_forces = {}
  for _, oforce in pairs(game.forces) do
    if oforce ~= force and not force.get_cease_fire(oforce) then
      if (not is_system_force(oforce.name)) or oforce.name == "enemy" or oforce.name == "conquest" then
        table.insert(enemy_forces, oforce.name)
      end
    end
  end
  return enemy_forces
end

function find_enemy(force, surface, position)
  local enemy_forces = enemy_forces(force)

  for _, radius in pairs({8,32,256,1024}) do
    local enemies = surface.find_entities_filtered{
      force = enemy_forces,
      type = {"unit-spawner", "turret"},
      position = position,
      radius = radius
    }
    if enemies and #enemies > 0 then return enemies[math.random(#enemies)] end
  end

  local enemy = surface.find_nearest_enemy{position=position, max_distance=20000, force=force}
  if enemy then return enemy end

  -- final try, anything enemy anywhere
  local enemies = surface.find_entities_filtered{ force = enemy_forces, type = {
    -- taken from https://wiki.factorio.com/Prototype/EntityWithHealth
    "accumulator", "artillery-turret", "beacon", "boiler", "burner-generator", "character",
    "arithmetic-combinator", "decider-combinator", "constant-combinator", "container",
    "logistic-container", "infinity-container", "assembling-machine", "rocket-silo",
    "furnace", "electric-energy-interface", "electric-pole", "unit-spawner",
    --"fish",
    "combat-robot", "construction-robot", "logistic-robot", "gate", "generator",
    "heat-interface", "heat-pipe", "inserter", "lab", "lamp", "land-mine", "linked-container",
    "market", "mining-drill", "offshore-pump", "pipe", "infinity-pipe", "pipe-to-ground",
    "player-port", "power-switch", "programmable-speaker", "pump", "radar", "curved-rail",
    "straight-rail", "rail-chain-signal", "rail-signal", "reactor", "roboport",
    --"simple-entity",
    "simple-entity-with-owner", "simple-entity-with-force", "solar-panel",
    --"spider-leg",
    "storage-tank", "train-stop", "linked-belt", "loader-1x1", "loader", "splitter",
    "transport-belt", "underground-belt", "tree", "turret", "ammo-turret", "electric-turret",
    "fluid-turret", "unit", "car", "artillery-wagon", "cargo-wagon", "fluid-wagon",
    "locomotive", "spider-vehicle", "wall"
  } }
  if enemies and #enemies > 0 then
    enemy = enemies[math.random(#enemies)]
    if enemy.destructible then
      return enemy
    end
  end

  for _, enemy in pairs(enemies) do
    if enemy.destructible then
      return enemy
    end
  end

  return false
end

--/c remote.call("space-exploration", "set_force_homeworld", {zone_name = "Arendel", force_name = "player-2", spawn_position = {x = 0, y = 0}, reset_discoveries = true})
function set_force_homeworld(data)
  local zone = Zone.from_name(data.zone_name)
  if not zone then return game.print("No zone found") end
  if not zone.is_homeworld then return game.print("Zone must be a homeworld") end

  local force = game.forces[data.force_name]
  if not force  then return game.print("No force found") end

  local force_data = global.forces[data.force_name]
  if not force_data  then return game.print("No force data found") end

  force_data.homeworld_index = zone.index
  Zone.get_make_surface(zone) -- make sure the surface exists
  force.set_spawn_position(data.spawn_position or {x = 0, y = 0}, zone.surface_index)

  if data.reset_discoveries then
    force_reset_discoveries(data.force_name)
  end
end

function force_reset_discoveries(force_name)
  local force_data = global.forces[force_name]
  if not force_data then return end
  game.print("Reset discoveries for force: " .. force_name)
  force_data.zones_discovered_count = 0
  force_data.zones_discovered = {}
  force_data.satellites_launched = 0
  force_data.zone_priorities = {}
  local homeworld = Zone.from_name("Nauvis")
  if force_data.homeworld_index then
    homeworld = Zone.from_zone_index(force_data.homeworld_index)
  end
  Zone.discover(force_name, homeworld)
  Zone.discover(force_name, homeworld.parent)
  for _, zone in pairs(global.zone_index) do
    if zone.is_homeworld then
      global.forces[force_name].zone_priorities[zone.index] = global.forces[force_name].zone_priorities[zone.index] or 1
    end
  end
end

function is_system_force(force_name)
  return force_name == "enemy"
    or force_name == "neutral"
    or force_name == "capture"
    or force_name == "conquest"
    or force_name == "ignore"
    or force_name == "friendly"
end

function setup_util_forces()

  if not game.forces["conquest"] then
    game.create_force("conquest") -- will shoot at the player, does not show icons, cannot be deconstructed. Has capture mechanic but active entities must be destroyed.
  end
  local conquest = game.forces["conquest"]
  conquest.ai_controllable = true

  if not game.forces["ignore"] then
    game.create_force("ignore") -- won't shoot at the player, does not show icons, cannot be deconstructed.
  end
  local ignore = game.forces["ignore"]
  for _, force in pairs(game.forces) do
    ignore.set_cease_fire(force, true)
    force.set_cease_fire(ignore, true)
  end

  if not game.forces["capture"] then
    game.create_force("capture") -- won't shoot at the player, does not show icons, cannot be deconstructed. Has capture mechanic.
  end
  local capture = game.forces["capture"]
  for _, force in pairs(game.forces) do
    capture.set_cease_fire(force, true)
    force.set_cease_fire(capture, true)
  end

  if not game.forces["friendly"] then
    game.create_force("friendly") -- acts like a player entity, displays power icons, can be deconstructured by player
  end
  local friendly = game.forces["friendly"]
  for _, force in pairs(game.forces) do
    friendly.set_friend(force, true)
    force.set_friend(friendly, true)
  end

  local enemy = game.forces["enemy"]
  enemy.set_friend(conquest, true)
  conquest.set_friend(enemy, true)

  capture.set_friend(conquest, true)
  conquest.set_friend(capture, true)
  capture.set_friend(ignore, true)
  ignore.set_friend(capture, true)
  capture.set_friend(enemy, true)
  enemy.set_friend(capture, true)

  ignore.set_friend(conquest, true)
  conquest.set_friend(ignore, true)
  ignore.set_friend(enemy, true)
  enemy.set_friend(ignore, true)
end

function on_force_created(event)
  setup_force(event.force)
end
Event.addListener(defines.events.on_force_created, on_force_created)

function setup_collision_layers()

  collision_mask_util_extended.named_collision_mask_integrity_check() -- detect non-1 mask entities

  global.named_collision_masks = {}

  -- a full-height wall that you cannot fly though, such as the wall of an underground tunnel.
  global.named_collision_masks.flying_layer = collision_mask_util_extended.get_named_collision_mask("flying-layer")
  -- things that should block projectiles
  global.named_collision_masks.projectile_collision_layer = collision_mask_util_extended.get_named_collision_mask("projectile-layer")
  -- empty space only
  global.named_collision_masks.empty_space_collision_layer = collision_mask_util_extended.get_named_collision_mask("empty-space-tile")
  -- All space tiles have this
  global.named_collision_masks.space_collision_layer = collision_mask_util_extended.get_named_collision_mask("space-tile")
  -- Spaceship tiles move around
  global.named_collision_masks.spaceship_collision_layer = collision_mask_util_extended.get_named_collision_mask("moving-tile")

end

function on_configuration_changed()

  setup_collision_layers()

  Essential.enable_critical_techs() -- needed after bad mod removal

  AbandonedRuins.exclude_surfaces()

  Migrate.migrations()

  local zone = Zone.from_name("Nauvis")
  zone.fragment_name = "se-core-fragment-omni"
  zone.surface_index = 1
  zone.inflated = true

  if global.astronomical then
    global.universe = global.astronomical
    global.astronomical = nil
  end

  global.tick_tasks = global.tick_tasks or {}

  if global.forces then
    for force_name in pairs(global.forces) do
      local forcedata = global.forces[force_name]
      forcedata.force_name = force_name
      if (not forcedata.homeworld_index) and not is_system_force(force_name) then
        forcedata.homeworld_index = zone.index
      end
    end
  end

  for _, force in pairs(game.forces) do
    force.reset_recipes()
    if force.technologies["radar"] then
      force.technologies["radar"].enabled = true
    end
  end

  -- enable any recipes that should be unlocked.
  -- mainly required for entity-update-externals as a migration file won't work
  for _, force in pairs(game.forces) do
    for _, tech in pairs(force.technologies) do
      if tech.researched then
        for _, effect in pairs(tech.effects) do
          if effect.type == "unlock-recipe" and force.recipes[effect.recipe] then
            force.recipes[effect.recipe].enabled = true
          end
        end
      end
    end
  end

  -- stop game from ending on launch and tracking of launches
  local interface_name = "silo_script"
  if remote.interfaces[interface_name] then
    if remote.interfaces[interface_name]["set_finish_on_launch"] then
      remote.call(interface_name, "set_finish_on_launch", false)
    end
    if remote.interfaces[interface_name]["set_show_launched_without_satellite"] then
      remote.call(interface_name, "set_show_launched_without_satellite", false)
    end
    if remote.interfaces[interface_name]["remove_tracked_item"] then
      remote.call(interface_name, "remove_tracked_item", "satellite")
    end
  end

  if global.next_meteor_shower and
    global.next_meteor_shower > game.tick + 60 * 60 * settings.global["se-meteor-interval"].value then
    global.next_meteor_shower = game.tick + math.random() * 60 * 60 * settings.global["se-meteor-interval"].value
  end

  Zone.zones_fix_all_tiles()

  Universe.load_resource_data()

  local zone = Zone.from_name("Nauvis")
  zone.fragment_name = "se-core-fragment-omni"
  zone.surface_index = 1
  zone.inflated = true
  zone.resources = {}
  zone.ticks_per_day = 25000

  Coreminer.equalise_all()

  global.cache_travel_delta_v = nil

  if game.technology_prototypes[mod_prefix.."linked-container"] then
    for _, force in pairs(game.forces) do
      force.technologies[mod_prefix.."teleportation"].enabled = true
    end
  end

  game.print({"space-exploration.please-consider-patreon"})

end
Event.addListener("on_configuration_changed", on_configuration_changed, true)


function on_init()
  -- When creating a new game, script.on_init() will be called on each mod that has a control.lua file.
  -- When loading a save game and the mod did not exist in that save game script.on_init() is called.

    global.version = version

    setup_collision_layers()

    Essential.enable_critical_techs() -- needed after bad mod removal

    -- Astronomical first
    global.seed = game.surfaces[1].map_gen_settings.seed
    global.next_tick_task_id = 1
    global.tick_tasks = {}

    AbandonedRuins.exclude_surfaces()

    setup_util_forces()

    Universe.build()

    local zone = Zone.from_name("Nauvis")
    zone.fragment_name = "se-core-fragment-omni"
    zone.surface_index = 1
    zone.inflated = true
    zone.resources = {}
    zone.ticks_per_day = 25000
    game.surfaces[1].solar_power_multiplier = Zone.solar_multiplier
    Zone.set_solar_and_daytime(zone)
    local surface = game.surfaces[1]
    for resource_name, resource_setting in pairs(global.resources_and_controls.resource_settings) do
      surface.regenerate_entity(resource_name)
    end
    if settings.startup[mod_prefix.."spawn-small-resources"].value then
      Zone.spawn_small_resources(surface)
    end

    global.zones_by_surface[zone.surface_index] = zone
    if game.surfaces[1].map_gen_settings.autoplace_controls["planet-size"] then
      -- planet_radius = 10000 / 6 * (6 + log(1/planet_frequency/6, 2))
      -- planet_frequency = 1 / 6 / 2 ^ (planet_radius * 6 / 10000 - 6)
      --zone.radius = 10000 / 6 * game.surfaces[1].map_gen_settings.autoplace_controls["planet-size"].frequency
      zone.radius = 10000 / 6 * (6 + util.math_log(1/game.surfaces[1].map_gen_settings.autoplace_controls["planet-size"].frequency/6, 2))
      Log.trace(zone.radius)
    else
      zone.radius = 10000 / 6 * (6 + util.math_log(1/1/6, 2))
    end

    if Log.debug_big_logs then
      Log.log_universe_simplified()
      Log.log_universe()
    end

    -- Other stuff second
    global.playerdata = global.playerdata or {}
    global.forces = global.forces or {}

    for _, force in pairs(game.forces) do
        setup_force(force)
        force.reset_recipes()

        -- enable any recipes that should be unlocked.
        -- mainly required for entity-update-externals as a migration file won't work
        for _, tech in pairs(force.technologies) do
          if tech.researched then
            for _, effect in pairs(tech.effects) do
              if effect.type == "unlock-recipe" and force.recipes[effect.recipe] then
                force.recipes[effect.recipe].enabled = true
              end
            end
          end
        end

        for tech in pairs(force.technologies['rocket-silo'].prerequisites) do
          force.technologies[tech].enabled = true
        end
    end

    if remote.interfaces["freeplay"] and remote.interfaces["freeplay"]["set_created_items"] and remote.interfaces["freeplay"]["get_created_items"] then
      local stacks = remote.call("freeplay", "get_created_items")
      for _, starting_item_stack in pairs(first_starting_item_stacks) do
        stacks[starting_item_stack.name] = starting_item_stack.count
      end
      remote.call("freeplay", "set_created_items", stacks)
    end


end
Event.addListener("on_init", on_init, true)

function on_player_spawned(event)
  local player = game.players[event.player_index]
  if player and player.character then
    for _, item_stack in pairs(starting_item_stacks) do
      player.insert(item_stack)
    end
  end
  local forcedata = global.forces[player.force.name]
  if forcedata then
    forcedata.has_players = true
  end
  update_overhead_buttons(player)
end
Event.addListener(defines.events.on_player_respawned, on_player_spawned)

function on_player_changed_force(event)
  local player = game.players[event.player_index]
  setup_force(player.force)
  local forcedata = global.forces[player.force.name]
  if forcedata then
    forcedata.has_players = true
  end
end
Event.addListener(defines.events.on_player_changed_force, on_player_changed_force)

function on_player_created(event)
  local player = game.players[event.player_index]
  if player and player.connected then
    player.print({"space-exploration.please-consider-patreon"})
  end
  if not player.get_quick_bar_slot(10) then
    player.set_quick_bar_slot(10, mod_prefix.."medpack")
  end
  on_player_spawned(event)
end
Event.addListener(defines.events.on_player_created, on_player_created)

function on_player_joined_game(event)
  local player = game.players[event.player_index]
  if player and player.connected then
    player.print({"space-exploration.please-consider-patreon"})
  end
  local forcedata = global.forces[player.force.name]
  if forcedata then
    forcedata.has_players = true
  end
  update_overhead_buttons(player)
end
Event.addListener(defines.events.on_player_joined_game, on_player_joined_game)

function update_overhead_buttons(player)
  -- Fix for Factorio 1.1
  local button_flow = mod_gui.get_button_flow(player)
  if button_flow["informatron_overhead"] then
    local caption = button_flow["informatron_overhead"].caption
    local tooltip = button_flow["informatron_overhead"].tooltip
    local sprite = button_flow["informatron_overhead"].sprite
    button_flow["informatron_overhead"].destroy()
    button_flow.add{type="sprite-button", name="informatron_overhead", sprite = sprite, tooltip = tooltip}
  end

  if button_flow[RemoteView.name_button_overhead_satellite] then button_flow[RemoteView.name_button_overhead_satellite].destroy() end
  RemoteView.update_overhead_button(player.index)

  if button_flow[MapView.name_button_overhead_interstellar] then button_flow[MapView.name_button_overhead_interstellar].destroy() end
  MapView.update_overhead_button(player.index)

  if button_flow[Zonelist.name_button_overhead_explorer] then button_flow[Zonelist.name_button_overhead_explorer].destroy() end
  Zonelist.update_overhead_button(player.index)
end

function on_pre_player_left_game(event)
  local player = game.players[event.player_index]
  if player then
    RemoteView.stop(player)
  end
end
Event.addListener(defines.events.on_pre_player_left_game, on_pre_player_left_game)

function on_forces_merged(event)
  -- merge in all of an old force to a new force
  -- add things like launch counts
  -- merge things like zone assets
  -- use a single value for things like satellite position
  local source_forcedata = global.forces[event.source_name]
  local destination_forcedata = global.forces[event.destination.name]
  if source_forcedata and destination_forcedata then
    -- zones_discovered
    if source_forcedata.zones_discovered then
      destination_forcedata.zones_discovered = destination_forcedata.zones_discovered or {}
      for a, b in pairs(source_forcedata.zones_discovered) do
        if not destination_forcedata.zones_discovered[a] then
          destination_forcedata.zones_discovered[a] = b
        end
      end
      destination_forcedata.zones_discovered_count = table_size(destination_forcedata.zones_discovered)
    end
    --zone_priorities
    if source_forcedata.zone_priorities then
      destination_forcedata.zone_priorities = destination_forcedata.zone_priorities or {}
      for a, b in pairs(source_forcedata.zone_priorities) do
        if not destination_forcedata.zone_priorities[a] then
          destination_forcedata.zone_priorities[a] = b
        else
          destination_forcedata.zone_priorities[a] = math.max(destination_forcedata.zone_priorities[a], b)
        end
      end
    end
    --satellites_launched
    if source_forcedata.satellites_launched then
      destination_forcedata.satellites_launched = (destination_forcedata.satellites_launched or 0) + source_forcedata.satellites_launched
    end
    --cargo_rockets_launched
    if source_forcedata.cargo_rockets_launched then
      destination_forcedata.cargo_rockets_launched = (destination_forcedata.cargo_rockets_launched or 0) + source_forcedata.cargo_rockets_launched
    end
    --cargo_rockets_crashed
    if source_forcedata.cargo_rockets_crashed then
      destination_forcedata.cargo_rockets_crashed = (destination_forcedata.cargo_rockets_crashed or 0) + source_forcedata.cargo_rockets_crashed
    end
    --first_discovered_vault
    if source_forcedata.first_discovered_vault and not destination_forcedata.first_discovered_vault then
      destination_forcedata.first_discovered_vault = source_forcedata.first_discovered_vault
    end
    --first_entered_vault
    if source_forcedata.first_entered_vault and not destination_forcedata.first_entered_vault then
      destination_forcedata.first_entered_vault = source_forcedata.first_entered_vault
    end
    --nauvis_satellite
    if source_forcedata.nauvis_satellite and not destination_forcedata.nauvis_satellite then
      destination_forcedata.nauvis_satellite = source_forcedata.nauvis_satellite
    end
    --solar_flare
    if source_forcedata.solar_flare and not destination_forcedata.solar_flare then
      destination_forcedata.solar_flare = source_forcedata.solar_flare
    end

    --arcospheres
    if source_forcedata.arcosphere_collectors_launched then
      destination_forcedata.arcosphere_collectors_launched = (destination_forcedata.arcosphere_collectors_launched or 0) + source_forcedata.arcosphere_collectors_launched
    end
    if source_forcedata.arcospheres_collected then
      destination_forcedata.arcospheres_collected = (destination_forcedata.arcospheres_collected or 0) + source_forcedata.arcospheres_collected
    end

    local single_depth_tables = {
      "chart_tag_buffer",
      "tick_tasks",
      "gravimetrics_labs",
      "space_capsule_launches",
      "delivery_cannons",
      "rocket_landing_pads",
      "rocket_launch_pads",
      "spaceships",
      "nexus"
    }
    for _, table_name in pairs(single_depth_tables) do
      if global[table_name] then
        for _, thing in pairs(global[table_name]) do
          if thing.force_name == event.source_name then
             thing.force_name = event.destination.name
          end
        end
      end
    end

    -- Zones
    for _, zone in pairs(global.zone_index) do
      local single_depth_tables = {
        "energy_transmitters",
      }
      for _, table_name in pairs(single_depth_tables) do
        if source_forcedata.zone_assets[table_name] then
          for _, thing in pairs(global[table_name]) do
            if thing.force_name == event.source_name then
               thing.force_name = event.destination.name
            end
          end
        end
      end
    end

    --zone_assets
    if source_forcedata.zone_assets then

      local single_depth_tables = {
        "energy_beam_defence",
      }
      for _, table_name in pairs(single_depth_tables) do
        if source_forcedata.zone_assets[table_name] then
          for _, thing in pairs(global[table_name]) do
            if thing.force_name == event.source_name then
               thing.force_name = event.destination.name
            end
          end
        end
      end

      destination_forcedata.zone_assets = destination_forcedata.zone_assets or {}
      for a, b in pairs(source_forcedata.zone_assets) do
        if not destination_forcedata.zone_assets[a] then
          destination_forcedata.zone_assets[a] = b
        else
          for table_name, subtable in pairs(b) do
            if not destination_forcedata.zone_assets[a][table_name] then
              destination_forcedata.zone_assets[a][table_name] = subtable
            elseif table_name == "rocket_launch_pad_names" or table_name == "rocket_landing_pad_names" then
              for name, structs in pairs(subtable) do
                destination_forcedata.zone_assets[a][table_name][name] = destination_forcedata.zone_assets[a][table_name][name] or {}
                for unit_number, struct in pairs(structs) do
                  destination_forcedata.zone_assets[a][table_name][name][unit_number] = struct
                end
              end
            end
          end
        end
      end
      destination_forcedata.zones_discovered_count = table_size(destination_forcedata.zones_discovered)
    end
    --zone_assets
    if source_forcedata.rocket_landing_pad_names then
      if not destination_forcedata.rocket_landing_pad_names then
        destination_forcedata.rocket_landing_pad_names = source_forcedata.rocket_landing_pad_names
      else
        for name, structs in pairs(source_forcedata.rocket_landing_pad_names) do
          destination_forcedata.rocket_landing_pad_names[name] = destination_forcedata.rocket_landing_pad_names[name] or {}
          for unit_number, struct in pairs(structs) do
            destination_forcedata.rocket_landing_pad_names[name][unit_number] = struct
          end
        end
      end
    end
  end
end
Event.addListener(defines.events.on_forces_merged, on_forces_merged)

require('scripts/remote-interface')

--log( serpent.block( data.raw["projectile"], {comment = false, numformat = '%1.8g' } ) )
-- /c Log.trace(serpent.block( game.surfaces.nauvis.map_gen_settings.autoplace_controls, {comment = false, numformat = '%1.8g' }))

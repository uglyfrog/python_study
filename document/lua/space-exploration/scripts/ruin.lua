local Ruin = {}

--[[
Add more ruins below, eg:
Ruin.ruins["my-ruin"] = require("ruins/my-ruin.lua")
test with
/c remote.call("space-exploration", "build_ruin", {ruin_name = "my-ruin", surface_index = game.player.surface.index, position = game.player.position})

Ruin forces:
"enemy" = turrets are hostile to player, cannot be mined, cannot be opened
"neutral" = can be mined
"capture" = can be captured by nearby player (not implemented yet, defaults to neutral)


When making a ruin it is useful to use the editor, then make a blurprint, then export the string.
In order to blueprint entities they must be your force:
/c for _, e in pairs(game.player.surface.find_entities()) do e.force=game.player.force end
]]--

Ruin.ruins = {}

Ruin.ruins["satellite"] = require("ruins/satellite.lua")
Ruin.ruins["galaxy-ship"] = require("ruins/galaxy-ship.lua")
Ruin.ruins["interburbulator-platform"] = require("ruins/interburbulator-platform.lua")
Ruin.ruins["arty40"] = require("ruins/arty40.lua")
Ruin.ruins["persepolis"] = require("ruins/persepolis.lua")
Ruin.track_loot_items = {"se-arcosphere", "productivity-module-9", "speed-module-9", "effectivity-module-9"}

function Ruin.build(data)
  if not (data.ruin_name and data.surface_index and data.position) then return end

  local ruin_name = data.ruin_name
  local ruin = Ruin.ruins[data.ruin_name]
  if not ruin then return end

  setup_util_forces()
  local force = "ignore"
  if ruin.force_name then
    force = ruin.force_name
  end
  if data.force_name_override then
    force = data.force_name_override
  end

  local ruin_position = data.position
  ruin_position.x = math.floor((ruin_position.x+1)/2)*2-1
  ruin_position.y = math.floor((ruin_position.y+1)/2)*2-1
  local ruin_position_center_offset = Util.vectors_delta(ruin.center, ruin_position)

  local surface = game.surfaces[data.surface_index]

  surface.request_to_generate_chunks(ruin_position, 2)
  surface.force_generate_chunk_requests() -- must be generated to place

  if ruin.prebuild then
    ruin.prebuild(surface, ruin_position, ruin)
  end


  if ruin.clear_entity_areas then
    for _, clear_area in pairs(ruin.clear_entity_areas) do
      local area = Util.area_add_position(clear_area, ruin_position_center_offset)
      local entities = surface.find_entities(area)
      for _, entity in pairs(entities) do
        if entity.valid and entity.type ~= "character" then entity.destroy() end
      end
    end
  end
  if ruin.clear_decorative_areas then
    for _, clear_area in pairs(ruin.clear_decorative_areas) do
      local area = Util.area_add_position(clear_area, ruin_position_center_offset)
      surface.destroy_decoratives{area = area}
    end
  end

  local under_tiles = ruin.under_tiles or {}
  if ruin.default_under_tile then
    under_tiles[ruin.default_under_tile] = under_tiles[ruin.default_under_tile] or {}
  end
  if ruin.tiles then
    local tiles = {}
    for tile_name, positions in pairs(ruin.tiles) do
      local tile_type = game.tile_prototypes[tile_name]
      local m = tile_type.mineable_properties.minable and ruin.default_under_tile
      for _, position in pairs(positions) do
        if m then table.insert(under_tiles[ruin.default_under_tile], position) end
        table.insert(tiles, {name = tile_name,
        position = {
          x = ruin_position.x + position[1] - ruin.center.x,
          y = ruin_position.y + position[2] - ruin.center.y}})
      end
    end
    surface.set_tiles(tiles, true)
  end

  for tile_name, positions in pairs(under_tiles) do
    for _, position in pairs(positions) do
      surface.set_hidden_tile({
        x = ruin_position.x + position[1] - ruin.center.x,
        y = ruin_position.y + position[2] - ruin.center.y}, tile_name)
    end
  end

  for _, bp in pairs(ruin.blueprint_strings or {}) do
    local container = game.surfaces[1].create_entity{name = "iron-chest", position = {0,0}}
    container.insert{name="blueprint", count = 1}
    local inv = container.get_inventory(defines.inventory.chest)
    local blueprint = inv[1]
    blueprint.import_stack(bp.string)

    local entities = blueprint.build_blueprint{
      surface = surface,
      force = bp.force_override or force,
      position = {ruin_position.x + (bp.xadj or 0), ruin_position.y + (bp.yadj or 0)},
      force_build = true,
      direction=defines.direction.north,
      skip_fog_of_war=false
    }

    for _, entity in pairs(entities) do
      if entity.valid then
        entity.revive({raise_revive = true})
      end
    end

    container.destroy()
  end

  for entity_name, set in pairs(ruin.entities or {}) do
    for _, entity_data in pairs(set) do
      if type(entity_data.x) == "number" or type(entity_data[1]) then
        local entity_relative_position = {
          x = 0 + (entity_data.x or entity_data[1]),
          y = 0 + (entity_data.y or entity_data[2])
        }
        local entity_position = {
          x = ruin_position.x + entity_relative_position.x - ruin.center.x,
          y = ruin_position.y + entity_relative_position.y - ruin.center.y
        }
        local force_name = entity_data.force_name or force
        if data.force_name_override then
          force_name = data.force_name_override
        end
        local entity = surface.create_entity{
          name = entity_name,
          force = force_name,
          position = entity_position,
          direction = entity_data.direction,
          raise_built = true
        }
        if entity_data.graphics_variation then
          entity.graphics_variation = entity_data.graphics_variation
        end
        if entity_data.orientation then
          entity.orientation = entity_data.orientation
        end
        if entity_data.destructible ~= nil then
          entity.destructible = entity_data.destructible
        end
        if entity_data.stacks then
          for _, stack in pairs(entity_data.stacks) do
            entity.insert{name = stack.name, count = stack.count}
          end
        end
      end
    end
  end

  --game.print("starting specific chests")
  -- put a few specific items in chests based on the insert_list table
  --  list of items to put in chests
  --   max, min define the range for number of items
  --   odds will only have it appear 1 in odds times
  --   max, min, and odds all default to 1
  for _, ins in pairs(ruin.insert_list or {}) do
    local p = {x = ruin_position.x + ins.x + .5, y = ruin_position.y + ins.y + .5}
    -- find_entities_filtered used because it could be any kind of chest
    local chest = surface.find_entities_filtered({
        position = p,
        radius = .5,
        name = {
          "steel-chest",
          "logistic-chest-buffer",
          "logistic-chest-active-provider",
          "logistic-chest-buffer",
          "logistic-chest-passive-provider",
          "logistic-chest-requester",
          "logistic-chest-storage",
          mod_prefix.."cargo-rocket-cargo-pod"
          }})[1]

    if chest == nil then
      Log.trace(data.ruin_name..": cannot find specific chest at offset "..ins.x..", "..ins.y.." final position "..p.x..", "..p.y, "ruin")
      if is_debug_mode then
        rendering.draw_rectangle{
          color = {r = 1, g = 0, b = 0, a = 0.5},
          filled = false,
          left_top = {x = ruin_position.x + ins.x, y = ruin_position.y + ins.y},
          right_bottom = {x = 1 + ruin_position.x + ins.x, y =  1 + ruin_position.y + ins.y},
          surface = surface,
        }
      end
    else
      --game.print(chest.name .. " found at " .. chest.position.x .. ", " .. chest.position.y)
      for _, item in pairs(ins.items) do
        --game.print("attempting to insert up to " .. item.count .. " of " .. item.name)
        if item.odds == nil or math.random(1, item.odds) == 1 then
          chest.insert({name = item.name, count = math.random(item.min or 1, item.max or 1)})
        end
      end
    end
  end

  for wire_type, set in pairs(ruin.wires or {}) do
    for _, wire_data in pairs(set) do
      local from = surface.find_entity(wire_data.from.name,
        {
          x = ruin_position.x + (wire_data.from.position.x or wire_data.from.position[1]) - ruin.center.x,
          y = ruin_position.y + (wire_data.from.position.y or wire_data.from.position[2]) - ruin.center.y
        }
      )
      local to = surface.find_entity(wire_data.to.name,
        {
          x = ruin_position.x + (wire_data.to.position.x or wire_data.to.position[1]) - ruin.center.x,
          y = ruin_position.y + (wire_data.to.position.y or wire_data.to.position[2]) - ruin.center.y
        }
      )
      if from and to then
        from.connect_neighbour({ -- https://lua-api.factorio.com/latest/LuaEntity.html#LuaEntity.connect_neighbour
          wire = wire_type,
          target_entity = to,
          source_circuit_id = wire_data.source_circuit_id,
          target_circuit_id  = wire_data.target_circuit_id
        })
      else
        game.print("can't find wire targets")
      end
    end
  end

  if ruin.postbuild then
    ruin.postbuild(surface, ruin_position, ruin)
  end

  -- make sure there are no test items left in the ruin.
  for _, entity in pairs(surface.find_entities_filtered{type="infinity-pipe"}) do
    entity.destroy()
  end
  for _, entity in pairs(surface.find_entities_filtered{type="infinity-chest"}) do
    entity.destroy()
  end
  for _, entity in pairs(surface.find_entities_filtered{name="electric-energy-interface"}) do
    entity.destroy()
  end

end


function Ruin.zone_assign_unique_ruins(zone)
  local ruin_name

  if Zone.is_solid(zone) and (not zone.is_homeworld) and (not zone.glyph) and (not zone.interburbulator) and (not zone.ruins) and zone.tags then
    global.ruins = global.ruins  or {}
    local star = Zone.get_star_from_child(zone)

    ruin_name = "persepolis"
    if (not global.ruins[ruin_name]) and math.random() < 0.5 and zone.radius > 2000 and star.special_type ~= "homesystem" and (not Util.table_contains(zone.tags, "water_none"))
      and (Util.table_contains(zone.tags, "temperature_bland") or Util.table_contains(zone.tags, "temperature_temperate") or Util.table_contains(zone.tags, "temperature_midrange") or Util.table_contains(zone.tags, "temperature_warm"))
      and (Util.table_contains(zone.tags, "moisture_none") or Util.table_contains(zone.tags, "moisture_low") or Util.table_contains(zone.tags, "moisture_med"))
      and (Util.table_contains(zone.tags, "aux_very_low") or Util.table_contains(zone.tags, "aux_low") or Util.table_contains(zone.tags, "aux_med")) then
        local ruin_location = {name = ruin_name, position = {x=0,y=0}, zone_index = zone.index}
        global.ruins[ruin_name] = ruin_location
        zone.ruins = { [ruin_name] = ruin_location }
    end

    ruin_name = "arty40"
    if (not global.ruins[ruin_name]) and math.random() < 0.5 and zone.radius > 2000 and star.special_type ~= "homesystem" and (not Util.table_contains(zone.tags, "water_none"))
      and (Util.table_contains(zone.tags, "temperature_bland") or Util.table_contains(zone.tags, "temperature_temperate") or Util.table_contains(zone.tags, "temperature_cool")) then
        local ruin_location = {name = ruin_name, position = {x=0,y=0}, zone_index = zone.index}
        global.ruins[ruin_name] = ruin_location
        zone.ruins = { [ruin_name] = ruin_location }
    end
  end

end

function Ruin.zone_build_ruins(zone, surface)
  local ruin_name

  ruin_name = "persepolis"
  if zone.ruins and zone.ruins[ruin_name] then
    Ruin.build( {ruin_name = ruin_name, surface_index = surface.index, position = zone.ruins[ruin_name].position } )
  end

  ruin_name = "arty40"
  if zone.ruins and zone.ruins[ruin_name] then
    Ruin.build( {ruin_name = ruin_name, surface_index = surface.index, position = zone.ruins[ruin_name].position } )
  end

end

function Ruin.log_tiles(data)
  -- log tiles in a format that can be put bakc into ruins
  local surface = data.surface
  local registration_point = Util.position_to_tile(data.registration_point)
  local area = {left_top = Util.position_to_tile(data.left_top), right_bottom =  Util.position_to_tile(data.right_bottom)}
  local capture_name = data.capture_name or "temp"
  local file_name = "space-exploration.ruin_log_tiles."..capture_name..".lua"
  local tiles = {}
  local under_tiles = {}
  for x = area.left_top.x, area.right_bottom.x-1 do
    for y = area.left_top.y, area.right_bottom.y-1 do
      local tile = surface.get_tile(x,y)
      if not tiles[tile.name] then
        tiles[tile.name] = {}
      end
      table.insert(tiles[tile.name], {x-registration_point.x,y-registration_point.y})
      local hidden_name = surface.get_hidden_tile({x,y})
      if hidden_name then
        if not under_tiles[hidden_name] then
          under_tiles[hidden_name] = {}
        end
        table.insert(under_tiles[hidden_name], {x-registration_point.x,y-registration_point.y})
      end
    end
  end
  local string = "local "..capture_name.." = {\n  name = \""..capture_name.."\",\n  tiles = {"
  for tilename, positions in pairs(tiles) do
    string = string.."\n    [\""..tilename.."\"] = {"
    for _, position in pairs(positions) do
      string = string.."{"..position[1]..","..position[2].."}, "
    end
    string = string.."},"
  end
  string = string .. "\n  },\n  under_tiles = {"
  for tilename, positions in pairs(under_tiles) do
    string = string.."\n    [\""..tilename.."\"] = {"
    for _, position in pairs(positions) do
      string = string.."{"..position[1]..","..position[2].."}, "
    end
    string = string.."},"
  end
  string = string .. "\n  }\n}"
  game.write_file(file_name, string, false)
  rendering.draw_rectangle{
    surface = surface,
    left_top = area.left_top,
    right_bottom = area.right_bottom,
    color = {r=0,b=1,g=0,a=0.5},
    width = 5,
    time_to_live = 60*5
  }
  rendering.draw_rectangle{
    surface = surface,
    left_top = area.left_top,
    right_bottom = area.right_bottom,
    color = {r=0,b=0.5,g=0,a=0.25},
    width = 5,
    filled = true,
    time_to_live = 60*5
  }
  game.print("Tiles of area X:"..area.left_top.x.." to "..area.right_bottom.x.." Y: "..area.left_top.y.."to "..area.right_bottom.y.." captured to: "..file_name)
end

function Ruin.log_entities(data)
  -- log tiles in a format that can be put bakc into ruins
  local surface = data.surface
  local registration_point = Util.position_to_tile(data.registration_point)
  local area = {left_top = Util.position_to_tile(data.left_top), right_bottom =  Util.position_to_tile(data.right_bottom)}
  local capture_name = data.capture_name or "temp"
  local file_name = "space-exploration.ruin_log_entities."..capture_name..".lua"
  local entities = surface.find_entities(area)
  local entities_data = {}
  for _, entity in pairs(entities) do
    entities_data[entity.name] = entities_data[entity.name] or {}
    local entity_data = { x = entity.position.x-registration_point.x, y = entity.position.y-registration_point.y}
    if entity.type == "tree" or entity.type == "simple-entity" then
      entity_data.graphics_variation = entity.graphics_variation
    end
    table.insert(entities_data[entity.name], entity_data)
  end
  local string = "local "..capture_name.." = {\n  name = \""..capture_name.."\",\n  entities = {"
  for entity_name, entity_list in pairs(entities_data) do
    string = string.."\n    [\""..entity_name.."\"] = {"
    for _, entity_data in pairs(entity_list) do
      string = string.."{"
      local first = true
      for k, v in pairs(entity_data) do
        if first then first = false else string = string .. ", " end
        string = string..k.."="..v
      end
      string = string.."}, "
    end
    string = string.."},"
  end
  string = string .. "\n  }\n}"
  game.write_file(file_name, string, false)
  rendering.draw_rectangle{
    surface = surface,
    left_top = area.left_top,
    right_bottom = area.right_bottom,
    color = {r=1,b=0,g=1,a=0.5},
    width = 5,
    time_to_live = 60*5
  }
  rendering.draw_rectangle{
    surface = surface,
    left_top = area.left_top,
    right_bottom = area.right_bottom,
    color = {r=0.5,b=0,g=0.5,a=0.25},
    width = 5,
    filled = true,
    time_to_live = 60*5
  }
  game.print("Entities of area X:"..area.left_top.x.." to "..area.right_bottom.x.." Y: "..area.left_top.y.."to "..area.right_bottom.y.." captured to: "..file_name)
end

-- Ruin.replace_in_blueprint({name="filename", blueprint="...", entities={["in_name"]="out-name"}, tiles={["in_name"]="out-name"}})
function Ruin.replace_in_blueprint(data)
  local file_name = "space-exploration.replace_in_blueprint."..data.name..".lua"
  local blueprint_string = data.blueprint

  local container = game.surfaces[1].create_entity{name = "iron-chest", position = {0,0}}
  container.insert{name="blueprint", count = 1}
  local inv = container.get_inventory(defines.inventory.chest)
  local blueprint = inv[1]
  blueprint.import_stack(blueprint_string)

  local entities = blueprint.get_blueprint_entities()
  for _, entity in pairs(entities or {}) do
    for _, change in pairs(data.entities or {}) do
      if entity.name == change.name then
        if change.new_name then
          entity.name = change.new_name
        end
        if change.shift then
          entity.position.x = entity.position.x + change.shift[1] or change.shift.x
          entity.position.y = entity.position.y + change.shift[2] or change.shift.y
        end
      end
    end
  end
  blueprint.set_blueprint_entities(entities)

  local tiles = blueprint.get_blueprint_tiles()
  for _, tile in pairs(tiles or {}) do
    for k, v in pairs(data.tiles or {}) do
      if tile.name == k then tile.name = v end
    end
  end
  blueprint.set_blueprint_tiles(tiles)

  local out_string = blueprint.export_stack()

  container.destroy()

  game.write_file(file_name, out_string, false)
end


function Ruin.on_nth_tick_3600()
  if not global.ruins then return end
  for ruin_name, ruin_location in pairs(global.ruins) do
    local ruin = Ruin.ruins[ruin_location.name]
    if ruin and ruin.on_nth_tick_3600 then
      local zone = Zone.from_zone_index(ruin_location.zone_index)
      local surface = Zone.get_surface(zone)
      if surface then
        ruin.on_nth_tick_3600(ruin, ruin_location, surface)
      end
    end
  end
end
Event.addListener("on_nth_tick_3600", Ruin.on_nth_tick_3600) -- 1 minute

return Ruin

--[[
Map View.

Is allows user to take a look at universe maps. Requires RemoteView to work.
Interconnects with Zonelist too.

Two maps are currently available:
  Interstellar map
  System map
]]--

local InterstellarMap = {}
local SystemMap = {}
local MapObjects = {}

local MapView = {
  InterstellarMap = InterstellarMap,
  SystemMap = SystemMap,
  MapObjects = MapObjects
}

MapView.tech_spaceship = mod_prefix .. "spaceship"

-- constants
MapView.name_surface_prefix = "starmap-"
MapView.name_gui_zone_details_root = mod_prefix.."map-view-zone-details"
MapView.name_gui_zone_title_table = mod_prefix.."map-view-zone-title-table"
MapView.name_details_root = "remote-view-details-root"
MapView.name_gui_zone_prefix = "zone_"
MapView.name_gui_spaceship_prefix = "spaceship_"

MapView.name_toggles = "map_view_toggles"
MapView.name_button_show_resources = "show_resources"
MapView.name_button_show_stats = "show_stats"
MapView.name_button_show_anchor_info = "show_anchor_info"
MapView.name_button_show_danger_zones = "show_danger_zones"
MapView.name_button_overhead_interstellar = mod_prefix .. "overhead_interstellar"
MapView.name_setting_overhead_interstellar = mod_prefix .. "show-overhead-button-interstellar-map"

MapView.name_clickable_interstellar_star = mod_prefix .. "interstellar-map-star"
MapView.name_clickable_interstellar_asteroid_field = mod_prefix .. "interstellar-map-asteroid-field"
MapView.name_clickable_interstellar_spaceship = mod_prefix .. "interstellar-map-spaceship"
MapView.name_clickable_system_star = mod_prefix .. "system-map-star"
MapView.name_clickable_system_planet_prefix = mod_prefix .. "system-map-planet"
MapView.name_clickable_system_moon_prefix = mod_prefix .. "system-map-moon"
MapView.name_clickable_system_asteroid_belt = mod_prefix .. "system-map-asteroid-belt"
MapView.name_clickable_system_spaceship = mod_prefix .. "system-map-spaceship"
MapView.name_clickable_system_interstellar_space = mod_prefix .. "system-map-interstellar-space"
MapView.clickable_steps = 20 -- the number of increments for clickable scale


MapView.interstellar_map = "interstellar" -- interstellar space
MapView.system_map = "system" -- planetary system

InterstellarMap.scale = 1
InterstellarMap.distance_scale = 0.25 * InterstellarMap.scale

InterstellarMap.star_scale = InterstellarMap.scale
InterstellarMap.asteroid_scale = InterstellarMap.scale
InterstellarMap.asteroid_scale_scatter = InterstellarMap.scale
InterstellarMap.spaceship_scale = 1 * InterstellarMap.scale

InterstellarMap.infobox_scale = 1 * InterstellarMap.scale

InterstellarMap.text_scale = 1 * InterstellarMap.scale
InterstellarMap.star_text_scale = 2.5 * InterstellarMap.text_scale
InterstellarMap.asteroid_field_text_scale = 2 * InterstellarMap.text_scale

InterstellarMap.spaceship_text_scale = 0.5 * InterstellarMap.text_scale
InterstellarMap.spaceship_text_offset = Util.vector_multiply({ x = -0.2, y = -0.2}, InterstellarMap.spaceship_scale)

InterstellarMap.danger_zone_from_delta_v_scale = 6.0 / 10350.0 -- magic number dictates how big the danger zone thickness should be from the delta_v used to indicate being near the field
InterstellarMap.field_danger_zone_circle_radius_scale = SpaceshipObstacles.near_enough_by_zone_type["asteroid-field"] * InterstellarMap.danger_zone_from_delta_v_scale * InterstellarMap.scale

-- update coefficients here to adjust solar system map scale and element sizes
-- NOTE: if you change graphics please adjust *_graphics_scale constants in RemoteView.render_solarmap_* functions first
SystemMap.scale = 1
SystemMap.distance_scale = 12 * SystemMap.scale -- star gravity well scale
SystemMap.star_scale = 16 * SystemMap.scale
SystemMap.planet_scale = 4 * SystemMap.scale
SystemMap.planet_min_multiplier = 0.05
SystemMap.belt_scale = 1 * SystemMap.scale
SystemMap.spaceship_scale = 0.4 * SystemMap.scale

-- draw_line(width=) in pixels
-- draw_arc(min_radius,max_radius=) in tiles
-- these thickness constants are in tiles so you need to multiply it by 32 if used in draw_line()
SystemMap.line_thickness_scale = 0.08 * SystemMap.scale
SystemMap.arc_thickness_scale = 0.08 * SystemMap.scale
SystemMap.belt_arc_thickness_scale = 0.05 * SystemMap.scale
SystemMap.danger_zone_from_delta_v_scale = 5.0 / 207.0 -- magic number dictates how big the danger zone thickness should be from the delta_v used to indicate being near the belt
SystemMap.belt_danger_zone_arc_thickness_scale = SpaceshipObstacles.near_enough_by_zone_type["asteroid-belt"] * SystemMap.danger_zone_from_delta_v_scale * SystemMap.scale
SystemMap.planet_offset = { x = 0, y = 0}
SystemMap.belt_offset = { x = 2, y = 0}

SystemMap.infobox_scale = 1 * SystemMap.scale
SystemMap.infobox_gradient_tint = { r = 128, b = 128, g = 128, a = 255 }

SystemMap.text_scale = 4 * SystemMap.scale
SystemMap.star_text_scale = 1.2 * SystemMap.text_scale
SystemMap.planet_text_scale = 1 * SystemMap.text_scale
SystemMap.orbit_text_scale = 0.8 * SystemMap.text_scale
SystemMap.belt_text_scale = 1 * SystemMap.text_scale
SystemMap.landed_spaceship_text_scale = 0.5 * SystemMap.text_scale

SystemMap.spaceship_text_scale = 0.5 * SystemMap.text_scale

SystemMap.star_text_offset = Util.vector_multiply({ x = 2, y = 0.5}, SystemMap.scale)
SystemMap.spaceship_text_offset = Util.vector_multiply({ x = -0.2, y = -0.2}, SystemMap.spaceship_scale)


function MapView.player_is_in_interstellar_map(player)
  local playerdata = get_make_playerdata(player)
  if playerdata.remote_view_active_map and playerdata.remote_view_active_map.type == "interstellar" then
    return true
  end
  return false
end

function MapView.get_current_system(player)
  local playerdata = get_make_playerdata(player)
  if playerdata.remote_view_active_map and playerdata.remote_view_active_map.type == MapView.system_map then
    return playerdata.remote_view_active_map.zone
  end
  return nil
end

function MapView.gui_get_element_name_from_zone(zone)
  if zone.type == "spaceship" then
    return MapView.name_gui_spaceship_prefix .. zone.index
  else
    return MapView.name_gui_zone_prefix .. zone.index
  end
end

function MapView.gui_get_zone_from_element(root)
  if root then
    local zone_index = util.parse_with_prefix(root.name, MapView.name_gui_zone_prefix)
    if zone_index then
      return Zone.from_zone_index(tonumber(zone_index))
    end
    local spaceship_index = util.parse_with_prefix(root.name, MapView.name_gui_spaceship_prefix)
    if spaceship_index then
      return Spaceship.from_index(tonumber(spaceship_index))
    end
  end
end



function MapView.get_surface_name(player)
  return MapView.name_surface_prefix .. player.index
end

function MapView.get_make_surface(player)
  local surface_name = MapView.get_surface_name(player)

  if not game.surfaces[surface_name] then
    local mapgen_settings = {
      autoplace_controls = {
        ["planet-size"] = { frequency = 1/1000, size = 1 }
      }
    }
    mapgen_settings.autoplace_settings={
      ["decorative"]={
        treat_missing_as_default=false,
        settings={
        }
      },
      ["entity"]={
        treat_missing_as_default=false,
        settings={
        }
      },
      ["tile"]={
        treat_missing_as_default=false,
        settings={
          ["se-space"]={}
        }
      },
    }
    mapgen_settings.property_expression_names = {}
    mapgen_settings.property_expression_names["tile:out-of-map:probability"] = math.huge
    local surface = game.create_surface(surface_name, mapgen_settings)
    surface.daytime = 0
    surface.freeze_daytime = true
    surface.show_clouds = false
  end

  return game.surfaces[surface_name]
end

function MapView.starmap_view_cycle(player)
  -- Cycle through view modes.
  -- Open solar system map if in a system.
  -- Open interstellar map if not in a system or in a system map.
  -- Close the starmaps if in an interstellar map (go back to last-viewed location)
  if not MapView.player_is_in_interstellar_map(player) then
    if MapView.get_current_system(player) then
      return MapView.start_interstellar_map(player)
    else
      local star = Zone.from_surface(player.surface)
      if star then
        if star.type == "spaceship" then
          if star.star_gravity_well and star.star_gravity_well > 0 then
            star = Zone.get_star_from_position(star)
          end
        else
          star = Zone.find_parent_star(star)
        end
      end
      if star then
        return MapView.start_system_map(player, star)
      else
        return MapView.start_interstellar_map(player)
      end
    end
  else
    local playerdata = get_make_playerdata(player)
    if playerdata.location_history.references and playerdata.location_history.references then
      for i = #playerdata.location_history.references, 1, -1 do
        if playerdata.location_history.references[i]
          and playerdata.location_history.references[i].type ~= "system"
          and playerdata.location_history.references[i].type ~= "interstellar" then
            RemoteView.start(player, playerdata.location_history.references[i].zone)
        end
      end
    end
    -- if history was cleared
    local character = player_get_character(player)
    if character then
      local zone = Zone.from_surface(character.surface)
      if zone then
        return  RemoteView.start(player, zone, character.position)
      end
    end
  end
  RemoteView.stop(player)
end

function MapView.start_interstellar_map(player, freeze_history)
  if not freeze_history then
    RemoteView.add_history(player, Location.new_reference_from_player(player))
  end
  MapView.internal_start_map(player, {
    type = MapView.interstellar_map
  })
  MapView.update_overhead_button(player.index)
  if not freeze_history then
    RemoteView.add_history(player, Location.new_reference_from_player(player))
  end
end

function MapView.start_system_map(player, star, freeze_history)
  if not freeze_history then
    RemoteView.add_history(player, Location.new_reference_from_player(player))
  end
  if (not star) or star.type ~= "star" then
    -- fallback if star is invalid
    MapView.start_interstellar_map(player)
    return
  end

  MapView.internal_start_map(player, {
    type = MapView.system_map,
    zone = star
  })
  if not freeze_history then
    RemoteView.add_history(player, Location.new_reference_from_player(player))
  end
end

function MapView.internal_restart_map(player)
  local playerdata = get_make_playerdata(player)

  local previous_current_zone = playerdata.remote_view_current_zone
  local previous_active_map = playerdata.remote_view_active_map

  local from_zone
  if previous_active_map and previous_active_map.zone then
    from_zone = previous_active_map.zone
  else
    from_zone = previous_current_zone or Zone.from_surface(player.surface)
  end
  local map_data = previous_active_map

  MapView.stop_map(player)
  playerdata.remote_view_active_map = map_data
  playerdata.map_view_objects = {}
  playerdata.map_view_entities = {}

  local map_type = map_data.type
  if map_type == MapView.interstellar_map then
    InterstellarMap.start(player, from_zone, true)
    InterstellarMap.render(player)
  elseif map_type == MapView.system_map then
    SystemMap.start(player, map_data.zone, from_zone, true)
    SystemMap.render(player, map_data.zone)
  end

  RemoteView.gui_update(player)
end

function MapView.internal_start_map(player, map_data)
  local playerdata = get_make_playerdata(player)
  -- need to preserve it as RemoteView.start() clears it
  local previous_current_zone = playerdata.remote_view_current_zone
  local previous_active_map = playerdata.remote_view_active_map

  RemoteView.start(player, nil, nil, nil, true)
  if player.character or not(playerdata.remote_view_active) then return end -- failed

  local from_zone
  if previous_active_map and previous_active_map.zone then
    from_zone = previous_active_map.zone
  else
    from_zone = previous_current_zone or Zone.from_surface(player.surface)
  end

  MapView.stop_map(player)
  playerdata.remote_view_active_map = map_data
  playerdata.map_view_objects = {}
  playerdata.map_view_entities = {}

  local map_type = map_data.type
  if map_type == MapView.interstellar_map then
    InterstellarMap.start(player, from_zone)
    InterstellarMap.render(player)
  elseif map_type == MapView.system_map then
    SystemMap.start(player, map_data.zone, from_zone)
    SystemMap.render(player, map_data.zone)
  end

  RemoteView.gui_update(player)
end

function MapView.stop_map (player)
  local playerdata = get_make_playerdata(player)
  playerdata.remote_view_active_map = nil

  MapView.clear_map(player)
  MapView.gui_close(player)
end

function MapView.clear_map(player)
  -- delete the starmap graphics for this player
  local playerdata = get_make_playerdata(player)
  if playerdata.map_view_objects then
    for _, object_id in pairs(playerdata.map_view_objects) do
      rendering.destroy(object_id)
    end
  end
  playerdata.map_view_objects = nil

  local surface = game.surfaces[MapView.get_surface_name(player)]
  if surface then
    for _, entity in pairs(surface.find_entities_filtered{}) do
      entity.destroy()
    end
  end
  playerdata.map_view_entities = nil
end



--[[

  INTERSTELLAR MAP

]]--

function InterstellarMap.start(player, from_zone, no_teleport)
  local start_stellar_position = {x = 0, y = 0}
  if from_zone then
    start_stellar_position = Zone.get_stellar_position(from_zone)
  end
  local surface = MapView.get_make_surface(player)
  if not no_teleport then
    player.teleport(InterstellarMap.get_zone_position({stellar_position = start_stellar_position}), surface)
    player.zoom = 0.5
  end
end

function InterstellarMap.render(player)
  local surface = MapView.get_make_surface(player)
  local playerdata = get_make_playerdata(player)
  local spaceships = InterstellarMap.get_spaceship_index(player)

  for _, star in pairs(global.universe.stars) do
    InterstellarMap.render_star(player, surface, star, playerdata, spaceships.bound)
  end
  for _, zone in pairs(global.universe.space_zones) do
    if Zone.is_visible_to_force(zone, player.force.name) then
      InterstellarMap.render_asteroid_field(player, surface, zone, playerdata, spaceships.bound)
    end
  end

  for _, spaceship in pairs(spaceships.flying) do
    InterstellarMap.render_spaceship(player, surface, spaceship, playerdata)
  end

end

function InterstellarMap.get_zone_position(zone)
  return Util.vector_multiply(zone.stellar_position, InterstellarMap.distance_scale)
end

function InterstellarMap.get_spaceship_index(player)
  local flying = {}
  local bound = {}
  for _, spaceship in pairs(global.spaceships) do
    if spaceship.force_name == player.force.name then
      if spaceship.space_distortion < 0.05 then
        if spaceship.near_stellar_object then
          bound[spaceship.near_stellar_object.index] = bound[spaceship.near_stellar_object.index] or {}
          table.insert(bound[spaceship.near_stellar_object.index], spaceship)
        else
          table.insert(flying, spaceship)
        end
      end
    end
  end

  return {flying = flying, bound = bound}
end

function InterstellarMap.render_star(player, surface, star, playerdata, spaceships)
  local map_object = MapObjects.create(player, surface,
          star, MapView.name_clickable_interstellar_star,
          InterstellarMap.get_zone_position(star))
  map_object.command = "system"

  local object_id = rendering.draw_sprite{
    sprite = mod_prefix.."map-star",
    surface = surface,
    target = map_object.entity,
    players = {player},
    x_scale = 0.1 * InterstellarMap.star_scale,
    y_scale = 0.1 * InterstellarMap.star_scale,
    render_layer = "decals",--28, -- just above decals
  }
  table.insert(playerdata.map_view_objects, object_id)
  local object_id = rendering.draw_animation{
    animation = mod_prefix.."map-star-cloud",
    surface = surface,
    target = map_object.entity,
    players = {player},
    x_scale = 0.1 * InterstellarMap.star_scale,
    y_scale = 0.1 * InterstellarMap.star_scale,
    animation_speed = -1,
    tint = {r=255/255, g=100/255, b=5/255}
  }
  table.insert(playerdata.map_view_objects, object_id)

  MapView.render_zone_caption(player, map_object, star, spaceships)
end

function InterstellarMap.render_asteroid_field(player, surface, zone, playerdata, spaceships)
  local map_object = MapObjects.create(player, surface,
          zone, MapView.name_clickable_interstellar_asteroid_field,
          InterstellarMap.get_zone_position(zone))
  map_object.command = "details"

  local primary_resource = zone.primary_resource
  local tint = {r=0,g=0,b=0,a=0}
  for _, entity_prototype in pairs(game.entity_prototypes) do
    if entity_prototype.name == primary_resource then
      tint = entity_prototype.map_color
    end
  end

  local object_id = rendering.draw_sprite{
    sprite = mod_prefix.."map-asteroid-field-scatter",
    surface = surface,
    target = map_object.entity,
    x_scale = 0.3 * InterstellarMap.asteroid_scale_scatter,
    y_scale = 0.3 * InterstellarMap.asteroid_scale_scatter,
    players = {player}
  }
  table.insert(playerdata.map_view_objects, object_id)
  local object_id = rendering.draw_sprite{
    sprite = mod_prefix.."map-asteroid-field-scatter-detail",
    surface = surface,
    target = map_object.entity,
    x_scale = 0.3 * InterstellarMap.asteroid_scale_scatter,
    y_scale = 0.3 * InterstellarMap.asteroid_scale_scatter,
    players = {player},
    tint = tint
  }
  table.insert(playerdata.map_view_objects, object_id)
  local infobox_settings = MapView.get_settings(player)
  if infobox_settings.show_danger_zones then
    local object_id = rendering.draw_circle{
      color = {r=48, g=0, b=0, a=48},
      radius = InterstellarMap.field_danger_zone_circle_radius_scale,
      filled = true,
      target = map_object.entity,
      surface = surface,
      players = {player},
      draw_on_ground = true
    }
    table.insert(playerdata.map_view_objects, object_id)
  end
  MapView.render_zone_caption(player, map_object, zone, spaceships)
end

function InterstellarMap.render_spaceship(player, surface, spaceship, playerdata)
  local map_object = MapObjects.create(player, surface,
          spaceship, MapView.name_clickable_interstellar_spaceship,
          InterstellarMap.get_zone_position(spaceship))
  map_object.command = "details"

  local object_id = rendering.draw_sprite{
    sprite = mod_prefix.."map-spaceship",
    surface = surface,
    target = map_object.entity,
    orientation = MapView.get_spaceship_orientation(player, spaceship),
    x_scale = 0.0625 * InterstellarMap.spaceship_scale,
    y_scale = 0.0625 * InterstellarMap.spaceship_scale,
    players = {player},
  }
  table.insert(playerdata.map_view_objects, object_id)
  map_object.main_objects = {object_id}

  MapView.render_spaceship_caption(player, map_object, spaceship, nil)
end

--[[

  SYSTEM MAP

]]--

function SystemMap.start(player, star, from_zone, no_teleport)
  local start_solar_position = { x = 0, y = 0 }
  if from_zone then
    local star_stellar_position = star.stellar_position
    local from_zone_stellar_position = Zone.get_stellar_position(from_zone)
    if from_zone_stellar_position.x == star_stellar_position.x and from_zone_stellar_position.y == star_stellar_position.y then
      start_solar_position = SystemMap.get_zone_position(star, from_zone)
    end
  end

  local surface = MapView.get_make_surface(player)
  if not no_teleport then
    player.teleport(start_solar_position, surface)
    player.zoom = 0.4
  end
end

function SystemMap.render(player, star)
  local surface = MapView.get_make_surface(player)
  local playerdata = get_make_playerdata(player)
  local spaceships = SystemMap.get_spaceship_index(player, star)

  -- horizontal line showing the star gravity well
  local object_id = rendering.draw_line{
    color = {r=128, g=128, b=128, a=255},
    width = 32 * SystemMap.line_thickness_scale,
    from = SystemMap.get_zone_position(star, {
      star_gravity_well = star.star_gravity_well,
      planet_gravity_well = Zone.get_planet_gravity_well(star.orbit)
    }),
    to = SystemMap.get_zone_position(star, { star_gravity_well = 0}),
    surface = surface,
    players = {player},
    draw_on_ground = true
  }
  table.insert(playerdata.map_view_objects, object_id)

  SystemMap.render_star(player, surface, star, playerdata, spaceships.bound)

  for _, planet_or_belt in pairs(star.children) do
    if Zone.is_visible_to_force(planet_or_belt, player.force.name) then
      if planet_or_belt.type == "planet" then
        local position_data = SystemMap.get_zone_position_data(star, planet_or_belt)
        local solar_distance = position_data.y
                * SystemMap.distance_scale
        local object_id = rendering.draw_arc{
          color = {r=128, g=128, b=128, a=255},
          max_radius = (solar_distance + 0.5 * SystemMap.arc_thickness_scale),
          min_radius = (solar_distance - 0.5 * SystemMap.arc_thickness_scale),
          start_angle = 0.5 * Util.pi - 2 * Util.pi * position_data.orientation,
          angle = 2 * Util.pi * position_data.orientation,
          target = {x=0, y=0},
          surface = surface,
          players = {player},
          draw_on_ground = true
        }
        table.insert(playerdata.map_view_objects, object_id)

        SystemMap.render_planet_or_moon(player, surface, star, planet_or_belt, playerdata, spaceships.bound)

        for _, moon in pairs(planet_or_belt.children) do
          SystemMap.render_planet_or_moon(player, surface, star, moon, playerdata, spaceships.bound)
        end

      elseif planet_or_belt.type == "asteroid-belt" then
        local position_data = SystemMap.get_zone_position_data(star, planet_or_belt)
        local solar_distance = position_data.y
                * SystemMap.distance_scale
        local primary_resource = planet_or_belt.primary_resource
        local tint = {r=0,g=0,b=0,a=0}
        for _, entity_prototype in pairs(game.entity_prototypes) do
          if entity_prototype.name == primary_resource then
            tint = entity_prototype.map_color
          end
        end

        local belt_graphics_scale = 0.5
        for i = 1, 36 do
          local object_id = rendering.draw_arc{
            color = {r=16, g=16, b=16, a=16},
            max_radius = (solar_distance + 2 * SystemMap.belt_arc_thickness_scale),
            min_radius = (solar_distance - 2 * SystemMap.belt_arc_thickness_scale),
            start_angle = (i - 1) / 36 * 2 * Util.pi,
            angle = (0.9) / 36 * 2 * Util.pi,
            target = {x=0, y=0},
            surface = surface,
            players = {player},
            draw_on_ground = true
          }
          table.insert(playerdata.map_view_objects, object_id)
          local object_id = rendering.draw_arc{
            color = {r=32, g=32, b=32, a=32},
            max_radius = (solar_distance + SystemMap.belt_arc_thickness_scale),
            min_radius = (solar_distance - SystemMap.belt_arc_thickness_scale),
            start_angle = (i - 1 + 0.01) / 36 * 2 * Util.pi,
            angle = (0.9 - 2 * 0.01) / 36 * 2 * Util.pi,
            target = {x=0, y=0},
            surface = surface,
            players = {player},
            draw_on_ground = true
          }
          table.insert(playerdata.map_view_objects, object_id)
        end

        -- asteroid belt scatter graphics
        local num_partitions = 3.2 * 36 * solar_distance / 133 -- 133 is solar distance for first ring
        for i = 1, num_partitions+1 do
          local angle = (i - 1) / num_partitions * 2 * Util.pi
          local orientation = (i - 1) / num_partitions - 0.25 -- -0.25 rotates by 90 degrees
          local object_id = rendering.draw_sprite{
            sprite = mod_prefix.."map-asteroid-belt-scatter",
            x_scale = belt_graphics_scale * SystemMap.belt_scale,
            y_scale = belt_graphics_scale * SystemMap.belt_scale,
            orientation = orientation,
            target = {x=math.cos(angle)*solar_distance, y=math.sin(angle)*solar_distance},
            surface = surface,
            players = {player},
            draw_on_ground = true,
          }
          table.insert(playerdata.map_view_objects, object_id)
          local object_id = rendering.draw_sprite{
            sprite = mod_prefix.."map-asteroid-belt-scatter-detail",
            x_scale = belt_graphics_scale * SystemMap.belt_scale,
            y_scale = belt_graphics_scale * SystemMap.belt_scale,
            orientation = orientation,
            target = {x=math.cos(angle)*solar_distance, y=math.sin(angle)*solar_distance},
            surface = surface,
            players = {player},
            draw_on_ground = true,
            tint = tint
          }
          table.insert(playerdata.map_view_objects, object_id)
        end

        local infobox_settings = MapView.get_settings(player)
        if infobox_settings.show_danger_zones then
          local object_id = rendering.draw_arc{
            color = {r=48, g=0, b=0, a=48},
            max_radius = (solar_distance + SystemMap.belt_danger_zone_arc_thickness_scale),
            min_radius = (solar_distance - SystemMap.belt_danger_zone_arc_thickness_scale),
            start_angle = 0,
            angle = 2 * Util.pi,
            target = {x=0, y=0},
            surface = surface,
            players = {player},
            draw_on_ground = true
          }
          table.insert(playerdata.map_view_objects, object_id)
        end
        SystemMap.render_asteroid_belt(player, surface, star, planet_or_belt, playerdata, spaceships.bound)
      end
    end
  end

  for _, spaceship in pairs(spaceships.flying) do
    SystemMap.render_spaceship(player, surface, star, spaceship, playerdata)
  end

  SystemMap.render_interstellar_space(player, surface, star, playerdata)

end

function SystemMap.get_rendered_star_size(star)
  local star_size = star.star_gravity_well / 26 -- 26 seems to be around max star_gravity_well
  return star_size * SystemMap.star_scale
end

function SystemMap.get_zone_position_data(star, zone)
  -- zone may be just a table { star_gravity_well = ..., planet_gravity_well = ... }
  if zone and zone.type == "orbit" then
    zone = zone.parent
  end
  local position_data = {
    y = (SystemMap.get_rendered_star_size(star) + SystemMap.star_text_offset.x)
            / SystemMap.distance_scale
            + star.star_gravity_well - zone.star_gravity_well,
    x = 0,
    orientation = 0
  }
  if zone.planet_gravity_well and zone.planet_gravity_well > 0 then
    position_data.x = zone.planet_gravity_well * Zone.travel_cost_planet_gravity / Zone.travel_cost_star_gravity
    position_data.orientation = position_data.y and (position_data.x / (2 * Util.pi * position_data.y)) or 0
  end

  return position_data
end

function SystemMap.get_zone_position(star, zone)
  local position_data = SystemMap.get_zone_position_data(star, zone)

  return Util.vector_multiply(
          Util.rotate_vector(- position_data.orientation,
                  {x = 0, y = position_data.y}
          ),
          SystemMap.distance_scale)
end

function SystemMap.get_spaceship_index(player, star)
  local flying = {}
  local bound = {}
  for _, spaceship in pairs(global.spaceships) do
    if spaceship.force_name == player.force.name then
      if spaceship.space_distortion < 0.05 then
        if spaceship.near_stellar_object and spaceship.near_stellar_object.index == star.index then
          if spaceship.zone_index then
            bound[spaceship.zone_index] = bound[spaceship.zone_index] or {}
            table.insert(bound[spaceship.zone_index], spaceship)
          else
            table.insert(flying, spaceship)
          end
        end
      end
    end
  end

  return {flying = flying, bound = bound}
end

function SystemMap.render_star(player, surface, star, playerdata, spaceships)
  local star_rendered_size = SystemMap.get_rendered_star_size(star)

  local map_object = MapObjects.create(player, surface,
          star, MapView.name_clickable_system_star, { x = 0, y = 0})
  map_object.command = "details"

  local star_graphics_scale = 1 / 8 -- update if changing sprite
  local object_id = rendering.draw_sprite{
    sprite = mod_prefix.."map-star", -- update star_graphics_scale above if you change it
    surface = surface,
    target = map_object.entity,
    players = {player},
    x_scale = star_graphics_scale * star_rendered_size,
    y_scale = star_graphics_scale * star_rendered_size,
    render_layer = "decals"-- 28, -- just above decals
  }
  table.insert(playerdata.map_view_objects, object_id)
  local object_id = rendering.draw_animation{
    animation = mod_prefix.."map-star-cloud",
    surface = surface,
    target = map_object.entity,
    players = {player},
    x_scale = star_graphics_scale * star_rendered_size,
    y_scale = star_graphics_scale * star_rendered_size,
    animation_speed = -1,
    tint = {r=255/255, g=100/255, b=5/255}
  }
  table.insert(playerdata.map_view_objects, object_id)

  MapView.render_zone_caption(player, map_object, star, spaceships)
end

function SystemMap.render_planet_or_moon(player, surface, star, zone, playerdata, spaceships)
  if Zone.is_visible_to_force(zone, player.force.name) then
    local zone_size = zone.radius / Universe.planet_max_radius -- 0..1
    local zone_rendered_size = (SystemMap.planet_min_multiplier + (1 - SystemMap.planet_min_multiplier) * zone_size) * SystemMap.planet_scale
    local solar_position = SystemMap.get_zone_position(star, zone)
    solar_position = Util.vectors_add(solar_position, SystemMap.planet_offset)

    local entity_name_prefix = MapView.name_clickable_system_planet_prefix
    if zone.type == "moon" then
      entity_name_prefix = MapView.name_clickable_system_moon_prefix
    end
    local entity_name_suffix = "-"..math.ceil(MapView.clickable_steps * zone.radius / Universe.planet_max_radius)

    local map_object = MapObjects.create(player, surface,
            zone, entity_name_prefix .. entity_name_suffix, solar_position)
    map_object.command = "details"

    local planet_graphics_scale = 1 / 8 -- update if changing sprite
    local base_render_layer = 133

    local object_id = rendering.draw_sprite{ -- black out the star orbit like to make planets stand out more
      sprite =  mod_prefix.."map-planet",
      surface = surface,
      target = map_object.entity,
      players = {player},
      x_scale = planet_graphics_scale * zone_rendered_size + 0.01 * SystemMap.planet_scale,
      y_scale = planet_graphics_scale * zone_rendered_size + 0.01 * SystemMap.planet_scale,
      render_layer = "higher-object-under", -- base_render_layer-1,
      tint = {r=0,b=0,g=0,a=1}
    }
    table.insert(playerdata.map_view_objects, object_id)

    local tint = {r=1, b=1, g=1}
    if (not zone.tags) or (Util.table_contains(zone.tags, "aux_very_low") or Util.table_contains(zone.tags, "aux_low")) then
      tint = {r=1, b=0.8, g=0.9}
    end
    if zone.tags and (Util.table_contains(zone.tags, "aux_very_high") or Util.table_contains(zone.tags, "aux_high")) then
      tint = {r=1, b=1, g=0.9}
    end
    local object_id = rendering.draw_sprite{
      sprite =  mod_prefix.."map-planet",
      surface = surface,
      target = map_object.entity,
      players = {player},
      x_scale = planet_graphics_scale * zone_rendered_size,
      y_scale = planet_graphics_scale * zone_rendered_size,
      render_layer = "higher-object-above",--base_render_layer,
      tint = tint
    }
    table.insert(playerdata.map_view_objects, object_id)

    if not (zone.tags and Util.table_contains(zone.tags, "moisture_none")) then
      local tint = {r=1, b=1, g=1}
      if (not zone.tags) or (Util.table_contains(zone.tags, "aux_very_low") or Util.table_contains(zone.tags, "aux_low")) then
        tint = {r=0.5, b=0.5, g=1}
      end
      if zone.tags and (Util.table_contains(zone.tags, "aux_very_high") or Util.table_contains(zone.tags, "aux_high")) then
        tint = {r=1, b=1, g=0.5}
      end
      local object_id = rendering.draw_sprite{
        sprite =  mod_prefix.."map-planet-detail",
        surface = surface,
        target = map_object.entity,
        players = {player},
        x_scale = planet_graphics_scale * zone_rendered_size,
        y_scale = planet_graphics_scale * zone_rendered_size,
        render_layer = "item-in-inserter-hand", --base_render_layer + 1,
        tint = tint
      }
      table.insert(playerdata.map_view_objects, object_id)
    end

    if not (zone.tags and Util.table_contains(zone.tags, "water_none")) then
      local object_id = rendering.draw_sprite{
        sprite =  mod_prefix.."map-planet-water",
        surface = surface,
        target = map_object.entity,
        players = {player},
        x_scale = planet_graphics_scale * zone_rendered_size,
        y_scale = planet_graphics_scale * zone_rendered_size,
        render_layer = "wires",--base_render_layer + 2
      }
      table.insert(playerdata.map_view_objects, object_id)
    end

    local object_id = rendering.draw_sprite{
      sprite =  mod_prefix.."map-planet-cloud-ice",
      surface = surface,
      target = map_object.entity,
      players = {player},
      x_scale = planet_graphics_scale * zone_rendered_size,
      y_scale = planet_graphics_scale * zone_rendered_size,
      render_layer = "wires-above",--base_render_layer + 3
    }
    table.insert(playerdata.map_view_objects, object_id)

    local tint = {r = 0, g = 0.5, b = 1}
    -- TODO: try to estimate average temperature and  do a smooth transition from blue to red based on that.
    -- for now just make a few key values specific colors
    if zone.tags and Util.table_contains(zone.tags, "temperature_volcanic") then tint = {r = 1, g = 0, b = 0} end
    if zone.tags and Util.table_contains(zone.tags, "temperature_very_hot") then tint = {r = 1, g = 0.2, b = 0} end
    if zone.tags and Util.table_contains(zone.tags, "temperature_hot") then tint = {r = 1, g = 0.6, b = 0} end
    if zone.tags and Util.table_contains(zone.tags, "temperature_frozen") then tint = {r = 0, g = 0.2, b = 1} end
    local haze = 0.5 -- darken
    if zone.tags and Util.table_contains(zone.tags, "moisture_none") then haze = 0 end
    if zone.tags and Util.table_contains(zone.tags, "moisture_low") then haze = 0.1 end
    if zone.tags and Util.table_contains(zone.tags, "moisture_med") then haze = 0.3 end
    if zone.tags and Util.table_contains(zone.tags, "moisture_high") then haze = 0.5 end
    if zone.tags and Util.table_contains(zone.tags, "moisture_max") then haze = 1 end
    if haze > 0 then
      for k, v in pairs(tint) do tint[k] = v * 0.5 end -- darken
      local object_id = rendering.draw_sprite{
        sprite =  mod_prefix.."map-planet-haze",
        surface = surface,
        target = map_object.entity,
        players = {player},
        x_scale = planet_graphics_scale * zone_rendered_size,
        y_scale = planet_graphics_scale * zone_rendered_size,
        render_layer = "entity-info-icon",--base_render_layer + 4,
        tint = tint
      }
      table.insert(playerdata.map_view_objects, object_id)
    end

    if haze > 0 then
      tint = {r = 1, g = 1, b = 1}
      for k, v in pairs(tint) do tint[k] = v * 0.5 end -- darken
      local object_id = rendering.draw_sprite{
        sprite =  mod_prefix.."map-planet-atmosphere",
        surface = surface,
        target = map_object.entity,
        players = {player},
        x_scale = planet_graphics_scale * zone_rendered_size,
        y_scale = planet_graphics_scale * zone_rendered_size,
        render_layer = "entity-info-icon-above",--base_render_layer + 5,
        tint = tint
      }
      table.insert(playerdata.map_view_objects, object_id)
    end

    MapView.render_zone_caption(player, map_object, zone, spaceships)
  end
end

function SystemMap.render_asteroid_belt(player, surface, star, belt, playerdata, spaceships)
  if Zone.is_visible_to_force(belt, player.force.name) then
    local solar_position = SystemMap.get_zone_position(star, belt)
    solar_position = Util.vectors_add(solar_position, SystemMap.belt_offset)

    local map_object = MapObjects.create(player, surface,
            belt, MapView.name_clickable_system_asteroid_belt, solar_position)
    map_object.command = "details"

    local primary_resource = belt.primary_resource
    local tint = {r=0,g=0,b=0,a=0}
    for _, entity_prototype in pairs(game.entity_prototypes) do
      if entity_prototype.name == primary_resource then
        tint = entity_prototype.map_color
      end
    end

    local belt_graphics_scale = 1 / 3
    local object_id = rendering.draw_sprite{
      sprite = mod_prefix.."map-asteroid-belt",
      surface = surface,
      target = map_object.entity,
      x_scale = belt_graphics_scale * SystemMap.belt_scale,
      y_scale = belt_graphics_scale * SystemMap.belt_scale,
      players = {player}
    }
    table.insert(playerdata.map_view_objects, object_id)
    local object_id = rendering.draw_sprite{
      sprite = mod_prefix.."map-asteroid-belt-detail",
      surface = surface,
      target = map_object.entity,
      x_scale = belt_graphics_scale * SystemMap.belt_scale,
      y_scale = belt_graphics_scale * SystemMap.belt_scale,
      players = {player},
      tint = tint
    }
    table.insert(playerdata.map_view_objects, object_id)
    MapView.render_zone_caption(player, map_object, belt, spaceships)
  end
end

function SystemMap.render_spaceship(player, surface, star, spaceship, playerdata)
  local solar_position = SystemMap.get_zone_position(star, spaceship)

  local map_object = MapObjects.create(player, surface,
          spaceship, MapView.name_clickable_system_spaceship, solar_position)
  map_object.command = "details"

  local spaceship_graphics_scale = 1 / 4
  local object_id = rendering.draw_sprite{
    sprite = mod_prefix.."map-spaceship",
    surface = surface,
    target = map_object.entity,
    orientation = MapView.get_spaceship_orientation(player, spaceship),
    x_scale = spaceship_graphics_scale * SystemMap.spaceship_scale,
    y_scale = spaceship_graphics_scale * SystemMap.spaceship_scale,
    players = {player}
  }
  table.insert(playerdata.map_view_objects, object_id)
  map_object.main_objects = {object_id}

  MapView.render_spaceship_caption(player, map_object, spaceship, nil)
end

function SystemMap.render_interstellar_space(player, surface, star, playerdata)
  local solar_position = SystemMap.get_zone_position(star, {
    star_gravity_well = -0.5
  })

  local map_object = MapObjects.create(player, surface,
          "interstellar-space", MapView.name_clickable_system_interstellar_space, solar_position)
  map_object.command = "interstellar"


  local starmap_graphics_scale = 1 / 8
  table.insert(playerdata.map_view_objects,
          rendering.draw_sprite {
            sprite = mod_prefix .. "map-starmap", -- update star_graphics_scale above if you change it
            surface = surface,
            target = map_object.entity,
            players = { player },
            x_scale = starmap_graphics_scale * map_object.entity.prototype.selection_box.right_bottom.y,
            y_scale = starmap_graphics_scale * map_object.entity.prototype.selection_box.right_bottom.y,
            render_layer = "decals",--28, -- just above decals
          })

  local text_size = 3
  table.insert(playerdata.map_view_objects,
          rendering.draw_text {
            text = { "space-exploration.interstellar-map" },
            surface = surface,
            target = map_object.entity,
            target_offset = { x = 0, y = map_object.entity.prototype.selection_box.right_bottom.y },
            alignment = "center",
            players = { player },
            color = { r = 224, g = 224, b = 224, a = 255 },
            scale = text_size,
            scale_with_zoom = false
          })

end

-- ZONE MAP POSITIONING --
function MapView.get_zone_position(playerdata, zone)
  local map_type = playerdata and playerdata.remote_view_active_map and playerdata.remote_view_active_map.type or MapView.interstellar_map

  if map_type == MapView.interstellar_map then
    return InterstellarMap.get_zone_position(zone)
  elseif map_type == MapView.system_map then
    return SystemMap.get_zone_position(playerdata.remote_view_active_map.zone, zone)
  end
end

--[[

  ZONE CAPTIONS

]]--

function MapView.draw_gradient_line(line_props)
  line_props = table.deepcopy(line_props)

  local line_vector = util.vectors_delta(line_props.from_offset, line_props.to_offset)
  local line_length = util.vectors_delta_length(line_props.from_offset, line_props.to_offset)

  -- gradient constants, gradient is oriented downwards
  local gradient_width = 4
  local gradient_height = 512

  line_props = table.deepcopy(line_props)

  line_props.sprite = mod_prefix .. "gradient-sprite"
  line_props.target = line_props.from
  line_props.target_offset = util.lerp_vectors(line_props.from_offset, line_props.to_offset, 0.5)
  line_props.x_scale = line_props.width / gradient_width
  line_props.y_scale = 32 * line_length / gradient_height
  line_props.orientation = 0.75 + util.vector_to_orientation(line_vector)
  line_props.tint = line_props.color

  return rendering.draw_sprite(line_props)
end


function MapView.get_zone_info(player, zone, infobox_flags, spaceship_index, clamp_index)
  local playerdata = get_make_playerdata(player)
  local force_name = player.force.name

  local zone_info = {}

  if infobox_flags.show_stats then
    local info_line = {}
    local threat = Zone.get_threat(zone)

    local priority = Zone.get_priority(zone, force_name)
    local priority_color = Zonelist.name_color_priority_neutral
    if priority > 0 then
      priority_color = Zonelist.name_color_priority_positive
    elseif priority < 0 then
      priority_color = Zonelist.name_color_priority_negative
    end
    table.insert(info_line, {
      sprite = "virtual-signal/se-accolade",
      text = priority,
      text_color = priority_color
    })
    if threat > 0 then
      table.insert(info_line, {
        sprite = "virtual-signal/se-death",
        sprite_tint = {r = 255, g = 32, b = 32},
        text = string.format("%.0f", Zone.get_threat(zone)*100).."%",
        text_length = 4
      })
    end

    table.insert(info_line, {
      sprite = "item/solar-panel",
      text = string.format("%.0f", Zone.get_display_light_percent(zone) * 100).."%",
      text_length = 5
    })

    if Zone.is_solid(zone) and not (zone.tags and Util.table_contains(zone.tags, "water_none")) then
      table.insert(info_line, {
        sprite = "fluid/water"
      })
    end

    if playerdata.visited_zone and playerdata.visited_zone[zone.index] then
      table.insert(info_line, {
        sprite = "entity/character"
      })
    end
    if global.forces[force_name].zone_assets and global.forces[force_name].zone_assets[zone.index] and table_size(global.forces[force_name].zone_assets[zone.index].rocket_launch_pad_names) > 0 then
      table.insert(info_line, {
        sprite = "entity/"..Launchpad.name_rocket_launch_pad
      })
    end
    if global.forces[force_name].zone_assets and global.forces[force_name].zone_assets[zone.index] and table_size(global.forces[force_name].zone_assets[zone.index].rocket_landing_pad_names) > 0 then
      table.insert(info_line, {
        sprite = "entity/"..Landingpad.name_rocket_landing_pad
      })
    end
    if playerdata.track_glyphs and (zone.glyph ~= nil) then
      table.insert(info_line, {
        sprite = "entity/se-pyramid-a"
      })
    end
    if zone.interburbulator or zone.ruins then
      table.insert(info_line, {
        sprite = "virtual-signal/se-ruin"
      })
    end
    table.insert(zone_info, info_line)
  end

  if infobox_flags.show_anchor_info then
    --local clamps_line = {}
    --local clamps_here = clamps_index and clamps_index[zone.index] or {}
    --table.insert(clamps_line, {
    --  sprite = "item/se-spaceship-clamp",
    --  text = { "space-exploration.remote-view-clamps", #clamps_here},
    --  text_color = #clamps_here > 0 and { r=255, g=255, b=255, a=196 } or { r=96, g=96, b=96, a=96 }
    --})
    --table.insert(zone_info, clamps_line)

    local spaceships_line = {}
    local spaceships_here = spaceship_index and spaceship_index[zone.index] or {}
    local spaceships_text
    local spaceships_text_color = { r=0, g=255, b=255, a=196 }
    local spaceships_string_key = "space-exploration.remote-view-spaceships-anchored"
    if zone.type == "star" and playerdata.remote_view_active_map and playerdata.remote_view_active_map.type == MapView.interstellar_map then
      spaceships_string_key = "space-exploration.remote-view-spaceships"
    end
    if #spaceships_here > 0 then
      spaceships_text = spaceships_here[1].name
      if #spaceships_here > 1 then
        spaceships_text = { spaceships_string_key, #spaceships_here}
      end
    else
      spaceships_text = { spaceships_string_key, 0}
      spaceships_text_color = { r=96, g=96, b=96, a=96 }
    end
    table.insert(spaceships_line, {
      sprite = "virtual-signal/se-spaceship",
      text = spaceships_text,
      text_color = spaceships_text_color
    })
    table.insert(zone_info, spaceships_line)
  end

  return zone_info
end

function MapView.render_zone_info(player, map_object, object_ids, cursor, scale, zone, infobox_flags, spaceship_index, clamp_index)
  local icon_offset = {x = 0.25 * scale, y = 0.325 * scale}
  local icon_size = {x = 0.6 * scale, y = 0}

  for _, info_row in pairs(MapView.get_zone_info(player, zone, infobox_flags, spaceship_index, clamp_index)) do
    local line_cursor = table.deepcopy(cursor)
    for _, info_item in pairs(info_row) do
      table.insert(object_ids,
              rendering.draw_sprite({
                surface = map_object.entity.surface,
                target = map_object.entity,
                players = {player},

                tint = info_item.sprite_tint,
                target_offset = util.vectors_add(line_cursor, icon_offset),
                sprite = info_item.sprite,
                x_scale = scale / 2,
                y_scale = scale / 2,
              })
      )
      line_cursor = util.vectors_add(line_cursor, icon_size)

      if info_item.text then
        table.insert(object_ids,
                rendering.draw_text({
                  surface = map_object.entity.surface,
                  target = map_object.entity,
                  players = {player},

                  target_offset = line_cursor,
                  text = info_item.text,
                  color = info_item.text_color or {r = 255, b = 255, g = 255, a = 255},
                  scale_with_zoom = false,
                  scale = scale,
                })
        )
        line_cursor.x = line_cursor.x + (info_item.text_length and (0.3 + 0.16 * info_item.text_length) or 0.5) * scale
      end
    end
    cursor.y = cursor.y + 0.6 * scale
  end
end

function MapView.render_zone_resources(player, map_object, object_ids, cursor, scale, zone, max_resources)
  max_resources = max_resources or 7
  local icon_offset_left = {x = -0.25 * scale, y = 0.325 * scale}
  local icon_size_left = {x = -0.6 * scale, y = 0}

  local fsrs = {}
  local max_fsr = 0
  for resource_name, resource_settings in pairs(global.resources_and_controls.resource_settings) do
    if zone.controls[resource_name] then
      local fsr = Universe.estimate_resource_fsr(zone.controls[resource_name])
      if fsr > 0 then
        max_fsr = math.max(max_fsr, fsr)
        table.insert(fsrs, {name=resource_name, fsr=fsr})
      end
    end
  end
  table.sort(fsrs, function(a,b) return a.fsr > b.fsr end)
  local mapgen
  if zone.surface_index then mapgen = Zone.get_make_surface(zone).map_gen_settings end

  for i = 1, math.min(#fsrs, max_resources), 1 do
    local resource_name = fsrs[i].name
    local percent = math.pow(fsrs[i].fsr/max_fsr, 1/3)

    local line_cursor = table.deepcopy(cursor)
    table.insert(object_ids,
            rendering.draw_sprite({
              surface = map_object.entity.surface,
              target = map_object.entity,
              players = {player},

              target_offset = util.vectors_add(line_cursor, icon_offset_left),
              sprite = "entity/"..resource_name,
              x_scale = scale / 2,
              y_scale = scale / 2,
            })
    )
    line_cursor = util.vectors_add(line_cursor, icon_size_left)

    local percent_text = string.format("%.0f", percent * 100)
    local percent_color = percent == 1 and {r = 255, b = 255, g = 255, a = 255} or {r = 128, b = 128, g = 128, a = 255}
    table.insert(object_ids,
            rendering.draw_text({
              surface = map_object.entity.surface,
              target = map_object.entity,
              players = {player},

              target_offset = line_cursor,
              text = percent_text,
              color = percent_color,
              scale_with_zoom = false,
              alignment = "right",
              scale = scale,
            })
    )
    cursor.y = cursor.y + 0.65 * scale

  end
end

function MapView.render_zone_caption(player, map_object, zone, spaceship_index)
  if not Zone.is_visible_to_force(zone, player.force.name) then return end

  for _, object_id in pairs(map_object.text_objects or {}) do
    rendering.destroy(object_id)
  end
  local object_ids = {}
  map_object.text_objects = object_ids

  local infobox_flags = table.deepcopy(MapView.get_settings(player))

  local playerdata = get_make_playerdata(player)
  local map_type = playerdata.remote_view_active_map and playerdata.remote_view_active_map.type

  local scale = map_type == MapView.interstellar_map and InterstellarMap.infobox_scale or SystemMap.infobox_scale
  local main_cursor = { x = 0, y = map_object.entity.prototype.selection_box.right_bottom.x}
  local cursor

  local name_alignment = "center" -- center/left
  local name_color = {r = 192, b = 192, g = 192, a = 192}
  local name_size = scale
  local short = zone.type == "star" or not zone.orbit

  if map_type == MapView.interstellar_map then
    if zone.type == "star" then
      name_color = {r=255, g=128, b=0, a=255}
      name_size = InterstellarMap.star_text_scale
      infobox_flags.show_resources = false
      infobox_flags.show_stats = false
    elseif zone.type == "asteroid-field" then
      name_color = {r=255, g=255, b=255, a=160}
      name_size = InterstellarMap.asteroid_field_text_scale
    end
  elseif map_type == MapView.system_map then
    if zone.type == "star" then
      name_color = {r=255, g=128, b=0, a=255}
      name_size = SystemMap.star_text_scale
      name_alignment = "left"
      main_cursor = util.vectors_add(main_cursor, { x = 3 * scale, y = 2 * scale})
      infobox_flags.show_resources = false
    elseif zone.type == "planet" then
      name_color = {r=255, g=255, b=255, a=224}
      name_size = SystemMap.planet_text_scale
    elseif zone.type == "moon" then
      name_color = {r=255, g=255, b=255, a=224}
      name_size = SystemMap.planet_text_scale
    elseif zone.type == "asteroid-belt" then
      name_color = {r=255, g=255, b=255, a=128}
      name_size = SystemMap.belt_text_scale
      name_alignment = "left"
      main_cursor = util.vectors_add(main_cursor, { x = 1 * scale, y = 0})
    end
  end

  -- NAME AND LINES
  if name_alignment == "center" then
    table.insert(object_ids,
            rendering.draw_text({
              surface = map_object.entity.surface,
              target = map_object.entity,
              players = {player},

              target_offset = main_cursor,
              text = zone.name,
              color = name_color,
              scale_with_zoom = false,
              alignment = "center",
              scale = name_size,
            })
    )
  elseif name_alignment == "left" then
    table.insert(object_ids,
            rendering.draw_text({
              surface = map_object.entity.surface,
              target = map_object.entity,
              players = {player},

              target_offset = util.vectors_add(main_cursor, { x=-1.7 * scale, y=0}),
              text = zone.name,
              color = name_color,
              scale_with_zoom = false,
              alignment = "left",
              scale = name_size,
            })
    )
  end

  if not (infobox_flags.show_resources or infobox_flags.show_stats or infobox_flags.show_anchor_info) then
    return
  end

  main_cursor.y = main_cursor.y + 0.5 * name_size + 0.2 * scale
  local horiz_line_cursor = table.deepcopy(main_cursor)

  table.insert(object_ids,
          MapView.draw_gradient_line({
            surface = map_object.entity.surface,
            from = map_object.entity,
            to = map_object.entity,
            players = { player },

            from_offset = main_cursor,
            to_offset = util.vectors_add(main_cursor, { x = 2 * scale, y = 0 }),
            color = SystemMap.infobox_gradient_tint,
            width = 2 * scale,
          }))
  table.insert(object_ids,
          MapView.draw_gradient_line({
            surface = map_object.entity.surface,
            from = map_object.entity,
            to = map_object.entity,
            players = { player },

            from_offset = main_cursor,
            to_offset = util.vectors_add(main_cursor, { x = -2 * scale, y = 0 }),
            color = SystemMap.infobox_gradient_tint,
            width = 2 * scale,
          }))
  main_cursor.y = main_cursor.y + 0.1 * scale

  cursor = util.vectors_add(main_cursor, { x=0.3 * scale, y=0.1 * scale})

  if infobox_flags.show_stats or infobox_flags.show_anchor_info then
    local body_info_shown = false
    local show_orbit_info = true
    -- BODY INFO
    if zone.type == "star" then
      if map_type == MapView.interstellar_map then
        show_orbit_info = false
        MapView.render_zone_info(player, map_object, object_ids, cursor, scale, zone, { show_anchor_info = true }, spaceship_index)
      end
    else
      MapView.render_zone_info(player, map_object, object_ids, cursor, scale, zone, infobox_flags, spaceship_index)
      body_info_shown = true
    end

    if show_orbit_info and zone.orbit then
      -- ORBIT HEADER

      if body_info_shown then
        cursor.y = cursor.y + 0.25 * scale

        table.insert(object_ids,
                MapView.draw_gradient_line({
                  surface = map_object.entity.surface,
                  from = map_object.entity,
                  to = map_object.entity,
                  players = { player },

                  from_offset = util.vectors_add(cursor, { x = -0.3 * scale, y = 0 }),
                  to_offset = util.vectors_add(cursor, { x = 3.5 * scale, y = 0 }),
                  color = SystemMap.infobox_gradient_tint,
                  width = 2 * scale,
                }))
        cursor.y = cursor.y + 0.15 * scale
      end

      table.insert(object_ids,
              rendering.draw_text({
                surface = map_object.entity.surface,
                target = map_object.entity,
                players = {player},

                target_offset = cursor,
                text = "Orbit",
                color = {r = 128, b = 128, g = 128, a = 255},
                scale_with_zoom = false,
                scale = scale,
              })
      )
      cursor.y = cursor.y + 0.6 * scale

      -- ORBIT INFO

      MapView.render_zone_info(player, map_object, object_ids, cursor, scale, zone.orbit, infobox_flags, spaceship_index)

    end

  end

  local right_side_y = cursor.y


  -- RESOURCES
  cursor = util.vectors_add(main_cursor, { x=-0.3 * scale, y=0.1 * scale})
  if infobox_flags.show_resources and zone.type ~= "star" then
    MapView.render_zone_resources(player, map_object, object_ids, cursor, scale, zone,
      short and 4 or 7)
  end

  local left_side_y = cursor.y

  -- VERTICAL LINE
  local line_height = (math.max(left_side_y, right_side_y) - horiz_line_cursor.y) * 0.95
  table.insert(object_ids,
          MapView.draw_gradient_line({
            surface = map_object.entity.surface,
            from = map_object.entity,
            to = map_object.entity,
            players = { player },

            from_offset = horiz_line_cursor,
            to_offset = util.vectors_add(horiz_line_cursor, { x = 0, y = line_height }),
            color = SystemMap.infobox_gradient_tint,
            width = 2 * scale,
          }))
end

function MapView.render_spaceship_caption(player, map_object, zone, spaceship_index)
  local playerdata = get_make_playerdata(player)
  local map_type = playerdata.remote_view_active_map and playerdata.remote_view_active_map.type
  if not map_type then return end

  local color = {r=0, g=196, b=196, a=255}
  local orientation = 0.125

  local size
  local target_offset
  if map_type == MapView.interstellar_map then
    size = InterstellarMap.spaceship_text_scale
    target_offset = InterstellarMap.spaceship_text_offset
  elseif map_type == MapView.system_map then
    size = SystemMap.spaceship_text_scale
    target_offset = SystemMap.spaceship_text_offset
  else
    return
  end
  local half_size = map_object.entity.prototype.selection_box.right_bottom.y
  target_offset = util.vectors_add(target_offset, { x = -half_size, y = -half_size })
  target_offset = util.vectors_add(target_offset, { x = 0, y = -0.5 * size })

  table.insert(map_object.text_objects,
          rendering.draw_text{
            text = zone.name,
            surface = MapView.get_make_surface(player),
            target = map_object.entity,
            target_offset = target_offset,
            players = {player},
            color = color,
            orientation = orientation,
            alignment = "right",
            scale = size,
            scale_with_zoom = false,
          }
  )
end

-- SPACESHIP UPDATES --
function MapView.update_view(player)
  local playerdata = get_make_playerdata(player)
  if not playerdata.remote_view_active_map then
    return
  end
  if not playerdata.map_view_entities then
    return
  end

  local map_type = playerdata.remote_view_active_map and playerdata.remote_view_active_map.type
  local spaceship_index = {}
  if map_type == MapView.interstellar_map then
    spaceship_index = InterstellarMap.get_spaceship_index(player)
  elseif map_type == MapView.system_map then
    spaceship_index = SystemMap.get_spaceship_index(player, playerdata.remote_view_active_map.zone)
  end

  local bound_spaceships = spaceship_index.bound or {}
  local flying_spaceships = spaceship_index.flying or {}
  local flying_by_spaceship_index = {}
  for _, spaceship in pairs(flying_spaceships) do
    flying_by_spaceship_index[spaceship.index] = spaceship
  end

  local seen_flying = {}
  for _, map_object in pairs(playerdata.map_view_entities) do
    local entity = map_object.entity
    if entity and entity.valid and map_object.zone then
      if map_object.zone and map_object.zone.type == "spaceship" then
        local spaceship = map_object.zone
        seen_flying[spaceship.index] = true
        if not flying_by_spaceship_index[spaceship.index] then
          -- spaceship is no longer flying here
          MapObjects.destroy(player, map_object)
        else
          -- update spaceship position and orientation
          entity.teleport(MapView.get_zone_position(playerdata, spaceship))
          MapObjects.set_orientation(map_object, MapView.get_spaceship_orientation(player, spaceship))
        end
      else
        -- not a spaceship, update zone caption to account for changes in anchored spaceships
        MapView.render_zone_caption(player, map_object, map_object.zone, bound_spaceships)
      end
    end
  end

  -- render new spaceships
  for _, spaceship in pairs(flying_spaceships) do
    if not seen_flying[spaceship.index] then
      -- render new spaceship
      MapView.render_spaceship(player, spaceship)
    end
  end

end

function MapView.render_spaceship(player, spaceship)
  local surface = MapView.get_make_surface(player)
  local playerdata = get_make_playerdata(player)
  local map_type = playerdata and playerdata.remote_view_active_map and playerdata.remote_view_active_map.type or MapView.interstellar_map

  if map_type == MapView.interstellar_map then
    InterstellarMap.render_spaceship(player, surface, spaceship, playerdata)
  else
    local star = playerdata.remote_view_active_map.zone
    SystemMap.render_spaceship(player, surface, star, spaceship, playerdata)
  end
end

function MapView.get_spaceship_orientation(player, spaceship)
  local playerdata = get_make_playerdata(player)
  local map_type = playerdata and playerdata.remote_view_active_map and playerdata.remote_view_active_map.type or MapView.interstellar_map
  local destination_zone = Spaceship.get_destination_zone(spaceship)

  -- no destination set, or standing still near a zone
  if not destination_zone or spaceship.near or spaceship.stopped then
    return 0.625 -- oriented bottom left
  end

  if map_type == MapView.interstellar_map then
    local travel_vector = util.vectors_delta(spaceship.stellar_position, Zone.get_stellar_position(destination_zone))
    return 0.25 + util.vector_to_orientation(travel_vector)
  elseif map_type == MapView.system_map then
    local star = playerdata.remote_view_active_map.zone
    local destination_star_gravity_well = Zone.get_star_gravity_well(destination_zone)
    if util.vectors_delta_length(spaceship.stellar_position, Zone.get_stellar_position(destination_zone)) > 0
            or Zone.get_space_distortion(destination_zone) > 0 then
      -- destination in another system, you need to get out of the current system
      destination_star_gravity_well = -1
    end
    if spaceship.planet_gravity_well <= 0 and spaceship.star_gravity_well ~= destination_star_gravity_well then
      -- travelling through star_gravity_well
      if spaceship.star_gravity_well > destination_star_gravity_well then
        return 0.5
      else
        return 0
      end
    else
      local direction_offset = 0.75
      if spaceship.star_gravity_well == destination_star_gravity_well
              and spaceship.planet_gravity_well < Zone.get_planet_gravity_well(destination_zone) then
        direction_offset = 0.25
      end
      local solar_position_data = SystemMap.get_zone_position_data(star, spaceship)
      return direction_offset - solar_position_data.orientation
    end
  end

  -- everything should be covered but just in case return the default
  return 0.625
end



-- MAP OBJECTS MANAGEMENT --
function MapObjects.create(player, surface, context, entity_name, position)
  -- context is either a zone, or a non-zone space (e.g. "interstellar-space")
  local zone = nil
  if type(context) == "table" then
    zone = context
    context = "zone"
  end

  local playerdata = get_make_playerdata(player)

  local entity = surface.create_entity{
    name = entity_name,
    position = position,
    force = "neutral"
  }
  entity.destructible = false

  local map_object = {
    entity = entity,
    context = context, -- "zone" or "interstellar-space"
    zone = zone,
    objects = {},
    text_objects = {}
  }

  playerdata.map_view_entities = playerdata.map_view_entities or {}
  playerdata.map_view_entities[entity.unit_number] = map_object

  return playerdata.map_view_entities[entity.unit_number]
end

function MapObjects.destroy(player, map_object)
  if map_object and map_object.entity and map_object.entity.valid then
    local entity = map_object.entity
    local playerdata = get_make_playerdata(player)
    if not playerdata.map_view_entities[entity.unit_number] then
      return
    end

    playerdata.map_view_entities[entity.unit_number] = nil
    entity.destroy()
  end
end

function MapObjects.set_orientation(map_object, orientation)
  for _, rendering_object in pairs(map_object.main_objects or {}) do
    rendering.set_orientation(rendering_object, orientation)
  end
end


-- EVENT HANDLERS --
function MapView.on_map_tick(event)
  if (game.tick % 60) == 40 then
    for _, player in pairs(game.connected_players) do
      local playerdata = get_make_playerdata(player)
      if playerdata.remote_view_active_map then
        MapView.update_view(player)
      end
    end
  end
end
Event.addListener(defines.events.on_tick, MapView.on_map_tick)


function MapView.on_gui_opened (event)
  local player = game.players[event.player_index]
  if event.entity and event.entity.valid and event.entity.type == "lamp" then
    local playerdata = get_make_playerdata(player)
    if playerdata.map_view_entities then
      local map_object = playerdata.map_view_entities[event.entity.unit_number]
      if map_object then
        if map_object.command == "system" then
          player.opened = nil -- close
          if Zone.is_visible_to_force(map_object.zone, player.force.name ) then
            MapView.start_system_map(player, map_object.zone)
          else
            player.print({"space-exploration.interstellar_launch_satellite_to_see_star"})
          end
        elseif map_object.command == "interstellar" then
          player.opened = nil -- close
          MapView.start_interstellar_map(player)
        elseif map_object.command == "details" then
          player.opened = nil -- close
          MapView.gui_open(player, map_object.zone)
        end

      end
    end
  end
end
Event.addListener(defines.events.on_gui_opened, MapView.on_gui_opened)

function MapView.on_gui_closed (event)
  if event.element and event.element.valid and event.element.name == MapView.name_gui_zone_details_root then
    MapView.gui_close(game.get_player(event.player_index))
  end
end
Event.addListener(defines.events.on_gui_closed, MapView.on_gui_closed)

function MapView.get_make_settings(player)
  local playerdata = get_make_playerdata(player)
  playerdata.starmap_settings = playerdata.starmap_settings or {
    show_resources = false,
    show_stats = false,
    show_anchor_info = false,
    show_danger_zones = true,
  }
  return playerdata.starmap_settings
end

function MapView.get_settings(player)
  local settings = MapView.get_make_settings(player)
  if not player.force.technologies[MapView.tech_spaceship].researched then
    settings = table.deepcopy(settings)
    settings["show_anchor_info"] = nil
  end
  return settings
end

function MapView.toggle_setting(player, setting_name)
  local settings = MapView.get_make_settings(player)
  settings[setting_name] = not settings[setting_name]
  if setting_name == "show_danger_zones" then
    MapView.internal_restart_map(player)
  else
    MapView.update_view(player)
  end
end


-- ZONE DETAILS GUI --
function MapView.gui_open(player, zone)
  if not zone then return end
  if zone.type == "star" then zone = zone.orbit end

  MapView.gui_close(player)

  local gui = player.gui.screen
  player.opened = nil

  local main = gui.add{ type = "frame", name = MapView.name_gui_zone_details_root, direction="vertical"}
  main.style.padding = 12
  main.style.top_padding = 6
  main.style.bottom_padding = 0

  player.opened = main

  if not (main and main.valid) then return end -- setting player.opened can cause other scripts to delete UIs
  local title_table = main.add{type="table", name=MapView.name_gui_zone_title_table, column_count=2, draw_horizontal_lines=false}
  title_table.style.horizontally_stretchable = true
  title_table.style.column_alignments[1] = "left"
  title_table.style.column_alignments[2] = "right"
  title_table.drag_target = main

  -- store zone name here for
  local title_frame = title_table.add{type="frame", name=MapView.gui_get_element_name_from_zone(zone), caption=zone.name, style="informatron_title_frame"}
  title_frame.ignored_by_interaction = true

  local right_flow = title_table.add{type="flow", direction="horizontal", name="right_flow"}
  right_flow.style.vertical_align = "top"
  if zone.type ~= "star" and zone.orbit then
    local land = right_flow.add{type="sprite-button", name=MapView.name_gui_zone_details_root.."_land", sprite = Zone.get_icon(zone), style="button", tooltip=zone.name}
    land.style.width = 40
    land.style.height = 40
    land.style.bottom_margin = -5
    land.enabled = false
    local orbit = right_flow.add{type="sprite-button", name=MapView.name_gui_zone_details_root.."_orbit", sprite = Zone.get_icon(zone.orbit), style="button", tooltip=zone.orbit.name}
    orbit.style.width = 40
    orbit.style.height = 40
    orbit.style.right_margin = 6
    orbit.style.bottom_margin = -5
  end
  local close = right_flow.add{type="sprite-button", name=MapView.name_gui_zone_details_root.."_close", sprite = "utility/close_white", style="informatron_close_button", tooltip={"gui.close-instruction"}}
  close.style.width = 28
  close.style.height = 28
  close.style.top_margin = 3

  local details_root = main.add{type="frame", name=MapView.name_details_root, direction="vertical"}
  details_root.style.horizontally_stretchable = true
  details_root.style.top_margin = -2
  details_root.style.left_margin = -16
  details_root.style.right_margin = -16
  details_root.style.bottom_margin = -3
  details_root.drag_target = main

  local zone_identifier = details_root.add{type="flow", direction="vertical", name=MapView.gui_get_element_name_from_zone(zone)}
  local zone_gui_zonelist_root = zone_identifier.add{type="flow", direction="vertical", name=Zonelist.name_gui_root}
  Zonelist.gui_create_zone_content(player, zone_gui_zonelist_root)
  MapView.gui_update(player)

  main.force_auto_center()

end

function MapView.gui_update(player)
  local root = player.gui.screen[MapView.name_gui_zone_details_root]
  if root and root[MapView.name_details_root] then
    local details = util.find_first_descendant_by_name(root, Zonelist.name_gui_root)
    local zone = MapView.gui_get_zone_from_element(details.parent)
    Zonelist.gui_update_zone_content(player, details, zone)
  end
end

function MapView.gui_close(player)
  if player.gui.screen[MapView.name_gui_zone_details_root] then
    player.gui.screen[MapView.name_gui_zone_details_root].destroy()
  end
end


function MapView.on_gui_click(event)
  if not (event.element and event.element.valid) then return end
  local element = event.element
  local player = game.players[event.player_index]

  if event.element.tags and event.element.tags.se_action == "starmap-cycle" then
    return MapView.starmap_view_cycle(player)
  end

  local root = gui_element_or_parent(element, MapView.name_gui_zone_details_root)
  if root then
    if element.name == MapView.name_gui_zone_details_root.."_close" then
      MapView.gui_close(player)
    elseif element.name == MapView.name_gui_zone_details_root.."_land" then
      local title_table = util.find_first_descendant_by_name(root, MapView.name_gui_zone_title_table)
      if title_table then
        local zone = MapView.gui_get_zone_from_element(title_table.children[1])
        if zone then
          util.find_first_descendant_by_name(root, MapView.name_gui_zone_details_root.."_land").enabled = false
          util.find_first_descendant_by_name(root, MapView.name_gui_zone_details_root.."_orbit").enabled = true
          local details_root = util.find_first_descendant_by_name(root, MapView.name_details_root)
          details_root.clear()
          local zone_identifier = details_root.add{type="flow", direction="vertical", name=MapView.gui_get_element_name_from_zone(zone)}
          local zone_gui_zonelist_root = zone_identifier.add{type="flow", direction="vertical", name=Zonelist.name_gui_root}
          Zonelist.gui_create_zone_content(player, zone_gui_zonelist_root)
          MapView.gui_update(player)
        end
      end
    elseif element.name == MapView.name_gui_zone_details_root.."_orbit" then
      local title_table = util.find_first_descendant_by_name(root, MapView.name_gui_zone_title_table)
      if title_table then
        local zone = MapView.gui_get_zone_from_element(title_table.children[1])
        if zone and zone.orbit then
          util.find_first_descendant_by_name(root, MapView.name_gui_zone_details_root.."_land").enabled = true
          util.find_first_descendant_by_name(root, MapView.name_gui_zone_details_root.."_orbit").enabled = false
          local details_root = util.find_first_descendant_by_name(root, MapView.name_details_root)
          details_root.clear()
          local zone_identifier = details_root.add{type="flow", direction="vertical", name=MapView.gui_get_element_name_from_zone(zone.orbit)}
          local zone_gui_zonelist_root = zone_identifier.add{type="flow", direction="vertical", name=Zonelist.name_gui_root}
          Zonelist.gui_create_zone_content(player, zone_gui_zonelist_root)
          MapView.gui_update(player)
        end
      end
    end
  end
end
Event.addListener(defines.events.on_gui_click, MapView.on_gui_click)

function MapView.update_overhead_button(player_index)
  local player = game.players[player_index]
  local button_flow = mod_gui.get_button_flow(player)
  if button_flow then
    if settings.get_player_settings(player)[MapView.name_setting_overhead_interstellar].value == true then
      if not button_flow[MapView.name_button_overhead_interstellar] then
        button_flow.add{type="sprite-button", name=MapView.name_button_overhead_interstellar, sprite="se-map-gui-starmap"}
      end
      button_flow[MapView.name_button_overhead_interstellar].tooltip = {"space-exploration.star-map"}
      button_flow[MapView.name_button_overhead_interstellar].tags = {se_action="starmap-cycle"}
    else
      if button_flow[MapView.name_button_overhead_interstellar] then
        button_flow[MapView.name_button_overhead_interstellar].destroy()
      end
    end
  end
end

function MapView.on_runtime_mod_setting_changed(event)
  for _, player in pairs(game.connected_players) do
    MapView.update_overhead_button(player.index)
  end
end
Event.addListener(defines.events.on_runtime_mod_setting_changed, MapView.on_runtime_mod_setting_changed)

function MapView.on_configuration_changed()
  for _, player in pairs(game.connected_players) do
    MapView.update_overhead_button(player.index)
  end
end
Event.addListener("on_configuration_changed", MapView.on_configuration_changed, true)

return MapView

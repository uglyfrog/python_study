--[[ NOTE: The multiplayer support commnads are designed so that multiplayer mods can use them, but individuals can use use commands to to get multiplayer working without relying on mods.]]

remote.add_interface(
    "space-exploration",
    {

--/c remote.call("space-exploration", "lock_player_respawn_location", {player = game.player, position = game.player.position, zone_name = "Nauvis"})
-- or
--/c remote.call("space-exploration", "lock_player_respawn_location", {player = game.player, position = game.player.position, surface_name = "nauvis"})
        lock_player_respawn_location = function(data)
          if data.player and data.player.valid and data.position and data.position.x and data.position.y then
            local playerdata = get_make_playerdata(data.player)
            if data.zone_name then
              local zone = Zone.from_name(data.zone_name)
              if not zone then game.print("Invalid zone name: "..data.zone_name) return end
              playerdata.lock_respawn = {zone_index = zone.index, position = data.position}
              game.print(data.player.name.." respawn location locked")
            elseif data.surface_name then
              if not game.surfaces[data.surface_name] then  game.print("Invalid surface name: "..data.surface_name) end
              playerdata.lock_respawn = {surface_name = data.surface_name, position = data.position}
              game.print(data.player.name.." respawn location locked")
            end
          end
        end,

--/c remote.call("space-exploration", "unlock_player_respawn_location", {player = game.player})
        unlock_player_respawn_location = function(data)
          if data.player and data.player.valid then
            local playerdata = get_make_playerdata(data.player)
            playerdata.lock_respawn = nil
          end
        end,

--/c remote.call("space-exploration", "get_player_character", {player = game.player})
        get_player_character = function(data)
          if data.player and data.player.valid then
            if data.player.character then return data.player.character end
            local playerdata = get_make_playerdata(data.player)
            return playerdata.character
          end
        end,

--/c remote.call("space-exploration", "spawn_small_resources", {surface = game.player.surface})
        spawn_small_resources = function(data)
          Zone.spawn_small_resources(data.surface)
        end,

--Can multiply resources on nauvis. It should not be used unless you are sure the available resources on nauvis are insufficient to set up a few moon mining bases.
--/c remote.call("space-exploration", "multiply_nauvis_resource", {surface = game.player.surface, resource_name = "iron-ore", multiplier=0.9})
        multiply_nauvis_resource = function(data)
          if data.multiplier > 0 and data.multiplier ~= 1 and data.surface then
            for _, entity in pairs(data.surface.find_entities_filtered{type = "resource", name=data.resource_name}) do
              local amount = math.ceil(entity.amount * data.multiplier)
              if amount > 0 then
                entity.amount = amount
              else
                entity.destroy()
              end
            end
          end
        end,

-- Quick setup multiplayer test
--/c remote.call("space-exploration", "setup_multiplayer_test", { force_name = "player-2", players = {game.player}, match_nauvis_seed = false})
        setup_multiplayer_test = function(data)

          -- make the force
          local force_name = data.force_name
          if not game.forces[force_name] then
            game.create_force(force_name)
          end
          if not game.forces[force_name] then
            game.print("Error creating force with name: "..(force_name or "nil"))
            return
          end

          -- select the planet
          local planet

          for _, star in pairs(global.universe.stars) do
            if planet == nil then
              if star.special_type == "homesystem" then
                -- taken
              else
                for _, child in pairs(star.children) do
                  if child.type == "planet" and (not child.ruins) and (not child.interburbulator) and (not child.glyph) then
                    planet = child
                    game.print("Selected planet: "..child.name.." for homeworld.")
                    break
                  end
                end
              end
            end
          end
          if not planet then
            game.print("Error finding a planet")
            return
          end

          -- change the player forces
          for _, player in pairs(data.players) do
            player.force = game.forces[force_name]
          end

          local match_nauvis_seed = data.match_nauvis_seed == nil and true or data.match_nauvis_seed
          -- make the homeworld
          Zone.set_zone_as_homeworld({ zone_name = planet.name, match_nauvis_seed = match_nauvis_seed, reset_surface = true})


          Zone.spawn_small_resources(Zone.get_surface(planet))

          -- move the players
          local surface = Zone.get_make_surface(planet)
          for _, player in pairs(data.players) do
            if player.character then
              teleport_character_to_surface(player.character, surface, {0,0}) -- prevents overlapping players
            else
              player.teleport({0,0}, surface)
            end
          end

          -- assign the force to the homeworld (a homeworld can have multiple forces)
          -- also resets discoveries
          set_force_homeworld({zone_name = planet.name, force_name = force_name, spawn_position = {x = 0, y = 0}, reset_discoveries = true})

          -- TODO: trigger AAI crash sequence?

        end,

-- set the target zone to be a homeworld
--/c remote.call("space-exploration", "set_zone_as_homeworld", {zone_name = "Arendel", match_nauvis_seed = false, reset_surface = true})
        set_zone_as_homeworld = function(data)
          return Zone.set_zone_as_homeworld(data)
        end,

-- set a force's homeworld (needed for later functions) and sets their respawn location
--/c remote.call("space-exploration", "set_force_homeworld", {zone_name = "Arendel", force_name = "player-2", spawn_position = {x = 0, y = 0}, reset_discoveries = true})
        set_force_homeworld  = function(data)
          return set_force_homeworld(data)
        end,

-- reset a force's discovered locations.
--/c remote.call("space-exploration", "set_force_homeworld", { force_name = "player-2"})
        force_reset_discoveries  = function(data)
          force_reset_discoveries(data.force_name)
        end,

--/c remote.call("space-exploration", "get_zone_index", {})
        get_zone_index = function(data)
          local zone_index = {}
          for i, zone in pairs(global.zone_index) do
             table.insert(zone_index, Zone.export_zone(zone))
          end
          return zone_index
        end,

--/c remote.call("space-exploration", "get_zone_from_name", {zone_name = "Nauvis"})
        get_zone_from_name = function(data) return Zone.export_zone(Zone.from_name(data.zone_name)) end,

--/c remote.call("space-exploration", "get_zone_from_zone_index", {zone_index = 2})
        get_zone_from_zone_index = function(data) return Zone.export_zone(Zone.from_zone_index(data.zone_index)) end,

--/c remote.call("space-exploration", "get_zone_from_surface_index", {surface_index = game.player.surface.index})
        get_zone_from_surface_index = function(data) return Zone.export_zone(Zone.from_surface_index(data.surface_index)) end,

--/c remote.call("space-exploration", "get_surface_type", {surface_index = game.player.surface.index})
        get_surface_type = function(data)
          local surface = game.surfaces[data.surface_index]
          local zone = Zone.from_surface(surface)
          if zone then return zone.type end
          -- vault?
          local vault = Ancient.vault_from_surface(surface)
          if vault then return "vault" end
        end,

--/c remote.call("space-exploration", "get_zone_icon", {zone_index = remote.call("space-exploration", "get_zone_from_surface_index", {surface_index = game.player.surface.index}).index})
        get_zone_icon = function(data) return Zone.get_icon(Zone.from_zone_index(data.zone_index)) end,

--/c remote.call("space-exploration", "get_zone_is_solid", {zone_index = remote.call("space-exploration", "get_zone_from_surface_index", {surface_index = game.player.surface.index}).index})
        get_zone_is_solid = function(data) return Zone.is_solid(Zone.from_zone_index(data.zone_index)) end,

--/c remote.call("space-exploration", "get_zone_is_space", {zone_index = remote.call("space-exploration", "get_zone_from_surface_index", {surface_index = game.player.surface.index}).index})
        get_zone_is_space = function(data) return Zone.is_space(Zone.from_zone_index(data.zone_index)) end,

--/c remote.call("space-exploration", "zone_get_surface", {zone_index =  remote.call("space-exploration", "get_zone_from_name", {zone_name = "Arendel"}).index})
        zone_get_surface = function(data) return Zone.get_surface(Zone.from_zone_index(data.zone_index)) end,

--/c remote.call("space-exploration", "zone_get_make_surface", {zone_index =  remote.call("space-exploration", "get_zone_from_name", {zone_name = "Arendel"}).index})
        zone_get_make_surface = function(data) return Zone.get_make_surface(Zone.from_zone_index(data.zone_index)) end,

--/c remote.call("space-exploration", "get_cargo_loss", {force = game.player.force})
        get_cargo_loss = function(data) return Launchpad.get_force_cargo_loss_modifier(data.force) end,

--/c remote.call("space-exploration", "get_reusability", {force = game.player.force})
        get_reusability = function(data) return Launchpad.get_reusability(data.force) end,

--/c remote.call("space-exploration", "get_survivability_loss", {force = game.player.force})
--/c game.print(remote.call("space-exploration", "get_survivability_loss", {force = game.player.force}))
        get_survivability_loss = function(data) return Launchpad.get_force_survivability_loss_modifier(data.force) end,

--/c game.print(remote.call("space-exploration", "get_rockets_launched", {force = game.player.force}))
        get_rockets_launched = function(data) return global.forces[data.force.name].cargo_rockets_launched end,

--/c remote.call("space-exploration", "launch_satellite", {force_name = game.player.force.name, surface=game.player.surface, count=1})
        launch_satellite = function(data)
          local rep = data.count or 1
          for i = 1, rep, 1 do
            on_satellite_launched(data.force_name, data.surface)
          end
        end,

--/c remote.call("space-exploration", "build_satellite", {force_name = game.player.force.name})
        build_satellite = function(data) build_satellite(data.force_name) end,

--/c remote.call("space-exploration", "build_ruin", {ruin_name = "satellite", surface_index = game.player.surface.index, position = game.player.position})
        build_ruin = function(data)
          Ruin.build(data)
        end,

--/c pl = game.player p = pl.position remote.call("space-exploration", "ruin_log_tiles", {capture_name = "temp", surface = pl.surface, registration_point = p, left_top = {p.x - 11, p.y - 11}, right_bottom = {p.x + 11, p.y + 11}})
        ruin_log_tiles = function(data)
          Ruin.log_tiles(data)
        end,

--/c pl = game.player p = pl.position remote.call("space-exploration", "ruin_log_entities", {capture_name = "temp", surface = pl.surface, registration_point = p, left_top = {p.x - 11, p.y - 11}, right_bottom = {p.x + 11, p.y + 11}})
        ruin_log_entities = function(data)
          Ruin.log_entities(data)
        end,

--/c remote.call("space-exploration", "ruin_replace_in_blueprint", {name="filename", blueprint="...", entities={{name="in-name", new_name="out-name", shift={0,0}}, tiles={["in_name"]="out-name"}})
        ruin_replace_in_blueprint = function(data)
          Ruin.replace_in_blueprint(data)
        end,

--/c remote.call("space-exploration", "make_interburbulator", {position = {x=game.player.position.x, y = game.player.position.y - 10}, zone_index = remote.call("space-exploration", "get_zone_from_surface_index", {surface_index = game.player.surface.index}).index})
        make_interburbulator = function(data)
          Interburbulator.make_interburbulator(Zone.from_zone_index(data.zone_index), data.position)
        end,

--/c remote.call("space-exploration", "discover_zone", {force_name = game.player.force.name, surface=game.player.surface, zone_name="Arendel"})
        discover_zone = function(data)
          if not global.forces[data.force_name].satellites_launched or global.forces[data.force_name].satellites_launched == 0 then
            on_satellite_launched(data.force_name, data.surface)
          end
          Zone.discover(data.force_name, Zone.from_name(data.zone_name))
        end,

--/c remote.call("space-exploration", "discover_zones_by_type", {force_name = game.player.force.name, types={"star", "planet", "moon"}})
        discover_zones_by_type = function(data)
          for _, zone in pairs(global.zone_index) do
            if util.table_contains(data.types, zone.type) then
              Zone.discover(data.force_name, zone)
            end
          end
        end,

--/c remote.call("space-exploration", "show_all_zones", {})
        show_all_zones = function(data)
          global.debug_view_all_zones = true
        end,

--/c remote.call("space-exploration", "unshow_all_zones", {})
        unshow_all_zones = function(data)
          global.debug_view_all_zones = false
        end,

--/c remote.call("space-exploration", "debug_set_global", {debug_view_all_zones = true})
--        debug_set_global = function(data)  for k, v in pairs(data) do  global[k] = v end end,

--/c remote.call("space-exploration", "teleport_to_zone", {zone_name = "Nauvis", player=game.player})
        teleport_to_zone = function(data)
          local zone = Zone.from_name(data.zone_name)
          if zone and data.player then
            local surface = Zone.get_make_surface(zone)
            if data.player.character then
              teleport_character_to_surface(data.player.character, surface, {0,0})
            else
              data.player.teleport({0,0}, surface)
            end
          end
        end,

-- /c remote.call("space-exploration", "remote_view_is_active", {player=game.player})
        remote_view_is_active = function(data)
          if data.player then
            return RemoteView.is_active(data.player)
          end
        end,

-- /c remote.call("space-exploration", "remote_view_is_unlocked", {player=game.player})
        remote_view_is_unlocked = function(data)
          if data.player then
            return RemoteView.is_unlocked(data.player)
          end
        end,

-- /c remote.call("space-exploration", "remote_view_start", {player=game.player, zone_name = "Nauvis", position={x=100,y=200}, location_name="Point of Interest", freeze_history=true})
        remote_view_start = function(data)
          local zone = Zone.from_name(data.zone_name)
          if zone and data.player then
            RemoteView.start(data.player, zone, data.position, data.location_name, data.freeze_history)
          end
        end,

-- /c remote.call("space-exploration", "remote_view_stop", {player=game.player})
        remote_view_stop = function(data)
          if data.player then
            RemoteView.stop(data.player)
          end
        end,

--/c remote.call("space-exploration", "set_player_velocity", {player=game.player, velocity = {x = 0, y = 0}})
        set_player_velocity = function(data)
          if data.player and data.velocity and data.velocity.x and data.velocity.y then
            local playerdata = get_make_playerdata(player)
            if playerdata then
              playerdata.velocity = data.velocity
            end
          end
        end,
--/c remote.call("space-exploration", "begin_meteor_shower", {target_entity = game.player, meteors = 10})
--/c remote.call("space-exploration", "begin_meteor_shower", {target_entity = game.player.selected or game.player})
--/c remote.call("space-exploration", "begin_meteor_shower", {zone_name = "Nauvis", position = {x=0,y=0}, range = 1, meteors = 100})
--/c for i = 1, 10 do remote.call("space-exploration", "begin_meteor_shower", {target_entity = game.player, meteors = 100}) end
        begin_meteor_shower = function(data)
          local entity = data.target_entity
          if entity then
            local zone = Zone.from_surface(entity.surface)
            if zone and zone.type ~= "spaceship" then
              Meteor.begin_meteor_shower(zone, entity.position, data.range, data.meteors)
            end
          elseif data.zone_name then
            local zone = Zone.from_name(data.zone_name)
            if zone and zone.type ~= "spaceship" then
              local position = data.position or {x = 0, y = 0}
              Meteor.begin_meteor_shower(zone, position, data.range, data.meteors)
            end
          end

        end,

--/c remote.call("space-exploration", "begin_solar_flare", {zone_name = "Nauvis", targeting="basic"})
        begin_solar_flare = function(data)
          if data.zone_name then
            local zone = Zone.from_name(data.zone_name)
            if zone and zone.type ~= "spaceship" then
              SolarFlare.begin_flare(zone, data.targeting) -- zone, targeting, power_multiplier, delay, max_age
            end
          end

        end,


--/c remote.call("space-exploration", "fuel_rocket_silos", {})
        fuel_rocket_silos = function()
          for _, launch_pad in pairs(global.rocket_launch_pads) do
            launch_pad.lua_fuel = (launch_pad.lua_fuel or 0) + 100000000
          end
        end,

--/c remote.call("space-exploration", "get_known_zones", {force_name = game.player.force.name})
        get_known_zones = function(data)
          if data.force_name and global.forces[data.force_name] then
            -- return a list of known zone indexes.
            return global.forces[data.force_name].zones_discovered
          end
        end,

--/c remote.call("space-exploration", "show_only_zones", {zone_names = {"Nauvis", "Sandro", "Zomble", "Foenestra", "Kamsta"}})
        show_only_zones = function(data)
          for force_name, force_data in pairs(global.forces) do
            force_data.zones_discovered = {}
            force_data.zones_discovered_count = 0
            force_data.satellites_launched = 1
            for _, zone_name in pairs(data.zone_names) do
              local zone = Zone.from_name(zone_name)
              if zone then
                Zone.discover(force_name, zone, "Command")
              else
                game.print("Invalid zone name: "..zone_name)
              end
            end
          end
        end,

--/c remote.call("space-exploration", "rebuild_surface_index", {})
        rebuild_surface_index = Zone.rebuild_surface_index,

--/c remote.call("space-exploration", "rebuild_universe_resource_assignments", {})
        rebuild_universe_resource_assignments = Universe.rebuild_resource_assignments,

        get_on_cargo_rocket_launched_event = function() return Launchpad.on_cargo_rocket_launched_event end,
--/c remote.call("space-exploration", "get_on_player_respawned_event")
        get_on_player_respawned_event = function() return Respawn.on_player_respawned_event end,

--/c remote.call("space-exploration", "planet_swap", {star="Calidus", add_planet="Sandro"})
        robot_attrition_for_surface = function(data)
          local surface_index = data.surface_index
          local default_rate = data.default_rate
          local zone = Zone.from_surface_index(surface_index)
          return Zone.get_attrition(zone, default_rate)
        end,

--/c remote.call("space-exploration", "cancel_entity_creation", {entity=game.player.selected, player_index=1, message={"space-exploration.construction-denied"}})
        cancel_entity_creation = function(data)
          return cancel_entity_creation(data.entity, data.player_index, data.message)
        end,

--/c remote.call("space-exploration", "update_zones_minimum_threat", { update_existing_surfaces = true})
        update_zones_minimum_threat = function(data)
          Universe.update_zones_minimum_threat(data.update_existing_surfaces)
        end,

--/c remote.call("space-exploration", "log_map_gen", {})
        log_map_gen = Log.log_map_gen,
        log_global = Log.log_global,
        log_universe_simplified = Log.log_universe_simplified,
        log_universe = Log.log_universe,
        log_forces = Log.log_forces,
        log_spaceships = Log.log_spaceships,


-- informatron implementation
        informatron_menu = function(data)
          return Informatron.menu(data.player_index)
        end,

        informatron_page_content = function(data)
          return Informatron.page_content(data.page_name, data.player_index, data.element)
        end,

        informatron_page_content_update = function(data)
          return Informatron.page_content_update(data.page_name, data.player_index, data.element)
        end,

-- jetpack implementation
        on_character_swapped = function(event)
          if event.new_character and event.old_character then
            for _, playerdata in pairs(global.playerdata) do
              if playerdata.character == event.old_character then
                playerdata.character = event.new_character
              end
            end
          end
        end,

        on_entity_activated = function(event)
          if mod ~= "space-exploration" then
            Beacon.validate_entity(entity, ignore_count)
          end
        end

    }
)

local Spaceship = {}

Spaceship.names_tech_integrity = {
  {name = mod_prefix.."spaceship-integrity", bonus_per_level = 100, infinite = false},
  {name = mod_prefix.."factory-spaceship", bonus_per_level = 500, infinite = true}
}
Spaceship.integrity_base = 300

Spaceship.name_spaceship_console = mod_prefix .. "spaceship-console"
Spaceship.name_spaceship_console_output = mod_prefix .. "spaceship-console-output"
Spaceship.console_output_offset = {x = 1.5, y = -1}

Spaceship.engine_efficiency_blocked = 0.60
Spaceship.engine_efficiency_unblocked = 1
Spaceship.engine_efficiency_unblocked_taper = 20
Spaceship.engine_efficiency_side = 0.01
Spaceship.engines = {
  [mod_prefix .. "spaceship-rocket-engine"] = { name = mod_prefix .. "spaceship-rocket-engine", thrust = 100 / 5, max_energy = 1837, smoke_trigger = mod_prefix .. "spaceship-engine-smoke" },
  [mod_prefix .. "spaceship-ion-engine"] = { name = mod_prefix .. "spaceship-ion-engine", thrust = 250 / 5, max_energy = 183700, smoke_trigger = mod_prefix .. "spaceship-engine-smoke" },
  [mod_prefix .. "spaceship-antimatter-engine"]= { name = mod_prefix .. "spaceship-antimatter-engine", thrust = 500 / 5, max_energy = 18370, smoke_trigger = mod_prefix .. "spaceship-engine-smoke" }
}
Spaceship.names_engines = {}
Spaceship.names_smoke_trigger = {}

Spaceship.names_booster_tanks = {
  mod_prefix .. "spaceship-rocket-booster-tank",
  mod_prefix .. "spaceship-ion-booster-tank",
  mod_prefix .. "spaceship-antimatter-booster-tank"
}
Spaceship.ion_stream_energy = 4000000 -- 2x rocket fuel

Spaceship.names_spaceship_floors = {mod_prefix .. "spaceship-floor"}
Spaceship.names_spaceship_walls = {mod_prefix .. "spaceship-wall"}
Spaceship.names_spaceship_gates = {mod_prefix .. "spaceship-gate"}
Spaceship.names_spaceship_bulkheads = {
  mod_prefix .. "spaceship-wall",
  mod_prefix .. "spaceship-gate",
  SpaceshipClamp.name_spaceship_clamp_keep,
}
for _, engine in pairs(Spaceship.engines) do
  table.insert(Spaceship.names_engines, engine.name)
  table.insert(Spaceship.names_spaceship_bulkheads, engine.name)
  if engine.smoke_trigger then
    table.insert(Spaceship.names_smoke_trigger, engine.smoke_trigger)
  end
end

Spaceship.integrity_affecting_types = {
  {type = "linked-container", integrity_stress_container = 1000},
}
Spaceship.integrity_affecting_names = {
  {name = mod_prefix.."nexus", integrity_stress_container = 2000},
  {mod = "Krastorio2", name = "kr-antimatter-reactor", integrity_stress_structure = 100, integrity_stress_container = 100, max_speed_multiplier = 0.5},
}

Spaceship.signal_for_own_spaceship_id = {type = "item", name = Spaceship.name_spaceship_console}
Spaceship.signal_for_destination_spaceship = {type = "virtual", name = mod_prefix.."spaceship"}
Spaceship.signal_for_speed = {type = "virtual", name = "signal-speed"}
Spaceship.signal_for_distance = {type = "virtual", name = "signal-distance"}
Spaceship.signal_for_launch = {type = "virtual", name = mod_prefix.."spaceship-launch"}
Spaceship.signal_for_anchor_using_left = {type = "virtual", name = mod_prefix.."anchor-using-left-clamp"}
Spaceship.signal_for_anchor_using_right = {type = "virtual", name = mod_prefix.."anchor-using-right-clamp"}
Spaceship.signal_for_anchor_to_left = {type = "virtual", name = mod_prefix.."anchor-to-left-clamp"}
Spaceship.signal_for_anchor_to_right = {type = "virtual", name = mod_prefix.."anchor-to-right-clamp"}

Spaceship.energy_per_launch_integrity_delta_v = 150 * 1000
Spaceship.tick_interval_density = 60 -- must coincide with %60
Spaceship.tick_interval_move = 20 -- must coincide with %60
Spaceship.tick_interval_anchor = 5 -- must coincide with %60
Spaceship.tick_interval_gui = 5 -- must coincide with %60

Spaceship.tick_max_await = 60 * 10 -- 10 seconds

Spaceship.types_to_restore = {-- after surface change/area clone
  "inserter",
  "pump",
  --"transport-belt" -- entity.active does not work on belts
}

-- Note: production machines should NOT be included as some are supposed to be disabled on specific surfaces.
Spaceship.time_to_restore = 1

---@class Spaceship All data necessary to maintain the state of a spaceship

Spaceship.particle_speed_power = 0.75 -- 0.5 would be sqrt, 0 is static, 1 is linear with speed.
Spaceship.space_drag = 0.00135
Spaceship.minimum_impulse = 1/100
Spaceship.minimum_mass = 100
Spaceship.speed_taper = 250
Spaceship.travel_speed_multiplier = 1/200
Spaceship.integrity_pulse_interval = 60 * 60 * 10
Spaceship.tile_status = {}

--[[
change to:
{
  outer = 0 or 1. outer skin of tiles including diagonals
  floor = 0 or 1, has floor otherwise exterior
  exposed = 0 for contained, or higher for any tile exposed to space
  wall = 0 or 1, walls only
  bulkhead = 0 or 1, any bulkhead
  connection nil or distance to console.
}

]]--

Spaceship.tile_status.exterior = 1 -- any tile not with flooring (without bulkhead)
Spaceship.tile_status.wall_exterior = 2 -- bulkeahd outside of flooring
Spaceship.tile_status.bulkhead_exterior = 3 -- bulkeahd outside of flooring
Spaceship.tile_status.floor = 4 -- unknown floor
Spaceship.tile_status.wall = 5 -- unknown bulkhead
Spaceship.tile_status.bulkhead = 6 -- unknown bulkhead
Spaceship.tile_status.floor_exterior = 7 -- outside floor
Spaceship.tile_status.floor_interior = 8 -- contained floor
Spaceship.tile_status.floor_console_disconnected = 9 -- disconnected floor
Spaceship.tile_status.wall_console_disconnected = 10 -- disconnected bulkhead
Spaceship.tile_status.bulkhead_console_disconnected = 11 -- disconnected bulkhead
Spaceship.tile_status.floor_console_connected = 12 -- connected floor
Spaceship.tile_status.wall_console_connected = 13 -- connected bulkhead
Spaceship.tile_status.bulkhead_console_connected = 14 -- connected bulkhead



  --[[ tile statuses
    1 = exterior
    2 = floor_pending (on the edge of checking, used for next tick)
    3 = unknown floor (exists but unknown containment statis)
    4 = exterior floor
    5 = bulkhead (floor with wall or gate)
    6 = interior (contained) floor
  ]]--

--[[
console sends out a pule over all connected spaceship tiles (with a max based on tech)
then consider all tiles with wall or gate.
divide tiles into groups, ones that touch the outside are not part of the ship.
]]--

Spaceship.names = {
  "Abaddon", "Ackbar", "Aegis", "Albatross", "Alchemist", "Albion", "Alexander",
    "Angler", "Apparition", "ArchAngel", "Assassin", "Avenger", "Axe",
  "Bade", "Bardiche", "Battleth", "Blackbird", "Bounty Hunter", "Breaker",
    "Brigandine","Bullfinch", "Buzzard",
  "Cartographer", "Catface", "Calamari", "Canary", "Caravel", "Carrak", "Citadel", "Clockwerk",
    "Chimera", "Coot", "Cormorant", "Crane", "Crossbill", "Crow", "Cuckoo",
  "Darkstar", "Dauntless", "Desby", "Dragon", "Drake", "Dream", "Doombringer",
    "Dolphin", "Devourer", "Dunn",
  "Eagle", "Earthshaker", "Earl Grey", "Egret", "Eider", "Ember", "Enigma", "Eris", "Excalibur",
  "Falcon", "Falx", "Feral Pigeon", "Firecrest", "Firefly", "Flying Duckman",
    "Fountain", "Fulmar",
  "Gadwall", "Gannet", "Garganey", "Gigantosaurus", "Ghast", "Ghoul", "Ghost",
    "Glaive", "Goldcrest", "Goldeneye", "Goldfinch", "Goosander", "Goose",
    "Goshawk", "Grasshopper", "Greenfinch", "Griffon", "Grouse", "Guillemot",
  "Halberd", "Hammer", "Hammerhead", "Harrier", "Hawk", "Harking", "Heron", "Hippogryph", "Honeybadger", "Honeybear",
  "Iron Cordon", "Ingot", "Intrepid", "Invoker", "Isabella",
  "Jack Snipe", "Jackdaw", "Jay",
  "Kamsta", "Katherine", "Kestrel", "Kingfisher", "Kite", "Knight", "Kraken",
  "Lapwing", "Lance", "Lancer", "Lick", "Linnet", "Lucas",
  "Magi", "Magpie", "Mallard",  "Mangonel", "Medusa", "Memento", "Merlin",
    "Mistress", "Mocking Jay", "Monstrosity", "Moorhen", "Musk",
  "Naga", "Narwhal", "Nebulon", "Nemesis", "Newton", "Nexela", "Nial", "Nicholas",
    "Nightjar", "Nissa", "Nightingale", "Night Stalker",
  "Oracle", "Orca", "Ostricth", "Outrider", "Owl",
  "Partridge", "Pangolin", "Penguin", "Peregrine", "Petrel", "Phantom",
    "Pheasant", "Phoenix", "Piccard", "Pintail", "Pioneer",
    "Pipit", "Plover", "Prophet", "Prowler", "Pochard", "Puffin",
  "Quail",
  "Radiance", "Raptor", "Raven", "Razor", "Razorbill", "Red Kite", "Redshank",
    "Redstart", "Redwing", "Requiem",
    "Riccardo", "Robin", "Roc", "Rook", "Rossi", "Rogue", "Ruff",
  "Sanderling", "Sawfish", "Scythe", "Seraph", "Serenity", "Sickle", "Shadow",
    "Shag", "Sharknado", "Shelduck", "Sherrif", "Shoveler", "Sin Eater", "Siren",
    "Siskin",  "Skylark", "Skyshark", "Skywalker", "Skywrath", "Smew", "Snek",
    "Snipe",  "Sparrowhawk", "Spear", "Spectre", "Spinosaur", "Spynx",
    "Starchaser", "Starling", "Stonechat", "Swallow", "Swan", "Swift", "Swordfish",
  "Tachyon", "Tali", "Tantive", "Teal", "Templar", "Terrorblade", "Tesla", "Thanatos",
    "Throne", "Thrush", "Tigress", "Tin Can", "Titan", "Trebuchet",
    "Trimaran", "Turnstone", "Turing", "Tusk", "Twite",
  "Ursa", "Undertaker", "Undying Dodo", "Underlord",
  "Vengeance", "Viper", "Virtue", "Visage", "Void Hunter", "Volt", "Vulture",
  "Wagtail", "Warbird", "Warbler", "Warcry", "Warden", "Warlock", "Warlord", "Warrunner",
    "Waxwing", "Weaver", "Wheatear", "Whimbrel", "Whinchat", "Whitestar",
    "Wigeon", "Windranger", "Woodcock", "Wraith", "Wrath", "Wren", "Wyvern", "Wyrm",
  "Xena", "Xenon", "Xylem",
  "Yacht", "Yellowhammer", "Yettie",
  "Zenith", "Zilla", "Zombie", "Zweihander"
}

--[[========================================================================================
Helper functions for identifying if a tile or entity is a certain type of spaceship thing.
]]--

function Spaceship.is_floor(tile_name)
  return Util.table_contains(Spaceship.names_spaceship_floors, tile_name)
end

function Spaceship.is_wall(entity_name)
  return Util.table_contains(Spaceship.names_spaceship_walls, entity_name)
end

function Spaceship.is_gate(entity_name)
  return Util.table_contains(Spaceship.names_spaceship_gates, entity_name)
end

function Spaceship.is_wall_or_gate(entity_name)
  return Spaceship.is_wall(entity_name) or Spaceship.is_gate(entity_name)
end

--[[========================================================================================
Helper functions for getting spaceship references.
]]--

function Spaceship.from_index(spaceship_index)
  if global.spaceships then return global.spaceships[tonumber(spaceship_index)] end
end

function Spaceship.from_entity(entity)
  if not entity then return end
  for _, spaceship in pairs(global.spaceships) do
    if spaceship.console and spaceship.console.valid and spaceship.console.unit_number == entity.unit_number then
      return spaceship
    end
  end
end

function Spaceship.from_name(name)
  for _, spaceship in pairs(global.spaceships) do
    if spaceship.name == name then
      return spaceship
    end
  end
end

function Spaceship.from_own_surface_index(surface_index) -- can't be a zone
  if global.spaceships then
    for _, spaceship in pairs(global.spaceships) do
      if spaceship.own_surface_index == surface_index then
        return spaceship
      end
    end
  end
end

function Spaceship.from_surface_position(surface, position)
  local x = math.floor(position.x or position[1])
  local y = math.floor(position.y or position[2])
  -- TODO allow multiple spaceships per surface
  for _, spaceship in pairs(global.spaceships) do
    if spaceship.own_surface_index then
      if spaceship.own_surface_index == surface.index then
        return spaceship
      end
    elseif spaceship.console and spaceship.console.valid and spaceship.console.surface == surface then
      -- check tiles
      if spaceship.known_tiles and spaceship.known_tiles[x] and spaceship.known_tiles[x][y] and
        (spaceship.known_tiles[x][y] == Spaceship.tile_status.floor_console_connected
        or spaceship.known_tiles[x][y] == Spaceship.tile_status.bulkhead_console_connected) then
          return spaceship
      end
    end
  end
end

--[[========================================================================================
Helper functions for spaceship states
]]
function Spaceship.is_on_own_surface(spaceship)
  return spaceship.own_surface_index and not spaceship.awaiting_requests
end

--[[========================================================================================
Helper functions for getting the surfaces a spaceship cares about.
]]
function Spaceship.get_own_surface(spaceship)
  return game.surfaces["spaceship-"..spaceship.index]
end

function Spaceship.get_current_surface(spaceship)
  if spaceship.zone_index then
    local zone = Zone.from_zone_index(spaceship.zone_index)
    if zone then
      return Zone.get_make_surface(zone)
    end
  end
  return Spaceship.get_own_surface(spaceship)
end

--[[
Computes the spaceship integrity limit for a force.
]]
function Spaceship.get_integrity_limit(force)
  local integrity = Spaceship.integrity_base
  for _, tech_branch in pairs(Spaceship.names_tech_integrity) do
    local i = 1
    while i > 0 do
      local tech = force.technologies[tech_branch.name.."-"..i]
      if (not tech) and i == 1 then
        tech = force.technologies[tech_branch.name]
      end
      if not tech then
        i = -1
      else
        local levels = tech.level - tech.prototype.level + (tech.researched and 1 or 0)
        integrity = integrity + levels * tech_branch.bonus_per_level
        i = i + 1
      end
    end
  end
  return integrity
end

--[[
Computes the cost (in fuel) of launching a spaceship from its current surface.
]]
function Spaceship.get_launch_energy_cost(spaceship)
  if spaceship.zone_index and spaceship.integrity_stress then
    local zone = Zone.from_zone_index(spaceship.zone_index)
    if zone then
      if Zone.is_space(zone) then
        return 250 * spaceship.integrity_stress * Spaceship.energy_per_launch_integrity_delta_v
      end
      local delta_v = Zone.get_launch_delta_v(zone)
      local energy_cost = delta_v * spaceship.integrity_stress * Spaceship.energy_per_launch_integrity_delta_v
      return energy_cost
    end
  end
end

--- Computes and returns the launch energy needed for a spaceship. Also stores the value in spaceship.launch_energy
--- Returns reference to all the tanks used to make the calculation
---@param spaceship Spaceship spaceship data
function Spaceship.get_compute_launch_energy(spaceship)
  spaceship.launch_energy = nil
  local tanks = nil
  local zone
  if spaceship.zone_index then
    zone = Zone.from_zone_index(spaceship.zone_index)
  end
  if spaceship.zone_index and spaceship.console and spaceship.console.valid and spaceship.known_tiles then
    spaceship.launch_energy = 0
    local surface = spaceship.console.surface
    tanks = surface.find_entities_filtered{name = Spaceship.names_booster_tanks, area = spaceship.known_bounds}
    for _, tank in pairs(tanks) do
      local tank_x = math.floor(tank.position.x)
      local tank_y = math.floor(tank.position.y)

      if spaceship.known_tiles[tank_x] and spaceship.known_tiles[tank_x][tank_y]
        and spaceship.known_tiles[tank_x][tank_y] == Spaceship.tile_status.floor_console_connected
        and #tank.fluidbox > 0 then
          local fluidbox = tank.fluidbox[1] or {amount = 0}
          if fluidbox.amount > 0 then
            if zone and Zone.is_space(zone) and fluidbox.name == "se-ion-stream" then
              spaceship.launch_energy = spaceship.launch_energy + fluidbox.amount * Spaceship.ion_stream_energy
            else
              spaceship.launch_energy = spaceship.launch_energy + fluidbox.amount * game.fluid_prototypes[fluidbox.name].fuel_value
            end
          end
      end
    end
  end
  return spaceship.launch_energy, tanks
end

function Spaceship.get_console_or_middle_position(spaceship)
  if spaceship.console and spaceship.console.valid then
    return spaceship.console.position
  end
  if spaceship.known_tiles_average_x and spaceship.known_tiles_average_y then
    return {x = spaceship.known_tiles_average_x, y = spaceship.known_tiles_average_y}
  end
end

function Spaceship.get_boarding_position(spaceship)
  if spaceship.known_tiles_average_x and spaceship.known_bounds then
    return {
      x = spaceship.known_bounds.left_top.x + math.random() * (spaceship.known_bounds.right_bottom.x - spaceship.known_bounds.left_top.x),
      y = spaceship.known_bounds.right_bottom.y + 32
    }
  end
  if spaceship.console and spaceship.console.valid then
    return Util.vectors_add(spaceship.console.position, {x = 64 * ( math.random() - 0.5), y = 64})
  end
end

function Spaceship.destroy(spaceship)
  if spaceship.zone_index or not Spaceship.is_on_own_surface(spaceship) then -- don't remove the whole surface if in space
    global.spaceships[spaceship.index]  = nil
    spaceship.valid = false

    -- if a player has this gui open then close it
    local gui_name = SpaceshipGUI.name_spaceship_gui_root
    for _, player in pairs(game.connected_players) do
      local root = player.gui.left[gui_name]
      if root and root.tags and root.tags.index == spaceship.index then
        root.destroy()
      end
    end
    if spaceship.own_surface_index then
      game.delete_surface(spaceship.own_surface_index)
      spaceship.own_surface_index = nil
    end

    -- make sure that history references to this spaceship are cleaned up
    for _, player in pairs(game.players) do
      RemoteView.make_history_valid(player)
    end
  end
end

--[[========================================================================================
Helper functions for getting information about a spaceship's target destination
]]
function Spaceship.get_destination_zone(spaceship)
  if spaceship.destination then
    if spaceship.destination.type == "spaceship" then
      return Spaceship.from_index(spaceship.destination.index)
    else
      return Zone.from_zone_index(spaceship.destination.index)
    end
  end
end

function Spaceship.is_near_destination(spaceship)
  if spaceship.near then
    if not spaceship.destination then
      return true
    elseif spaceship.near.type == spaceship.destination.type
     and spaceship.near.index == spaceship.destination.index then
       return true
    end
  end
  return false
end

function Spaceship.is_at_destination(spaceship)
  if spaceship.destination and spaceship.destination.type ~= "spaceship" and spaceship.zone_index and spaceship.zone_index == spaceship.destination.index then
     return true
  end
  return false
end

--- Gets or makes the spaceship's own surface
---@param spaceship Spaceship spaceship data
function Spaceship.get_make_spaceship_surface(spaceship)
  local current_surface = spaceship.console.surface
  local ship_surface
  if spaceship.own_surface_index then
    ship_surface = game.surfaces["spaceship-" .. spaceship.index]
  end
  if not ship_surface then
    local map_gen_settings = {
      autoplace_controls = {
        ["planet-size"] = { frequency = 1/1000, size = 1 }
      }
    }
    map_gen_settings.autoplace_settings={
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
    ship_surface = game.create_surface("spaceship-"..spaceship.index, map_gen_settings)

    ship_surface.freeze_daytime = true
    ship_surface.daytime = 0.4 -- dark but not midnight
    spaceship.own_surface_index = ship_surface.index
  end
  if not ship_surface then
    game.print("Error creating ship surface")
  elseif current_surface == ship_surface then
    Log.trace("Same surface")
  end
  return ship_surface
end

--- Launch a spaceship
---@param spaceship Spaceship the spaceship data
function Spaceship.launch(spaceship)
  if not spaceship.is_launching then Log.trace("Abort launch not is_launching") return end

  local automated_launch = spaceship.is_launching_automatically
  spaceship.is_launching = false
  spaceship.is_launching_automatically = false

  if not spaceship.zone_index then Log.trace("Abort launch no zone_index") return end
  if not spaceship.integrity_valid then Log.trace("Abort launch not integrity_valid") return end
  if not spaceship.known_tiles then Log.trace("Abort launch not known_tiles") return end
  if not spaceship.console and spaceship.console.valid then Log.trace("Abort launch not known_tiles") return end

  local current_surface = spaceship.console.surface
  local current_zone = Zone.from_surface(current_surface)

  local required_energy = Spaceship.get_launch_energy_cost(spaceship)
  local _, tanks = Spaceship.get_compute_launch_energy(spaceship)
  if not (required_energy and spaceship.launch_energy and spaceship.launch_energy >= required_energy) then return end

  -- point of no return
  log("spaceship launch start")
  local ship_surface = Spaceship.get_make_spaceship_surface(spaceship)

  local linked_containers = current_surface.find_entities_filtered{
    area=spaceship.known_bounds,
    type="linked-container"
  }
  for _, linked_container in pairs(linked_containers) do
    linked_container.link_id = 0
  end

  local valid_tanks = {}
  local valid_tank_fuel = {}
  local valid_tank_energy_per_fuel = {}
  local total_energy = 0
  local zone = Zone.from_zone_index(spaceship.zone_index)
  for _, tank in pairs(tanks) do
    local tank_x = math.floor(tank.position.x)
    local tank_y = math.floor(tank.position.y)

    if spaceship.known_tiles[tank_x] and spaceship.known_tiles[tank_x][tank_y]
      and spaceship.known_tiles[tank_x][tank_y] == Spaceship.tile_status.floor_console_connected
      and #tank.fluidbox > 0 then
        local fluidbox = tank.fluidbox[1] or {amount = 0}
        if fluidbox.amount > 0 and required_energy > 0 then
          local amount = fluidbox.amount
          local energy_per_fuel = (Zone.is_space(zone) and fluidbox.name == "se-ion-stream") and Spaceship.ion_stream_energy or game.fluid_prototypes[fluidbox.name].fuel_value
          table.insert(valid_tanks, tank)
          table.insert(valid_tank_fuel, fluidbox.amount)
          table.insert(valid_tank_energy_per_fuel, energy_per_fuel)
          total_energy = total_energy + amount * energy_per_fuel
        end
    end
  end

  for i, tank in pairs(valid_tanks) do
    local consume = math.ceil(math.min(valid_tank_fuel[i], required_energy / total_energy * valid_tank_fuel[i]))
    required_energy = required_energy - consume * valid_tank_energy_per_fuel[i]
    total_energy = total_energy - consume * valid_tank_energy_per_fuel[i]
    local fluidbox = tank.fluidbox[1] or {amount = 0}
    fluidbox.amount = fluidbox.amount - consume
    if fluidbox.amount > 0 then
      tank.fluidbox[1] = fluidbox
    else
      tank.fluidbox[1] = nil
    end
  end

  -- set the ship's location to the new statuses
  spaceship.near = {type="zone", index= spaceship.zone_index}
  spaceship.stopped = true
  spaceship.zone_index = nil
  spaceship.near_star = Zone.get_star_from_child(current_zone) or Zone.get_star_from_position(spaceship)
  Spaceship.set_light(spaceship, ship_surface)

  -- start generating chunks at the destination
  spaceship.requests_made = SpaceshipClone.enqueue_generate_clone_to_area(spaceship, current_surface, ship_surface, {dx=0,dy=0})

  if automated_launch then
    -- await chunk generation before completing the launch
    spaceship.await_start_tick = game.tick
    spaceship.awaiting_requests = true
    spaceship.clone_params = {
      clone_from = current_surface,
      clone_to = ship_surface,
      clone_delta = {dx=0,dy=0}
    }
  else
    -- immediate launch
    SpaceshipClone.clone(spaceship, current_surface, ship_surface, {dx=0,dy=0})
  end
  log("spaceship launch end")
end

--- Land a spaceship
---@param spaceship Spaceship spaceship data
---@param position any the position at which to land
---@param ignore_average any if we are cloning based on the corner of the ship or its center
function Spaceship.land_at_position(spaceship, position, ignore_average)
  if not (Spaceship.is_on_own_surface(spaceship) and spaceship.near and spaceship.near.type == "zone" and spaceship.known_tiles) then return end
  local destination_zone = Zone.from_zone_index(spaceship.near.index)
  if not destination_zone then return end

  local ship_surface = game.surfaces["spaceship-" .. spaceship.index]
  local target_surface = Zone.get_make_surface(destination_zone)

  local offset_x = util.to_rail_grid(position.x - spaceship.known_tiles_average_x)
  local offset_y = util.to_rail_grid(position.y - spaceship.known_tiles_average_y)
  if ignore_average then
    offset_x = util.to_rail_grid(position.x)
    offset_y = util.to_rail_grid(position.y)
  end

  local destination_area = {
    left_top = {
      x = spaceship.known_bounds.left_top.x + offset_x,
      y = spaceship.known_bounds.left_top.y + offset_y
    },
    right_bottom = {
      x = spaceship.known_bounds.right_bottom.x + offset_x,
      y = spaceship.known_bounds.right_bottom.y + offset_y
    },
  }
  local dont_land_on = table.deepcopy(Ancient.vault_entrance_structures)
  table.insert(dont_land_on, Ancient.name_gate_blocker)
  table.insert(dont_land_on, Ancient.name_gate_blocker_void)
  for name, stuff in pairs(Ancient.gate_fragments) do
    table.insert(dont_land_on, name)
  end
  if target_surface.count_entities_filtered{name = dont_land_on, area = destination_area} > 0 then
    ship_surface.print({"cant-build-reason.entity-in-the-way", {"space-exploration.ruin"}})
    return
  end

  local landing_area_entities = {}
  for x = spaceship.known_bounds.left_top.x, spaceship.known_bounds.right_bottom.x do
    for y = spaceship.known_bounds.left_top.y, spaceship.known_bounds.right_bottom.y do
      if spaceship.known_tiles[x] and spaceship.known_tiles[x][y] and
        (spaceship.known_tiles[x][y] == Spaceship.tile_status.floor_console_connected
        or spaceship.known_tiles[x][y] == Spaceship.tile_status.bulkhead_console_connected) then
          local area = {
            left_top={
              x=x + offset_x,
              y=y + offset_y},
            right_bottom={
              x=x+31/32 + offset_x,
              y=y+31/32 + offset_y}}
          local entities = target_surface.find_entities_filtered{ area = area }
          for _, entity in pairs(entities) do
            if entity.force.name ~= "neutral" and entity.type ~= "entity-ghost" and entity.type ~= "tile-ghost"
              and entity.type ~= "logistic-robot" and entity.type ~= "construction-robot" and entity.type ~= "deconstructible-tile-proxy" then
              ship_surface.print({"cant-build-reason.entity-in-the-way", {"entity-name."..entity.name}})
              return
            end
            table.insert(landing_area_entities, entity)
          end
      end
    end
  end

  -- point of no return
  log('spaceship land start')
  Spaceship.deactivate_engines(spaceship)

  local linked_containers = ship_surface.find_entities_filtered{
    area=spaceship.known_bounds,
    type="linked-container"
  }
  for _, linked_container in pairs(linked_containers) do
    linked_container.link_id = 0
  end

  Spaceship.destroy_all_smoke_triggers(ship_surface)
  SpaceshipObstacles.destroy(spaceship, ship_surface) -- destroy all the obstacles on the ship's surface
  Zone.apply_markers(destination_zone) -- in case the surface exists

  -- clear the target area
  for _, entity in pairs(landing_area_entities) do
    if entity.valid then
      if entity.type == "character" then
        entity.health = entity.health * 0.1
      else
        util.safe_destroy(entity)-- maybe use die?
      end
    end
  end

  -- request chunk generation at destination and then immediately land there
  local clone_delta = {dx=offset_x,dy=offset_y}
  SpaceshipClone.enqueue_generate_clone_to_area(spaceship, ship_surface, target_surface, clone_delta)
  SpaceshipClone.clone(spaceship, ship_surface, target_surface, clone_delta, Spaceship.post_land_at_position)
  log('spaceship land end')
end

--- Finishes landing the spaceship after the cloning procedure finishes
---@param spaceship any
---@param clone_from any
---@param clone_to any
---@param clone_delta any
function Spaceship.post_land_at_position(spaceship, clone_from, clone_to, clone_delta)
  -- move non-character players before deleting the surface the ship was on
  for _, player in pairs(game.connected_players) do
    if player.surface == clone_from then
      player.teleport({
        x = player.position.x + clone_delta.dx,
        y = player.position.y + clone_delta.dy
      }, clone_to)
      RemoteView.gui_update(player)
    end
  end
  game.delete_surface(clone_from)

    -- set the ship's location to the new statuses
  spaceship.own_surface_index = nil
  spaceship.particles = {}
  spaceship.mineables = {}
  spaceship.zone_index = spaceship.near.index
  spaceship.near = nil
  spaceship.stopped = true
  spaceship.is_moving = false
  spaceship.speed = 0
end

--- Decrements the number of requests being waited upon for a spaceship surface transfer whenever a chunk is generated
---@param event any
function Spaceship.on_chunk_generated(event)
  if event.surface and string.find(event.surface.name, "spaceship-") then
    for _, spaceship in pairs(global.spaceships) do
      if spaceship.clone_params and spaceship.requests_made and spaceship.clone_params.clone_to == event.surface then
        spaceship.requests_made = spaceship.requests_made - 1
      end
    end
  end
end
Event.addListener(defines.events.on_chunk_generated, Spaceship.on_chunk_generated)

--- Determines the rectangles necessary to somewhat quickly draw an image of the spaceship
--- that this player is anchor scouting. Necessary because drawing each individual tile
--- as a separate rectangle lags the game.
---@param player any
---@param spaceship Spaceship spaceship data
function Spaceship.get_make_anchor_scouting_cache(player, spaceship)
  local playerdata = get_make_playerdata(player)
  if not playerdata.anchor_scouting_cache then
    playerdata.anchor_scouting_cache = {}

    if spaceship.known_tiles and spaceship.known_bounds then
      local aabb
      for x = spaceship.known_bounds.left_top.x, spaceship.known_bounds.right_bottom.x do
        for y = spaceship.known_bounds.left_top.y, spaceship.known_bounds.right_bottom.y do
          local value = spaceship.known_tiles[x] and spaceship.known_tiles[x][y]
          if value == Spaceship.tile_status.floor_console_connected
          or value == Spaceship.tile_status.bulkhead_console_connected then
            if not aabb then
               aabb = {min_x=x,max_x=x+1,min_y=y,max_y=y+1}
            else
              aabb.max_y = aabb.max_y + 1
            end
          else
            if aabb then
              table.insert(playerdata.anchor_scouting_cache, aabb)
              aabb = nil
            end
          end
        end
        if aabb then
          table.insert(playerdata.anchor_scouting_cache, aabb)
          aabb = nil
        end
      end
    end
  end
  return playerdata.anchor_scouting_cache
end

--- While anchoring scouting we need to draw rectangles at the position the ship would land
--- if the player were to confirm the landing location
---@param player any
---@param spaceship Spaceship spaceship data
function Spaceship.anchor_scouting_tick(player, spaceship)
  local anchor_scouting_cache = Spaceship.get_make_anchor_scouting_cache(player, spaceship)
  if anchor_scouting_cache then
    local offset_x = util.to_rail_grid(player.position.x - spaceship.known_tiles_average_x)
    local offset_y = util.to_rail_grid(player.position.y - spaceship.known_tiles_average_y)
    for _, aabb in pairs(anchor_scouting_cache) do
      rendering.draw_rectangle{
        color = {r = 0.125, g = 0.125, b = 0, a = 0.01},
          filled = true,
          left_top = {x=aabb.min_x+offset_x,y=aabb.min_y+offset_y},
          right_bottom = {x=aabb.max_x+offset_x,y=aabb.max_y+offset_y},
          surface = player.surface,
          time_to_live = Spaceship.tick_interval_anchor + 1, -- tll must be 1 greater than the interval at which we draw to not flicker
      }
    end
  end
end

--- Starts anchor scouting at the location the spaceship is currently at
---@param spaceship Spaceship spaceship data
---@param player any
function Spaceship.start_anchor_scouting(spaceship, player)
  if not spaceship.near and spaceship.near.type == "zone" then return end
  local zone = Zone.from_zone_index(spaceship.near.index)
  if not zone then return end

  local playerdata = get_make_playerdata(player)
  -- enter remote view
  playerdata.anchor_scouting_for_spaceship_index = spaceship.index

  local character = player.character
  if character then
    playerdata.character = character
  end
  player.set_controller{type = defines.controllers.ghost}
  --player.set_controller{type = defines.controllers.spectator}

  if character then
    -- stop the character from continuing input action (running to doom)
    character.walking_state = {walking = false, direction = defines.direction.south}
    character.riding_state = {acceleration = defines.riding.acceleration.braking, direction = defines.riding.direction.straight}
    character.shooting_state = {state = defines.shooting.not_shooting, position=character.position}
  end

  local surface = Zone.get_make_surface(zone)
  local position = {x=0,y=0}
  if playerdata.surface_positions and playerdata.surface_positions[surface.index] then
    position = playerdata.surface_positions[surface.index]
  end

  player.teleport(position, surface)

end

--- Stops any in progress anchor scouting for the given player
---@param player any
function Spaceship.stop_anchor_scouting(player)
  local playerdata = get_make_playerdata(player)
  if playerdata.anchor_scouting_for_spaceship_index then
    playerdata.anchor_scouting_for_spaceship_index = nil
    if playerdata.remote_view_active then
      local surface = player.surface
      local position = player.position
      RemoteView.stop(player)
      RemoteView.start(player)
      player.teleport(position, surface)
    else
      if playerdata.character and playerdata.character.valid then
        player.teleport(playerdata.character.position, playerdata.character.surface)
        player.set_controller{type = defines.controllers.character, character = playerdata.character}
      elseif not player.character then
        Respawn.die(player)
      end
    end
  end
  playerdata.anchor_scouting_cache = nil
end

--- When an equipment grid is changed, we have to recalculate integrity costs
---@param event any
function Spaceship.on_equipment_grid_changed(event)
  local player = game.players[event.player_index]
  local spaceship = Spaceship.from_own_surface_index(player.surface.index)
  if spaceship then
    Spaceship.start_integrity_check(spaceship)
  end
end
Event.addListener(defines.events.on_player_placed_equipment, Spaceship.on_equipment_grid_changed)
Event.addListener(defines.events.on_player_removed_equipment, Spaceship.on_equipment_grid_changed)

function Spaceship.on_entity_created(event)
  local entity
  if event.entity and event.entity.valid then
    entity = event.entity
  end
  if event.created_entity and event.created_entity.valid then
    entity = event.created_entity
  end
  if not entity then return end
  if entity.type == "entity-ghost" or entity.type == "tile-ghost" then return end

  local surface = entity.surface

  local spaceship = Spaceship.from_own_surface_index(entity.surface.index)
  if spaceship and not spaceship.is_cloning then
    Spaceship.start_integrity_check(spaceship)
  end

  for _, name in pairs(Spaceship.names_engines) do
    if entity.name == name then
      if spaceship and spaceship.is_moving then
      -- sets smoke
        Spaceship.find_own_surface_engines(spaceship)
      else
        entity.active = false
      end
    end
  end

  if entity.name == Spaceship.name_spaceship_console then
    global.spaceships = global.spaceships or {}
    local console = entity

    if spaceship then
      if not (spaceship.console and spaceship.console.valid) then
        spaceship.console = entity
        spaceship.console_output = nil

        if event.player_index and game.players[event.player_index] then
          SpaceshipGUI.gui_open(game.players[event.player_index], spaceship)
        end

        Spaceship.start_integrity_check(spaceship, 0.1)
      end
    else
      local zone = Zone.from_surface(entity.surface)
      if not zone then
        entity.surface.create_entity{
          name = "item-on-ground",
          position = entity.position,
          ["item-entity"] = {name = Spaceship.name_spaceship_console, count = 1}
        }
        entity.destroy()
        game.print({"space-exploration.construction-denied-se-surface"})
        return
      end
      local fn = entity.force.name

      local spaceship_index = global.next_spaceship_index or 1
      global.next_spaceship_index = spaceship_index + 1

      local available_names = {}
      for _, name in pairs(Spaceship.names) do
        local found = false
        for _, spaceship in pairs(global.spaceships) do
          if name == spaceship.name then
            found = true
            break
          end
        end
        if not found then
          table.insert(available_names, name)
        end
      end

      local name = "Spaceship " .. spaceship_index
      if #available_names > 0 then
        name = available_names[math.random(#available_names)]
      end

      local spaceship = {
        type = "spaceship",
        index = spaceship_index,
        valid = true,
        force_name = fn,
        unit_number = entity.unit_number,
        console = entity,
        name = name,
        zone_index = zone.index, -- this is dynamic and can be nil
        speed = 1,
        destination_zone_index = zone.index,
        space_distortion = Zone.get_space_distortion(zone),
        stellar_position = Zone.get_stellar_position(zone),
        star_gravity_well = Zone.get_star_gravity_well(zone),
        planet_gravity_well = Zone.get_planet_gravity_well(zone),
        near_stellar_object = Zone.get_stellar_object_from_child(zone),
      }
      global.spaceships[spaceship_index] = spaceship

      Spaceship.start_integrity_check(spaceship, 0.1)

      if event.player_index and game.players[event.player_index] then
        SpaceshipGUI.gui_open(game.players[event.player_index], spaceship)
      end
    end
  end
  if spaceship then
    Spaceship.check_integrity_stress(spaceship)
  end
end
Event.addListener(defines.events.on_built_entity, Spaceship.on_entity_created)
Event.addListener(defines.events.on_robot_built_entity, Spaceship.on_entity_created)
Event.addListener(defines.events.script_raised_built, Spaceship.on_entity_created)
Event.addListener(defines.events.script_raised_revive, Spaceship.on_entity_created)

function Spaceship.on_built_tile(event)
  local surface = game.surfaces[event.surface_index]
  if surface and string.find(surface.name, "spaceship-") then
    local spaceship = Spaceship.from_own_surface_index(surface.index)
    if not spaceship.is_cloning then
      Spaceship.check_integrity_stress(spaceship)
      Spaceship.start_integrity_check(spaceship)
    end
  end
end
Event.addListener(defines.events.on_player_built_tile, Spaceship.on_built_tile)
Event.addListener(defines.events.on_robot_built_tile, Spaceship.on_built_tile)

function Spaceship.on_removed_tile(event)
  local surface
  if event.player_index and game.players[event.player_index] and game.players[event.player_index].connected then
    surface = game.players[event.player_index].surface
  end
  if event.robot and event.robot.valid then
    surface = event.robot.surface
  end
  if surface and string.find(surface.name, "spaceship-") then
    local spaceship = Spaceship.from_own_surface_index(surface.index)
    if not spaceship.is_cloning then
      Spaceship.check_integrity_stress(spaceship)
      Spaceship.start_integrity_check(spaceship)
    end
  end
end
Event.addListener(defines.events.on_robot_mined_tile, Spaceship.on_removed_tile)
Event.addListener(defines.events.on_player_mined_tile, Spaceship.on_removed_tile)

function Spaceship.on_removed_entity(event)
  if event.entity and event.entity.valid then
    if event.entity.name == Spaceship.name_spaceship_console then
      local outputs = event.entity.surface.find_entities_filtered{name = Spaceship.name_spaceship_console_output, area = util.position_to_area(event.entity.position, 2)}
      for _, output in pairs(outputs) do
        output.destroy()
      end
    elseif event.entity.surface and Util.table_contains(Spaceship.names_spaceship_bulkheads, event.entity.name) then
      -- this check is *not* appropriate if we can have multiple spaceships on a spaceship surface
      -- when implementing multiple ships per spaceship surface, the way of handling not responding to events raised by cloning must be changed to work with that
      if string.find(event.entity.surface.name, "spaceship-") then
        local spaceship = Spaceship.from_own_surface_index(event.entity.surface.index)
        if not spaceship.is_cloning then
          spaceship.speed = spaceship.speed * 0.9
          Spaceship.check_integrity_stress(spaceship)
          Spaceship.start_integrity_check(spaceship)
        end
      end
    end
  end
end
Event.addListener(defines.events.on_entity_died, Spaceship.on_removed_entity)
Event.addListener(defines.events.on_robot_mined_entity, Spaceship.on_removed_entity)
Event.addListener(defines.events.on_player_mined_entity, Spaceship.on_removed_entity)
Event.addListener(defines.events.script_raised_destroy, Spaceship.on_removed_entity)

function Spaceship.get_distance_to_destination(spaceship)
  if (not spaceship.destination) or Spaceship.is_near_destination(spaceship) then
    return 0
  end

  local target_zone = Spaceship.get_destination_zone(spaceship)
  if target_zone then

    local destination_space_distorion = Zone.get_space_distortion(target_zone)
    local destination_stellar_position = Zone.get_stellar_position(target_zone)
    local destination_star_gravity_well = Zone.get_star_gravity_well(target_zone)
    local destination_planet_gravity_well = Zone.get_planet_gravity_well(target_zone)

    local distortion_distance = 0
    local interstellar_distance = 0
    local star_gravity_distance = 0
    local planet_gravity_distance = 0

    distortion_distance = math.abs(spaceship.space_distortion - destination_space_distorion)

    interstellar_distance = Util.vectors_delta_length(spaceship.stellar_position, destination_stellar_position)
    --if distortion_distance == 1 then
    if distortion_distance >= 1 or (spaceship.space_distortion == 1 and destination_space_distorion == 1) then
      interstellar_distance = 0
    end
    if interstellar_distance == 0 then
      -- same solar system
      star_gravity_distance = math.abs(spaceship.star_gravity_well - destination_star_gravity_well)
    else
      star_gravity_distance = spaceship.star_gravity_well + destination_star_gravity_well
    end

    if star_gravity_distance == 0 then
      -- same solar system
      planet_gravity_distance = math.abs(spaceship.planet_gravity_well - destination_planet_gravity_well)
    else
      planet_gravity_distance = spaceship.planet_gravity_well + destination_planet_gravity_well
    end

    if target_zone.type == "anomaly" and star_gravity_distance == 0 and planet_gravity_distance == 0 and distortion_distance > 0 then
      return math.random(Zone.travel_cost_space_distortion - 1000) * 4 + 1000
      -- actual distance calculation: return distortion_distance * Zone.travel_cost_space_distortion
    else
      return distortion_distance * Zone.travel_cost_space_distortion
      + interstellar_distance * Zone.travel_cost_interstellar
      + star_gravity_distance * Zone.travel_cost_star_gravity
      + planet_gravity_distance * Zone.travel_cost_planet_gravity
    end
  end
end

--- Finds the engines for this spaceship
---@param spaceship Spaceship
---@param start_position {x=int, y=int}
function Spaceship.get_space_behind(spaceship, start_position)
  -- spaceship must be on own surface
  local space_behind = math.huge
  if spaceship.known_tiles and spaceship.known_tiles[start_position.x] then
    -- there's no way this is efficient but it needs to be profiled to see if this actually
    -- meaningfully contributes to the UPS cost of ships (probably contributes more to integrity
    -- checks than anything else)
    for y = start_position.y, spaceship.known_bounds.right_bottom.y, 1 do
      if spaceship.known_tiles[start_position.x][y]
        and (spaceship.known_tiles[start_position.x][y] == Spaceship.tile_status.floor_console_connected
        or spaceship.known_tiles[start_position.x][y] == Spaceship.tile_status.bulkhead_console_connected) then
          space_behind = y - start_position.y
          break
      end
    end
  end
  return space_behind
end

---@param spaceship Spaceship the spaceship data
---@param engine Spaceship engine
function Spaceship.update_smoke(spaceship, engine)
  if engine.entity.active then
    if (not engine.smoke_trigger) and Spaceship.engines[engine.entity.name].smoke_trigger then
      engine.smoke_trigger = engine.entity.surface.create_entity{
        name = Spaceship.engines[engine.entity.name].smoke_trigger,
        position = {x = engine.entity.position.x, y = engine.entity.bounding_box.right_bottom.y}
      }
    end
  elseif engine.smoke_trigger and engine.smoke_trigger.valid then
    engine.smoke_trigger.destroy()
    engine.smoke_trigger = nil
  end
end

function Spaceship.destroy_all_smoke_triggers(surface)
  local smoke_triggers = surface.find_entities_filtered{
    type = "smoke-with-trigger",
    name = Spaceship.names_smoke_trigger
    -- do not restrict area,
  }
  for _, smoke_trigger in pairs(smoke_triggers) do
    smoke_trigger.destroy()
  end
end

--- Finds the engines for this spaceship
---@param spaceship Spaceship the spaceship data
function Spaceship.find_own_surface_engines(spaceship)
  spaceship.engines = nil
  local surface = Spaceship.get_own_surface(spaceship)
  if surface then
    Spaceship.destroy_all_smoke_triggers(surface)
  end
  if surface and spaceship.known_tiles and spaceship.known_bounds then
    spaceship.engines = {}
    local engines = surface.find_entities_filtered{
      name = Spaceship.names_engines,
      area = spaceship.known_bounds
    }
    local y_engines = {} -- thrust harmonics
    for _, entity in pairs(engines) do
      local efficiency = Spaceship.engine_efficiency_blocked
      local box = entity.bounding_box
      local engine_y_behind = math.floor(box.right_bottom.y) + 1
      local engine_x = math.floor((box.left_top.x + box.right_bottom.x)/2)
      local space_behind
      if entity.position.x % 1 < 0.25 or entity.position.x % 1 > 0.75 then
        -- 2-wide trail
        space_behind = math.min(
          Spaceship.get_space_behind(spaceship, {x = engine_x - 1, y = engine_y_behind}),
          Spaceship.get_space_behind(spaceship, {x = engine_x, y = engine_y_behind})
        )
      else
        -- 1-wide trail
        space_behind = Spaceship.get_space_behind(spaceship, {x = engine_x, y = engine_y_behind})
      end
      if space_behind < 0 then
        efficiency = Spaceship.engine_efficiency_unblocked
      else
        efficiency = 1-(1-Spaceship.engine_efficiency_blocked) / (space_behind + Spaceship.engine_efficiency_unblocked_taper) * Spaceship.engine_efficiency_unblocked_taper
      end
      efficiency = efficiency - Spaceship.engine_efficiency_side
      local engine =  {entity = entity, efficiency = efficiency}
      if not y_engines[engine_y_behind] then
        y_engines[engine_y_behind] = {left = engine, right = engine}
      else
        if entity.position.x < y_engines[engine_y_behind].left.entity.position.x then
           y_engines[engine_y_behind].left = engine
        end
        if entity.position.x > y_engines[engine_y_behind].right.entity.position.x then
           y_engines[engine_y_behind].right = engine
        end
      end
      table.insert(spaceship.engines, engine)
    end

     -- thrust harmonics
     -- the left-most and right-most engines get a bonus
     -- there is a 1% incentive to have engines on different Y values.
     -- You waste integrity building this way, but it means more interesting designs are penalised less by the forced grid.
    for y, left_right in pairs(y_engines) do
      left_right.left.efficiency = left_right.left.efficiency + Spaceship.engine_efficiency_side
      if left_right.left ~= left_right.right then
        left_right.right.efficiency = left_right.right.efficiency + Spaceship.engine_efficiency_side
      end
    end

    -- Show the result
    for _, engine in pairs(spaceship.engines) do
      engine.entity.surface.create_entity{
         name = "flying-text",
         position = util.vectors_add({x=0, y=1}, engine.entity.position),
         text = math.ceil(engine.efficiency*100).."%"
      }
      Spaceship.update_smoke(spaceship, engine)
    end
  end
end

--- Activates the engines on this spaceship
---@param spaceship Spaceship the spaceship data
function Spaceship.activate_engines(spaceship)
  if not spaceship.engines then
    Spaceship.find_own_surface_engines(spaceship)
  end
  if spaceship.engines then
    for _, engine in pairs(spaceship.engines) do
      if engine.entity and engine.entity.valid then
        engine.entity.active = true
        Spaceship.update_smoke(spaceship, engine)
      else
        spaceship.engines = nil
        Spaceship.activate_engines(spaceship)
        return
      end
    end
  end
end

--- Deactivates the engines on this spaceship
---@param spaceship Spaceship the spaceship data
function Spaceship.deactivate_engines(spaceship)
  if not spaceship.engines then
    Spaceship.find_own_surface_engines(spaceship)
  end
  if spaceship.engines then
    for _, engine in pairs(spaceship.engines) do
      if engine.smoke_trigger and engine.smoke_trigger.valid then
        engine.smoke_trigger.destroy()
        engine.smoke_trigger = nil
      end
      if engine.entity and engine.entity.valid then
        engine.entity.active = false
        Spaceship.update_smoke(spaceship, engine)
      else
        spaceship.engines = nil
        Spaceship.deactivate_engines(spaceship)
        return
      end
    end
  end
end

function Spaceship.surface_tick(spaceship, time_passed)
  -- actions that apply to maintaining a spaceship surface
  spaceship.speed = spaceship.speed or 0
  local surface = Spaceship.get_own_surface(spaceship)
  if spaceship.speed > 1 then
    surface.wind_orientation = 0.5
  end

  local speed_factor = SpaceshipObstacles.particle_speed_factor(spaceship.speed)
  surface.wind_speed = 0.01 + 0.005 * speed_factor

  -- floating characters
  if remote.interfaces["jetpack"] and remote.interfaces["jetpack"]["get_jetpacks"] then
    local jetpacks = remote.call("jetpack", "get_jetpacks", {surface_index = spaceship.own_surface_index})
    for _, jetpack in pairs(jetpacks) do
      jetpack.velocity.y = jetpack.velocity.y +
        0.000005 * time_passed * math.pow(spaceship.speed / Spaceship.speed_taper, Spaceship.particle_speed_power) * Spaceship.speed_taper
      if remote.interfaces["jetpack"]["set_velocity"] then
        remote.call("jetpack", "set_velocity", {unit_number = jetpack.unit_number, velocity = jetpack.velocity})
      end
    end
  end

  -- obstacles
  SpaceshipObstacles.tick_obstacles(spaceship, surface, time_passed)
end

--- Sets the lighting of a spaceship surface. This dictates both how bright the player's screen is and solar power
---@param spaceship Spaceship spaceship data
---@param surface LuaSurface the spaceship's surface
function Spaceship.set_light(spaceship, surface)
    -- expect 15 is the max, 10 + 5 planets but reduced start position
    local light_percent = Zone.get_solar(spaceship)

    surface.freeze_daytime = true

    if light_percent >= 0.5 then
      surface.daytime = 0.35 -- half light
      surface.solar_power_multiplier = Zone.solar_multiplier * light_percent * 2 -- x2 compensate for half light
    else
      surface.daytime = 0.45 - 0.2 * light_percent
      surface.solar_power_multiplier = Zone.solar_multiplier -- x2 compensate for half light max
      -- light_percent of 1 would be 0.35 (half-light),
      -- light_percent of 0 would be 0.45 (dark)
    end
end

function Spaceship.apply_engine_thust(spaceship, time_passed)
  -- Apply engines to speed.
  if spaceship.engines then
    for _, engine_table in pairs(spaceship.engines) do
      local engine = engine_table.entity
      if engine and engine.valid then
        if engine.active and engine.is_crafting() then
          for _, engine_proto in pairs(Spaceship.engines) do
            if engine.name == engine_proto.name then
              spaceship.speed = spaceship.speed
              + (spaceship.speed_multiplier or 1) * engine_table.efficiency * engine_proto.thrust
              * (engine.energy / engine_proto.max_energy) / (Spaceship.minimum_mass + spaceship.integrity_stress)
              * (Spaceship.speed_taper / (Spaceship.speed_taper + spaceship.speed))
              * time_passed
            end
          end
        end
      else
        spaceship.engines[_] = nil
      end
    end
  end

end

function Spaceship.apply_drag(spaceship, time_passed)
  -- space_drag from imperfect vacuum
  -- streamline 0 = 110.45
  -- streamline 1 = 181.25
  local drag = Spaceship.space_drag * (2 - (spaceship.streamline or 0)) * time_passed
  spaceship.speed = spaceship.speed * (1 - drag) + Spaceship.minimum_impulse

  -- brake
  if spaceship.target_speed and spaceship.speed > spaceship.target_speed then
    spaceship.speed = math.min(spaceship.speed, math.max(spaceship.target_speed + 1, spaceship.speed - 0.001 * time_passed))
    spaceship.speed = math.min(spaceship.speed, math.max(spaceship.target_speed + 0.5, spaceship.speed - (spaceship.speed + 0.5 - spaceship.target_speed) * (1 - math.pow(0.999, time_passed))))
  end
  spaceship.max_speed = math.max(spaceship.speed, spaceship.max_speed or 0)
end

--- Move away from the current planet
---@param spaceship Spaceship the spaceship
---@param travel_speed number speed at which to move
function Spaceship.move_from_planet(spaceship, travel_speed)
  spaceship.planet_gravity_well = math.max(0, spaceship.planet_gravity_well - travel_speed / Zone.travel_cost_planet_gravity)
  spaceship.travel_message = {"space-exploration.spaceship-travel-message-exiting-planet-gravity"}
end

--- Move away from the current star
---@param spaceship Spaceship the spaceship
---@param travel_speed number speed at which to move
function Spaceship.move_from_star(spaceship, travel_speed)
  spaceship.star_gravity_well = math.max(0, spaceship.star_gravity_well - travel_speed / Zone.travel_cost_star_gravity)
  spaceship.travel_message = {"space-exploration.spaceship-travel-message-exiting-star-gravity"}
end

--- Move towards a particular position in intestellar space
---@param spaceship Spaceship the spaceship
---@param travel_speed number speed at which to move
---@param destination_stellar_position Position the target location
function Spaceship.move_towards_interstellar_position(spaceship, travel_speed, destination_stellar_position)
  spaceship.near_stellar_object = nil
  spaceship.stellar_position = Util.move_to(spaceship.stellar_position, destination_stellar_position,
    travel_speed / Zone.travel_cost_interstellar)
  spaceship.travel_message = {"space-exploration.spaceship-travel-message-navigating-interstellar"}
end

--- Move towards a particular position in intestellar space instantly
---@param spaceship Spaceship the spaceship
---@param travel_speed number speed at which to move
---@param destination_stellar_position Position the target location
function Spaceship.move_instant_interstellar_position(spaceship, travel_speed, destination_stellar_position)
  spaceship.stellar_position = table.deepcopy(destination_stellar_position)
  spaceship.space_distortion = 1 - travel_speed / Zone.travel_cost_space_distortion
  spaceship.travel_message = {"space-exploration.spaceship-travel-message-spatial-distortions"}
end

--- Move towards the anomaly
---@param spaceship Spaceship the spaceship
---@param travel_speed number speed at which to move
---@param destination_space_distorion number the distortion of the target (does not have to be 1 / at the anomaly)
function Spaceship.move_to_anomaly(spaceship, travel_speed, destination_space_distorion)
  spaceship.near_stellar_object = nil
  local delta_space_distortion = destination_space_distorion - spaceship.space_distortion
  if delta_space_distortion == 0 then
    spaceship.near = table.deepcopy(spaceship.destination)
    spaceship.stopped = true
  else
    local space_distortion_travel = travel_speed / Zone.travel_cost_space_distortion
    -- step towards destination
    spaceship.space_distortion = spaceship.space_distortion
      + math.min(math.max(delta_space_distortion, -space_distortion_travel), space_distortion_travel)
    spaceship.travel_message = {"space-exploration.spaceship-travel-message-spatial-distortions"}
  end
end

--- Move away from the anomaly
---@param spaceship Spaceship the spaceship
---@param travel_speed number speed at which to move
function Spaceship.move_from_anomaly(spaceship, travel_speed)
  spaceship.space_distortion = spaceship.space_distortion - travel_speed / Zone.travel_cost_space_distortion
  spaceship.travel_message = {"space-exploration.spaceship-travel-message-spatial-distortions"}
end

--- Move the spaceship through space conventionally (i.e. no teleportation/spatial distortion)
---@param spaceship Spaceship the spaceship
---@param travel_speed number speed at which to move
---@param target_zone any
---@param destination_stellar_position any
---@param destination_star_gravity_well any
---@param destination_planet_gravity_well any
function Spaceship.move_conventional(spaceship, travel_speed, target_zone, destination_stellar_position, destination_star_gravity_well, destination_planet_gravity_well)
  local interstellar_distance = Util.vectors_delta_length(spaceship.stellar_position, destination_stellar_position)
  if interstellar_distance == 0 then -- same system
    if spaceship.type == "spaceship" then -- not needed on spaceship-lookahead
      spaceship.near_star = Zone.get_star_from_child(target_zone) or Zone.get_star_from_position(target_zone)
      spaceship.near_stellar_object = Zone.get_stellar_object_from_child(target_zone) or Zone.get_stellar_object_from_position(target_zone)
    end
    if spaceship.star_gravity_well == destination_star_gravity_well then -- same planet system
      if spaceship.planet_gravity_well == destination_planet_gravity_well then -- we're here
        spaceship.near = table.deepcopy(spaceship.destination)
        spaceship.stopped = true
      else
        local delta_planet_gravity = destination_planet_gravity_well - spaceship.planet_gravity_well
        local planet_gravity_travel = travel_speed / Zone.travel_cost_planet_gravity
        spaceship.planet_gravity_well = spaceship.planet_gravity_well
          + math.min(math.max(delta_planet_gravity, -planet_gravity_travel), planet_gravity_travel)
        spaceship.travel_message = {"space-exploration.spaceship-travel-message-navigating-planet-gravity"}
      end
    else
      if spaceship.planet_gravity_well > 0 then
        spaceship.planet_gravity_well = math.max(0, spaceship.planet_gravity_well - travel_speed / Zone.travel_cost_planet_gravity)
        spaceship.travel_message = {"space-exploration.spaceship-travel-message-exiting-planet-gravity"}
      else
        local delta_star_gravity = destination_star_gravity_well - spaceship.star_gravity_well
        local star_gravity_travel = travel_speed / Zone.travel_cost_star_gravity
        spaceship.star_gravity_well = spaceship.star_gravity_well
          + math.min(math.max(delta_star_gravity, -star_gravity_travel), star_gravity_travel)
        spaceship.travel_message = {"space-exploration.spaceship-travel-message-navigating-star-gravity"}
      end
    end
  else -- different systems
    if spaceship.planet_gravity_well > 0 then -- leave the planet gravity well
      Spaceship.move_from_planet(spaceship, travel_speed)
    elseif spaceship.star_gravity_well > 0 then -- leave the star gravity well
      Spaceship.move_from_star(spaceship, travel_speed)
    else -- match interstellar position
      Spaceship.move_towards_interstellar_position(spaceship, travel_speed, destination_stellar_position)
    end
  end
end

--- Moves the spaceship from its current position towards its destination
---@param spaceship Spaceship the spaceship
---@param time_passed number amount of time passed since the position of the spaceship was last updated
function Spaceship.move_to_destination(spaceship, time_passed)
  if not spaceship.destination then return end

  local target_zone = Spaceship.get_destination_zone(spaceship)
  if not target_zone then
    spaceship.destination = nil
    spaceship.travel_message = "No destination."
    Log.trace("Spaceship destination invalid")
    return
  end

  --Log.trace(game.tick .. " moving to destination.")
  -- move away from current zone
  if spaceship.near and not Spaceship.is_near_destination(spaceship) then
    --Log.trace(game.tick .. "Leaving zone.")
    spaceship.near = nil
    -- close any scouting views
    for _, player in pairs(game.connected_players) do
      local playerdata = get_make_playerdata(player)
      if playerdata.anchor_scouting_for_spaceship_index == spaceship.index then
        Spaceship.stop_anchor_scouting(player)
        player.print("Cannot anchor, spaceship has departed for a different destination.")
      end
    end
  end

  Spaceship.move_to_destination_basic(spaceship, target_zone, time_passed)

  local ship_surface = Spaceship.get_own_surface(spaceship)
  Spaceship.set_light(spaceship, ship_surface)
end

--- Moves a spaceship or spaceship
---@param spaceship Spaceship the spaceship or spaceship-lookahead
---@param target_zone Zone or Spaceship
---@param time_passed number amount of time passed since the position of the spaceship was last updated
function Spaceship.move_to_destination_basic(spaceship, target_zone, time_passed)

  -- step towards destination
  local travel_speed = spaceship.speed * Spaceship.travel_speed_multiplier * time_passed
  local destination_space_distorion = Zone.get_space_distortion(target_zone)
  local destination_stellar_position = Zone.get_stellar_position(target_zone)
  local destination_star_gravity_well = Zone.get_star_gravity_well(target_zone)
  local destination_planet_gravity_well = Zone.get_planet_gravity_well(target_zone)

  if destination_space_distorion == 1 then -- target is anomaly (or spaceship at anomaly)
    if spaceship.planet_gravity_well > 0 then -- leave the planet gravity well
      Spaceship.move_from_planet(spaceship, travel_speed)
    elseif spaceship.star_gravity_well > 0 then -- leave the star gravity well
      Spaceship.move_from_star(spaceship, travel_speed)
    else -- move towards the anomaly
      Spaceship.move_to_anomaly(spaceship, travel_speed, destination_space_distorion)
    end
  elseif spaceship.space_distortion == 1 then -- at the anomaly so the stellar position can be anywhere instantly
    Spaceship.move_instant_interstellar_position(spaceship, travel_speed, destination_stellar_position)
  elseif destination_space_distorion > 0 then -- target is spaceship on way to/from anomaly
    local interstellar_distance = Util.vectors_delta_length(spaceship.stellar_position, destination_stellar_position)
    if spaceship.planet_gravity_well > 0 then -- leave the planet gravity well
      Spaceship.move_from_planet(spaceship, travel_speed)
    elseif spaceship.star_gravity_well > 0 then -- leave the star gravity well
      Spaceship.move_from_star(spaceship, travel_speed)
    elseif interstellar_distance > 0 then -- match interstellar position
      Spaceship.move_towards_interstellar_position(spaceship, travel_speed, destination_stellar_position)
    else -- move towards the anomaly
      Spaceship.move_to_anomaly(spaceship, travel_speed, destination_space_distorion)
    end
  elseif spaceship.space_distortion > 0 then -- leaving the anomaly
    Spaceship.move_from_anomaly(spaceship, travel_speed)
  else -- conventional travel to planet/star/spaceship
    Spaceship.move_conventional(spaceship, travel_speed, target_zone, destination_stellar_position, destination_star_gravity_well, destination_planet_gravity_well)
  end

end

function Spaceship.spaceship_tick(spaceship)
  if not (spaceship.console and spaceship.console.valid) then
    spaceship.check_message= {"space-exploration.spaceship-check-message-no-console"}
    spaceship.integrity_valid = false
  end

  -- Pause inserters, workaround for https://forums.factorio.com/viewtopic.php?f=58&t=89035
  -- Note: production machines should NOT be included as some are supposed to be disabled on specific surfaces.
  if spaceship.entities_to_restore and spaceship.entities_to_restore_tick < game.tick then
    for _, storedState in pairs(spaceship.entities_to_restore) do
      if storedState.entity and storedState.entity.valid then
        storedState.entity.active = storedState.active
      end
    end
    spaceship.entities_to_restore = nil
  end

  if Spaceship.is_on_own_surface(spaceship) or (spaceship.console and spaceship.console.valid) then
    -- integrity check
    if spaceship.is_doing_check then
      if Spaceship.is_on_own_surface(spaceship) and spaceship.known_floor_tiles and not spaceship.is_doing_check_slowly then
        -- need to tick faster on bigger ships
        for i = 0, math.ceil(spaceship.known_floor_tiles / 1000) do
          -- tick once for each 1000 tiles
          if spaceship.is_doing_check then
            Spaceship.integrity_check_tick(spaceship)
          end
        end
      else
        Spaceship.integrity_check_tick(spaceship)
      end
    elseif spaceship.console and spaceship.console.valid and (game.tick + spaceship.console.unit_number) % (Spaceship.integrity_pulse_interval) == 0 and spaceship.console.energy > 0 then
      Spaceship.start_slow_integrity_check(spaceship)
    end

    if spaceship.console and spaceship.console.valid and (game.tick + spaceship.console.unit_number) % 60 == 0 then
      -- read signals
      local red = spaceship.console.get_circuit_network(defines.wire_type.red)
      local green = spaceship.console.get_circuit_network(defines.wire_type.green)

      -- set speed
      if spaceship.target_speed_source ~= "manual-override" then
        local signal_target_speed =  util.signal_from_wires(red, green, Spaceship.signal_for_speed)
        if signal_target_speed > 0 then
          spaceship.target_speed = signal_target_speed + 0.5
          spaceship.target_speed_source = "circuit"
        elseif signal_target_speed < 0 then
          spaceship.stopped = true
          spaceship.target_speed = nil
          spaceship.target_speed_source = "circuit"
        elseif not spaceship.stopped then
          -- 0 means use set targets
          local last_target_speed = spaceship.target_speed
          local asteroid_density = spaceship.asteroid_density or SpaceshipObstacles.default_asteroid_density
          if spaceship.future_asteroid_density and spaceship.future_asteroid_density > asteroid_density then
            asteroid_density = spaceship.future_asteroid_density
          end
          if asteroid_density == SpaceshipObstacles.default_asteroid_density then
            spaceship.target_speed = spaceship.target_speed_normal
            spaceship.target_speed_source = "normal"
          elseif asteroid_density == SpaceshipObstacles.asteroid_density_by_zone_type['asteroid-belt'] then
            spaceship.target_speed = spaceship.target_speed_belt or spaceship.target_speed_normal
            spaceship.target_speed_source = "asteroid-belt"
          elseif asteroid_density == SpaceshipObstacles.asteroid_density_by_zone_type['asteroid-field'] then
            spaceship.target_speed = spaceship.target_speed_field or spaceship.target_speed_belt or spaceship.target_speed_normal
            spaceship.target_speed_source = "asteroid-field"
          end
          -- target speed was set to nil which means the fields are empty and target speed should be unlimited
          if not spaceship.target_speed then
            if last_target_speed and spaceship.is_moving then Spaceship.activate_engines(spaceship) end -- if spaceship was being speed throttled then need to fire all engines now that it's unlimited (but only once)
            spaceship.target_speed_source = nil
          end
        end
      end

      -- set destination
      for signal_name, type in pairs(Zone.signal_to_zone_type) do
        local value = util.signal_from_wires(red, green, {type = "virtual", name = signal_name})
        if value > 0 then
          local zone = Zone.from_zone_index(value)
          if zone and zone.type == type then
            if Zone.is_visible_to_force(zone, spaceship.force_name) or global.debug_view_all_zones then
              if (not spaceship.destination) or (spaceship.destination.type == "zone" and spaceship.destination.index ~= value) then
                spaceship.destination = { type = "zone", index = value }
                Spaceship.update_output_combinator(spaceship)
              end
              break
            end
          end
        end
      end
      -- TODO: allow spacwhip as destination

      -- launch
      if not spaceship.own_surface_index and not spaceship.entities_to_restore then
        if (red and red.get_signal(Spaceship.signal_for_launch) > 0)
          or (green and green.get_signal(Spaceship.signal_for_launch) > 0) then
            spaceship.is_launching = true
            spaceship.is_launching_automatically = true
            spaceship.is_landing = false
            Spaceship.start_integrity_check(spaceship)
        end
      end

      -- land
      if Spaceship.is_on_own_surface(spaceship)
       and not spaceship.entities_to_restore
       and spaceship.destination
       and spaceship.destination.type == "zone"
       and Spaceship.is_near_destination(spaceship) then
        SpaceshipClamp.attempt_anchor_spaceship(spaceship, red, green)
      end

    end

    -- delayed launch (either until the number of waiting chunk requests is finished or a maximum delay is reached)
    if spaceship.awaiting_requests and (spaceship.requests_made <= 0 or (game.tick - spaceship.await_start_tick) >= Spaceship.tick_max_await) then
      local params = spaceship.clone_params
      SpaceshipClone.clone(spaceship, params.clone_from, params.clone_to, params.clone_delta)
      spaceship.awaiting_requests = false
      spaceship.clone_params = nil
    end

    -- don't upkeep the ship as if it is in-transit until it has actually cloned to the own_surface_index surface
    -- maybe use Spaceship.is_on_own_surface(spaceship) instead
    if spaceship.own_surface_index and not spaceship.awaiting_requests then
      -- space upkeep
      if game.tick % Spaceship.tick_interval_move == 0 then
        Spaceship.surface_tick(spaceship, Spaceship.tick_interval_move)
      end

      if spaceship.target_speed and spaceship.is_moving == false and spaceship.stopped then
        spaceship.stopped = false
      end

      -- this has to be done every tick for seamless movement
      local surface = Spaceship.get_own_surface(spaceship)
      SpaceshipObstacles.tick_entity_obstacles(spaceship, surface)

      -- navigation
      if spaceship.integrity_valid
        and spaceship.destination
        and not spaceship.stopped
        and not Spaceship.is_near_destination(spaceship) then
          -- wants to move and can move
          if not spaceship.is_moving then
            spaceship.is_moving = true
            Spaceship.activate_engines(spaceship)
            Spaceship.start_integrity_check(spaceship)
          end

          if (game.tick % 6) == 0 then
            if spaceship.target_speed and spaceship.is_moving and spaceship.engines then
              if spaceship.speed > spaceship.target_speed then
                for _, engine in pairs(spaceship.engines) do
                  if engine.entity.valid and math.random() < 1/table_size(spaceship.engines) then
                    engine.entity.active = false
                    Spaceship.update_smoke(spaceship, engine)
                  end
                end
              else
                for _, engine in pairs(spaceship.engines) do
                  if engine.entity.valid and math.random() < 1/table_size(spaceship.engines) then
                    engine.entity.active = true
                    Spaceship.update_smoke(spaceship, engine)
                  end
                end
              end
            end
          end

          if game.tick % Spaceship.tick_interval_move == 0 then
            Spaceship.apply_engine_thust(spaceship, Spaceship.tick_interval_move)
            Spaceship.apply_drag(spaceship, Spaceship.tick_interval_move)
            Spaceship.move_to_destination(spaceship, Spaceship.tick_interval_move)
          end
      else
        -- can't move
        if spaceship.is_moving then
          spaceship.is_moving = false
          Spaceship.deactivate_engines(spaceship)
        end
        if Spaceship.is_near_destination(spaceship) then
          spaceship.speed = 0
          spaceship.travel_message = {"space-exploration.spaceship-travel-message-at-destination"}
        end
        if spaceship.speed > 0 then
          local drag = Spaceship.space_drag * (2 - (spaceship.streamline or 0))
          spaceship.speed = math.max(0, spaceship.speed * (1 - Spaceship.space_drag) - (spaceship.stopped and 0.1 or 0.02))
        end
      end
    end


  else
    Spaceship.destroy(spaceship)
    return
  end

  if game.tick % 60 == 0 then
    Spaceship.update_output_combinator(spaceship)
  end

end

function Spaceship.update_output_combinator(spaceship)

  if not (spaceship.console and spaceship.console.valid) then return end
  if not (spaceship.console_output and spaceship.console_output.valid) then
    -- spawn the console output
    local console = spaceship.console
    local output_position = util.vectors_add(console.position, Spaceship.console_output_offset)
    local output = util.find_entity_or_revive_ghost(console.surface, Spaceship.name_spaceship_console_output, output_position)
    if not output then
      output = console.surface.create_entity{
        name = Spaceship.name_spaceship_console_output,
        position = util.vectors_add(console.position, Spaceship.console_output_offset),
        force = console.force
      }
    end
    spaceship.console_output = output
  end
  if spaceship.console_output and spaceship.console_output.valid then
    local ctrl = spaceship.console_output.get_or_create_control_behavior()

    local slot = 1
    -- Spaceship ID
    ctrl.set_signal(slot, {signal=Spaceship.signal_for_own_spaceship_id, count=spaceship.index})
    slot = slot + 1
    -- Speed
    if spaceship.is_moving and spaceship.speed > 0 then
      ctrl.set_signal(slot, {signal=Spaceship.signal_for_speed, count=math.max(1, spaceship.speed)})
    elseif Spaceship.is_on_own_surface(spaceship) then
      ctrl.set_signal(slot, {signal=Spaceship.signal_for_speed, count=-1}) -- stopped
    else
      ctrl.set_signal(slot, {signal=Spaceship.signal_for_speed, count=-2}) -- anchored
    end
    slot = slot + 1

    -- Distance
    if (not spaceship.distance_to_destination_tick) or spaceship.distance_to_destination_tick + 60 < game.tick then
      spaceship.distance_to_destination = Spaceship.get_distance_to_destination(spaceship)
      spaceship.distance_to_destination_tick = game.tick
    end

    if spaceship.destination and Spaceship.is_near_destination(spaceship) then
      ctrl.set_signal(slot, {signal=Spaceship.signal_for_distance, count=-1})
    elseif spaceship.destination and Spaceship.is_at_destination(spaceship)  then
      ctrl.set_signal(slot, {signal=Spaceship.signal_for_distance, count=-2})
    elseif spaceship.distance_to_destination and spaceship.distance_to_destination > 0 then
      ctrl.set_signal(slot, {signal=Spaceship.signal_for_distance, count=math.max(1, spaceship.distance_to_destination)})
    else --no destination
      ctrl.set_signal(slot, {signal=Spaceship.signal_for_distance, count=-3})
    end
    slot = slot + 1

    -- Destination
    if spaceship.destination then
      if spaceship.destination.type == "spaceship" then
        ctrl.set_signal(slot, {signal=Spaceship.signal_for_destination_spaceship, count=spaceship.destination.index})
      elseif spaceship.destination.type == "zone" then
        local zone = Spaceship.get_destination_zone(spaceship)
        local signal_name = Zone.get_signal_name(zone)
        ctrl.set_signal(slot, {signal={type="virtual", name=signal_name}, count=zone.index})
      else
        ctrl.set_signal(slot, {signal=Spaceship.signal_for_destination_spaceship, count=0})
      end
    else
      ctrl.set_signal(slot, {signal=Spaceship.signal_for_destination_spaceship, count=0})
    end
    slot = slot + 1

    -- Asteroid Density
    if spaceship.asteroid_density then
      ctrl.set_signal(slot, {signal={type = "virtual", name = "signal-D"}, count=spaceship.asteroid_density * 100})
    else
      ctrl.set_signal(slot, {signal={type = "virtual", name = "signal-D"}, count=SpaceshipObstacles.default_asteroid_density * 100})
    end
    slot = slot + 1

    -- Anchor (only change if the ship is not in the middle of launching)
    if not spaceship.awaiting_requests then
      if spaceship.zone_index then
        ctrl.set_signal(slot, {signal={type = "virtual", name = "signal-A"}, count=spaceship.zone_index})
      else
        ctrl.set_signal(slot, {signal={type = "virtual", name = "signal-A"}, count=0})
      end
      slot = slot + 1
    end
  end
end

--- Updates all spaceships, potentially launching/landing them or spawning/destroying/changing speed of obstacles
--- or updating their guis or updating anchor scoutin
---@param event any
function Spaceship.on_tick(event)
  -- update asteroid density
  for _, spaceship in pairs(global.spaceships) do
    if spaceship.console and spaceship.console.valid and Spaceship.is_on_own_surface(spaceship) then
      if (game.tick + spaceship.console.unit_number) % Spaceship.tick_interval_density == 0 then
        spaceship.asteroid_density = 0
        if spaceship.speed > 5 then
          local target_zone = Spaceship.get_destination_zone(spaceship)
          if target_zone then
            local spaceship_lookahead = {
              type = "spaceship-lookahead",
              speed = spaceship.speed,
              stellar_position = spaceship.stellar_position,
              space_distortion = spaceship.space_distortion,
              star_gravity_well = spaceship.star_gravity_well,
              planet_gravity_well = spaceship.planet_gravity_well,
            }
            Spaceship.move_to_destination_basic(spaceship_lookahead, target_zone, 5 * 60) -- 5 seconds
            spaceship.future_asteroid_density = SpaceshipObstacles.get_asteroid_density(spaceship_lookahead)
          end
        end
        spaceship.asteroid_density = SpaceshipObstacles.get_asteroid_density(spaceship)
      end
    end
  end

  -- update spaceships
  if global.spaceships then
    for _, spaceship in pairs(global.spaceships) do
      Spaceship.spaceship_tick(spaceship)
    end
  end

  -- update guis
  if game.tick % Spaceship.tick_interval_gui == 0 then
    for _, player in pairs(game.connected_players) do
      SpaceshipGUI.gui_update(player)
    end
  end

  -- update obstacles
  SpaceshipObstacles.tick_projectile_speeds()

  -- update anchoring
  if game.tick % Spaceship.tick_interval_anchor == 0 then
    for _, player in pairs(game.connected_players) do
      local playerdata = get_make_playerdata(player)
      if playerdata and playerdata.anchor_scouting_for_spaceship_index then
        Spaceship.anchor_scouting_tick(player, Spaceship.from_index(playerdata.anchor_scouting_for_spaceship_index))
      end
    end
  end
end
Event.addListener(defines.events.on_tick, Spaceship.on_tick)

--[[
function Spaceship.on_chunk_generated(event)
  local area = event.area
  local surface = event.surface
  local spaceship = Spaceship.from_own_surface_index(surface.index)
  if spaceship then
    area.right_bottom.x = area.right_bottom.x + 0.99
    area.right_bottom.y = area.right_bottom.y + 0.99
    entities = surface.find_entities_filtered{
      area = area
    }
    for _, entity in pairs(entities) do -- rocks
      entity.destroy()
    end
    local bad_tiles = surface.find_tiles_filtered{name={name_asteroid_tile, "out-of-map"}}
    local set_tiles = {}
    for _, tile in pairs(bad_tiles) do
      table.insert(set_tiles, {position = tile.position, name=name_space_tile})
      surface.set_hidden_tile(tile.position, name_space_tile)
    end
    surface.set_tiles(set_tiles)
  end
end
Event.addListener(defines.events.on_chunk_generated, Spaceship.on_chunk_generated)
]]--

function Spaceship.flash_tile(surface, position, color, time)
  local a = (color.a or 1)
  rendering.draw_rectangle{
    color = {r = color.r * a, g = color.g * a, b = color.b * a, a = a},
    filled = true,
    left_top = position,
    right_bottom = {(position.x or position[1])+1, (position.y or position[2])+1},
    surface = surface,
    time_to_live = time
  }
end

function Spaceship.calculate_integrity_stress(spaceship, area)

  spaceship.integrity_stress_structure = 0
  spaceship.integrity_stress_container = 0

  -- use all tiles for the cost even if they are not connected
  -- get walls for an integrity discount
  local surface = Spaceship.get_current_surface(spaceship)
  if not surface then surface = spaceship.console.surface end

  if not area then --- whole surface
    spaceship.tile_count = surface.count_tiles_filtered{name = Spaceship.names_spaceship_floors}
    spaceship.wall_count = surface.count_entities_filtered{name = Spaceship.names_spaceship_walls}
  else
    spaceship.tile_count = spaceship.known_floor_tiles + spaceship.known_bulkhead_tiles
    spaceship.wall_count = 0
    local walls = surface.find_entities_filtered{name = Spaceship.names_spaceship_walls, area = area}
    for _, wall in pairs(walls) do
      local tile_pos = Util.position_to_tile(wall.position)
      if spaceship.known_tiles[tile_pos.x] and spaceship.known_tiles[tile_pos.x][tile_pos.y] == Spaceship.tile_status.bulkhead_console_connected  then
        spaceship.wall_count = spaceship.wall_count + 1
      end
    end
  end

  -- Find weakpoints in the design
  -- If very narrow sections are used in the middle those are not strong,
  -- so we need to increase the cost not decrease it if it gets too narrow.
  -- Scan from front and back so decorative pointy bits are not a problem
  -- don't increase width in jump, follow the edge more loosely.
  -- phantom tiles start at the 50% reduced with mark.
  -- They should not have full effect immediatly.
  local widths = {}
  for x, x_tiles in pairs(spaceship.known_tiles) do
    for y, state in pairs(x_tiles) do
      if state == Spaceship.tile_status.floor_console_connected or state == Spaceship.tile_status.bulkhead_console_connected then
        widths[y] = (widths[y] or 0) + 1
      end
    end
  end
  local front_y = spaceship.known_bounds.left_top.y
  local back_y = spaceship.known_bounds.right_bottom.y

  local front_max_width = 0
  local back_max_width = 0

  local phantom_tiles = 0

  local widths_total = 0
  for _, width in pairs(widths) do
    widths_total = widths_total + width
  end
  local width_average = widths_total / table_size(widths)

  while front_y <= back_y do
    if front_max_width <= back_max_width then
      if widths[front_y] then
        local width = widths[front_y]
        if front_max_width < width then
          front_max_width = math.min(width, front_max_width + 2)
        end
        if width < front_max_width / 2 then
          -- tiles in more extreme hollows count more
          local hollow = (front_max_width / 2 - width)
          phantom_tiles = phantom_tiles + hollow * hollow / (front_max_width / 2)
        end
      end
      front_y = front_y + 1
    else
      if widths[back_y] then
        local width = widths[back_y]
        if back_max_width < width then
          back_max_width = math.min(width, back_max_width + 2)
        end
        if width < back_max_width / 2 then
          local hollow = (back_max_width / 2 - width)
          phantom_tiles = phantom_tiles + hollow * hollow / (front_max_width / 2)
        end
      end
      back_y = back_y - 1
    end
  end
  if phantom_tiles > 0 then
    Log.trace("phantom_tiles " .. phantom_tiles)
  end

  spaceship.container_slot_count = 0

  local containers = surface.find_entities_filtered{ type = {"container", "logistic-container", "car", "spider-vehicle", "locomotive", "cargo-wagon"}, area = area}

  for _, container in pairs(containers) do
    local tile_pos = Util.position_to_tile(container.position)
    if area == nil or (spaceship.known_tiles[tile_pos.x] and spaceship.known_tiles[tile_pos.x][tile_pos.y] == Spaceship.tile_status.floor_console_connected) then
      local container_size = container.prototype.get_inventory_size(defines.inventory.car_trunk) or (container.prototype.get_inventory_size(defines.inventory.chest) or 0)
      if container.type == "car" or container.type == "spider-vehicle" then
        spaceship.container_slot_count = spaceship.container_slot_count + container_size
      elseif container.type == "locomotive" or container.type == "cargo-wagon" then
        spaceship.container_slot_count = spaceship.container_slot_count + container_size / 10
      else
        spaceship.container_slot_count = spaceship.container_slot_count + container_size
      end
      if container.type == "car" or container.type == "spider-vehicle" or container.type == "locomotive" or container.type == "cargo-wagon" then
        if container.grid then
          local grid_usage = 0
          for _, equipment in pairs(container.grid.equipment) do
            if equipment and equipment.shape and equipment.shape.width and equipment.shape.height then
              grid_usage = grid_usage + equipment.shape.width * equipment.shape.height
            end
          end
          spaceship.integrity_stress_structure = spaceship.integrity_stress_structure + grid_usage
          spaceship.integrity_stress_container = spaceship.integrity_stress_container + grid_usage
        end
      end
    end
  end

  spaceship.container_fluid_capacity = 0

  local containers = surface.find_entities_filtered{type = {"storage-tank", "fluid-wagon"}, area = area}
  for _, container in pairs(containers) do
    if container.name ~= BigTurbine.name_big_turbine_tank and container.name ~= CondenserTurbine.name_condenser_turbine_tank and (not string.starts(container.name, "se-space-pipe")) then
      local mult = 2
      if container.type == "fluid-wagon" then
        mult = 0.1
      else
        if string.find(container.name, "booster", 1, true) then mult = 0.5 end
        if container.name == "storage-tank" then mult = 1 end
      end
      local tile_pos = Util.position_to_tile(container.position)
      if area == nil or (spaceship.known_tiles[tile_pos.x] and spaceship.known_tiles[tile_pos.x][tile_pos.y] == Spaceship.tile_status.floor_console_connected) then
        if container.fluidbox and #container.fluidbox > 0 then
          local i = 1
          for i = 1, #container.fluidbox do
            if container.fluidbox[1] and container.fluidbox[1].name == "steam" then
              spaceship.container_fluid_capacity = spaceship.container_fluid_capacity + 2 * mult * container.fluidbox.get_capacity(i)
            else
              spaceship.container_fluid_capacity = spaceship.container_fluid_capacity + mult * container.fluidbox.get_capacity(i)
            end
          end
        end
      end
    end
  end

  spaceship.speed_multiplier = 1

  -- name-based entity modifiers
  local names = {}
  local name_effects = {}
  for _, ia_name in pairs(Spaceship.integrity_affecting_names) do
    if ia_name.mod == nil or game.active_mods[ia_name.mod] then
      table.insert(names, ia_name.name)
      name_effects[ia_name.name] = ia_name
    end
  end
  local entities = surface.find_entities_filtered{name = names, area = area}
  for _, entity in pairs(entities) do
    local tile_pos = Util.position_to_tile(entity.position)
    if area == nil or (spaceship.known_tiles[tile_pos.x] and spaceship.known_tiles[tile_pos.x][tile_pos.y] == Spaceship.tile_status.floor_console_connected) then
      local name_effect_set = name_effects[entity.name]
      if name_effect_set.integrity_stress_container then
        spaceship.integrity_stress_container = spaceship.integrity_stress_container + name_effect_set.integrity_stress_container
      end
      if name_effect_set.integrity_stress_structure then
        spaceship.integrity_stress_structure = spaceship.integrity_stress_structure + name_effect_set.integrity_stress_structure
      end
      if name_effect_set.max_speed_multiplier then
        spaceship.speed_multiplier = math.min(spaceship.speed_multiplier, name_effect_set.max_speed_multiplier)
      end
    end
  end

  -- type-based entity modifiers
  local types = {}
  local type_effects = {}
  for _, ia_type in pairs(Spaceship.integrity_affecting_types) do
    if ia_type.mod == nil or game.active_mods[ia_type.mod] then
      table.insert(types, ia_type.type)
      type_effects[ia_type.type] = ia_type
    end
  end
  local entities = surface.find_entities_filtered{type = types, area = area}
  for _, entity in pairs(entities) do
    local tile_pos = Util.position_to_tile(entity.position)
    if area == nil or (spaceship.known_tiles[tile_pos.x] and spaceship.known_tiles[tile_pos.x][tile_pos.y] == Spaceship.tile_status.floor_console_connected) then
      local type_effect_set = type_effects[entity.type]
      if type_effect_set.integrity_stress_container then
        spaceship.integrity_stress_container = spaceship.integrity_stress_container + type_effect_set.integrity_stress_container
      end
      if type_effect_set.integrity_stress_structure then
        spaceship.integrity_stress_structure = spaceship.integrity_stress_structure + type_effect_set.integrity_stress_structure
      end
      if type_effect_set.max_speed_multiplier then
        spaceship.speed_multiplier = math.min(spaceship.speed_multiplier, type_effect_set.max_speed_multiplier)
      end
    end
  end

  -- container slot is 0.5 or 24 for a normal container 4800 ish items. Cost is 24
  -- container can caryy 48 * 10 barrels = 24k fluid
  -- storage tank is 5, 25k fluids = 250 effective items. Cost is 12.5 (50% discount)
  -- booster tanks cost50% less
  --Log.trace((spaceship.count_empty_tiles or 0) .." / "..(spaceship.tile_count - spaceship.wall_count))
  local empty_tiles = spaceship.count_empty_tiles or 0
  spaceship.integrity_stress_structure =
    spaceship.integrity_stress_structure
    + spaceship.tile_count
    + phantom_tiles * 0.25
    - spaceship.wall_count * 0.75

  spaceship.integrity_stress_container =
    spaceship.integrity_stress_container
    + spaceship.container_slot_count/2
    + spaceship.container_fluid_capacity / 2000

  -- if the ship is very long and thin start taking integrity penalties.
  local length = spaceship.known_bounds.right_bottom.y - spaceship.known_bounds.left_top.y
  -- over 4:1 length gets a penalty of 5% per additional length
  local integrity_multiplier = math.max(1, 1 + 0.05 * (length / width_average - 4))
  spaceship.integrity_stress_structure = spaceship.integrity_stress_structure * integrity_multiplier
  spaceship.integrity_stress_container = spaceship.integrity_stress_container

  -- corridor allowance
  spaceship.integrity_stress_structure_max = spaceship.integrity_stress_structure
  spaceship.integrity_stress_structure = spaceship.integrity_stress_structure_max
    -- this encourages keeping 10% of the tital size empty.
    - math.min(spaceship.tile_count * 0.1, empty_tiles)
    -- this encourages keeping 20% of the internal space empty.
    -- math.min((spaceship.tile_count - spaceship.wall_count) * 0.2, empty_tiles)
    -- this has the first empty tile discounted by 1, the last by 0, if 20% of the ship is empty they are discouted by 80%
    -- empty_tiles * math.max(0, 1 - empty_tiles / (spaceship.tile_count - spaceship.wall_count))

  spaceship.integrity_stress = math.max(spaceship.integrity_stress_structure, spaceship.integrity_stress_container)

  if spaceship.integrity_stress > spaceship.integrity_limit then
    spaceship.integrity_valid = false
    spaceship.check_message = {"space-exploration.spaceship-check-message-failed-stress"}
  end

end

function Spaceship.check_integrity_stress(spaceship)
  spaceship.integrity_limit = Spaceship.get_integrity_limit(game.forces[spaceship.force_name])
  if Spaceship.is_on_own_surface(spaceship) then
    -- use all tiles
    Spaceship.calculate_integrity_stress(spaceship, nil) -- whole area
  elseif not (spaceship.console and spaceship.console.valid) then
    spaceship.integrity_valid = false
    spaceship.check_message= {"space-exploration.spaceship-check-message-no-console"}
  elseif not spaceship.integrity_valid then
    -- already invalid
  elseif not spaceship.known_bounds then
    spaceship.integrity_valid = false
    spaceship.check_message= {"space-exploration.spaceship-check-message-failed-unknown-bounds"}
  elseif spaceship.integrity_valid and spaceship.known_bounds and spaceship.known_tiles then
    Spaceship.calculate_integrity_stress(spaceship, spaceship.known_bounds) -- limited area

    --[[ TODO: use improved know tiles approach
    and spaceship.known_tile_count and spaceship.known_wall_count then
    spaceship.integrity_stress = spaceship.known_tile_count - spaceship.known_wall_count / 2
    if spaceship.integrity_stress > spaceship.integrity_limit then
      spaceship.integrity_valid = false
      spaceship.check_message = "Fail: Structural integrity stress exceeds technology limit."
    end
    ]]--
  end

end

function Spaceship.start_slow_integrity_check(spaceship, alpha)
  spaceship.is_doing_check_slowly = true
  Spaceship.start_integrity_check(spaceship, alpha)
end

function Spaceship.start_integrity_check(spaceship, alpha)
  if alpha then
    spaceship.check_flash_alpha = alpha
  end
  spaceship.is_doing_check = true
end

function Spaceship.stop_integrity_check(spaceship)
  spaceship.check_flash_alpha = nil
  spaceship.is_doing_check = nil
  spaceship.is_doing_check_slowly = nil
  spaceship.check_stage = nil
  spaceship.pending_tiles = nil
  spaceship.streamline = nil
  if spaceship.integrity_valid and spaceship.check_tiles then
    -- success
    spaceship.count_empty_tiles = spaceship.check_count_empty_tiles
    spaceship.check_count_empty_tiles = nil

    spaceship.known_tiles = table.deepcopy(spaceship.check_tiles)
    spaceship.check_tiles = nil

    -- get the average for surface transfer
    local min_x = nil
    local max_x = nil
    local min_y = nil
    local max_y = nil
    local floor_tiles = 0
    local bulkhead_tiles = 0
    local front_tiles = {} -- x:y
    for x, x_tiles in pairs(spaceship.known_tiles) do
      if min_x == nil or x < min_x then min_x = x end
      if max_x == nil or x > max_x then max_x = x end
      for y, status in pairs(x_tiles) do
        if status == Spaceship.tile_status.floor_console_connected
          or status == Spaceship.tile_status.bulkhead_console_connected then
            if min_y == nil or y < min_y then min_y = y end
            if max_y == nil or y > max_y then max_y = y end
            if status == Spaceship.tile_status.floor_console_connected then
              floor_tiles = floor_tiles + 1
            else
              bulkhead_tiles = bulkhead_tiles + 1
            end
            if (not front_tiles[x]) or y < front_tiles[x] then
               front_tiles[x] = y
            end
        end
      end
    end
    max_x = max_x + 1 -- whole tile
    max_y = max_y + 1 -- whole tile
    spaceship.known_floor_tiles = floor_tiles
    spaceship.known_bulkhead_tiles = bulkhead_tiles
    spaceship.known_bounds = {left_top = {x = min_x, y = min_y}, right_bottom={x = max_x, y = max_y}}
    spaceship.known_tiles_average_x = math.floor((min_x + max_x)/2)
    spaceship.known_tiles_average_y = math.floor((min_y + max_y)/2)
    local front_tiles_by_y = {} -- y:count
    local front_tiles_by_y_left = {} -- y:count
    local front_tiles_by_y_right = {} -- y:count
    local max_flat = 0
    for x, y in pairs(front_tiles) do
      front_tiles_by_y[y] = (front_tiles_by_y[y] or 0) + 1
      if front_tiles_by_y[y] > max_flat then
        max_flat = front_tiles_by_y[y]
      end
      if x < spaceship.known_tiles_average_x then
        front_tiles_by_y_left[y] = (front_tiles_by_y_left[y] or 0) + 1
      else
        front_tiles_by_y_right[y] = (front_tiles_by_y_right[y] or 0) + 1
      end
    end
    local width = max_x - min_x
    -- max_flat == width = 0
    -- max_flat == width / 3 = 1
    local streamline_flatness = math.min(1, (1 - (max_flat-2) / (width-2)) * 1.5)
    local streamline_left = math.min(1, 2 * (table_size(front_tiles_by_y_left)-1) / (math.max(0.5, (width-1) / 2.5)))
    local streamline_right = math.min(1, 2 * (table_size(front_tiles_by_y_right)-1) / (math.max(0.5, (width-1) / 2.5)))
    spaceship.streamline = (streamline_flatness + streamline_left + streamline_right
      + 3 * math.min(streamline_flatness, math.min(streamline_left, streamline_right))) / 6
    --spaceship.streamline = math.min(1, 3.5 * (table_size(front_tiles_by_y)-1) / width)
    -- if it is symetrical then 1/2 would be max (excluding the -1)
    -- use 1/3.5 as max so there can be a few flat areas
    Log.trace("streamline flat "..streamline_flatness.." left "..streamline_left.." right "..streamline_right)
    --Log.trace("streamline "..spaceship.streamline )
    if Spaceship.is_on_own_surface(spaceship) then
      Spaceship.find_own_surface_engines(spaceship)
    end
  else
    spaceship.integrity_valid = false
    spaceship.check_tiles = nil
    spaceship.check_message = {"space-exploration.spaceship-check-message-failed-empty"}
  end

  --spaceship.check_message = nil
  if spaceship.console and spaceship.console.valid then
    --spaceship.console.force.print("Spaceship integrity check complete.")
  end

  Spaceship.check_integrity_stress(spaceship)

  if spaceship.is_launching then
    Spaceship.launch(spaceship)
  end
end

function Spaceship.integrity_check_tick(spaceship)
  if not(spaceship.console and spaceship.console.valid) then
    spaceship.check_message= {"space-exploration.spaceship-check-message-no-console"}
    spaceship.integrity_valid = false
    Spaceship.stop_integrity_check(spaceship)
    return
  end

  local surface = spaceship.console.surface
  -- check if the player is around
  local player_is_here = not SpaceshipObstacles.surface_has_no_players(surface)

  if not (spaceship.check_stage and spaceship.check_tiles and spaceship.pending_tiles) then
    local start_tile = surface.get_tile(spaceship.console.position)
    if Spaceship.is_floor(start_tile.name) then
      Spaceship.check_message = nil
      Spaceship.is_doing_check = true
      -- floor tiles is a 2d array x then y
      spaceship.check_count_empty_tiles = 0
      spaceship.check_tiles = {}
      spaceship.check_tiles[start_tile.position.x] = {}
      spaceship.check_tiles[start_tile.position.x][start_tile.position.y] = Spaceship.tile_status.floor
      spaceship.pending_tiles = {}
      spaceship.pending_tiles[start_tile.position.x] = {}
      spaceship.pending_tiles[start_tile.position.x][start_tile.position.y] = true
      spaceship.check_stage = "floor-connectivity"
      spaceship.check_message= {"space-exploration.spaceship-check-message-checking-console-floor"}
    else
      spaceship.check_message= {"space-exploration.spaceship-check-message-failed-console-floor"}
      spaceship.integrity_valid = false
      Spaceship.stop_integrity_check(spaceship)
      return
    end
  end
  if not (spaceship.check_tiles and spaceship.pending_tiles) then return end

  local alpha = spaceship.check_flash_alpha or 0.05

  -- do a round of checking
  -- check_tiles. List of tiles to check this tick.

  -- pending_tiles should always exists in check_tiles
  -- it basically justs keeps a lst of which ones to search

  local next_pending_tiles = {}
  local changed = false

  if spaceship.check_stage == "floor-connectivity" then
    local position_table = {}
    for x, x_tiles in pairs(spaceship.pending_tiles) do
      for y, yes in pairs(x_tiles) do
        local value = spaceship.check_tiles[x][y]
        if value == Spaceship.tile_status.floor or value == Spaceship.tile_status.bulkhead then
          for d = 1, 4 do -- 4 way direction
              local cx = x + (d == 2 and 1 or (d == 4 and -1 or 0))
              local cy = y + (d == 1 and -1 or (d == 3 and 1 or 0))
              if not (spaceship.check_tiles[cx] and spaceship.check_tiles[cx][cy]) then -- unknown tile
                changed = true
                local tile = surface.get_tile({cx, cy})
                position_table.x = cx + 0.5
                position_table.y = cy + 0.5
                local wall_count = surface.count_entities_filtered{
                  position = position_table,
                  name = Spaceship.names_spaceship_bulkheads
                }
                if tile.valid and Spaceship.is_floor(tile.name) then
                  spaceship.check_tiles[cx] = spaceship.check_tiles[cx] or {}
                  if wall_count > 0 then
                    spaceship.check_tiles[cx][cy] = Spaceship.tile_status.bulkhead
                    if player_is_here and not spaceship.is_doing_check_slowly then
                      Spaceship.flash_tile(surface, {cx, cy}, {r = 0, g = 0, b = 1, a = alpha}, 5)
                    end
                  else
                    spaceship.check_tiles[cx][cy] = Spaceship.tile_status.floor
                    if player_is_here and not spaceship.is_doing_check_slowly then
                      Spaceship.flash_tile(surface, {cx, cy}, {r = 0, g = 1, b = 0, a = alpha}, 5)
                    end
                  end
                  next_pending_tiles[cx] = next_pending_tiles[cx] or {}
                  next_pending_tiles[cx][cy] = true
                else
                  spaceship.check_tiles[cx] = spaceship.check_tiles[cx] or {}
                  if wall_count > 0 then
                    position_table.x = cx + 0.5
                    position_table.y = cy + 0.5
                    local clamps = surface.count_entities_filtered{
                      position = position_table,
                      name = SpaceshipClamp.name_spaceship_clamp_keep
                    }
                    if clamps > 0 then
                      -- if it is a clamp sticking out of the craft treat it as exterior,
                      -- otherwise it is treated as unstaeble bulkhead and takes damage
                      spaceship.check_tiles[cx][cy] = Spaceship.tile_status.exterior
                      if player_is_here and not spaceship.is_doing_check_slowly then
                        Spaceship.flash_tile(surface, {cx, cy}, {r = 1, g = 0, b = 1, a = alpha}, 5)
                      end
                    else
                      spaceship.check_tiles[cx][cy] = Spaceship.tile_status.bulkhead_exterior
                      if player_is_here and not spaceship.is_doing_check_slowly then
                        Spaceship.flash_tile(surface, {cx, cy}, {r = 1, g = 0, b = 0, a = alpha}, 5)
                      end
                    end
                  else
                    spaceship.check_tiles[cx][cy] = Spaceship.tile_status.exterior
                    if player_is_here and not spaceship.is_doing_check_slowly then
                      Spaceship.flash_tile(surface, {cx, cy}, {r = 1, g = 0, b = 1, a = alpha}, 5)
                    end
                  end
                end
              end
          end
        end
      end
    end
    if changed == false then
      -- all connected tiles have been found
      -- if in space and if moving detach disconnected tiles
      if spaceship.is_moving then
        local surface = Spaceship.get_own_surface(spaceship)
        if surface then
          local set_tiles = {}
          local all_tiles = surface.find_tiles_filtered{name=Spaceship.names_spaceship_floors}
          for _, tile in pairs(all_tiles) do
            if not (spaceship.check_tiles[tile.position.x] and spaceship.check_tiles[tile.position.x][tile.position.y]) then
              local stack = tile.prototype.items_to_place_this[1]
              table.insert(set_tiles, {name = name_space_tile, position = tile.position, ghost_name = tile.name, stack = stack})
              if player_is_here then
                Spaceship.flash_tile(surface, tile.position, {r = 1, g = 0, b = 0, a = alpha}, 120)
              end
            end
          end
          if #set_tiles > 0 then
            surface.set_tiles(set_tiles)
            for _, tile in pairs(set_tiles) do
              if Util.table_contains(Spaceship.names_spaceship_floors, tile.ghost_name) then
                surface.create_entity{name = "tile-ghost", inner_name = tile.ghost_name, force = spaceship.force_name, position=tile.position}
              end
            end
          end
        end
      end

      changed = true
      spaceship.check_stage = "containment"
      spaceship.check_message = {"space-exploration.spaceship-check-message-checking-containment"}
      for x, x_tiles in pairs(spaceship.check_tiles) do
        for y, status in pairs(x_tiles) do
          if status == Spaceship.tile_status.exterior
            or status == Spaceship.tile_status.bulkhead_exterior then
            next_pending_tiles[x] = next_pending_tiles[x] or {}
            next_pending_tiles[x][y] = true
          end
        end
      end

    end
  elseif spaceship.check_stage == "containment" then
    for x, x_tiles in pairs(spaceship.pending_tiles) do
      for y, yes in pairs(x_tiles) do
        local value = spaceship.check_tiles[x][y]
        if value == Spaceship.tile_status.exterior
         or value == Spaceship.tile_status.bulkhead_exterior
         or value == Spaceship.tile_status.floor_exterior then
          for cx = x-1, x+1 do
            for cy = y-1, y+1 do
              if spaceship.check_tiles[cx] and spaceship.check_tiles[cx][cy]
               and spaceship.check_tiles[cx][cy] == Spaceship.tile_status.floor then
                spaceship.check_tiles[cx][cy] = Spaceship.tile_status.floor_exterior
                changed = true
                next_pending_tiles[cx] = next_pending_tiles[cx] or {}
                next_pending_tiles[cx][cy] = true
                if player_is_here and not spaceship.is_doing_check_slowly then
                  Spaceship.flash_tile(surface, {cx, cy}, {r = 1, g = 1, b = 0, a = alpha}, 30)
                end
              end
            end
          end
        end
      end
    end
    if changed == false then
      changed = true
      -- convert non-exterior floor to interior
      for x, x_tiles in pairs(spaceship.check_tiles) do
        for y, status in pairs(x_tiles) do
          if status == Spaceship.tile_status.floor then
            spaceship.check_tiles[x][y] = Spaceship.tile_status.floor_interior
            if player_is_here and not spaceship.is_doing_check_slowly then
              Spaceship.flash_tile(surface, {x, y}, {r = 0, g = 0, b = 1, a = alpha}, 40)
            end
          end
        end
      end
      local console_tile_x = math.floor(spaceship.console.position.x)
      local console_tile_y = math.floor(spaceship.console.position.y)
      if spaceship.check_tiles and spaceship.check_tiles[console_tile_x] and spaceship.check_tiles[console_tile_x][console_tile_y] == Spaceship.tile_status.floor_interior then
        spaceship.check_tiles[console_tile_x][console_tile_y] = Spaceship.tile_status.floor_console_connected
        next_pending_tiles[console_tile_x] = {}
        next_pending_tiles[console_tile_x][console_tile_y] = true
        spaceship.check_stage = "console-connectivity"
        spaceship.check_message = {"space-exploration.spaceship-check-message-checking-connectivity"}
      else
        for x, x_tiles in pairs(spaceship.check_tiles) do
          for y, status in pairs(x_tiles) do
            if status == Spaceship.tile_status.exterior
            or status == Spaceship.tile_status.bulkhead_exterior then
              if player_is_here then
                Spaceship.flash_tile(surface, {x, y}, {r = 1, g = 0, b = 0, a = alpha}, 120)
              end
            end
          end
        end
        spaceship.integrity_valid = false
        spaceship.check_message =  {"space-exploration.spaceship-check-message-failed-containment"}
        return Spaceship.stop_integrity_check(spaceship)
      end
    end
  elseif spaceship.check_stage == "console-connectivity" then
    for x, x_tiles in pairs(spaceship.pending_tiles) do
      for y, yes in pairs(x_tiles) do
        local value = spaceship.check_tiles[x][y]
        if value == Spaceship.tile_status.floor_console_connected then
          local blockers = surface.count_entities_filtered{
            position = {x + 0.5, y + 0.5},
            collision_mask = {"object-layer"}
          }
          if blockers == 0 then -- this tile is clear, add to corridor allowance.
            spaceship.check_count_empty_tiles = (spaceship.check_count_empty_tiles or 0) + 1
          end
        end
        if value == Spaceship.tile_status.floor_console_connected
         or value == Spaceship.tile_status.bulkhead_console_connected then

         for d = 1, 4 do -- 4 way direction
              local cx = x + (d == 2 and 1 or (d == 4 and -1 or 0))
              local cy = y + (d == 1 and -1 or (d == 3 and 1 or 0))
              if spaceship.check_tiles[cx] and spaceship.check_tiles[cx][cy] and
               (spaceship.check_tiles[cx][cy] == Spaceship.tile_status.floor_interior
               or spaceship.check_tiles[cx][cy] == Spaceship.tile_status.bulkhead) then
                if spaceship.check_tiles[cx][cy] == Spaceship.tile_status.floor_interior then
                   spaceship.check_tiles[cx][cy] = Spaceship.tile_status.floor_console_connected
                else
                   spaceship.check_tiles[cx][cy] = Spaceship.tile_status.bulkhead_console_connected
                end
                if player_is_here and not spaceship.is_doing_check_slowly then
                  Spaceship.flash_tile(surface, {cx, cy}, {r = 0, g = 1, b = 1, a = alpha}, 5)
                end
                changed = true
                next_pending_tiles[cx] = next_pending_tiles[cx] or {}
                next_pending_tiles[cx][cy] = true
              end
          end
        end
      end
    end
    if changed == false then
      -- completed the check

      spaceship.check_message = {"space-exploration.spaceship-check-message-passed"}
      spaceship.integrity_valid = true
      local set_tiles = {}
      local reset = false
      for x, x_tiles in pairs(spaceship.check_tiles) do
        for y, status in pairs(x_tiles) do
          if not (status == Spaceship.tile_status.floor_console_connected
              or status == Spaceship.tile_status.bulkhead_console_connected
              or status == Spaceship.tile_status.exterior) then
              spaceship.check_message = {"space-exploration.spaceship-check-message-unstable"}
              if player_is_here then
                Spaceship.flash_tile(surface, {x, y}, {r = 1, g = 0, b = 0, a = alpha}, 120)
              end
              -- detatch
              if Spaceship.is_on_own_surface(spaceship) and spaceship.is_moving then
                local support = 1 -- it will count self
                for cx = x-1, x+1 do
                  for cy = y-1, y+1 do
                    if spaceship.check_tiles[cx] and spaceship.check_tiles[cx][cy] then
                      if spaceship.check_tiles[cx][cy] ~= Spaceship.tile_status.exterior then
                        support = support + 1
                        if spaceship.check_tiles[cx][cy] == Spaceship.bulkhead_console_connected then
                          support = support + 2
                        end
                      end
                    end
                  end
                end
                if support <= 6 then -- has a chance to be removed
                  reset = true
                  if support - math.random(2) <= 4 then
                    local entities = surface.find_entities({{x,y}, {x+1,y+1}})
                    local remove = true
                    for _, entity in pairs(entities) do
                      if entity and entity.valid and entity.type ~= "character" and entity.health then
                        entity.damage(150, "neutral", "explosion")
                        remove = false
                      end
                    end
                    if remove then
                      local tile = surface.get_tile(x,y)
                      table.insert(set_tiles, {name = name_space_tile, ghost_name=tile.name, position = {x,y}})
                    end
                  end
                end
              end
          end
        end
      end
      if #set_tiles > 0 then
        spaceship.check_message = {"space-exploration.spaceship-check-message-valid-but-disconnecting"}
        surface.print({"space-exploration.spaceship-warning-sections-disconnecting"})
        surface.set_tiles(set_tiles)
        for _, tile in pairs(set_tiles) do
          if Spaceship.is_floor(tile.ghost_name) then
            surface.create_entity{name = "tile-ghost", inner_name = tile.ghost_name, force = spaceship.force_name, position=tile.position}
          end
        end
      end

      Spaceship.stop_integrity_check(spaceship)

      if reset then
        Spaceship.start_integrity_check(spaceship)
        return
      else
        Spaceship.get_compute_launch_energy(spaceship)
        return
      end
    end

  end

  if changed then
    spaceship.pending_tiles = next_pending_tiles
  else
    spaceship.integrity_valid = false
    spaceship.check_message = {"space-exploration.spaceship-check-message-did-not-complete"}
    return Spaceship.stop_integrity_check(spaceship)
  end
end

function Spaceship.on_init(event)
    global.spaceships = {}
end
Event.addListener("on_init", Spaceship.on_init, true)

return Spaceship

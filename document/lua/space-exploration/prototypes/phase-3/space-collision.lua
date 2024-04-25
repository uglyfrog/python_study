local data_util = require("data_util")

local block_from_space = {
  "beacon",
  "assembling-machine", -- chemical planets, etc
  "furnace",
  "unit-spawner",
  "lab",
  "market",
  "offshore-pump",
  "pipe",
  "pipe-to-ground",
  "curved-rail",
  "straight-rail",
  "storage-tank",
  "splitter",
  "transport-belt",
  "underground-belt",
  "tree",
  "turret",
  "fluid-turret",
}


-- make vehicles collide with trees and pipes (train-layer)
-- stop characters colliding with pipes (player-layer)
for _, type in pairs({"pipe", "pipe-to-ground"}) do
  for _, prototype in pairs(data.raw[type]) do
    prototype.collision_mask = collision_mask_util_extended.get_mask(prototype)
    collision_mask_util_extended.remove_layer(prototype.collision_mask, "player-layer")
    collision_mask_util_extended.add_layer(prototype.collision_mask, collision_mask_util_extended.get_make_named_collision_mask("vehicle-layer"))
  end
end


-- disable paving over space and other space platform
for _, item in pairs(data.raw.item) do

  -- space
  if item.name ~= data_util.mod_prefix.."space-platform-scaffold"
      and item.name ~= data_util.mod_prefix.."space-platform-plating"
      and item.name ~= data_util.mod_prefix.."spaceship-floor" then
    if item.place_as_tile then
      if not item.place_as_tile.condition then
        item.place_as_tile.condition = {space_collision_layer}
        item.place_as_tile.condition_size = 1
      else
        table.insert(item.place_as_tile.condition, space_collision_layer)
        item.place_as_tile.condition_size = math.max(item.place_as_tile.condition_size or 1)
      end
    end
  end
  if item.place_as_tile then
    if item.localised_description then
      item.localised_description = {"space-exploration.simple-a-b-break", item.localised_description, {"space-exploration.tile_warning"}}
    elseif item.name == data_util.mod_prefix.."space-platform-scaffold"
        or item.name == data_util.mod_prefix.."space-platform-plating"
        or item.name == data_util.mod_prefix.."spaceship-floor" then
          -- flooring with description
      item.localised_description = {"space-exploration.simple-a-b-break", {"item-description."..item.name}, {"space-exploration.tile_warning"}}
    else -- assumed without description
      item.localised_description = {"space-exploration.tile_warning"}
    end
  end
end

for _, prototype in pairs(data.raw["rocket-silo"]) do
  prototype.collision_mask = collision_mask_util_extended.get_mask(prototype)
  collision_mask_util_extended.add_layer(prototype.collision_mask, spaceship_collision_layer)  -- block from spaceship
  data_util.collision_description(prototype)
end

for _, prototype in pairs(data.raw["mining-drill"]) do
  local type = "mining-drill"
  if prototype.resource_categories and prototype.resource_categories[1] == "basic-solid" then
    -- allow in space
  else
    prototype.collision_mask = collision_mask_util_extended.get_mask(prototype)
    collision_mask_util_extended.add_layer(prototype.collision_mask, space_collision_layer)
  end
end

for _, type in pairs(block_from_space) do
  for _, prototype in pairs(data.raw[type]) do

    prototype.collision_mask = collision_mask_util_extended.get_mask(prototype)

    if (not prototype.se_allow_in_space)
    and (not se_allow_in_space[prototype.name]) -- see data.lua for how to allow your entity in space
    and string.sub(prototype.name, 1, 8) ~= "se-space"
    and string.sub(prototype.name, 1, 13) ~= "se-deep-space"
    and (not string.find( prototype.name, "storage-tank", 1, true))
    and (not string.find( prototype.name, "valve", 1, true))
    and (
      type == "offshore-pump"
      or
      not (
        string.find( prototype.name, "pump", 1, true)
        --and not string.find( prototype.name, "water", 1, true)
      )
    ) -- not water pump
    and (not string.find(prototype.name, data_util.mod_prefix.."rocket-", 1, true))
    and prototype.name ~= data_util.mod_prefix.."big-turbine"
    and prototype.name ~= data_util.mod_prefix.."condenser-turbine"
    and prototype.name ~= data_util.mod_prefix.."meteor-defence-charger"
    and prototype.name ~= data_util.mod_prefix.."meteor-point-defence-charger"
    and prototype.name ~= data_util.mod_prefix.."meteor-point-defence-charger-overcharged"
    --and prototype.name ~= data_util.mod_prefix.."fuel-refinery"
    and prototype.name ~= data_util.mod_prefix .. "space-straight-rail"
    and prototype.name ~= data_util.mod_prefix .. "space-curved-rail"
    and prototype.name ~= data_util.mod_prefix .. "gate-tank-input"
    and prototype.name ~= data_util.mod_prefix .. "gate-tank-output"
    and prototype.name ~= data_util.mod_prefix .. "gate-platform-scaffold"
    and prototype.name ~= data_util.mod_prefix .. "wide-beacon"
    and prototype.name ~= "realistic-reactor-eccs"
    --and prototype.name ~= "barreling-pump" -- angels
    then
      --log("space-collide: " .. prototype.name)
      collision_mask_util_extended.add_layer(prototype.collision_mask, space_collision_layer)
    else
      -- is alloweed
      if prototype.allowed_effects and data_util.table_contains(prototype.allowed_effects, "productivity") then
        local spaced = table.deepcopy(prototype)
        spaced.name = spaced.name .. "-spaced"
        spaced.localised_name = {"space-exploration.structure_name_spaced", prototype.localised_name or {"entity-name."..prototype.name}}
        spaced.localised_description = {"space-exploration.structure_description_spaced", prototype.localised_description or {"entity-description."..prototype.name}}
        spaced.flags = spaced.flags or {}
        if not data_util.table_contains(spaced.flags, "hidden") then
          table.insert(spaced.flags, "hidden")
        end
        if not spaced.placeable_by then
          for _, item in pairs(data.raw.item) do
            if item.place_result == prototype.name then
              spaced.placeable_by = spaced.placeable_by or {item = item.name, count=1}
              break
            end
          end
        end
        local allowed_effects = {}
        for _, effect in pairs(prototype.allowed_effects) do
          if effect ~= "productivity" then
            table.insert(allowed_effects, effect)
          end
        end
        spaced.allowed_effects = allowed_effects
        data:extend({spaced})
      end
    end
    if prototype.name ~= data_util.mod_prefix.."dimensional-anchor" 
      and type ~= "tree"
      and type ~= "turret"
      and type ~= "unit-spawner" then
        data_util.collision_description(prototype)
    end
    if prototype.crafting_categories and (not data_util.table_contains(prototype.collision_mask, spaceship_collision_layer)) then
      local has_space_recipe = false
      for _, category in pairs(prototype.crafting_categories) do
        if string.sub(category, 1, 6) == "space-" then
          has_space_recipe = true
          break
        end
      end
      if has_space_recipe then
        local grounded = table.deepcopy(prototype)
        grounded.name = grounded.name .. "-grounded"
        grounded.localised_name = {"space-exploration.structure_name_grounded", prototype.localised_name or {"entity-name."..prototype.name}}
        grounded.localised_description = {"space-exploration.structure_description_grounded",  prototype.localised_description or {"entity-description."..prototype.name}}
        grounded.flags = grounded.flags or {}
        if not data_util.table_contains(grounded.flags, "hidden") then
          table.insert(grounded.flags, "hidden")
        end
        grounded.crafting_categories = {}
        for _, category in pairs(prototype.crafting_categories) do
          if string.sub(category, 1, 6) ~= "space-" then
            table.insert(grounded.crafting_categories, category)
          end
        end
        if #grounded.crafting_categories == 0 then
          grounded.crafting_categories = {"no-category"}
        end
        if not grounded.placeable_by then
          for _, item in pairs(data.raw.item) do
            if item.place_result == prototype.name then
              grounded.placeable_by = grounded.placeable_by or {item = item.name, count=1}
              break
            end
          end
        end
        data:extend({grounded})
      end
    end
  end
end

for _, type in pairs({"accumulator"}) do
  for _, prototype in pairs(data.raw[type]) do
    data_util.collision_description(prototype)
  end
end

for _, container in pairs({"container", "logistic-container"}) do
  for _, prototype in pairs(data.raw[container]) do
    if (not prototype.se_allow_in_space)
    and string.sub(prototype.name, 1, 8) ~= "se-space"
    and prototype.name ~= data_util.mod_prefix .. "cargo-rocket-cargo-pod"
    and prototype.name ~= data_util.mod_prefix.."meteor-defence-container"
    and prototype.name ~= data_util.mod_prefix.."meteor-point-defence-container"
    and (not string.find(prototype.name, data_util.mod_prefix.."rocket-", 1, true))
    and (not string.find(prototype.name, "silo", 1, true))
    and (not string.find(prototype.name, "chest", 1, true))
    and (not string.find(prototype.name, "warehouse", 1, true))
    and (not string.find(prototype.name, "storehouse", 1, true)) then
      --log(prototype.name)
      prototype.collision_mask = collision_mask_util_extended.get_mask(prototype)
      collision_mask_util_extended.add_layer(prototype.collision_mask, space_collision_layer)
    end
  end
end

--[[ -- this prevents cars from driving over belts
for _, prototype in pairs(data.raw.car) do
  if prototype.name ~= "se-space-capsule-_-vehicle" then
    prototype.collision_mask = prototype.collision_mask or {"player-layer", "train-layer"}
    table.insert(prototype.collision_mask, space_collision_layer)
  end
end
]]--
for _, prototype in pairs(data.raw.fish) do
  if not string.find(prototype.name, "space", 1, true) then
    prototype.collision_mask = collision_mask_util_extended.get_mask(prototype)
    collision_mask_util_extended.add_layer(prototype.collision_mask, space_collision_layer)
  end
end

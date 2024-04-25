local data_util = require("data_util")

for _, resource in pairs(se_delivery_cannon_recipes) do
  local type = resource.type or "item"
  if data.raw[type][resource.name] then
    local base = data.raw[type][resource.name]
    local amount = resource.amount
    if not amount then
      if type == "fluid" then
        amount = 1000
      else
        amount = base.stack_size or 1
      end
    end
    local order = ""
    local o_subgroup = data.raw["item-subgroup"][base.subgroup]
    local o_group = data.raw["item-group"][o_subgroup.group]
    order = o_group.order .. "-|-"..o_subgroup.order.."-|-"..base.order
    data:extend({
      {
          type = "item",
          name = data_util.mod_prefix .. "delivery-cannon-package-"..resource.name,
          icon = "__space-exploration-graphics__/graphics/icons/delivery-cannon-capsule.png",
          icon_size = 64,
          order = order,
          flags = {"hidden"},
          subgroup = base.subgroup or "delivery-cannon-capsules",
          stack_size = 1,
          localised_name = {"item-name.se-delivery-cannon-capsule-packed", base.localised_name or {type.."-name."..resource.name}}
      },
      {
          type = "recipe",
          name = data_util.mod_prefix .. "delivery-cannon-pack-" .. resource.name,
          icon = base.icon,
          icon_size = base.icon_size,
          icon_mipmaps = base.icon_mipmaps,
          icons = base.icons,
          result = data_util.mod_prefix .. "delivery-cannon-package-"..resource.name,
          enabled = true,
          energy_required = 5,
          ingredients = {
            { data_util.mod_prefix .. "delivery-cannon-capsule", 1 },
            { type = type, name = resource.name, amount = amount},
          },
          requester_paste_multiplier = 1,
          always_show_made_in = false,
          category = "delivery-cannon",
          hide_from_player_crafting = true,
          hide_from_stats = true,
          localised_name = {"item-name.se-delivery-cannon-capsule-packed", base.localised_name or {type.."-name."..resource.name}},
          allow_decomposition = false
      },
    })
    if is_debug_mode then
      --log(serpent.block(data.raw.item[data_util.mod_prefix .. "delivery-cannon-package-"..resource.name]))
    end
  end
end

-- ammo and capsules can't be ingredients.
-- the delivery cannon will need to assemble the item based on the original recipe
for _, dcar in pairs(se_delivery_cannon_ammo_recipes) do
  local type = dcar.type or "ammo" -- could be "capsule"
  if data.raw[type][dcar.name] then
    local proto = data.raw[type][dcar.name]
    local recipe_name = dcar.recipe_name or proto.name
    if data.raw.recipe[recipe_name] then
      local recipe = data.raw.recipe[recipe_name]
      local ingredients = table.deepcopy(recipe.ingredients or recipe.expensive.ingredients or recipe.normal.ingredients)
      local energy_required = recipe.energy_required or recipe.expensive.energy_required or recipe.normal.energy_required
      table.insert(ingredients, { data_util.mod_prefix .. "delivery-cannon-weapon-capsule", 1 })
      local order = ""
      local o_subgroup = data.raw["item-subgroup"][proto.subgroup]
      local o_group = data.raw["item-group"][o_subgroup.group]
      order = o_group.order .. "-|-"..o_subgroup.order.."-|-"..proto.order
      local unlock_tech
      for _, technology in pairs(data.raw.technology) do
        if technology.effects then
          for _, effect in pairs(technology.effects) do
            if effect.recipe == recipe_name then
              table.insert(technology.effects, { type = "unlock-recipe", recipe = data_util.mod_prefix .. "delivery-cannon-weapon-pack-" .. dcar.name})
              unlock_tech = technology
              break
            end
          end
          if unlock_tech then break end
        end
      end
      data:extend({
        {
            type = "item",
            name = data_util.mod_prefix .. "delivery-cannon-weapon-package-"..proto.name,
            icon = "__space-exploration-graphics__/graphics/icons/delivery-cannon-weapon-capsule.png",
            icon_size = 64,
            order = order,
            flags = {"hidden"},
            subgroup = proto.subgroup or "delivery-cannon-capsules",
            stack_size = 1,
            localised_name = {"item-name.se-delivery-cannon-weapon-capsule-packed", proto.localised_name or {"item-name."..dcar.name}}
        },
        {
            type = "recipe",
            name = data_util.mod_prefix .. "delivery-cannon-weapon-pack-" .. dcar.name,
            icon = proto.icon,
            icon_size = proto.icon_size,
            icon_mipmaps = proto.icon_mipmaps,
            icons = proto.icons,
            result = data_util.mod_prefix .. "delivery-cannon-weapon-package-"..dcar.name,
            enabled = unlock_tech == nil,
            energy_required = energy_required,
            ingredients = dcar.ingredients or ingredients,
            requester_paste_multiplier = 1,
            always_show_made_in = false,
            category = "delivery-cannon-weapon",
            hide_from_player_crafting = true,
            localised_name = {"item-name.se-delivery-cannon-weapon-capsule-packed", proto.localised_name or {"item-name."..dcar.name}},
            allow_decomposition = false
        },
      })

      if is_debug_mode then
        --log(serpent.block(data.raw.item[data_util.mod_prefix .. "delivery-cannon-weapon-package-"..proto.name]))
      end
    end
  end
end

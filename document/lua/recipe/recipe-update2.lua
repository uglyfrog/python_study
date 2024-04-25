local data_util = require("data_util")


if data.raw.item['electric-motor'] then
  data_util.replace_or_add_ingredient(data_util.mod_prefix .. "space-transport-belt", "iron-plate", 'electric-motor', 2)
  data_util.replace_or_add_ingredient(data_util.mod_prefix .. "core-fragment-processor", "iron-plate", 'electric-motor', 15)
  data_util.replace_or_add_ingredient(data_util.mod_prefix .. "meteor-point-defence", "iron-gear-wheel", 'electric-motor', 10)

  data_util.replace_or_add_ingredient(data_util.mod_prefix .. "fluid-burner-generator", "iron-gear-wheel", 'electric-motor', 10)
  data_util.replace_or_add_ingredient(data_util.mod_prefix .. "fuel-refinery", "iron-gear-wheel", 'electric-motor', 20)
end


if data.raw.item["solid-sand"] and not data.raw.recipe["sand-to-solid-sand"]then -- angels sand
  data:extend({{
      type = "recipe",
      name = "sand-to-solid-sand",
      category = "washing-plant",
      normal = {
        energy_required = 0.5,
        enabled = false,
        ingredients = {
          {type="item", name="sand", amount=10},
          {type="fluid", name="water", amount=100},
        },
        results= { {type="item", name="solid-sand", amount=10} },
      },
      expensive = {
        energy_required = 0.5,
        enabled = false,
        ingredients = {
          {type="item", name="sand", amount=10},
          {type="fluid", name="water", amount=100},
        },
        results= { {type="item", name="solid-sand", amount=10} },
      },
  }})
end

data:extend({
  {
    type = "recipe",
    category = "smelting",
    name = data_util.mod_prefix .. "iron-smelting-vulcanite",
    results = {
      {name = "iron-plate", amount = 12},
    },
    energy_required = 24,
    ingredients = {
      {name = "iron-ore", amount = 8},
      {name = data_util.mod_prefix .. "vulcanite-block", amount = 1},
    },
    icons = {
      {icon = data.raw.item["iron-plate"].icon, icon_size = data.raw.item["iron-plate"].icon_size, scale = 32/data.raw.item["iron-plate"].icon_size},
      {icon = data.raw.item[data_util.mod_prefix .. "vulcanite-block"].icon,
        icon_size = data.raw.item[data_util.mod_prefix .. "vulcanite-block"].icon_size,
        scale = 0.5 * 32/data.raw.item[data_util.mod_prefix .. "vulcanite-block"].icon_size,
        shift = {-10, -10}
      },
    },
    enabled = false,
    always_show_made_in = true,
    allow_as_intermediate = false,
  },
  {
    type = "recipe",
    category = "smelting",
    name = data_util.mod_prefix .. "copper-smelting-vulcanite",
    results = {
      {name = "copper-plate", amount = 12},
    },
    energy_required = 24,
    ingredients = {
      {name = "copper-ore", amount = 8},
      {name = data_util.mod_prefix .. "vulcanite-block", amount = 1},
    },
    icons = {
      {icon = data.raw.item["copper-plate"].icon, icon_size = data.raw.item["copper-plate"].icon_size, scale = 32/data.raw.item["copper-plate"].icon_size},
      {icon = data.raw.item[data_util.mod_prefix .. "vulcanite-block"].icon,
        icon_size = data.raw.item[data_util.mod_prefix .. "vulcanite-block"].icon_size,
        scale = 0.5 * 32/data.raw.item[data_util.mod_prefix .. "vulcanite-block"].icon_size,
        shift = {-10, -10}
      },
    },
    enabled = false,
    always_show_made_in = true,
    allow_as_intermediate = false,
  },
  {
    type = "recipe",
    category = "smelting",
    name = data_util.mod_prefix .. "stone-brick-vulcanite",
    results = {
      {name = "stone-brick", amount = 6},
    },
    energy_required = 24,
    ingredients = {
      {name = "stone", amount = 8},
      {name = data_util.mod_prefix .. "vulcanite-block", amount = 1},
    },
    icons = {
      {icon = data.raw.item["stone-brick"].icon, icon_size = data.raw.item["stone-brick"].icon_size, scale = 32/data.raw.item["stone-brick"].icon_size},
      {icon = data.raw.item[data_util.mod_prefix .. "vulcanite-block"].icon,
        icon_size = data.raw.item[data_util.mod_prefix .. "vulcanite-block"].icon_size,
        scale = 0.5 * 32/data.raw.item[data_util.mod_prefix .. "vulcanite-block"].icon_size,
        shift = {-10, -10}
      },
    },
    enabled = false,
    always_show_made_in = true,
    allow_as_intermediate = false,
  },
  {
    type = "recipe",
    category = "smelting",
    name = data_util.mod_prefix .. "glass-vulcanite",
    results = {
      {name = "glass", amount = 6},
    },
    energy_required = 24,
    ingredients = {
      {name = "sand", amount = 16},
      {name = data_util.mod_prefix .. "vulcanite-block", amount = 1},
    },
    icons = {
      {icon = data.raw.item["glass"].icon, icon_size = data.raw.item["glass"].icon_size, scale = 32/data.raw.item["glass"].icon_size},
      {icon = data.raw.item[data_util.mod_prefix .. "vulcanite-block"].icon,
        icon_size = data.raw.item[data_util.mod_prefix .. "vulcanite-block"].icon_size,
        scale = 0.5 * 32/data.raw.item[data_util.mod_prefix .. "vulcanite-block"].icon_size,
        shift = {-10, -10}
      },
    },
    enabled = false,
    always_show_made_in = true,
    allow_as_intermediate = false,
  },
})

data_util.replace_or_add_ingredient("small-lamp", "electronic-circuit", 'glass', 1)

data_util.replace_or_add_ingredient("solar-panel", nil, 'glass', 5)
data_util.replace_or_add_ingredient("laser-turret", nil, 'glass', 20)

data_util.replace_or_add_ingredient("electric-furnace", "stone-brick", data_util.mod_prefix .. "heat-shielding", 2)
data_util.replace_or_add_ingredient("electric-furnace", "concrete", data_util.mod_prefix .. "heat-shielding", 2)
data_util.replace_or_add_ingredient("industrial-furnace", nil, data_util.mod_prefix .. "heat-shielding", 4)

data_util.replace_or_add_ingredient("fusion-reactor-equipment", nil, data_util.mod_prefix .. 'fusion-test-data', 50)
data_util.replace_or_add_ingredient("fusion-reactor-equipment", nil, data_util.mod_prefix .. 'superconductive-cable', 50)
data_util.replace_or_add_ingredient("fusion-reactor-equipment", nil, data_util.mod_prefix .. 'heat-shielding', 50)

data_util.replace_or_add_ingredient("satellite", "glass", "glass", 50)
data_util.replace_or_add_ingredient("satellite", "processing-unit", "processing-unit", 50)
data_util.replace_or_add_ingredient("satellite", "low-density-structure", "low-density-structure", 50)
data_util.replace_or_add_ingredient("satellite", "solar-panel", "solar-panel", 10)
data_util.replace_or_add_ingredient("satellite", "accumulator", "accumulator", 10)
data_util.replace_or_add_ingredient("satellite", "radar", "radar", 1)

data_util.replace_or_add_ingredient("atomic-bomb", "explosives", "explosives", 50)
data_util.replace_or_add_ingredient("atomic-bomb", "uranium-235", "uranium-235", 100)
data_util.replace_or_add_ingredient("atomic-bomb", "rocket-fuel", "rocket-fuel", 10)

data_util.replace_or_add_ingredient("jetpack-2", nil, "low-density-structure", 10) -- space
data_util.replace_or_add_ingredient("jetpack-3", nil, data_util.mod_prefix .. "aeroframe-pole", 30) -- astro
data_util.replace_or_add_ingredient("jetpack-4", nil, data_util.mod_prefix .. "naquium-cube", 4) -- deep

data_util.replace_or_add_ingredient("spidertron", "fusion-reactor-equipment", data_util.mod_prefix .. "rtg-equipment", 8)
data_util.replace_or_add_ingredient("spidertron", "raw-fish", data_util.mod_prefix .. "specimen", 1)
data_util.replace_or_add_ingredient("spidertron", "effectivity-module-3", data_util.mod_prefix .. "heavy-girder", 16)

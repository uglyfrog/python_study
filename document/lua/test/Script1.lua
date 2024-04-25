
  type = "recipe",
  name = data_util.mod_prefix .. "observation-frame-blank",
  ingredients = {
    { name = "coal", amount = 1},
    { name = "glass", amount = 1},
    { name = "steel-plate", amount = 1},
    { type = "fluid", name = "light-oil", amount = 10},
  },
  results = {
    { name = data_util.mod_prefix.."observation-frame-blank", amount = 5 },
  },
  energy_required = 5,
  category = "space-manufacturing",
  icon = "__space-exploration-graphics__/graphics/icons/observation-frame-blank.png",
  icon_size = 64, icon_mipmaps = 1,
  enabled = false,
  always_show_made_in = true,
})

  type = "recipe",
  name = data_util.mod_prefix .. "observation-frame-blank-beryllium",
  ingredients = {
    { name = "coal", amount = 1},
    { name = "glass", amount = 1},
    { name = data_util.mod_prefix .. "beryllium-plate", amount = 1},
    { type = "fluid", name = "light-oil", amount = 10},
  },
  results = {
    { name = data_util.mod_prefix.."observation-frame-blank", amount = 10 },
  },
  energy_required = 10,
  category = "space-manufacturing",
  icon = "__space-exploration-graphics__/graphics/icons/observation-frame-blank.png",
  icon_size = 64, icon_mipmaps = 1,
  enabled = false,
  always_show_made_in = true,
})


  type = "recipe",
  name = data_util.mod_prefix .. "chemical-gel",
  ingredients = {
    { type = "fluid", name = data_util.mod_prefix .. "space-water", amount = 10},
    { type = "fluid", name = "petroleum-gas", amount = 100},
  },
  results = {
    { type="fluid", name = data_util.mod_prefix .. "chemical-gel", amount = 20},
  },
  energy_required = 10,
  category = "space-manufacturing",
  enabled = false,
  always_show_made_in = true,
})

--[[
  type = "recipe",
  name = data_util.mod_prefix .. "space-rail",
  ingredients = {
    { name = "low-density-structure", amount = 1},
    { name = "steel-plate", amount = 2},
    { name = "copper-cable", amount = 4},
  },
  results = {
    { name = data_util.mod_prefix .. "space-rail", amount = 1},
  },
  energy_required = 10,
  category = "space-manufacturing",
  enabled = false,
  always_show_made_in = true,
})
]]--

  type = "recipe",
  name = data_util.mod_prefix .. "space-rail",
  ingredients = {
    { name = "rail", amount = 100},
    { name = "steel-plate", amount = 100},
    { name = "copper-cable", amount = 100},
    { name = data_util.mod_prefix .. "energy-catalogue-1", amount = 1},
  },
  results = {
    { name = data_util.mod_prefix .. "space-rail", amount = 100},
  },
  energy_required = 100,
  category = "space-manufacturing",
  enabled = false,
  always_show_made_in = true,
})

  type = "recipe",
  name = data_util.mod_prefix .. "star-probe",
  ingredients = {
    { name = "rocket-fuel", amount = 100},
    { name = data_util.mod_prefix .. "heat-shielding", amount = 100},
    { name = "rocket-control-unit", amount = 20},
    { name = data_util.mod_prefix .. "space-solar-panel-2", amount = 10},
    { name = data_util.mod_prefix .. "holmium-solenoid", amount = 50},
    { name = data_util.mod_prefix .. "empty-data", amount = 1000},
  },
  results = {
    { name = data_util.mod_prefix .. "star-probe", amount = 1},
  },
  energy_required = 60,
  category = "space-manufacturing",
  enabled = false,
  always_show_made_in = true,
})
  type = "recipe",
  name = data_util.mod_prefix .. "belt-probe",
  ingredients = {
    { name = "rocket-fuel", amount = 100},
    { name = "uranium-fuel-cell", amount = 10},
    { name = data_util.mod_prefix .. "aeroframe-bulkhead", amount = 50},
    { name = "rocket-control-unit", amount = 20},
    { name = data_util.mod_prefix .. "space-solar-panel", amount = 10},
    { name = data_util.mod_prefix .. "empty-data", amount = 1000},
  },
  results = {
    { name = data_util.mod_prefix .. "belt-probe", amount = 1},
  },
  energy_required = 60,
  category = "space-manufacturing",
  enabled = false,
  always_show_made_in = true,
})
  type = "recipe",
  name = data_util.mod_prefix .. "void-probe",
  ingredients = {
    { name = "uranium-fuel-cell", amount = 20},
    { name = "rocket-fuel", amount = 100},
    { name = "rocket-control-unit", amount = 20},
    { name = data_util.mod_prefix .. "nanomaterial", amount = 10},
    { name = "laser-turret", amount = 10},
    { name = data_util.mod_prefix .. "empty-data", amount = 1000},
  },
  results = {
    { name = data_util.mod_prefix .. "void-probe", amount = 1},
  },
  energy_required = 60,
  category = "space-manufacturing",
  enabled = false,
  always_show_made_in = true,
})

  type = "recipe",
  name = data_util.mod_prefix .. "nanomaterial",
  ingredients = {
    { type = "fluid", name = data_util.mod_prefix .. "particle-stream", amount = 50},
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-supercooled", amount = 25},
    { data_util.mod_prefix .. "dynamic-emitter", 1},
    { data_util.mod_prefix .. "aeroframe-bulkhead", 2},
    { data_util.mod_prefix .. "heavy-girder", 3},
    { data_util.mod_prefix .. "vitalic-epoxy", 1},
  },
  results = {
    { name = data_util.mod_prefix .. "nanomaterial", amount=16},
    { name = data_util.mod_prefix .. "contaminated-scrap", amount = 1},
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 25},
  },
  energy_required = 60,
  main_product = data_util.mod_prefix .. "nanomaterial",
  category = "space-manufacturing",
  enabled = false,
  always_show_made_in = true,
})


  type = "recipe",
  name = data_util.mod_prefix .. "nano-engineering-data",
  ingredients = {
    { name = data_util.mod_prefix .. "nanomaterial", amount = 1, catalyst_amount = 1},
    { type = "fluid", name = data_util.mod_prefix .. "particle-stream", amount = 50},
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-supercooled", amount = 25},
    { name = data_util.mod_prefix .. "empty-data", amount=1},
  },
  results = {
    { name = data_util.mod_prefix .. "nano-engineering-data", amount=1},
    { name = data_util.mod_prefix .. "nanomaterial", amount_min = 1, amount_max = 1, probability = 0.05},
    { name = data_util.mod_prefix .. "heat-shielding", amount_min = 1, amount_max = 1, probability = 0.05},
    { name = "low-density-structure", amount_min = 1, amount_max = 1, probability = 0.05},
    { name = data_util.mod_prefix .. "superconductive-cable", amount_min = 1, amount_max = 1, probability = 0.05},
    { name = data_util.mod_prefix .. "scrap", amount_min = 1, amount_max = 1, probability = 0.05},
    { name = data_util.mod_prefix .. "contaminated-scrap", amount_min = 1, amount_max = 1, probability = 0.05},
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 25},
  },
  energy_required = 60,
  main_product = data_util.mod_prefix .. "nano-engineering-data",
  category = "space-manufacturing",
  enabled = false,
  always_show_made_in = true,
})
local data_util = require("data_util")
local make_recipe = data_util.make_recipe

  type = "recipe",
  name = data_util.mod_prefix .. "antimatter-stream",
  ingredients = {
    { type = "fluid", name = data_util.mod_prefix .. "particle-stream", amount=50},
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-supercooled", amount = 100},
  },
  results = {
    { type = "fluid", name = data_util.mod_prefix .. "antimatter-stream", amount = 50}, -- 50 * 20MJ = 1000 MJ = 1GJ
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 100},
  },
  energy_required = 4, -- 400 * 5MW = 2000MJ
  main_product = data_util.mod_prefix .. "antimatter-stream",
  category = "space-materialisation",
  enabled = false,
  always_show_made_in = true,
})

  type = "recipe",
  name = data_util.mod_prefix .. "matter-fusion-dirty",
  ingredients = {
    { name = data_util.mod_prefix .. "fusion-test-data", amount = 1, catalyst_amount = 1},
    { type = "fluid", name = data_util.mod_prefix .. "particle-stream", amount = 50},
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-supercooled", amount = 25},
  },
  results = {
    { name = data_util.mod_prefix .. "contaminated-scrap", amount = 15},
    { name = data_util.mod_prefix .. "fusion-test-data", amount_min = 1, amount_max = 1, probability = 0.99},
    { name = data_util.mod_prefix .. "junk-data", amount_min = 1, amount_max = 1, probability = 0.01},
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 25},
  },
  energy_required = 1,
  category = "space-materialisation",
  subgroup = "space-components",
  icons = data_util.transition_icons(
    {
      icon = data.raw.fluid[data_util.mod_prefix .. "particle-stream"].icon,
      icon_size = data.raw.fluid[data_util.mod_prefix .. "particle-stream"].icon_size
    },
    {
      icon = data.raw.item[data_util.mod_prefix .. "contaminated-scrap"].icon,
      icon_size = data.raw.item[data_util.mod_prefix .. "contaminated-scrap"].icon_size
    }
  ),
  enabled = false,
  allow_as_intermediate = false,
  always_show_made_in = true,
})

  type = "recipe",
  name = data_util.mod_prefix .. "matter-fusion-iron",
  ingredients = {
    { name = data_util.mod_prefix .. "fusion-test-data", amount = 1, catalyst_amount = 1},
    { type = "fluid", name = data_util.mod_prefix .. "particle-stream", amount = 50},
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-supercooled", amount = 25},
  },
  results = {
    { name = "iron-ore", amount = 10},
    { name = data_util.mod_prefix .. "contaminated-scrap", amount = 1},
    { name = data_util.mod_prefix .. "fusion-test-data", amount_min = 1, amount_max = 1, probability = 0.99},
    { name = data_util.mod_prefix .. "junk-data", amount_min = 1, amount_max = 1, probability = 0.01},
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 25},
  },
  energy_required = 1,
  category = "space-materialisation",
  icons = data_util.transition_icons(
    {
      icon = data.raw.fluid[data_util.mod_prefix .. "particle-stream"].icon,
      icon_size = data.raw.fluid[data_util.mod_prefix .. "particle-stream"].icon_size
    },
    {
      icon = data.raw.item["iron-ore"].icon,
      icon_size = data.raw.item["iron-ore"].icon_size
    }
  ),
  subgroup = "space-components",
  enabled = false,
  allow_as_intermediate = false,
  always_show_made_in = true,
  localised_name = {"recipe-name.se-matter-fusion-to", {"item-name.iron-ore"}}
})

  type = "recipe",
  name = data_util.mod_prefix .. "matter-fusion-copper",
  ingredients = {
    { name = data_util.mod_prefix .. "fusion-test-data", amount = 1, catalyst_amount = 1},
    { type = "fluid", name = data_util.mod_prefix .. "particle-stream", amount = 50},
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-supercooled", amount = 25},
  },
  results = {
    { name = "copper-ore", amount = 10},
    { name = data_util.mod_prefix .. "contaminated-scrap", amount = 1},
    { name = data_util.mod_prefix .. "fusion-test-data", amount_min = 1, amount_max = 1, probability = 0.99},
    { name = data_util.mod_prefix .. "junk-data", amount_min = 1, amount_max = 1, probability = 0.01},
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 25},
  },
  energy_required = 1,
  category = "space-materialisation",
  icons = data_util.transition_icons(
    {
      icon = data.raw.fluid[data_util.mod_prefix .. "particle-stream"].icon,
      icon_size = data.raw.fluid[data_util.mod_prefix .. "particle-stream"].icon_size
    },
    {
      icon = data.raw.item["copper-ore"].icon,
      icon_size = data.raw.item["copper-ore"].icon_size
    }
  ),
  subgroup = "space-components",
  enabled = false,
  allow_as_intermediate = false,
  always_show_made_in = true,
  localised_name = {"recipe-name.se-matter-fusion-to", {"item-name.copper-ore"}}
})

  type = "recipe",
  name = data_util.mod_prefix .. "matter-fusion-stone",
  ingredients = {
    { name = data_util.mod_prefix .. "fusion-test-data", amount = 1, catalyst_amount = 1},
    { type = "fluid", name = data_util.mod_prefix .. "particle-stream", amount = 50},
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-supercooled", amount = 25},
  },
  results = {
    { name = "stone", amount = 10},
    { name = data_util.mod_prefix .. "contaminated-scrap", amount = 1},
    { name = data_util.mod_prefix .. "fusion-test-data", amount_min = 1, amount_max = 1, probability = 0.99},
    { name = data_util.mod_prefix .. "junk-data", amount_min = 1, amount_max = 1, probability = 0.01},
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 25},
  },
  energy_required = 1,
  category = "space-materialisation",
  icons = data_util.transition_icons(
    {
      icon = data.raw.fluid[data_util.mod_prefix .. "particle-stream"].icon,
      icon_size = data.raw.fluid[data_util.mod_prefix .. "particle-stream"].icon_size
    },
    {
      icon = data.raw.item["stone"].icon,
      icon_size = data.raw.item["stone"].icon_size
    }
  ),
  subgroup = "space-components",
  enabled = false,
  allow_as_intermediate = false,
  always_show_made_in = true,
  localised_name = {"recipe-name.se-matter-fusion-to", {"item-name.stone"}}
})

  type = "recipe",
  name = data_util.mod_prefix .. "matter-fusion-uranium",
  ingredients = {
    { name = data_util.mod_prefix .. "fusion-test-data", amount = 1, catalyst_amount = 1},
    { type = "fluid", name = data_util.mod_prefix .. "particle-stream", amount = 50},
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-supercooled", amount = 25},
  },
  results = {
    { name = "uranium-ore", amount_min = 1, amount_max = 1, probability = 0.5},
    { name = data_util.mod_prefix .. "contaminated-scrap", amount = 1},
    { name = data_util.mod_prefix .. "fusion-test-data", amount_min = 1, amount_max = 1, probability = 0.99},
    { name = data_util.mod_prefix .. "junk-data", amount_min = 1, amount_max = 1, probability = 0.01},
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 25},
  },
  energy_required = 6,
  category = "space-materialisation",
  icons = data_util.transition_icons(
    {
      icon = data.raw.fluid[data_util.mod_prefix .. "particle-stream"].icon,
      icon_size = data.raw.fluid[data_util.mod_prefix .. "particle-stream"].icon_size
    },
    {
      icon = data.raw.item["uranium-ore"].icon,
      icon_size = data.raw.item["uranium-ore"].icon_size
    }
  ),
  subgroup = "space-components",
  enabled = false,
  allow_as_intermediate = false,
  always_show_made_in = true,
  localised_name = {"recipe-name.se-matter-fusion-to", {"item-name.uranium-ore"}}
})

  type = "recipe",
  name = data_util.mod_prefix .. "matter-fusion-beryllium",
  ingredients = {
    { name = data_util.mod_prefix .. "fusion-test-data", amount = 1, catalyst_amount = 1},
    { type = "fluid", name = data_util.mod_prefix .. "particle-stream", amount = 50},
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-supercooled", amount = 25},
  },
  results = {
    { name = data_util.mod_prefix .."beryllium-ore", amount = 1},
    { name = data_util.mod_prefix .. "contaminated-scrap", amount = 1},
    { name = data_util.mod_prefix .. "fusion-test-data", amount_min = 1, amount_max = 1, probability = 0.99},
    { name = data_util.mod_prefix .. "junk-data", amount_min = 1, amount_max = 1, probability = 0.01},
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 25},
  },
  energy_required = 6,
  category = "space-materialisation",
  icons = data_util.transition_icons(
    {
      icon = data.raw.fluid[data_util.mod_prefix .. "particle-stream"].icon,
      icon_size = data.raw.fluid[data_util.mod_prefix .. "particle-stream"].icon_size
    },
    {
      icon = data.raw.item[data_util.mod_prefix .."beryllium-ore"].icon,
      icon_size = data.raw.item[data_util.mod_prefix .."beryllium-ore"].icon_size
    }
  ),
  subgroup = "space-components",
  enabled = false,
  allow_as_intermediate = false,
  always_show_made_in = true,
  localised_name = {"recipe-name.se-matter-fusion-to", {"item-name." .. data_util.mod_prefix .."beryllium-ore"}}
})

  type = "recipe",
  name = data_util.mod_prefix .. "matter-fusion-holmium",
  ingredients = {
    { name = data_util.mod_prefix .. "fusion-test-data", amount = 1, catalyst_amount = 1},
    { type = "fluid", name = data_util.mod_prefix .. "particle-stream", amount = 50},
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-supercooled", amount = 25},
  },
  results = {
    { name = data_util.mod_prefix .."holmium-ore", amount = 1},
    { name = data_util.mod_prefix .. "contaminated-scrap", amount = 1},
    { name = data_util.mod_prefix .. "fusion-test-data", amount_min = 1, amount_max = 1, probability = 0.99},
    { name = data_util.mod_prefix .. "junk-data", amount_min = 1, amount_max = 1, probability = 0.01},
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 25},
  },
  energy_required = 6,
  category = "space-materialisation",
  icons = data_util.transition_icons(
    {
      icon = data.raw.fluid[data_util.mod_prefix .. "particle-stream"].icon,
      icon_size = data.raw.fluid[data_util.mod_prefix .. "particle-stream"].icon_size
    },
    {
      icon = data.raw.item[data_util.mod_prefix .."holmium-ore"].icon,
      icon_size = data.raw.item[data_util.mod_prefix .."holmium-ore"].icon_size
    }
  ),
  subgroup = "space-components",
  enabled = false,
  allow_as_intermediate = false,
  always_show_made_in = true,
  localised_name = {"recipe-name.se-matter-fusion-to", {"item-name." .. data_util.mod_prefix .."holmium-ore"}}
})

  type = "recipe",
  name = data_util.mod_prefix .. "matter-fusion-iridium",
  ingredients = {
    { name = data_util.mod_prefix .. "fusion-test-data", amount = 1, catalyst_amount = 1},
    { type = "fluid", name = data_util.mod_prefix .. "particle-stream", amount = 50},
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-supercooled", amount = 25},
  },
  results = {
    { name = data_util.mod_prefix .."iridium-ore", amount = 1},
    { name = data_util.mod_prefix .. "contaminated-scrap", amount = 1},
    { name = data_util.mod_prefix .. "fusion-test-data", amount_min = 1, amount_max = 1, probability = 0.99},
    { name = data_util.mod_prefix .. "junk-data", amount_min = 1, amount_max = 1, probability = 0.01},
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 25},
  },
  energy_required = 6,
  category = "space-materialisation",
  icons = data_util.transition_icons(
    {
      icon = data.raw.fluid[data_util.mod_prefix .. "particle-stream"].icon,
      icon_size = data.raw.fluid[data_util.mod_prefix .. "particle-stream"].icon_size
    },
    {
      icon = data.raw.item[data_util.mod_prefix .."iridium-ore"].icon,
      icon_size = data.raw.item[data_util.mod_prefix .."iridium-ore"].icon_size
    }
  ),
  subgroup = "space-components",
  enabled = false,
  allow_as_intermediate = false,
  always_show_made_in = true,
  localised_name = {"recipe-name.se-matter-fusion-to", {"item-name." .. data_util.mod_prefix .."iridium-ore"}}
})

  type = "recipe",
  name = data_util.mod_prefix .. "matter-fusion-vulcanite",
  ingredients = {
    { name = data_util.mod_prefix .. "fusion-test-data", amount = 1, catalyst_amount = 1},
    { type = "fluid", name = data_util.mod_prefix .. "particle-stream", amount = 50},
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-supercooled", amount = 25},
  },
  results = {
    { name = data_util.mod_prefix .."vulcanite", amount = 1},
    { name = data_util.mod_prefix .. "contaminated-scrap", amount = 1},
    { name = data_util.mod_prefix .. "fusion-test-data", amount_min = 1, amount_max = 1, probability = 0.99},
    { name = data_util.mod_prefix .. "junk-data", amount_min = 1, amount_max = 1, probability = 0.01},
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 25},
  },
  energy_required = 3,
  category = "space-materialisation",
  icons = data_util.transition_icons(
    {
      icon = data.raw.fluid[data_util.mod_prefix .. "particle-stream"].icon,
      icon_size = data.raw.fluid[data_util.mod_prefix .. "particle-stream"].icon_size
    },
    {
      icon = data.raw.item[data_util.mod_prefix .."vulcanite"].icon,
      icon_size = data.raw.item[data_util.mod_prefix .."vulcanite"].icon_size
    }
  ),
  subgroup = "space-components",
  enabled = false,
  allow_as_intermediate = false,
  always_show_made_in = true,
  localised_name = {"recipe-name.se-matter-fusion-to", {"item-name." .. data_util.mod_prefix .."vulcanite"}}
})

  type = "recipe",
  name = data_util.mod_prefix .. "matter-fusion-cryonite",
  ingredients = {
    { name = data_util.mod_prefix .. "fusion-test-data", amount = 1, catalyst_amount = 1},
    { type = "fluid", name = data_util.mod_prefix .. "particle-stream", amount = 50},
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-supercooled", amount = 25},
  },
  results = {
    { name = data_util.mod_prefix .."cryonite", amount = 1},
    { name = data_util.mod_prefix .. "contaminated-scrap", amount = 1},
    { name = data_util.mod_prefix .. "fusion-test-data", amount_min = 1, amount_max = 1, probability = 0.99},
    { name = data_util.mod_prefix .. "junk-data", amount_min = 1, amount_max = 1, probability = 0.01},
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 25},
  },
  energy_required = 3,
  category = "space-materialisation",
  icons = data_util.transition_icons(
    {
      icon = data.raw.fluid[data_util.mod_prefix .. "particle-stream"].icon,
      icon_size = data.raw.fluid[data_util.mod_prefix .. "particle-stream"].icon_size
    },
    {
      icon = data.raw.item[data_util.mod_prefix .."cryonite"].icon,
      icon_size = data.raw.item[data_util.mod_prefix .."cryonite"].icon_size
    }
  ),
  subgroup = "space-components",
  enabled = false,
  allow_as_intermediate = false,
  always_show_made_in = true,
  localised_name = {"recipe-name.se-matter-fusion-to", {"item-name." .. data_util.mod_prefix .."cryonite"}}
})
local data_util = require("data_util")
local make_recipe = data_util.make_recipe

  type = "recipe",
  name = data_util.mod_prefix .. "compressive-strength-data",
  ingredients = {
    { name = data_util.mod_prefix .. "material-testing-pack", amount = 2},
    { name = "concrete", amount = 1},
    { name = data_util.mod_prefix .. "iridium-plate", amount = 1},
    { name = data_util.mod_prefix .. "empty-data", amount = 1},
    { type = "fluid", name = "lubricant", amount = 5},
  },
  results = {
    { name = data_util.mod_prefix .. "compressive-strength-data", amount = 1},
    { name = data_util.mod_prefix .. "iridium-plate", amount_min = 1, amount_max = 1, probability = 0.25},
    { name = data_util.mod_prefix .. "scrap", amount = 6},
    { type = "fluid", name = data_util.mod_prefix .. "contaminated-space-water", amount = 1},
  },
  energy_required = 10,
  main_product = data_util.mod_prefix .. "compressive-strength-data",
  category = "space-mechanical",
  enabled = false,
  always_show_made_in = true,
})

  type = "recipe",
  name = data_util.mod_prefix .. "tensile-strength-data",
  ingredients = {
    { name = data_util.mod_prefix .. "material-testing-pack", amount = 2},
    { name = "steel-plate", amount = 1},
    { name = data_util.mod_prefix .. "iridium-plate", amount = 1},
    { name = data_util.mod_prefix .. "empty-data", amount = 1},
    { type = "fluid", name = "lubricant", amount = 5},
  },
  results = {
    { name = data_util.mod_prefix .. "tensile-strength-data", amount = 1},
    { name = data_util.mod_prefix .. "iridium-plate", amount_min = 1, amount_max = 1, probability = 0.25},
    { name = data_util.mod_prefix .. "scrap", amount = 6},
    { type = "fluid", name = data_util.mod_prefix .. "contaminated-space-water", amount = 1},
  },
  energy_required = 10,
  main_product = data_util.mod_prefix .. "tensile-strength-data",
  category = "space-mechanical",
  enabled = false,
  always_show_made_in = true,
})
--[[
  type = "recipe",
  name = data_util.mod_prefix .. "shear-strength-data",
  ingredients = {
    { name = data_util.mod_prefix .. "material-testing-pack", amount = 1},
    { name = "refined-concrete", amount = 1},
    { name = data_util.mod_prefix .. "iridium-plate", amount = 1},
    { name = data_util.mod_prefix .. "empty-data", amount = 1},
    { type = "fluid", name = "lubricant", amount = 5},
  },
  results = {
    { name = data_util.mod_prefix .. "shear-strength-data", amount = 1},
    { name = data_util.mod_prefix .. "iridium-plate", amount_min = 1, amount_max = 1, probability = 0.5},
    { name = data_util.mod_prefix .. "scrap", amount = 5},
    { type = "fluid", name = data_util.mod_prefix .. "contaminated-space-water", amount = 1},
  },
  energy_required = 10,
  main_product = data_util.mod_prefix .. "shear-strength-data",
  category = "space-mechanical",
  enabled = false,
  always_show_made_in = true,
})]]

  type = "recipe",
  name = data_util.mod_prefix .. "rigidity-data",
  ingredients = {
    { name = data_util.mod_prefix .. "material-testing-pack", amount = 4},
    { name = data_util.mod_prefix .. "heavy-girder", amount = 1},
    { name = data_util.mod_prefix .. "empty-data", amount = 1},
    { type = "fluid", name = "lubricant", amount = 5},
  },
  results = {
    { name = data_util.mod_prefix .. "rigidity-data", amount = 1},
    { name = data_util.mod_prefix .. "heavy-girder", amount_min = 1, amount_max = 1, probability = 0.5},
    { name = data_util.mod_prefix .. "scrap", amount = 8},
    { type = "fluid", name = data_util.mod_prefix .. "contaminated-space-water", amount = 1},
  },
  energy_required = 10,
  main_product = data_util.mod_prefix .. "rigidity-data",
  category = "space-mechanical",
  enabled = false,
  always_show_made_in = true,
})

  type = "recipe",
  name = data_util.mod_prefix .. "impact-shielding-data",
  ingredients = {
    { name = "locomotive", amount = 1},
    { name = data_util.mod_prefix .. "iridium-plate", amount = 1},
    { name = data_util.mod_prefix .. "heavy-girder", amount = 1},
    { name = data_util.mod_prefix .. "empty-data", amount = 25},
    { type = "fluid", name = "lubricant", amount = 5},
  },
  results = {
    { name = data_util.mod_prefix .. "impact-shielding-data", amount = 25},
    { name = data_util.mod_prefix .. "heavy-girder", amount_min = 1, amount_max = 1, probability = 0.5},
    { name = data_util.mod_prefix .. "iridium-plate", amount_min = 1, amount_max = 1, probability = 0.25},
    { name = data_util.mod_prefix .. "scrap", amount = 1500},
  },
  energy_required = 200,
  main_product = data_util.mod_prefix .. "impact-shielding-data",
  category = "space-mechanical",
  enabled = false,
  always_show_made_in = true,
})


  type = "recipe",
  name = data_util.mod_prefix .. "ballistic-shielding-data",
  ingredients = {
    { name = "firearm-magazine", amount = 10},
    { name = data_util.mod_prefix .. "material-testing-pack", amount = 1},
    { name = data_util.mod_prefix .. "heavy-girder", amount = 1},
    { name = data_util.mod_prefix .. "iridium-plate", amount = 1},
    { name = data_util.mod_prefix .. "empty-data", amount = 1},
    { type = "fluid", name = "lubricant", amount = 5},
  },
  results = {
    { name = data_util.mod_prefix .. "ballistic-shielding-data", amount = 1},
    { name = data_util.mod_prefix .. "heavy-girder", amount_min = 1, amount_max = 1, probability = 0.75},
    { name = data_util.mod_prefix .. "iridium-plate", amount_min = 1, amount_max = 1, probability = 0.25},
    { name = data_util.mod_prefix .. "scrap", amount = 6},
    { type = "fluid", name = data_util.mod_prefix .. "contaminated-space-water", amount = 1},
  },
  energy_required = 10,
  main_product = data_util.mod_prefix .. "ballistic-shielding-data",
  category = "space-mechanical",
  enabled = false,
  always_show_made_in = true,
})

  type = "recipe",
  name = data_util.mod_prefix .. "friction-data",
  ingredients = {
    { name = data_util.mod_prefix .. "material-testing-pack", amount = 4},
    { name = data_util.mod_prefix .. "heavy-bearing", amount = 1},
    { name = data_util.mod_prefix .. "empty-data", amount = 1},
    { type = "fluid", name = "lubricant", amount = 10},
  },
  results = {
    { name = data_util.mod_prefix .. "friction-data", amount = 1},
    { name = data_util.mod_prefix .. "heavy-bearing", amount_min = 1, amount_max = 1, probability = 0.5},
    { name = data_util.mod_prefix .. "scrap", amount = 8},
    { type = "fluid", name = data_util.mod_prefix .. "contaminated-space-water", amount = 2},
  },
  energy_required = 5,
  main_product = data_util.mod_prefix .. "friction-data",
  category = "space-mechanical",
  enabled = false,
  always_show_made_in = true,
})

  type = "recipe",
  name = data_util.mod_prefix .. "biomechanical-data",
  ingredients = {
    { name = data_util.mod_prefix .. "specimen", amount = 2},
    { name = data_util.mod_prefix .. "empty-data", amount = 1},
    { type = "fluid", name = "lubricant", amount = 10},
  },
  results = {
    { name = data_util.mod_prefix .. "biomechanical-data", amount = 1},
    { type = "fluid", name = data_util.mod_prefix .. "contaminated-bio-sludge", amount = 20},
    { type = "fluid", name = data_util.mod_prefix .. "contaminated-space-water", amount = 10},
  },
  energy_required = 10,
  main_product = data_util.mod_prefix .. "biomechanical-data",
  category = "space-mechanical",
  enabled = false,
  always_show_made_in = true,
})

  type = "recipe",
  name = data_util.mod_prefix .. "biomechanical-resistance-data",
  ingredients = {
    { name = data_util.mod_prefix .. "experimental-specimen", amount = 1},
    { name = data_util.mod_prefix .. "biomechanical-data", amount = 1},
    { type = "fluid", name = "lubricant", amount = 5},
  },
  results = {
    { name = data_util.mod_prefix .. "biomechanical-resistance-data", amount = 1},
    { name = data_util.mod_prefix .. "experimental-specimen", amount_min = 1, amount_max = 1, probability = 0.25},
    { type = "fluid", name = data_util.mod_prefix .. "contaminated-bio-sludge", amount = 7},
    { type = "fluid", name = data_util.mod_prefix .. "contaminated-space-water", amount = 1},
  },
  energy_required = 10,
  main_product = data_util.mod_prefix .. "biomechanical-resistance-data",
  category = "space-mechanical",
  enabled = false,
  always_show_made_in = true,
})


  type = "recipe",
  name = data_util.mod_prefix .. "decompression-data",
  ingredients = {
    { name = data_util.mod_prefix .. "experimental-specimen", amount = 1},
    { name = data_util.mod_prefix .. "empty-data", amount = 1},
  },
  results = {
    { name = data_util.mod_prefix .. "decompression-data", amount = 1},
    { type = "fluid", name = data_util.mod_prefix .. "contaminated-bio-sludge", amount_min = 1, amount_max = 10, probability = 1},
  },
  energy_required = 10,
  main_product = data_util.mod_prefix .. "decompression-data",
  category = "space-mechanical",
  enabled = false,
  always_show_made_in = true,
})

  type = "recipe",
  name = data_util.mod_prefix .. "decompression-resistance-data",
  ingredients = {
    { name = data_util.mod_prefix .. "significant-specimen", amount = 1},
    { name = data_util.mod_prefix .. "vitalic-epoxy", amount = 1},
    { name = data_util.mod_prefix .. "empty-data", amount = 1},
  },
  results = {
    { name = data_util.mod_prefix .. "decompression-resistance-data", amount_min = 1, amount_max = 1, probability = 0.5},
    { name = data_util.mod_prefix .. "significant-specimen", amount_min = 1, amount_max = 1, probability = 0.5},
    { name = data_util.mod_prefix .. "junk-data", amount_min = 1, amount_max = 1, probability = 0.49},
    { type = "fluid", name = data_util.mod_prefix .. "contaminated-bio-sludge", amount_min = 1, amount_max = 5, probability = 1},
  },
  energy_required = 10,
  main_product = data_util.mod_prefix .. "decompression-resistance-data",
  category = "space-mechanical",
  enabled = false,
  always_show_made_in = true,
})

  type = "recipe",
  name = data_util.mod_prefix .. "naquium-structural-data",
  ingredients = {
    { name = data_util.mod_prefix .. "naquium-ingot", amount = 1},
    { type = "fluid", name = "lubricant", amount = 2},
    { name = data_util.mod_prefix .. "empty-data", amount = 1},
  },
  results = {
    { name = data_util.mod_prefix .. "naquium-structural-data", amount = 1},
  },
  energy_required = 4,
  main_product = data_util.mod_prefix .. "naquium-structural-data",
  category = "space-mechanical",
  enabled = false,
  always_show_made_in = true,
})
local data_util = require("data_util")
local make_recipe = data_util.make_recipe
local obs_types = data_util.obs_types

  type = "recipe",
  name = data_util.mod_prefix .. "observation-frame-gammaray",
  ingredients = {
    { data_util.mod_prefix .. "observation-frame-blank", 12 },
    { data_util.mod_prefix .. "gammaray-detector", 1 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-supercooled", amount = 3},
  },
  results = {
    { data_util.mod_prefix .. "observation-frame-gammaray", 12 },
    { name = data_util.mod_prefix .. "scrap", amount_min = 1, amount_max = 1, probability = 0.5 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 3},
  },
  energy_required = 16,
  --energy_required = math.ceil(2 + 20 / 5 * 12 / (obs_types["gammaray"][2] / obs_types["gammaray"][3])), -- base, size, results, required, success
  main_product = data_util.mod_prefix .. "observation-frame-gammaray",
  icon = "__space-exploration-graphics__/graphics/icons/observation-frame-gammaray.png",
  icon_size = 64, icon_mipmaps = 1,
  category = "space-observation-gammaray",
  enabled = false,
  always_show_made_in = true,
})

  type = "recipe",
  name = data_util.mod_prefix .. "observation-frame-xray",
  ingredients = {
    { data_util.mod_prefix .. "observation-frame-blank", 12 },
    { data_util.mod_prefix .. "space-mirror", 1 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-supercooled", amount = 4},
  },
  results = {
    { data_util.mod_prefix .. "observation-frame-xray", 12 },
    { name = data_util.mod_prefix .. "scrap", amount_min = 1, amount_max = 1, probability = 0.25 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 4},
  },
  energy_required = 12,
  --energy_required = math.ceil(2 + 20 / 5 * 12 / (obs_types["xray"][2] / obs_types["xray"][3])), -- base, size, results, required, success
  main_product = data_util.mod_prefix .. "observation-frame-xray",
  icon = "__space-exploration-graphics__/graphics/icons/observation-frame-xray.png",
  icon_size = 64, icon_mipmaps = 1,
  category = "space-observation-xray",
  enabled = false,
  always_show_made_in = true,
})

  type = "recipe",
  name = data_util.mod_prefix .. "observation-frame-uv",
  ingredients = {
    { data_util.mod_prefix .. "observation-frame-blank", 1 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-cold", amount = 8},
  },
  results = {
    { data_util.mod_prefix .. "observation-frame-uv", 1 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 8},
  },
  energy_required = math.ceil(2 + 100 / 3 * 1 / (obs_types["uv"][2] / obs_types["uv"][3])), -- base, size, results, required, success
  main_product = data_util.mod_prefix .. "observation-frame-uv",
  icon = "__space-exploration-graphics__/graphics/icons/observation-frame-uv.png",
  icon_size = 64, icon_mipmaps = 1,
  category = "space-observation-uv",
  enabled = false,
  always_show_made_in = true,
})

  type = "recipe",
  name = data_util.mod_prefix .. "observation-frame-visible",
  ingredients = {
    { data_util.mod_prefix .. "observation-frame-blank", 1 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-cold", amount = 8},
  },
  results = {
    { data_util.mod_prefix .. "observation-frame-visible", 1 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 8},
  },
  energy_required = math.ceil(2 + 100 / 3 * 1 / (obs_types["visible"][2] / obs_types["visible"][3])), -- base, size, results, required, success
  main_product = data_util.mod_prefix .. "observation-frame-visible",
  icon = "__space-exploration-graphics__/graphics/icons/observation-frame-visible.png",
  icon_size = 64, icon_mipmaps = 1,
  category = "space-observation-visible",
  enabled = false,
  always_show_made_in = true,
})

  type = "recipe",
  name = data_util.mod_prefix .. "observation-frame-infrared",
  ingredients = {
    { data_util.mod_prefix .. "observation-frame-blank", 1 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-cold", amount = 6},
  },
  results = {
    { data_util.mod_prefix .. "observation-frame-infrared", 1 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 6},
  },
  energy_required = math.ceil(2 + 100 / 3 * 1 / (obs_types["infrared"][2] / obs_types["infrared"][3])), -- base, size, results, required, success
  main_product = data_util.mod_prefix .. "observation-frame-infrared",
  icon = "__space-exploration-graphics__/graphics/icons/observation-frame-infrared.png",
  icon_size = 64, icon_mipmaps = 1,
  category = "space-observation-infrared",
  enabled = false,
  always_show_made_in = true,
})

  type = "recipe",
  name = data_util.mod_prefix .. "observation-frame-microwave",
  ingredients = {
    { data_util.mod_prefix .. "observation-frame-blank", 1 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-supercooled", amount = 5},
  },
  results = {
    { data_util.mod_prefix .. "observation-frame-microwave", 1 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 5},
  },
  energy_required = math.ceil(2 + 150 / 9 * 1 / (obs_types["microwave"][2] / obs_types["microwave"][3])), -- base, size, results, required, success
  main_product = data_util.mod_prefix .. "observation-frame-microwave",
  icon = "__space-exploration-graphics__/graphics/icons/observation-frame-microwave.png",
  icon_size = 64, icon_mipmaps = 1,
  category = "space-observation-microwave",
  enabled = false,
  always_show_made_in = true,
})

  type = "recipe",
  name = data_util.mod_prefix .. "observation-frame-radio",
  ingredients = {
    { data_util.mod_prefix .. "observation-frame-blank", 1 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-supercooled", amount = 4},
  },
  results = {
    { data_util.mod_prefix .. "observation-frame-radio", 1 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 4},
  },
  energy_required = math.ceil(2 + 150 / 9 * 1 / (obs_types["radio"][2] / obs_types["radio"][3])), -- base, size, results, required, success
  main_product = data_util.mod_prefix .. "observation-frame-radio",
  icon = "__space-exploration-graphics__/graphics/icons/observation-frame-radio.png",
  icon_size = 64, icon_mipmaps = 1,
  category = "space-observation-radio",
  enabled = false,
  always_show_made_in = true,
})
local data_util = require("data_util")
local make_recipe = data_util.make_recipe

-- accelerator
  type = "recipe",
  name = data_util.mod_prefix .. "ion-stream",
  ingredients = {
    { name = "copper-plate", amount = 1},
    { type = "fluid", name = data_util.mod_prefix .. "plasma-stream", amount = 100},
  },
  results = {
    { type = "fluid", name = data_util.mod_prefix .. "ion-stream", amount = 100},
  },
  energy_required = 10,
  category = "space-accelerator",
  enabled = false,
  always_show_made_in = true,
})

  type = "recipe",
  name = data_util.mod_prefix .. "proton-stream",
  ingredients = {
    { name = "iron-plate", amount = 1},
    { type = "fluid", name = data_util.mod_prefix .. "plasma-stream", amount = 100},
  },
  results = {
    { type = "fluid", name = data_util.mod_prefix .. "proton-stream", amount = 100},
  },
  energy_required = 20,
  category = "space-accelerator",
  enabled = false,
  always_show_made_in = true,
})

  type = "recipe",
  name = data_util.mod_prefix .. "particle-stream",
  ingredients = {
    { name = data_util.mod_prefix .. "material-testing-pack", amount = 1},
    { name = "sand", amount = 5},
    { type = "fluid", name = data_util.mod_prefix .. "plasma-stream", amount = 100},
  },
  results = {
    { type = "fluid", name = data_util.mod_prefix .. "particle-stream", amount = 200},
  },
  energy_required = 30,
  category = "space-accelerator",
  enabled = false,
  always_show_made_in = true,
})

-- collider
  type = "recipe",
  name = data_util.mod_prefix .. "empty-antimatter-canister",
  ingredients = {
    { name = data_util.mod_prefix .. "antimatter-canister", amount = 1},
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-supercooled", amount = 100},
  },
  results = {
    { type = "fluid", name = data_util.mod_prefix .. "antimatter-stream", amount=1000},
    { data_util.mod_prefix .. "magnetic-canister", 1},
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 100},
  },
  icons = {
    { icon = data.raw.item[data_util.mod_prefix .. "magnetic-canister"].icon, scale = 1, icon_size = 64  },
    { icon = data.raw.fluid[data_util.mod_prefix .. "antimatter-stream"].icon, scale = 1, icon_size = 64  },
  },
  subgroup = "space-fluids",
  energy_required = 30,
  category = "space-accelerator",
  enabled = false,
  always_show_made_in = true,
})
local data_util = require("data_util")
local make_recipe = data_util.make_recipe

-- collider
  type = "recipe",
  name = data_util.mod_prefix .. "antimatter-canister",
  ingredients = {
    { data_util.mod_prefix .. "magnetic-canister", 1},
    { type = "fluid", name = data_util.mod_prefix .. "antimatter-stream", amount=1000},
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-supercooled", amount = 100},
  },
  results = {
    { name = data_util.mod_prefix .. "antimatter-canister", amount = 1},
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 100},
  },
  energy_required = 4,
  main_product = data_util.mod_prefix .. "antimatter-canister",
  category = "space-collider",
  enabled = false,
  always_show_made_in = true,
})


  type = "recipe",
  name = data_util.mod_prefix .. "atomic-data",
  ingredients = {
    { data_util.mod_prefix .. "material-testing-pack", 1},
    { data_util.mod_prefix .. "empty-data", 1},
    { type = "fluid", name = data_util.mod_prefix .. "ion-stream", amount=100},
  },
  results = {
    { name = data_util.mod_prefix .. "atomic-data", amount = 1},
    { name = data_util.mod_prefix .. "contaminated-scrap", amount = 8},
  },
  energy_required = 2,
  main_product = data_util.mod_prefix .. "atomic-data",
  category = "space-collider",
  enabled = false,
  always_show_made_in = true,
})

  type = "recipe",
  name = data_util.mod_prefix .. "boson-data",
  ingredients = {
    { data_util.mod_prefix .. "empty-data", 1},
    { type = "fluid", name = data_util.mod_prefix .. "particle-stream", amount = 15},
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-supercooled", amount = 10},
  },
  results = {
    { name = data_util.mod_prefix .. "boson-data", amount_min = 1, amount_max = 1, probability = 0.2},
    { name = data_util.mod_prefix .. "junk-data", amount_min = 1, amount_max = 1, probability = 0.79},
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 10},
  },
  energy_required = 5,
  main_product = data_util.mod_prefix .. "boson-data",
  category = "space-collider",
  enabled = false,
  always_show_made_in = true,
})

  type = "recipe",
  name = data_util.mod_prefix .. "entanglement-data",
  ingredients = {
    { data_util.mod_prefix .. "empty-data", 1},
    { type = "fluid", name = data_util.mod_prefix .. "ion-stream", amount = 20},
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-supercooled", amount = 10},
  },
  results = {
    { name = data_util.mod_prefix .. "entanglement-data", amount_min = 1, amount_max = 1, probability = 0.2},
    { name = data_util.mod_prefix .. "junk-data", amount_min = 1, amount_max = 1, probability = 0.79},
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 10},
  },
  energy_required = 4,
  main_product = data_util.mod_prefix .. "entanglement-data",
  category = "space-collider",
  enabled = false,
  always_show_made_in = true,
})

  type = "recipe",
  name = data_util.mod_prefix .. "singularity-data",
  ingredients = {
    { data_util.mod_prefix .. "naquium-cube", 1},
    { data_util.mod_prefix .. "entanglement-data", 1},
    { type = "fluid", name = data_util.mod_prefix .. "particle-stream", amount = 1},
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-supercooled", amount = 10},
  },
  results = {
  { name = data_util.mod_prefix .. "singularity-data", amount_min = 1, amount_max = 1, probability = 0.5},
    { name = data_util.mod_prefix .. "naquium-cube", amount_min = 1, amount_max = 1, probability = 0.5},
    { name = data_util.mod_prefix .. "junk-data", amount_min = 1, amount_max = 1, probability = 0.49},
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 10},
  },
  energy_required = 5,
  main_product = data_util.mod_prefix .. "singularity-data",
  category = "space-collider",
  enabled = false,
  always_show_made_in = true,
})

  type = "recipe",
  name = data_util.mod_prefix .. "lepton-data",
  ingredients = {
    { data_util.mod_prefix .. "empty-data", 1},
    { type = "fluid", name = data_util.mod_prefix .. "particle-stream", amount = 20},
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-supercooled", amount = 10},
  },
  results = {
    { name = data_util.mod_prefix .. "lepton-data", amount_min = 1, amount_max = 1, probability = 0.4},
    { name = data_util.mod_prefix .. "junk-data", amount_min = 1, amount_max = 1, probability = 0.59},
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 10},
  },
  energy_required = 5,
  main_product = data_util.mod_prefix .. "lepton-data",
  category = "space-collider",
  enabled = false,
  always_show_made_in = true,
})

  type = "recipe",
  name = data_util.mod_prefix .. "magnetic-monopole-data",
  ingredients = {
    { data_util.mod_prefix .. "electromagnetic-field-data", 1},
    { type = "fluid", name = data_util.mod_prefix .. "proton-stream", amount = 1},
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-supercooled", amount = 10},
  },
  results = {
    { name = data_util.mod_prefix .. "magnetic-monopole-data", amount_min = 1, amount_max = 1, probability = 0.3},
    { name = data_util.mod_prefix .. "junk-data", amount_min = 1, amount_max = 1, probability = 0.69},
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 10},
  },
  energy_required = 5,
  main_product = data_util.mod_prefix .. "magnetic-monopole-data",
  category = "space-collider",
  enabled = false,
  always_show_made_in = true,
})

  type = "recipe",
  name = data_util.mod_prefix .. "micro-black-hole-data",
  ingredients = {
    { data_util.mod_prefix .. "empty-data", 1},
    { type = "fluid", name = data_util.mod_prefix .. "particle-stream", amount = 1},
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-supercooled", amount = 10},
  },
  results = {
    { name = data_util.mod_prefix .. "micro-black-hole-data", amount_min = 1, amount_max = 1, probability = 0.2},
    { name = data_util.mod_prefix .. "junk-data", amount_min = 1, amount_max = 1, probability = 0.79},
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 10},
  },
  energy_required = 5,
  main_product = data_util.mod_prefix .. "micro-black-hole-data",
  category = "space-collider",
  enabled = false,
  always_show_made_in = true,
})

  type = "recipe",
  name = data_util.mod_prefix .. "quark-data",
  ingredients = {
    { data_util.mod_prefix .. "empty-data", 1},
    { type = "fluid", name = data_util.mod_prefix .. "proton-stream", amount = 20},
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-supercooled", amount = 10},
  },
  results = {
    { name = data_util.mod_prefix .. "quark-data", amount_min = 1, amount_max = 1, probability = 0.5},
    { name = data_util.mod_prefix .. "junk-data", amount_min = 1, amount_max = 1, probability = 0.49},
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 10},
  },
  energy_required = 5,
  main_product = data_util.mod_prefix .. "quark-data",
  category = "space-collider",
  enabled = false,
  always_show_made_in = true,
})

  type = "recipe",
  name = data_util.mod_prefix .. "subatomic-data",
  ingredients = {
    { data_util.mod_prefix .. "empty-data", 1},
    { type = "fluid", name = data_util.mod_prefix .. "proton-stream", amount = 20},
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-supercooled", amount = 10},
  },
  results = {
    { name = data_util.mod_prefix .. "subatomic-data", amount_min = 1, amount_max = 1, probability = 0.6},
    { name = data_util.mod_prefix .. "junk-data", amount_min = 1, amount_max = 1, probability = 0.39},
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 10},
  },
  energy_required = 5,
  main_product = data_util.mod_prefix .. "subatomic-data",
  category = "space-collider",
  enabled = false,
  always_show_made_in = true,
})

  type = "recipe",
  name = data_util.mod_prefix .. "fusion-test-data",
  ingredients = {
    { name = data_util.mod_prefix .. "forcefield-data", amount = 1},
    { type = "fluid", name = data_util.mod_prefix .. "proton-stream", amount = 50},
  },
  results = {
    { name = data_util.mod_prefix .. "fusion-test-data", amount = 1},
  },
  energy_required = 5,
  category = "space-collider",
  always_show_made_in = true,
})

  type = "recipe",
  name = data_util.mod_prefix .. "particle-beam-shielding-data",
  ingredients = {
    { name = data_util.mod_prefix .. "empty-data", amount = 1 },
    { type = "fluid", name = data_util.mod_prefix .. "particle-stream", amount = 10},
    { name = data_util.mod_prefix .. "space-platform-plating", amount = 1 },
    { name = data_util.mod_prefix .. "iridium-plate", amount = 1},
  },
  results = {
    { name = data_util.mod_prefix .. "particle-beam-shielding-data", amount = 1},
    { name = data_util.mod_prefix .. "contaminated-scrap", amount = 15},
    { name = data_util.mod_prefix .. "iridium-plate", amount_min = 1, amount_max = 1, probability = 0.2 },
  },
  energy_required = 5,
  main_product = data_util.mod_prefix .. "particle-beam-shielding-data",
  category = "space-collider",
  enabled = false,
  always_show_made_in = true,
})

  type = "recipe",
  name = data_util.mod_prefix .. "annihilation-data",
  ingredients = {
    { name = data_util.mod_prefix .. "empty-data", amount = 1 },
    { type = "fluid", name = data_util.mod_prefix .. "particle-stream", amount = 5},
    { type = "fluid", name = data_util.mod_prefix .. "antimatter-stream", amount = 5 },
  },
  results = {
    { name = data_util.mod_prefix .. "annihilation-data", amount = 1 },
  },
  energy_required = 5,
  main_product = data_util.mod_prefix .. "annihilation-data",
  category = "space-collider",
  enabled = false,
  always_show_made_in = true,
})
local data_util = require("data_util")
local make_recipe = data_util.make_recipe

-- plasma
  type = "recipe",
  name = data_util.mod_prefix .. "plasma-canister",
  ingredients = {
    { data_util.mod_prefix .. "magnetic-canister", 1},
    { type = "fluid", name = data_util.mod_prefix .. "plasma-stream", amount=1000},
  },
  results = {
    { data_util.mod_prefix .. "plasma-canister", 1},
  },
  energy_required = 30,
  category = "space-plasma",
  enabled = false,
  always_show_made_in = true,
})

  type = "recipe",
  name = data_util.mod_prefix .. "plasma-canister-empty",
  ingredients = {
    { data_util.mod_prefix .. "plasma-canister", 1},
  },
  results = {
    { type = "fluid", name = data_util.mod_prefix .. "plasma-stream", amount=1000},
    { data_util.mod_prefix .. "magnetic-canister", 1},
  },
  main_product = data_util.mod_prefix .. "plasma-stream",
  energy_required = 2,
  category = "space-plasma",
  enabled = false,
  always_show_made_in = true,
  localised_name = {"recipe-name." .. data_util.mod_prefix .. "plasma-canister-empty"}
})

  type = "recipe",
  name = data_util.mod_prefix .. "plasma-stream",
  ingredients = {
    { name = "stone", amount = 1},
    { type = "fluid", name = data_util.mod_prefix .. "chemical-gel", amount = 10},
  },
  results = {
    { type = "fluid", name = data_util.mod_prefix .. "plasma-stream", amount = 100},
  },
  energy_required = 30,
  category = "space-plasma",
  enabled = false,
  always_show_made_in = true,
})
local data_util = require("data_util")
local make_recipe = data_util.make_recipe

data:extend({
  --[[{
    type = "recipe",
    name = "starfield-sparse",
    energy_required = 10,
    category = "crafting",
    ingredients =
    {
      {"iron-plate", 1}
    },
    result= "space",
    result_count = 10
  },]]--
  {
    type = "recipe",
    name = data_util.mod_prefix .. "space-platform-scaffold",
    energy_required = 1,
    category = "crafting",
    ingredients =
    {
      {"steel-plate", 1},
      {"low-density-structure", 1},
      {data_util.mod_prefix .. "heat-shielding", 1},
    },
    energy_required = 10,
    result = data_util.mod_prefix .. "space-platform-scaffold",
    result_count = 1,
    enabled = false,
    always_show_made_in = true,
  },
  {
    type = "recipe",
    name = data_util.mod_prefix .. "space-platform-plating",
    energy_required = 2,
    category = "crafting",
    ingredients =
    {
      {data_util.mod_prefix .. "space-platform-scaffold", 1},
      {data_util.mod_prefix .. "heavy-girder", 1},
      {"steel-plate", 4},
    },
    energy_required = 30,
    result = data_util.mod_prefix .. "space-platform-plating",
    result_count = 1,
    enabled = false,
    always_show_made_in = true,
  },
})
local data_util = require("data_util")
local make_recipe = data_util.make_recipe

  type = "recipe",
  name = data_util.mod_prefix .. "radiation-shielding-data",
  ingredients = {
    { name = data_util.mod_prefix .. "empty-data", amount = 1 },
    { name = "uranium-235", amount = 1 },
    { name = data_util.mod_prefix .. "material-testing-pack", amount = 4 },
    { name = data_util.mod_prefix .. "iridium-plate", amount = 1},
  },
  results = {
    { name = data_util.mod_prefix .. "radiation-shielding-data", amount = 1},
    { name = data_util.mod_prefix .. "contaminated-scrap", amount = 8},
    { name = "uranium-235", amount_min = 1, amount_max = 1, probability = 0.5 },
    { name = data_util.mod_prefix .. "iridium-plate", amount_min = 1, amount_max = 1, probability = 0.75 },
  },
  energy_required = 10,
  main_product = data_util.mod_prefix .. "radiation-shielding-data",
  category = "space-radiation",
  enabled = false,
  always_show_made_in = true,
})

  type = "recipe",
  name = data_util.mod_prefix .. "radiation-data",
  ingredients = {
    { name = data_util.mod_prefix .. "empty-data", amount = 1 },
    { name = "uranium-235", amount = 1 },
  },
  results = {
    { name = data_util.mod_prefix .. "radiation-data", amount = 1},
    { name = "uranium-235", amount_min = 1, amount_max = 1, probability = 0.5 },
  },
  energy_required = 8,
  main_product = data_util.mod_prefix .. "radiation-data",
  category = "space-radiation",
  enabled = false,
  always_show_made_in = true,
})

  type = "recipe",
  name = data_util.mod_prefix .. "radiation-exposure-data",
  ingredients = {
    { name = data_util.mod_prefix .. "empty-data", amount = 1 },
    { name = data_util.mod_prefix .. "specimen", amount = 1 },
    { name = "uranium-235", amount = 1 },
  },
  results = {
    { name = data_util.mod_prefix .. "radiation-exposure-data", amount = 1},
    { type = "fluid", name = data_util.mod_prefix .. "contaminated-bio-sludge", amount = 10},
    { name = "uranium-235", amount_min = 1, amount_max = 1, probability = 0.5 },
  },
  energy_required = 10,
  main_product = data_util.mod_prefix .. "radiation-exposure-data",
  category = "space-radiation",
  enabled = false,
  always_show_made_in = true,
})

  type = "recipe",
  name = data_util.mod_prefix .. "radiation-exposure-resistance-data",
  ingredients = {
    { name = data_util.mod_prefix .. "empty-data", amount = 1 },
    { name = data_util.mod_prefix .. "significant-specimen", amount = 1 },
    { name = "uranium-235", amount = 1 },
  },
  results = {
    { name = data_util.mod_prefix .. "radiation-exposure-resistance-data", amount = 1},
    { name = data_util.mod_prefix .. "significant-specimen", amount_min = 1, amount_max = 1, probability = 0.5 },
    { type = "fluid", name = data_util.mod_prefix .. "contaminated-bio-sludge", amount_min = 1, amount_max = 10, probability = 1 },
    { name = "uranium-235", amount_min = 1, amount_max = 1, probability = 0.5 },
  },
  energy_required = 10,
  main_product = data_util.mod_prefix .. "radiation-exposure-resistance-data",
  category = "space-radiation",
  enabled = false,
  always_show_made_in = true,
})
local data_util = require("data_util")
local make_recipe = data_util.make_recipe

  type = "recipe",
  name = data_util.mod_prefix .. "radiating-space-coolant-slow",
  ingredients = {
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 500}, -- 2.5/s
  },
  results = {
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-warm", amount = 499}, -- -0.2%
  },
  energy_required = 200,
  subgroup = "space-cooling",
  category = "space-radiator",
  localised_name = {"recipe-name." .. data_util.mod_prefix .. "radiating-space-coolant-slow"},
  enabled = false,
  always_show_made_in = true,
  order = "b-a",
})

  type = "recipe",
  name = data_util.mod_prefix .. "radiating-space-coolant-normal",
  ingredients = {
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 50}, -- 5/s
  },
  results = {
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-warm", amount = 49}, -- -2%
  },
  energy_required = 10,
  subgroup = "space-cooling",
  category = "space-radiator",
  localised_name = {"recipe-name." .. data_util.mod_prefix .. "radiating-space-coolant-normal"},
  enabled = false,
  always_show_made_in = true,
  order = "b-b",
})



  type = "recipe",
  name = data_util.mod_prefix .. "radiating-space-coolant-fast",
  ingredients = {
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 10}, -- 10/s
  },
  results = {
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-warm", amount = 9}, -- -10%
  },
  energy_required = 1,
  subgroup = "space-cooling",
  category = "space-radiator",
  localised_name = {"recipe-name." .. data_util.mod_prefix .. "radiating-space-coolant-fast"},
  enabled = false,
  always_show_made_in = true,
  order = "b-c",
})
local data_util = require("data_util")
local make_recipe = data_util.make_recipe

if not data.raw.recipe["sand-from-stone"] then
  data:extend({
    {
      ingredients = {
        { "stone", 1 }
      },
      name = "sand-from-stone",
      result = "sand",
      result_count = 2,
      type = "recipe",
      enabled = false,
      energy_required = 0.5,
    }
  })
end
data:extend({
  {
    ingredients = {
      { "stone", 1 }
    },
    name = data_util.mod_prefix .. "pulverised-sand",
    result = "sand",
    result_count = 3,
    type = "recipe",
    enabled = false,
    energy_required = 0.5,
    category = "pulverising",
    --localised_name = {"recipe-name."..data_util.mod_prefix .. "pulverised-sand"},
    always_show_made_in = true,
  }
})

if not data.raw.recipe["glass-from-sand"] then
  data:extend({
    {
      category = "smelting",
      enabled = true,
      energy_required = 4,
      ingredients = {
        { "sand", 4 }
      },
      name = "glass-from-sand",
      result = "glass",
      type = "recipe",
      enabled = false,
    },
  })
end

data:extend({
  {
      type = "recipe",
      name = data_util.mod_prefix .. "low-density-structure-beryllium",
      result = "low-density-structure",
      energy_required = 10,
      ingredients = {
        { name = data_util.mod_prefix .. "aeroframe-scaffold", amount = 2},
        { name = "glass", amount = 2},
        { "steel-plate", 2 },
        { "plastic-bar", 2 }
      },
      requester_paste_multiplier = 2,
      enabled = false,
      always_show_made_in = false,
      allow_as_intermediate = false,
  },
  {
      type = "recipe",
      name = data_util.mod_prefix .. "heat-shielding",
      result = data_util.mod_prefix .. "heat-shielding",
      energy_required = 10,
      ingredients = {
        { name = "stone-tablet", amount = 20},
        { "sulfur", 8 },
        { "steel-plate", 2 }
      },
      requester_paste_multiplier = 2,
      enabled = false,
      always_show_made_in = false,
  },
  {
      type = "recipe",
      name = data_util.mod_prefix .. "heat-shielding-iridium",
      result = data_util.mod_prefix .. "heat-shielding",
      energy_required = 10,
      ingredients = {
        { name = data_util.mod_prefix .. "iridium-plate", amount = 1},
        { name = "stone-tablet", amount = 4},
        { "sulfur", 1 },
      },
      requester_paste_multiplier = 2,
      enabled = false,
      always_show_made_in = true,
      allow_as_intermediate = false,
  },
  {
      type = "recipe",
      name = data_util.mod_prefix .. "processing-unit-holmium",
      result = "processing-unit",
      energy_required = 10,
      ingredients = {
        { "electronic-circuit", 10 },
        { "advanced-circuit", 1 },
		{ name = data_util.mod_prefix .. "holmium-cable", amount = 4},
        { type = "fluid", name = "sulfuric-acid", amount = 2 },
      },
      requester_paste_multiplier = 3,
      enabled = false,
      always_show_made_in = true,
      allow_as_intermediate = false,
	  category = "crafting-with-fluid",
  },
  {
    type = "recipe",
    name = data_util.mod_prefix .. "thruster-suit",
    result = data_util.mod_prefix .. "thruster-suit",
    enabled = false,
    energy_required = 30,
    ingredients = {
      { "rocket-control-unit", 10 },
      { data_util.mod_prefix .. "heat-shielding", 20 },
      { "low-density-structure", 20 },
      { "glass", 20 },
      { "jetpack-1", 1 },
      { data_util.mod_prefix .. "lifesupport-equipment-1", 1 },
    },
    requester_paste_multiplier = 1,
    always_show_made_in = false,
  },
  {
    type = "recipe",
    name = data_util.mod_prefix .. "thruster-suit-2",
    results = {
      { name=data_util.mod_prefix .. "thruster-suit-2", amount = 1},
    },
    main_product = data_util.mod_prefix .. "thruster-suit-2",
    enabled = false,
    energy_required = 30,
    ingredients = {
      { "processing-unit", 50 },
      { "rocket-fuel", 50 },
      { data_util.mod_prefix .. "iridium-plate", 50 },
      { data_util.mod_prefix .. "material-catalogue-1", 1 },
      { data_util.mod_prefix .. "thruster-suit", 1 },
    },
    requester_paste_multiplier = 1,
    always_show_made_in = false,
  },
  {
    type = "recipe",
    name = data_util.mod_prefix .. "thruster-suit-3",
    results = {
      { name=data_util.mod_prefix .. "thruster-suit-3", amount = 1},
    },
    main_product = data_util.mod_prefix .. "thruster-suit-3",
    enabled = false,
    energy_required = 30,
    ingredients = {
      { "processing-unit", 100 },
      { "rocket-fuel", 50 },
      { data_util.mod_prefix .. "superconductive-cable", 50 },
      { data_util.mod_prefix .. "astronomic-catalogue-1", 1 },
      { data_util.mod_prefix .. "biological-catalogue-1", 1 },
      { data_util.mod_prefix .. "energy-catalogue-3", 1 },
      { data_util.mod_prefix .. "material-catalogue-3", 1 },
      { data_util.mod_prefix .. "aeroframe-bulkhead", 1 },
      { data_util.mod_prefix .. "thruster-suit-2", 1 },
    },
    requester_paste_multiplier = 1,
    always_show_made_in = false,
  },
  {
    type = "recipe",
    name = data_util.mod_prefix .. "thruster-suit-4",
    results = {
      { name=data_util.mod_prefix .. "thruster-suit-4", amount = 1},
    },
    main_product = data_util.mod_prefix .. "thruster-suit-4",
    enabled = false,
    energy_required = 30,
    ingredients = {
      { "processing-unit", 200 },
      { data_util.mod_prefix .. "antimatter-canister", 10 },
      { data_util.mod_prefix .. "nanomaterial", 200 },
      { data_util.mod_prefix .. "superconductive-cable", 100 },
      { data_util.mod_prefix .. "naquium-plate", 100 },
      { data_util.mod_prefix .. "deep-catalogue-2", 1 },
      { data_util.mod_prefix .. "self-sealing-gel", 1 },
      { data_util.mod_prefix .. "lattice-pressure-vessel", 1 },
      { data_util.mod_prefix .. "naquium-processor", 1 },
      { data_util.mod_prefix .. "thruster-suit-3", 1 },
    },
    requester_paste_multiplier = 1,
    always_show_made_in = false,
  },
  {
    type = "recipe",
    name = data_util.mod_prefix .. "rtg-equipment",
    result = data_util.mod_prefix .. "rtg-equipment",
    enabled = false,
    energy_required = 10,
    ingredients = {
      { "processing-unit", 50 },
      { "low-density-structure", 50 },
      { "uranium-fuel-cell", 4 },
    },
    requester_paste_multiplier = 1,
    always_show_made_in = false,
  },
  {
    type = "recipe",
    name = data_util.mod_prefix .. "rtg-equipment-2",
    result = data_util.mod_prefix .. "rtg-equipment-2",
    enabled = false,
    energy_required = 10,
    ingredients = {
      { "processing-unit", 50 },
      { "low-density-structure", 100 },
      { data_util.mod_prefix .."atomic-data", 1 },
      { data_util.mod_prefix .."radiation-data", 1 },
      { data_util.mod_prefix .. "rtg-equipment", 4 },
      { data_util.mod_prefix .. "holmium-solenoid", 8 },
    },
    requester_paste_multiplier = 1,
    always_show_made_in = false,
  },
  {
    type = "recipe",
    name = data_util.mod_prefix .. "adaptive-armour-equipment-1",
    result = data_util.mod_prefix .. "adaptive-armour-equipment-1",
    enabled = false,
    energy_required = 10,
    ingredients = {
      { "steel-plate", 20 },
      { "advanced-circuit", 10 },
      { "battery", 5 },
    },
    requester_paste_multiplier = 1,
    always_show_made_in = false,
  },
  {
    type = "recipe",
    name = data_util.mod_prefix .. "adaptive-armour-equipment-2",
    result = data_util.mod_prefix .. "adaptive-armour-equipment-2",
    enabled = false,
    energy_required = 10,
    ingredients = {
      { "steel-plate", 30 },
      { "processing-unit", 10 },
      { "low-density-structure", 10 },
      { data_util.mod_prefix .. "adaptive-armour-equipment-1", 1 },
    },
    requester_paste_multiplier = 1,
    always_show_made_in = false,
  },
  {
    type = "recipe",
    name = data_util.mod_prefix .. "adaptive-armour-equipment-3",
    result = data_util.mod_prefix .. "adaptive-armour-equipment-3",
    enabled = false,
    energy_required = 10,
    ingredients = {
      { "steel-plate", 40 },
      { "processing-unit", 10 },
      { data_util.mod_prefix .. "heat-shielding", 10 },
      { data_util.mod_prefix .. "adaptive-armour-equipment-2", 1 },
    },
    requester_paste_multiplier = 1,
    always_show_made_in = false,
  },
  {
    type = "recipe",
    name = data_util.mod_prefix .. "adaptive-armour-equipment-4",
    result = data_util.mod_prefix .. "adaptive-armour-equipment-4",
    enabled = false,
    energy_required = 10,
    ingredients = {
      { "steel-plate", 50 },
      { "processing-unit", 20 },
      { data_util.mod_prefix .. "heat-shielding", 20 },
      { data_util.mod_prefix .. "adaptive-armour-equipment-3", 1 },
    },
    requester_paste_multiplier = 1,
    always_show_made_in = false,
  },
  {
    type = "recipe",
    name = data_util.mod_prefix .. "adaptive-armour-equipment-5",
    result = data_util.mod_prefix .. "adaptive-armour-equipment-5",
    enabled = false,
    energy_required = 10,
    ingredients = {
      { "steel-plate", 40 },
      { "processing-unit", 30 },
      { data_util.mod_prefix .. "nanomaterial", 10 },
      { data_util.mod_prefix .. "adaptive-armour-equipment-4", 1 },
    },
    requester_paste_multiplier = 1,
    always_show_made_in = false,
  },
  {
    type = "recipe",
    name = "energy-shield-mk3-equipment",
    result = "energy-shield-mk3-equipment",
    enabled = false,
    energy_required = 10,
    ingredients = {
      { "energy-shield-mk2-equipment", 5 },
    },
    requester_paste_multiplier = 1,
    always_show_made_in = false,
  },
  {
    type = "recipe",
    name = "energy-shield-mk4-equipment",
    result = "energy-shield-mk4-equipment",
    enabled = false,
    energy_required = 10,
    ingredients = {
      { "energy-shield-mk3-equipment", 5 },
    },
    requester_paste_multiplier = 1,
    always_show_made_in = false,
  },
  {
    type = "recipe",
    name = "energy-shield-mk5-equipment",
    result = "energy-shield-mk5-equipment",
    enabled = false,
    energy_required = 10,
    ingredients = {
      { "energy-shield-mk4-equipment", 5 },
    },
    requester_paste_multiplier = 1,
    always_show_made_in = false,
  },
  {
    type = "recipe",
    name = "energy-shield-mk6-equipment",
    result = "energy-shield-mk6-equipment",
    enabled = false,
    energy_required = 10,
    ingredients = {
      { "energy-shield-mk5-equipment", 5 },
    },
    requester_paste_multiplier = 1,
    always_show_made_in = false,
  },




  {
    type = "recipe",
    name = data_util.mod_prefix .. "aeroframe-pole",
    results = {{data_util.mod_prefix .. "aeroframe-pole", 2}},
    energy_required = 1,
    ingredients = {
      { data_util.mod_prefix .. "beryllium-plate", 1 },
    },
    requester_paste_multiplier = 1,
    always_show_made_in = false,
    enabled = false,
  },
  {
    type = "recipe",
    name = data_util.mod_prefix .. "aeroframe-scaffold",
    result = data_util.mod_prefix .. "aeroframe-scaffold",
    energy_required = 2,
    ingredients = {
      { data_util.mod_prefix .. "aeroframe-pole", 2 },
      { data_util.mod_prefix .. "beryllium-plate", 1 },
    },
    requester_paste_multiplier = 1,
    always_show_made_in = false,
    enabled = false,
  },
  {
    type = "recipe",
    name = data_util.mod_prefix .. "aeroframe-bulkhead",
    result = data_util.mod_prefix .. "aeroframe-bulkhead",
    energy_required = 4,
    ingredients = {
      { data_util.mod_prefix .. "aeroframe-scaffold", 1 },
      { "low-density-structure", 1 },
      { data_util.mod_prefix .. "beryllium-plate", 4 },
    },
    requester_paste_multiplier = 1,
    always_show_made_in = false,
    enabled = false,
  },
  {
    type = "recipe",
    name = data_util.mod_prefix .. "lattice-pressure-vessel",
    result = data_util.mod_prefix .. "lattice-pressure-vessel",
    energy_required = 3,
    ingredients = {
      { data_util.mod_prefix .. "beryllium-plate", 5 },
      { data_util.mod_prefix .. "cryonite-rod", 2 },
      { data_util.mod_prefix .. "vulcanite-block", 1 },
    },
    requester_paste_multiplier = 1,
    always_show_made_in = false,
    enabled = false,
    category="space-manufacturing"
  },

  {
    type = "recipe",
    name = data_util.mod_prefix .. "heavy-girder",
    result = data_util.mod_prefix .. "heavy-girder",
    energy_required = 1,
    ingredients = {
      { data_util.mod_prefix .. "iridium-plate", 2 },
    },
    requester_paste_multiplier = 1,
    always_show_made_in = false,
    enabled = false,
  },
  {
    type = "recipe",
    name = data_util.mod_prefix .. "heavy-bearing",
    result = data_util.mod_prefix .. "heavy-bearing",
    energy_required = 2,
    ingredients = {
      { data_util.mod_prefix .. "iridium-plate", 4 },
      { type="fluid", name="lubricant", amount=4 },
    },
    category="crafting-with-fluid",
    requester_paste_multiplier = 1,
    always_show_made_in = false,
    enabled = false,
  },
  {
    type = "recipe",
    name = data_util.mod_prefix .. "heavy-composite",
    result = data_util.mod_prefix .. "heavy-composite",
    energy_required = 3,
    ingredients = {
      { data_util.mod_prefix .. "iridium-plate", 4 },
      { data_util.mod_prefix .. "heavy-girder", 2 },
      { data_util.mod_prefix .. "heat-shielding", 4 },
    },
    requester_paste_multiplier = 1,
    always_show_made_in = false,
    enabled = false,
  },
  {
    type = "recipe",
    name = data_util.mod_prefix .. "heavy-assembly",
    result = data_util.mod_prefix .. "heavy-assembly",
    energy_required = 4,
    ingredients = {
      { data_util.mod_prefix .. "iridium-plate", 4 },
      { data_util.mod_prefix .. "heavy-bearing", 4 },
      { "iron-gear-wheel", 4 },
      { type="fluid", name="lubricant", amount=4 },
    },
    category="crafting-with-fluid",
    requester_paste_multiplier = 1,
    always_show_made_in = false,
    enabled = false,
  },


  {
    type = "recipe",
    name = data_util.mod_prefix .. "vitalic-acid",
    result = data_util.mod_prefix .. "vitalic-acid",
    energy_required = 1,
    ingredients = {
      { "glass", 1 },
      { data_util.mod_prefix .. "vitamelange-extract", 2 },
      { type = "fluid", name = "sulfuric-acid", amount = 2 },
    },
    requester_paste_multiplier = 1,
    always_show_made_in = false,
    enabled = false,
    category = "crafting-with-fluid",
  },
  {
    type = "recipe",
    name = data_util.mod_prefix .. "bioscrubber",
    result = data_util.mod_prefix .. "bioscrubber",
    energy_required = 2,
    ingredients = {
      { data_util.mod_prefix .. "vitalic-acid", 2 },
      { "glass", 1 },
      { "steel-plate", 1 },
    },
    requester_paste_multiplier = 1,
    always_show_made_in = true,
    enabled = false,
    category = "chemistry",
  },
  {
    type = "recipe",
    name = data_util.mod_prefix .. "vitalic-reagent",
    result = data_util.mod_prefix .. "vitalic-reagent",
    energy_required = 3,
    ingredients = {
      { data_util.mod_prefix .. "vitamelange-extract", 4 },
      { data_util.mod_prefix .. "vulcanite-block", 4 },
    },
    requester_paste_multiplier = 1,
    always_show_made_in = true,
    enabled = false,
    category = "chemistry",
  },
  {
    type = "recipe",
    name = data_util.mod_prefix .. "vitalic-epoxy",
    result = data_util.mod_prefix .. "vitalic-epoxy",
    energy_required = 4,
    ingredients = {
      { data_util.mod_prefix .. "vitalic-reagent", 2 },
      { data_util.mod_prefix .. "vitalic-acid", 2 },
      { "sulfur", 4 },
    },
    requester_paste_multiplier = 1,
    always_show_made_in = true,
    enabled = false,
    category = "chemistry",
  },
  {
    type = "recipe",
    name = data_util.mod_prefix .. "self-sealing-gel",
    result = data_util.mod_prefix .. "self-sealing-gel",
    energy_required = 5,
    ingredients = {
      { data_util.mod_prefix .. "vitalic-reagent", 2 },
      { data_util.mod_prefix .. "vitalic-epoxy", 2 },
      { data_util.mod_prefix .. "cryonite-rod", 2 },
    },
    requester_paste_multiplier = 1,
    always_show_made_in = true,
    enabled = false,
    category = "space-biochemical",
  },




  {
    type = "recipe",
    name = data_util.mod_prefix .. "holmium-cable",
    results = {{data_util.mod_prefix .. "holmium-cable", 2}},
    energy_required = 1,
    ingredients = {
      { data_util.mod_prefix .. "holmium-plate", 1 },
      { "plastic-bar", 1 },
    },
    requester_paste_multiplier = 1,
    always_show_made_in = false,
    enabled = false,
  },
  {
    type = "recipe",
    name = data_util.mod_prefix .. "holmium-solenoid",
    result = data_util.mod_prefix .. "holmium-solenoid",
    energy_required = 2,
    ingredients = {
      { data_util.mod_prefix .. "holmium-cable", 4 },
      { data_util.mod_prefix .. "holmium-plate", 1 },
    },
    requester_paste_multiplier = 1,
    always_show_made_in = false,
    enabled = false,
  },
  {
    type = "recipe",
    name = data_util.mod_prefix .. "quantum-processor",
    result = data_util.mod_prefix .. "quantum-processor",
    energy_required = 3,
    ingredients = {
      { "processing-unit", 1 },
      { data_util.mod_prefix .. "holmium-cable", 4 },
      { data_util.mod_prefix .. "holmium-plate", 1 },
      {data_util.mod_prefix .. "quantum-phenomenon-data", 1},
    },
    requester_paste_multiplier = 1,
    always_show_made_in = true,
    enabled = false,
    category="space-manufacturing"
  },
  {
    type = "recipe",
    name = data_util.mod_prefix .. "dynamic-emitter",
    result = data_util.mod_prefix .. "dynamic-emitter",
    energy_required = 4,
    ingredients = {
      { data_util.mod_prefix .. "holmium-solenoid", 1 },
      { data_util.mod_prefix .. "quantum-processor", 1 },
    },
    requester_paste_multiplier = 1,
    always_show_made_in = true,
    enabled = false,
    category="space-manufacturing"
  },

  {
    type = "recipe",
    name = data_util.mod_prefix .. "naquium-cube",
    result = data_util.mod_prefix .. "naquium-cube",
    energy_required = 10,
    ingredients = {
      { type="fluid", name = data_util.mod_prefix .. "particle-stream", amount = 16 },
      { data_util.mod_prefix .. "naquium-plate", 16 },
      { data_util.mod_prefix .. "nanomaterial", 1 },
      { data_util.mod_prefix .. "vulcanite-block", 1 },
    },
    requester_paste_multiplier = 1,
    always_show_made_in = true,
    enabled = false,
    category = "space-materialisation",
  },
  {
    type = "recipe",
    name = data_util.mod_prefix .. "naquium-tessaract",
    main_product = data_util.mod_prefix .. "naquium-tessaract",
    energy_required = 20,
    ingredients = {
      { data_util.mod_prefix .. "naquium-cube", 1 },
      { data_util.mod_prefix .. "naquium-plate", 16 },
      { data_util.mod_prefix .. "cryonite-rod", 4 },
      { name = data_util.mod_prefix .. "arcosphere-a", amount = 1},
      { name = data_util.mod_prefix .. "arcosphere-b", amount = 1},
      { name = data_util.mod_prefix .. "arcosphere-c", amount = 1},
    },
    results = {
      { name = data_util.mod_prefix .. "naquium-tessaract", amount = 1},
      { name = data_util.mod_prefix .. "arcosphere-d", amount= 1 },
      { name = data_util.mod_prefix .. "arcosphere-e", amount= 1 },
      { name = data_util.mod_prefix .. "arcosphere-f", amount= 1 },
      { name = data_util.mod_prefix .. "arcosphere-g", amount= 0 },
      { name = data_util.mod_prefix .. "arcosphere-h", amount= 0 },
    },
    requester_paste_multiplier = 1,
    always_show_made_in = true,
    enabled = false,
    category = "arcosphere",
    localised_description = {"space-exploration.arcosphere-random"}
  },
  {
    type = "recipe",
    name = data_util.mod_prefix .. "naquium-tessaract-alt",
    main_product = data_util.mod_prefix .. "naquium-tessaract",
    energy_required = 20,
    ingredients = {
      { data_util.mod_prefix .. "naquium-cube", 1 },
      { data_util.mod_prefix .. "naquium-plate", 16 },
      { data_util.mod_prefix .. "cryonite-rod", 4 },
      { name = data_util.mod_prefix .. "arcosphere-a", amount = 1},
      { name = data_util.mod_prefix .. "arcosphere-b", amount = 1},
      { name = data_util.mod_prefix .. "arcosphere-c", amount = 1},
    },
    results = {
      { name = data_util.mod_prefix .. "naquium-tessaract", amount = 1},
      { name = data_util.mod_prefix .. "arcosphere-d", amount= 0 },
      { name = data_util.mod_prefix .. "arcosphere-e", amount= 0 },
      { name = data_util.mod_prefix .. "arcosphere-f", amount= 1 },
      { name = data_util.mod_prefix .. "arcosphere-g", amount= 1 },
      { name = data_util.mod_prefix .. "arcosphere-h", amount= 1 },
    },
    requester_paste_multiplier = 1,
    always_show_made_in = true,
    enabled = false,
    category = "arcosphere",
    localised_description = {"space-exploration.arcosphere-random"}
  },
  {
    type = "recipe",
    name = data_util.mod_prefix .. "naquium-processor",
    main_product = data_util.mod_prefix .. "naquium-processor",
    energy_required = 30,
    ingredients = {
      { data_util.mod_prefix .. "quantum-processor", 1 },
      { data_util.mod_prefix .. "naquium-tessaract", 1 },
      { type = "fluid", name = data_util.mod_prefix .. "neural-gel-2", amount = 4},
      { name = data_util.mod_prefix .. "arcosphere-c", amount = 1},
      { name = data_util.mod_prefix .. "arcosphere-d", amount = 1},
      { name = data_util.mod_prefix .. "arcosphere-e", amount = 1},
      { name = data_util.mod_prefix .. "arcosphere-f", amount = 1},
      { name = data_util.mod_prefix .. "arcosphere-g", amount = 1},
      { name = data_util.mod_prefix .. "arcosphere-h", amount = 1},
    },
    results = {
      {name = data_util.mod_prefix .. "naquium-processor", amount = 1},
      { name = data_util.mod_prefix .. "arcosphere-a", amount = 5},
      { name = data_util.mod_prefix .. "arcosphere-b", amount = 1},
    },
    requester_paste_multiplier = 1,
    always_show_made_in = true,
    enabled = false,
    category = "arcosphere",
    localised_description = {"space-exploration.arcosphere-random"}
  },
  {
    type = "recipe",
    name = data_util.mod_prefix .. "naquium-processor-alt",
    main_product = data_util.mod_prefix .. "naquium-processor",
    energy_required = 30,
    ingredients = {
      { data_util.mod_prefix .. "quantum-processor", 1 },
      { data_util.mod_prefix .. "naquium-tessaract", 1 },
      { type = "fluid", name = data_util.mod_prefix .. "neural-gel-2", amount = 4},
      { name = data_util.mod_prefix .. "arcosphere-c", amount = 1},
      { name = data_util.mod_prefix .. "arcosphere-d", amount = 1},
      { name = data_util.mod_prefix .. "arcosphere-e", amount = 1},
      { name = data_util.mod_prefix .. "arcosphere-f", amount = 1},
      { name = data_util.mod_prefix .. "arcosphere-g", amount = 1},
      { name = data_util.mod_prefix .. "arcosphere-h", amount = 1},
    },
    results = {
      {name = data_util.mod_prefix .. "naquium-processor", amount = 1},
      { name = data_util.mod_prefix .. "arcosphere-a", amount = 1},
      { name = data_util.mod_prefix .. "arcosphere-b", amount = 5},
    },
    requester_paste_multiplier = 1,
    always_show_made_in = true,
    enabled = false,
    category = "arcosphere",
    localised_description = {"space-exploration.arcosphere-random"}
  },
})
local data_util = require("data_util")


local washlist = {"chemical-plant", data_util.mod_prefix.."space-decontamination-facility"}
for _, name in pairs(washlist) do
  if data.raw["assembling-machine"][name] then
    table.insert(data.raw["assembling-machine"][name].crafting_categories, "pressure-washing")
  end
end

data_util.replace_or_add_ingredient("low-density-structure", "steel-plate", "steel-plate", 5)
data_util.replace_or_add_ingredient("low-density-structure", "copper-plate", "copper-plate", 10)
if data.raw.item.glass then
  data_util.replace_or_add_ingredient("low-density-structure", nil, "glass", 10)
else
  data_util.replace_or_add_ingredient("low-density-structure", nil, "stone", 10)
end
data_util.replace_or_add_ingredient("low-density-structure", "plastic-bar", "plastic-bar", 10)

data_util.replace_or_add_ingredient("rocket-control-unit", nil, "iron-plate", 5)
data_util.replace_or_add_ingredient("rocket-control-unit", nil, "glass", 5)
data_util.replace_or_add_ingredient("rocket-control-unit", "speed-module", "battery", 5)
data_util.replace_or_add_ingredient("rocket-control-unit", "advanced-circuit", "advanced-circuit", 5)
data_util.replace_or_add_ingredient("rocket-control-unit", "processing-unit", "processing-unit", 1)

data_util.replace_or_add_ingredient("rocket-part", "low-density-structure", "low-density-structure", 5)
data_util.replace_or_add_ingredient("rocket-part", "rocket-control-unit", "rocket-control-unit", 5)
data_util.replace_or_add_ingredient("rocket-part", nil, data_util.mod_prefix .. "heat-shielding", 5)
data.raw["rocket-silo"]["rocket-silo"].rocket_parts_required = 50
data.raw["rocket-silo"]["rocket-silo"].rocket_result_inventory_size = 20 -- needed for 50x20 = 1000 data returned

data.raw.recipe["solid-fuel-from-heavy-oil"].category = "fuel-refining"
data.raw.recipe["solid-fuel-from-heavy-oil"].energy_required = 0.5
data.raw.recipe["solid-fuel-from-light-oil"].category = "fuel-refining"
data.raw.recipe["solid-fuel-from-light-oil"].energy_required = 0.5
data.raw.recipe["solid-fuel-from-petroleum-gas"].category = "fuel-refining"
data.raw.recipe["solid-fuel-from-petroleum-gas"].energy_required = 0.5

data.raw.recipe["rocket-fuel"].crafting_machine_tint =
{
  primary = {r = 0.290, g = 0.027, b = 0.000, a = 0.000}, -- #49060000
  secondary = {r = 0.722, g = 0.465, b = 0.190, a = 0.000}, -- #b8763000
  tertiary = {r = 0.870, g = 0.365, b = 0.000, a = 0.000}, -- #dd5d0000
}
data.raw.recipe["rocket-fuel"].category = "fuel-refining"
data.raw.recipe["rocket-fuel"].subgroup = "processed-fuel"
data.raw.recipe["rocket-fuel"].order = "p"
data.raw.recipe["rocket-fuel"].energy_required = 1

data:extend({
  {
    type = "recipe",
    name = data_util.mod_prefix .. "liquid-rocket-fuel",
    ingredients = {
      { name = "rocket-fuel", amount = 1 },
    },
    results = {
      {name = data_util.mod_prefix.."liquid-rocket-fuel", type="fluid", amount=data_util.liquid_rocket_fuel_per_solid}
    },
    energy_required = 1,
    enabled = false,
    category = "fuel-refining",
    subgroup = "processed-fuel",
    order = "p",
    crafting_machine_tint =
    {
      primary = {r = 0.290, g = 0.027, b = 0.000, a = 0.000}, -- #49060000
      secondary = {r = 0.722, g = 0.465, b = 0.190, a = 0.000}, -- #b8763000
      tertiary = {r = 0.870, g = 0.365, b = 0.000, a = 0.000}, -- #dd5d0000
    }
  },
  {
    type = "recipe",
    name = data_util.mod_prefix .. "vulcanite-rocket-fuel",
    ingredients = {
      { name = data_util.mod_prefix .. "vulcanite-block", amount = 8 },
    },
    results = {
      { name = "rocket-fuel", amount= 1 }
    },
    energy_required = 1,
    enabled = false,
    category = "fuel-refining",
    subgroup = "processed-fuel",
    order = "p",
    crafting_machine_tint =
    {
      primary = {r = 0.290, g = 0.027, b = 0.000, a = 0.000}, -- #49060000
      secondary = {r = 0.722, g = 0.465, b = 0.190, a = 0.000}, -- #b8763000
      tertiary = {r = 0.870, g = 0.365, b = 0.000, a = 0.000}, -- #dd5d0000
    },
    allow_as_intermediate = false,
  },
})

data:extend({
  {
    type = "recipe",
    name = data_util.mod_prefix .. "rocket-fuel-from-water-copper",
    ingredients = {
      { type = "fluid", name = "water", amount = 1000 },
      { name = "copper-plate", amount = 1 },
    },
    results = {
      {name = "rocket-fuel", amount = 1 },
      {name = data_util.mod_prefix .. "scrap", probability = 0.1, amount_min = 1, amount_max = 1 },
    },
    icons = data_util.transition_icons(
      {
        icon = data.raw.fluid["water"].icon,
        icon_size = data.raw.fluid["water"].icon_size
      },
      {
        icon = data.raw.item["rocket-fuel"].icon,
        icon_size = data.raw.item["rocket-fuel"].icon_size
      }
    ),
    energy_required = 500,
    enabled = false,
    category = "fuel-refining",
    subgroup = "processed-fuel",
    order = "p",
    crafting_machine_tint =
    {
      primary = {r = 0.290, g = 0.027, b = 0.000, a = 0.000}, -- #49060000
      secondary = {r = 0.722, g = 0.465, b = 0.190, a = 0.000}, -- #b8763000
      tertiary = {r = 0.870, g = 0.365, b = 0.000, a = 0.000}, -- #dd5d0000
    }
  },
})
data_util.allow_productivity(data_util.mod_prefix .. "liquid-rocket-fuel")
data_util.allow_productivity(data_util.mod_prefix .. "rocket-fuel-from-water-copper")
data_util.allow_productivity("sand-from-stone")
data_util.allow_productivity("glass-from-sand")
data_util.allow_productivity("sand-to-solid-sand")
data_util.allow_productivity(data_util.mod_prefix .. "heat-shielding")
--data_util.allow_productivity(data_util.mod_prefix .. "rocket-science-pack")
data_util.allow_productivity(data_util.mod_prefix .. "data-storage-substrate")
data_util.allow_productivity(data_util.mod_prefix .. "material-testing-pack")

data_util.disallow_productivity("empty-barrel")
data.raw.recipe["empty-barrel"].normal = nil
data.raw.recipe["empty-barrel"].expensive = nil
data.raw.recipe["empty-barrel"].result = nil
data.raw.recipe["empty-barrel"].ingredients = { { name = "steel-plate", amount = 1 } }
data.raw.recipe["empty-barrel"].results = { { name = "empty-barrel", amount = 1 } }

data_util.allow_productivity({
  data_util.mod_prefix .. "cargo-rocket-section",
  data_util.mod_prefix .. "cargo-rocket-section-beryllium",
  data_util.mod_prefix .. "cargo-rocket-cargo-pod",
  data_util.mod_prefix .. "cargo-rocket-fuel-tank",
  data_util.mod_prefix .. "cryonite-crushed",
  data_util.mod_prefix .. "cryonite-washed",
  data_util.mod_prefix .. "cryonite-rod",
  data_util.mod_prefix .. "cryonite-ion-exchange-beads",
  data_util.mod_prefix .. "beryllium-ore-crushed",
  data_util.mod_prefix .. "beryllium-ore-washed",
  data_util.mod_prefix .. "beryllium-sulfate",
  data_util.mod_prefix .. "beryllium-hydroxide",
  data_util.mod_prefix .. "beryllium-powder",
  data_util.mod_prefix .. "beryllium-ingot",
  data_util.mod_prefix .. "beryllium-plate",
  data_util.mod_prefix .. "holmium-ore-crushed",
  data_util.mod_prefix .. "holmium-ore-washed",
  data_util.mod_prefix .. "holmium-powder",
  data_util.mod_prefix .. "holmium-ingot",
  data_util.mod_prefix .. "holmium-plate",
  data_util.mod_prefix .. "iridium-ore-crushed",
  data_util.mod_prefix .. "iridium-ore-washed",
  data_util.mod_prefix .. "iridium-powder",
  data_util.mod_prefix .. "iridium-ingot",
  data_util.mod_prefix .. "iridium-plate",
  data_util.mod_prefix .. "naquium-ore-crushed",
  data_util.mod_prefix .. "naquium-ore-washed",
  data_util.mod_prefix .. "naquium-powder",
  data_util.mod_prefix .. "naquium-ingot",
  data_util.mod_prefix .. "naquium-plate",
  data_util.mod_prefix .. "vitamelange-nugget",
  data_util.mod_prefix .. "vitamelange-roast",
  data_util.mod_prefix .. "vitamelange-spice",
  data_util.mod_prefix .. "vitamelange-extract",
  data_util.mod_prefix .. "vulcanite-crushed",
  data_util.mod_prefix .. "vulcanite-washed",
  data_util.mod_prefix .. "vulcanite-block",
  data_util.mod_prefix .. "vulcanite-ion-exchange-beads",
  data_util.mod_prefix .. "vulcanite-rocket-fuel",
  data_util.mod_prefix .. "aeroframe-pole",
  data_util.mod_prefix .. "aeroframe-scaffold",
  data_util.mod_prefix .. "aeroframe-bulkhead",
  data_util.mod_prefix .. "lattice-pressure-vessel",
  data_util.mod_prefix .. "heavy-girder",
  data_util.mod_prefix .. "heavy-bearing",
  data_util.mod_prefix .. "heavy-composite",
  data_util.mod_prefix .. "heavy-assembly",
  data_util.mod_prefix .. "vitalic-acid",
  data_util.mod_prefix .. "bioscrubber",
  data_util.mod_prefix .. "vitalic-reagent",
  data_util.mod_prefix .. "vitalic-epoxy",
  data_util.mod_prefix .. "self-sealing-gel",
  data_util.mod_prefix .. "holmium-cable",
  data_util.mod_prefix .. "holmium-solenoid",
  data_util.mod_prefix .. "quantum-processor",
  data_util.mod_prefix .. "dynamic-emitter",
  data_util.mod_prefix .. "iron-smelting-vulcanite",
  data_util.mod_prefix .. "copper-smelting-vulcanite",
  data_util.mod_prefix .. "stone-brick-vulcanite",
  data_util.mod_prefix .. "glass-vulcanite",
  data_util.mod_prefix .. "cryonite-lubricant",
  data_util.mod_prefix .. "heat-shielding-iridium",
  data_util.mod_prefix .. "pulverised-sand",
  data_util.mod_prefix .. "low-density-structure-beryllium",
  data_util.mod_prefix .. "processing-unit-holmium",
  data_util.mod_prefix .. "space-probe-rocket",
})
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
-- NOTE: fluids x100

local data_util = require("data_util")
local make_recipe = data_util.make_recipe

  type = "recipe",
  name = data_util.mod_prefix .. "scrap-recycling",
  ingredients = {
    { data_util.mod_prefix .. "scrap", 1},
  },
  results = {
    { name = "iron-ore", amount_min = 1, amount_max = 1, probability = 0.1},
    { name = "copper-ore", amount_min = 1, amount_max = 1, probability = 0.1},
    { name = "stone", amount_min = 1, amount_max = 1, probability = 0.1},
    { type = "fluid", name = "heavy-oil", amount_min = 1, amount_max = 1, probability = 0.1},
  },
  category = "hard-recycling",
  subgroup = "space-recycling",
  icons = data_util.transition_icons(
    {
      icon = data.raw.item[data_util.mod_prefix .. "scrap"].icon,
      icon_size = data.raw.item[data_util.mod_prefix .. "scrap"].icon_size,
    },
    {
      {icon = data.raw.item["iron-ore"].icon, icon_size = data.raw.item["iron-ore"].icon_size},
      {icon = data.raw.item["copper-ore"].icon, icon_size = data.raw.item["copper-ore"].icon_size},
      {icon = data.raw.item["stone"].icon, icon_size = data.raw.item["stone"].icon_size},
    }
  ),
  energy_required = 1,
  allow_as_intermediate = false,
  enabled = false,
  always_show_made_in = true,
})

  type = "recipe",
  name = data_util.mod_prefix .. "broken-data-scrapping",
  ingredients = {
    { data_util.mod_prefix .. "broken-data", 1}
  },
  results = {
    { data_util.mod_prefix .. "scrap", 5},
  },
  icon = "__space-exploration-graphics__/graphics/icons/scrap.png",
  category = "hard-recycling",
  subgroup = "space-recycling",
  icons = data_util.transition_icons(
    {
      icon = data.raw.item[data_util.mod_prefix .. "broken-data"].icon,
      icon_size = data.raw.item[data_util.mod_prefix .. "broken-data"].icon_size
    },
    {
      icon = data.raw.item[data_util.mod_prefix .. "scrap"].icon,
      icon_size = data.raw.item[data_util.mod_prefix .. "scrap"].icon_size
    }
  ),
  energy_required = 5,
  allow_as_intermediate = false,
  localised_name = {"recipe-name." .. data_util.mod_prefix .. "broken-data-scrapping"},
  enabled = false,
  always_show_made_in = true,
})

  type = "recipe",
  name = data_util.mod_prefix .. "empty-barrel-scrapping",
  ingredients = {
    { "empty-barrel", 1}
  },
  results = {
    { data_util.mod_prefix .. "scrap", 2},
  },
  icon = "__space-exploration-graphics__/graphics/icons/scrap.png",
  category = "hard-recycling",
  subgroup = "space-recycling",
  icons = data_util.transition_icons(
    {
      icon = data.raw.item["empty-barrel"].icon,
      icon_size = data.raw.item["empty-barrel"].icon_size
    },
    {
      icon = data.raw.item[data_util.mod_prefix .. "scrap"].icon,
      icon_size = data.raw.item[data_util.mod_prefix .. "scrap"].icon_size
    }
  ),
  energy_required = 2,
  allow_as_intermediate = false,
  localised_name = {"recipe-name." .. data_util.mod_prefix .. "empty-barrel-scrapping"},
  enabled = false,
  always_show_made_in = true,
})

  type = "recipe",
  name = data_util.mod_prefix .. "empty-barrel-reprocessing",
  ingredients = {
    { "empty-barrel", 1}
  },
  results = {
    { "steel-plate", 1},
  },
  icon = "__space-exploration-graphics__/graphics/icons/scrap.png",
  category = "hard-recycling",
  subgroup = "space-recycling",
  icons = data_util.transition_icons(
    {
      icon = data.raw.item["empty-barrel"].icon,
      icon_size = data.raw.item["empty-barrel"].icon_size
    },
    {
      icon = data.raw.item["steel-plate"].icon,
      icon_size = data.raw.item["steel-plate"].icon_size
    }
  ),
  energy_required = 2,
  allow_as_intermediate = false,
  localised_name = {"recipe-name." .. data_util.mod_prefix .. "empty-barrel-reprocessing"},
  enabled = false,
  always_show_made_in = true,
})

  type = "recipe",
  name = data_util.mod_prefix .. "space-capsule-scrapping",
  ingredients = {
    { data_util.mod_prefix .. "space-capsule", 1}
  },
  results = {
    { "solar-panel", 45},
    { "accumulator", 45},
    { data_util.mod_prefix .. "heat-shielding", 90},
    { "low-density-structure", 90},
    { "rocket-control-unit", 90},
    { data_util.mod_prefix .. "scrap", 1000},
  },
  icon = "__space-exploration-graphics__/graphics/icons/scrap.png",
  category = "hard-recycling",
  subgroup = "space-recycling",
  icons = data_util.transition_icons(
    {
      icon = data.raw.item[data_util.mod_prefix .. "space-capsule"].icon,
      icon_size = data.raw.item[data_util.mod_prefix .. "space-capsule"].icon_size
    },
    {
      icon = data.raw.item[data_util.mod_prefix .. "scrap"].icon,
      icon_size = data.raw.item[data_util.mod_prefix .. "scrap"].icon_size
    }
  ),
  energy_required = 2,
  allow_as_intermediate = false,
  localised_name = {"recipe-name." .. data_util.mod_prefix .. "space-capsule-scrapping"},
  enabled = false,
  always_show_made_in = true,
})

  type = "recipe",
  name = data_util.mod_prefix .. "cargo-pod-scrapping",
  ingredients = {
    { data_util.mod_prefix .. "cargo-rocket-cargo-pod", 1}
  },
  results = {
    { data_util.mod_prefix .. "scrap", 100},
  },
  icon = "__space-exploration-graphics__/graphics/icons/scrap.png",
  category = "hard-recycling",
  subgroup = "space-recycling",
  icons = data_util.transition_icons(
    {
      icon = data.raw.item[data_util.mod_prefix .. "cargo-rocket-cargo-pod"].icon,
      icon_size = data.raw.item[data_util.mod_prefix .. "cargo-rocket-cargo-pod"].icon_size
    },
    {
      icon = data.raw.item[data_util.mod_prefix .. "scrap"].icon,
      icon_size = data.raw.item[data_util.mod_prefix .. "scrap"].icon_size
    }
  ),
  energy_required = 2,
  allow_as_intermediate = false,
  localised_name = {"recipe-name." .. data_util.mod_prefix .. "cargo-pod-scrapping"},
  enabled = false,
  always_show_made_in = true,
})
local data_util = require("data_util")


data:extend({
  -- pulverising
  {
    type = "recipe",
    category = "pulverising",
    name = data_util.mod_prefix .. "beryllium-ore-crushed",
    results = {
      {name = data_util.mod_prefix .. "beryllium-ore-crushed", amount = 1} -- 2
    },
    energy_required = 1,
    ingredients = {
      {name = data_util.mod_prefix .. "beryllium-ore", amount = 2}
    },
    enabled = false,
    always_show_made_in = true,
  },
  {
    type = "recipe",
    category = "chemistry",
    name = data_util.mod_prefix .. "beryllium-sulfate",
    main_product = data_util.mod_prefix .. "beryllium-sulfate",
    results = {
      {name = data_util.mod_prefix .. "beryllium-sulfate", amount = 1}, -- 4
      {name = "sand", probability = 0.5, amount_min = 1, amount_max = 1,},
      {type = "fluid", name = "water", amount = 1, catalyst_amount = 1},
    },
    energy_required = 2,
    ingredients = {
      {type = "fluid", name="sulfuric-acid", amount = 2},
      {name = data_util.mod_prefix .. "beryllium-ore-crushed", amount = 2}
    },
    enabled = false,
    always_show_made_in = true,
    crafting_machine_tint = {
      primary = {
        a = 1,
        r = 0.338,
        b = 0.482,
        g = 0.965
      },
      quaternary = {
        a = 1,
        r = 0.191,
        b = 0.763,
        g = 0.939
      },
      secondary = {
        a = 1,
        r = 0.222,
        b = 0.56,
        g = 0.831
      },
      tertiary = {
        a = 1,
        r = 0.443,
        b = 0.728,
        g = 0.818,
      }
    },
  },
  {
    type = "recipe",
    category = "chemistry",
    name = data_util.mod_prefix .. "beryllium-hydroxide",
    main_product = data_util.mod_prefix .. "beryllium-hydroxide",
    results = {
      {type = "fluid", name = data_util.mod_prefix .. "beryllium-hydroxide", amount = 200}, --1
    },
    energy_required = 30,
    ingredients = {
      {name = data_util.mod_prefix .. "cryonite-rod", amount = 1},
      {type = "fluid", name="water", amount = 150, catalyst_amount = 150},
      {name = data_util.mod_prefix .. "beryllium-sulfate", amount = 50}
    },
    subgroup = "fluid-recipes",
    enabled = false,
    always_show_made_in = true,
    crafting_machine_tint = {
      primary = {
        a = 1,
        r = 0.338,
        b = 0.482,
        g = 0.965
      },
      quaternary = {
        a = 1,
        r = 0.191,
        b = 0.763,
        g = 0.939
      },
      secondary = {
        a = 1,
        r = 0.222,
        b = 0.56,
        g = 0.831
      },
      tertiary = {
        a = 1,
        r = 0.443,
        b = 0.728,
        g = 0.818,
      }
    },
  },
  {
    type = "recipe",
    category = "chemistry",
    name = data_util.mod_prefix .. "beryllium-powder",
    main_product = data_util.mod_prefix .. "beryllium-powder",
    results = {
      {name = data_util.mod_prefix .. "beryllium-powder", amount = 1}, -- 2
      {type = "fluid", name = "water", amount = 1, catalyst_amount = 1},
    },
    energy_required = 1,
    ingredients = {
      {type = "fluid", name = data_util.mod_prefix .. "beryllium-hydroxide", amount = 2},
    },
    enabled = false,
    always_show_made_in = true,
    crafting_machine_tint = {
      primary = {
        a = 1,
        r = 0.338,
        b = 0.482,
        g = 0.965
      },
      quaternary = {
        a = 1,
        r = 0.191,
        b = 0.763,
        g = 0.939
      },
      secondary = {
        a = 1,
        r = 0.222,
        b = 0.56,
        g = 0.831
      },
      tertiary = {
        a = 1,
        r = 0.443,
        b = 0.728,
        g = 0.818,
      }
    },
  },
  {
    type = "recipe",
    category = "smelting",
    name = data_util.mod_prefix .. "beryllium-ingot",
    results = {
      {name = data_util.mod_prefix .. "beryllium-ingot", amount = 1}, -- 20
    },
    energy_required = 40,
    ingredients = {
      {name = data_util.mod_prefix .. "beryllium-powder", amount = 10},
    },
    enabled = false,
    always_show_made_in = true,
  },
  {
    type = "recipe",
    category = "crafting",
    name = data_util.mod_prefix .. "beryllium-plate",
    results = {
      {name = data_util.mod_prefix .. "beryllium-plate", amount = 4}, -- 5
    },
    energy_required = 15,
    ingredients = {
      {name = data_util.mod_prefix .. "beryllium-ingot", amount = 1}
    },
    enabled = false,
    always_show_made_in = true,
  },


  {
    type = "recipe",
    category = "pulverising",
    name = data_util.mod_prefix .. "cryonite-crushed",
    results = {
      {name = data_util.mod_prefix .. "cryonite-crushed", amount = 1}
    },
    energy_required = 0.5,
    ingredients = {
      {name = data_util.mod_prefix .. "cryonite", amount = 2}
    },
    enabled = false,
    always_show_made_in = true,
  },
  {
    type = "recipe",
    category = "pressure-washing",
    name = data_util.mod_prefix .. "cryonite-washed",
    main_product = data_util.mod_prefix .. "cryonite-washed",
    results = {
      {name = data_util.mod_prefix .. "cryonite-washed", amount = 2},
      {name = "stone", amount_min = 1, amount_max = 1, probability = 0.25},
      {type = "fluid", name="water", amount = 4, catalyst_amount = 4},
    },
    energy_required = 1,
    ingredients = {
      {type = "fluid", name="water", amount = 6, catalyst_amount = 6},
      {name = data_util.mod_prefix .. "cryonite-crushed", amount = 2}
    },
    enabled = false,
    always_show_made_in = true,
    crafting_machine_tint = {
      primary = {
        a = 1,
        r = 0.338,
        g = 0.482,
        b = 0.965
      },
      quaternary = {
        a = 1,
        r = 0.191,
        g = 0.763,
        b = 0.939
      },
      secondary = {
        a = 1,
        r = 0.222,
        g = 0.56,
        b = 0.831
      },
      tertiary = {
        a = 1,
        r = 0.443,
        g = 0.728,
        b = 0.818,
      }
    },
  },
  {
    type = "recipe",
    category = "smelting",
    name = data_util.mod_prefix .. "cryonite-rod",
    results = {
      {name = data_util.mod_prefix .. "cryonite-rod", amount = 1},
    },
    energy_required = 5,
    ingredients = {
      {name = data_util.mod_prefix .. "cryonite-washed", amount = 1}
    },
    enabled = false,
    always_show_made_in = true,
  },
  {
    type = "recipe",
    category = "chemistry",
    name = data_util.mod_prefix .. "cryonite-ion-exchange-beads",
    results = {
      {name = data_util.mod_prefix .. "cryonite-ion-exchange-beads", amount = 10},
    },
    energy_required = 10,
    ingredients = {
      {name = data_util.mod_prefix .. "cryonite-rod", amount = 1},
      {name = "plastic-bar", amount = 1},
      {type = "fluid", name = "sulfuric-acid", amount = 5},
      {type = "fluid", name = "steam", amount = 5},
    },
    crafting_machine_tint = {
      primary = {
        a = 1,
        r = 0.338,
        g = 0.482,
        b = 0.965
      },
      quaternary = {
        a = 1,
        r = 0.191,
        g = 0.763,
        b = 0.939
      },
      secondary = {
        a = 1,
        r = 0.222,
        g = 0.56,
        b = 0.831
      },
      tertiary = {
        a = 1,
        r = 0.443,
        g = 0.728,
        b = 0.818,
      }
    },
    enabled = false,
    always_show_made_in = true,
  },
  {
    type = "recipe",
    category = "chemistry",
    name = data_util.mod_prefix .. "cryonite-lubricant",
    results = {
      {type = "fluid", name = "lubricant", amount = 10},
    },
    energy_required = 5,
    ingredients = {
      {type = "fluid", name = data_util.mod_prefix .. "cryonite-slush", amount = 10},
      {type = "fluid", name = "heavy-oil", amount = 1},
    },
    subgroup = "fluid-recipes",
    enabled = false,
    always_show_made_in = true,
    allow_as_intermediate = false
  },
  {
    type = "recipe",
    category = "chemistry",
    name = data_util.mod_prefix .. "cryonite-slush",
    results = {
      {type = "fluid", name = data_util.mod_prefix .. "cryonite-slush", amount = 10},
    },
    energy_required = 5,
    ingredients = {
      {name = data_util.mod_prefix .. "cryonite-rod", amount = 1},
      {type = "fluid", name = "sulfuric-acid", amount = 1},
    },
    subgroup = "fluid-recipes",
    enabled = false,
    always_show_made_in = true,
    allow_as_intermediate = false
  },
  {
    type = "recipe",
    category = "chemistry",
    name = data_util.mod_prefix .. "cryonite-to-water-ice",
    results = {
      {name = data_util.mod_prefix .. "water-ice", amount = 1},
    },
    energy_required = 1,
    ingredients = {
      {type = "fluid", name = data_util.mod_prefix .. "cryonite-slush", amount = 1},
      {type = "fluid", name = "water", amount = 100},
    },
    subgroup = "fluid-recipes",
    enabled = false,
    always_show_made_in = true,
    allow_as_intermediate = false
  },
  {
    type = "recipe",
    category = "chemistry",
    name = data_util.mod_prefix .. "steam-to-water",
    results = {
      {type = "fluid", name = "water", amount = 99},
    },
    energy_required = 0.5,
    ingredients = {
      {type = "fluid", name = "steam", amount = 100},
    },
    subgroup = "fluid-recipes",
    enabled = false,
    always_show_made_in = true,
    allow_as_intermediate = false
  },

  {
    type = "recipe",
    category = "pulverising",
    name = data_util.mod_prefix .. "holmium-ore-crushed",
    results = {
      {name = data_util.mod_prefix .. "holmium-ore-crushed", amount = 1}
    },
    energy_required = 1,
    ingredients = {
      {name = data_util.mod_prefix .. "holmium-ore", amount = 2}
    },
    enabled = false,
    always_show_made_in = true,
  },
  {
    type = "recipe",
    category = "pressure-washing",
    name = data_util.mod_prefix .. "holmium-ore-washed",
    main_product = data_util.mod_prefix .. "holmium-ore-washed",
    results = {
      {name = data_util.mod_prefix .. "holmium-ore-washed", amount = 2},
      {name = "stone", amount_min = 1, amount_max = 1, probability = 0.25},
    },
    energy_required = 1,
    ingredients = {
      {type = "fluid", name="water", amount = 2, catalyst_amount = 2},
      {name = data_util.mod_prefix .. "holmium-ore-crushed", amount = 2}
    },
    enabled = false,
    always_show_made_in = true,
    crafting_machine_tint = {
      primary = {
        a = 1,
        g = 0.338,
        b = 0.482,
        r = 0.965
      },
      quaternary = {
        a = 1,
        g = 0.191,
        b = 0.763,
        r = 0.939
      },
      secondary = {
        a = 1,
        g = 0.222,
        b = 0.56,
        r = 0.831
      },
      tertiary = {
        a = 1,
        g = 0.443,
        b = 0.728,
        r = 0.818,
      }
    },
  },
  {
    type = "recipe",
    category = "chemistry",
    name = data_util.mod_prefix .. "holmium-powder",
    main_product = data_util.mod_prefix .. "holmium-powder",
    results = {
      {name = data_util.mod_prefix .. "holmium-powder", probability = 0.5, amount_min = 1, amount_max = 1},
      {name = data_util.mod_prefix .. "vulcanite-ion-exchange-beads", probability = 0.5, amount_min = 1, amount_max = 1, catalyst_amount = 1},
      {name = data_util.mod_prefix .. "holmium-ore-washed", probability = 0.5, amount_min = 1, amount_max = 1, catalyst_amount = 1},
      {name = "sand", probability = 0.25, amount_min = 1, amount_max = 1, catalyst_amount = 1},
    },
    energy_required = 1,
    ingredients = {
      {type = "fluid", name="water", amount = 2, catalyst_amount = 2},
      {name = data_util.mod_prefix .. "vulcanite-ion-exchange-beads", amount = 1, catalyst_amount = 1,},
      {name = data_util.mod_prefix .. "holmium-ore-washed", amount = 1, catalyst_amount = 1,}
    },
    enabled = false,
    always_show_made_in = true,
    crafting_machine_tint = {
      primary = {
        a = 1,
        g = 0.338,
        b = 0.482,
        r = 0.965
      },
      quaternary = {
        a = 1,
        g = 0.191,
        b = 0.763,
        r = 0.939
      },
      secondary = {
        a = 1,
        g = 0.222,
        b = 0.56,
        r = 0.831
      },
      tertiary = {
        a = 1,
        g = 0.443,
        b = 0.728,
        r = 0.818,
      }
    },
  },
  {
    type = "recipe",
    category = "smelting",
    name = data_util.mod_prefix .. "holmium-ingot",
    results = {
      {name = data_util.mod_prefix .. "holmium-ingot", amount = 1},
    },
    energy_required = 40,
    ingredients = {
      {name = data_util.mod_prefix .. "holmium-powder", amount = 10},
    },
    enabled = false,
    always_show_made_in = true,
  },
  {
    type = "recipe",
    category = "crafting",
    name = data_util.mod_prefix .. "holmium-plate",
    results = {
      {name = data_util.mod_prefix .. "holmium-plate", amount = 4},
    },
    energy_required = 15,
    ingredients = {
      {name = data_util.mod_prefix .. "holmium-ingot", amount = 1}
    },
    enabled = false,
    always_show_made_in = true,
  },

  {
    type = "recipe",
    category = "pulverising",
    name = data_util.mod_prefix .. "iridium-ore-crushed", -- 2
    results = {
      {name = data_util.mod_prefix .. "iridium-ore-crushed", amount = 1}
    },
    energy_required = 1,
    ingredients = {
      {name = data_util.mod_prefix .. "iridium-ore", amount = 2}
    },
    enabled = false,
    always_show_made_in = true,
  },
  {
    type = "recipe",
    category = "pressure-washing",
    name = data_util.mod_prefix .. "iridium-ore-washed", -- 2
    main_product = data_util.mod_prefix .. "iridium-ore-washed",
    results = {
      {name = data_util.mod_prefix .. "iridium-ore-washed", amount = 2},
      {name = "stone", amount_min = 1, amount_max = 1, probability = 0.25},
    },
    energy_required = 1,
    ingredients = {
      {type = "fluid", name="water", amount = 2, catalyst_amount = 2},
      {name = data_util.mod_prefix .. "iridium-ore-crushed", amount = 2}
    },
    enabled = false,
    always_show_made_in = true,
    crafting_machine_tint = {
      primary = {
        a = 1,
        b = 0.338,
        r = 0.482,
        g = 0.965
      },
      quaternary = {
        a = 1,
        b = 0.191,
        r = 0.763,
        g = 0.939
      },
      secondary = {
        a = 1,
        b = 0.222,
        r = 0.56,
        g = 0.831
      },
      tertiary = {
        a = 1,
        b = 0.443,
        r = 0.728,
        g = 0.818,
      }
    },
  },
  {
    type = "recipe",
    category = "chemistry",
    name = data_util.mod_prefix .. "iridium-powder", -- 4
    main_product = data_util.mod_prefix .. "iridium-powder",
    results = {
      {name = data_util.mod_prefix .. "iridium-powder", probability = 0.5, amount_min = 1, amount_max = 1},
      {name = data_util.mod_prefix .. "cryonite-ion-exchange-beads", probability = 0.5, amount_min = 1, amount_max = 1, catalyst_amount = 1},
      {name = data_util.mod_prefix .. "iridium-ore-washed", probability = 0.5, amount_min = 1, amount_max = 1, catalyst_amount = 1},
      {name = "sand", probability = 0.25, amount_min = 1, amount_max = 1, catalyst_amount = 1},
    },
    energy_required = 1,
    ingredients = {
      {type = "fluid", name="water", amount = 2, catalyst_amount = 2},
      {name = data_util.mod_prefix .. "cryonite-ion-exchange-beads", amount = 1, catalyst_amount = 1,},
      {name = data_util.mod_prefix .. "iridium-ore-washed", amount = 1, catalyst_amount = 1,}
    },
    enabled = false,
    always_show_made_in = true,
    crafting_machine_tint = {
      primary = {
        a = 1,
        b = 0.338,
        r = 0.482,
        g = 0.965
      },
      quaternary = {
        a = 1,
        b = 0.191,
        r = 0.763,
        g = 0.939
      },
      secondary = {
        a = 1,
        b = 0.222,
        r = 0.56,
        g = 0.831
      },
      tertiary = {
        a = 1,
        b = 0.443,
        r = 0.728,
        g = 0.818,
      }
    },
  },
  {
    type = "recipe",
    category = "smelting",
    name = data_util.mod_prefix .. "iridium-ingot", -- 40
    results = {
      {name = data_util.mod_prefix .. "iridium-ingot", amount = 1},
    },
    energy_required = 40,
    ingredients = {
      {name = data_util.mod_prefix .. "iridium-powder", amount = 10},
        {name=data_util.mod_prefix .. "vulcanite-block", amount = 1},
    },
    enabled = false,
    always_show_made_in = true,
  },
  {
    type = "recipe",
    category = "crafting",
    name = data_util.mod_prefix .. "iridium-plate", -- 10
    results = {
      {name = data_util.mod_prefix .. "iridium-plate", amount = 4},
    },
    energy_required = 15,
    ingredients = {
      {name = data_util.mod_prefix .. "iridium-ingot", amount = 1}
    },
    enabled = false,
    always_show_made_in = true,
  },
  {
    type = "recipe",
    category = "pulverising",
    name = data_util.mod_prefix .. "naquium-ore-crushed",
    results = {
      {name = data_util.mod_prefix .. "naquium-ore-crushed", amount = 1}
    },
    energy_required = 2,
    ingredients = {
      {name = data_util.mod_prefix .. "naquium-ore", amount = 4}
    },
    enabled = false,
    always_show_made_in = true,
  },
  {
    type = "recipe",
    category = "pressure-washing",
    name = data_util.mod_prefix .. "naquium-ore-washed",
    main_product = data_util.mod_prefix .. "naquium-ore-washed",
    results = {
      {name = data_util.mod_prefix .. "naquium-ore-washed", amount = 2},
      {name = "stone", amount_min = 1, amount_max = 1, probability = 0.25},
    },
    energy_required = 2,
    ingredients = {
      {type = "fluid", name="water", amount = 4},
      {name = data_util.mod_prefix .. "naquium-ore-crushed", amount = 2}
    },
    enabled = false,
    always_show_made_in = true,
    crafting_machine_tint = {
      primary = {
        a = 1,
        g = 0.338,
        r = 0.482,
        b = 0.965
      },
      quaternary = {
        a = 1,
        g = 0.191,
        r = 0.763,
        b = 0.939
      },
      secondary = {
        a = 1,
        g = 0.222,
        r = 0.56,
        b = 0.831
      },
      tertiary = {
        a = 1,
        g = 0.443,
        r = 0.728,
        b = 0.818,
      }
    },
  },
  {
    type = "recipe",
    category = "pressure-washing",
    name = data_util.mod_prefix .. "naquium-powder",
    main_product = data_util.mod_prefix .. "naquium-powder",
    results = {
      {name = data_util.mod_prefix .. "naquium-powder", amount = 1},
      {name = "sand", probability = 0.5, amount_min = 1, amount_max = 1,},
      {type="fluid", name = "water", amount = 2},
    },
    energy_required = 20,
    ingredients = {
      {name=data_util.mod_prefix .. "vitalic-acid", amount = 4},
      {name = data_util.mod_prefix .. "naquium-ore-washed", amount = 2}
    },
    enabled = false,
    always_show_made_in = true,
    crafting_machine_tint = {
      primary = {
        a = 1,
        g = 0.338,
        r = 0.482,
        b = 0.965
      },
      quaternary = {
        a = 1,
        g = 0.191,
        r = 0.763,
        b = 0.939
      },
      secondary = {
        a = 1,
        g = 0.222,
        r = 0.56,
        b = 0.831
      },
      tertiary = {
        a = 1,
        g = 0.443,
        r = 0.728,
        b = 0.818,
      }
    },
  },
  {
    type = "recipe",
    category = "smelting",
    name = data_util.mod_prefix .. "naquium-ingot",
    results = {
      {name = data_util.mod_prefix .. "naquium-ingot", amount = 1},
    },
    energy_required = 60,
    ingredients = {
      {name = data_util.mod_prefix .. "naquium-powder", amount = 10},
        {name=data_util.mod_prefix .. "vulcanite-block", amount = 1},
    },
    enabled = false,
    always_show_made_in = true,
  },
  {
    type = "recipe",
    category = "crafting",
    name = data_util.mod_prefix .. "naquium-plate",
    results = {
      {name = data_util.mod_prefix .. "naquium-plate", amount = 4},
    },
    energy_required = 30,
    ingredients = {
      {name = data_util.mod_prefix .. "naquium-ingot", amount = 1}
    },
    enabled = false,
    always_show_made_in = true,
  },

  {
    type = "recipe",
    category = "pulverising",
    name = data_util.mod_prefix .. "vitamelange-nugget",
    results = {
      {name = data_util.mod_prefix .. "vitamelange-nugget", amount = 2}, -- 0.5
    },
    energy_required = 1,
    ingredients = {
      {name = data_util.mod_prefix .. "vitamelange", amount = 1}
    },
    enabled = false,
    always_show_made_in = true,
  },
  {
    type = "recipe",
    category = "smelting",
    name = data_util.mod_prefix .. "vitamelange-roast",
    results = {
      {name = data_util.mod_prefix .. "vitamelange-roast", amount = 50} -- 1
    },
    energy_required = 100,
    ingredients = {
      {name=data_util.mod_prefix .. "vulcanite-block", amount = 1},
      {name = data_util.mod_prefix .. "vitamelange-nugget", amount = 100}
    },
    enabled = false,
    always_show_made_in = true,
  },
  {
    type = "recipe",
    category = "crafting",
    name = data_util.mod_prefix .. "vitamelange-spice", -- 2
    results = {
      {name = data_util.mod_prefix .. "vitamelange-spice", amount_min=1, amount_max=1, probability=0.5},
    },
    energy_required = 1,
    ingredients = {
      {name = data_util.mod_prefix .. "vitamelange-roast", amount = 1}
    },
    enabled = false,
    always_show_made_in = true,
  },
  {
    type = "recipe",
    category = "chemistry",
    name = data_util.mod_prefix .. "vitamelange-extract", -- 4
    results = {
      {name = data_util.mod_prefix .. "vitamelange-extract", amount_min=1, amount_max=1, probability=0.5},
    },
    energy_required = 1,
    ingredients = {
      {name = data_util.mod_prefix .. "vitamelange-spice", amount = 1}
    },
    enabled = false,
    always_show_made_in = true,
  },


  {
    type = "recipe",
    category = "pulverising",
    name = data_util.mod_prefix .. "vulcanite-crushed",
    results = {
      {name = data_util.mod_prefix .. "vulcanite-crushed", amount = 1}
    },
    energy_required = 0.5,
    ingredients = {
      {name = data_util.mod_prefix .. "vulcanite", amount = 2}
    },
    enabled = false,
    always_show_made_in = true,
  },
  {
    type = "recipe",
    category = "pressure-washing",
    name = data_util.mod_prefix .. "vulcanite-washed",
    main_product = data_util.mod_prefix .. "vulcanite-washed",
    results = {
      {name = data_util.mod_prefix .. "vulcanite-washed", amount = 2},
      {name = "stone", amount_min = 1, amount_max = 1, probability = 0.25},
      {type = "fluid", name="steam", amount = 2, temperature = 165},
    },
    energy_required = 1,
    ingredients = {
      {type = "fluid", name="water", amount = 4},
      {name = data_util.mod_prefix .. "vulcanite-crushed", amount = 2}
    },
    enabled = false,
    always_show_made_in = true,
    crafting_machine_tint = {
      primary = {
        a = 1,
        b = 0.338,
        r = 0.482,
        g = 0.965
      },
      quaternary = {
        a = 1,
        b = 0.191,
        r = 0.763,
        g = 0.939
      },
      secondary = {
        a = 1,
        b = 0.222,
        r = 0.56,
        g = 0.831
      },
      tertiary = {
        a = 1,
        b = 0.443,
        r = 0.728,
        g = 0.818,
      }
    },
  },
  {
    type = "recipe",
    category = "crafting",
    name = data_util.mod_prefix .. "vulcanite-block",
    results = {
      {name = data_util.mod_prefix .. "vulcanite-block", amount = 1},
    },
    energy_required = 1,
    ingredients = {
      {name = data_util.mod_prefix .. "vulcanite-washed", amount = 1}
    },
    enabled = false,
    always_show_made_in = true,
  },
  {
    type = "recipe",
    category = "chemistry",
    name = data_util.mod_prefix .. "vulcanite-ion-exchange-beads",
    results = {
      {name = data_util.mod_prefix .. "vulcanite-ion-exchange-beads", amount = 10},
    },
    energy_required = 10,
    ingredients = {
      {name = data_util.mod_prefix .. "vulcanite-block", amount = 1},
      {name = "plastic-bar", amount = 1},
      {type = "fluid", name = "sulfuric-acid", amount = 5},
      {type = "fluid", name = "steam", amount = 5},
    },
    crafting_machine_tint = {
      primary = {
        a = 1,
        b = 0.338,
        r = 0.482,
        g = 0.965
      },
      quaternary = {
        a = 1,
        b = 0.191,
        r = 0.763,
        g = 0.939
      },
      secondary = {
        a = 1,
        b = 0.222,
        r = 0.56,
        g = 0.831
      },
      tertiary = {
        a = 1,
        b = 0.443,
        r = 0.728,
        g = 0.818,
      }
    },
    enabled = false,
    always_show_made_in = true,
  },


})
local data_util = require("data_util")
local make_recipe = data_util.make_recipe

data:extend({
  {
      type = "recipe",
      name = data_util.mod_prefix .. "rocket-landing-pad",
      result = data_util.mod_prefix .. "rocket-landing-pad",
      enabled = false,
      energy_required = 20,
      ingredients = {
        {
          "steel-plate",
          1000
        },
        {
          "concrete",
          1000
        },
        {
          "radar",
          10
        },
        {
          "steel-chest",
          10
        },
      },
      requester_paste_multiplier = 1,
    },
    always_show_made_in = true,
})
local data_util = require("data_util")
local make_recipe = data_util.make_recipe

data:extend({
  {
    -- the dummy recipe for ethe rcoket silo section, required for launch
    -- the component is inserted then the launch pad has the required parts.
    type = "recipe",
    name = data_util.mod_prefix .. "rocket-launch-pad-silo-dummy-recipe",
    result = data_util.mod_prefix .. "rocket-launch-pad-silo-dummy-result-item",
    category = "rocket-building",
    enabled = false,
    energy_required = 0.01,
    hidden = true,
    ingredients = {
      { data_util.mod_prefix .. "rocket-launch-pad-silo-dummy-ingredient-item", 1 } -- could be anything really
    },
    always_show_made_in = true,
  },
  {
      type = "recipe",
      name = data_util.mod_prefix .. "rocket-launch-pad",
      result = data_util.mod_prefix .. "rocket-launch-pad",
      enabled = false,
      energy_required = 30,
      ingredients = {
        {
          "steel-plate",
          1000
        },
        {
          "concrete",
          1000
        },
        {
          "pipe",
          100
        },
        {
          "storage-tank",
          10
        },
        {
          "radar",
          10
        },
        {
          "steel-chest",
          10
        },
        {
          "processing-unit",
          200
        },
        {
          "electric-engine-unit",
          200
        }
      },
      requester_paste_multiplier = 1,
    },
    always_show_made_in = true,
})
local data_util = require("data_util")
local make_recipe = data_util.make_recipe

data:extend({
  --[[{
    -- equivalent to 1 cargo rocket setion: (1/100) of a more expensive rocket
    -- but gives 1/10 of a silo rocket launch, so around 2-5 times more efficient than silo rockets
      type = "recipe",
      name = "space-science-pack",
      results = {{"space-science-pack", 100}},
      category = "space-manufacturing",
      enabled = false,
      energy_required = 20,
      ingredients = {
        { data_util.mod_prefix .. "heat-shielding", 10 },
        { "low-density-structure", 10 },
        { "rocket-control-unit", 10 },
        { data_util.mod_prefix .. "cargo-rocket-cargo-pod", 5 },
        { data_util.mod_prefix .. "cargo-rocket-fuel-tank", 1 }
      },
      main_product = "space-science-pack",
      requester_paste_multiplier = 1,
    },
    {
        -- this is much more efficient that rocket returns
        type = "recipe",
        name = "space-science-pack",
        results = {{"space-science-pack", 4}},
        category = "space-crafting",
        enabled = false,
        energy_required = 20,
        ingredients = {
          { data_util.mod_prefix .. "heat-shielding", 1 },
          { "low-density-structure", 1 },
          { "battery", 5 },
          { "processing-unit", 1 },
          { type = "fluid", name = data_util.mod_prefix .. "liquid-rocket-fuel", amount = 20 },
        },
        main_product = "space-science-pack",
        requester_paste_multiplier = 1,
        always_show_made_in = true,
    },]]--
    {
        type = "recipe",
        name = data_util.mod_prefix .. "rocket-science-pack",
        category = "space-manufacturing",
        enabled = false,
        energy_required = 100,
        ingredients = {
          { data_util.mod_prefix .. "satellite-telemetry", 1 },
          { "empty-barrel", 1},
          { "rocket-fuel", 1 },
          { data_util.mod_prefix .. "vulcanite-block", 1 },
          { data_util.mod_prefix .. "machine-learning-data", 1 },
          { type = "fluid", name = data_util.mod_prefix .. "chemical-gel", amount = 2 },
        },
        results = {
          {data_util.mod_prefix .. "rocket-science-pack", 10},
          { data_util.mod_prefix .."junk-data", 1},
        },
        icons = {
          {icon = "__space-exploration-graphics__/graphics/icons/catalogue/deep-1.png", icon_size = 64},
          {icon = "__space-exploration-graphics__/graphics/icons/catalogue/mask-1.png", icon_size = 64},
        },
        icon_size = 64,
        main_product = data_util.mod_prefix .. "rocket-science-pack",
        requester_paste_multiplier = 1,
        always_show_made_in = true,
        subgroup = "science-pack",
    },
    {
        type = "recipe",
        name = data_util.mod_prefix .. "astronomic-science-pack-1",
        category = "space-manufacturing",
        enabled = false,
        energy_required = 30,
        ingredients = {
          { data_util.mod_prefix .. "astronomic-catalogue-1", 1 },
          { data_util.mod_prefix .. "beryllium-plate", 20 },
          { data_util.mod_prefix .. "astronomic-insight", 1 },
          { data_util.mod_prefix .. "significant-data", 1 },
          { type = "fluid", name = data_util.mod_prefix .. "space-coolant-cold", amount = 20},
        },
        results = {
          { data_util.mod_prefix .. "astronomic-science-pack-1", 2},
          { data_util.mod_prefix .. "junk-data", 6},
          { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 20},
        },
        icon_size = 64,
        main_product = data_util.mod_prefix .. "astronomic-science-pack-1",
        requester_paste_multiplier = 1,
        always_show_made_in = true,
    },
    {
        type = "recipe",
        name = data_util.mod_prefix .. "astronomic-science-pack-1-no-beryllium",
        category = "space-manufacturing",
        enabled = false,
        energy_required = 30,
        ingredients = {
          { data_util.mod_prefix .. "astronomic-catalogue-1", 2 },
          { data_util.mod_prefix .. "astronomic-insight", 2 },
          { data_util.mod_prefix .. "significant-data", 2 },
          { type = "fluid", name = data_util.mod_prefix .. "space-coolant-cold", amount = 20},
        },
        results = {
          { data_util.mod_prefix .. "astronomic-science-pack-1", 1},
          { data_util.mod_prefix .. "junk-data", 12},
          { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 20},
        },
        icon_size = 64,
        main_product = data_util.mod_prefix .. "astronomic-science-pack-1",
        requester_paste_multiplier = 1,
        always_show_made_in = true,
    },
    {
        type = "recipe",
        name = data_util.mod_prefix .. "astronomic-science-pack-2",
        category = "space-manufacturing",
        enabled = false,
        energy_required = 30,
        ingredients = {
          { data_util.mod_prefix .. "astronomic-catalogue-2", 1 },
          { data_util.mod_prefix .. "astronomic-science-pack-1", 2 },
          { data_util.mod_prefix .. "aeroframe-pole", 20 },
          { data_util.mod_prefix .. "astronomic-insight", 1 },
          { data_util.mod_prefix .. "significant-data", 1 },
          { type = "fluid", name = data_util.mod_prefix .. "space-coolant-cold", amount = 20},
        },
        results = {
          { data_util.mod_prefix .. "astronomic-science-pack-2", 4},
          { data_util.mod_prefix .. "junk-data", 6},
          { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 20},
        },
        icon_size = 64,
        main_product = data_util.mod_prefix .. "astronomic-science-pack-2",
        requester_paste_multiplier = 1,
        always_show_made_in = true,
    },
    {
        type = "recipe",
        name = data_util.mod_prefix .. "astronomic-science-pack-3",
        category = "space-manufacturing",
        enabled = false,
        energy_required = 30,
        ingredients = {
          { data_util.mod_prefix .. "astronomic-catalogue-3", 1 },
          { data_util.mod_prefix .. "astronomic-science-pack-2", 4 },
          { data_util.mod_prefix .. "aeroframe-scaffold", 10 },
          { data_util.mod_prefix .. "astronomic-insight", 1 },
          { data_util.mod_prefix .. "significant-data", 1 },
          { type = "fluid", name = data_util.mod_prefix .. "space-coolant-cold", amount = 20},
        },
        results = {
          { data_util.mod_prefix .. "astronomic-science-pack-3", 6},
          { data_util.mod_prefix .. "junk-data", 6},
          { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 20},
        },
        icon_size = 64,
        main_product = data_util.mod_prefix .. "astronomic-science-pack-3",
        requester_paste_multiplier = 1,
        always_show_made_in = true,
    },
    {
        type = "recipe",
        name = data_util.mod_prefix .. "astronomic-science-pack-4",
        category = "space-manufacturing",
        enabled = false,
        energy_required = 30,
        ingredients = {
          { data_util.mod_prefix .. "astronomic-catalogue-4", 1 },
          { data_util.mod_prefix .. "astronomic-science-pack-3", 6 },
          { data_util.mod_prefix .. "aeroframe-bulkhead", 2 },
          { data_util.mod_prefix .. "astronomic-insight", 1 },
          { data_util.mod_prefix .. "significant-data", 1 },
          { type = "fluid", name = data_util.mod_prefix .. "space-coolant-cold", amount = 20},
        },
        results = {
          { data_util.mod_prefix .. "astronomic-science-pack-4", 8},
          { data_util.mod_prefix .. "junk-data", 6},
          { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 20},
        },
        icon_size = 64,
        main_product = data_util.mod_prefix .. "astronomic-science-pack-4",
        requester_paste_multiplier = 1,
        always_show_made_in = true,
    },
    {
        type = "recipe",
        name = data_util.mod_prefix .. "biological-science-pack-1",
        category = "space-manufacturing",
        enabled = false,
        energy_required = 30,
        ingredients = {
          { data_util.mod_prefix .. "biological-catalogue-1", 1 },
          { data_util.mod_prefix .. "vitamelange-extract", 20 },
          { data_util.mod_prefix .. "biological-insight", 1 },
          { data_util.mod_prefix .. "significant-data", 1},
          { type = "fluid", name = data_util.mod_prefix .. "space-coolant-cold", amount = 20},
        },
        results = {
          { data_util.mod_prefix .. "biological-science-pack-1", 2},
          { data_util.mod_prefix .. "junk-data", 6},
          { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 20},
        },
        icon_size = 64,
        main_product = data_util.mod_prefix .. "biological-science-pack-1",
        requester_paste_multiplier = 1,
        always_show_made_in = true,
    },
    {
        type = "recipe",
        name = data_util.mod_prefix .. "biological-science-pack-2",
        category = "space-manufacturing",
        enabled = false,
        energy_required = 30,
        ingredients = {
          { data_util.mod_prefix .. "biological-catalogue-2", 1 },
          { data_util.mod_prefix .. "biological-science-pack-1",2 },
          { data_util.mod_prefix .. "bioscrubber", 4 },
          { data_util.mod_prefix .. "biological-insight", 1 },
          { data_util.mod_prefix .. "significant-data", 1 },
          { type = "fluid", name = data_util.mod_prefix .. "space-coolant-cold", amount = 20},
        },
        results = {
          { data_util.mod_prefix .. "biological-science-pack-2", 4},
          { data_util.mod_prefix .. "junk-data", 6},
          { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 20},
        },
        icon_size = 64,
        main_product = data_util.mod_prefix .. "biological-science-pack-2",
        requester_paste_multiplier = 1,
        always_show_made_in = true,
    },
    {
        type = "recipe",
        name = data_util.mod_prefix .. "biological-science-pack-3",
        category = "space-manufacturing",
        enabled = false,
        energy_required = 30,
        ingredients = {
          { data_util.mod_prefix .. "biological-catalogue-3", 1 },
          { data_util.mod_prefix .. "biological-science-pack-2", 4 },
          { data_util.mod_prefix .. "vitalic-reagent", 4 },
          { data_util.mod_prefix .. "biological-insight", 1 },
          { data_util.mod_prefix .. "significant-data", 1 },
          { type = "fluid", name = data_util.mod_prefix .. "space-coolant-cold", amount = 20},
        },
        results = {
          { data_util.mod_prefix .. "biological-science-pack-3", 6},
          { data_util.mod_prefix .. "junk-data", 6},
          { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 20},
        },
        icon_size = 64,
        main_product = data_util.mod_prefix .. "biological-science-pack-3",
        requester_paste_multiplier = 1,
        always_show_made_in = true,
    },
    {
        type = "recipe",
        name = data_util.mod_prefix .. "biological-science-pack-4",
        category = "space-manufacturing",
        enabled = false,
        energy_required = 30,
        ingredients = {
          { data_util.mod_prefix .. "biological-catalogue-4", 1 },
          { data_util.mod_prefix .. "biological-science-pack-3", 6 },
          { data_util.mod_prefix .. "vitalic-epoxy", 2 },
          { data_util.mod_prefix .. "core-fragment-".. data_util.mod_prefix .."vitamelange", 1 },
          { data_util.mod_prefix .. "biological-insight", 1 },
          { data_util.mod_prefix .. "significant-data", 1 },
          { type = "fluid", name = data_util.mod_prefix .. "space-coolant-cold", amount = 20},
        },
        results = {
          { data_util.mod_prefix .. "biological-science-pack-4", 8},
          { data_util.mod_prefix .. "junk-data", 6},
          { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 20},
        },
        icon_size = 64,
        main_product = data_util.mod_prefix .. "biological-science-pack-4",
        requester_paste_multiplier = 1,
        always_show_made_in = true,
    },
    {
        type = "recipe",
        name = data_util.mod_prefix .. "material-science-pack-1",
        category = "space-manufacturing",
        enabled = false,
        energy_required = 30,
        ingredients = {
          { data_util.mod_prefix .. "material-catalogue-1", 1 },
          { data_util.mod_prefix .. "iridium-plate", 20 },
          { data_util.mod_prefix .. "material-insight", 1 },
          { data_util.mod_prefix .. "significant-data", 1 },
          { type = "fluid", name = data_util.mod_prefix .. "space-coolant-cold", amount = 20},
        },
        results = {
          { data_util.mod_prefix .. "material-science-pack-1", 2},
          { data_util.mod_prefix .. "junk-data", 6},
          { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 20},
        },
        icon_size = 64,
        main_product = data_util.mod_prefix .. "material-science-pack-1",
        requester_paste_multiplier = 1,
        always_show_made_in = true,
    },
    {
        type = "recipe",
        name = data_util.mod_prefix .. "material-science-pack-2",
        category = "space-manufacturing",
        enabled = false,
        energy_required = 30,
        ingredients = {
          { data_util.mod_prefix .. "material-catalogue-2", 1 },
          { data_util.mod_prefix .. "material-science-pack-1", 2 },
          { data_util.mod_prefix .. "heavy-girder", 10 },
          { data_util.mod_prefix .. "material-insight", 1 },
          { data_util.mod_prefix .. "significant-data", 1 },
          { type = "fluid", name = data_util.mod_prefix .. "space-coolant-cold", amount = 20},
        },
        results = {
          { data_util.mod_prefix .. "material-science-pack-2", 4},
          { data_util.mod_prefix .. "junk-data", 6},
          { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 20},
        },
        icon_size = 64,
        main_product = data_util.mod_prefix .. "material-science-pack-2",
        requester_paste_multiplier = 1,
        always_show_made_in = true,
    },
    {
        type = "recipe",
        name = data_util.mod_prefix .. "material-science-pack-3",
        category = "space-manufacturing",
        enabled = false,
        energy_required = 30,
        ingredients = {
          { data_util.mod_prefix .. "material-catalogue-3", 1 },
          { data_util.mod_prefix .. "material-science-pack-2", 4 },
          { data_util.mod_prefix .. "heavy-bearing", 6 },
          { data_util.mod_prefix .. "material-insight", 1 },
          { data_util.mod_prefix .. "significant-data", 1 },
          { type = "fluid", name = data_util.mod_prefix .. "space-coolant-cold", amount = 20},
        },
        results = {
          { data_util.mod_prefix .. "material-science-pack-3", 6},
          { data_util.mod_prefix .. "junk-data", 6},
          { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 20},
        },
        icon_size = 64,
        main_product = data_util.mod_prefix .. "material-science-pack-3",
        requester_paste_multiplier = 1,
        always_show_made_in = true,
    },
    {
        type = "recipe",
        name = data_util.mod_prefix .. "material-science-pack-4",
        category = "space-manufacturing",
        enabled = false,
        energy_required = 30,
        ingredients = {
          { data_util.mod_prefix .. "material-catalogue-4", 1 },
          { data_util.mod_prefix .. "material-science-pack-3", 6 },
          { data_util.mod_prefix .. "heavy-composite", 2 },
          { data_util.mod_prefix .. "material-insight", 1 },
          { data_util.mod_prefix .. "significant-data", 1 },
          { type = "fluid", name = data_util.mod_prefix .. "space-coolant-cold", amount = 20},
        },
        results = {
          { data_util.mod_prefix .. "material-science-pack-4", 8},
          { data_util.mod_prefix .. "junk-data", 6},
          { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 20},
        },
        icon_size = 64,
        main_product = data_util.mod_prefix .. "material-science-pack-4",
        requester_paste_multiplier = 1,
        always_show_made_in = true,
    },
    {
        type = "recipe",
        name = data_util.mod_prefix .. "energy-science-pack-1",
        category = "space-manufacturing",
        enabled = false,
        energy_required = 30,
        ingredients = {
          { data_util.mod_prefix .. "energy-catalogue-1", 1 },
          { data_util.mod_prefix .. "holmium-plate", 20 },
          { data_util.mod_prefix .. "energy-insight", 1 },
          { data_util.mod_prefix .. "significant-data", 1 },
          { type = "fluid", name = data_util.mod_prefix .. "space-coolant-cold", amount = 20},
        },
        results = {
          { data_util.mod_prefix .. "energy-science-pack-1", 2},
          { data_util.mod_prefix .. "junk-data", 6},
          { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 20},
        },
        icon_size = 64,
        main_product = data_util.mod_prefix .. "energy-science-pack-1",
        requester_paste_multiplier = 1,
        always_show_made_in = true,
    },
    {
        type = "recipe",
        name = data_util.mod_prefix .. "energy-science-pack-2",
        category = "space-manufacturing",
        enabled = false,
        energy_required = 30,
        ingredients = {
          { data_util.mod_prefix .. "energy-catalogue-2", 1 },
          { data_util.mod_prefix .. "energy-science-pack-1", 2 },
          { data_util.mod_prefix .. "holmium-cable", 25 },
          { data_util.mod_prefix .. "energy-insight", 1 },
          { data_util.mod_prefix .. "significant-data", 1 },
          { type = "fluid", name = data_util.mod_prefix .. "space-coolant-cold", amount = 20},
        },
        results = {
          { data_util.mod_prefix .. "energy-science-pack-2", 4},
          { data_util.mod_prefix .. "junk-data", 6},
          { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 20},
        },
        icon_size = 64,
        main_product = data_util.mod_prefix .. "energy-science-pack-2",
        requester_paste_multiplier = 1,
        always_show_made_in = true,
    },
    {
        type = "recipe",
        name = data_util.mod_prefix .. "energy-science-pack-3",
        category = "space-manufacturing",
        enabled = false,
        energy_required = 30,
        ingredients = {
          { data_util.mod_prefix .. "energy-catalogue-3", 1 },
          { data_util.mod_prefix .. "energy-science-pack-2", 4 },
          { data_util.mod_prefix .. "holmium-solenoid", 10 },
          { data_util.mod_prefix .. "energy-insight", 1 },
          { data_util.mod_prefix .. "significant-data", 1 },
          { type = "fluid", name = data_util.mod_prefix .. "space-coolant-cold", amount = 20},
        },
        results = {
          { data_util.mod_prefix .. "energy-science-pack-3", 6},
          { data_util.mod_prefix .. "junk-data", 6},
          { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 20},
        },
        icon_size = 64,
        main_product = data_util.mod_prefix .. "energy-science-pack-3",
        requester_paste_multiplier = 1,
        always_show_made_in = true,
    },
    {
        type = "recipe",
        name = data_util.mod_prefix .. "energy-science-pack-4",
        category = "space-manufacturing",
        enabled = false,
        energy_required = 30,
        ingredients = {
          { data_util.mod_prefix .. "energy-catalogue-4", 1 },
          { data_util.mod_prefix .. "energy-science-pack-3", 6 },
          { data_util.mod_prefix .. "quantum-processor", 1 },
          { data_util.mod_prefix .. "energy-insight", 1 },
          { data_util.mod_prefix .. "significant-data", 1 },
          { type = "fluid", name = data_util.mod_prefix .. "space-coolant-cold", amount = 20},
        },
        results = {
          { data_util.mod_prefix .. "energy-science-pack-4", 8},
          { data_util.mod_prefix .. "junk-data", 6},
          { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 20},
        },
        icon_size = 64,
        main_product = data_util.mod_prefix .. "energy-science-pack-4",
        requester_paste_multiplier = 1,
        always_show_made_in = true,
    },
    --[[{
        type = "recipe",
        name = data_util.mod_prefix .. "space-science-pack",
        category = "space-manufacturing",
        enabled = false,
        energy_required = 20,
        ingredients = {
          { data_util.mod_prefix .. "significant-data", 100 },
          { data_util.mod_prefix .. "lifesupport-canister", 1 },
          { data_util.mod_prefix .. "space-mirror", 1 },
          { data_util.mod_prefix .. "space-platform-scaffold", 1 },
          { type = "fluid", name = data_util.mod_prefix .. "space-coolant-supercooled", amount = 100},
        },
        results = {
          { data_util.mod_prefix .. "space-science-pack", 5},
          { data_util.mod_prefix .. "junk-data", 100},
          { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 100},
        },
        icon = data.raw.tool[data_util.mod_prefix .. "space-science-pack"].icon,
        icon_size = 64,
        main_product = data_util.mod_prefix .. "space-science-pack",
        requester_paste_multiplier = 1,
    },]]--
    {
        type = "recipe",
        name = data_util.mod_prefix .. "deep-space-science-pack-1",
        category = "space-manufacturing",
        enabled = false,
        energy_required = 60,
        ingredients = {
          { data_util.mod_prefix .. "significant-data", 1 },
          { data_util.mod_prefix .. "deep-catalogue-1", 1 },
          { name = data_util.mod_prefix .. "naquium-plate", amount = 10},
          { type = "fluid", name = data_util.mod_prefix .. "neural-gel-2", amount = 5},
          { type = "fluid", name = data_util.mod_prefix .. "space-coolant-supercooled", amount = 100},
        },
        results = {
          { data_util.mod_prefix .. "deep-space-science-pack-1", 2},
          { data_util.mod_prefix .. "junk-data", 4},
          { data_util.mod_prefix .. "broken-data", 1},
          { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 100},
        },
        icon = data.raw.tool[data_util.mod_prefix .. "deep-space-science-pack-1"].icon,
        icon_size = 64,
        main_product = data_util.mod_prefix .. "deep-space-science-pack-1",
        requester_paste_multiplier = 1,
        always_show_made_in = true,
    },
    {
        type = "recipe",
        name = data_util.mod_prefix .. "deep-space-science-pack-2",
        category = "space-manufacturing",
        enabled = false,
        energy_required = 120,
        ingredients = {
          { data_util.mod_prefix .. "deep-space-science-pack-1", 2},
          { data_util.mod_prefix .. "significant-data", 1 },
          { data_util.mod_prefix .. "deep-catalogue-2", 1 },
          { name = data_util.mod_prefix .. "naquium-cube", amount = 1},
          { type = "fluid", name = data_util.mod_prefix .. "neural-gel-2", amount = 5},
          { type = "fluid", name = data_util.mod_prefix .. "space-coolant-supercooled", amount = 200},
        },
        results = {
          { data_util.mod_prefix .. "deep-space-science-pack-2", 4},
          { data_util.mod_prefix .. "junk-data", 4},
          { data_util.mod_prefix .. "broken-data", 1},
          { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 200},
        },
        icon = data.raw.tool[data_util.mod_prefix .. "deep-space-science-pack-2"].icon,
        icon_size = 64,
        main_product = data_util.mod_prefix .. "deep-space-science-pack-2",
        requester_paste_multiplier = 1,
        always_show_made_in = true,
    },
    {
        type = "recipe",
        name = data_util.mod_prefix .. "deep-space-science-pack-3",
        category = "space-manufacturing",
        enabled = false,
        energy_required = 180,
        ingredients = {
          { data_util.mod_prefix .. "deep-space-science-pack-2", 4},
          { data_util.mod_prefix .. "significant-data", 1 },
          { data_util.mod_prefix .. "deep-catalogue-3", 1 },
          { name = data_util.mod_prefix .. "naquium-tessaract", amount = 1},
          { type = "fluid", name = data_util.mod_prefix .. "neural-gel-2", amount = 5},
          { type = "fluid", name = data_util.mod_prefix .. "space-coolant-supercooled", amount = 200},
        },
        results = {
          { data_util.mod_prefix .. "deep-space-science-pack-3", 6},
          { data_util.mod_prefix .. "junk-data", 4},
          { data_util.mod_prefix .. "broken-data", 1},
          { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 200},
        },
        icon = data.raw.tool[data_util.mod_prefix .. "deep-space-science-pack-3"].icon,
        icon_size = 64,
        main_product = data_util.mod_prefix .. "deep-space-science-pack-3",
        requester_paste_multiplier = 1,
        always_show_made_in = true,
    },
    {
        type = "recipe",
        name = data_util.mod_prefix .. "deep-space-science-pack-4",
        category = "space-manufacturing",
        enabled = false,
        energy_required = 240,
        ingredients = {
          { data_util.mod_prefix .. "deep-space-science-pack-3", 6},
          { data_util.mod_prefix .. "significant-data", 1 },
          { data_util.mod_prefix .. "deep-catalogue-4", 1 },
          { name = data_util.mod_prefix .. "naquium-processor", amount = 1},
          { type = "fluid", name = data_util.mod_prefix .. "neural-gel-2", amount = 5},
          { type = "fluid", name = data_util.mod_prefix .. "space-coolant-supercooled", amount = 200},
        },
        results = {
          { data_util.mod_prefix .. "deep-space-science-pack-4", 8},
          { data_util.mod_prefix .. "junk-data", 4},
          { data_util.mod_prefix .. "broken-data", 1},
          { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 200},
        },
        icon = data.raw.tool[data_util.mod_prefix .. "deep-space-science-pack-4"].icon,
        icon_size = 64,
        main_product = data_util.mod_prefix .. "deep-space-science-pack-4",
        requester_paste_multiplier = 1,
        always_show_made_in = true,
    },

})
local data_util = require("data_util")
local make_recipe = data_util.make_recipe

data:extend({
  {
    type = "recipe",
    name = data_util.mod_prefix .. "space-science-lab",
    category = "space-manufacturing",
    enabled = false,
    energy_required = 30,
    ingredients = {
      {"lab", 10},
      {"low-density-structure", 40},
      {"processing-unit", 20},
      {"electric-engine-unit", 10},
      {"battery", 10},
    },
    results=
    {
      {name=data_util.mod_prefix .. "space-science-lab", amount=1}
    },
    icon = "__space-exploration-graphics__/graphics/icons/space-science-lab.png",
    icon_size = 64,
    crafting_machine_tint =
    {
      primary = {r = 0.290, g = 0.027, b = 0.000, a = 0.000}, -- #49060000
      secondary = {r = 0.722, g = 0.465, b = 0.190, a = 0.000}, -- #b8763000
      tertiary = {r = 0.870, g = 0.365, b = 0.000, a = 0.000}, -- #dd5d0000
    },
    always_show_made_in = true,
  }
})
local data_util = require("data_util")
local make_recipe = data_util.make_recipe

  type = "recipe",
  name = data_util.mod_prefix .. "bio-spectral-data",
  ingredients = {
    { name = data_util.mod_prefix .. "specimen", amount = 1},
    { name = data_util.mod_prefix .. "empty-data", amount = 1},
  },
  results = {
    { name = data_util.mod_prefix .. "bio-spectral-data", amount = 1},
    { type = "fluid", name = data_util.mod_prefix .. "contaminated-bio-sludge", amount = 10},
  },
  energy_required = 20,
  main_product = data_util.mod_prefix .. "bio-spectral-data",
  category = "space-spectrometry",
  enabled = false,
  always_show_made_in = true,
})

  type = "recipe",
  name = data_util.mod_prefix .. "ion-spectrometry-data",
  ingredients = {
    { name = data_util.mod_prefix .. "empty-data", amount = 1},
    { type = "fluid", name = data_util.mod_prefix .. "ion-stream", amount = 40},
  },
  results = {
    { name = data_util.mod_prefix .. "ion-spectrometry-data", amount_min = 1, amount_max = 1, probability = 0.5},
    { name = data_util.mod_prefix .. "junk-data", amount_min = 1, amount_max = 1, probability = 0.49},
  },
  energy_required = 20,
  main_product = data_util.mod_prefix .. "ion-spectrometry-data",
  category = "space-spectrometry",
  enabled = false,
  always_show_made_in = true,
})
local data_util = require("data_util")

data:extend({
  {
    type = "recipe",
    name = data_util.mod_prefix .. "spaceship-console",
    energy_required = 30,
    category = "crafting",
    ingredients =
    {
      {data_util.mod_prefix .. "aeroframe-pole", 20},
      {"glass", 20},
      {"low-density-structure", 20},
      {"processing-unit", 200},
      {data_util.mod_prefix .. "astronomic-catalogue-3", 1},
    },
    result = data_util.mod_prefix .. "spaceship-console",
    result_count = 1,
    enabled = false,
    always_show_made_in = false,
  },
  {
    type = "recipe",
    name = data_util.mod_prefix .. "spaceship-floor",
    energy_required = 10,
    category = "crafting",
    ingredients =
    {
      {data_util.mod_prefix .. "aeroframe-bulkhead", 1},
      {data_util.mod_prefix .. "space-platform-plating", 1},
    },
    result = data_util.mod_prefix .. "spaceship-floor",
    result_count = 1,
    enabled = false,
    always_show_made_in = false,
  },
  {
    type = "recipe",
    name = data_util.mod_prefix .. "spaceship-wall",
    energy_required = 10,
    category = "crafting",
    ingredients =
    {
      {data_util.mod_prefix .. "aeroframe-bulkhead", 1},
      {"glass", 8},
      {"low-density-structure", 4},
      {data_util.mod_prefix .. "heat-shielding", 4}
    },
    result = data_util.mod_prefix .. "spaceship-wall",
    result_count = 1,
    enabled = false,
    always_show_made_in = false,
  },
  {
    type = "recipe",
    name = data_util.mod_prefix .. "spaceship-gate",
    energy_required = 10,
    category = "crafting",
    ingredients =
    {
      {data_util.mod_prefix .. "spaceship-wall", 1},
      {"electric-engine-unit", 6},
      {data_util.mod_prefix .. "aeroframe-bulkhead", 1},
      {data_util.mod_prefix .. "heat-shielding", 1}
      -- TODO: add forcefield projector here
    },
    result = data_util.mod_prefix .. "spaceship-gate",
    result_count = 1,
    enabled = false,
    always_show_made_in = false,
  },
  {
    type = "recipe",
    name = data_util.mod_prefix .. "spaceship-rocket-engine",
    energy_required = 20,
    category = "crafting",
    ingredients =
    {
      {data_util.mod_prefix .. "aeroframe-scaffold", 4},
      {"steel-plate", 20},
      {data_util.mod_prefix .. "heat-shielding", 20},
      {data_util.mod_prefix .. "space-pipe", 20},
      {"electric-engine-unit", 10},
    },
    result = data_util.mod_prefix .. "spaceship-rocket-engine",
    result_count = 1,
    enabled = false,
    always_show_made_in = false,
  },
  {
    type = "recipe",
    name = data_util.mod_prefix .. "spaceship-rocket-engine-burn",
    icon = "__space-exploration-graphics__/graphics/icons/spaceship-rocket-engine.png",
    icon_size = 64,
    order = "a",
    subgroup = "spaceship-process",
    energy_required = 0.1,
    category = "spaceship-rocket-engine",
    ingredients =
    {
      {type="fluid", name=data_util.mod_prefix .. "liquid-rocket-fuel", amount=5},
    },
    results = {},
    flags = {"hidden"},
    hidden = true,
    enabled = true,
    always_show_made_in = true,
  },
  {
    type = "recipe",
    name = data_util.mod_prefix .. "spaceship-rocket-booster-tank",
    energy_required = 10,
    category = "crafting",
    ingredients =
    {
      {data_util.mod_prefix .. "aeroframe-scaffold", 4},
      {"steel-plate", 10},
      {"storage-tank", 10},
      {data_util.mod_prefix .. "heat-shielding", 10},
      {data_util.mod_prefix .. "space-pipe", 4},
      {"electric-engine-unit", 4},
    },
    result = data_util.mod_prefix .. "spaceship-rocket-booster-tank",
    result_count = 1,
    enabled = false,
    always_show_made_in = false,
  },
  {
    type = "recipe",
    name = data_util.mod_prefix .. "spaceship-antimatter-engine",
    energy_required = 30,
    category = "crafting",
    ingredients =
    {
      {data_util.mod_prefix .. "lattice-pressure-vessel", 10},
      {data_util.mod_prefix .. "nanomaterial", 10},
      {data_util.mod_prefix .. "spaceship-rocket-engine", 1},
      {"low-density-structure", 100},
      {data_util.mod_prefix .. "heat-shielding", 100},
      {data_util.mod_prefix .. "superconductive-cable", 100},
      {data_util.mod_prefix .. "naquium-cube", 4},
    },
    result = data_util.mod_prefix .. "spaceship-antimatter-engine",
    result_count = 1,
    enabled = false,
    always_show_made_in = false,
  },
  {
    type = "recipe",
    name = data_util.mod_prefix .. "spaceship-antimatter-engine-burn",
    icon = "__space-exploration-graphics__/graphics/icons/spaceship-antimatter-engine.png",
    icon_size = 64,
    order = "a",
    subgroup = "spaceship-process",
    energy_required = 0.5,
    category = "spaceship-antimatter-engine",
    ingredients =
    {
      {type="fluid", name=data_util.mod_prefix .. "antimatter-stream", amount=1},
      -- 10x energy density, 5 burn would be the same thrust, 25 is 5x faster
    },
    results = {},
    flags = {"hidden"},
    hidden = true,
    enabled = true,
    always_show_made_in = true,
  },
  {
    type = "recipe",
    name = data_util.mod_prefix .. "spaceship-antimatter-booster-tank",
    energy_required = 20,
    category = "crafting",
    ingredients =
    {
      {data_util.mod_prefix .. "lattice-pressure-vessel", 10},
      {data_util.mod_prefix .. "nanomaterial", 10},
      {data_util.mod_prefix .. "spaceship-rocket-booster-tank", 1},
      {"low-density-structure", 50},
      {data_util.mod_prefix .. "heat-shielding", 50},
      {data_util.mod_prefix .. "superconductive-cable", 100},
      {data_util.mod_prefix .. "naquium-cube", 1},
    },
    result = data_util.mod_prefix .. "spaceship-antimatter-booster-tank",
    result_count = 1,
    enabled = false,
    always_show_made_in = false,
  },
})
local data_util = require("data_util")
local make_recipe = data_util.make_recipe

data:extend({
  {
    type = "recipe",
    name = data_util.mod_prefix .. "fuel-refinery",
    result = data_util.mod_prefix .. "fuel-refinery",
    enabled = false,
    energy_required = 10,
    ingredients = {
      { "glass", 20 },
      { "steel-plate", 20 },
      { "stone-brick", 20 },
      { "pipe", 20 },
      { "iron-gear-wheel", 20 },
    },
    requester_paste_multiplier = 1,
    always_show_made_in = false,
  },
  {
    type = "recipe",
    name = data_util.mod_prefix .. "fluid-burner-generator",
    result = data_util.mod_prefix .. "fluid-burner-generator",
    enabled = false,
    energy_required = 5,
    ingredients = {
      { "steel-plate", 10 },
      { "copper-plate", 30 },
      { "pipe", 30 },
      { "iron-gear-wheel", 20 },
    },
    requester_paste_multiplier = 1,
    always_show_made_in = false,
  },
  {
    type = "recipe",
    name = data_util.mod_prefix .. "antimatter-reactor",
    result = data_util.mod_prefix .. "antimatter-reactor",
    enabled = false,
    energy_required = 30,
    ingredients = {
      { data_util.mod_prefix .. "energy-catalogue-4", 5 },
      { data_util.mod_prefix .. "heat-shielding", 500 },
      { "low-density-structure", 500 },
      { "processing-unit", 500 },
      { data_util.mod_prefix .. "superconductive-cable", 500 },
      { name = data_util.mod_prefix .. "naquium-cube", amount = 50},
    },
    requester_paste_multiplier = 1,
    always_show_made_in = false,
  },
  {
    type = "recipe",
    name = data_util.mod_prefix .. "naquium-heat-pipe",
    result = data_util.mod_prefix .. "naquium-heat-pipe",
    enabled = false,
    energy_required = 5,
    ingredients = {
      { data_util.mod_prefix .. "superconductive-cable", 1 },
      { name = data_util.mod_prefix .. "naquium-plate", amount = 4},
    },
    requester_paste_multiplier = 1,
    always_show_made_in = false,
  },
  {
    type = "recipe",
    name = data_util.mod_prefix .. "dimensional-anchor",
    result = data_util.mod_prefix .. "dimensional-anchor",
    enabled = false,
    energy_required = 30,
    ingredients = {
      { data_util.mod_prefix .. "deep-catalogue-3", 4 },
      { data_util.mod_prefix .. "heavy-assembly", 100 },
      { data_util.mod_prefix .. "lattice-pressure-vessel", 100 },
      { data_util.mod_prefix .. "superconductive-cable", 500 },
      { name = data_util.mod_prefix .. "naquium-tessaract", amount = 8},
      {data_util.mod_prefix .. "quantum-processor", 8},
    },
    requester_paste_multiplier = 1,
    category = "space-manufacturing",
    always_show_made_in = true,
  },
  {
    type = "recipe",
    name = data_util.mod_prefix .. "meteor-point-defence",
    result = data_util.mod_prefix .. "meteor-point-defence",
    enabled = false,
    energy_required = 30,
    ingredients = {
      { "electronic-circuit", 40 },
      { "steel-plate", 40 },
      { "concrete", 40 },
      { "glass", 20 },
      { "iron-gear-wheel", 20 },
    },
    requester_paste_multiplier = 1,
    always_show_made_in = false,
  },
  {
    type = "recipe",
    name = data_util.mod_prefix .. "meteor-point-defence-ammo",
    result = data_util.mod_prefix .. "meteor-point-defence-ammo",
    enabled = false,
    energy_required = 10,
    ingredients = {
      { "steel-plate", 8 },
      { "coal", 4 },
    },
    requester_paste_multiplier = 1,
    always_show_made_in = false,
  },
  {
    type = "recipe",
    name = data_util.mod_prefix .. "meteor-defence",
    result = data_util.mod_prefix .. "meteor-defence",
    enabled = false,
    energy_required = 30,
    ingredients = {
      { "processing-unit", 100 },
      { "copper-cable", 100 },
      { "steel-plate", 100 },
      { "concrete", 100 },
      { "glass", 50 },
      { "battery", 50 },
    },
    requester_paste_multiplier = 1,
    always_show_made_in = false,
  },
  {
    type = "recipe",
    name = data_util.mod_prefix .. "meteor-defence-ammo",
    result = data_util.mod_prefix .. "meteor-defence-ammo",
    enabled = false,
    energy_required = 10,
    ingredients = {
      { "steel-plate", 10 },
      { "electronic-circuit", 10 },
      { "battery", 10 },
    },
    requester_paste_multiplier = 1,
    always_show_made_in = false,
  },
  {
    type = "recipe",
    name = data_util.mod_prefix .. "pulveriser",
    category = "crafting",
    enabled = false,
    energy_required = 30,
    ingredients = {
      {"steel-plate", 15},
      {"iron-plate", 15},
      {"pipe", 15},
      {"concrete", 15},
    },
    results=
    {
      {name = data_util.mod_prefix .. "pulveriser", amount=1}
    },
    icon = "__space-exploration-graphics__/graphics/icons/pulveriser.png",
    icon_size = 64,
    order = "g-z[pulveriser]",
    always_show_made_in = false,
  },
  {
    type = "recipe",
    name = data_util.mod_prefix .. "addon-power-pole",
    category = "crafting",
    enabled = false,
    energy_required = 2,
    ingredients = {
      {data_util.mod_prefix .. "aeroframe-pole", 4},
      {data_util.mod_prefix .. "holmium-cable", 8},
    },
    results=
    {
      {name = data_util.mod_prefix .. "addon-power-pole", amount=1}
    },
    icon = "__space-exploration-graphics__/graphics/icons/addon-power-pole.png",
    icon_size = 64,
  },
  {
    type = "recipe",
    name = data_util.mod_prefix .. "pylon",
    category = "crafting",
    enabled = false,
    energy_required = 10,
    ingredients = {
      {data_util.mod_prefix .. "beryllium-plate", 8},
      {data_util.mod_prefix .. "aeroframe-pole", 1},
      {data_util.mod_prefix .. "holmium-cable", 16},
      {"concrete", 16},
    },
    results=
    {
      {name = data_util.mod_prefix .. "pylon", amount=1}
    },
    icon = "__space-exploration-graphics__/graphics/icons/pylon.png",
    icon_size = 64,
  },
  {
    type = "recipe",
    name = data_util.mod_prefix .. "pylon-substation",
    category = "crafting",
    enabled = false,
    energy_required = 10,
    ingredients = {
      {data_util.mod_prefix .. "pylon", 1},
      {data_util.mod_prefix .. "holmium-solenoid", 4},
      {"processing-unit", 16},
      {"battery", 16},
    },
    results=
    {
      {name = data_util.mod_prefix .. "pylon-substation", amount=1}
    },
    icon = "__space-exploration-graphics__/graphics/icons/pylon-substation.png",
    icon_size = 64,
  },
  {
    type = "recipe",
    name = data_util.mod_prefix .. "pylon-construction",
    category = "crafting",
    enabled = false,
    energy_required = 10,
    ingredients = {
      {data_util.mod_prefix .. "pylon", 1},
      {data_util.mod_prefix .. "aeroframe-scaffold", 4},
      {data_util.mod_prefix .. "holmium-solenoid", 4},
      {data_util.mod_prefix .. "heavy-girder", 4},
      {"processing-unit", 16},
      {"battery", 16},
    },
    results=
    {
      {name = data_util.mod_prefix .. "pylon-construction", amount=1}
    },
    icon = "__space-exploration-graphics__/graphics/icons/pylon-construction.png",
    icon_size = 64,
  },
  {
    type = "recipe",
    name = data_util.mod_prefix .. "pylon-construction-radar",
    category = "crafting",
    enabled = false,
    energy_required = 10,
    ingredients = {
      {"radar", 1},
      {data_util.mod_prefix .. "pylon-construction", 1},
      {data_util.mod_prefix .. "aeroframe-bulkhead", 4},
      {data_util.mod_prefix .. "heavy-bearing", 4},
      {data_util.mod_prefix .. "quantum-processor", 4},
      {"battery", 16},
    },
    results=
    {
      {name = data_util.mod_prefix .. "pylon-construction-radar", amount=1}
    },
    icon = "__space-exploration-graphics__/graphics/icons/pylon-construction-radar.png",
    icon_size = 64,
  },
  {
    type = "recipe",
    name = data_util.mod_prefix .. "space-assembling-machine",
    category = "crafting",
    enabled = false,
    energy_required = 10,
    ingredients = {
      {data_util.mod_prefix .. "heat-shielding", 4},
      {"low-density-structure", 8},
      {"electric-engine-unit", 8},
      {"processing-unit", 4},
    },
    results=
    {
      {name = data_util.mod_prefix .. "space-assembling-machine", amount=1}
    },
    icon = "__space-exploration-graphics__/graphics/icons/assembling-machine.png",
    icon_size = 64,
    enabled = false,
    always_show_made_in = false,
  },
  {
    type = "recipe",
    name = data_util.mod_prefix .. "space-astrometrics-laboratory",
    category = "space-manufacturing",
    enabled = false,
    energy_required = 10,
    ingredients = {
      {data_util.mod_prefix .. "space-assembling-machine", 1},
      {"low-density-structure", 40},
      {"electric-engine-unit", 8},
      {"advanced-circuit", 40},
      {"processing-unit", 20},
    },
    results=
    {
      {name = data_util.mod_prefix .. "space-astrometrics-laboratory", amount=1}
    },
    icon = "__space-exploration-graphics__/graphics/icons/astrometrics-laboratory.png",
    icon_size = 64,
    enabled = false,
    always_show_made_in = true,
  },
  {
    type = "recipe",
    name = data_util.mod_prefix .. "space-biochemical-laboratory",
    category = "space-manufacturing",
    enabled = false,
    energy_required = 10,
    ingredients = {
      {"chemical-plant", 3},
      {"low-density-structure", 60},
      {"glass", 100},
      {"pump", 4},
      {"electric-engine-unit", 6},
    },
    results=
    {
      {name = data_util.mod_prefix .. "space-biochemical-laboratory", amount=1}
    },
    icon = "__space-exploration-graphics__/graphics/icons/biochemical-laboratory.png",
    icon_size = 64,
    enabled = false,
    always_show_made_in = true,
  },
  {
    type = "recipe",
    name = data_util.mod_prefix .. "space-decontamination-facility",
    category = "space-crafting",
    enabled = false,
    energy_required = 10,
    ingredients = {
      {"chemical-plant", 1},
      {"low-density-structure", 40},
      {data_util.mod_prefix .. "space-pipe", 10},
      {"electric-engine-unit", 6},
      {data_util.mod_prefix .. "vulcanite-block", 1},
    },
    results=
    {
      {name = data_util.mod_prefix .. "space-decontamination-facility", amount=1}
    },
    icon = "__space-exploration-graphics__/graphics/icons/decontamination-facility.png",
    icon_size = 64,
    enabled = false,
    always_show_made_in = true,
  },
  {
    type = "recipe",
    name = data_util.mod_prefix .. "space-electromagnetics-laboratory",
    category = "space-manufacturing",
    enabled = false,
    energy_required = 10,
    ingredients = {
      {data_util.mod_prefix .. "space-assembling-machine", 2},
      {"low-density-structure", 60},
      {"accumulator", 20},
      {"processing-unit", 20},
    },
    results=
    {
      {name = data_util.mod_prefix .. "space-electromagnetics-laboratory", amount=1}
    },
    icon = "__space-exploration-graphics__/graphics/icons/electromagnetics-laboratory.png",
    icon_size = 64,
    enabled = false,
    always_show_made_in = true,
  },
  {
    type = "recipe",
    name = data_util.mod_prefix .. "space-genetics-laboratory",
    category = "space-manufacturing",
    enabled = false,
    energy_required = 10,
    ingredients = {
      {data_util.mod_prefix .. "space-assembling-machine", 1},
      {"low-density-structure", 80},
      {"glass", 80},
      {"electric-engine-unit", 20},
      {"processing-unit", 20},
      {data_util.mod_prefix .. "nutrient-vat", 20},
    },
    results=
    {
      {name = data_util.mod_prefix .. "space-genetics-laboratory", amount=1}
    },
    icon = "__space-exploration-graphics__/graphics/icons/genetics-laboratory.png",
    icon_size = 64,
    enabled = false,
    always_show_made_in = true,
  },
  {
    type = "recipe",
    name = data_util.mod_prefix .. "space-gravimetrics-laboratory",
    category = "space-manufacturing",
    enabled = false,
    energy_required = 10,
    ingredients = {
      {data_util.mod_prefix .. "space-assembling-machine", 1},
      {"low-density-structure", 40},
      {"electric-engine-unit", 8},
      {"advanced-circuit", 40},
      {"processing-unit", 20},
    },
    results=
    {
      {name = data_util.mod_prefix .. "space-gravimetrics-laboratory", amount=1}
    },
    icon = "__space-exploration-graphics__/graphics/icons/gravimetrics-laboratory.png",
    icon_size = 64,
    enabled = false,
    always_show_made_in = true,
  },
  {
    type = "recipe",
    name = data_util.mod_prefix .. "space-growth-facility",
    category = "space-manufacturing",
    enabled = false,
    energy_required = 10,
    ingredients = {
      {data_util.mod_prefix .. "space-assembling-machine", 1},
      {"low-density-structure", 40},
      {"pump", 4},
      {"small-lamp", 100},
      {"glass", 400},
    },
    results=
    {
      {name = data_util.mod_prefix .. "space-growth-facility", amount=1}
    },
    icon = "__space-exploration-graphics__/graphics/icons/growth-facility.png",
    icon_size = 64,
    enabled = false,
    always_show_made_in = true,
  },
  {
    type = "recipe",
    name = data_util.mod_prefix .. "space-hypercooler",
    category = "space-manufacturing",
    enabled = false,
    energy_required = 10,
    ingredients = {
      {"storage-tank", 1},
      {"pump", 4},
      {"electric-engine-unit", 4},
      {"low-density-structure", 20},
      {data_util.mod_prefix .. "space-pipe", 10},
    },
    results=
    {
      {name = data_util.mod_prefix .. "space-hypercooler", amount=1}
    },
    icon = "__space-exploration-graphics__/graphics/icons/hypercooler.png",
    icon_size = 64,
    enabled = false,
    always_show_made_in = true,
  },
  {
    type = "recipe",
    name = data_util.mod_prefix .. "space-laser-laboratory",
    category = "space-manufacturing",
    enabled = false,
    energy_required = 10,
    ingredients = {
      {data_util.mod_prefix .. "space-assembling-machine", 1},
      {"low-density-structure", 60},
      {"glass", 80},
      {"accumulator", 20},
      {"processing-unit", 20},
    },
    results=
    {
      {name = data_util.mod_prefix .. "space-laser-laboratory", amount=1}
    },
    icon = "__space-exploration-graphics__/graphics/icons/laser-laboratory.png",
    icon_size = 64,
    enabled = false,
    always_show_made_in = true,
  },
  {
    type = "recipe",
    name = data_util.mod_prefix .. "lifesupport-facility",
    category = "crafting",
    enabled = false,
    energy_required = 10,
    ingredients = {
      {"assembling-machine-2", 1},
      {"low-density-structure", 40},
      {"pump", 1},
      {"pipe", 40},
      {"electric-engine-unit", 6},
    },
    results=
    {
      {name = data_util.mod_prefix .. "lifesupport-facility", amount=1}
    },
    icon = "__space-exploration-graphics__/graphics/icons/lifesupport-facility.png",
    icon_size = 64,
    enabled = false,
    always_show_made_in = false,
  },
  {
    type = "recipe",
    name = data_util.mod_prefix .. "space-manufactory",
    category = "space-crafting",
    enabled = false,
    energy_required = 10,
    ingredients = {
      {data_util.mod_prefix .. "space-assembling-machine", 4},
      {"fast-inserter", 8},
      {data_util.mod_prefix .. "heat-shielding", 8},
      {"electric-engine-unit", 32},
      {"low-density-structure", 80},
      {type = "fluid", name = data_util.mod_prefix .. "space-water", amount = 8},
    },
    results=
    {
      {name = data_util.mod_prefix .. "space-manufactory", amount=1}
    },
    icon = "__space-exploration-graphics__/graphics/icons/manufactory.png",
    icon_size = 64,
    enabled = false,
    always_show_made_in = true,
  },
  {
    type = "recipe",
    name = data_util.mod_prefix .. "space-mechanical-laboratory",
    category = "space-manufacturing",
    enabled = false,
    energy_required = 10,
    ingredients = {
      {data_util.mod_prefix .. "space-assembling-machine", 4},
      {"low-density-structure", 60},
      {"steel-plate", 100},
      {"concrete", 100},
      {"electric-engine-unit", 40},
      {"gun-turret", 10},
    },
    results=
    {
      {name = data_util.mod_prefix .. "space-mechanical-laboratory", amount=1}
    },
    icon = "__space-exploration-graphics__/graphics/icons/mechanical-laboratory.png",
    icon_size = 64,
    enabled = false,
    always_show_made_in = true,
  },
  {
    type = "recipe",
    name = data_util.mod_prefix .. "space-particle-accelerator",
    category = "space-manufacturing",
    enabled = false,
    energy_required = 10,
    ingredients = {
      {data_util.mod_prefix .. "space-assembling-machine", 1},
      {"low-density-structure", 60},
      {"laser-turret", 6},
      {"accumulator", 20},
      {"processing-unit", 20},
    },
    results=
    {
      {name = data_util.mod_prefix .. "space-particle-accelerator", amount=1}
    },
    icon = "__space-exploration-graphics__/graphics/icons/particle-accelerator.png",
    icon_size = 64,
    enabled = false,
    always_show_made_in = true,
  },
  {
    type = "recipe",
    name = data_util.mod_prefix .. "space-particle-collider",
    category = "space-manufacturing",
    enabled = false,
    energy_required = 10,
    ingredients = {
      {data_util.mod_prefix .. "space-assembling-machine", 1},
      {"low-density-structure", 60},
      {"laser-turret", 6},
      {"accumulator", 20},
      {data_util.mod_prefix .. "heat-shielding", 20},
      {data_util.mod_prefix .. "holmium-cable", 100},
    },
    results=
    {
      {name = data_util.mod_prefix .. "space-particle-collider", amount=1}
    },
    icon = "__space-exploration-graphics__/graphics/icons/particle-collider.png",
    icon_size = 64,
    enabled = false,
    always_show_made_in = true,
  },
  {
    type = "recipe",
    name = data_util.mod_prefix .. "space-plasma-generator",
    category = "space-manufacturing",
    enabled = false,
    energy_required = 10,
    ingredients = {
      {"chemical-plant", 1},
      {"low-density-structure", 60},
      {"electric-furnace", 4},
      {data_util.mod_prefix .. "heat-shielding", 20},
    },
    results=
    {
      {name = data_util.mod_prefix .. "space-plasma-generator", amount=1}
    },
    icon = "__space-exploration-graphics__/graphics/icons/plasma-generator.png",
    icon_size = 64,
    enabled = false,
    always_show_made_in = true,
  },
  {
    type = "recipe",
    name = data_util.mod_prefix .. "space-radiation-laboratory",
    category = "space-manufacturing",
    enabled = false,
    energy_required = 10,
    ingredients = {
      {"uranium-fuel-cell", 4},
      {"chemical-plant", 4},
      {"low-density-structure", 60},
      {data_util.mod_prefix .. "heat-shielding", 20},
      {"steel-plate", 100},
      {"glass", 80},
    },
    results=
    {
      {name = data_util.mod_prefix .. "space-radiation-laboratory", amount=1}
    },
    icon = "__space-exploration-graphics__/graphics/icons/radiation-laboratory.png",
    icon_size = 64,
    enabled = false,
    always_show_made_in = true,
  },
  {
    type = "recipe",
    name = data_util.mod_prefix .. "space-radiator",
    category = "space-manufacturing",
    enabled = false,
    energy_required = 10,
    ingredients = {
      {"pump", 4},
      {"electric-engine-unit", 4},
      {"steel-plate", 20},
      {data_util.mod_prefix .. "space-pipe", 4},
      {"copper-cable", 200},
    },
    results=
    {
      {name = data_util.mod_prefix .. "space-radiator", amount=1}
    },
    icon = "__space-exploration-graphics__/graphics/icons/radiator.png",
    icon_size = 64,
    enabled = false,
    always_show_made_in = true,
  },
  {
    type = "recipe",
    name = data_util.mod_prefix .. "space-radiator-2",
    category = "space-manufacturing",
    enabled = false,
    energy_required = 10,
    ingredients = {
      {data_util.mod_prefix .. "space-radiator", 1},
      {data_util.mod_prefix .. "cryonite-rod", 16},
      {data_util.mod_prefix .. "beryllium-plate", 16},
    },
    results=
    {
      {name = data_util.mod_prefix .. "space-radiator-2", amount=1}
    },
    icon = "__space-exploration-graphics__/graphics/icons/radiator-blue.png",
    icon_size = 64,
    enabled = false,
    always_show_made_in = true,
  },
  {
    type = "recipe",
    name = data_util.mod_prefix .. "recycling-facility",
    category = "crafting",
    enabled = false,
    energy_required = 10,
    ingredients = {
      {"steel-plate", 20},
      {"advanced-circuit", 10},
      {"electric-engine-unit", 10},
      {"concrete", 20},
      {data_util.mod_prefix .. "heat-shielding", 10},
    },
    results=
    {
      {name = data_util.mod_prefix .. "recycling-facility", amount=1}
    },
    icon = "__space-exploration-graphics__/graphics/icons/recycling-facility.png",
    icon_size = 64,
    enabled = false,
    always_show_made_in = false,
  },
  {
    type = "recipe",
    name = data_util.mod_prefix .. "space-material-fabricator",
    category = "space-manufacturing",
    enabled = false,
    energy_required = 10,
    ingredients = {
      {data_util.mod_prefix .. "space-particle-collider", 1},
      {data_util.mod_prefix .. "space-manufactory", 1},
      {data_util.mod_prefix .. "space-thermodynamics-laboratory", 1},
      {"speed-module-6", 5},
      {"effectivity-module-6", 5},
    },
    results=
    {
      {name = data_util.mod_prefix .. "space-material-fabricator", amount=1}
    },
    icon = "__space-exploration-graphics__/graphics/icons/material-fabricator.png",
    icon_size = 64,
    enabled = false,
    always_show_made_in = true,
  },
  {
    type = "recipe",
    name = data_util.mod_prefix .. "space-supercomputer-1",
    category = "space-manufacturing",
    enabled = false,
    energy_required = 10,
    ingredients = {
      {data_util.mod_prefix .. "space-assembling-machine", 1},
      {"low-density-structure", 40},
      {"processing-unit", 100},
    },
    results=
    {
      {name = data_util.mod_prefix .. "space-supercomputer-1", amount=1}
    },
    icon = "__space-exploration-graphics__/graphics/icons/supercomputer-1.png",
    icon_size = 64,
    enabled = false,
    always_show_made_in = true,
  },
  {
    type = "recipe",
    name = data_util.mod_prefix .. "space-supercomputer-2",
    category = "space-manufacturing",
    enabled = false,
    energy_required = 20,
    ingredients = {
      {data_util.mod_prefix .. "space-supercomputer-1", 1},
      {"processing-unit", 500},
      {data_util.mod_prefix .. "quantum-processor", 50},
    },
    results=
    {
      {name = data_util.mod_prefix .. "space-supercomputer-2", amount=1}
    },
    icon = "__space-exploration-graphics__/graphics/icons/supercomputer-2.png",
    icon_size = 64,
    enabled = false,
    always_show_made_in = true,
  },
  {
    type = "recipe",
    name = data_util.mod_prefix .. "space-supercomputer-3",
    category = "space-manufacturing",
    enabled = false,
    energy_required = 30,
    ingredients = {
      {data_util.mod_prefix .. "space-supercomputer-2", 1},
      {"processing-unit", 1000},
      {data_util.mod_prefix .. "superconductive-cable", 100},
      {type = "fluid", name = data_util.mod_prefix .. "neural-gel-2", amount = 1000},
      {data_util.mod_prefix .. "bioelectrics-data", 100},
    },
    results=
    {
      {name = data_util.mod_prefix .. "space-supercomputer-3", amount=1}
    },
    icon = "__space-exploration-graphics__/graphics/icons/supercomputer-3.png",
    icon_size = 64,
    enabled = false,
    always_show_made_in = true,
  },
  {
    type = "recipe",
    name = data_util.mod_prefix .. "space-supercomputer-4",
    category = "space-manufacturing",
    enabled = false,
    energy_required = 40,
    ingredients = {
      {data_util.mod_prefix .. "space-supercomputer-3", 1},
      {type = "fluid", name = data_util.mod_prefix .. "neural-gel-2", amount = 1000},
      {data_util.mod_prefix .. "naquium-processor", 42},
    },
    results=
    {
      {name = data_util.mod_prefix .. "space-supercomputer-4", amount=1}
    },
    icon = "__space-exploration-graphics__/graphics/icons/supercomputer-4.png",
    icon_size = 64,
    enabled = false,
    always_show_made_in = true,
  },
  {
    type = "recipe",
    name = data_util.mod_prefix .. "space-telescope",
    category = "space-manufacturing",
    enabled = false,
    energy_required = 10,
    ingredients = {
      {data_util.mod_prefix .. "space-assembling-machine", 1},
      {data_util.mod_prefix .. "space-mirror", 2},
      {"low-density-structure", 40},
      {"glass", 40},
    },
    results=
    {
      {name = data_util.mod_prefix .. "space-telescope", amount=1}
    },
    icon = "__space-exploration-graphics__/graphics/icons/telescope.png",
    icon_size = 64,
    enabled = false,
    always_show_made_in = true,
  },
  {
    type = "recipe",
    name = data_util.mod_prefix .. "space-telescope-radio",
    category = "space-manufacturing",
    enabled = false,
    energy_required = 10,
    ingredients = {
      {data_util.mod_prefix .. "space-assembling-machine", 1},
      {"radar", 10},
      {data_util.mod_prefix .. "space-mirror", 10},
      {"low-density-structure", 120},
      {data_util.mod_prefix .. "aeroframe-scaffold", 120},
    },
    results=
    {
      {name = data_util.mod_prefix .. "space-telescope-radio", amount=1}
    },
    icon = "__space-exploration-graphics__/graphics/icons/telescope-radio.png",
    icon_size = 64,
    enabled = false,
    always_show_made_in = true,
  },
  {
    type = "recipe",
    name = data_util.mod_prefix .. "space-telescope-microwave",
    category = "space-manufacturing",
    enabled = false,
    energy_required = 10,
    ingredients = {
      {data_util.mod_prefix .. "space-assembling-machine", 1},
      {data_util.mod_prefix .. "space-mirror", 6},
      {"low-density-structure", 80},
      {"glass", 80},
      {data_util.mod_prefix .. "aeroframe-pole", 120},
    },
    results=
    {
      {name = data_util.mod_prefix .. "space-telescope-microwave", amount=1}
    },
    icon = "__space-exploration-graphics__/graphics/icons/telescope-microwave.png",
    icon_size = 64,
    enabled = false,
    always_show_made_in = true,
  },
  {
    type = "recipe",
    name = data_util.mod_prefix .. "space-telescope-xray",
    category = "space-manufacturing",
    enabled = false,
    energy_required = 10,
    ingredients = {
      {data_util.mod_prefix .. "space-assembling-machine", 1},
      {data_util.mod_prefix .. "space-mirror", 6},
      {data_util.mod_prefix .. "heat-shielding", 6},
      {"low-density-structure", 60},
      {data_util.mod_prefix .. "aeroframe-pole", 60},
    },
    results=
    {
      {name = data_util.mod_prefix .. "space-telescope-xray", amount=1}
    },
    icon = "__space-exploration-graphics__/graphics/icons/telescope-xray.png",
    icon_size = 64,
    enabled = false,
    always_show_made_in = true,
  },
  {
    type = "recipe",
    name = data_util.mod_prefix .. "space-telescope-gammaray",
    category = "space-manufacturing",
    enabled = false,
    energy_required = 10,
    ingredients = {
      {data_util.mod_prefix .. "space-assembling-machine", 1},
      {data_util.mod_prefix .. "heat-shielding", 6},
      {data_util.mod_prefix .. "space-mirror", 24},
      {"low-density-structure", 60},
      {data_util.mod_prefix .. "aeroframe-scaffold", 60},
    },
    results=
    {
      {name = data_util.mod_prefix .. "space-telescope-gammaray", amount=1}
    },
    icon = "__space-exploration-graphics__/graphics/icons/telescope-gammaray.png",
    icon_size = 64,
    enabled = false,
    always_show_made_in = true,
  },
  {
    type = "recipe",
    name = data_util.mod_prefix .. "space-thermodynamics-laboratory",
    category = "space-manufacturing",
    enabled = false,
    energy_required = 10,
    ingredients = {
      {data_util.mod_prefix .. "space-assembling-machine", 1},
      {"chemical-plant", 1},
      {"electric-furnace", 1},
      {"low-density-structure", 60},
      {data_util.mod_prefix .. "heat-shielding", 60},
      {"steel-plate", 100},
      {"storage-tank", 8},
    },
    results=
    {
      {name = data_util.mod_prefix .. "space-thermodynamics-laboratory", amount=1}
    },
    icon = "__space-exploration-graphics__/graphics/icons/thermodynamics-laboratory.png",
    icon_size = 64,
    enabled = false,
    always_show_made_in = true,
  },
  {
    type = "recipe",
    name = data_util.mod_prefix .. "supercharger",
    category = "crafting",
    enabled = false,
    energy_required = 10,
    ingredients = {
      {data_util.mod_prefix .. "aeroframe-scaffold", 4},
      {data_util.mod_prefix .. "heavy-girder", 4},
      {data_util.mod_prefix .. "holmium-solenoid", 16},
      {data_util.mod_prefix .. "holmium-cable", 16},
      {"battery", 16},
    },
    results=
    {
      {name = data_util.mod_prefix .. "supercharger", amount=1}
    },
    icon = "__space-exploration-graphics__/graphics/icons/supercharger.png",
    icon_size = 64,
  },
  {
    type = "recipe",
    name = data_util.mod_prefix .. "wide-beacon",
    enabled = false,
    energy_required = 10,
    ingredients = {
      {"beacon", 1},
      {data_util.mod_prefix .. "energy-catalogue-1", 1},
      {data_util.mod_prefix .. "holmium-solenoid", 2},
      {"low-density-structure", 60},
      {"processing-unit", 60},
      {data_util.mod_prefix .. "holmium-cable", 200},
    },
    results=
    {
      {name = data_util.mod_prefix .. "wide-beacon", amount=1}
    },
    icon = "__space-exploration-graphics__/graphics/icons/wide-beacon.png",
    icon_size = 64,
    enabled = false,
    always_show_made_in = false,
  },
  {
    type = "recipe",
    name = data_util.mod_prefix .. "wide-beacon-2",
    enabled = false,
    energy_required = 10,
    ingredients = {
      {data_util.mod_prefix .. "wide-beacon", 1},
      {data_util.mod_prefix .. "deep-catalogue-1", 1},
      {data_util.mod_prefix .. "superconductive-cable", 10},
      {data_util.mod_prefix .. "dynamic-emitter", 10},
      {data_util.mod_prefix .. "naquium-tessaract", 10},
    },
    results=
    {
      {name = data_util.mod_prefix .. "wide-beacon-2", amount=1}
    },
    icon = "__space-exploration-graphics__/graphics/icons/wide-beacon-2.png",
    icon_size = 64,
    enabled = false,
    always_show_made_in = false,
  },
})
local data_util = require("data_util")
local make_recipe = data_util.make_recipe

-- formating (junk)
  type = "recipe",
  name = data_util.mod_prefix .. "formatting-1",
  ingredients = {
    { name = data_util.mod_prefix .. "junk-data", amount = 1 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-warm", amount = 1},
  },
  results = {
    { name = data_util.mod_prefix .. "empty-data", amount_min = 1, amount_max = 1, probability = 0.7 },
    { name = data_util.mod_prefix .. "broken-data", amount_min = 1, amount_max = 1, probability = 0.29 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 1},
  },
  icons = {
    { icon = "__space-exploration-graphics__/graphics/icons/data/junk.png", scale = 0.85, shift = {2, -4}, icon_size = 64 },
    { icon = data.raw.item[data_util.mod_prefix .. "space-supercomputer-1"].icon, scale = 0.5, shift = {-24, 24}, icon_size = 64 },
  },
  energy_required = 1.5,
  subgroup = "data-generic",
  category = "space-supercomputing-1",
  always_show_made_in = true,
})
  type = "recipe",
  name = data_util.mod_prefix .. "formatting-2",
  ingredients = {
    { name = data_util.mod_prefix .. "junk-data", amount = 1 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-cold", amount = 1},
  },
  results = {
    { name = data_util.mod_prefix .. "empty-data", amount_min = 1, amount_max = 1, probability = 0.8 },
    { name = data_util.mod_prefix .. "broken-data", amount_min = 1, amount_max = 1, probability = 0.19 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 1},
  },
  icons = {
    { icon = "__space-exploration-graphics__/graphics/icons/data/junk.png", scale = 0.85, shift = {2, -4}, icon_size = 64 },
    { icon = data.raw.item[data_util.mod_prefix .. "space-supercomputer-2"].icon, scale = 0.5, shift = {-24, 24}, icon_size = 64 },
  },
  energy_required = 4,
  subgroup = "data-generic",
  category = "space-supercomputing-2",
  always_show_made_in = true,
})
  type = "recipe",
  name = data_util.mod_prefix .. "formatting-3",
  ingredients = {
    { name = data_util.mod_prefix .. "junk-data", amount = 1 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-supercooled", amount = 1},
  },
  results = {
    { name = data_util.mod_prefix .. "empty-data", amount_min = 1, amount_max = 1, probability = 0.9 },
    { name = data_util.mod_prefix .. "broken-data", amount_min = 1, amount_max = 1, probability = 0.09 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 1},
  },
  icons = {
    { icon = "__space-exploration-graphics__/graphics/icons/data/junk.png", scale = 0.85, shift = {2, -4}, icon_size = 64 },
    { icon = data.raw.item[data_util.mod_prefix .. "space-supercomputer-3"].icon, scale = 0.5, shift = {-24, 24}, icon_size = 64 },
  },
  energy_required = 10,
  subgroup = "data-generic",
  category = "space-supercomputing-3",
  always_show_made_in = true,
})
  type = "recipe",
  name = data_util.mod_prefix .. "formatting-4",
  ingredients = {
    { name = data_util.mod_prefix .. "junk-data", amount = 1 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-supercooled", amount = 1},
    { name = data_util.mod_prefix .. "cryonite-rod", amount = 1},
  },
  results = {
    { name = data_util.mod_prefix .. "empty-data", amount_min = 1, amount_max = 1, probability = 0.95 },
    { name = data_util.mod_prefix .. "broken-data", amount_min = 1, amount_max = 1, probability = 0.05 },
    { name = data_util.mod_prefix .. "cryonite-rod", amount_min = 1, amount_max = 1, probability = 0.9},
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 1},
  },
  icons = {
    { icon = "__space-exploration-graphics__/graphics/icons/data/junk.png", scale = 0.85, shift = {2, -4}, icon_size = 64 },
    { icon = data.raw.item[data_util.mod_prefix .. "space-supercomputer-4"].icon, scale = 0.5, shift = {-12, 12}, icon_size = 64 },
  },
  energy_required = 16,
  subgroup = "data-generic",
  category = "space-supercomputing-4",
  always_show_made_in = true,
})

  type = "recipe",
  name = data_util.mod_prefix .. "machine-learning-data",
  ingredients = {
    { name = data_util.mod_prefix .. "empty-data", amount = 1 },
    { name = "electronic-circuit", amount = 1 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-warm", amount = 5},
  },
  results = {
    { name = data_util.mod_prefix .. "machine-learning-data", amount = 1 },
    { name = data_util.mod_prefix .. "scrap", amount = 1 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 5},
  },
  main_product = data_util.mod_prefix .. "machine-learning-data",
  energy_required = 10,
  subgroup = "data-generic",
  category = "space-supercomputing-1",
  always_show_made_in = true,
})

-- simulation
  type = "recipe",
  name = data_util.mod_prefix .. "simulation-a",
  ingredients = {
    { name = data_util.mod_prefix .. "astronomic-insight", amount = 36 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-cold", amount = 10},
  },
  results = {
    { name = data_util.mod_prefix .. "significant-data", amount = 4 },
    { name = data_util.mod_prefix .. "empty-data", amount = 32 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 10},
  },
  icons = {
    { icon = "__space-exploration-graphics__/graphics/icons/data/significant.png", scale = 0.85, shift = {-2, 4}, icon_size = 64 },
    { icon = data.raw.item[data_util.mod_prefix .. "astronomic-insight"].icon, scale = 0.4/2, shift = {0, -12}, icon_size = 64 },
  },
  energy_required = 30,
  subgroup = "data-significant",
  allow_as_intermediate = false,
  category = "space-supercomputing-1",
  order = "sim1-a",
  always_show_made_in = true,
})
  type = "recipe",
  name = data_util.mod_prefix .. "simulation-s",
  ingredients = {
    { name = data_util.mod_prefix .. "energy-insight", amount = 36 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-cold", amount = 10},
  },
  results = {
    { name = data_util.mod_prefix .. "significant-data", amount = 4 },
    { name = data_util.mod_prefix .. "empty-data", amount = 32 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 10},
  },
  icons = {
    { icon = "__space-exploration-graphics__/graphics/icons/data/significant.png", scale = 0.85, shift = {-2, 4}, icon_size = 64 },
    { icon = data.raw.item[data_util.mod_prefix .. "energy-insight"].icon, scale = 0.4/2, shift = {0, -12}, icon_size = 64 },
  },
  energy_required = 30,
  subgroup = "data-significant",
  allow_as_intermediate = false,
  category = "space-supercomputing-1",
  order = "sim1-b",
  always_show_made_in = true,
})
  type = "recipe",
  name = data_util.mod_prefix .. "simulation-b",
  ingredients = {
    { name = data_util.mod_prefix .. "biological-insight", amount = 36 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-cold", amount = 10},
  },
  results = {
    { name = data_util.mod_prefix .. "significant-data", amount = 4 },
    { name = data_util.mod_prefix .. "empty-data", amount = 32 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 10},
  },
  icons = {
    { icon = "__space-exploration-graphics__/graphics/icons/data/significant.png", scale = 0.85, shift = {-2, 4}, icon_size = 64 },
    { icon = data.raw.item[data_util.mod_prefix .. "biological-insight"].icon, scale = 0.4/2, shift = {0, -12}, icon_size = 64 },
  },
  energy_required = 30,
  subgroup = "data-significant",
  allow_as_intermediate = false,
  category = "space-supercomputing-1",
  order = "sim1-c",
  always_show_made_in = true,
})
  type = "recipe",
  name = data_util.mod_prefix .. "simulation-m",
  ingredients = {
    { name = data_util.mod_prefix .. "material-insight", amount = 36 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-cold", amount = 10},
  },
  results = {
    { name = data_util.mod_prefix .. "significant-data", amount = 4 },
    { name = data_util.mod_prefix .. "empty-data", amount = 32 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 10},
  },
  icons = {
    { icon = "__space-exploration-graphics__/graphics/icons/data/significant.png", scale = 0.85, shift = {-2, 4}, icon_size = 64 },
    { icon = data.raw.item[data_util.mod_prefix .. "material-insight"].icon, scale = 0.4/2, shift = {0, -12}, icon_size = 64 },
  },
  energy_required = 30,
  subgroup = "data-significant",
  allow_as_intermediate = false,
  category = "space-supercomputing-1",
  order = "sim1-d",
  always_show_made_in = true,
})
  type = "recipe",
  name = data_util.mod_prefix .. "simulation-as",
  ingredients = {
    { name = data_util.mod_prefix .. "astronomic-insight", amount = 18 },
    { name = data_util.mod_prefix .. "energy-insight", amount = 18 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-supercooled", amount = 10},
  },
  results = {
    { name = data_util.mod_prefix .. "significant-data", amount = 6 },
    { name = data_util.mod_prefix .. "empty-data", amount = 30 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 10},
  },
  icons = {
    { icon = "__space-exploration-graphics__/graphics/icons/data/significant.png", scale = 0.85, shift = {-2, 4}, icon_size = 64 },
    { icon = data.raw.item[data_util.mod_prefix .. "astronomic-insight"].icon, scale = 0.4/2, shift = {-10, -12}, icon_size = 64 },
    { icon = data.raw.item[data_util.mod_prefix .. "energy-insight"].icon, scale = 0.4/2, shift = {10, -12}, icon_size = 64 },
  },
  energy_required = 60,
  subgroup = "data-significant",
  allow_as_intermediate = false,
  category = "space-supercomputing-1",
  order = "sim2-a",
  always_show_made_in = true,
})
  type = "recipe",
  name = data_util.mod_prefix .. "simulation-ab",
  ingredients = {
    { name = data_util.mod_prefix .. "astronomic-insight", amount = 18 },
    { name = data_util.mod_prefix .. "biological-insight", amount = 18 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-supercooled", amount = 10},
  },
  results = {
    { name = data_util.mod_prefix .. "significant-data", amount = 6 },
    { name = data_util.mod_prefix .. "empty-data", amount = 30 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 10},
  },
  icons = {
    { icon = "__space-exploration-graphics__/graphics/icons/data/significant.png", scale = 0.85, shift = {-2, 4}, icon_size = 64 },
    { icon = data.raw.item[data_util.mod_prefix .. "astronomic-insight"].icon, scale = 0.4/2, shift = {-10, -12}, icon_size = 64 },
    { icon = data.raw.item[data_util.mod_prefix .. "biological-insight"].icon, scale = 0.4/2, shift = {10, -12}, icon_size = 64 },
  },
  energy_required = 60,
  subgroup = "data-significant",
  allow_as_intermediate = false,
  category = "space-supercomputing-1",
  order = "sim2-b",
  always_show_made_in = true,
})
  type = "recipe",
  name = data_util.mod_prefix .. "simulation-am",
  ingredients = {
    { name = data_util.mod_prefix .. "astronomic-insight", amount = 18 },
    { name = data_util.mod_prefix .. "material-insight", amount = 18 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-supercooled", amount = 10},
  },
  results = {
    { name = data_util.mod_prefix .. "significant-data", amount = 6 },
    { name = data_util.mod_prefix .. "empty-data", amount = 30 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 10},
  },
  icons = {
    { icon = "__space-exploration-graphics__/graphics/icons/data/significant.png", scale = 0.85, shift = {-2, 4}, icon_size = 64 },
    { icon = data.raw.item[data_util.mod_prefix .. "astronomic-insight"].icon, scale = 0.4/2, shift = {-10, -12}, icon_size = 64 },
    { icon = data.raw.item[data_util.mod_prefix .. "material-insight"].icon, scale = 0.4/2, shift = {10, -12}, icon_size = 64 },
  },
  energy_required = 60,
  subgroup = "data-significant",
  allow_as_intermediate = false,
  category = "space-supercomputing-1",
  order = "sim2-c",
  always_show_made_in = true,
})
  type = "recipe",
  name = data_util.mod_prefix .. "simulation-sb",
  ingredients = {
    { name = data_util.mod_prefix .. "energy-insight", amount = 18 },
    { name = data_util.mod_prefix .. "biological-insight", amount = 18 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-supercooled", amount = 10},
  },
  results = {
    { name = data_util.mod_prefix .. "significant-data", amount = 6 },
    { name = data_util.mod_prefix .. "empty-data", amount = 30 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 10},
  },
  icons = {
    { icon = "__space-exploration-graphics__/graphics/icons/data/significant.png", scale = 0.85, shift = {-2, 4}, icon_size = 64 },
    { icon = data.raw.item[data_util.mod_prefix .. "energy-insight"].icon, scale = 0.4/2, shift = {-10, -12}, icon_size = 64 },
    { icon = data.raw.item[data_util.mod_prefix .. "biological-insight"].icon, scale = 0.4/2, shift = {10, -12}, icon_size = 64 },
  },
  energy_required = 60,
  subgroup = "data-significant",
  allow_as_intermediate = false,
  category = "space-supercomputing-1",
  order = "sim2-d",
  always_show_made_in = true,
})
  type = "recipe",
  name = data_util.mod_prefix .. "simulation-sm",
  ingredients = {
    { name = data_util.mod_prefix .. "energy-insight", amount = 18 },
    { name = data_util.mod_prefix .. "material-insight", amount = 18 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-supercooled", amount = 10},
  },
  results = {
    { name = data_util.mod_prefix .. "significant-data", amount = 6 },
    { name = data_util.mod_prefix .. "empty-data", amount = 30 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 10},
  },
  icons = {
    { icon = "__space-exploration-graphics__/graphics/icons/data/significant.png", scale = 0.85, shift = {-2, 4}, icon_size = 64 },
    { icon = data.raw.item[data_util.mod_prefix .. "energy-insight"].icon, scale = 0.4/2, shift = {-10, -12}, icon_size = 64 },
    { icon = data.raw.item[data_util.mod_prefix .. "material-insight"].icon, scale = 0.4/2, shift = {10, -12}, icon_size = 64 },
  },
  energy_required = 60,
  subgroup = "data-significant",
  allow_as_intermediate = false,
  category = "space-supercomputing-1",
  order = "sim2-e",
  always_show_made_in = true,
})
  type = "recipe",
  name = data_util.mod_prefix .. "simulation-bm",
  ingredients = {
    { name = data_util.mod_prefix .. "biological-insight", amount = 18 },
    { name = data_util.mod_prefix .. "material-insight", amount = 18 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-supercooled", amount = 10},
  },
  results = {
    { name = data_util.mod_prefix .. "significant-data", amount = 6 },
    { name = data_util.mod_prefix .. "empty-data", amount = 30 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 10},
  },
  icons = {
    { icon = "__space-exploration-graphics__/graphics/icons/data/significant.png", scale = 0.85, shift = {-2, 4}, icon_size = 64 },
    { icon = data.raw.item[data_util.mod_prefix .. "biological-insight"].icon, scale = 0.4/2, shift = {-10, -12}, icon_size = 64 },
    { icon = data.raw.item[data_util.mod_prefix .. "material-insight"].icon, scale = 0.4/2, shift = {10, -12}, icon_size = 64 },
  },
  energy_required = 60,
  subgroup = "data-significant",
  allow_as_intermediate = false,
  category = "space-supercomputing-1",
  order = "sim2-f",
  always_show_made_in = true,
})
  type = "recipe",
  name = data_util.mod_prefix .. "simulation-asb",
  ingredients = {
    { name = data_util.mod_prefix .. "astronomic-insight", amount = 12 },
    { name = data_util.mod_prefix .. "energy-insight", amount = 12 },
    { name = data_util.mod_prefix .. "biological-insight", amount = 12 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-supercooled", amount = 10},
  },
  results = {
    { name = data_util.mod_prefix .. "significant-data", amount = 8 },
    { name = data_util.mod_prefix .. "empty-data", amount = 28 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 10},
  },
  icons = {
    { icon = "__space-exploration-graphics__/graphics/icons/data/significant.png", scale = 0.85, shift = {-2, 4}, icon_size = 64 },
    { icon = data.raw.item[data_util.mod_prefix .. "astronomic-insight"].icon, scale = 0.4/2, shift = {-10, -12}, icon_size = 64 },
    { icon = data.raw.item[data_util.mod_prefix .. "energy-insight"].icon, scale = 0.4/2, shift = {0, -12}, icon_size = 64 },
    { icon = data.raw.item[data_util.mod_prefix .. "biological-insight"].icon, scale = 0.4/2, shift = {10, -12}, icon_size = 64 },
  },
  energy_required = 120,
  subgroup = "data-significant",
  allow_as_intermediate = false,
  category = "space-supercomputing-1",
  order = "sim3-a",
  always_show_made_in = true,
})
  type = "recipe",
  name = data_util.mod_prefix .. "simulation-asm",
  ingredients = {
    { name = data_util.mod_prefix .. "astronomic-insight", amount = 12 },
    { name = data_util.mod_prefix .. "energy-insight", amount = 12 },
    { name = data_util.mod_prefix .. "material-insight", amount = 12 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-supercooled", amount = 10},
  },
  results = {
    { name = data_util.mod_prefix .. "significant-data", amount = 8 },
    { name = data_util.mod_prefix .. "empty-data", amount = 28 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 10},
  },
  icons = {
    { icon = "__space-exploration-graphics__/graphics/icons/data/significant.png", scale = 0.85, shift = {-2, 4}, icon_size = 64 },
    { icon = data.raw.item[data_util.mod_prefix .. "astronomic-insight"].icon, scale = 0.4/2, shift = {-10, -12}, icon_size = 64 },
    { icon = data.raw.item[data_util.mod_prefix .. "energy-insight"].icon, scale = 0.4/2, shift = {0, -12}, icon_size = 64 },
    { icon = data.raw.item[data_util.mod_prefix .. "material-insight"].icon, scale = 0.4/2, shift = {10, -12}, icon_size = 64 },
  },
  energy_required = 120,
  subgroup = "data-significant",
  allow_as_intermediate = false,
  category = "space-supercomputing-1",
  order = "sim3-b",
  always_show_made_in = true,
})
  type = "recipe",
  name = data_util.mod_prefix .. "simulation-abm",
  ingredients = {
    { name = data_util.mod_prefix .. "astronomic-insight", amount = 12 },
    { name = data_util.mod_prefix .. "biological-insight", amount = 12 },
    { name = data_util.mod_prefix .. "material-insight", amount = 12 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-supercooled", amount = 10},
  },
  results = {
    { name = data_util.mod_prefix .. "significant-data", amount = 8 },
    { name = data_util.mod_prefix .. "empty-data", amount = 28 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 10},
  },
  icons = {
    { icon = "__space-exploration-graphics__/graphics/icons/data/significant.png", scale = 0.85, shift = {-2, 4}, icon_size = 64 },
    { icon = data.raw.item[data_util.mod_prefix .. "astronomic-insight"].icon, scale = 0.4/2, shift = {-10, -12}, icon_size = 64 },
    { icon = data.raw.item[data_util.mod_prefix .. "biological-insight"].icon, scale = 0.4/2, shift = {0, -12}, icon_size = 64 },
    { icon = data.raw.item[data_util.mod_prefix .. "material-insight"].icon, scale = 0.4/2, shift = {10, -12}, icon_size = 64 },
  },
  energy_required = 120,
  subgroup = "data-significant",
  allow_as_intermediate = false,
  category = "space-supercomputing-1",
  order = "sim3-c",
  always_show_made_in = true,
})
  type = "recipe",
  name = data_util.mod_prefix .. "simulation-sbm",
  ingredients = {
    { name = data_util.mod_prefix .. "energy-insight", amount = 12 },
    { name = data_util.mod_prefix .. "biological-insight", amount = 12 },
    { name = data_util.mod_prefix .. "material-insight", amount = 12 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-supercooled", amount = 10},
  },
  results = {
    { name = data_util.mod_prefix .. "significant-data", amount = 8 },
    { name = data_util.mod_prefix .. "empty-data", amount = 28 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 10},
  },
  icons = {
    { icon = "__space-exploration-graphics__/graphics/icons/data/significant.png", scale = 0.85, shift = {-2, 4}, icon_size = 64 },
    { icon = data.raw.item[data_util.mod_prefix .. "energy-insight"].icon, scale = 0.4/2, shift = {-10, -12}, icon_size = 64 },
    { icon = data.raw.item[data_util.mod_prefix .. "biological-insight"].icon, scale = 0.4/2, shift = {0, -12}, icon_size = 64 },
    { icon = data.raw.item[data_util.mod_prefix .. "material-insight"].icon, scale = 0.4/2, shift = {10, -12}, icon_size = 64 },
  },
  energy_required = 120,
  subgroup = "data-significant",
  allow_as_intermediate = false,
  category = "space-supercomputing-1",
  order = "sim3-d",
  always_show_made_in = true,
})
  type = "recipe",
  name = data_util.mod_prefix .. "simulation-asbm",
  ingredients = {
    { name = data_util.mod_prefix .. "astronomic-insight", amount = 9 },
    { name = data_util.mod_prefix .. "energy-insight", amount = 9 },
    { name = data_util.mod_prefix .. "biological-insight", amount = 9 },
    { name = data_util.mod_prefix .. "material-insight", amount = 9 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-supercooled", amount = 10},
  },
  results = {
    { name = data_util.mod_prefix .. "significant-data", amount = 10 },
    { name = data_util.mod_prefix .. "empty-data", amount = 26 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 10},
  },
  icons = {
    { icon = "__space-exploration-graphics__/graphics/icons/data/significant.png", scale = 0.85, shift = {-2, 4}, icon_size = 64 },
    { icon = data.raw.item[data_util.mod_prefix .. "astronomic-insight"].icon, scale = 0.4/2, shift = {-15, -12}, icon_size = 64 },
    { icon = data.raw.item[data_util.mod_prefix .. "energy-insight"].icon, scale = 0.4/2, shift = {-5, -12}, icon_size = 64 },
    { icon = data.raw.item[data_util.mod_prefix .. "biological-insight"].icon, scale = 0.4/2, shift = {5, -12}, icon_size = 64 },
    { icon = data.raw.item[data_util.mod_prefix .. "material-insight"].icon, scale = 0.4/2, shift = {15, -12}, icon_size = 64 },
  },
  energy_required = 240,
  subgroup = "data-significant",
  allow_as_intermediate = false,
  category = "space-supercomputing-2",
  order = "sim4-a",
  always_show_made_in = true,
})

  type = "recipe",
  name = data_util.mod_prefix .. "astronomic-insight-1",
  ingredients = {
    { name = data_util.mod_prefix .. "astronomic-catalogue-1", amount = 1 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-cold", amount = 10},
  },
  results = {
    { name = data_util.mod_prefix .. "astronomic-insight", amount = 2 },
    { name = data_util.mod_prefix .. "empty-data", amount = 2 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 10},
  },
  icons = {
    { icon = data.raw.item[data_util.mod_prefix .. "astronomic-catalogue-1"].icon, scale = 1, shift = {8, 0}, icon_size = 64 },
    { icon = "__space-exploration-graphics__/graphics/icons/catalogue/astronomic-insight.png", scale = 0.7, shift = {-16, 8}, icon_size = 64 },
    { icon = "__space-exploration-graphics__/graphics/icons/number/1.png", scale = 1, shift = {-20, -20}, icon_size = 20 },
  },
  energy_required = 10,
  subgroup = "data-catalogue-astronomic",
  allow_as_intermediate = false,
  category = "space-supercomputing-1",
  always_show_made_in = true,
})
  type = "recipe",
  name = data_util.mod_prefix .. "energy-insight-1",
  ingredients = {
    { name = data_util.mod_prefix .. "energy-catalogue-1", amount = 1 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-cold", amount = 10},
  },
  results = {
    { name = data_util.mod_prefix .. "energy-insight", amount = 2 },
    { name = data_util.mod_prefix .. "empty-data", amount = 2 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 10},
  },
  icons = {
    { icon = data.raw.item[data_util.mod_prefix .. "energy-catalogue-1"].icon, scale = 1, shift = {8, 0}, icon_size = 64 },
    { icon = "__space-exploration-graphics__/graphics/icons/catalogue/energy-insight.png", scale = 0.7, shift = {-16, 8}, icon_size = 64 },
    { icon = "__space-exploration-graphics__/graphics/icons/number/1.png", scale = 1, shift = {-20, -20}, icon_size = 20 },
  },
  energy_required = 10,
  subgroup = "data-catalogue-energy",
  allow_as_intermediate = false,
  category = "space-supercomputing-1",
  always_show_made_in = true,
})
  type = "recipe",
  name = data_util.mod_prefix .. "biological-insight-1",
  ingredients = {
    { name = data_util.mod_prefix .. "biological-catalogue-1", amount = 1 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-cold", amount = 10},
  },
  results = {
    { name = data_util.mod_prefix .. "biological-insight", amount = 2 },
    { name = data_util.mod_prefix .. "empty-data", amount = 2 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 10},
  },
  icons = {
    { icon = data.raw.item[data_util.mod_prefix .. "biological-catalogue-1"].icon, scale = 1, shift = {8, 0}, icon_size = 64 },
    { icon = "__space-exploration-graphics__/graphics/icons/catalogue/biological-insight.png", scale = 0.7, shift = {-16, 8}, icon_size = 64 },
    { icon = "__space-exploration-graphics__/graphics/icons/number/1.png", scale = 1, shift = {-20, -20}, icon_size = 20 },
  },
  energy_required = 10,
  subgroup = "data-catalogue-biological",
  allow_as_intermediate = false,
  category = "space-supercomputing-1",
  always_show_made_in = true,
})
  type = "recipe",
  name = data_util.mod_prefix .. "material-insight-1",
  ingredients = {
    { name = data_util.mod_prefix .. "material-catalogue-1", amount = 1 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-cold", amount = 10},
  },
  results = {
    { name = data_util.mod_prefix .. "material-insight", amount = 2 },
    { name = data_util.mod_prefix .. "empty-data", amount = 2 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 10},
  },
  icons = {
    { icon = data.raw.item[data_util.mod_prefix .. "material-catalogue-1"].icon, scale = 1, shift = {8, 0}, icon_size = 64 },
    { icon = "__space-exploration-graphics__/graphics/icons/catalogue/material-insight.png", scale = 0.7, shift = {-16, 8}, icon_size = 64 },
    { icon = "__space-exploration-graphics__/graphics/icons/number/1.png", scale = 1, shift = {-20, -20}, icon_size = 20 },
  },
  energy_required = 10,
  subgroup = "data-catalogue-material",
  allow_as_intermediate = false,
  category = "space-supercomputing-1",
  always_show_made_in = true,
})
  type = "recipe",
  name = data_util.mod_prefix .. "astronomic-insight-2",
  ingredients = {
    { name = data_util.mod_prefix .. "astronomic-catalogue-1", amount = 1 },
    { name = data_util.mod_prefix .. "astronomic-catalogue-2", amount = 1 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-supercooled", amount = 10},
  },
  results = {
    { name = data_util.mod_prefix .. "astronomic-insight", amount = 6 },
    { name = data_util.mod_prefix .. "empty-data", amount = 2 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 10},
  },
  icons = {
    { icon = data.raw.item[data_util.mod_prefix .. "astronomic-catalogue-2"].icon, scale = 1, shift = {8, 0}, icon_size = 64 },
    { icon = "__space-exploration-graphics__/graphics/icons/catalogue/astronomic-insight.png", scale = 0.7, shift = {-16, 8}, icon_size = 64 },
    { icon = "__space-exploration-graphics__/graphics/icons/number/2.png", scale = 1, shift = {-20, -20}, icon_size = 20 },
  },
  energy_required = 20,
  subgroup = "data-catalogue-astronomic",
  allow_as_intermediate = false,
  category = "space-supercomputing-1",
  always_show_made_in = true,
})
  type = "recipe",
  name = data_util.mod_prefix .. "energy-insight-2",
  ingredients = {
    { name = data_util.mod_prefix .. "energy-catalogue-1", amount = 1 },
    { name = data_util.mod_prefix .. "energy-catalogue-2", amount = 1 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-supercooled", amount = 10},
  },
  results = {
    { name = data_util.mod_prefix .. "energy-insight", amount = 6 },
    { name = data_util.mod_prefix .. "empty-data", amount = 2 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 10},
  },
  icons = {
    { icon = data.raw.item[data_util.mod_prefix .. "energy-catalogue-2"].icon, scale = 1, shift = {8, 0}, icon_size = 64 },
    { icon = "__space-exploration-graphics__/graphics/icons/catalogue/energy-insight.png", scale = 0.7, shift = {-16, 8}, icon_size = 64 },
    { icon = "__space-exploration-graphics__/graphics/icons/number/2.png", scale = 1, shift = {-20, -20}, icon_size = 20 },
  },
  energy_required = 20,
  subgroup = "data-catalogue-energy",
  allow_as_intermediate = false,
  category = "space-supercomputing-1",
  always_show_made_in = true,
})
  type = "recipe",
  name = data_util.mod_prefix .. "biological-insight-2",
  ingredients = {
    { name = data_util.mod_prefix .. "biological-catalogue-1", amount = 1 },
    { name = data_util.mod_prefix .. "biological-catalogue-2", amount = 1 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-supercooled", amount = 10},
  },
  results = {
    { name = data_util.mod_prefix .. "biological-insight", amount = 6 },
    { name = data_util.mod_prefix .. "empty-data", amount = 2 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 10},
  },
  icons = {
    { icon = data.raw.item[data_util.mod_prefix .. "biological-catalogue-2"].icon, scale = 1, shift = {8, 0}, icon_size = 64 },
    { icon = "__space-exploration-graphics__/graphics/icons/catalogue/biological-insight.png", scale = 0.7, shift = {-16, 8}, icon_size = 64 },
    { icon = "__space-exploration-graphics__/graphics/icons/number/2.png", scale = 1, shift = {-20, -20}, icon_size = 20 },
  },
  energy_required = 20,
  subgroup = "data-catalogue-biological",
  allow_as_intermediate = false,
  category = "space-supercomputing-1",
  always_show_made_in = true,
})
  type = "recipe",
  name = data_util.mod_prefix .. "material-insight-2",
  ingredients = {
    { name = data_util.mod_prefix .. "material-catalogue-1", amount = 1 },
    { name = data_util.mod_prefix .. "material-catalogue-2", amount = 1 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-supercooled", amount = 10},
  },
  results = {
    { name = data_util.mod_prefix .. "material-insight", amount = 6 },
    { name = data_util.mod_prefix .. "empty-data", amount = 2 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 10},
  },
  icons = {
    { icon = data.raw.item[data_util.mod_prefix .. "material-catalogue-2"].icon, scale = 1, shift = {8, 0}, icon_size = 64 },
    { icon = "__space-exploration-graphics__/graphics/icons/catalogue/material-insight.png", scale = 0.7, shift = {-16, 8}, icon_size = 64 },
    { icon = "__space-exploration-graphics__/graphics/icons/number/2.png", scale = 1, shift = {-20, -20}, icon_size = 20 },
  },
  energy_required = 20,
  subgroup = "data-catalogue-material",
  allow_as_intermediate = false,
  category = "space-supercomputing-1",
  always_show_made_in = true,
})
  type = "recipe",
  name = data_util.mod_prefix .. "astronomic-insight-3",
  ingredients = {
    { name = data_util.mod_prefix .. "astronomic-catalogue-1", amount = 1 },
    { name = data_util.mod_prefix .. "astronomic-catalogue-2", amount = 1 },
    { name = data_util.mod_prefix .. "astronomic-catalogue-3", amount = 1 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-supercooled", amount = 10},
  },
  results = {
    { name = data_util.mod_prefix .. "astronomic-insight", amount = 12 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 10},
  },
  icons = {
    { icon = data.raw.item[data_util.mod_prefix .. "astronomic-catalogue-3"].icon, scale = 1, shift = {8, 0}, icon_size = 64 },
    { icon = "__space-exploration-graphics__/graphics/icons/catalogue/astronomic-insight.png", scale = 0.7, shift = {-16, 8}, icon_size = 64 },
    { icon = "__space-exploration-graphics__/graphics/icons/number/3.png", scale = 1, shift = {-20, -20}, icon_size = 20 },
  },
  energy_required = 30,
  subgroup = "data-catalogue-astronomic",
  allow_as_intermediate = false,
  category = "space-supercomputing-1",
  always_show_made_in = true,
})
  type = "recipe",
  name = data_util.mod_prefix .. "energy-insight-3",
  ingredients = {
    { name = data_util.mod_prefix .. "energy-catalogue-1", amount = 1 },
    { name = data_util.mod_prefix .. "energy-catalogue-2", amount = 1 },
    { name = data_util.mod_prefix .. "energy-catalogue-3", amount = 1 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-supercooled", amount = 10},
  },
  results = {
    { name = data_util.mod_prefix .. "energy-insight", amount = 12 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 10},
  },
  icons = {
    { icon = data.raw.item[data_util.mod_prefix .. "energy-catalogue-3"].icon, scale = 1, shift = {8, 0}, icon_size = 64 },
    { icon = "__space-exploration-graphics__/graphics/icons/catalogue/energy-insight.png", scale = 0.7, shift = {-16, 8}, icon_size = 64 },
    { icon = "__space-exploration-graphics__/graphics/icons/number/3.png", scale = 1, shift = {-20, -20}, icon_size = 20 },
  },
  energy_required = 30,
  subgroup = "data-catalogue-energy",
  allow_as_intermediate = false,
  category = "space-supercomputing-1",
  always_show_made_in = true,
})
  type = "recipe",
  name = data_util.mod_prefix .. "biological-insight-3",
  ingredients = {
    { name = data_util.mod_prefix .. "biological-catalogue-1", amount = 1 },
    { name = data_util.mod_prefix .. "biological-catalogue-2", amount = 1 },
    { name = data_util.mod_prefix .. "biological-catalogue-3", amount = 1 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-supercooled", amount = 10},
  },
  results = {
    { name = data_util.mod_prefix .. "biological-insight", amount = 12 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 10},
  },
  icons = {
    { icon = data.raw.item[data_util.mod_prefix .. "biological-catalogue-3"].icon, scale = 1, shift = {8, 0}, icon_size = 64 },
    { icon = "__space-exploration-graphics__/graphics/icons/catalogue/biological-insight.png", scale = 0.7, shift = {-16, 8}, icon_size = 64 },
    { icon = "__space-exploration-graphics__/graphics/icons/number/3.png", scale = 1, shift = {-20, -20}, icon_size = 20 },
  },
  energy_required = 30,
  subgroup = "data-catalogue-biological",
  allow_as_intermediate = false,
  category = "space-supercomputing-1",
  always_show_made_in = true,
})
  type = "recipe",
  name = data_util.mod_prefix .. "material-insight-3",
  ingredients = {
    { name = data_util.mod_prefix .. "material-catalogue-1", amount = 1 },
    { name = data_util.mod_prefix .. "material-catalogue-2", amount = 1 },
    { name = data_util.mod_prefix .. "material-catalogue-3", amount = 1 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-supercooled", amount = 10},
  },
  results = {
    { name = data_util.mod_prefix .. "material-insight", amount = 12 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 10},
  },
  icons = {
    { icon = data.raw.item[data_util.mod_prefix .. "material-catalogue-3"].icon, scale = 1, shift = {8, 0}, icon_size = 64 },
    { icon = "__space-exploration-graphics__/graphics/icons/catalogue/material-insight.png", scale = 0.7, shift = {-16, 8}, icon_size = 64 },
    { icon = "__space-exploration-graphics__/graphics/icons/number/3.png", scale = 1, shift = {-20, -20}, icon_size = 20 },
  },
  energy_required = 30,
  subgroup = "data-catalogue-material",
  allow_as_intermediate = false,
  category = "space-supercomputing-1",
  always_show_made_in = true,
})
  type = "recipe",
  name = data_util.mod_prefix .. "astronomic-insight-4",
  ingredients = {
    { name = data_util.mod_prefix .. "astronomic-catalogue-1", amount = 1 },
    { name = data_util.mod_prefix .. "astronomic-catalogue-2", amount = 1 },
    { name = data_util.mod_prefix .. "astronomic-catalogue-3", amount = 1 },
    { name = data_util.mod_prefix .. "astronomic-catalogue-4", amount = 1 },
    { name = data_util.mod_prefix .. "empty-data", amount = 6 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-supercooled", amount = 10},
  },
  results = {
    { name = data_util.mod_prefix .. "astronomic-insight", amount = 22 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 10},
  },
  icons = {
    { icon = data.raw.item[data_util.mod_prefix .. "astronomic-catalogue-4"].icon, scale = 1, shift = {8, 0}, icon_size = 64 },
    { icon = "__space-exploration-graphics__/graphics/icons/catalogue/astronomic-insight.png", scale = 0.7, shift = {-16, 8}, icon_size = 64 },
    { icon = "__space-exploration-graphics__/graphics/icons/number/4.png", scale = 1, shift = {-20, -20}, icon_size = 20 },
  },
  energy_required = 40,
  subgroup = "data-catalogue-astronomic",
  allow_as_intermediate = false,
  category = "space-supercomputing-2",
  always_show_made_in = true,
})
  type = "recipe",
  name = data_util.mod_prefix .. "energy-insight-4",
  ingredients = {
    { name = data_util.mod_prefix .. "energy-catalogue-1", amount = 1 },
    { name = data_util.mod_prefix .. "energy-catalogue-2", amount = 1 },
    { name = data_util.mod_prefix .. "energy-catalogue-3", amount = 1 },
    { name = data_util.mod_prefix .. "energy-catalogue-4", amount = 1 },
    { name = data_util.mod_prefix .. "empty-data", amount = 6 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-supercooled", amount = 10},
  },
  results = {
    { name = data_util.mod_prefix .. "energy-insight", amount = 22 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 10},
  },
  icons = {
    { icon = data.raw.item[data_util.mod_prefix .. "energy-catalogue-4"].icon, scale = 1, shift = {8, 0}, icon_size = 64 },
    { icon = "__space-exploration-graphics__/graphics/icons/catalogue/energy-insight.png", scale = 0.7, shift = {-16, 8}, icon_size = 64 },
    { icon = "__space-exploration-graphics__/graphics/icons/number/4.png", scale = 1, shift = {-20, -20}, icon_size = 20 },
  },
  energy_required = 40,
  subgroup = "data-catalogue-energy",
  allow_as_intermediate = false,
  category = "space-supercomputing-2",
  always_show_made_in = true,
})
  type = "recipe",
  name = data_util.mod_prefix .. "biological-insight-4",
  ingredients = {
    { name = data_util.mod_prefix .. "biological-catalogue-1", amount = 1 },
    { name = data_util.mod_prefix .. "biological-catalogue-2", amount = 1 },
    { name = data_util.mod_prefix .. "biological-catalogue-3", amount = 1 },
    { name = data_util.mod_prefix .. "biological-catalogue-4", amount = 1 },
    { name = data_util.mod_prefix .. "empty-data", amount = 6 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-supercooled", amount = 10},
  },
  results = {
    { name = data_util.mod_prefix .. "biological-insight", amount = 22 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 10},
  },
  icons = {
    { icon =  data.raw.item[data_util.mod_prefix .. "biological-catalogue-4"].icon,scale = 1, icon_size = 64 },
    { icon = "__space-exploration-graphics__/graphics/icons/catalogue/biological-insight.png", scale = 0.7, shift = {-16, 8}, icon_size = 64 },
    { icon = "__space-exploration-graphics__/graphics/icons/number/4.png", scale = 1, shift = {-20, -20}, icon_size = 20 },
  },
  energy_required = 40,
  subgroup = "data-catalogue-biological",
  allow_as_intermediate = false,
  category = "space-supercomputing-2",
  always_show_made_in = true,
})
  type = "recipe",
  name = data_util.mod_prefix .. "material-insight-4",
  ingredients = {
    { name = data_util.mod_prefix .. "material-catalogue-1", amount = 1 },
    { name = data_util.mod_prefix .. "material-catalogue-2", amount = 1 },
    { name = data_util.mod_prefix .. "material-catalogue-3", amount = 1 },
    { name = data_util.mod_prefix .. "material-catalogue-4", amount = 1 },
    { name = data_util.mod_prefix .. "empty-data", amount = 6 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-supercooled", amount = 10},
  },
  results = {
    { name = data_util.mod_prefix .. "material-insight", amount = 22 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 10},
  },
  icons = {
    { icon = data.raw.item[data_util.mod_prefix .. "material-catalogue-4"].icon, scale = 1, shift = {8, 0}, icon_size = 64 },
    { icon = "__space-exploration-graphics__/graphics/icons/catalogue/material-insight.png", scale = 0.7, shift = {-16, 8}, icon_size = 64 },
    { icon = "__space-exploration-graphics__/graphics/icons/number/4.png", scale = 1, shift = {-20, -20}, icon_size = 20 },
  },
  energy_required = 40,
  subgroup = "data-catalogue-material",
  allow_as_intermediate = false,
  category = "space-supercomputing-2",
  always_show_made_in = true,
})


  type = "recipe",
  name = data_util.mod_prefix .. "astronomic-catalogue-1",
  ingredients = {
    { name = data_util.mod_prefix .. "astrometric-data", amount = 1 },
    { name = data_util.mod_prefix .. "visible-observation-data", amount = 1 },
    { name = data_util.mod_prefix .. "infrared-observation-data", amount = 1 },
    { name = data_util.mod_prefix .. "uv-observation-data", amount = 1 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-cold", amount = 10},
  },
  results = {
    { name = data_util.mod_prefix .. "astronomic-catalogue-1", amount = 1 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 10},
  },
  energy_required = 10,
  main_product = data_util.mod_prefix .. "astronomic-catalogue-1",
  subgroup = "data-catalogue-astronomic",
  icon = "__space-exploration-graphics__/graphics/icons/catalogue/astronomic-catalogue-1.png",
  icon_size = 64,
  category = "space-supercomputing-1",
  always_show_made_in = true,
})
  type = "recipe",
  name = data_util.mod_prefix .. "astronomic-catalogue-2",
  ingredients = {
    { name = data_util.mod_prefix .. "microwave-observation-data", amount = 1 },
    { name = data_util.mod_prefix .. "xray-observation-data", amount = 1 },
    { name = data_util.mod_prefix .. "gravitational-lensing-data", amount = 1 },
    { name = data_util.mod_prefix .. "gravity-wave-data", amount = 1 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-cold", amount = 10},
  },
  results = {
    { name = data_util.mod_prefix .. "astronomic-catalogue-2", amount = 1 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 10},
  },
  energy_required = 20,
  main_product = data_util.mod_prefix .. "astronomic-catalogue-2",
  subgroup = "data-catalogue-astronomic",
  icon = "__space-exploration-graphics__/graphics/icons/catalogue/astronomic-catalogue-2.png",
  icon_size = 64,
  category = "space-supercomputing-1",
  always_show_made_in = true,
})
  type = "recipe",
  name = data_util.mod_prefix .. "astronomic-catalogue-3",
  ingredients = {
    { name = data_util.mod_prefix .. "radio-observation-data", amount = 1 },
    { name = data_util.mod_prefix .. "gammaray-observation-data", amount = 1 },
    { name = data_util.mod_prefix .. "darkmatter-data", amount = 1 },
    { name = data_util.mod_prefix .. "negative-pressure-data", amount = 1 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-supercooled", amount = 10},
  },
  results = {
    { name = data_util.mod_prefix .. "astronomic-catalogue-3", amount = 1 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 10},
  },
  energy_required = 30,
  main_product = data_util.mod_prefix .. "astronomic-catalogue-3",
  subgroup = "data-catalogue-astronomic",
  icon = "__space-exploration-graphics__/graphics/icons/catalogue/astronomic-catalogue-3.png",
  icon_size = 64,
  category = "space-supercomputing-1",
  always_show_made_in = true,
})
  type = "recipe",
  name = data_util.mod_prefix .. "astronomic-catalogue-4",
  ingredients = {
    { name = data_util.mod_prefix .. "dark-energy-data", amount = 1 },
    { name = data_util.mod_prefix .. "micro-black-hole-data", amount = 1 },
    { name = data_util.mod_prefix .. "zero-point-energy-data", amount = 1 },
    { name = data_util.mod_prefix .. "belt-probe-data", amount = 1 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-supercooled", amount = 10},
  },
  results = {
    { name = data_util.mod_prefix .. "astronomic-catalogue-4", amount = 1 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 10},
  },
  energy_required = 40,
  main_product = data_util.mod_prefix .. "astronomic-catalogue-4",
  subgroup = "data-catalogue-astronomic",
  icon = "__space-exploration-graphics__/graphics/icons/catalogue/astronomic-catalogue-4.png",
  icon_size = 64,
  category = "space-supercomputing-1",
  always_show_made_in = true,
})

  type = "recipe",
  name = data_util.mod_prefix .. "energy-catalogue-1",
  ingredients = {
    { name = data_util.mod_prefix .. "polarisation-data", amount = 1 },
    { name = data_util.mod_prefix .. "conductivity-data", amount = 1 },
    { name = data_util.mod_prefix .. "radiation-data", amount = 1 },
    { name = data_util.mod_prefix .. "electromagnetic-field-data", amount = 1 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-cold", amount = 10},
  },
  results = {
    { name = data_util.mod_prefix .. "energy-catalogue-1", amount = 1 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 10},
  },
  energy_required = 10,
  main_product = data_util.mod_prefix .. "energy-catalogue-1",
  subgroup = "data-catalogue-energy",
  icon = "__space-exploration-graphics__/graphics/icons/catalogue/energy-catalogue-1.png",
  icon_size = 64,
  category = "space-supercomputing-1",
  always_show_made_in = true,
})
  type = "recipe",
  name = data_util.mod_prefix .. "energy-catalogue-2",
  ingredients = {
    { name = data_util.mod_prefix .. "atomic-data", amount = 1 },
    { name = data_util.mod_prefix .. "subatomic-data", amount = 1 },
    { name = data_util.mod_prefix .. "quantum-phenomenon-data", amount = 1 },
    { name = data_util.mod_prefix .. "forcefield-data", amount = 1 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-cold", amount = 10},
  },
  results = {
    { name = data_util.mod_prefix .. "energy-catalogue-2", amount = 1 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 10},
  },
  energy_required = 20,
  main_product = data_util.mod_prefix .. "energy-catalogue-2",
  subgroup = "data-catalogue-energy",
  icon = "__space-exploration-graphics__/graphics/icons/catalogue/energy-catalogue-2.png",
  icon_size = 64,
  category = "space-supercomputing-1",
  always_show_made_in = true,
})
  type = "recipe",
  name = data_util.mod_prefix .. "energy-catalogue-3",
  ingredients = {
    { name = data_util.mod_prefix .. "entanglement-data", amount = 1 },
    { name = data_util.mod_prefix .. "superconductivity-data", amount = 1 },
    { name = data_util.mod_prefix .. "quark-data", amount = 1 },
    { name = data_util.mod_prefix .. "lepton-data", amount = 1 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-supercooled", amount = 10},
  },
  results = {
    { name = data_util.mod_prefix .. "energy-catalogue-3", amount = 1 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 10},
  },
  energy_required = 30,
  main_product = data_util.mod_prefix .. "energy-catalogue-3",
  subgroup = "data-catalogue-energy",
  icon = "__space-exploration-graphics__/graphics/icons/catalogue/energy-catalogue-3.png",
  icon_size = 64,
  category = "space-supercomputing-1",
  always_show_made_in = true,
})
  type = "recipe",
  name = data_util.mod_prefix .. "energy-catalogue-4",
  ingredients = {
    { name = data_util.mod_prefix .. "boson-data", amount = 1 },
    { name = data_util.mod_prefix .. "fusion-test-data", amount = 1 },
    { name = data_util.mod_prefix .. "magnetic-monopole-data", amount = 1 },
    { name = data_util.mod_prefix .. "star-probe-data", amount = 1 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-supercooled", amount = 10},
  },
  results = {
    { name = data_util.mod_prefix .. "energy-catalogue-4", amount = 1 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 10},
  },
  energy_required = 40,
  main_product = data_util.mod_prefix .. "energy-catalogue-4",
  subgroup = "data-catalogue-energy",
  icon = "__space-exploration-graphics__/graphics/icons/catalogue/energy-catalogue-4.png",
  icon_size = 64,
  category = "space-supercomputing-1",
  always_show_made_in = true,
})

  type = "recipe",
  name = data_util.mod_prefix .. "biological-catalogue-1",
  ingredients = {
    { name = data_util.mod_prefix .. "bio-combustion-data", amount = 1 },
    --{ name = data_util.mod_prefix .. "bio-spectral-data", amount = 1 },
    { name = data_util.mod_prefix .. "biomechanical-data", amount = 1 },
    { name = data_util.mod_prefix .. "biochemical-data", amount = 1 },
    { name = data_util.mod_prefix .. "genetic-data", amount = 1 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-cold", amount = 10},
  },
  results = {
    { name = data_util.mod_prefix .. "biological-catalogue-1", amount = 1 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 10},
  },
  energy_required = 10,
  main_product = data_util.mod_prefix .. "biological-catalogue-1",
  subgroup = "data-catalogue-biological",
  icon = "__space-exploration-graphics__/graphics/icons/catalogue/biological-catalogue-1.png",
  icon_size = 64,
  category = "space-supercomputing-1",
  always_show_made_in = true,
})
  type = "recipe",
  name = data_util.mod_prefix .. "biological-catalogue-2",
  ingredients = {
    { name = data_util.mod_prefix .. "bio-combustion-resistance-data", amount = 1 },
    { name = data_util.mod_prefix .. "experimental-genetic-data", amount = 1 },
    { name = data_util.mod_prefix .. "biochemical-resistance-data", amount = 1 },
    { name = data_util.mod_prefix .. "biomechanical-resistance-data", amount = 1 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-cold", amount = 10},
  },
  results = {
    { name = data_util.mod_prefix .. "biological-catalogue-2", amount = 1 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 10},
  },
  energy_required = 20,
  main_product = data_util.mod_prefix .. "biological-catalogue-2",
  subgroup = "data-catalogue-biological",
  icon = "__space-exploration-graphics__/graphics/icons/catalogue/biological-catalogue-2.png",
  icon_size = 64,
  category = "space-supercomputing-1",
  always_show_made_in = true,
})
  type = "recipe",
  name = data_util.mod_prefix .. "biological-catalogue-3",
  ingredients = {
    { name = data_util.mod_prefix .. "bioelectrics-data", amount = 1 },
    { name = data_util.mod_prefix .. "cryogenics-data", amount = 1 },
    { name = data_util.mod_prefix .. "decompression-data", amount = 1 },
    { name = data_util.mod_prefix .. "radiation-exposure-data", amount = 1 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-supercooled", amount = 10},
  },
  results = {
    { name = data_util.mod_prefix .. "biological-catalogue-3", amount = 1 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 10},
  },
  energy_required = 30,
  main_product = data_util.mod_prefix .. "biological-catalogue-3",
  subgroup = "data-catalogue-biological",
  icon = "__space-exploration-graphics__/graphics/icons/catalogue/biological-catalogue-3.png",
  icon_size = 64,
  category = "space-supercomputing-1",
  always_show_made_in = true,
})
  type = "recipe",
  name = data_util.mod_prefix .. "biological-catalogue-4",
  ingredients = {
    { name = data_util.mod_prefix .. "comparative-genetic-data", amount = 1 },
    { name = data_util.mod_prefix .. "decompression-resistance-data", amount = 1 },
    { name = data_util.mod_prefix .. "neural-anomaly-data", amount = 1 },
    { name = data_util.mod_prefix .. "radiation-exposure-resistance-data", amount = 1 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-supercooled", amount = 10},
  },
  results = {
    { name = data_util.mod_prefix .. "biological-catalogue-4", amount = 1 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 10},
  },
  energy_required = 40,
  main_product = data_util.mod_prefix .. "biological-catalogue-4",
  subgroup = "data-catalogue-biological",
  icon = "__space-exploration-graphics__/graphics/icons/catalogue/biological-catalogue-4.png",
  icon_size = 64,
  category = "space-supercomputing-1",
  always_show_made_in = true,
})

  type = "recipe",
  name = data_util.mod_prefix .. "material-catalogue-1",
  ingredients = {
    { name = data_util.mod_prefix .. "cold-thermodynamics-data", amount = 1 },
    { name = data_util.mod_prefix .. "hot-thermodynamics-data", amount = 1 },
    { name = data_util.mod_prefix .. "tensile-strength-data", amount = 1 },
    { name = data_util.mod_prefix .. "compressive-strength-data", amount = 1 },
    --{ name = data_util.mod_prefix .. "shear-strength-data", amount = 1 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-cold", amount = 10},
  },
  results = {
    { name = data_util.mod_prefix .. "material-catalogue-1", amount = 1 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 10},
  },
  energy_required = 10,
  main_product = data_util.mod_prefix .. "material-catalogue-1",
  subgroup = "data-catalogue-material",
  icon = "__space-exploration-graphics__/graphics/icons/catalogue/material-catalogue-1.png",
  icon_size = 64,
  category = "space-supercomputing-1",
  always_show_made_in = true,
})
  type = "recipe",
  name = data_util.mod_prefix .. "material-catalogue-2",
  ingredients = {
    { name = data_util.mod_prefix .. "rigidity-data", amount = 1 },
    { name = data_util.mod_prefix .. "pressure-containment-data", amount = 1 },
    { name = data_util.mod_prefix .. "corrosion-resistance-data", amount = 1 },
    { name = data_util.mod_prefix .. "impact-shielding-data", amount = 1 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-cold", amount = 10},
  },
  results = {
    { name = data_util.mod_prefix .. "material-catalogue-2", amount = 1 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 10},
  },
  energy_required = 20,
  main_product = data_util.mod_prefix .. "material-catalogue-2",
  subgroup = "data-catalogue-material",
  icon = "__space-exploration-graphics__/graphics/icons/catalogue/material-catalogue-2.png",
  icon_size = 64,
  category = "space-supercomputing-1",
  always_show_made_in = true,
})
  type = "recipe",
  name = data_util.mod_prefix .. "material-catalogue-3",
  ingredients = {
    { name = data_util.mod_prefix .. "friction-data", amount = 1 },
    { name = data_util.mod_prefix .. "radiation-shielding-data", amount = 1 },
    { name = data_util.mod_prefix .. "explosion-shielding-data", amount = 1 },
    { name = data_util.mod_prefix .. "ballistic-shielding-data", amount = 1 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-supercooled", amount = 10},
  },
  results = {
    { name = data_util.mod_prefix .. "material-catalogue-3", amount = 1 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 10},
  },
  energy_required = 30,
  main_product = data_util.mod_prefix .. "material-catalogue-3",
  subgroup = "data-catalogue-material",
  icon = "__space-exploration-graphics__/graphics/icons/catalogue/material-catalogue-3.png",
  icon_size = 64,
  category = "space-supercomputing-1",
  always_show_made_in = true,
})
  type = "recipe",
  name = data_util.mod_prefix .. "material-catalogue-4",
  ingredients = {
    { name = data_util.mod_prefix .. "laser-shielding-data", amount = 1 },
    { name = data_util.mod_prefix .. "particle-beam-shielding-data", amount = 1 },
    { name = data_util.mod_prefix .. "electrical-shielding-data", amount = 1 },
    { name = data_util.mod_prefix .. "experimental-alloys-data", amount = 1 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-supercooled", amount = 10},
  },
  results = {
    { name = data_util.mod_prefix .. "material-catalogue-4", amount = 1 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 10},
  },
  energy_required = 40,
  main_product = data_util.mod_prefix .. "material-catalogue-4",
  subgroup = "data-catalogue-material",
  icon = "__space-exploration-graphics__/graphics/icons/catalogue/material-catalogue-4.png",
  icon_size = 64,
  category = "space-supercomputing-1",
  always_show_made_in = true,
})

--[[
  type = "recipe",
  name = data_util.mod_prefix .. "universal-catalogue",
  ingredients = {
    { data_util.mod_prefix .. "astronomic-catalogue-4", 1 },
    { data_util.mod_prefix .. "energy-catalogue-4", 1 },
    { data_util.mod_prefix .. "biological-catalogue-4", 1 },
    { data_util.mod_prefix .. "material-catalogue-4", 1 },
    { data_util.mod_prefix .. "deep-catalogue-4", 1 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-supercooled", amount = 100},
  },
  results = {
    { name = data_util.mod_prefix .. "universal-catalogue", amount = 5 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 100},
  },
  energy_required = 50,
  main_product = data_util.mod_prefix .. "universal-catalogue",
  icon = "__space-exploration-graphics__/graphics/icons/catalogue/universal-catalogue.png",
  icon_size = 64,
  category = "space-supercomputing-4",
  always_show_made_in = true,
})
]]

data:extend({

  {
    type = "recipe",
    name = data_util.mod_prefix .. "deep-catalogue-1",
    main_product = data_util.mod_prefix .. "deep-catalogue-1",
    enabled = false,
    energy_required = 60,
    ingredients = {
      { data_util.mod_prefix .. "void-probe-data", 1 },
      { data_util.mod_prefix .. "nano-engineering-data", 1 },
      { data_util.mod_prefix .. "naquium-structural-data", 1 },
      { data_util.mod_prefix .. "naquium-energy-data", 1 },
      { data_util.mod_prefix .. "cryonite-rod", 1 },
      { type = "fluid", name = data_util.mod_prefix .. "space-coolant-supercooled", amount = 10},
    },
    results = {
      { data_util.mod_prefix .. "deep-catalogue-1", 1 },
      { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 10},
    },
    requester_paste_multiplier = 1,
    always_show_made_in = true,
    category = "space-supercomputing-3",
  },

  {
    type = "recipe",
    name = data_util.mod_prefix .. "deep-catalogue-2",
    main_product = data_util.mod_prefix .. "deep-catalogue-2",
    enabled = false,
    energy_required = 70,
    ingredients = {
      { data_util.mod_prefix .. "timespace-anomaly-data", 1 },
      { data_util.mod_prefix .. "singularity-data", 1 },
      { data_util.mod_prefix .. "hyperlattice-data", 1 },
      { data_util.mod_prefix .. "annihilation-data", 1 },
      { data_util.mod_prefix .. "cryonite-rod", 2 },
      { type = "fluid", name = data_util.mod_prefix .. "space-coolant-supercooled", amount = 20},
    },
    results = {
      { data_util.mod_prefix .. "deep-catalogue-2", 1 },
      { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 20},
    },
    requester_paste_multiplier = 1,
    always_show_made_in = true,
    category = "space-supercomputing-3",
  },
  {
    type = "recipe",
    name = data_util.mod_prefix .. "deep-catalogue-3",
    main_product = data_util.mod_prefix .. "deep-catalogue-3",
    enabled = false,
    energy_required = 80,
    ingredients = {
      { data_util.mod_prefix .. "space-fold-data", 1 },
      { data_util.mod_prefix .. "space-warp-data", 1 },
      { data_util.mod_prefix .. "space-dialation-data", 1 },
      { data_util.mod_prefix .. "space-injection-data", 1 },
      { data_util.mod_prefix .. "cryonite-rod", 3 },
      { type = "fluid", name = data_util.mod_prefix .. "space-coolant-supercooled", amount = 30},
    },
    results = {
      { data_util.mod_prefix .. "deep-catalogue-3", 1 },
      { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 30},
    },
    requester_paste_multiplier = 1,
    always_show_made_in = true,
    category = "space-supercomputing-3",
  },
  {
    type = "recipe",
    name = data_util.mod_prefix .. "deep-catalogue-4",
    main_product = data_util.mod_prefix .. "deep-catalogue-4",
    enabled = false,
    energy_required = 90,
    ingredients = {
      { data_util.mod_prefix .. "interstellar-data", 1 },
      { data_util.mod_prefix .. "teleportation-data", 1 },
      { data_util.mod_prefix .. "wormhole-data", 1 },
      { data_util.mod_prefix .. "rhga-data", 1 },
      { data_util.mod_prefix .. "cryonite-rod", 4 },
      { type = "fluid", name = data_util.mod_prefix .. "space-coolant-supercooled", amount = 40},
    },
    results = {
      { data_util.mod_prefix .. "deep-catalogue-4", 1 },
      { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 40},
    },
    requester_paste_multiplier = 1,
    always_show_made_in = true,
    category = "space-supercomputing-4",
  },

  {
    type = "recipe",
    name = data_util.mod_prefix .. "rhga-data",
    main_product = data_util.mod_prefix .. "rhga-data",
    enabled = false,
    energy_required = 1000,
    ingredients = {
      { data_util.mod_prefix .. "empty-data", 50 },
      { data_util.mod_prefix .. "naquium-processor", 1 },
      { data_util.mod_prefix .. "cryonite-rod", 100 },
      { type = "fluid", name = data_util.mod_prefix .. "space-coolant-supercooled", amount = 1000},
    },
    results = {
      { data_util.mod_prefix .. "rhga-data", 50 },
      { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 1000},
    },
    requester_paste_multiplier = 1,
    always_show_made_in = true,
    category = "space-supercomputing-4",
  },
})
local data_util = require("data_util")
local make_recipe = data_util.make_recipe

local recipe_multiplier = 4

  type = "recipe",
  name = data_util.mod_prefix .. "thermodynamics-coal",
  ingredients = {
    { name = data_util.mod_prefix .. "experimental-specimen", amount = 1},
    { type = "fluid", name = data_util.mod_prefix .. "plasma-stream", amount = 10},
  },
  results = {
    { name = "coal", amount = 1},
    { type = "fluid", name = data_util.mod_prefix .. "contaminated-space-water", amount = 20},
    { name = data_util.mod_prefix .. "contaminated-scrap", amount = 1},
  },
  energy_required = 5 * recipe_multiplier,
  subgroup = "space-components",
  category = "space-thermodynamics",
  allow_as_intermediate = false,
  always_show_made_in = true,
})

  type = "recipe",
  name = data_util.mod_prefix .. "bio-combustion-data",
  ingredients = {
    { name = data_util.mod_prefix .. "specimen", amount = 1},
    { name = data_util.mod_prefix .. "empty-data", amount = 1},
    { type = "fluid", name = data_util.mod_prefix .. "plasma-stream", amount = 10},
  },
  results = {
    { name = data_util.mod_prefix .. "bio-combustion-data", amount_min = 1, amount_max = 1, probability = 0.75},
    { name = data_util.mod_prefix .. "junk-data", amount_min = 1, amount_max = 1, probability = 0.24},
    { type = "fluid", name = data_util.mod_prefix .. "contaminated-bio-sludge", amount = 2},
  },
  energy_required = 5 * recipe_multiplier,
  main_product = data_util.mod_prefix .. "bio-combustion-data",
  category = "space-thermodynamics",
  always_show_made_in = true,
})

  type = "recipe",
  name = data_util.mod_prefix .. "bio-combustion-resistance-data",
  ingredients = {
    { name = data_util.mod_prefix .. "experimental-specimen", amount = 1},
    { name = data_util.mod_prefix .. "empty-data", amount = 1},
    { type = "fluid", name = data_util.mod_prefix .. "plasma-stream", amount = 10},
  },
  results = {
    { name = data_util.mod_prefix .. "bio-combustion-resistance-data", amount = 1},
    { name = data_util.mod_prefix .. "experimental-specimen", amount_min = 1, amount_max = 1, probability = 0.5},
    { type = "fluid", name = data_util.mod_prefix .. "contaminated-bio-sludge", amount = 7},
  },
  energy_required = 10 * recipe_multiplier,
  main_product = data_util.mod_prefix .. "bio-combustion-resistance-data",
  category = "space-thermodynamics",
  always_show_made_in = true,
})

--[[
-- removed
  type = "recipe",
  name = data_util.mod_prefix .. "bio-combustion-suppression-data",
  ingredients = {
    { name = data_util.mod_prefix .. "significant-specimen", amount = 1},
    { name = data_util.mod_prefix .. "experimental-material", amount = 1},
    { name = data_util.mod_prefix .. "empty-data", amount = 1},
    { type = "fluid", name = data_util.mod_prefix .. "plasma-stream", amount = 100},
  },
  results = {
    { name = data_util.mod_prefix .. "bio-combustion-suppression-data", amount_min = 1, amount_max = 1, probability = 0.5},
    { name = data_util.mod_prefix .. "junk-data", amount_min = 1, amount_max = 1, probability = 0.49},
    { name = data_util.mod_prefix .. "contaminated-scrap", amount = 3},
    { type = "fluid", name = data_util.mod_prefix .. "contaminated-bio-sludge", amount = 100},
  },
  category = "space-thermodynamics",
})
]]--

  type = "recipe",
  name = data_util.mod_prefix .. "cold-thermodynamics-data",
  ingredients = {
    { name = data_util.mod_prefix .. "material-testing-pack", amount = 4},
    { name = data_util.mod_prefix .. "empty-data", amount = 1},
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-cold", amount = 10},
  },
  results = {
    { name = data_util.mod_prefix .. "cold-thermodynamics-data", amount = 1},
    { name = data_util.mod_prefix .. "contaminated-scrap", amount = 8},
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 8},
  },
  energy_required = 10 * recipe_multiplier,
  main_product = data_util.mod_prefix .. "cold-thermodynamics-data",
  category = "space-thermodynamics",
  always_show_made_in = true,
})

  type = "recipe",
  name = data_util.mod_prefix .. "hot-thermodynamics-data",
  ingredients = {
    { name = data_util.mod_prefix .. "material-testing-pack", amount = 4},
    { name = data_util.mod_prefix .. "empty-data", amount = 1},
    { type = "fluid", name = data_util.mod_prefix .. "plasma-stream", amount = 10},
  },
  results = {
    { name = data_util.mod_prefix .. "hot-thermodynamics-data", amount = 1},
    { name = data_util.mod_prefix .. "contaminated-scrap", amount = 8},
  },
  energy_required = 10 * recipe_multiplier,
  main_product = data_util.mod_prefix .. "hot-thermodynamics-data",
  category = "space-thermodynamics",
  always_show_made_in = true,
})

  type = "recipe",
  name = data_util.mod_prefix .. "pressure-containment-data",
  ingredients = {
    { name = data_util.mod_prefix .. "empty-data", amount = 3},
    { name = data_util.mod_prefix .. "heavy-girder", amount = 1},
    { name = "storage-tank", amount = 1},
    { type = "fluid", name = data_util.mod_prefix .. "space-water", amount = 1000},
  },
  results = {
    { name = data_util.mod_prefix .. "pressure-containment-data", amount = 3},
    { name = data_util.mod_prefix .. "scrap", amount = 50},
    { type = "fluid", name = data_util.mod_prefix .. "space-water", amount = 990},
  },
  energy_required = 6 * recipe_multiplier,
  main_product = data_util.mod_prefix .. "pressure-containment-data",
  category = "space-thermodynamics",
  always_show_made_in = true,
})

  type = "recipe",
  name = data_util.mod_prefix .. "explosion-shielding-data",
  ingredients = {
    { name = "explosives", amount = 20},
    { name = data_util.mod_prefix .. "material-testing-pack", amount = 4},
    { name = data_util.mod_prefix .. "heavy-girder", amount = 1},
    { name = data_util.mod_prefix .. "iridium-plate", amount = 1},
    { name = data_util.mod_prefix .. "empty-data", amount = 1},
  },
  results = {
    { name = data_util.mod_prefix .. "explosion-shielding-data", amount = 1},
    { name = data_util.mod_prefix .. "heavy-girder", amount_min = 1, amount_max = 1, probability = 0.5},
    { name = data_util.mod_prefix .. "iridium-plate", amount_min = 1, amount_max = 1, probability = 0.5},
    { name = data_util.mod_prefix .. "scrap", amount = 10},
  },
  energy_required = 10,
  main_product = data_util.mod_prefix .. "explosion-shielding-data",
  category = "space-thermodynamics",
  enabled = false,
  always_show_made_in = true,
})

  type = "recipe",
  name = data_util.mod_prefix .. "experimental-alloys-data",
  ingredients = {
    { name = data_util.mod_prefix .. "iridium-plate", amount = 1},
    { name = data_util.mod_prefix .. "beryllium-plate", amount = 1},
    { name = data_util.mod_prefix .. "holmium-plate", amount = 1},
    { name = "iron-plate", amount = 1},
    { name = "copper-plate", amount = 1},
    { name = data_util.mod_prefix .. "empty-data", amount = 6},
  },
  results = {
    { name = data_util.mod_prefix .. "experimental-alloys-data", amount = 6},
    { name = data_util.mod_prefix .. "scrap", amount = 5},
  },
  energy_required = 18,
  main_product = data_util.mod_prefix .. "experimental-alloys-data",
  category = "space-thermodynamics",
  enabled = false,
  always_show_made_in = true,
})

data_util.  type = "recipe",
  name = data_util.mod_prefix .. "cryogun",
  ingredients = {
    { data_util.mod_prefix .. "beryllium-plate", 10},
    { data_util.mod_prefix .. "aeroframe-pole", 10},
    { data_util.mod_prefix .. "cryonite-rod", 10},
  },
  results = {
    { data_util.mod_prefix .. "cryogun", 1},
  },
  energy_required = 60,
  category = "space-thermodynamics",
  enabled = false,
})

data_util.  type = "recipe",
  name = data_util.mod_prefix .. "cryogun-ammo",
  ingredients = {
    { data_util.mod_prefix .. "beryllium-plate", 1},
    { data_util.mod_prefix .. "cryonite-rod", 10},
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-supercooled", amount = 10},
  },
  results = {
    { data_util.mod_prefix .. "cryogun-ammo", 1},
  },
  energy_required = 10,
  category = "space-thermodynamics",
  enabled = false,
  always_show_made_in = true,
})













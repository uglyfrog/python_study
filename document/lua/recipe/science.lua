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

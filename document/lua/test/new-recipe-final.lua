local data_util = require("data_util")
local make_recipe = data_util.make_recipe

data:extend({
  {
      type = "recipe",
      name = data_util.mod_prefix .. "space-capsule",
      result = data_util.mod_prefix .. "space-capsule",
      energy_required = 60,
      ingredients = {
        { data_util.mod_prefix .. "heat-shielding", 100 },
        { "rocket-control-unit", 100 },
        { "low-density-structure", 100 },
        { "rocket-fuel", 100 },
        { "solar-panel", 50 },
        { "accumulator", 50 },
        { "glass", 50 },
      },
      requester_paste_multiplier = 2,
      enabled = false,
      always_show_made_in = true,
  },
  {
      type = "recipe",
      name = data_util.mod_prefix .. "cargo-rocket-section",
      result = data_util.mod_prefix .. "cargo-rocket-section",
      energy_required = 30,
      ingredients = {
        { data_util.mod_prefix .. "heat-shielding", 4 },
        { "low-density-structure", 4 },
        { "rocket-control-unit", 4 },
        { data_util.mod_prefix .. "cargo-rocket-cargo-pod", 1 },
        { data_util.mod_prefix .. "cargo-rocket-fuel-tank", 1 }
      },
      requester_paste_multiplier = 1,
      enabled = false,
      always_show_made_in = true,
  },
  {
      type = "recipe",
      name = data_util.mod_prefix .. "cargo-rocket-section-beryllium",
      results = {
        { data_util.mod_prefix .. "cargo-rocket-section", 2 }
      },
      energy_required = 60,
      ingredients = {
        { data_util.mod_prefix .. "beryllium-plate", 10 },
        { data_util.mod_prefix .. "heat-shielding", 4 },
        { "low-density-structure", 4 },
        { "rocket-control-unit", 4 },
        { data_util.mod_prefix .. "cargo-rocket-cargo-pod", 1 },
        { data_util.mod_prefix .. "cargo-rocket-fuel-tank", 1 }
      },
      requester_paste_multiplier = 1,
      enabled = false,
      always_show_made_in = true,
  },
  {
      type = "recipe",
      name = data_util.mod_prefix .. "cargo-rocket-section-unpack",
      results = {
        type = "item",
        name = data_util.mod_prefix .. "cargo-rocket-section", 5
        amount = 5,
        catalyst_amount = 5
      },
      result_count = 5,
      energy_required = 5,
      ingredients = {
        { data_util.mod_prefix .. "cargo-rocket-section-packed", 1 }
      },
      requester_paste_multiplier = 1,
      enabled = false,
      always_show_made_in = true,
      always_show_products = true,
      category = "crafting-with-fluid", -- no hand crafting
      localised_name = {"recipe-name."..data_util.mod_prefix .. "cargo-rocket-section-unpack"},
  },
  {
      type = "recipe",
      name = data_util.mod_prefix .. "cargo-rocket-section-pack",
      result = data_util.mod_prefix .. "cargo-rocket-section-packed",
      energy_required = 5,
      ingredients = {
        type = "item",
        { name = data_util.mod_prefix .. "cargo-rocket-section", 5 }
        amount = 5,
        catalyst_amount = 5
      },
      requester_paste_multiplier = 1,
      enabled = false,
      always_show_made_in = true,
      always_show_products = true,
      category = "crafting-with-fluid", -- no hand crafting
      localised_name = {"recipe-name."..data_util.mod_prefix .. "cargo-rocket-section-pack"},
  },
  {
      type = "recipe",
      name = data_util.mod_prefix .. "cargo-rocket-cargo-pod",
      result = data_util.mod_prefix .. "cargo-rocket-cargo-pod",
      energy_required = 30,
      ingredients = {
        { "steel-plate", 6 },
        { "advanced-circuit", 4 },
        { "iron-chest", 4 }, -- Bentham, at least they die in fire
        { "fast-inserter", 2},
      },
      requester_paste_multiplier = 2,
      enabled = false,
      always_show_made_in = true,
  },
  {
      type = "recipe",
      name = data_util.mod_prefix .. "cargo-rocket-fuel-tank",
      result = data_util.mod_prefix .. "cargo-rocket-fuel-tank",
      energy_required = 30,
      ingredients = {
        { "advanced-circuit", 2 },
        { "pipe", 2 },
        { "storage-tank", 1 },
        { "pump", 1 },
      },
      requester_paste_multiplier = 2,
      enabled = false,
      always_show_made_in = true,
  },
})
local data_util = require("data_util")
local make_recipe = data_util.make_recipe
local obs_types = data_util.obs_types

  type = "recipe",
  name = data_util.mod_prefix .. "astrometric-analysis-multispectral-1",
  ingredients = {
    { data_util.mod_prefix .. "visible-observation-data", 1 },
    { data_util.mod_prefix .. "uv-observation-data", 1 },
    { data_util.mod_prefix .. "infrared-observation-data", 1 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-cold", amount = 10},
  },
  results = {
    { data_util.mod_prefix .. "astrometric-data", 3 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 10},
  },
  energy_required = 3,
  icon = "__space-exploration-graphics__/graphics/icons/data/astrometric.png",
  icon_size = 64,
  category = "space-astrometrics",
  subgroup = "data-astronomic",
  enabled = false,
  always_show_made_in = true,
})
  type = "recipe",
  name = data_util.mod_prefix .. "astrometric-analysis-multispectral-2",
  ingredients = {
    { data_util.mod_prefix .. "empty-data", 5 },
    { data_util.mod_prefix .. "visible-observation-data", 1 },
    { data_util.mod_prefix .. "uv-observation-data", 1 },
    { data_util.mod_prefix .. "infrared-observation-data", 1 },
    { data_util.mod_prefix .. "microwave-observation-data", 1 },
    { data_util.mod_prefix .. "xray-observation-data", 1 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-cold", amount = 10},
  },
  results = {
    { data_util.mod_prefix .. "astrometric-data", 10 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 10},
  },
  energy_required = 10,
  icon = "__space-exploration-graphics__/graphics/icons/data/astrometric.png",
  icon_size = 64,
  category = "space-astrometrics",
  subgroup = "data-astronomic",
  enabled = false,
  always_show_made_in = true,
})
  type = "recipe",
  name = data_util.mod_prefix .. "astrometric-analysis-multispectral-3",
  ingredients = {
    { data_util.mod_prefix .. "empty-data", 13 },
    { data_util.mod_prefix .. "visible-observation-data", 1 },
    { data_util.mod_prefix .. "infrared-observation-data", 1 },
    { data_util.mod_prefix .. "uv-observation-data", 1 },
    { data_util.mod_prefix .. "microwave-observation-data", 1 },
    { data_util.mod_prefix .. "xray-observation-data", 1 },
    { data_util.mod_prefix .. "radio-observation-data", 1 },
    { data_util.mod_prefix .. "gammaray-observation-data", 1 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-cold", amount = 10},
  },
  results = {
    { data_util.mod_prefix .. "astrometric-data", 20 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 10},
  },
  energy_required = 20,
  icon = "__space-exploration-graphics__/graphics/icons/data/astrometric.png",
  icon_size = 64,
  category = "space-astrometrics",
  subgroup = "data-astronomic",
  enabled = false,
  always_show_made_in = true,
})

local i = 0
for _, type in pairs(obs_types) do
  i = i + 1
  type = "recipe",
  name = data_util.mod_prefix .. type[1] .. "-observation-data",
  ingredients = {
    { data_util.mod_prefix .. "observation-frame-" .. type[1], type[2] },
    { data_util.mod_prefix .. "empty-data", 1 },
  },
results = {
    { name = type[1] .. "-observation-data", amount_min = 1, amount_max = 1, probability = type[3] },
    { name = data_util.mod_prefix .. "junk-data", amount_min = 1, amount_max = 1, probability = 0.99 - type[3] },
    { name = data_util.mod_prefix .. "scrap",  amount_min = 1, amount_max = 1, probability = 0.01 * type[2] },
  },
energy_required = math.floor(60 * type[3]) / 10,
main_product = data_util.mod_prefix .. type[1] .. "-observation-data",
icon = "__space-exploration-graphics__/graphics/icons/data/"..type[1].."-observation.png",
icon_size = 64, icon_mipmaps = 1,
category = "space-astrometrics",
order = "od-a"..i,
enabled = false,
always_show_made_in = true,
allow_as_intermediate = false,
})
end
local data_util = require("data_util")
local make_recipe = data_util.make_recipe

  type = "recipe",
  name = data_util.mod_prefix .. "bio-sludge-from-fish",
  ingredients = {
    { name = "raw-fish", amount = 1},
    { type = "fluid", name = data_util.mod_prefix .. "space-water", amount = 7 },
  },
  results = {
    { type = "fluid", name = data_util.mod_prefix .. "bio-sludge", amount = 10 },
  },
  icons = {
    { icon = data.raw.fluid[data_util.mod_prefix .. "bio-sludge"].icon, scale = 1, icon_size = 64  },
    { icon = data.raw.capsule["raw-fish"].icon, scale = 0.75/2, icon_size = 64  },
  },
  energy_required = 4,
  localised_name = {"recipe-name."..data_util.mod_prefix .. "bio-sludge-from-fish"},
  category = "space-biochemical",
  enabled = false,
  subgroup = "space-bioculture",
  always_show_made_in = true,
})
  type = "recipe",
  name = data_util.mod_prefix .. "bio-sludge-from-wood",
  ingredients = {
    { name = "wood", amount = 10},
    { type = "fluid", name = data_util.mod_prefix .. "space-water", amount = 10 },
  },
  results = {
    { type = "fluid", name = data_util.mod_prefix .. "bio-sludge", amount = 20 },
  },
  icons = {
    { icon = data.raw.fluid[data_util.mod_prefix .. "bio-sludge"].icon, scale = 1, icon_size = 64  },
    { icon = data.raw.item["wood"].icon, scale = 0.75/2, icon_size = 64  },
  },
  energy_required = 4,
  localised_name = {"recipe-name."..data_util.mod_prefix .. "bio-sludge-from-wood"},
  category = "space-biochemical",
  enabled = false,
  subgroup = "space-bioculture",
  always_show_made_in = true,
})
  type = "recipe",
  name = data_util.mod_prefix .. "bio-sludge-from-vitamelange",
  ingredients = {
    { name = data_util.mod_prefix .. "vitalic-acid", amount = 1},
    { name = data_util.mod_prefix .. "vitamelange-nugget", amount = 40},
    { type = "fluid", name = data_util.mod_prefix .. "space-water", amount = 10 },
  },
  results = {
    { type = "fluid", name = data_util.mod_prefix .. "bio-sludge", amount = 10 },
  },
  icons = {
    { icon = data.raw.fluid[data_util.mod_prefix .. "bio-sludge"].icon, scale = 1, icon_size = 64  },
    { icon = data.raw.item[data_util.mod_prefix .. "vitamelange-nugget"].icon, scale = 0.75/2, icon_size = 64  },
  },
  energy_required = 4,
  localised_name = {"recipe-name."..data_util.mod_prefix .. "bio-sludge-from-vitamelange"},
  category = "space-biochemical",
  enabled = false,
  subgroup = "space-bioculture",
  always_show_made_in = true,
})

  type = "recipe",
  name = data_util.mod_prefix .. "bio-sludge",
  ingredients = {
    { type = "fluid", name = data_util.mod_prefix .. "space-water", amount = 10 },
    { name = data_util.mod_prefix .. "specimen", amount = 1},
  },
  results = {
    { type = "fluid", name = data_util.mod_prefix .. "bio-sludge", amount = 30 },
    { name = data_util.mod_prefix .. "contaminated-scrap", amount = 1 },
  },
  icons = {
    { icon = data.raw.fluid[data_util.mod_prefix .. "bio-sludge"].icon, scale = 1, icon_size = 64  },
    { icon = data.raw.item[data_util.mod_prefix .. "specimen"].icon, scale = 0.75, icon_size = 64  },
  },
  energy_required = 4,
  main_product = data_util.mod_prefix .. "bio-sludge",
  localised_name = {"recipe-name."..data_util.mod_prefix .. "bio-sludge"},
  category = "space-biochemical",
  enabled = false,
  subgroup = "space-bioculture",
  allow_as_intermediate = false,
  always_show_made_in = true,
})

  type = "recipe",
  name = data_util.mod_prefix .. "bio-sludge-crude-oil",
  ingredients = {
    { type = "fluid", name = data_util.mod_prefix .. "space-water", amount = 5 },
    { name = data_util.mod_prefix .. "experimental-specimen", amount = 1},
  },
  results = {
    { type = "fluid", name = data_util.mod_prefix .. "bio-sludge", amount = 20 },
    { type = "fluid", name = data_util.mod_prefix .. "contaminated-space-water", amount = 5 },
    { type = "fluid", name = "crude-oil", amount = 100 },
    { name = data_util.mod_prefix .. "contaminated-scrap", amount = 1 },
  },
  icons = data_util.add_icons_to_stack(nil, {
    {icon = data.raw.fluid[data_util.mod_prefix .. "bio-sludge"]},
    {icon = data.raw.fluid["crude-oil"], properties = {scale = 0.75}},
  }),
  energy_required = 10,
  category = "space-biochemical",
  enabled = false,
  subgroup = "space-bioculture",
  allow_as_intermediate = false,
  always_show_made_in = true,
})

  type = "recipe",
  name = data_util.mod_prefix .. "biochemical-data",
  ingredients = {
    { name = data_util.mod_prefix .. "empty-data", amount = 1},
    { name = data_util.mod_prefix .. "specimen", amount = 1},
    { name = data_util.mod_prefix .. "vitamelange-spice", amount = 1},
    { type="fluid", name = data_util.mod_prefix .. "chemical-gel", amount = 10},
  },
  results = {
    { name = data_util.mod_prefix .. "biochemical-data", amount = 1 },
    { type = "fluid", name = data_util.mod_prefix .. "contaminated-bio-sludge", amount = 10 },
    { type = "fluid", name = data_util.mod_prefix .. "contaminated-space-water", amount = 10 },
  },
  energy_required = 10,
  main_product = data_util.mod_prefix .. "biochemical-data",
  category = "space-biochemical",
  enabled = false,
  always_show_made_in = true,
})

  type = "recipe",
  name = data_util.mod_prefix .. "cryogenics-data",
  ingredients = {
    { name = data_util.mod_prefix .. "significant-specimen", amount = 1},
    { name = data_util.mod_prefix .. "empty-data", amount = 1},
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-supercooled", amount = 10},
  },
  results = {
    { name = data_util.mod_prefix .. "cryogenics-data", amount_min = 1, amount_max = 1, probability = 0.9},
    { name = data_util.mod_prefix .. "junk-data", amount_min = 1, amount_max = 1, probability = 0.09},
    { type="fluid", name = data_util.mod_prefix .. "contaminated-bio-sludge", amount = 10},
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-warm", amount = 10},
  },
  energy_required = 10,
  main_product = data_util.mod_prefix .. "cryogenics-data",
  category = "space-biochemical",
  enabled = false,
  always_show_made_in = true,
})

  type = "recipe",
  name = data_util.mod_prefix .. "biochemical-resistance-data",
  ingredients = {
    { name = data_util.mod_prefix .. "empty-data", amount = 1},
    { name = data_util.mod_prefix .. "experimental-specimen", amount = 1},
    { name = data_util.mod_prefix .. "vitalic-acid", amount = 1},
    { type="fluid", name = data_util.mod_prefix .. "chemical-gel", amount = 10},
  },
  results = {
    { name = data_util.mod_prefix .. "biochemical-resistance-data", amount_min = 1, amount_max = 1, probability = 0.9},
    { name = data_util.mod_prefix .. "experimental-specimen", amount_min = 1, amount_max = 1, probability = 0.5},
    { name = data_util.mod_prefix .. "junk-data", amount_min = 1, amount_max = 1, probability = 0.09},
    { type = "fluid", name = data_util.mod_prefix .. "contaminated-bio-sludge", amount = 5 },
    { type = "fluid", name = data_util.mod_prefix .. "contaminated-space-water", amount = 5 },
  },
  energy_required = 10,
  main_product = data_util.mod_prefix .. "biochemical-resistance-data",
  category = "space-biochemical",
  enabled = false,
  always_show_made_in = true,
})

  type = "recipe",
  name = data_util.mod_prefix .. "nutrient-gel",
  ingredients = {
    { name = "coal", amount = 1},
    { type = "fluid", name = data_util.mod_prefix .. "chemical-gel", amount = 4},
    { type = "fluid", name = data_util.mod_prefix .. "bio-sludge", amount = 20},
    { type = "fluid", name = data_util.mod_prefix .. "space-water", amount = 25},
  },
  results = {
    { type = "fluid", name = data_util.mod_prefix .. "nutrient-gel", amount = 50},
  },
  energy_required = 5,
  category = "space-biochemical",
  subgroup = "space-bioculture",
  enabled = false,
  always_show_made_in = true,
})

  type = "recipe",
  name = data_util.mod_prefix .. "nutrient-gel-methane",
  ingredients = {
    { type = "fluid", name = data_util.mod_prefix .. "methane-gas", amount = 50},
    { type = "fluid", name = data_util.mod_prefix .. "chemical-gel", amount = 5},
    { type = "fluid", name = data_util.mod_prefix .. "bio-sludge", amount = 10},
    { type = "fluid", name = data_util.mod_prefix .. "space-water", amount = 20},
  },
  results = {
    { type = "fluid", name = data_util.mod_prefix .. "nutrient-gel", amount = 50},
  },
  energy_required = 10,
  category = "space-biochemical",
  subgroup = "space-bioculture",
  enabled = false,
  always_show_made_in = true,
})

  type = "recipe",
  name = data_util.mod_prefix .. "nutrient-vat",
  ingredients = {
    { name = "iron-plate", amount = 1},
    { name = "glass", amount = 1},
    { type = "fluid", name = data_util.mod_prefix .. "nutrient-gel", amount = 50},
  },
  results = {
    { name = data_util.mod_prefix .. "nutrient-vat", amount = 5},
  },
  energy_required = 10,
  category = "space-biochemical",
  enabled = false,
  always_show_made_in = true,
})

  type = "recipe",
  name = data_util.mod_prefix .. "plague-bomb",
  ingredients = {
    { name = data_util.mod_prefix .. "significant-specimen", amount = 100},
    { name = data_util.mod_prefix .. "biological-catalogue-4", amount = 10},
    { type="fluid", name = data_util.mod_prefix .. "bio-sludge", amount = 1000},
    { type="fluid", name = data_util.mod_prefix .. "chemical-gel", amount = 1000},
  },
  results = {
    { name = data_util.mod_prefix .. "plague-bomb", amount = 1 },
    { type = "fluid", name = data_util.mod_prefix .. "contaminated-bio-sludge", amount = 2000 },
  },
  energy_required = 60,
  main_product = data_util.mod_prefix .. "plague-bomb",
  category = "space-biochemical",
  enabled = false,
  always_show_made_in = true,
})


  type = "recipe",
  name = data_util.mod_prefix .. "melting-water-ice",
  ingredients = {
    { name = data_util.mod_prefix .. "water-ice", amount = 1},
  },
  results = {
    { type = "fluid", name = "water", amount = 100},
  },
  energy_required = 0.25,
  subgroup = "space-fluids",
  category = "chemistry",
  always_show_made_in = true,
})

  type = "recipe",
  name = data_util.mod_prefix .. "melting-methane-ice",
  ingredients = {
    { name = data_util.mod_prefix .. "methane-ice", amount = 1},
  },
  results = {
    { type = "fluid", name = data_util.mod_prefix .. "methane-gas", amount = 10},
  },
  energy_required = 0.25,
  subgroup = "space-fluids",
  category = "chemistry",
  always_show_made_in = true,
})

  type = "recipe",
  name = data_util.mod_prefix .. "corrosion-resistance-data",
  ingredients = {
    { name = "glass", amount = 2},
    { name = data_util.mod_prefix .. "material-testing-pack", amount = 2},
    { name = data_util.mod_prefix .. "iridium-plate", amount = 1},
    { name = data_util.mod_prefix .. "empty-data", amount = 1},
    { type = "fluid", name =  data_util.mod_prefix .. "chemical-gel", amount = 5},
  },
  results = {
    { name = data_util.mod_prefix .. "corrosion-resistance-data", amount = 1},
    { name = data_util.mod_prefix .. "iridium-plate", amount_min = 1, amount_max = 1, probability = 0.5},
    { name = data_util.mod_prefix .. "scrap", amount = 6},
    { type = "fluid", name = data_util.mod_prefix .. "contaminated-space-water", amount = 5},
  },
  energy_required = 10,
  main_product = data_util.mod_prefix .. "corrosion-resistance-data",
  category = "space-mechanical",
  enabled = false,
  always_show_made_in = true,
})
local data_util = require("data_util")
local make_recipe = data_util.make_recipe

  type = "recipe",
  name = data_util.mod_prefix .. "condenser-turbine",
  ingredients = {
    { name = "steam-turbine", amount = 1},
    { name = "storage-tank", amount = 2},
    { name = "electric-engine-unit", amount = 10},
    { name = "low-density-structure", amount = 20},
    { name = "glass", amount = 20},
  },
  results = {
    { name = data_util.mod_prefix .. "condenser-turbine", amount = 1},
  },
  energy_required = 5,
  category = "crafting",
  enabled = false,
  always_show_made_in = false,
})
local steam_temperature_ranges = {
  100, -- Min
  165, -- Vanilla boiler
  200,
  300,
  400,
  415, -- K2 HE
  500, -- HE
  600,
  700,
  800,
  900,
  1000  -- last one is accepted but previous temperature is used internally
}
for i = 1, #steam_temperature_ranges - 1 do
  local low = steam_temperature_ranges[i]
  local high = steam_temperature_ranges[i+1]

data:extend({
   {
     type = "recipe",
     name = data_util.mod_prefix .. "condenser-turbine-reclaim-water",
     icon = "__space-exploration-graphics__/graphics/icons/fluid/water.png",
     icon_size = 64,
     order = "a",
     subgroup = "spaceship-process",
     energy_required = 0.1,
     category = "condenser-turbine",
     ingredients = {
         {type="fluid", name ="steam", amount=100},
     },
    results = {
        {type="fluid", name ="water", amount=99},
        {type="fluid", name=data_util.mod_prefix .. "decompressing-steam", amount=75, temperature = low},
    },
    hidden = true,
    enabled = true,
    allow_as_intermediate = false,
    always_show_made_in = true,
    localised_name = {"recipe-name.se-condenser-turbine-reclaim-water"}
    minimum_temperature = low - 1,
    maximum_temperature = (i == (#steam_temperature_ranges - 1)) and (high + 1) or (high -1)},
   },
})
end
local data_util = require("data_util")
data:extend({
  {
    type = "recipe",
    name = data_util.mod_prefix .. "core-miner",
    category = "crafting",
    enabled = false,
    energy_required = 100,
    ingredients = {
      {"concrete", 400},
      {"electronic-circuit", 200},
      {"steel-plate", 100},
      {"electric-mining-drill", 40},
    },
    results = {
      {name = data_util.mod_prefix .. "core-miner", amount=1}
    },
    icon = "__space-exploration-graphics__/graphics/icons/core-miner.png",
    icon_size = 64,
    order = "zzz-core-miner",
    always_show_made_in = true,
  },
})
local data_util = require("data_util")
local make_recipe = data_util.make_recipe

data:extend({{
  type = "recipe",
  name = data_util.mod_prefix .. "space-water",
  enabled = false,
  energy_required = 1,
  ingredients = {
    { type = "fluid", name = "water", amount = 99 },
    { type = "fluid", name = "lubricant", amount = 1 }
  },
  energy_required = 1,
  results = { 
    { type = "fluid", name = data_util.mod_prefix .. "space-water", amount = 10 } 
  },
  allow_as_intermediate = false,
  icon_size = 64,
  crafting_machine_tint = nil, -- TODO: tint
  category = "space-decontamination",
  always_show_made_in = true,
}})

  type = "recipe",
  name = data_util.mod_prefix .. "used-lifesupport-canister-cleaning-space",
  ingredients = {
    { data_util.mod_prefix .. "used-lifesupport-canister", 1},
    { type = "fluid", name = data_util.mod_prefix .. "space-water", amount = 10},
  },
  results = {
    { data_util.mod_prefix .. "empty-lifesupport-canister", 1},
    { type = "fluid", name = data_util.mod_prefix .. "contaminated-space-water", amount = 10},
    { type = "fluid", name = data_util.mod_prefix .. "contaminated-bio-sludge", amount = 10},
  },
  energy_required = 10,
  localised_name = {"recipe-name."..data_util.mod_prefix .. "used-lifesupport-canister-cleaning-space"},
  main_product = data_util.mod_prefix .. "empty-lifesupport-canister",
  allow_as_intermediate = false,
  category = "space-decontamination",
  icon = "__space-exploration-graphics__/graphics/icons/used-lifesupport-canister.png",
  icon_size = 64, icon_mipmaps = 1,
  enabled = false,
  always_show_made_in = true,
})

data:extend({{
  type = "recipe",
  name = data_util.mod_prefix .. "bio-sludge-decontamination",
  enabled = false,
  energy_required = 5,
  ingredients = {
    { type = "fluid", name = data_util.mod_prefix .."contaminated-bio-sludge", amount = 100 },
  },
  results = {
    { name = data_util.mod_prefix .."contaminated-scrap", amount_min = 1, amount_max = 1, probability = 0.01 },
    { type = "fluid", name = data_util.mod_prefix .."bio-sludge", amount = 99 },
  },
  energy_required = 5,
  allow_as_intermediate = false,
  icon_size = 64,
  crafting_machine_tint = nil, -- TODO: tint
  category = "space-decontamination",
  subgroup = "space-fluids",
  icons = data_util.transition_icons(
    {
      icon = data.raw.fluid[data_util.mod_prefix .. "contaminated-bio-sludge"].icon,
      icon_size = data.raw.fluid[data_util.mod_prefix .. "contaminated-bio-sludge"].icon_size
    },
    {
      icon = data.raw.fluid[data_util.mod_prefix .. "bio-sludge"].icon,
      icon_size = data.raw.fluid[data_util.mod_prefix .. "bio-sludge"].icon_size
    }
  ),
  always_show_made_in = true,
}})

data:extend({{
  type = "recipe",
  name = data_util.mod_prefix .. "space-water-decontamination",
  enabled = false,
  energy_required = 5,
  ingredients = {
    { type = "fluid", name = data_util.mod_prefix .."contaminated-space-water", amount = 100 },
  },
  results = {
    { type = "fluid", name = data_util.mod_prefix .."space-water", amount = 99 },
    { type = "fluid", name = data_util.mod_prefix .."contaminated-bio-sludge", amount = 1 },
    { name = data_util.mod_prefix .."contaminated-scrap", amount_min = 1, amount_max = 1, probability = 0.01 },
  },
  energy_required = 5,
  allow_as_intermediate = false,
  icon_size = 64,
  crafting_machine_tint = nil, -- TODO: tint
  category = "space-decontamination",
  subgroup = "space-fluids",
  icons = data_util.transition_icons(
    {
      icon = data.raw.fluid[data_util.mod_prefix .. "contaminated-space-water"].icon,
      icon_size = data.raw.fluid[data_util.mod_prefix .. "contaminated-space-water"].icon_size
    },
    {
      icon = data.raw.fluid[data_util.mod_prefix .. "space-water"].icon,
      icon_size = data.raw.fluid[data_util.mod_prefix .. "space-water"].icon_size
    }
  ),
  always_show_made_in = true,
}})

  type = "recipe",
  name = data_util.mod_prefix .. "data-storage-substrate-cleaned",
  ingredients = {
    { data_util.mod_prefix .. "data-storage-substrate", 1},
    { type = "fluid", name = data_util.mod_prefix .. "space-water", amount = 5 }
  },
  results = {
    { data_util.mod_prefix .. "data-storage-substrate-cleaned", 1},
    { name = data_util.mod_prefix .. "scrap", amount_min = 1, amount_max = 1, probability = 0.01 },
    { type = "fluid", name = data_util.mod_prefix .. "contaminated-space-water", amount = 5 }
  },
  icons = {
    { icon = data.raw.item[data_util.mod_prefix .. "data-storage-substrate-cleaned"].icon, scale = 1, icon_size = 64  },
    { icon = data.raw.fluid[ data_util.mod_prefix .. "space-water"].icon, scale = 0.6, icon_size = 64, shift = {0,-6}},
  },
  energy_required = 2.5,
  main_product = data_util.mod_prefix .. "data-storage-substrate-cleaned",
  category = "space-decontamination",
  enabled = false,
  always_show_made_in = true,
})

  type = "recipe",
  name = data_util.mod_prefix .. "data-storage-substrate-cleaned-chemical",
  ingredients = {
    { data_util.mod_prefix .. "data-storage-substrate", 1},
    { type = "fluid", name = data_util.mod_prefix .. "chemical-gel", amount = 1 }
  },
  results = {
    { data_util.mod_prefix .. "data-storage-substrate-cleaned", 1},
  },
  icons = {
    { icon = data.raw.item[data_util.mod_prefix .. "data-storage-substrate-cleaned"].icon, scale = 1, icon_size = 64  },
    { icon = data.raw.fluid[ data_util.mod_prefix .. "chemical-gel"].icon, scale = 0.6, icon_size = 64, shift = {0,-6} },
  },
  energy_required = 2.5,
  main_product = data_util.mod_prefix .. "data-storage-substrate-cleaned",
  category = "space-decontamination",
  enabled = false,
  always_show_made_in = true,
})

-- scrap processing
  type = "recipe",
  name = data_util.mod_prefix .. "scrap-decontamination",
  ingredients = {
    { data_util.mod_prefix .. "contaminated-scrap", 20},
    { type = "fluid", name = data_util.mod_prefix .. "space-water", amount = 2},
  },
  results = {
    { name =  data_util.mod_prefix .. "scrap", amount = 20},
    { name = "uranium-ore", amount_min = 1, amount_max = 1, probability = 0.001},
    { type = "fluid", name = data_util.mod_prefix .. "contaminated-space-water", amount = 1},
    { type = "fluid", name = data_util.mod_prefix .. "contaminated-bio-sludge", amount = 1},
  },
  energy_required = 6,
  allow_as_intermediate = false,
  category = "space-decontamination",
  subgroup = "space-components",
  icons = data_util.transition_icons(
    {
      icon = data.raw.item[data_util.mod_prefix .. "contaminated-scrap"].icon,
      icon_size = data.raw.item[data_util.mod_prefix .. "contaminated-scrap"].icon_size
    },
    {
      icon = data.raw.item[data_util.mod_prefix .. "scrap"].icon,
      icon_size = data.raw.item[data_util.mod_prefix .. "scrap"].icon_size
    }
  ),
  enabled = false,
  always_show_made_in = true,
}, false, true)
local data_util = require("data_util")
local make_recipe = data_util.make_recipe

  type = "recipe",
  name = data_util.mod_prefix .. "magnetic-canister",
  ingredients = {
    { data_util.mod_prefix .. "canister", 1},
    { "battery", 1},
    { data_util.mod_prefix .. "superconductive-cable", 1},
  },
  results = {
    { data_util.mod_prefix .. "magnetic-canister", 1},
  },
  energy_required = 10,
  category = "space-electromagnetics",
  enabled = false,
  always_show_made_in = true,
})

  type = "recipe",
  name = data_util.mod_prefix .. "bioelectrics-data",
  ingredients = {
    { name = data_util.mod_prefix .. "significant-specimen", amount = 1},
    { name = data_util.mod_prefix .. "empty-data", amount = 1},
    { type = "fluid", name = data_util.mod_prefix .. "ion-stream", amount = 5},
  },
  results = {
    { name = data_util.mod_prefix .. "bioelectrics-data", amount_min = 1, amount_max = 1, probability = 0.9},
    { name = data_util.mod_prefix .. "junk-data", amount_min = 1, amount_max = 1, probability = 0.09},
  },
  energy_required = 10,
  main_product = data_util.mod_prefix .. "bioelectrics-data",
  category = "space-electromagnetics",
  enabled = false,
  always_show_made_in = true,
})

  type = "recipe",
  name = data_util.mod_prefix .. "conductivity-data",
  ingredients = {
    { name = data_util.mod_prefix .. "empty-data", amount = 1},
    { name = "copper-plate", amount = 4},
    { name = data_util.mod_prefix .. "holmium-plate", amount = 1},
    { name = "electronic-circuit", amount = 2},
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-cold", amount = 10},
  },
  results = {
    { name = data_util.mod_prefix .. "conductivity-data", amount = 1},
    { name = data_util.mod_prefix .. "contaminated-scrap", amount = 1},
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 10},
  },
  energy_required = 10,
  main_product = data_util.mod_prefix .. "conductivity-data",
  category = "space-electromagnetics",
  enabled = false,
  always_show_made_in = true,
})

  type = "recipe",
  name = data_util.mod_prefix .. "superconductivity-data",
  ingredients = {
    { name = data_util.mod_prefix .. "holmium-cable", amount = 2},
    { name = data_util.mod_prefix .. "cryonite-rod", amount = 1},
    { name = data_util.mod_prefix .. "empty-data", amount = 1},
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-supercooled", amount = 10},
  },
  results = {
    { name = data_util.mod_prefix .. "superconductivity-data", amount_min = 1, amount_max = 1, probability = 0.7},
    { name = data_util.mod_prefix .. "junk-data", amount_min = 1, amount_max = 1, probability = 0.29},
    { name = data_util.mod_prefix .. "contaminated-scrap", amount = 1},
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-warm", amount = 10},
  },
  energy_required = 10,
  main_product = data_util.mod_prefix .. "superconductivity-data",
  category = "space-electromagnetics",
  enabled = false,
  always_show_made_in = true,
})

  type = "recipe",
  name = data_util.mod_prefix .. "superconductive-cable",
  ingredients = {
    { name = data_util.mod_prefix .. "holmium-cable", amount = 2},
    { name = data_util.mod_prefix .. "cryonite-rod", amount = 1},
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-supercooled", amount = 10},
  },
  results = {
    { name = data_util.mod_prefix .. "superconductive-cable", amount = 1},
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-warm", amount = 10},
  },
  energy_required = 30,
  main_product = data_util.mod_prefix .. "superconductive-cable",
  category = "space-electromagnetics",
  enabled = false,
  always_show_made_in = true,
})

  type = "recipe",
  name = data_util.mod_prefix .. "forcefield-data",
  ingredients = {
    { name = data_util.mod_prefix .. "polarisation-data", amount = 1},
    { name = data_util.mod_prefix .. "electromagnetic-field-data", amount = 1},
    { name = data_util.mod_prefix .. "holmium-cable", amount = 4},
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-supercooled", amount = 10},
  },
  results = {
    { name = data_util.mod_prefix .. "forcefield-data", amount_min = 1, amount_max = 1, probability = 0.5},
    { name = data_util.mod_prefix .. "empty-data", amount_min = 1, amount_max = 1, probability = 1},
    { name = data_util.mod_prefix .. "junk-data", amount_min = 1, amount_max = 1, probability = 0.49},
    { name = data_util.mod_prefix .. "contaminated-scrap", amount = 1},
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 10},
  },
  energy_required = 10,
  main_product = data_util.mod_prefix .. "forcefield-data",
  category = "space-electromagnetics",
  enabled = false,
  always_show_made_in = true,
})

  type = "recipe",
  name = data_util.mod_prefix .. "neural-anomaly-data",
  ingredients = {
    { name = data_util.mod_prefix .. "empty-data", amount = 1},
    { name = "processing-unit", amount = 1},
    { type = "fluid", name = data_util.mod_prefix .. "neural-gel-2", amount = 20},
  },
  results = {
    { name = data_util.mod_prefix .. "neural-anomaly-data", amount_min = 1, amount_max = 1, probability = 0.5},
    { name = data_util.mod_prefix .. "junk-data", amount_min = 1, amount_max = 1, probability = 0.49},
    { name = "processing-unit", amount_min = 1, amount_max = 1, probability = 0.75},
    { type = "fluid", name = data_util.mod_prefix .. "neural-gel-2", amount = 10},
    { type = "fluid", name = data_util.mod_prefix .. "bio-sludge", amount = 10},
  },
  energy_required = 10,
  main_product = data_util.mod_prefix .. "neural-anomaly-data",
  category = "space-electromagnetics",
  enabled = false,
  always_show_made_in = true,
})

  type = "recipe",
  name = data_util.mod_prefix .. "electromagnetic-field-data",
  ingredients = {
    { name = data_util.mod_prefix .. "empty-data", amount = 1},
    { type = "fluid", name = data_util.mod_prefix .. "ion-stream", amount = 50},
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-cold", amount = 10},
  },
  results = {
    { name = data_util.mod_prefix .. "electromagnetic-field-data", amount_min = 1, amount_max = 1, probability = 0.95},
    { name = data_util.mod_prefix .. "junk-data", amount_min = 1, amount_max = 1, probability = 0.04},
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 10},
  },
  energy_required = 10,
  main_product = data_util.mod_prefix .. "electromagnetic-field-data",
  category = "space-electromagnetics",
  enabled = false,
  always_show_made_in = true,
})

  type = "recipe",
  name = data_util.mod_prefix .. "electrical-shielding-data",
  ingredients = {
    { name = data_util.mod_prefix .. "empty-data", amount = 1 },
    { type = "fluid", name = data_util.mod_prefix .. "ion-stream", amount = 10},
    { name = "plastic-bar", amount = 1 },
    { name = data_util.mod_prefix .. "iridium-plate", amount = 1},
  },
  results = {
    { name = data_util.mod_prefix .. "electrical-shielding-data", amount = 1},
    { name = data_util.mod_prefix .. "contaminated-scrap", amount = 5},
    { name = data_util.mod_prefix .. "iridium-plate", amount_min = 1, amount_max = 1, probability = 0.75 },
  },
  energy_required = 10,
  main_product = data_util.mod_prefix .. "electrical-shielding-data",
  category = "space-electromagnetics",
  enabled = false,
  always_show_made_in = true,
})


  type = "recipe",
  name = data_util.mod_prefix .. "naquium-energy-data",
  ingredients = {
    { name = data_util.mod_prefix .. "naquium-ingot", amount = 4},
    { type = "fluid", name = data_util.mod_prefix .. "ion-stream", amount = 40},
    { name = data_util.mod_prefix .. "empty-data", amount = 1},
  },
  results = {
    { name = data_util.mod_prefix .. "naquium-energy-data", amount = 1},
  },
  energy_required = 8,
  main_product = data_util.mod_prefix .. "naquium-energy-data",
  category = "space-electromagnetics",
  enabled = false,
  always_show_made_in = true,
})


data_util.  type = "recipe",
  name =  data_util.mod_prefix .. "railgun",
  ingredients = {
    { "plastic-bar", 10},
    { data_util.mod_prefix .. "heavy-girder", 10},
    { type = "fluid", name = data_util.mod_prefix .. "ion-stream", amount = 10},
    { "copper-cable", 1000},
  },
  results = {
    {  data_util.mod_prefix .. "railgun", 1},
  },
  energy_required = 30,
  category = "space-electromagnetics",
  enabled = false,
  always_show_made_in = true,
})

data_util.  type = "recipe",
  name =  data_util.mod_prefix .. "railgun-ammo",
  ingredients = {
    { data_util.mod_prefix .. "heavy-girder", 1},
    { "battery", 10},
  },
  results = {
    {  data_util.mod_prefix .. "railgun-ammo", 1},
  },
  energy_required = 10,
  category = "space-electromagnetics",
  enabled = false,
  always_show_made_in = true,
})

data_util.  type = "recipe",
  name = data_util.mod_prefix .. "tesla-gun",
  ingredients = {
    { "plastic-bar", 10},
    { data_util.mod_prefix .. "holmium-plate", 10},
    { data_util.mod_prefix .. "holmium-cable", 10},
    { type = "fluid", name = data_util.mod_prefix .. "ion-stream", amount = 10},
  },
  results = {
    { data_util.mod_prefix .. "tesla-gun", 1},
  },
  energy_required = 60,
  category = "space-electromagnetics",
  enabled = false,
})
data_util.  type = "recipe",
  name = data_util.mod_prefix .. "tesla-ammo",
  ingredients = {
    { "battery", 10},
    { data_util.mod_prefix .. "holmium-plate", 1},
  },
  results = {
    { data_util.mod_prefix .. "tesla-ammo", 1},
  },
  energy_required = 10,
  category = "space-electromagnetics",
  enabled = false,
  always_show_made_in = true,
})
local data_util = require("data_util")
local make_recipe = data_util.make_recipe

data:extend({
  --[[{
    type = "recipe",
    name = data_util.mod_prefix .. "gate-addon",
    icon = "__space-exploration-graphics__/graphics/icons/scaffold.png",
    icon_size = 64,
    ingredients = {
      { data_util.mod_prefix .. "space-pipe", 1000},
      { "battery", 1000},
      { data_util.mod_prefix .. "superconductive-cable", 1000},
    },
    results = {},
    energy_required = 1,
    category = "fixed-recipe",
    subgroup = "ancient",
    order = "z",
    enabled = true,
    always_show_made_in = false,
    flags = {"hidden"}
  },]]--
  {
    type = "recipe",
    name = data_util.mod_prefix .. "gate-platform",
    icon = "__space-exploration-graphics__/graphics/icons/scaffold.png",
    icon_size = 64,
    ingredients = {
      { data_util.mod_prefix .. "space-pipe", 100},
      { "battery", 100},
      { data_util.mod_prefix .. "superconductive-cable", 100},
      { data_util.mod_prefix .. "naquium-processor", 9},
    },
    results = {},
    energy_required = 1,
    category = "fixed-recipe",
    subgroup = "ancient",
    order = "z",
    enabled = true,
    always_show_made_in = false,
    hidden = true,
  }
})
local data_util = require("data_util")
local make_recipe = data_util.make_recipe

  type = "recipe",
  name = data_util.mod_prefix .. "comparative-genetic-data",
  ingredients = {
    { name = data_util.mod_prefix .. "significant-specimen", amount = 1},
    { name = data_util.mod_prefix .. "specimen", amount = 1},
    { name = data_util.mod_prefix .. "empty-data", amount = 1},
  },
  results = {
    { name = data_util.mod_prefix .. "comparative-genetic-data", amount = 1},
    { type="fluid", name = data_util.mod_prefix .. "bio-sludge", amount = 20},
  },
  energy_required = 2,
  main_product = data_util.mod_prefix .. "comparative-genetic-data",
  category = "space-genetics",
  enabled = false,
  always_show_made_in = true,
})

  type = "recipe",
  name = data_util.mod_prefix .. "experimental-bioculture",
  ingredients = {
    { name = data_util.mod_prefix .. "experimental-genetic-data", amount = 1},
    { name = data_util.mod_prefix .. "nutrient-vat", amount = 1},
    { name = data_util.mod_prefix .. "vitamelange-extract", amount = 1},
    { type="fluid", name = data_util.mod_prefix .. "bio-sludge", amount = 10},
  },
  results = {
    { name = data_util.mod_prefix .. "experimental-bioculture", amount = 1},
    { name = data_util.mod_prefix .. "junk-data", amount = 1},
  },
  energy_required = 3,
  main_product = data_util.mod_prefix .. "experimental-bioculture",
  category = "space-genetics",
  enabled = false,
  always_show_made_in = true,
})

  type = "recipe",
  name = data_util.mod_prefix .. "experimental-genetic-data",
  ingredients = {
    { name = data_util.mod_prefix .. "genetic-data", amount = 1},
    { name = data_util.mod_prefix .. "biochemical-data", amount = 1},
  },
  results = {
    { name = data_util.mod_prefix .. "experimental-genetic-data", amount = 2},
  },
  energy_required = 3,
  main_product = data_util.mod_prefix .. "experimental-genetic-data",
  category = "space-genetics",
  enabled = false,
  always_show_made_in = true,
})

  type = "recipe",
  name = data_util.mod_prefix .. "bioculture",
  ingredients = {
    { name = data_util.mod_prefix .. "genetic-data", amount = 10},
    { name = data_util.mod_prefix .. "nutrient-vat", amount = 10},
    { name = data_util.mod_prefix .. "vitamelange-spice", amount = 5},
    { type="fluid", name = data_util.mod_prefix .. "bio-sludge", amount = 50},
  },
  results = {
    { name = data_util.mod_prefix .. "bioculture", amount = 10},
    { name = data_util.mod_prefix .. "genetic-data", amount = 9},
    { name = data_util.mod_prefix .. "junk-data", amount = 1},
  },
  energy_required = 5,
  main_product = data_util.mod_prefix .. "bioculture",
  category = "space-genetics",
  enabled = false,
  always_show_made_in = true,
})

  type = "recipe",
  name = data_util.mod_prefix .. "genetic-data",
  ingredients = {
    { name = data_util.mod_prefix .. "empty-data", amount = 1},
    { type="fluid", name = data_util.mod_prefix .. "bio-sludge", amount = 10},
  },
  results = {
    { name = data_util.mod_prefix .. "genetic-data", amount = 1},
    { type="fluid", name = data_util.mod_prefix .. "contaminated-space-water", amount = 9},
  },
  energy_required = 1,
  main_product = data_util.mod_prefix .. "genetic-data",
  category = "space-genetics",
  enabled = false,
  always_show_made_in = true,
})

  type = "recipe",
  name = data_util.mod_prefix .. "significant-specimen",
  ingredients = {
    { name = data_util.mod_prefix .. "experimental-specimen", amount = 1},
    { type = "fluid", name = data_util.mod_prefix .. "neural-gel", amount = 1},
    { name = data_util.mod_prefix .. "vitalic-reagent", amount = 1},
  },
  results = {
    { name = data_util.mod_prefix .. "significant-specimen", amount_min = 1, amount_max = 1, probability = 0.3},
    { name = data_util.mod_prefix .. "experimental-specimen", amount_min = 1, amount_max = 1, probability = 0.6},
    { type="fluid", name = data_util.mod_prefix .. "bio-sludge", amount_min = 1, amount_max = 5, probability = 1},
  },
  energy_required = 1,
  main_product = data_util.mod_prefix .. "significant-specimen",
  category = "space-genetics",
  enabled = false,
  always_show_made_in = true,
})
local data_util = require("data_util")
local make_recipe = data_util.make_recipe

  type = "recipe",
  name = data_util.mod_prefix .. "darkmatter-data",
  ingredients = {
    { data_util.mod_prefix .. "gravitational-lensing-data", 1 },
    { data_util.mod_prefix .. "negative-pressure-data", 1 },
  },
  results = {
    { name = data_util.mod_prefix .. "darkmatter-data", amount_min = 1, amount_max = 1, probability = 0.6 },
    { data_util.mod_prefix .. "junk-data", 1 },
    { name = data_util.mod_prefix .. "broken-data", amount_min = 1, amount_max = 1, probability = 0.39 },
  },
  energy_required = 20,
  main_product = data_util.mod_prefix .. "darkmatter-data",
  icon = "__space-exploration-graphics__/graphics/icons/data/darkmatter.png",
  icon_size = 64,
  category = "space-gravimetrics",
  enabled = false,
  always_show_made_in = true,
})

  type = "recipe",
  name = data_util.mod_prefix .. "gravitational-lensing-data",
  ingredients = {
    { data_util.mod_prefix .. "astrometric-data", 1 },
  },
  results = {
    { name = data_util.mod_prefix .. "gravitational-lensing-data", amount_min = 1, amount_max = 1, probability = 0.95 },
    { name = data_util.mod_prefix .. "junk-data", amount_min = 1, amount_max = 1, probability = 0.04},
  },
  energy_required = 20,
  main_product = data_util.mod_prefix .. "gravitational-lensing-data",
  icon = "__space-exploration-graphics__/graphics/icons/data/gravitational-lensing.png",
  icon_size = 64,
  category = "space-gravimetrics",
  enabled = false,
  always_show_made_in = true,
})

  type = "recipe",
  name = data_util.mod_prefix .. "timespace-anomaly-data",
  ingredients = {
    { data_util.mod_prefix .. "gravitational-lensing-data", 1 },
    { data_util.mod_prefix .. "micro-black-hole-data", 1 },
    { data_util.mod_prefix .. "negative-pressure-data", 1 },
    { data_util.mod_prefix .. "zero-point-energy-data", 1 },
    { data_util.mod_prefix .. "naquium-cube", 1 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-supercooled", amount = 10},
  },
  results = {
    { name = data_util.mod_prefix .. "timespace-anomaly-data", amount_min = 1, amount_max = 1, probability = 0.6 },
    { name = data_util.mod_prefix .. "gravitational-lensing-data", amount_min = 1, amount_max = 1, probability = 0.6 },
    { name = data_util.mod_prefix .. "micro-black-hole-data", amount_min = 1, amount_max = 1, probability = 0.6 },
    { name = data_util.mod_prefix .. "negative-pressure-data", amount_min = 1, amount_max = 1, probability = 0.6 },
    { name = data_util.mod_prefix .. "zero-point-energy-data", amount_min = 1, amount_max = 1, probability = 0.6 },
    { name = data_util.mod_prefix .. "empty-data", amount_min = 1, amount_max = 1, probability = 0.6 },
    { name = data_util.mod_prefix .. "junk-data", amount_min = 1, amount_max = 1, probability = 0.6 },
    { name = data_util.mod_prefix .. "broken-data", amount_min = 1, amount_max = 1, probability = 0.6 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 10},
  },
  energy_required = 30,
  main_product = data_util.mod_prefix .. "timespace-anomaly-data",
  icon = "__space-exploration-graphics__/graphics/icons/data/timespace-anomaly.png",
  icon_size = 64,
  category = "space-gravimetrics",
  enabled = false,
  always_show_made_in = true,
})

  type = "recipe",
  name = data_util.mod_prefix .. "dark-energy-data",
  ingredients = {
    { name = data_util.mod_prefix .. "negative-pressure-data", amount = 1},
    { name = data_util.mod_prefix .. "astrometric-data", amount = 1},
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-supercooled", amount = 10},
  },
  results = {
    { name = data_util.mod_prefix .. "dark-energy-data", amount_min = 1, amount_max = 1, probability = 0.75},
    { name = data_util.mod_prefix .. "empty-data", amount = 1},
    { name = data_util.mod_prefix .. "junk-data", amount_min = 1, amount_max = 1, probability = 0.24},
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 10},
  },
  energy_required = 30,
  main_product = data_util.mod_prefix .. "dark-energy-data",
  category = "space-gravimetrics",
  enabled = false,
  always_show_made_in = true,
})



  type = "recipe",
  name = data_util.mod_prefix .. "space-fold-data",
  ingredients = {
    { name = data_util.mod_prefix .. "significant-data", amount = 1 },
    { name = data_util.mod_prefix .. "naquium-plate", amount = 1 },
    { name = data_util.mod_prefix .. "arcosphere-a", amount = 1},
    { name = data_util.mod_prefix .. "arcosphere-b", amount = 1},
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-supercooled", amount = 10},
  },
  results = {
    { name = data_util.mod_prefix .. "space-fold-data", amount = 1 },
    { name = data_util.mod_prefix .. "arcosphere-c", amount = 1},
    { name = data_util.mod_prefix .. "arcosphere-d", amount = 1},
    { name = data_util.mod_prefix .. "arcosphere-e", amount = 0},
    { name = data_util.mod_prefix .. "arcosphere-f", amount = 0},
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 10},
  },
  energy_required = 20,
  main_product = data_util.mod_prefix .. "space-fold-data",
  category = "arcosphere",
  enabled = false,
  always_show_made_in = true,
  localised_description = {"space-exploration.arcosphere-random"}
})
  type = "recipe",
  name = data_util.mod_prefix .. "space-fold-data-alt",
  ingredients = {
    { name = data_util.mod_prefix .. "significant-data", amount = 1 },
    { name = data_util.mod_prefix .. "naquium-plate", amount = 1 },
    { name = data_util.mod_prefix .. "arcosphere-a", amount = 1},
    { name = data_util.mod_prefix .. "arcosphere-b", amount = 1},
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-supercooled", amount = 10},
  },
  results = {
    { name = data_util.mod_prefix .. "space-fold-data", amount = 1 },
    { name = data_util.mod_prefix .. "arcosphere-c", amount = 0},
    { name = data_util.mod_prefix .. "arcosphere-d", amount = 0},
    { name = data_util.mod_prefix .. "arcosphere-e", amount = 1},
    { name = data_util.mod_prefix .. "arcosphere-f", amount = 1},
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 10},
  },
  energy_required = 20,
  main_product = data_util.mod_prefix .. "space-fold-data",
  category = "arcosphere",
  enabled = false,
  always_show_made_in = true,
  localised_description = {"space-exploration.arcosphere-random"}
})

  type = "recipe",
  name = data_util.mod_prefix .. "space-warp-data",
  ingredients = {
    { name = data_util.mod_prefix .. "significant-data", amount = 1 },
    { name = data_util.mod_prefix .. "naquium-plate", amount = 1 },
    { name = data_util.mod_prefix .. "arcosphere-e", amount = 1},
    { name = data_util.mod_prefix .. "arcosphere-f", amount = 1},
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-supercooled", amount = 10},
  },
  results = {
    { name = data_util.mod_prefix .. "space-warp-data", amount = 1 },
    { name = data_util.mod_prefix .. "arcosphere-c", amount = 1},
    { name = data_util.mod_prefix .. "arcosphere-d", amount = 1},
    { name = data_util.mod_prefix .. "arcosphere-h", amount = 0},
    { name = data_util.mod_prefix .. "arcosphere-g", amount = 0},
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 10},
  },
  energy_required = 20,
  main_product = data_util.mod_prefix .. "space-warp-data",
  category = "arcosphere",
  enabled = false,
  always_show_made_in = true,
  localised_description = {"space-exploration.arcosphere-random"}
})
  type = "recipe",
  name = data_util.mod_prefix .. "space-warp-data-alt",
  ingredients = {
    { name = data_util.mod_prefix .. "significant-data", amount = 1 },
    { name = data_util.mod_prefix .. "naquium-plate", amount = 1 },
    { name = data_util.mod_prefix .. "arcosphere-e", amount = 1},
    { name = data_util.mod_prefix .. "arcosphere-f", amount = 1},
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-supercooled", amount = 10},
  },
  results = {
    { name = data_util.mod_prefix .. "space-warp-data", amount = 1 },
    { name = data_util.mod_prefix .. "arcosphere-c", amount = 0},
    { name = data_util.mod_prefix .. "arcosphere-d", amount = 0},
    { name = data_util.mod_prefix .. "arcosphere-h", amount = 1},
    { name = data_util.mod_prefix .. "arcosphere-g", amount = 1},
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 10},
  },
  energy_required = 20,
  main_product = data_util.mod_prefix .. "space-warp-data",
  category = "arcosphere",
  enabled = false,
  always_show_made_in = true,
  localised_description = {"space-exploration.arcosphere-random"}
})

  type = "recipe",
  name = data_util.mod_prefix .. "space-dialation-data",
  ingredients = {
    { name = data_util.mod_prefix .. "significant-data", amount = 1 },
    { name = data_util.mod_prefix .. "naquium-plate", amount = 1 },
    { name = data_util.mod_prefix .. "arcosphere-c", amount = 1},
    { name = data_util.mod_prefix .. "arcosphere-h", amount = 1},
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-supercooled", amount = 10},
  },
  results = {
    { name = data_util.mod_prefix .. "space-dialation-data", amount = 1 },
    { name = data_util.mod_prefix .. "arcosphere-a", amount = 2},
    { name = data_util.mod_prefix .. "arcosphere-f", amount = 0},
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 10},
  },
  energy_required = 20,
  main_product = data_util.mod_prefix .. "space-dialation-data",
  category = "arcosphere",
  enabled = false,
  always_show_made_in = true,
  localised_description = {"space-exploration.arcosphere-random"}
})
  type = "recipe",
  name = data_util.mod_prefix .. "space-dialation-data-alt",
  ingredients = {
    { name = data_util.mod_prefix .. "significant-data", amount = 1 },
    { name = data_util.mod_prefix .. "naquium-plate", amount = 1 },
    { name = data_util.mod_prefix .. "arcosphere-c", amount = 1},
    { name = data_util.mod_prefix .. "arcosphere-h", amount = 1},
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-supercooled", amount = 10},
  },
  results = {
    { name = data_util.mod_prefix .. "space-dialation-data", amount = 1 },
    { name = data_util.mod_prefix .. "arcosphere-a", amount = 0},
    { name = data_util.mod_prefix .. "arcosphere-f", amount = 2},
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 10},
  },
  energy_required = 20,
  main_product = data_util.mod_prefix .. "space-dialation-data",
  category = "arcosphere",
  enabled = false,
  always_show_made_in = true,
  localised_description = {"space-exploration.arcosphere-random"}
})

  type = "recipe",
  name = data_util.mod_prefix .. "space-injection-data",
  ingredients = {
    { name = data_util.mod_prefix .. "significant-data", amount = 1 },
    { name = data_util.mod_prefix .. "naquium-plate", amount = 1 },
    { name = data_util.mod_prefix .. "arcosphere-d", amount = 1},
    { name = data_util.mod_prefix .. "arcosphere-g", amount = 1},
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-supercooled", amount = 10},
  },
  results = {
    { name = data_util.mod_prefix .. "space-injection-data", amount = 1 },
    { name = data_util.mod_prefix .. "arcosphere-e", amount = 2},
    { name = data_util.mod_prefix .. "arcosphere-c", amount = 0},
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 10},
  },
  energy_required = 20,
  main_product = data_util.mod_prefix .. "space-injection-data",
  category = "arcosphere",
  enabled = false,
  always_show_made_in = true,
  localised_description = {"space-exploration.arcosphere-random"}
})
  type = "recipe",
  name = data_util.mod_prefix .. "space-injection-data-alt",
  ingredients = {
    { name = data_util.mod_prefix .. "significant-data", amount = 1 },
    { name = data_util.mod_prefix .. "naquium-plate", amount = 1 },
    { name = data_util.mod_prefix .. "arcosphere-d", amount = 1},
    { name = data_util.mod_prefix .. "arcosphere-g", amount = 1},
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-supercooled", amount = 10},
  },
  results = {
    { name = data_util.mod_prefix .. "space-injection-data", amount = 1 },
    { name = data_util.mod_prefix .. "arcosphere-e", amount = 0},
    { name = data_util.mod_prefix .. "arcosphere-c", amount = 2},
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 10},
  },
  energy_required = 20,
  main_product = data_util.mod_prefix .. "space-injection-data",
  category = "arcosphere",
  enabled = false,
  always_show_made_in = true,
  localised_description = {"space-exploration.arcosphere-random"}
})


  type = "recipe",
  name = data_util.mod_prefix .. "wormhole-data",
  ingredients = {
    { name = data_util.mod_prefix .. "empty-data", amount = 1 },
    { name = data_util.mod_prefix .. "arcosphere-a", amount = 1},
    { name = data_util.mod_prefix .. "arcosphere-c", amount = 1},
    { name = data_util.mod_prefix .. "arcosphere-e", amount = 1},
    { name = data_util.mod_prefix .. "arcosphere-g", amount = 1},
    { name = data_util.mod_prefix .. "naquium-cube", amount = 1},
    { name = data_util.mod_prefix .. "cryonite-rod", amount = 1},
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-supercooled", amount = 10},
  },
  results = {
    { name = data_util.mod_prefix .. "wormhole-data", amount = 1},
    { name = data_util.mod_prefix .. "arcosphere-b", amount = 1},
    { name = data_util.mod_prefix .. "arcosphere-d", amount = 1},
    { name = data_util.mod_prefix .. "arcosphere-f", amount = 1},
    { name = data_util.mod_prefix .. "arcosphere-h", amount = 1},
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-warm", amount = 10},
  },
  energy_required = 10,
  main_product = data_util.mod_prefix .. "wormhole-data",
  category = "arcosphere",
  enabled = false,
  always_show_made_in = true,
})
local data_util = require("data_util")
local make_recipe = data_util.make_recipe

  type = "recipe",
  name = data_util.mod_prefix .. "neural-gel",
  ingredients = {
    { name = data_util.mod_prefix .. "specimen", amount = 1 },
    { type = "fluid", name = data_util.mod_prefix .. "nutrient-gel", amount = 10 }
  },
  results = {
    { type = "fluid", name = data_util.mod_prefix .. "neural-gel", amount = 10 },
    { type = "fluid", name = data_util.mod_prefix .. "bio-sludge", amount = 10 },
  },
  energy_required = 20,
  main_product = data_util.mod_prefix .. "neural-gel",
  category = "space-growth",
  subgroup = "space-bioculture",
  enabled = false,
  always_show_made_in = true,
})

  type = "recipe",
  name = data_util.mod_prefix .. "neural-gel-2",
  ingredients = {
    { name = data_util.mod_prefix .. "significant-specimen", amount = 1 },
    { type = "fluid", name = data_util.mod_prefix .. "neural-gel", amount = 100 },
    { type = "fluid", name = data_util.mod_prefix .. "nutrient-gel", amount = 100 },
    { name = data_util.mod_prefix .. "bioelectrics-data", amount = 1 },

  },
  results = {
    { type = "fluid", name = data_util.mod_prefix .. "neural-gel-2", amount = 100 },
    { data_util.mod_prefix .. "junk-data", 1 },
    { type = "fluid", name = data_util.mod_prefix .. "bio-sludge", amount = 100 },
  },
  energy_required = 50,
  main_product = data_util.mod_prefix .. "neural-gel-2",
  category = "space-growth",
  subgroup = "space-bioculture",
  enabled = false,
  always_show_made_in = true,
})

  type = "recipe",
  name = data_util.mod_prefix .. "specimen",
  ingredients = {
    { name = data_util.mod_prefix .. "bioculture", amount = 10 },
    { type = "fluid", name = data_util.mod_prefix .. "nutrient-gel", amount = 100 },
  },
  results = {
    { name = data_util.mod_prefix .. "specimen", amount = 10 },
    { type = "fluid", name = data_util.mod_prefix .. "contaminated-bio-sludge", amount = 30 },
    { type = "fluid", name = data_util.mod_prefix .. "contaminated-space-water", amount = 20 },
  },
  energy_required = 80,
  main_product = data_util.mod_prefix .. "specimen",
  category = "space-growth",
  enabled = false,
  always_show_made_in = true,
})

  type = "recipe",
  name = data_util.mod_prefix .. "experimental-specimen",
  ingredients = {
    { name = data_util.mod_prefix .. "experimental-bioculture", amount = 10 },
    { type = "fluid", name = data_util.mod_prefix .. "nutrient-gel", amount = 100 },
  },
  results = {
    { name = data_util.mod_prefix .. "experimental-specimen", amount_min = 5, amount_max = 10, probability = 1 },
    { name = data_util.mod_prefix .. "specimen", amount_min = 0, amount_max = 5, probability = 1 },
    { type = "fluid", name = data_util.mod_prefix .. "contaminated-bio-sludge", amount = 30 },
    { type = "fluid", name = data_util.mod_prefix .. "contaminated-space-water", amount = 20 },
  },
  energy_required = 80,
  main_product = data_util.mod_prefix .. "experimental-specimen",
  category = "space-growth",
  enabled = false,
  always_show_made_in = true,
})

  type = "recipe",
  name = data_util.mod_prefix .. "specimen-fish",
  ingredients = {
    { name = data_util.mod_prefix .. "bioculture", amount = 10 },
    { type = "fluid", name = data_util.mod_prefix .. "nutrient-gel", amount = 100 },
  },
  results = {
    { name = "raw-fish", amount = 10 },
    { type = "fluid", name = data_util.mod_prefix .. "contaminated-bio-sludge", amount = 50 },
    { type = "fluid", name = data_util.mod_prefix .. "contaminated-space-water", amount = 50 },
  },
  energy_required = 80,
  category = "space-growth",
  subgroup = "space-bioculture",
  icons = {
    { icon = "__space-exploration-graphics__/graphics/blank.png", scale = 1, icon_size = 64 },
    { icon = data.raw.item[data_util.mod_prefix .. "bioculture"].icon, scale = 0.75, shift = {16, -16}, icon_size = 64 },
    { icon = data.raw.capsule["raw-fish"].icon, scale = 0.75, shift = {-16, 16}, icon_size = 64 },
  },
  enabled = false,
  allow_as_intermediate = false,
  always_show_made_in = true,
})

  type = "recipe",
  name = data_util.mod_prefix .. "specimen-wood",
  ingredients = {
    { name = data_util.mod_prefix .. "bioculture", amount = 10 },
    { type = "fluid", name = data_util.mod_prefix .. "nutrient-gel", amount = 100 },
  },
  results = {
    { name = "wood", amount = 100 },
    { type = "fluid", name = data_util.mod_prefix .. "contaminated-space-water", amount = 125 },
  },
  energy_required = 80,
  category = "space-growth",
  subgroup = "space-bioculture",
  icons = {
    { icon = "__space-exploration-graphics__/graphics/blank.png", scale = 1, icon_size = 64 },
    { icon = data.raw.item[data_util.mod_prefix .. "bioculture"].icon, scale = 0.75, shift = {16, -16}, icon_size = 64 },
    { icon = data.raw.item["wood"].icon, scale = 0.75, shift = {-16, 16}, icon_size = 64 },
  },
  enabled = false,
  allow_as_intermediate = false,
  always_show_made_in = true,
})

  type = "recipe",
  name = data_util.mod_prefix .. "bio-methane-to-crude-oil",
  ingredients = {
    { type = "fluid", name = data_util.mod_prefix .. "bio-sludge", amount = 100 },
    { type = "fluid", name = data_util.mod_prefix .. "methane-gas", amount = 1000 },
  },
  results = {
    { type = "fluid", name = data_util.mod_prefix .. "bio-sludge", amount = 80 },
    { type = "fluid", name = data_util.mod_prefix .. "contaminated-bio-sludge", amount = 10 },
    { type = "fluid", name = "crude-oil", amount = 1000 },
  },
  energy_required = 10,
  category = "space-growth",
  subgroup = "space-bioculture",
  icon = data.raw.fluid["crude-oil"].icon,
  icon_size = data.raw.fluid["crude-oil"].icon_size,
  enabled = false,
  allow_as_intermediate = false,
  always_show_made_in = true,
})
local data_util = require("data_util")
local make_recipe = data_util.make_recipe

  type = "recipe",
  name = data_util.mod_prefix .. "space-coolant",
  ingredients = {
    { type = "fluid", name = data_util.mod_prefix .. "space-water", amount = 1},
    { type = "fluid", name = "heavy-oil", amount = 20},
    { name = "copper-plate", amount = 2},
    { name = "iron-plate", amount = 1},
    { name = "sulfur", amount = 1},
  },
  results = {
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 10},
  },
  energy_required = 5,
  subgroup = "space-cooling",
  category = "space-manufacturing",
  localised_name = {"fluid-name." .. data_util.mod_prefix .. "space-coolant"},
  always_show_made_in = true,
  order = "a-a",
})

  type = "recipe",
  name = data_util.mod_prefix .. "space-coolant-cryonite",
  ingredients = {
    { type = "fluid", name = data_util.mod_prefix .. "space-water", amount = 5},
    { type = "fluid", name = "heavy-oil", amount = 5},
    { name = data_util.mod_prefix .. "cryonite-rod", amount = 1},
  },
  results = {
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 10},
  },
  energy_required = 5,
  subgroup = "space-cooling",
  category = "space-manufacturing",
  localised_name = {"fluid-name." .. data_util.mod_prefix .. "space-coolant"},
  always_show_made_in = true,
  order = "a-a",
})

  type = "recipe",
  name = data_util.mod_prefix .. "space-coolant-cold",
  ingredients = {
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-warm", amount = 10},
  },
  results = {
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-cold", amount = 5},
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 5},
  },
  energy_required = 1,
  subgroup = "space-cooling",
  category = "space-hypercooling",
  localised_name = {"recipe-name." .. data_util.mod_prefix .. "space-coolant-cold"},
  enabled = false,
  always_show_made_in = true,
  order = "c-a",
})


  type = "recipe",
  name = data_util.mod_prefix .. "space-coolant-supercooled",
  ingredients = {
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-cold", amount = 10},
  },
  results = {
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-supercooled", amount = 5},
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 5},
  },
  energy_required = 2,
  subgroup = "space-cooling",
  category = "space-hypercooling",
  localised_name = {"recipe-name." .. data_util.mod_prefix .. "space-coolant-supercooled"},
  enabled = false,
  always_show_made_in = true,
  order = "d-a",
})

  type = "recipe",
  name = data_util.mod_prefix .. "space-coolant-cold-cryonite",
  ingredients = {
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-warm", amount = 20},
    { type = "fluid", name = data_util.mod_prefix .. "cryonite-slush", amount = 1},
  },
  results = {
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-cold", amount = 15},
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 5},
  },
  energy_required = 1,
  subgroup = "space-cooling",
  category = "space-hypercooling",
  localised_name = {"recipe-name." .. data_util.mod_prefix .. "space-coolant-cold-cryonite"},
  enabled = false,
  always_show_made_in = true,
  order = "c-a",
})


  type = "recipe",
  name = data_util.mod_prefix .. "space-coolant-supercooled-cryonite",
  ingredients = {
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-cold", amount = 15},
    { type = "fluid", name = data_util.mod_prefix .. "cryonite-slush", amount = 1},
  },
  results = {
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-supercooled", amount = 10},
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 5},
  },
  energy_required = 1,
  subgroup = "space-cooling",
  category = "space-hypercooling",
  localised_name = {"recipe-name." .. data_util.mod_prefix .. "space-coolant-supercooled-cryonite"},
  enabled = false,
  always_show_made_in = true,
  order = "d-a",
})
local data_util = require("data_util")
local make_recipe = data_util.make_recipe

--[[
  type = "recipe",
  name = data_util.mod_prefix .. "doppler-shift-data",
  ingredients = {
    { name = data_util.mod_prefix .. "empty-data", amount = 1},
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-cold", amount = 50},
  },
  results = {
    { name = data_util.mod_prefix .. "doppler-shift-data", amount = 1},
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 50},
  },
  energy_required = 2,
  main_product = data_util.mod_prefix .. "doppler-shift-data",
  category = "space-laser",
  enabled = false,
  always_show_made_in = true,
})]]

  type = "recipe",
  name = data_util.mod_prefix .. "gravity-wave-data",
  ingredients = {
    { name = data_util.mod_prefix .. "astrometric-data", amount = 1},
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-supercooled", amount = 10},
  },
  results = {
    { name = data_util.mod_prefix .. "gravity-wave-data", amount_min = 1, amount_max = 1, probability = 0.3},
    { name = data_util.mod_prefix .. "junk-data", amount_min = 1, amount_max = 1, probability = 0.69},
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-warm", amount = 10},
  },
  energy_required = 2,
  main_product = data_util.mod_prefix .. "gravity-wave-data",
  category = "space-laser",
  enabled = false,
  always_show_made_in = true,
})


  type = "recipe",
  name = data_util.mod_prefix .. "negative-pressure-data",
  ingredients = {
    { name = data_util.mod_prefix .. "astrometric-data", amount = 1},
    { name = data_util.mod_prefix .. "aeroframe-scaffold", amount = 1},
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-supercooled", amount = 10},
  },
  results = {
    { name = data_util.mod_prefix .. "negative-pressure-data", amount_min = 1, amount_max = 1, probability = 0.9},
    { name = data_util.mod_prefix .. "junk-data", amount_min = 1, amount_max = 1, probability = 0.09},
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 10},
  },
  energy_required = 10,
  main_product = data_util.mod_prefix .. "negative-pressure-data",
  category = "space-laser",
  enabled = false,
  always_show_made_in = true,
})

  type = "recipe",
  name = data_util.mod_prefix .. "polarisation-data",
  ingredients = {
    { name = data_util.mod_prefix .. "empty-data", amount = 10},
    { name = data_util.mod_prefix .. "space-mirror", amount = 2},
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-cold", amount = 10},
  },
  results = {
    { name = data_util.mod_prefix .. "polarisation-data", amount = 9},
    { name = data_util.mod_prefix .. "junk-data", amount = 1},
    { name = data_util.mod_prefix .. "scrap", amount = 2},
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-warm", amount = 10},
  },
  energy_required = 60,
  main_product = data_util.mod_prefix .. "polarisation-data",
  category = "space-laser",
  enabled = false,
  always_show_made_in = true,
})

  type = "recipe",
  name = data_util.mod_prefix .. "quantum-phenomenon-data",
  ingredients = {
    { name = data_util.mod_prefix .. "empty-data", amount = 1},
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-cold", amount = 10},
  },
  results = {
    { name = data_util.mod_prefix .. "quantum-phenomenon-data", amount_min = 1, amount_max = 1, probability = 0.5},
    { name = data_util.mod_prefix .. "junk-data", amount_min = 1, amount_max = 1, probability = 0.49},
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 10},
  },
  energy_required = 10,
  main_product = data_util.mod_prefix .. "quantum-phenomenon-data",
  category = "space-laser",
  enabled = false,
  always_show_made_in = true,
})

  type = "recipe",
  name = data_util.mod_prefix .. "zero-point-energy-data",
  ingredients = {
    { name = data_util.mod_prefix .. "negative-pressure-data", amount = 1},
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-supercooled", amount = 10},
  },
  results = {
    { name = data_util.mod_prefix .. "zero-point-energy-data", amount_min = 1, amount_max = 1, probability = 0.4},
    { name = data_util.mod_prefix .. "negative-pressure-data", amount_min = 1, amount_max = 1, probability = 0.4},
    { name = data_util.mod_prefix .. "junk-data", amount_min = 1, amount_max = 1, probability = 0.19},
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-warm", amount = 10},
  },
  energy_required = 10,
  main_product = data_util.mod_prefix .. "zero-point-energy-data",
  category = "space-laser",
  enabled = false,
  always_show_made_in = true,
})

  type = "recipe",
  name = data_util.mod_prefix .. "laser-shielding-data",
  ingredients = {
    { name = data_util.mod_prefix .. "empty-data", amount = 1 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-supercooled", amount = 10},
    { name = data_util.mod_prefix .. "material-testing-pack", amount = 1 },
    { name = data_util.mod_prefix .. "iridium-plate", amount = 1},
  },
  results = {
    { name = data_util.mod_prefix .. "laser-shielding-data", amount = 1},
    { name = data_util.mod_prefix .. "contaminated-scrap", amount = 5},
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 10},
    { name = data_util.mod_prefix .. "iridium-plate", amount_min = 1, amount_max = 1, probability = 0.5 },
  },
  energy_required = 5,
  main_product = data_util.mod_prefix .. "laser-shielding-data",
  category = "space-laser",
  enabled = false,
  always_show_made_in = true,
})

  type = "recipe",
  name = data_util.mod_prefix .. "teleportation-data",
  ingredients = {
    { name = data_util.mod_prefix .. "empty-data", amount = 2 },
    { name = data_util.mod_prefix .. "singularity-data", amount = 1},
    { name = data_util.mod_prefix .. "timespace-anomaly-data", amount = 1},
    { name = data_util.mod_prefix .. "naquium-cube", amount = 2},
    { name = data_util.mod_prefix .. "cryonite-rod", amount = 5},
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-supercooled", amount = 10},
  },
  results = {
    { name = data_util.mod_prefix .. "teleportation-data", amount = 4},
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-warm", amount = 10},
  },
  energy_required = 40,
  main_product = data_util.mod_prefix .. "teleportation-data",
  category = "space-laser",
  enabled = false,
  always_show_made_in = true,
})

  type = "recipe",
  name = data_util.mod_prefix .. "hyperlattice-data",
  ingredients = {
    { name = data_util.mod_prefix .. "empty-data", amount = 6 },
    { name = data_util.mod_prefix .. "nanomaterial", amount = 1},
    { name = data_util.mod_prefix .. "naquium-plate", amount = 24},
  },
  results = {
    { name = data_util.mod_prefix .. "hyperlattice-data", amount=6},
  },
  energy_required = 40,
  main_product = data_util.mod_prefix .. "hyperlattice-data",
  category = "space-laser",
  enabled = false,
  always_show_made_in = true,
})
local data_util = require("data_util")
local make_recipe = data_util.make_recipe

  type = "recipe",
  name = data_util.mod_prefix .. "empty-lifesupport-canister",
  ingredients = {
    { data_util.mod_prefix .. "canister", 1},
    { "processing-unit", 1},
  },
  results = {
    { data_util.mod_prefix .. "empty-lifesupport-canister", 1},
  },
  energy_required = 10,
  category = "lifesupport",
  enabled = false,
  always_show_made_in = true,
})

  type = "recipe",
  name = data_util.mod_prefix .. "lifesupport-canister-fish",
  ingredients = {
    { data_util.mod_prefix .. "empty-lifesupport-canister", 2},
    { "raw-fish", 1},
    { "wood", 10},
    { type = "fluid", name = "water" , amount = 100},
  },
  results = {
    { data_util.mod_prefix .. "lifesupport-canister", 2},
  },
  energy_required = 10,
  category = "lifesupport",
  enabled = false,
  icons = {
    { icon = data.raw.item[data_util.mod_prefix .. "lifesupport-canister"].icon, scale = 1, icon_size = 64 },
    { icon = data.raw.item["wood"].icon, scale = 0.25, shift = {-20, 20}, icon_size = 64 },
    { icon = data.raw.capsule["raw-fish"].icon, scale = 0.25, shift = {-20, 0}, icon_size = 64 },
  },
  always_show_made_in = true,
})

  type = "recipe",
  name = data_util.mod_prefix .. "lifesupport-canister-coal",
  ingredients = {
    { data_util.mod_prefix .. "empty-lifesupport-canister", 2},
    { "coal", 2},
    { type = "fluid", name = "water" , amount = 100},
  },
  results = {
    { data_util.mod_prefix .. "lifesupport-canister", 2},
  },
  energy_required = 10,
  category = "lifesupport",
  enabled = false,
  icons = {
    { icon = data.raw.item[data_util.mod_prefix .. "lifesupport-canister"].icon, scale = 1, icon_size = 64 },
    { icon = data.raw.item["coal"].icon, scale = 0.25, shift = {-20, 20}, icon_size = 64 },
  },
  allow_as_intermediate = false,
  always_show_made_in = true,
})

  type = "recipe",
  name = data_util.mod_prefix .. "lifesupport-canister-specimen",
  ingredients = {
    { data_util.mod_prefix .. "empty-lifesupport-canister", 1},
    { data_util.mod_prefix .. "specimen", 1},
    { type = "fluid", name = data_util.mod_prefix .. "space-water" , amount = 10},
  },
  results = {
    { data_util.mod_prefix .. "lifesupport-canister", 1},
  },
  energy_required = 10,
  category = "lifesupport",
  icons = {
    { icon = data.raw.item[data_util.mod_prefix .. "empty-lifesupport-canister"].icon, scale = 1, icon_size = 64 },
    { icon = data.raw.item[data_util.mod_prefix .. "specimen"].icon, scale = 0.5, shift = {-20, 20}, icon_size = 64 },
  },
  enabled = false,
  allow_as_intermediate = false,
  always_show_made_in = true,
})

  type = "recipe",
  name = data_util.mod_prefix .. "used-lifesupport-canister-cleaning",
  ingredients = {
    { data_util.mod_prefix .. "used-lifesupport-canister", 1},
    { type = "fluid", name = "water", amount = 100},
  },
  results = {
    { data_util.mod_prefix .. "empty-lifesupport-canister", 1},
  },
  energy_required = 10,
  localised_name = {"recipe-name."..data_util.mod_prefix .. "used-lifesupport-canister-cleaning"},
  main_product = data_util.mod_prefix .. "empty-lifesupport-canister",
  allow_as_intermediate = false,
  category = "lifesupport",
  icon = "__space-exploration-graphics__/graphics/icons/used-lifesupport-canister.png",
  icon_size = 64, icon_mipmaps = 1,
  enabled = false,
  always_show_made_in = true,
})

  type = "recipe",
  name = data_util.mod_prefix .. "medpack",
  ingredients = {
    { "raw-fish", 5},
    { "wood", 5},
    { "iron-plate", 1},
  },
  results = {
    { data_util.mod_prefix .. "medpack", 1},
  },
  order = "a-a-a",
  energy_required = 10,
  category = "crafting",
  enabled = false,
  always_show_made_in = true,
})
  type = "recipe",
  name = data_util.mod_prefix .. "medpack-plastic",
  ingredients = {
    { "iron-plate", 1},
    { "plastic-bar", 5},
    { type = "fluid", name =  "water" , amount = 100},
    { type = "fluid", name =  "heavy-oil" , amount = 100},
  },
  results = {
    { data_util.mod_prefix .. "medpack", 1},
  },
  order = "a-a-b",
  energy_required = 10,
  category = "lifesupport",
  enabled = false,
  always_show_made_in = true,
})
  type = "recipe",
  name = data_util.mod_prefix .. "medpack-2",
  ingredients = {
    { data_util.mod_prefix .. "medpack", 1},
    { data_util.mod_prefix .. "canister", 1},
    { type = "fluid", name =  "petroleum-gas" , amount = 100},
  },
  results = {
    { data_util.mod_prefix .. "medpack-2", 1},
  },
  order = "a-b",
  energy_required = 10,
  category = "lifesupport",
  enabled = false,
  always_show_made_in = true,
})
  type = "recipe",
  name = data_util.mod_prefix .. "medpack-3",
  ingredients = {
    { data_util.mod_prefix .. "medpack-2", 1},
    { data_util.mod_prefix .. "specimen", 1},
    { type = "fluid", name =  data_util.mod_prefix .. "chemical-gel" , amount = 10},
  },
  results = {
    { data_util.mod_prefix .. "medpack-3", 1},
  },
  order = "a-c",
  energy_required = 10,
  category = "lifesupport",
  enabled = false,
  always_show_made_in = true,
})
  type = "recipe",
  name = data_util.mod_prefix .. "medpack-4",
  ingredients = {
    { data_util.mod_prefix .. "medpack-3", 1},
    { data_util.mod_prefix .. "significant-specimen", 1},
    { data_util.mod_prefix .. "self-sealing-gel", 1},
    { type = "fluid", name =  data_util.mod_prefix .. "neural-gel-2" , amount = 10},
  },
  results = {
    { data_util.mod_prefix .. "medpack-4", 1},
  },
  order = "a-d",
  energy_required = 10,
  category = "lifesupport",
  enabled = false,
  always_show_made_in = true,
})
local data_util = require("data_util")
local make_recipe = data_util.make_recipe

-- making data cell
--[[  type = "recipe",
  name = data_util.mod_prefix .. "omega-tool",
  ingredients = {
    { data_util.mod_prefix .. "nanomaterial", 100 },
  },
  results = {
    { data_util.mod_prefix .. "omega-tool", 1},
  },
  category = "space-manufacturing"
})]]--

-- making data cell
  type = "recipe",
  name = data_util.mod_prefix .. "data-storage-substrate",
  ingredients = {
    { "glass", 2 },
    { "iron-plate", 4 }
  },
  results = {
    { data_util.mod_prefix .. "data-storage-substrate", 1},
    { name = data_util.mod_prefix .. "scrap", amount_min = 1, amount_max = 1, probability = 0.5 },
  },
  energy_required = 5,
  main_product = data_util.mod_prefix .. "data-storage-substrate",
  category = "crafting",
  enabled = false,
  always_show_made_in = false,
})

  type = "recipe",
  name = data_util.mod_prefix .. "empty-data",
  ingredients = {
    { "advanced-circuit", 3 },
    { "copper-plate", 6 },
    { data_util.mod_prefix .. "data-storage-substrate-cleaned", 4 }
  },
  results = {
    { data_util.mod_prefix .. "empty-data", 1},
  },
  energy_required = 10,
  category = "space-manufacturing",
  enabled = false,
  always_show_made_in = true,
}, true)

  type = "recipe",
  name = data_util.mod_prefix .. "material-testing-pack",
  ingredients = {
    { "iron-plate", 1},
    { "copper-plate", 1},
    { "stone", 1},
    { "plastic-bar", 1},
  },
  results = {
    { data_util.mod_prefix .. "material-testing-pack", 1},
  },
  energy_required = 5,
  category = "crafting",
  enabled = false,
  always_show_made_in = false,
})

  type = "recipe",
  name = data_util.mod_prefix .. "canister",
  ingredients = {
    { "steel-plate", 5},
    { "copper-plate", 10},
    { "plastic-bar", 5},
    { "glass", 5},
    { data_util.mod_prefix .. "heat-shielding", 1},
  },
  results = {
    { data_util.mod_prefix .. "canister", 1},
    { data_util.mod_prefix .. "scrap", 1},
  },
  main_product = data_util.mod_prefix .. "canister",
  energy_required = 10,
  category = "crafting",
  enabled = false,
  always_show_made_in = true,
})

  type = "recipe",
  name = data_util.mod_prefix .. "space-mirror",
  ingredients = {
    { name = "glass", amount = 6},
    { name = "steel-plate", amount = 3},
    { name = "low-density-structure", amount = 1},
    { name = data_util.mod_prefix .. "heat-shielding", amount = 1},
    { type = "fluid", name = "lubricant", amount = 10},
    { type = "fluid", name = data_util.mod_prefix .."chemical-gel", amount = 1},
  },
  results = {
    { name = data_util.mod_prefix.."space-mirror", amount = 1 },
    { name = data_util.mod_prefix.."scrap", amount = 1 },
  },
  energy_required = 10,
  main_product = data_util.mod_prefix .. "space-mirror",
  category = "space-manufacturing",
  icon = "__space-exploration-graphics__/graphics/icons/space-mirror.png",
  icon_size = 64, icon_mipmaps = 1,
  enabled = false,
  always_show_made_in = true,
})

  type = "recipe",
  name = data_util.mod_prefix .. "space-mirror-alternate",
  ingredients = {
    { name = "glass", amount = 2},
    { name = data_util.mod_prefix.."iridium-plate", amount = 2},
    { name = "low-density-structure", amount = 1},
    { type = "fluid", name = "lubricant", amount = 5},
    { type = "fluid", name = data_util.mod_prefix.."chemical-gel", amount = 5},
  },
  results = {
    { name = data_util.mod_prefix.."space-mirror", amount = 1 },
    { name = data_util.mod_prefix.."scrap", amount = 5 },
  },
  energy_required = 10,
  main_product = data_util.mod_prefix .. "space-mirror",
  category = "space-manufacturing",
  icon = "__space-exploration-graphics__/graphics/icons/space-mirror.png",
  icon_size = 64, icon_mipmaps = 1,
  enabled = false,
  always_show_made_in = true,
})

  type = "recipe",
  name = data_util.mod_prefix .. "gammaray-detector",
  ingredients = {
    { name = data_util.mod_prefix.."space-mirror", amount = 1 },
    { name = data_util.mod_prefix.."beryllium-plate", amount = 1},
    { type = "fluid", name = data_util.mod_prefix.."cryonite-slush", amount = 5},
    { type = "fluid", name = data_util.mod_prefix.."chemical-gel", amount = 5},
  },
  results = {
    { name = data_util.mod_prefix.."gammaray-detector", amount = 1 },
  },
  energy_required = 10,
  category = "space-manufacturing",
  icon = "__space-exploration-graphics__/graphics/icons/gammaray-detector.png",
  icon_size = 64, icon_mipmaps = 1,
  enabled = false,
  always_show_made_in = true,
})

  type = "recipe",
  name = data_util.mod_prefix .. "space-solar-panel",
  ingredients = {
    { name = data_util.mod_prefix .. "space-mirror", amount = 4},
    { name = "solar-panel", amount = 1},
  },
  results = {
    { name = data_util.mod_prefix .. "space-solar-panel", amount = 1 },
  },
  energy_required = 20,
  category = "space-manufacturing",
  enabled = false,
  always_show_made_in = true,
})

  type = "recipe",
  name = data_util.mod_prefix .. "space-solar-panel-2",
  ingredients = {
    { name = data_util.mod_prefix .. "space-solar-panel", amount = 1},
    { name = data_util.mod_prefix .. "holmium-plate", amount = 4},
    { name = data_util.mod_prefix .. "holmium-cable", amount = 4},
    { name = data_util.mod_prefix .. "space-mirror", amount = 1},
  },
  results = {
    { name = data_util.mod_prefix .. "space-solar-panel-2", amount = 1 },
  },
  energy_required = 40,
  category = "space-manufacturing",
  enabled = false,
  always_show_made_in = true,
})

  type = "recipe",
  name = data_util.mod_prefix .. "space-solar-panel-3",
  ingredients = {
    { name = data_util.mod_prefix .. "space-solar-panel-2", amount = 1},
    { name = data_util.mod_prefix .. "naquium-cube", amount = 1},
    { name = data_util.mod_prefix .. "superconductive-cable", amount = 4},
  },
  results = {
    { name = data_util.mod_prefix .. "space-solar-panel-3", amount = 1 },
  },
  energy_required = 60,
  category = "space-manufacturing",
  enabled = false,
  always_show_made_in = true,
})

  type = "recipe",
  name = data_util.mod_prefix .. "space-accumulator",
  ingredients = {
    { name = "accumulator", amount = 2},
    { name = data_util.mod_prefix .. "heavy-girder", amount = 8},
    { name = data_util.mod_prefix .. "holmium-cable", amount = 40},
  },
  results = {
    { name = data_util.mod_prefix .. "space-accumulator", amount = 1 },
  },
  energy_required = 30,
  category = "space-manufacturing",
  enabled = false,
  always_show_made_in = true,
})

  type = "recipe",
  name = data_util.mod_prefix .. "space-accumulator-2",
  ingredients = {
    { name = data_util.mod_prefix .. "space-accumulator", amount = 2},
    { name = data_util.mod_prefix .. "superconductive-cable", amount = 8},
    { name = data_util.mod_prefix .. "naquium-cube", amount = 1},
  },
  results = {
    { name = data_util.mod_prefix .. "space-accumulator-2", amount = 1 },
  },
  energy_required = 60,
  category = "space-manufacturing",
  enabled = false,
  always_show_made_in = true,
})
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
  {
    type = "recipe",
    name = data_util.mod_prefix .. "space-platform-scaffold",
    energy_required = 1,
    category = "crafting",
    ingredients = {
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
    ingredients = {
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
    results = {
        {data_util.mod_prefix .. "holmium-cable", 2},
    },
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
        { name ="sand", amount=10},
        { type="fluid", name ="water", amount=100},
    },
    results= { {type="item", name ="solid-sand", amount=10} },
    },
    expensive = {
    energy_required = 0.5,
    enabled = false,
}})
end

data:extend({
{
    type = "recipe",
    category = "smelting",
    name = data_util.mod_prefix .. "iron-smelting-vulcanite",
    results = {
        { name = "iron-plate", amount = 12},
    },
    energy_required = 24,
    ingredients = {
        { name = "iron-ore", amount = 8},
        { name = data_util.mod_prefix .. "vulcanite-block", amount = 1},
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
        { name = "copper-ore", amount = 8},
        { name = data_util.mod_prefix .. "vulcanite-block", amount = 1},
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
        { name = "stone-brick", amount = 6},
    },
    energy_required = 24,
    ingredients = {
        { name = "stone", amount = 8},
        { name = data_util.mod_prefix .. "vulcanite-block", amount = 1},
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
        { name = "glass", amount = 6},
    },
    energy_required = 24,
    ingredients = {
        { name = "sand", amount = 16},
        { name = data_util.mod_prefix .. "vulcanite-block", amount = 1},
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
        { name = data_util.mod_prefix .. "beryllium-ore-crushed", amount = 1} -- 2
    },
    energy_required = 1,
    ingredients = {
        { name = data_util.mod_prefix .. "beryllium-ore", amount = 2}
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
        { name = data_util.mod_prefix .. "beryllium-sulfate", amount = 1}, -- 4
        { name = "sand", probability = 0.5, amount_min = 1, amount_max = 1,},
        { type = "fluid", name = "water", amount = 1, catalyst_amount = 1},
    },
    energy_required = 2,
    ingredients = {
        { type = "fluid", name ="sulfuric-acid", amount = 2},
        { name = data_util.mod_prefix .. "beryllium-ore-crushed", amount = 2}
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
        { name = data_util.mod_prefix .. "cryonite-rod", amount = 1},
        { type = "fluid", name ="water", amount = 150, catalyst_amount = 150},
        { name = data_util.mod_prefix .. "beryllium-sulfate", amount = 50}
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
        { name = data_util.mod_prefix .. "beryllium-powder", amount = 1}, -- 2
        { type = "fluid", name = "water", amount = 1, catalyst_amount = 1},
    },
    energy_required = 1,
    ingredients = {
        { type = "fluid", name = data_util.mod_prefix .. "beryllium-hydroxide", amount = 2},
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
        { name = data_util.mod_prefix .. "beryllium-ingot", amount = 1}, -- 20
    },
    energy_required = 40,
    ingredients = {
        { name = data_util.mod_prefix .. "beryllium-powder", amount = 10},
    },
    enabled = false,
    always_show_made_in = true,
},
{
    type = "recipe",
    category = "crafting",
    name = data_util.mod_prefix .. "beryllium-plate",
    results = {
        { name = data_util.mod_prefix .. "beryllium-plate", amount = 4}, -- 5
    },
    energy_required = 15,
    ingredients = {
        { name = data_util.mod_prefix .. "beryllium-ingot", amount = 1}
    },
    enabled = false,
    always_show_made_in = true,
},


{
    type = "recipe",
    category = "pulverising",
    name = data_util.mod_prefix .. "cryonite-crushed",
    results = {
        { name = data_util.mod_prefix .. "cryonite-crushed", amount = 1}
    },
    energy_required = 0.5,
    ingredients = {
        { name = data_util.mod_prefix .. "cryonite", amount = 2}
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
        { name = data_util.mod_prefix .. "cryonite-washed", amount = 2},
        { name = "stone", amount_min = 1, amount_max = 1, probability = 0.25},
        { type = "fluid", name="water", amount = 4, catalyst_amount = 4},
    },
    energy_required = 1,
    ingredients = {
        { type = "fluid", name="water", amount = 6, catalyst_amount = 6},
        { name = data_util.mod_prefix .. "cryonite-crushed", amount = 2}
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
        { name = data_util.mod_prefix .. "cryonite-rod", amount = 1},
    },
    energy_required = 5,
    ingredients = {
        { name = data_util.mod_prefix .. "cryonite-washed", amount = 1}
    },
    enabled = false,
    always_show_made_in = true,
},
{
    type = "recipe",
    category = "chemistry",
    name = data_util.mod_prefix .. "cryonite-ion-exchange-beads",
    results = {
        { name = data_util.mod_prefix .. "cryonite-ion-exchange-beads", amount = 10},
    },
    energy_required = 10,
    ingredients = {
        { name = data_util.mod_prefix .. "cryonite-rod", amount = 1},
        { name = "plastic-bar", amount = 1},
        { type = "fluid", name = "sulfuric-acid", amount = 5},
        { type = "fluid", name = "steam", amount = 5},
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
        { type = "fluid", name = "lubricant", amount = 10},
    },
    energy_required = 5,
    ingredients = {
        { type = "fluid", name = data_util.mod_prefix .. "cryonite-slush", amount = 10},
        { type = "fluid", name = "heavy-oil", amount = 1},
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
        { type = "fluid", name = data_util.mod_prefix .. "cryonite-slush", amount = 10},
    },
    energy_required = 5,
    ingredients = {
        { name = data_util.mod_prefix .. "cryonite-rod", amount = 1},
        { type = "fluid", name = "sulfuric-acid", amount = 1},
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
        { name = data_util.mod_prefix .. "water-ice", amount = 1},
    },
    energy_required = 1,
    ingredients = {
        { type = "fluid", name = data_util.mod_prefix .. "cryonite-slush", amount = 1},
        { type = "fluid", name = "water", amount = 100},
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
        { type = "fluid", name = "water", amount = 99},
    },
    energy_required = 0.5,
    ingredients = {
        { type = "fluid", name = "steam", amount = 100},
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
        { name = data_util.mod_prefix .. "holmium-ore-crushed", amount = 1}
    },
    energy_required = 1,
    ingredients = {
        { name = data_util.mod_prefix .. "holmium-ore", amount = 2}
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
        { name = data_util.mod_prefix .. "holmium-ore-washed", amount = 2},
        { name = "stone", amount_min = 1, amount_max = 1, probability = 0.25},
    },
    energy_required = 1,
    ingredients = {
        { type = "fluid", name ="water", amount = 2, catalyst_amount = 2},
        { name = data_util.mod_prefix .. "holmium-ore-crushed", amount = 2}
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
        { name = data_util.mod_prefix .. "holmium-powder", probability = 0.5, amount_min = 1, amount_max = 1},
        { name = data_util.mod_prefix .. "vulcanite-ion-exchange-beads", probability = 0.5, amount_min = 1, amount_max = 1, catalyst_amount = 1},
        { name = data_util.mod_prefix .. "holmium-ore-washed", probability = 0.5, amount_min = 1, amount_max = 1, catalyst_amount = 1},
        { name = "sand", probability = 0.25, amount_min = 1, amount_max = 1, catalyst_amount = 1},
    },
    energy_required = 1,
    ingredients = {
        { type = "fluid", name ="water", amount = 2, catalyst_amount = 2},
        { name = data_util.mod_prefix .. "vulcanite-ion-exchange-beads", amount = 1, catalyst_amount = 1,},
        { name = data_util.mod_prefix .. "holmium-ore-washed", amount = 1, catalyst_amount = 1,}
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
        { name = data_util.mod_prefix .. "holmium-ingot", amount = 1},
    },
    energy_required = 40,
    ingredients = {
        { name = data_util.mod_prefix .. "holmium-powder", amount = 10},
    },
    enabled = false,
    always_show_made_in = true,
},
{
    type = "recipe",
    category = "crafting",
    name = data_util.mod_prefix .. "holmium-plate",
    results = {
        { name = data_util.mod_prefix .. "holmium-plate", amount = 4},
    },
    energy_required = 15,
    ingredients = {
        { name = data_util.mod_prefix .. "holmium-ingot", amount = 1}
    },
    enabled = false,
    always_show_made_in = true,
},

{
    type = "recipe",
    category = "pulverising",
    name = data_util.mod_prefix .. "iridium-ore-crushed",
    results = {
        { name = data_util.mod_prefix .. "iridium-ore-crushed", amount = 1}
    },
    energy_required = 1,
    ingredients = {
        { name = data_util.mod_prefix .. "iridium-ore", amount = 2}
    },
    enabled = false,
    always_show_made_in = true,
},
{
    type = "recipe",
    category = "pressure-washing",
    name = data_util.mod_prefix .. "iridium-ore-washed",
    main_product = data_util.mod_prefix .. "iridium-ore-washed",
    results = {
        { name = data_util.mod_prefix .. "iridium-ore-washed", amount = 2},
        { name = "stone", amount_min = 1, amount_max = 1, probability = 0.25},
    },
    energy_required = 1,
    ingredients = {
        { type = "fluid", name ="water", amount = 2, catalyst_amount = 2},
        { name = data_util.mod_prefix .. "iridium-ore-crushed", amount = 2}
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
    name = data_util.mod_prefix .. "iridium-powder",
    main_product = data_util.mod_prefix .. "iridium-powder",
    results = {
        { name = data_util.mod_prefix .. "iridium-powder", probability = 0.5, amount_min = 1, amount_max = 1},
        { name = data_util.mod_prefix .. "cryonite-ion-exchange-beads", probability = 0.5, amount_min = 1, amount_max = 1, catalyst_amount = 1},
        { name = data_util.mod_prefix .. "iridium-ore-washed", probability = 0.5, amount_min = 1, amount_max = 1, catalyst_amount = 1},
        { name = "sand", probability = 0.25, amount_min = 1, amount_max = 1, catalyst_amount = 1},
    },
    energy_required = 1,
    ingredients = {
        { type = "fluid", name ="water", amount = 2, catalyst_amount = 2},
        { name = data_util.mod_prefix .. "cryonite-ion-exchange-beads", amount = 1, catalyst_amount = 1,},
        { name = data_util.mod_prefix .. "iridium-ore-washed", amount = 1, catalyst_amount = 1,}
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
    name = data_util.mod_prefix .. "iridium-ingot",
    results = {
        { name = data_util.mod_prefix .. "iridium-ingot", amount = 1},
    },
    energy_required = 40,
    ingredients = {
        { name = data_util.mod_prefix .. "iridium-powder", amount = 10},
        { name = data_util.mod_prefix .. "vulcanite-block", amount = 1},
    },
    enabled = false,
    always_show_made_in = true,
},
{
    type = "recipe",
    category = "crafting",
    name = data_util.mod_prefix .. "iridium-plate",
    results = {
        { name = data_util.mod_prefix .. "iridium-plate", amount = 4},
    },
    energy_required = 15,
    ingredients = {
        { name = data_util.mod_prefix .. "iridium-ingot", amount = 1}
    },
    enabled = false,
    always_show_made_in = true,
},
{
    type = "recipe",
    category = "pulverising",
    name = data_util.mod_prefix .. "naquium-ore-crushed",
    results = {
        { name = data_util.mod_prefix .. "naquium-ore-crushed", amount = 1}
    },
    energy_required = 2,
    ingredients = {
        { name = data_util.mod_prefix .. "naquium-ore", amount = 4}
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
        { name = data_util.mod_prefix .. "naquium-ore-washed", amount = 2},
        { name = "stone", amount_min = 1, amount_max = 1, probability = 0.25},
    },
    energy_required = 2,
    ingredients = {
        {type = "fluid", name ="water", amount = 4},
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
        {type ="fluid", name = "water", amount = 2},
    },
    energy_required = 20,
    ingredients = {
        {name =data_util.mod_prefix .. "vitalic-acid", amount = 4},
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
        {name =data_util.mod_prefix .. "vulcanite-block", amount = 1},
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
        {name = data_util.mod_prefix .. "vulcanite-block", amount = 1},
        {name = data_util.mod_prefix .. "vitamelange-nugget", amount = 100}
    },
    enabled = false,
    always_show_made_in = true,
},
{
    type = "recipe",
    category = "crafting",
    name = data_util.mod_prefix .. "vitamelange-spice",
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
    name = data_util.mod_prefix .. "vitamelange-extract",
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
        {type = "fluid", name ="steam", amount = 2, temperature = 165},
    },
    energy_required = 1,
    ingredients = {
        {type = "fluid", name ="water", amount = 4},
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
        { "steel-plate", 1000},
        { "concrete", 1000},
        { "radar", 10},
        { "steel-chest", 10},
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
        { "steel-plate", 1000},
        { "concrete", 1000},
        { "pipe", 100},
        { "storage-tank", 10},
        { "radar", 10},
        { "steel-chest", 10},
        { "processing-unit", 200},
        { "electric-engine-unit", 200}
    },
    requester_paste_multiplier = 1,
},
always_show_made_in = true,
})
local data_util = require("data_util")
local make_recipe = data_util.make_recipe


data:extend({

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
        { data_util.mod_prefix .. "rocket-science-pack", 10},
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
    results = {
        { data_util.mod_prefix .. "space-science-lab", amount=1}
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
    ingredients = {
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
    ingredients = {
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
    ingredients = {
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
    ingredients = {
        {data_util.mod_prefix .. "spaceship-wall", 1},
        {"electric-engine-unit", 6},
        {data_util.mod_prefix .. "aeroframe-bulkhead", 1},
        {data_util.mod_prefix .. "heat-shielding", 1}
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
    ingredients = {
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
    ingredients = {
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
    ingredients = {
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
    ingredients = {
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
    ingredients = {
        {type="fluid", name=data_util.mod_prefix .. "antimatter-stream", amount=1},
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
    ingredients = {
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
        { data_util.mod_prefix .. "quantum-processor", 8},
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
    results = {
        { name = data_util.mod_prefix .. "pulveriser", amount=1}
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
    results = {
        { name = data_util.mod_prefix .. "addon-power-pole", amount=1}
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
    results = {
        { name = data_util.mod_prefix .. "pylon", amount=1}
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
    results = {
        { name = data_util.mod_prefix .. "pylon-substation", amount=1}
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
    results = {
        { name = data_util.mod_prefix .. "pylon-construction", amount=1}
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
    results = {
        { name = data_util.mod_prefix .. "pylon-construction-radar", amount=1}
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
    results = {
        { name = data_util.mod_prefix .. "space-assembling-machine", amount=1}
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
    results = {
        { name = data_util.mod_prefix .. "space-astrometrics-laboratory", amount=1}
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
    results = {
        { name = data_util.mod_prefix .. "space-biochemical-laboratory", amount=1}
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
    results = {
        { name = data_util.mod_prefix .. "space-decontamination-facility", amount=1}
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
    results = {
        { name = data_util.mod_prefix .. "space-electromagnetics-laboratory", amount=1}
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
    results = {
        { name = data_util.mod_prefix .. "space-genetics-laboratory", amount=1}
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
    results = {
        { name = data_util.mod_prefix .. "space-gravimetrics-laboratory", amount=1}
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
    results = {
        { name = data_util.mod_prefix .. "space-growth-facility", amount=1}
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
    results = {
        { name = data_util.mod_prefix .. "space-hypercooler", amount=1}
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
    results = {
        { name = data_util.mod_prefix .. "space-laser-laboratory", amount=1}
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
    results = {
        { name = data_util.mod_prefix .. "lifesupport-facility", amount=1}
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
    results = {
        { name = data_util.mod_prefix .. "space-manufactory", amount=1}
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
    results = {
        { name = data_util.mod_prefix .. "space-mechanical-laboratory", amount=1}
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
    results = {
        { name = data_util.mod_prefix .. "space-particle-accelerator", amount=1}
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
    results = {
        { name = data_util.mod_prefix .. "space-particle-collider", amount=1}
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
    results = {
        { name = data_util.mod_prefix .. "space-plasma-generator", amount=1}
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
    results = {
        { name = data_util.mod_prefix .. "space-radiation-laboratory", amount=1}
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
    results = {
        { name = data_util.mod_prefix .. "space-radiator", amount=1}
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
    results = {
        { name = data_util.mod_prefix .. "space-radiator-2", amount=1}
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
    results = {
        { name = data_util.mod_prefix .. "recycling-facility", amount=1}
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
    results = {
        { name = data_util.mod_prefix .. "space-material-fabricator", amount=1}
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
    results = {
        { name = data_util.mod_prefix .. "space-supercomputer-1", amount=1}
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
    results = {
        { name = data_util.mod_prefix .. "space-supercomputer-2", amount=1}
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
    results = {
        { name = data_util.mod_prefix .. "space-supercomputer-3", amount=1}
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
    results = {
        { name = data_util.mod_prefix .. "space-supercomputer-4", amount=1}
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
    results = {
        { name = data_util.mod_prefix .. "space-telescope", amount=1}
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
    results = {
        { name = data_util.mod_prefix .. "space-telescope-radio", amount=1}
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
    results = {
        { name = data_util.mod_prefix .. "space-telescope-microwave", amount=1}
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
    results = {
        { name = data_util.mod_prefix .. "space-telescope-xray", amount=1}
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
    results = {
        { name = data_util.mod_prefix .. "space-telescope-gammaray", amount=1}
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
    results = {
        { name = data_util.mod_prefix .. "space-thermodynamics-laboratory", amount=1}
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
    results = {
        { name = data_util.mod_prefix .. "supercharger", amount=1}
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
    results = {
        { name = data_util.mod_prefix .. "wide-beacon", amount=1}
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
    results = {
        { name = data_util.mod_prefix .. "wide-beacon-2", amount=1}
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



data:extend({
  {
    type = "recipe",
    name = "sand-from-stone",
    ingredients = {
      { "stone", 1 }
    },
    results = { 
      { "sand", 2},
    },
    result_count = 2,
    enabled = false,
    energy_required = 0.5
  }
})

data:extend({
  {
    type = "recipe",
    name = "glass-from-sand",
    category = "smelting",
    enabled = true,
    energy_required = 4,
    ingredients = {
      { "sand", 4 }
    },
    results = {
      { "glass", 2},
    },
    enabled = false
  }
})

data:extend({{
    type = "recipe",
    name = "stone-tablet",
    category = "crafting",
    energy_required = 0.5,
    ingredients = {
      { "stone-brick", amount=1}
    },
    results = {
      { "stone-tablet", amount=4}
    },
}})

data:extend({{
    type = "recipe",
    name = "motor",
    category = "crafting",
    normal = {
      energy_required = settings.startup["aai-fast-motor-crafting"].value and 0.3 or 0.6,
      ingredients = {
        { "iron-plate", amount=1},
        { "iron-gear-wheel", amount=1}
      },
      results= { 
        { "motor", amount=1}
      },
    },
}})

data:extend({{
    type = "recipe",
    name = "electric-motor",
    category = "crafting",
    normal = {
      enabled = false,
      energy_required = settings.startup["aai-fast-motor-crafting"].value and 0.4 or 0.8,
      ingredients = {
        {"iron-plate", amount=1},
        {"iron-gear-wheel", amount=1},
        {"copper-cable", amount=6}
      },
      results = {
        { "electric-motor", amount=1}
      },
    },
}})

data:extend({{
    type = "recipe",
    name = "small-iron-electric-pole",
    category = "crafting",
    energy_required = 0.25,
    normal = {
      enabled = false,
      ingredients = {
        {"iron-stick", 2},
        {"copper-cable", 2}
      },
      results = {
        { "small-iron-electric-pole", amount=1}
      },
    },
}})

data:extend({{
    type = "recipe",
    name = "concrete-wall",
    category = "crafting",
    enabled = false,
    energy_required = 0.25,
    normal = {
      ingredients = {
        { "stone-wall", 1 },
        { "concrete", 12 }
      },
      results = {
        { "concrete-wall", amount=1}
      },
    },
}})

data:extend({{
    type = "recipe",
    name = "steel-wall",
    category = "crafting",
    enabled = false,
    energy_required = 1,
    normal = {
      ingredients = {
        { "concrete-wall", 1 },
        { "steel-plate", 5 }
      },
      results= {
        { "steel-wall", amount=1}
      },
    },
}})

data:extend({{
    type = "recipe",
    name = "burner-lab",
    category = "crafting",
    enabled = true,
    energy_required = 0.5,
    normal = {
      ingredients = {
        {"motor", amount=10},
        {"copper-plate", amount=10},
        {"stone-brick", amount=5}
      },
      results = {
        { "burner-lab", amount=1}
      },
   },
}})

data:extend({{
    type = "recipe",
    name = "burner-turbine",
    category = "crafting",
    normal = {
      enabled = false,
      energy_required = 1,
      ingredients = {
        {"electric-motor", amount=4},
        {"iron-gear-wheel", amount=5},
        {"stone-furnace", amount=1}
      },
      results = {
        { "burner-turbine", amount=1}
      },
    },
}})

data:extend({{
    type = "recipe",
    name = "burner-assembling-machine",
    category = "crafting",
    normal = {
      enabled = false,
      energy_required = 0.5,
      ingredients = {
        {"iron-plate", amount=8},
        {"stone-brick", amount=4},
        {"motor", amount=1}
      },
      results = {
        {"burner-assembling-machine", amount=1}
      },
    },
  }
})

data:extend({
  {
    type = "recipe",
    name = "area-mining-drill",
    category = "crafting",
    normal = {
      enabled = false,
      energy_required = 4,
      ingredients = {
        {"electric-mining-drill", amount=1},
        {"steel-plate", amount=20},
        {"electric-engine-unit", amount=8},
        {="processing-unit", amount=4},
      },
      results = {
        {"area-mining-drill", amount=1}
      },
    },
  },

  data:extend({
  {
    type = "recipe",
    name = "industrial-furnace",
    category = "crafting",
    normal = {
      enabled = false,
      energy_required = 7,
      ingredients = {
        {"steel-plate", amount=16},
        {"concrete", amount=8},
        {"processing-unit", amount=4},
        {"electric-furnace", amount=1},
      },
      results = {
        {"industrial-furnace", amount=1}
      },
    },
  },

  
util.conditional_modify({
  type = "recipe",
  name = "repair-pack",
  normal = {
    ingredients = {
      {type="item", name="iron-plate", amount=3},
      {type="item", name="copper-plate", amount=3},
      {type="item", name="stone", amount=3}
    },
    results = {
      {type="item", name="concrete", amount=10}
    },
  },
})


util.conditional_modify({
  type = "recipe",
  name = "engine-unit",
  category = "crafting", -- engine can be hand crafted
  normal = {
    ingredients = {
      {type="item", name="steel-plate", amount=2},
      {type="item", name="iron-gear-wheel", amount=2},
      {type="item", name="motor", amount=2}
    },
    results = {
      {type="item", name="engine-unit", amount=1}
    },
  },
})

util.conditional_modify({
  type = "recipe",
  name = "electric-engine-unit",
  normal = {
    ingredients = {
      {type="fluid", name="lubricant", amount=40},
      {type="item", name="steel-plate", amount=2},
      {type="item", name="electronic-circuit", amount=4},
      {type="item", name="electric-motor", amount=2},
    },
    results = {
      {type="item", name="electric-engine-unit", amount=1}
    },
  },
})

util.conditional_modify({
  type = "recipe",
  name = "concrete",
  normal = {
    ingredients = {
      {type="item", name="stone-brick", amount=5},
      {type="item", name="sand", amount=10},
      {type="item", name="iron-stick", amount=2},
      {type="fluid", name="water", amount=100}
    },
    results = {
      {type="item", name="concrete", amount=10}
    },
  },
})

util.conditional_modify({
  type = "recipe",
  name = "stone-furnace",
  normal = {
    ingredients = {
      {"stone", 5}
    },
    results = {
      {type="item", name="concrete", amount=10}
    },
  },
})

util.conditional_modify({
  type = "recipe",
  name = "steel-furnace",
  normal = {
    ingredients = {
      {"stone-brick", 6},
      {"steel-plate", 6},
      {"stone-furnace", 1}
    },
    results = {
      {type="item", name="concrete", amount=10}
    },
  },
})

util.conditional_modify({
  type = "recipe",
  name = "electric-furnace",
  normal = {
    ingredients = {
      {"steel-plate", 5},
      {"advanced-circuit", 5},
      {"concrete", 5}, 
      {"steel-furnace", 1}
    },
    results = {
      {type="item", name="concrete", amount=10}
    },
  },
})

util.conditional_modify({
  type = "recipe",
  name = "burner-inserter",
  normal = {
    enabled = false,
    ingredients = {
      {type="item", name="iron-stick", amount=2},
      {type="item", name="motor", amount=1}
    },
    results = {
      {type="item", name="concrete", amount=10}
    },
  },
})

util.conditional_modify({
  type = "recipe",
  name = "inserter",
  normal = {
    enabled = false,
    ingredients = {
      {type="item", name="burner-inserter", amount=1},
      {type="item", name="electric-motor", amount=1}
    },
    results = {
      {type="item", name="concrete", amount=10}
    },
  },
})

if not data.raw.inserter["red-inserter"] then -- not bobs
  util.conditional_modify({
    type = "recipe",
    name = "long-handed-inserter",
    normal = {
      enabled = false,
      ingredients = {
        {type="item", name="inserter", amount=1},
        {type="item", name="iron-plate", amount=2},
        {type="item", name="iron-stick", amount=2}
      },
      results = {
        {type="item", name="concrete", amount=10}
      },
    },
  })
end


  util.conditional_modify({
    type = "recipe",
    name = "transport-belt",
    normal = {
      ingredients = {
        {type="item", name="iron-plate", amount=1},
        {type="item", name="motor", amount=1}
      },
      results = {
        {type="item", name="concrete", amount=10}
      },
    },
  })
end

if data.raw.item["basic-splitter"] then
  util.conditional_modify({
    type = "recipe",
    name = "splitter",
    normal = {
      enabled = false,
      ingredients = {
        {type="item", name="iron-plate", amount=8}, 
        {type="item", name="motor", amount=2},
        {type="item", name="transport-belt", amount=2},
        {type="item", name="basic-splitter", amount=1}
      },
      results = {
        {type="item", name="concrete", amount=10}
      },
    },
  })

else
  util.conditional_modify({
    type = "recipe",
    name = "splitter",
    normal = {
      enabled = false,
      ingredients = {
        {type="item", name="iron-plate", amount=8},
        {type="item", name="transport-belt", amount=4},
        {type="item", name="motor", amount=4}
      },
     results = {
        {type="item", name="concrete", amount=10}
      },
  })
end

util.conditional_modify({
  type = "recipe",
  name = "boiler",
  normal = {
    enabled = false,
    ingredients = {
      {"stone-furnace", 1},
      {"pipe", 4}
    },
    results = {
      {type="item", name="concrete", amount=10}
    },
  },
})

util.conditional_modify({
  type = "recipe",
  name = "steam-engine",
  normal = {
    enabled = false,
    ingredients = {
      {type="item", name="iron-plate", amount=10},
      {type="item", name="iron-gear-wheel", amount=5},
      {type="item", name="electric-motor", amount=3}
    },
    results = {
      {type="item", name="concrete", amount=10}
    },
  },
})

util.replace_or_add_ingredient (data.raw.recipe["steam-turbine"], "copper-plate", "copper-plate", 30)
util.replace_or_add_ingredient (data.raw.recipe["steam-turbine"], "iron-gear-wheel", "iron-gear-wheel", 30)
util.replace_or_add_ingredient (data.raw.recipe["steam-turbine"], "electric-motor", "electric-motor", 10)

util.replace_or_add_ingredient (data.raw.recipe["centrifuge"], "electric-motor", "electric-motor", 25)

util.conditional_modify({
  type = "recipe",
  name = "burner-mining-drill",
  normal = {
    ingredients = {
      {type="item", name="stone-brick", amount=4},
      {type="item", name="iron-plate", amount=4},
      {type="item", name="motor", amount=1}
    },
    results = {
      {type="item", name="concrete", amount=10}
    },
  },
})

util.conditional_modify({
  type = "recipe",
  name = "electric-mining-drill",
  normal = {
    enabled = false,
    ingredients = {
      {type="item", name="iron-gear-wheel", amount=4},
      {type="item", name="electric-motor", amount=4},
      {type="item", name="burner-mining-drill", amount=1}
    },
    results = {
      {type="item", name="concrete", amount=10}
    },
  },
})

util.conditional_modify({
  type = "recipe",
  name = "assembling-machine-1",
  normal = {
    ingredients = {
      {type="item", name="iron-gear-wheel", amount=4},
      {type="item", name="electric-motor", amount=1},
      {type="item", name="burner-assembling-machine", amount=1}
    },
    results = {
      {type="item", name="concrete", amount=10}
    },
  },

})

util.conditional_modify({
  type = "recipe",
  name = "assembling-machine-2",
  normal = {
    ingredients = {
      {type="item", name="steel-plate", amount=2},
      {type="item", name="electronic-circuit", amount=2},
      {type="item", name="electric-motor", amount=2},
      {type="item", name="assembling-machine-1", amount=1}
    },
    results = {
      {type="item", name="concrete", amount=10}
    },
  },

})

util.conditional_modify({
  type = "recipe",
  name = "assembling-machine-3",
  normal = {
    ingredients = {
      {type="item", name="concrete", amount=8},
      {type="item", name="steel-plate", amount=8},
      {type="item", name="advanced-circuit", amount=8},
      {type="item", name="electric-engine-unit", amount=4},
      {type="item", name="assembling-machine-2", amount=1}
    },
    results = {
      {type="item", name="concrete", amount=10}
    },
  },

})

util.conditional_modify({
  type = "recipe",
  name = "chemical-plant",
  normal = {
    ingredients = {
      {type="item", name="steel-plate", amount=5},
      {type="item", name="electric-motor", amount=5},
      {type="item", name="glass", amount=5},
      {type="item", name="pipe", amount=5},
      {type="item", name="stone-brick", amount=5}
    },
    results = {
      {type="item", name="concrete", amount=10}
    },
  },

})

util.conditional_modify({
  type = "recipe",
  name = "oil-refinery",
  normal = {
    ingredients = {
      {type="item", name="steel-plate", amount=15},
      {type="item", name="electric-motor", amount=15},
      {type="item", name="glass", amount=15},
      {type="item", name="pipe", amount=15},
      {type="item", name="stone-brick", amount=15}
    },
    results = {
      {type="item", name="concrete", amount=10}
    },
  },

})

util.conditional_modify({
  type = "recipe",
  name = "lab",
  normal = {
    ingredients = {
      {type="item", name="electronic-circuit", amount=5},
      {type="item", name="electric-motor", amount=5},
      {type="item", name="glass", amount=5},
      {type="item", name="burner-lab", amount=1}
    },
    results = {
      {type="item", name="concrete", amount=10}
    },
  },

})

util.conditional_modify({
  type = "recipe",
  name = "beacon",
  normal = {
    ingredients = {
      {type="item", name="advanced-circuit", amount=20},
      {type="item", name="concrete", amount=10},
      {type="item", name="steel-plate", amount=10},
      {type="item", name="electric-motor", amount=10}
    },
    results = {
      {type="item", name="concrete", amount=10}
    },
  },
})

util.conditional_modify({
  type = "recipe",
  name = "offshore-pump",
  normal = {
    enabled = false,
    ingredients = {
      {type="item", name="electric-motor", amount=2},
      {type="item", name="pipe", amount=4}
    },
    results = {
      {type="item", name="concrete", amount=10}
    },
  },
})

util.conditional_modify({
  type = "recipe",
  name = "pump",
  normal = {
    ingredients = {
      {type="item", name="electric-motor", amount=2},
      {type="item", name="pipe", amount=2},
      {type="item", name="steel-plate", amount=1}
    },
    results = {
      {type="item", name="concrete", amount=10}
    },
  },

})

util.conditional_modify({
  type = "recipe",
  name = "pumpjack",
  normal = {
    ingredients = {
      {type="item", name="steel-plate", amount=15},
      {type="item", name="iron-gear-wheel", amount=10},
      {type="item", name="electric-motor", amount=10},
      {type="item", name="pipe", amount=10}
    },
    results = {
      {type="item", name="concrete", amount=10}
    },
  },

})

util.conditional_modify({
  type = "recipe",
  name = "small-electric-pole",
  normal = {
    enabled = false,
    ingredients = {
      {type="item", name="wood", amount=1},
      {type="item", name="copper-cable", amount=2}
    },
    results = { 
      {type="item", name="small-electric-pole", amount=1}
    },
  },

})

util.conditional_modify({
  type = "recipe",
  name = "medium-electric-pole",
  ingredients = {
    {type="item", name="iron-stick", amount=4},
    {type="item", name="steel-plate", amount=2},
    {type="item", name="copper-cable", amount=4},
    {type="item", name="small-iron-electric-pole", amount=1}
  },
  results = {
    {type="item", name="concrete", amount=10}
  },
})

util.conditional_modify({
  type = "recipe",
  name = "big-electric-pole",
  ingredients = {
    {type="item", name="iron-stick", amount=8},
    {type="item", name="steel-plate", amount=5},
    {type="item", name="copper-cable", amount=10},
    {type="item", name="concrete", amount=1}
  },
  results = {
    {type="item", name="concrete", amount=10}
  },
})

util.conditional_modify({
  type = "recipe",
  name = "substation",
  normal = {
    ingredients = {
      {type="item", name="copper-cable", amount=20},
      {type="item", name="steel-plate", amount=10},
      {type="item", name="concrete", amount=5},
      {type="item", name="advanced-circuit", amount=5}
    },
    results = {
      {type="item", name="concrete", amount=10}
    },
  },
})


util.conditional_modify({
  type = "recipe",
  name = "laser-turret",
  normal = {
    ingredients = {
      {type="item", name="steel-plate", amount=20},
      {type="item", name="electronic-circuit", amount=20},
      {type="item", name="glass", amount=20},
      {type="item", name="battery", amount=12},
      {type="item", name="electric-motor", amount=5}
    },
    results = {
      {type="item", name="concrete", amount=10}
    },
  },
})

util.conditional_modify({
  type = "recipe",
  name = "gate",
  ingredients = {
    {type="item", name="stone-wall", amount=1},
    {type="item", name="steel-plate", amount=2},
    {type="item", name=basic_circuit, amount=2},
    {type="item", name="motor", amount=2}
  },
  results = {
    {type="item", name="concrete", amount=10}
  },
})

util.conditional_modify({
  type = "recipe",
  name = "small-lamp",
  normal = {
    enabled = false,
    ingredients = {
      {type="item", name="iron-plate", amount=1},
      {type="item", name="copper-cable", amount=4},
      {type="item", name="glass", amount=1}
    },
    results = {
      {type="item", name="concrete", amount=10}
    },
  },
})


util.conditional_modify({
  type = "recipe",
  name = "radar",
  normal = {
    enabled = false,
    ingredients = {
      {type="item", name="iron-plate", amount=20},
      {type="item", name="electronic-circuit", amount=8},
      {type="item", name="stone-brick", amount=4},
      {type="item", name="electric-motor", amount=4}
    },
    results = {
      {type="item", name="concrete", amount=10}
    },
  },
})


util.conditional_modify({
  type = "recipe",
  name = "locomotive",
  ingredients = {
    {type="item", name="steel-plate", amount=30},
    {type="item", name="engine-unit", amount=15},
    {type="item", name="iron-gear-wheel", amount=10},
    {type="item", name="electronic-circuit", amount=10}
  },
  results = {
    {type="item", name="concrete", amount=10}
  },
})

util.conditional_modify({
  type = "recipe",
  name = "flying-robot-frame",
  normal = {
    ingredients = {
      {type="item", name="electric-engine-unit", amount=4},
      {type="item", name="battery", amount=4},
      {type="item", name="electronic-circuit", amount=4},
      {type="item", name="steel-plate", amount=4}
    },
    results = {
      {type="item", name="concrete", amount=10}
    },
  },
})

util.conditional_modify({
  type = "recipe",
  name = "gun-turret",
  normal = {
    ingredients = {
      {type="item", name="iron-plate", amount=20},
      {type="item", name="iron-gear-wheel", amount=10},
      {type="item", name="motor", amount=5}
    },
    results = {
      {type="item", name="concrete", amount=10}
    },
  },
})

util.conditional_modify({
type = "recipe",
name = "roboport",
normal = {
    ingredients = {
        {type="item", name="steel-plate", amount=50},
        {type="item", name="electric-motor", amount=50},
        {type="item", name="advanced-circuit", amount=50},
        {type="item", name="concrete", amount=50}
    },
    results = {
        {type="item", name="concrete", amount=10}
    },
},
})

util.conditional_modify({
  type = "recipe",
  name = "basic-oil-processing",
  ingredients = {
    {"water", amount=50},
    {"crude-oil", amount=100}
  },
  results = {
    {"petroleum-gas", amount=90}
  },
})

if data.raw.recipe["advanced-oil-processing"] then
  util.conditional_modify({
    type = "recipe",
    name = "advanced-oil-processing",
    ingredients = {
      {"water", amount=50},
      {"crude-oil", amount=100}
    },
    results = {
      {"heavy-oil", amount=20},
      {"light-oil", amount=70},
      {"petroleum-gas", amount=30}
    },
  })
  data.raw.recipe["advanced-oil-processing"].icon = data.raw.fluid["light-oil"].icon
  data.raw.recipe["advanced-oil-processing"].icon_size = data.raw.fluid["light-oil"].icon_size
end


data:extend({
  {
    type = "recipe",
    name = "oil-processing-heavy",
    category = "oil-processing",
    enabled = false,
    energy_required = 2,
    ingredients =
    {
      {"water", amount=10},
      {"crude-oil", amount=100}
    },
    results = {
      {"heavy-oil", amount=70},
      {"light-oil", amount=30},
      {"petroleum-gas", amount=20}
    },
    icon = data.raw.fluid["heavy-oil"].icon,
    icon_size = data.raw.fluid["heavy-oil"].icon_size,
    subgroup = "fluid-recipes",
    order = "a[oil-processing]-b[advanced-oil-processing]"
  }

  
util.conditional_modify({
  type = "recipe",
  name = "car",
  ingredients = {
    {type="item", name="iron-gear-wheel", amount=10},
    {type="item", name="steel-plate", amount=5},
    {type="item", name="engine-unit", amount=5}
  },
  results = {
    {type="item", name="concrete", amount=10}
  },
})

  data:extend({{
      type = "recipe",
      name = "sand-to-solid-sand",
      category = "washing-plant",
      subgroup = data.raw.item["solid-sand"].subgroup or "raw-material",
      normal = {
        energy_required = 0.5,
        enabled = false,
        ingredients = {
          {type="item", name="sand", amount=10},
          {type="fluid", name="water", amount=100},
        },
        results = {
            {type="item", name="solid-sand", amount=10}
        },
      },
  }})

  {
    type = "recipe",
    name = data_util.mod_prefix.."space-probe-rocket-silo",
    result = data_util.mod_prefix.."space-probe-rocket-silo",
    enabled = false,
    energy_required = 50,
    ingredients = {
      { "electric-engine-unit", 200 },
      { "processing-unit", 200 },
      { data_util.mod_prefix .. "heat-shielding", 200 },
      { data_util.mod_prefix .. "holmium-cable", 200 },
      { data_util.mod_prefix .. "heavy-girder", 100 },
      { data_util.mod_prefix .. "aeroframe-scaffold", 100 },
    },
    requester_paste_multiplier = 1,
    always_show_made_in = false,
  },
  {
    type = "recipe",
    name = data_util.mod_prefix.."space-probe-rocket",
    result = data_util.mod_prefix.."space-probe-rocket",
    enabled = false,
    energy_required = 100,
    ingredients = {
      { data_util.mod_prefix.."cargo-rocket-section", 15 },
      { data_util.mod_prefix .. "iridium-plate", 50 },
      { data_util.mod_prefix .. "aeroframe-scaffold", 40 },
      { data_util.mod_prefix .. "holmium-solenoid", 30 },
      { "rocket-fuel", 50 },
    },
    requester_paste_multiplier = 1,
    always_show_made_in = false,
  },
  {
    type = "recipe",
    name = data_util.mod_prefix.."space-probe-rocket-deploy",
    result = data_util.mod_prefix .. "space-probe-rocket-deployed",
    category = "rocket-building",
    enabled = false,
    energy_required = 100,
    hidden = true,
    ingredients = {
      { data_util.mod_prefix.."space-probe-rocket", 1 }
    },
  },

  {
    type = "recipe",
    name = data_util.mod_prefix .. "arcosphere-collector",
    main_product = data_util.mod_prefix .. "arcosphere-collector",
    category = "space-manufacturing",
    subgroup = "arcosphere",
    enabled = false,
    energy_required = 60,
    ingredients = {
      { name = "laser-turret", amount = 2},
      { name = data_util.mod_prefix .. "dynamic-emitter", amount = 2},
      { name = data_util.mod_prefix .. "quantum-processor", amount = 10},
      { name = data_util.mod_prefix .. "naquium-cube", amount = 10},
      { name = data_util.mod_prefix .. "antimatter-canister", amount = 10, catalyst_amount = 10},
      { name = data_util.mod_prefix .. "aeroframe-bulkhead", amount = 50},
    },
    results = {
      { data_util.mod_prefix .. "arcosphere-collector", 1 },
      { name = data_util.mod_prefix .. "magnetic-canister", amount = 10, catalyst_amount = 10},
    },
    requester_paste_multiplier = 1,
    icon_size = 64,
  },

   {
        type = "recipe",
        name = data_util.mod_prefix .. "big-heat-exchanger",
        result = data_util.mod_prefix .. "big-heat-exchanger",
        enabled = false,
        energy_required = 30,
        ingredients = {
            { data_util.mod_prefix .. "lattice-pressure-vessel", 10 },
            { data_util.mod_prefix .. "nanomaterial", 10 },
            { data_util.mod_prefix .. "space-pipe", 50 },
            { data_util.mod_prefix .. "heavy-composite", 20 },
            { data_util.mod_prefix .. "heat-shielding", 50 },
        },
        requester_paste_multiplier = 1,
        always_show_made_in = false,
    },

{
    type = "recipe",
    name = data_util.mod_prefix .. "big-turbine-internal",
    icon = "__space-exploration-graphics__/graphics/icons/fluid/water.png",
    icon_size = 64,
    order = "a",
    subgroup = "spaceship-process",
    energy_required = 4/60, -- try to get craft time in line with generator fluid consumption
    category = "big-turbine",
    ingredients = {
      {type="fluid", "steam", amount=100},
    },
    results = {
      {type="fluid", name="water", amount=78},
      {type="fluid", name="steam", amount=21, temperature = 500},
      {type="fluid", name=data_util.mod_prefix .. "decompressing-steam", amount=98},
    },
    hidden = true,
    enabled = true,
    allow_as_intermediate = false,
    always_show_made_in = true,
  },

  {
      type = "recipe",
      name = data_util.mod_prefix .. "big-turbine",
      result = data_util.mod_prefix .. "big-turbine",
      enabled = false,
      energy_required = 60,
      ingredients = {
        { data_util.mod_prefix .. "lattice-pressure-vessel", 10 },
        { data_util.mod_prefix .. "nanomaterial", 10 },
        { data_util.mod_prefix .. "heavy-assembly", 10 },
        { data_util.mod_prefix .. "space-pipe", 50 },
        { data_util.mod_prefix .. "heat-shielding", 50 },
        { data_util.mod_prefix .. "holmium-solenoid", 20 },
        { data_util.mod_prefix .. "superconductive-cable", 20 },
      },
      requester_paste_multiplier = 1,
      always_show_made_in = false,
  },

  {
      type = "recipe",
      name = data_util.mod_prefix .. "delivery-cannon-capsule",
      result = data_util.mod_prefix .. "delivery-cannon-capsule",
      enabled = false,
      energy_required = 10,
      ingredients = {
        { "low-density-structure", 1 },
        { data_util.mod_prefix .. "heat-shielding", 1 },
        { "explosives", 5 },
        { "copper-cable", 10 },
      },
      requester_paste_multiplier = 1,
      always_show_made_in = false,
  },
  {
      type = "recipe",
      name = data_util.mod_prefix .. "delivery-cannon-capsule-iridium",
      result = data_util.mod_prefix .. "delivery-cannon-capsule",
      enabled = false,
      energy_required = 10,
      ingredients = {
        { data_util.mod_prefix .. "iridium-plate", 5 },
        { "explosives", 5 },
      },
      requester_paste_multiplier = 1,
      always_show_made_in = false,
  },
  {
      type = "recipe",
      name = data_util.mod_prefix .. "delivery-cannon-weapon-capsule",
      result = data_util.mod_prefix .. "delivery-cannon-weapon-capsule",
      enabled = false,
      energy_required = 20,
      ingredients = {
        { "low-density-structure", 10 },
        { data_util.mod_prefix .. "heat-shielding", 10 },
        { data_util.mod_prefix .. "iridium-plate", 10 },
        { data_util.mod_prefix .. "holmium-cable", 20 },
        { "explosives", 50 },
      },
      requester_paste_multiplier = 1,
      always_show_made_in = false,
  },
  {
      type = "recipe",
      name = data_util.mod_prefix .. "delivery-cannon",
      result = data_util.mod_prefix .. "delivery-cannon",
      enabled = false,
      energy_required = 10,
      ingredients = {
        { "steel-chest", 10 },
        { "pipe", 10 },
        { "electric-engine-unit", 10 },
        { data_util.mod_prefix .. "heat-shielding", 10 },
        { "concrete", 20 },
      },
      requester_paste_multiplier = 1,
      always_show_made_in = false,
  },
  {
      type = "recipe",
      name = data_util.mod_prefix .. "delivery-cannon-weapon",
      result = data_util.mod_prefix .. "delivery-cannon-weapon",
      enabled = false,
      energy_required = 30,
      ingredients = {
        { "electric-engine-unit", 50 },
        { data_util.mod_prefix .. "heat-shielding", 50 },
        { data_util.mod_prefix .. "heavy-girder", 100 },
        { data_util.mod_prefix .. "holmium-cable", 200 },
        { data_util.mod_prefix .. "aeroframe-pole", 200 },
        { "processing-unit", 100 },
      },
      requester_paste_multiplier = 1,
      always_show_made_in = false,
  },
  {
      type = "recipe",
      name = data_util.mod_prefix .. "delivery-cannon-chest",
      result = data_util.mod_prefix .. "delivery-cannon-chest",
      enabled = false,
      energy_required = 10,
      ingredients = {
        { "radar", 1 },
        { "steel-chest", 10 },
        { "concrete", 20 },
        { data_util.mod_prefix .. "heat-shielding", 10 },
      },
      requester_paste_multiplier = 1,
      always_show_made_in = false,
  },

 {
        type = "recipe",
        name = data_util.mod_prefix .. "electric-boiler",
        result = data_util.mod_prefix .. "electric-boiler",
        enabled = false,
        energy_required = 3,
        ingredients = {
          { "copper-plate", 100 },
          { "steel-plate", 10 },
          { "pipe", 10 },
          { data_util.mod_prefix .. "heat-shielding", 1 },
        },
        requester_paste_multiplier = 1,
        always_show_made_in = false,
    },

 {
      type = "recipe",
      name = data_util.mod_prefix .. "energy-receiver",
      result = data_util.mod_prefix .. "energy-receiver",
      enabled = false,
      energy_required = 10,
      ingredients = {
        { "glass", 1000 },
        { "copper-plate", 1000 },
        {  data_util.mod_prefix .. "heat-shielding", 100 },
        { data_util.mod_prefix .. "aeroframe-bulkhead", 100 },
        { data_util.mod_prefix .. "superconductive-cable", 20 },
        { data_util.mod_prefix .. "heavy-girder", 100 },
        { "processing-unit", 50 },
      },
      requester_paste_multiplier = 1,
      always_show_made_in = false,
  },
  {
      type = "recipe",
      name = data_util.mod_prefix .. "energy-transmitter-emitter",
      result = data_util.mod_prefix .. "energy-transmitter-emitter",
      enabled = false,
      energy_required = 10,
      ingredients = {
        { "glass", 1000 },
        { data_util.mod_prefix .. "aeroframe-bulkhead", 100 },
        { data_util.mod_prefix .. "superconductive-cable", 200 },
        { data_util.mod_prefix .. "heavy-girder", 200 },
        { "processing-unit", 100 },
      },
      requester_paste_multiplier = 1,
      always_show_made_in = false,
  },
  {
      type = "recipe",
      name = data_util.mod_prefix .. "energy-transmitter-chamber",
      result = data_util.mod_prefix .. "energy-transmitter-chamber",
      enabled = false,
      energy_required = 10,
      ingredients = {
        { "glass", 100 },
        { data_util.mod_prefix .. "aeroframe-bulkhead", 50 },
        { data_util.mod_prefix .. "superconductive-cable", 50 },
        { data_util.mod_prefix .. "heavy-girder", 50 },
      },
      requester_paste_multiplier = 1,
      always_show_made_in = false,
  },
  {
      type = "recipe",
      name = data_util.mod_prefix .. "energy-transmitter-injector",
      result = data_util.mod_prefix .. "energy-transmitter-injector",
      enabled = false,
      energy_required = 10,
      ingredients = {
        { "glass", 100 },
        { data_util.mod_prefix .. "aeroframe-bulkhead", 100 },
        { data_util.mod_prefix .. "superconductive-cable", 100 },
        { data_util.mod_prefix .. "heavy-girder", 100 },
        { "processing-unit", 50 },
      },
      requester_paste_multiplier = 1,
      always_show_made_in = false,
  },

 {
      type = "recipe",
      name = data_util.mod_prefix .. "iridium-piledriver",
      result = data_util.mod_prefix .. "iridium-piledriver",
      enabled = false,
      energy_required = 20,
      ingredients = {
        { data_util.mod_prefix .. "heavy-girder", 50 },
        { "rocket-control-unit", 1 },
        { "explosives", 10 },
      },
      requester_paste_multiplier = 1,
      always_show_made_in = false,
  },

  {
    type = "recipe",
    name = data_util.mod_prefix .. "linked-container",
    category = "space-manufacturing",
    enabled = false,
    ingredients = {
      { name = data_util.mod_prefix .. "heavy-assembly", amount = 10},
      { name = data_util.mod_prefix .. "lattice-pressure-vessel", amount = 10},
      { name = data_util.mod_prefix .. "dynamic-emitter", amount = 10},
      { name = data_util.mod_prefix .. "self-sealing-gel", amount = 10},
      { name = data_util.mod_prefix .. "nanomaterial", amount = 10},
      { name = data_util.mod_prefix .. "naquium-processor", amount = 10},
      { name = data_util.mod_prefix .. "antimatter-canister", amount = 10},
      { name = data_util.mod_prefix .. "arcosphere-a", amount = 10},
    },
    energy_required = 600,
    result = {
        {data_util.mod_prefix .. "linked-container"},
    },
  },

  {
      type = "recipe",
      name = data_util.mod_prefix .. "nexus",
      result = data_util.mod_prefix .. "nexus",
      enabled = false,
      energy_required = 60,
      ingredients = {
        { data_util.mod_prefix .. "aeroframe-bulkhead", 10 },
        { data_util.mod_prefix .. "heavy-assembly", 10 },
        { data_util.mod_prefix .. "naquium-tessaract", 20 },
        { data_util.mod_prefix .. "naquium-processor", 1 },
        { data_util.mod_prefix .. "superconductive-cable", 20 },
      },
      requester_paste_multiplier = 1,
      always_show_made_in = false,
  },
  {
    type = "recipe",
    name = data_util.mod_prefix .. "interstellar-data",
    energy_required = 10000,
    ingredients = {
      { name = data_util.mod_prefix .. "empty-data", amount = 1 },
    },
    results = {
      { name = data_util.mod_prefix .. "interstellar-data", amount = 1 },
    },
    requester_paste_multiplier = 1,
    always_show_made_in = true,
    enabled = false,
    category="nexus"
  },
  {
    type = "recipe",
    name = data_util.mod_prefix .. "distortion-drive",
    energy_required = 600,
    ingredients = {
      { name = data_util.mod_prefix .. "interstellar-data", amount = 1 },
    },
    results = {
      { name = data_util.mod_prefix .. "empty-data", amount = 1 },
    },
    requester_paste_multiplier = 1,
    always_show_made_in = true,
    enabled = false,
    icon =  "__space-exploration-graphics__/graphics/icons/astronomic/anomaly.png",
    icon_size =  64,
    category="nexus",
    localised_name = {"recipe-name."..data_util.mod_prefix .. "distortion-drive"},
    localised_description = {"recipe-description."..data_util.mod_prefix .. "distortion-drive"}
  },

  {
    type = "recipe",
    name = data_util.mod_prefix .. "space-pipe",
    normal = {
      ingredients = {
        { name = "copper-cable", amount = 2 },
        { name = "steel-plate", amount = 1 },
        { name = "plastic-bar", amount = 1 },
        { name = "glass", amount = 1 },
      },
      results = {
        { data_util.mod_prefix .. "space-pipe"},
      },
      energy_required = 10,
      enabled = false,
    },
    always_show_made_in = true,
  },
  {
    type = "recipe",
    name = data_util.mod_prefix .. "space-pipe-to-ground",
    ingredients = {
      { data_util.mod_prefix .. "space-pipe", 10 },
    },
    results = {
        {data_util.mod_prefix .. "space-pipe-to-ground"},
    },
    energy_required = 10,
    result_count = 1,
    enabled = false,
    always_show_made_in = true,
  },
  {
    type = "recipe",
    name = data_util.mod_prefix .. "spaceship-clamp",
    results = {
        {data_util.mod_prefix .. "spaceship-clamp"},
    },
    enabled = false,
    energy_required = 30,
    ingredients = {
        { data_util.mod_prefix .. "aeroframe-scaffold", 10 },
        { data_util.mod_prefix .. "heavy-girder", 6 },
        { "electric-engine-unit", 10 },
        { "processing-unit", 10 },
    },
    requester_paste_multiplier = 1,
    always_show_made_in = false,
  },

  {
    type = "recipe",
    name = data_util.mod_prefix .. "space-transport-belt",
    category = "crafting-with-fluid",
    normal = {
      ingredients = {
        { type = "fluid", name = "lubricant", amount = 20},
        { name = "steel-plate", amount = 6 },
        { name = "iron-plate", amount = 6 },
        { name = "copper-plate", amount = 6 },
      },
      results = {
         data_util.mod_prefix .. "space-transport-belt"},
      },
      energy_required = 10,
      result_count = 1,
      enabled = false,
    },
    always_show_made_in = true,
  },
  {
    type = "recipe",
    name = data_util.mod_prefix .. "space-underground-belt",
    category = "crafting-with-fluid",
    ingredients = {
      { name = "steel-plate", amount = 8 },
      { data_util.mod_prefix .. "space-transport-belt", 8 },
      {
        amount = 40,
        name = "lubricant",
        type = "fluid"
      }
    },
    energy_required = 10,
    results = {
        data_util.mod_prefix .. "space-underground-belt"},
    },
    result_count = 1,
    enabled = false,
    always_show_made_in = true,
  },
  {
    type = "recipe",
    name = data_util.mod_prefix .. "space-splitter",
    category = "crafting-with-fluid",
    ingredients = {
      { name = "steel-plate", amount = 10 },
      { name = "advanced-circuit", amount = 10 },
      { data_util.mod_prefix .. "space-transport-belt", 4 },
      {
        amount = 40,
        name = "lubricant",
        type = "fluid"
      }
    },
    energy_required = 10,
    results = {
        data_util.mod_prefix .. "space-splitter"},
    },
    result_count = 1,
    enabled = false,
    always_show_made_in = true,
  },

{
  type = "recipe",
  name = data_util.mod_prefix.."deep-space-transport-belt",
  ingredients = {
    { name = data_util.mod_prefix.."space-transport-belt", amount = 10 },
    { name = data_util.mod_prefix.."naquium-plate", amount = 4 },
    { name = data_util.mod_prefix.."heavy-bearing", amount = 1 },
    { name = data_util.mod_prefix.."superconductive-cable", amount = 1 },
    { name = data_util.mod_prefix.."aeroframe-scaffold", amount = 1 },
    { name = data_util.mod_prefix.."cryonite-rod", amount = 1 },
    { type = "fluid", name = "lubricant", amount = 50 },
  },
  results = {
        {data_util.mod_prefix.."deep-space-transport-belt-"..default_variant},
  },
  result_count = 10,
  energy_required = 10,
  enabled = false,
  always_show_made_in = true,
  category = "space-manufacturing",
},
{
  type = "recipe",
  name = data_util.mod_prefix.."deep-space-splitter",
  ingredients = {
    { name = data_util.mod_prefix.."space-splitter", amount = 1 },
    { name = data_util.mod_prefix.."deep-space-transport-belt-"..default_variant, amount = 2 },
    { name = data_util.mod_prefix.."naquium-cube", amount = 1 },
    { name = data_util.mod_prefix.."quantum-processor", amount = 1 },
    { name = data_util.mod_prefix.."heavy-assembly", amount = 1 },
    { name = data_util.mod_prefix.."superconductive-cable", amount = 1 },
    { type = "fluid", name = "lubricant", amount = 100 },
  },
  results = {
       {data_util.mod_prefix.."deep-space-splitter-"..default_variant},
  },
  energy_required = 100,
  enabled = false,
  always_show_made_in = true,
  category = "space-manufacturing",
},
{
  type = "recipe",
  name = data_util.mod_prefix.."deep-space-underground-belt",
  ingredients = {
    { name = data_util.mod_prefix.."space-underground-belt", amount = 1 },
    { name = data_util.mod_prefix.."deep-space-transport-belt-"..default_variant, amount = 10 },
    { name = data_util.mod_prefix.."naquium-cube", amount = 1 },
    { name = data_util.mod_prefix.."heavy-composite", amount = 5 },
    { name = data_util.mod_prefix.."aeroframe-scaffold", amount = 10 },
    { name = data_util.mod_prefix.."superconductive-cable", amount = 1 },
    { type = "fluid", name = "lubricant", amount = 100 },
  },
  results = {
      {data_util.mod_prefix.."deep-space-underground-belt-"..default_variant},
  },
  energy_required = 100,
  enabled = false,
  always_show_made_in = true,
  category = "space-manufacturing",
},

  {
      type = "recipe",
      name = data_util.mod_prefix .. "biogun",
      results = {
            {data_util.mod_prefix .. "biogun"},
      },
      enabled = false,
      energy_required = 30,
      ingredients = {
        { "glass", 10 },
        { "steel-plate", 10 },
        { data_util.mod_prefix .. "space-pipe", 1 },
      },
      requester_paste_multiplier = 1,
      always_show_made_in = false,
  },
  {
      type = "recipe",
      name = data_util.mod_prefix .. "pheromone-ammo",
      results = {
            {data_util.mod_prefix .. "pheromone-ammo"},
      },
      enabled = false,
      energy_required = 10,
      ingredients = {
        { data_util.mod_prefix .. "canister", 1 },
        { data_util.mod_prefix .. "vitalic-acid", 10 },
        { type = "fluid", name = data_util.mod_prefix .. "bio-sludge", amount = 100 },
      },
      requester_paste_multiplier = 1,
      always_show_made_in = false,
      category = "chemistry"
  },
  {
      type = "recipe",
      name = data_util.mod_prefix .. "bloater-ammo",
      results = {
            data_util.mod_prefix .. "bloater-ammo"},
      },
      enabled = false,
      energy_required = 10,
      ingredients = {
        { data_util.mod_prefix .. "canister", 1 },
        { data_util.mod_prefix .. "vitalic-acid", 10 },
        { type = "fluid", name = data_util.mod_prefix .. "bio-sludge", amount = 100 },
      },
      requester_paste_multiplier = 1,
      always_show_made_in = false,
      category = "chemistry"
  },



-----------------------------------------------------------------------------------origin--------------------------------------------------------------------------

data:extend(
{
  {
    type = "recipe",
    name = "speed-module",
    enabled = false,
    ingredients = {
      {"advanced-circuit", 5},
      {"electronic-circuit", 5}
    },
    energy_required = 15,
    result = "speed-module"
  },
  {
    type = "recipe",
    name = "speed-module-2",
    enabled = false,
    ingredients = {
      {"speed-module", 4},
      {"advanced-circuit", 5},
      {"processing-unit", 5}
    },
    energy_required = 30,
    result = "speed-module-2"
  },
  {
    type = "recipe",
    name = "speed-module-3",
    enabled = false,
    ingredients = {
      {"speed-module-2", 5},
      {"advanced-circuit", 5},
      {"processing-unit", 5}
    },
    energy_required = 60,
    result = "speed-module-3"
  },
  {
    type = "recipe",
    name = "productivity-module",
    enabled = false,
    ingredients = {
      {"advanced-circuit", 5},
      {"electronic-circuit", 5}
    },
    energy_required = 15,
    result = "productivity-module"
  },
  {
    type = "recipe",
    name = "productivity-module-2",
    enabled = false,
    ingredients = {
      {"productivity-module", 4},
      {"advanced-circuit", 5},
      {"processing-unit", 5}
    },
    energy_required = 30,
    result = "productivity-module-2"
  },
  {
    type = "recipe",
    name = "productivity-module-3",
    enabled = false,
    ingredients = {
      {"productivity-module-2", 5},
      {"advanced-circuit", 5},
      {"processing-unit", 5}
    },
    energy_required = 60,
    result = "productivity-module-3"
  },
  {
    type = "recipe",
    name = "effectivity-module",
    enabled = false,
    ingredients = {
      {"advanced-circuit", 5},
      {"electronic-circuit", 5}
    },
    energy_required = 15,
    result = "effectivity-module"
  },
  {
    type = "recipe",
    name = "effectivity-module-2",
    enabled = false,
    ingredients = {
      {"effectivity-module", 4},
      {"advanced-circuit", 5},
      {"processing-unit", 5}
    },
    energy_required = 30,
    result = "effectivity-module-2"
  },
  {
    type = "recipe",
    name = "effectivity-module-3",
    enabled = false,
    ingredients = {
      {"effectivity-module-2", 5},
      {"advanced-circuit", 5},
      {"processing-unit", 5}
    },
    energy_required = 60,
    result = "effectivity-module-3"
  },
  {
    type = "recipe",
    name = "stack-inserter",
    enabled = false,
    ingredients = {
      {"iron-gear-wheel", 15},
      {"electronic-circuit", 15},
      {"advanced-circuit", 1},
      {"fast-inserter", 1}
    },
    result = "stack-inserter"
  },
  {
    type = "recipe",
    name = "stack-filter-inserter",
    enabled = false,
    ingredients = {
      {"stack-inserter", 1},
      {"electronic-circuit", 5}
    },
    result = "stack-filter-inserter"
  },
  {
    type = "recipe",
    name = "basic-oil-processing",
    category = "oil-processing",
    enabled = false,
    energy_required = 5,
    ingredients = {
      {type = "fluid", name = "crude-oil", amount = 100, fluidbox_index = 2}
    },
    results = {
      {type="fluid", name = "petroleum-gas", amount = 45, fluidbox_index = 3}
    },
    icon = "__base__/graphics/icons/fluid/basic-oil-processing.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "fluid-recipes",
    order = "a[oil-processing]-a[basic-oil-processing]",
    main_product = ""
  },

  {
    type = "recipe",
    name = "advanced-oil-processing",
    category = "oil-processing",
    enabled = false,
    energy_required = 5,
    ingredients = {
      {type = "fluid", name = "water", amount = 50},
      {type = "fluid", name = "crude-oil", amount = 100}
    },
    results = {
      {type = "fluid", name = "heavy-oil", amount = 25},
      {type = "fluid", name = "light-oil", amount = 45},
      {type = "fluid", name = "petroleum-gas", amount = 55}
    },
    icon = "__base__/graphics/icons/fluid/advanced-oil-processing.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "fluid-recipes",
    order = "a[oil-processing]-b[advanced-oil-processing]"
  },

  {
    type = "recipe",
    name = "coal-liquefaction",
    category = "oil-processing",
    enabled = false,
    energy_required = 5,
    ingredients = {
      {type = "item", name = "coal", amount = 10},
      {type = "fluid", name = "heavy-oil", amount = 25},
      {type = "fluid", name = "steam", amount = 50}
    },
    results = {
      {type = "fluid", name = "heavy-oil", amount = 90},
      {type = "fluid", name = "light-oil", amount = 20},
      {type = "fluid", name = "petroleum-gas", amount = 10}
    },
    icon = "__base__/graphics/icons/fluid/coal-liquefaction.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "fluid-recipes",
    order = "a[oil-processing]-c[coal-liquefaction]",
    allow_decomposition = false
  },

  {
    type = "recipe",
    name = "heavy-oil-cracking",
    category = "chemistry",
    enabled = false,
    energy_required = 2,
    ingredients = {
      {type = "fluid", name = "water", amount = 30},
      {type = "fluid", name = "heavy-oil", amount = 40}
    },
    results = {
      {type = "fluid", name = "light-oil", amount = 30}
    },
    main_product= "",
    icon = "__base__/graphics/icons/fluid/heavy-oil-cracking.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "fluid-recipes",
    order = "b[fluid-chemistry]-a[heavy-oil-cracking]",
    crafting_machine_tint =
    {
      primary = {r = 1.000, g = 0.642, b = 0.261, a = 1.000}, -- #ffa342ff
      secondary = {r = 1.000, g = 0.722, b = 0.376, a = 1.000}, -- #ffb85fff
      tertiary = {r = 0.854, g = 0.659, b = 0.576, a = 1.000}, -- #d9a892ff
      quaternary = {r = 1.000, g = 0.494, b = 0.271, a = 1.000}, -- #ff7e45ff
    }
  },

  {
    type = "recipe",
    name = "light-oil-cracking",
    category = "chemistry",
    enabled = false,
    energy_required = 2,
    ingredients = {
      {type = "fluid", name = "water", amount = 30},
      {type = "fluid", name = "light-oil", amount = 30}
    },
    results = {
      {type = "fluid", name = "petroleum-gas", amount = 20}
    },
    main_product= "",
    icon = "__base__/graphics/icons/fluid/light-oil-cracking.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "fluid-recipes",
    order = "b[fluid-chemistry]-b[light-oil-cracking]",
    crafting_machine_tint =
    {
      primary = {r = 0.764, g = 0.596, b = 0.780, a = 1.000}, -- #c298c6ff
      secondary = {r = 0.762, g = 0.551, b = 0.844, a = 1.000}, -- #c28cd7ff
      tertiary = {r = 0.895, g = 0.773, b = 0.596, a = 1.000}, -- #e4c597ff
      quaternary = {r = 1.000, g = 0.734, b = 0.290, a = 1.000}, -- #ffbb49ff
    }
  },

  {
    type = "recipe",
    name = "sulfuric-acid",
    category = "chemistry",
    energy_required = 1,
    enabled = false,
    ingredients = {
      {type = "item", name = "sulfur", amount = 5},
      {type = "item", name = "iron-plate", amount = 1},
      {type = "fluid", name = "water", amount = 100}
    },
    results = {
      {type = "fluid", name = "sulfuric-acid", amount = 50}
    },
    subgroup = "fluid-recipes",
    crafting_machine_tint =
    {
      primary = {r = 1.000, g = 0.958, b = 0.000, a = 1.000}, -- #fff400ff
      secondary = {r = 1.000, g = 0.852, b = 0.172, a = 1.000}, -- #ffd92bff
      tertiary = {r = 0.876, g = 0.869, b = 0.597, a = 1.000}, -- #dfdd98ff
      quaternary = {r = 0.969, g = 1.000, b = 0.019, a = 1.000}, -- #f7ff04ff
    }
  },

  {
    type = "recipe",
    name = "plastic-bar",
    category = "chemistry",
    energy_required = 1,
    enabled = false,
    ingredients = {
      {type = "fluid", name = "petroleum-gas", amount = 20},
      {type = "item", name = "coal", amount = 1}
    },
    results = {
      {type = "item", name = "plastic-bar", amount = 2}
    },
    crafting_machine_tint =
    {
      primary = {r = 1.000, g = 1.000, b = 1.000, a = 1.000}, -- #fefeffff
      secondary = {r = 0.771, g = 0.771, b = 0.771, a = 1.000}, -- #c4c4c4ff
      tertiary = {r = 0.768, g = 0.665, b = 0.762, a = 1.000}, -- #c3a9c2ff
      quaternary = {r = 0.000, g = 0.000, b = 0.000, a = 1.000}, -- #000000ff
    }
  },

  {
    type = "recipe",
    name = "solid-fuel-from-light-oil",
    category = "chemistry",
    energy_required = 2,
    ingredients = {
      {type = "fluid", name = "light-oil", amount = 10}
    },
    results = {
      {type = "item", name = "solid-fuel", amount = 1}
    },
    icon = "__base__/graphics/icons/solid-fuel-from-light-oil.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "fluid-recipes",
    enabled = false,
    order = "b[fluid-chemistry]-c[solid-fuel-from-light-oil]",
    crafting_machine_tint =
    {
      primary = {r = 0.710, g = 0.633, b = 0.482, a = 1.000}, -- #b5a17aff
      secondary = {r = 0.745, g = 0.672, b = 0.527, a = 1.000}, -- #beab86ff
      tertiary = {r = 0.894, g = 0.773, b = 0.596, a = 1.000}, -- #e4c598ff
      quaternary = {r = 0.812, g = 0.583, b = 0.202, a = 1.000}, -- #cf9433ff
    }
  },

  {
    type = "recipe",
    name = "solid-fuel-from-petroleum-gas",
    category = "chemistry",
    energy_required = 2,
    ingredients = {
      {type = "fluid", name = "petroleum-gas", amount = 20}
    },
    results = {
      {type = "item", name = "solid-fuel", amount = 1}
    },
    icon = "__base__/graphics/icons/solid-fuel-from-petroleum-gas.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "fluid-recipes",
    enabled = false,
    order = "b[fluid-chemistry]-d[solid-fuel-from-petroleum-gas]",
    crafting_machine_tint =
    {
      primary = {r = 0.768, g = 0.631, b = 0.768, a = 1.000}, -- #c3a0c3ff
      secondary = {r = 0.659, g = 0.592, b = 0.678, a = 1.000}, -- #a896acff
      tertiary = {r = 0.774, g = 0.631, b = 0.766, a = 1.000}, -- #c5a0c3ff
      quaternary = {r = 0.564, g = 0.364, b = 0.564, a = 1.000}, -- #8f5c8fff
    }
  },

  {
    type = "recipe",
    name = "solid-fuel-from-heavy-oil",
    category = "chemistry",
    energy_required = 2,
    ingredients = {
      {type = "fluid", name = "heavy-oil", amount = 20}
    },
    results = {
      {type = "item", name = "solid-fuel", amount = 1}
    },
    icon = "__base__/graphics/icons/solid-fuel-from-heavy-oil.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "fluid-recipes",
    enabled = false,
    order = "b[fluid-chemistry]-e[solid-fuel-from-heavy-oil]",
    crafting_machine_tint =
    {
      primary = {r = 0.889, g = 0.628, b = 0.566, a = 1.000}, -- #e2a090ff
      secondary = {r = 0.803, g = 0.668, b = 0.644, a = 1.000}, -- #ccaaa4ff
      tertiary = {r = 0.854, g = 0.659, b = 0.576, a = 1.000}, -- #d9a892ff
      quaternary = {r = 1.000, g = 0.395, b = 0.127, a = 1.000}, -- #ff6420ff
    }
  },

  {
    type = "recipe",
    name = "sulfur",
    category = "chemistry",
    energy_required = 1,
    enabled = false,
    ingredients = {
      {type = "fluid", name = "water", amount = 30},
      {type = "fluid", name = "petroleum-gas", amount = 30}
    },
    results = {
      {type = "item", name = "sulfur", amount = 2}
    },
    crafting_machine_tint =
    {
      primary = {r = 1.000, g = 0.995, b = 0.089, a = 1.000}, -- #fffd16ff
      secondary = {r = 1.000, g = 0.974, b = 0.691, a = 1.000}, -- #fff8b0ff
      tertiary = {r = 0.723, g = 0.638, b = 0.714, a = 1.000}, -- #b8a2b6ff
      quaternary = {r = 0.954, g = 1.000, b = 0.350, a = 1.000}, -- #f3ff59ff
    }
  },

  {
    type = "recipe",
    name = "lubricant",
    category = "chemistry",
    enabled = false,
    energy_required = 1,
    ingredients = {
      {type = "fluid", name = "heavy-oil", amount = 10}
    },
    results = {
      {type = "fluid", name = "lubricant", amount = 10}
    },
    subgroup = "fluid-recipes",
    crafting_machine_tint =
    {
      primary = {r = 0.268, g = 0.723, b = 0.223, a = 1.000}, -- #44b838ff
      secondary = {r = 0.432, g = 0.793, b = 0.386, a = 1.000}, -- #6eca62ff
      tertiary = {r = 0.647, g = 0.471, b = 0.396, a = 1.000}, -- #a57865ff
      quaternary = {r = 1.000, g = 0.395, b = 0.127, a = 1.000}, -- #ff6420ff
    }
  },

  {
    type = "recipe",
    name = "empty-barrel",
    category = "crafting",
    energy_required = 1,
    subgroup = "intermediate-product",
    enabled = false,
    ingredients = {
      {name = "steel-plate", amount = 1}
    },
    results = {
      {name = "empty-barrel", amount = 1}
    }
  },
  {
    type = "recipe",
    name = "night-vision-equipment",
    enabled = false,
    energy_required = 10,
    ingredients = {
      {"advanced-circuit", 5},
      {"steel-plate", 10}
    },
    result = "night-vision-equipment"
  },
  {
    type = "recipe",
    name = "belt-immunity-equipment",
    enabled = false,
    energy_required = 10,
    ingredients = {
      {"advanced-circuit", 5},
      {"steel-plate", 10}
    },
    result = "belt-immunity-equipment"
  },
  {
    type = "recipe",
    name = "energy-shield-equipment",
    enabled = false,
    energy_required = 10,
    ingredients = {
      {"advanced-circuit", 5},
      {"steel-plate", 10}
    },
    result = "energy-shield-equipment"
  },
  {
    type = "recipe",
    name = "energy-shield-mk2-equipment",
    enabled = false,
    energy_required = 10,
    ingredients = {
      {"energy-shield-equipment", 10},
      {"processing-unit", 5},
      {"low-density-structure", 5}
    },
    result = "energy-shield-mk2-equipment"
  },
  {
    type = "recipe",
    name = "battery-equipment",
    enabled = false,
    energy_required = 10,
    ingredients = {
      {"battery", 5},
      {"steel-plate", 10}
    },
    result = "battery-equipment"
  },
  {
    type = "recipe",
    name = "battery-mk2-equipment",
    enabled = false,
    energy_required = 10,
    ingredients = {
      {"battery-equipment", 10},
      {"processing-unit", 15},
      {"low-density-structure", 5}
    },
    result = "battery-mk2-equipment"
  },
  {
    type = "recipe",
    name = "solar-panel-equipment",
    enabled = false,
    energy_required = 10,
    ingredients = {
      {"solar-panel", 1},
      {"advanced-circuit", 2},
      {"steel-plate", 5}
    },
    result = "solar-panel-equipment"
  },
  {
    type = "recipe",
    name = "fusion-reactor-equipment",
    enabled = false,
    energy_required = 10,
    ingredients = {
      {"processing-unit", 200},
      {"low-density-structure", 50}
    },
    result = "fusion-reactor-equipment"
  },
  {
    type = "recipe",
    name = "personal-laser-defense-equipment",
    enabled = false,
    energy_required = 10,
    ingredients = {
      {"processing-unit", 20},
      {"low-density-structure", 5},
      {"laser-turret", 5}
    },
    result = "personal-laser-defense-equipment"
  },
  {
    type = "recipe",
    name = "discharge-defense-equipment",
    enabled = false,
    energy_required = 10,
    ingredients = {
      {"processing-unit", 5},
      {"steel-plate", 20},
      {"laser-turret", 10}
    },
    result = "discharge-defense-equipment"
  },
  {
    type = "recipe",
    name = "discharge-defense-remote",
    enabled = false,
    ingredients = {{"electronic-circuit", 1}},
    result = "discharge-defense-remote"
  },
  {
    type = "recipe",
    name = "exoskeleton-equipment",
    enabled = false,
    energy_required = 10,
    ingredients = {
      {"processing-unit", 10},
      {"electric-engine-unit", 30},
      {"steel-plate", 20}
    },
    result = "exoskeleton-equipment"
  },
  {
    type = "recipe",
    name = "personal-roboport-equipment",
    enabled = false,
    energy_required = 10,
    ingredients = {
      {"advanced-circuit", 10},
      {"iron-gear-wheel", 40},
      {"steel-plate", 20},
      {"battery", 45}
    },
    result = "personal-roboport-equipment"
  },
  {
    type = "recipe",
    name = "personal-roboport-mk2-equipment",
    enabled = false,
    energy_required = 20,
    ingredients = {
      {"personal-roboport-equipment", 5},
      {"processing-unit", 100},
      {"low-density-structure", 20}
    },
    result = "personal-roboport-mk2-equipment"
  },
  {
    type = "recipe",
    name = "laser-turret",
    enabled = false,
    energy_required = 20,
    ingredients = {
      {"steel-plate", 20},
      {"electronic-circuit", 20},
      {"battery", 12}
    },
    result = "laser-turret"
  },
  {
    type = "recipe",
    name = "flamethrower-turret",
    enabled = false,
    energy_required = 20,
    ingredients = {
      {"steel-plate", 30},
      {"iron-gear-wheel", 15},
      {"pipe", 10},
      {"engine-unit", 5}
    },
    result = "flamethrower-turret"
  },
  {
    type = "recipe",
    name = "artillery-turret",
    enabled = false,
    energy_required = 40,
    ingredients = {
      {"steel-plate", 60},
      {"concrete", 60},
      {"iron-gear-wheel", 40},
      {"advanced-circuit", 20}
    },
    result = "artillery-turret"
  },
  {
    type = "recipe",
    name = "artillery-targeting-remote",
    enabled = false,
    ingredients = {
      {"processing-unit", 1},
      {"radar", 1}
    },
    result = "artillery-targeting-remote"
  },
  {
    type = "recipe",
    name = "gun-turret",
    enabled = false,
    energy_required = 8,
    ingredients = {
      {"iron-gear-wheel", 10},
      {"copper-plate", 10},
      {"iron-plate", 20}
    },
    result = "gun-turret"
  },
  {
    type = "recipe",
    name = "wooden-chest",
    ingredients = {
        {"wood", 2}
    },
    result = "wooden-chest"
  },
  {
    type = "recipe",
    name = "iron-stick",
    ingredients = {
        {"iron-plate", 1}
    },
    result = "iron-stick",
    result_count = 2
  },
  {
    type = "recipe",
    name = "stone-furnace",
    ingredients = {
        {"stone", 5}
    },
    result = "stone-furnace"
  },
  {
    type = "recipe",
    name = "boiler",
    ingredients = {
        {"stone-furnace", 1},
        {"pipe", 4}
    },
    result = "boiler"
  },
  {
    type = "recipe",
    name = "steam-engine",
    normal =
    {
      ingredients = {
        {"iron-gear-wheel", 8},
        {"pipe", 5},
        {"iron-plate", 10}
      },
      result = "steam-engine"
    },
  },
  {
    type = "recipe",
    name = "iron-gear-wheel",
    normal =
    {
      ingredients = {
        {"iron-plate", 2}
      },
      result = "iron-gear-wheel"
    },
  },
  {
    type = "recipe",
    name = "electronic-circuit",
    normal =
    {
      ingredients = {
        {"iron-plate", 1},
        {"copper-cable", 3}
      },
      result = "electronic-circuit"
    },
  },
  {
    type = "recipe",
    name = "transport-belt",
    ingredients = {
      {"iron-plate", 1},
      {"iron-gear-wheel", 1}
    },
    result = "transport-belt",
    result_count = 2
  },
  {
    type = "recipe",
    name = "electric-mining-drill",
    normal =
    {
      energy_required = 2,
      ingredients = {
        {"electronic-circuit", 3},
        {"iron-gear-wheel", 5},
        {"iron-plate", 10}
      },
      result = "electric-mining-drill"
    },
  },
  {
    type = "recipe",
    name = "burner-mining-drill",
    normal =
    {
      energy_required = 2,
      ingredients = {
        {"iron-gear-wheel", 3},
        {"stone-furnace", 1},
        {"iron-plate", 3}
      },
      result = "burner-mining-drill"
    },
  },
  {
    type = "recipe",
    name = "inserter",
    ingredients = {
      {"electronic-circuit", 1},
      {"iron-gear-wheel", 1},
      {"iron-plate", 1}
    },
    result = "inserter"
  },
  {
    type = "recipe",
    name = "fast-inserter",
    enabled = false,
    ingredients = {
      {"electronic-circuit", 2},
      {"iron-plate", 2},
      {"inserter", 1}
    },
    result = "fast-inserter"
  },
  {
    type = "recipe",
    name = "filter-inserter",
    enabled = false,
    ingredients = {
      {"fast-inserter", 1},
      {"electronic-circuit", 4}
    },
    result = "filter-inserter"
  },
  {
    type = "recipe",
    name = "long-handed-inserter",
    enabled = false,
    ingredients = {
      {"iron-gear-wheel", 1},
      {"iron-plate", 1},
      {"inserter", 1}
    },
    result = "long-handed-inserter"
  },
  {
    type = "recipe",
    name = "burner-inserter",
    ingredients = {
      {"iron-plate", 1},
      {"iron-gear-wheel", 1}
    },
    result = "burner-inserter"
  },
  {
    type = "recipe",
    name = "pipe",
    normal =
    {
      ingredients = {
        {"iron-plate", 1}
      },
      result = "pipe"
    },
  },
  {
    type = "recipe",
    name = "offshore-pump",
    ingredients = {
      {"electronic-circuit", 2},
      {"pipe", 1},
      {"iron-gear-wheel", 1}
    },
    result = "offshore-pump"
  },
  {
    type = "recipe",
    name = "copper-cable",
    ingredients = {
        {"copper-plate", 1}
    },
    result = "copper-cable",
    result_count = 2
  },
  {
    type = "recipe",
    name = "small-electric-pole",
    ingredients = {
      {"wood", 1},
      {"copper-cable", 2}
    },
    result = "small-electric-pole",
    result_count = 2
  },
  {
    type = "recipe",
    name = "pistol",
    energy_required = 5,
    ingredients = {
      {"copper-plate", 5},
      {"iron-plate", 5}
    },
    result = "pistol"
  },
  {
    type = "recipe",
    name = "submachine-gun",
    normal =
    {
      enabled = false,
      energy_required = 10,
      ingredients = {
        {"iron-gear-wheel", 10},
        {"copper-plate", 5},
        {"iron-plate", 10}
      },
      result = "submachine-gun"
    },
  },
  {
    type = "recipe",
    name = "firearm-magazine",
    energy_required = 1,
    ingredients = {
        {"iron-plate", 4}
    },
    result = "firearm-magazine",
    result_count = 1
  },
  {
    type = "recipe",
    name = "light-armor",
    enabled = true,
    energy_required = 3,
    ingredients = {
        {"iron-plate", 40}
    },
    result = "light-armor"
  },
  {
    type = "recipe",
    name = "radar",
    ingredients = {
      {"electronic-circuit", 5},
      {"iron-gear-wheel", 5},
      {"iron-plate", 10}
    },
    result = "radar"
  },
  {
    type = "recipe",
    name = "small-lamp",
    enabled = false,
    ingredients = {
      {"electronic-circuit", 1},
      {"copper-cable", 3},
      {"iron-plate", 1}
    },
    result = "small-lamp"
  },
  {
    type = "recipe",
    name = "pipe-to-ground",
    ingredients = {
      {"pipe", 10},
      {"iron-plate", 5}
    },
    result_count = 2,
    result = "pipe-to-ground"
  },
  {
    type = "recipe",
    name = "assembling-machine-1",
    enabled = false,
    ingredients = {
      {"electronic-circuit", 3},
      {"iron-gear-wheel", 5},
      {"iron-plate", 9}
    },
    result = "assembling-machine-1"
  },
  {
    type = "recipe",
    name = "repair-pack",
    ingredients = {
      {"electronic-circuit", 2},
      {"iron-gear-wheel", 2}
    },
    result = "repair-pack"
  },
  {
    type = "recipe",
    name = "automation-science-pack",
    energy_required = 5,
    ingredients = {
      {"copper-plate", 1},
      {"iron-gear-wheel", 1}
    },
    result = "automation-science-pack"
  },
  {
    type = "recipe",
    name = "logistic-science-pack",
    enabled = false,
    energy_required = 6,
    ingredients = {
      {"inserter", 1},
      {"transport-belt", 1}
    },
    result = "logistic-science-pack"
  },
  {
    type = "recipe",
    name = "lab",
    energy_required = 2,
    ingredients = {
      {"electronic-circuit", 10},
      {"iron-gear-wheel", 10},
      {"transport-belt", 4}
    },
    result = "lab"
  },
  {
    type = "recipe",
    name = "stone-wall",
    enabled = false,
    ingredients = {
        {"stone-brick", 5}
    },
    result = "stone-wall"
  },
  {
    type = "recipe",
    name = "assembling-machine-2",
    normal =
    {
      enabled = false,
      ingredients = {
        {"steel-plate", 2},
        {"electronic-circuit", 3},
        {"iron-gear-wheel", 5},
        {"assembling-machine-1", 1}
      },
      result = "assembling-machine-2"
    },
  },
  {
    type = "recipe",
    name = "splitter",
    enabled = false,
    energy_required = 1,
    ingredients = {
      {"electronic-circuit", 5},
      {"iron-plate", 5},
      {"transport-belt", 4}
    },
    result = "splitter"
  },
  {
    type = "recipe",
    name = "underground-belt",
    enabled = false,
    energy_required = 1,
    ingredients = {
      {"iron-plate", 10},
      {"transport-belt", 5}
    },
    result_count = 2,
    result = "underground-belt"
  },
  {
    type = "recipe",
    name = "loader",
    enabled = false,
    hidden = true,
    energy_required = 1,
    ingredients = {
      {"inserter", 5},
      {"electronic-circuit", 5},
      {"iron-gear-wheel", 5},
      {"iron-plate", 5},
      {"transport-belt", 5}
    },
    result = "loader"
  },
  {
    type = "recipe",
    name = "car",
    enabled = false,
    energy_required = 2,
    ingredients = {
      {"engine-unit", 8},
      {"iron-plate", 20},
      {"steel-plate", 5}
    },
    result = "car"
  },
  {
    type = "recipe",
    name = "engine-unit",
    energy_required = 10,
    category = "advanced-crafting",
    ingredients = {
      {"steel-plate", 1},
      {"iron-gear-wheel", 1},
      {"pipe", 2}
    },
    result = "engine-unit",
    enabled = false
  },
  {
    type = "recipe",
    name = "iron-chest",
    enabled = true,
    ingredients = {
        {"iron-plate", 8}
    },
    result = "iron-chest"
  },
  {
    type = "recipe",
    name = "big-electric-pole",
    enabled = false,
    ingredients = {
      {"iron-stick", 8},
      {"steel-plate", 5},
      {"copper-plate", 5}
    },
    result = "big-electric-pole"
  },
  {
    type = "recipe",
    name = "medium-electric-pole",
    enabled = false,
    ingredients = {
      {"iron-stick", 4},
      {"steel-plate", 2},
      {"copper-plate", 2}
    },
    result = "medium-electric-pole"
  },
  {
    type = "recipe",
    name = "shotgun",
    enabled = false,
    energy_required = 10,
    ingredients = {
      {"iron-plate", 15},
      {"iron-gear-wheel", 5},
      {"copper-plate", 10},
      {"wood", 5}
    },
    result = "shotgun"
  },
  {
    type = "recipe",
    name = "shotgun-shell",
    enabled = false,
    energy_required = 3,
    ingredients = {
      {"copper-plate", 2},
      {"iron-plate", 2}
    },
    result = "shotgun-shell"
  },
  {
    type = "recipe",
    name = "piercing-rounds-magazine",
    enabled = false,
    energy_required = 3,
    ingredients = {
      {"firearm-magazine", 1},
      {"steel-plate", 1},
      {"copper-plate", 5}
    },
    result = "piercing-rounds-magazine"
  },
  {
    type = "recipe",
    name = "grenade",
    enabled = false,
    energy_required = 8,
    ingredients = {
      {"iron-plate", 5},
      {"coal", 10}
    },
    result = "grenade"
  },
  {
    type = "recipe",
    name = "steel-furnace",
    ingredients = {
        {"steel-plate", 6},
        {"stone-brick", 10}
    },
    result = "steel-furnace",
    energy_required = 3,
    enabled = false
  },
  {
    type = "recipe",
    name = "gate",
    enabled = false,
    ingredients = {
        {"stone-wall", 1},
        {"steel-plate", 2},
        {"electronic-circuit", 2}
    },
    result = "gate"
  },
  {
    type = "recipe",
    name = "heavy-armor",
    enabled = false,
    energy_required = 8,
    ingredients = {
        { "copper-plate", 100},
        {"steel-plate", 50}
    },
    result = "heavy-armor"
  },
  {
    type = "recipe",
    name = "steel-chest",
    enabled = false,
    ingredients = {{"steel-plate", 8}},
    result = "steel-chest"
  },
  {
    type = "recipe",
    name = "fast-underground-belt",
    energy_required = 2,
    enabled = false,
    ingredients = {
      {"iron-gear-wheel", 40},
      {"underground-belt", 2}
    },
    result_count = 2,
    result = "fast-underground-belt"
  },
  {
    type = "recipe",
    name = "fast-splitter",
    enabled = false,
    energy_required = 2,
    ingredients = {
      {"splitter", 1},
      {"iron-gear-wheel", 10},
      {"electronic-circuit", 10}
    },
    result = "fast-splitter"
  },
  {
    type = "recipe",
    name = "concrete",
    energy_required = 10,
    enabled = false,
    category = "crafting-with-fluid",
    ingredients = {
      {"stone-brick", 5},
      {"iron-ore", 1},
      {type = "fluid", name = "water", amount = 100}
    },
    result= "concrete",
    result_count = 10
  },
  {
    type = "recipe",
    name = "hazard-concrete",
    energy_required = 0.25,
    enabled = false,
    category = "crafting",
    ingredients = {
      {"concrete", 10}
    },
    result= "hazard-concrete",
    result_count = 10
  },
  {
    type = "recipe",
    name = "refined-concrete",
    energy_required = 15,
    enabled = false,
    category = "crafting-with-fluid",
    ingredients = {
      {"concrete", 20},
      {"iron-stick", 8},
      {"steel-plate", 1},
      {type = "fluid", name = "water", amount = 100}
    },
    result= "refined-concrete",
    result_count = 10
  },
  {
    type = "recipe",
    name = "refined-hazard-concrete",
    energy_required = 0.25,
    enabled = false,
    category = "crafting",
    ingredients = {
      {"refined-concrete", 10}
    },
    result= "refined-hazard-concrete",
    result_count = 10
  },
  {
    type = "recipe",
    name = "landfill",
    energy_required = 0.5,
    enabled = false,
    category = "crafting",
    ingredients = {
      {"stone", 20}
    },
    result= "landfill",
    result_count = 1
  },
  {
    type = "recipe",
    name = "fast-transport-belt",
    enabled = false,
    ingredients = {
      {"iron-gear-wheel", 5},
      {"transport-belt", 1}
    },
    result = "fast-transport-belt"
  },
  {
    type = "recipe",
    name = "solar-panel",
    energy_required = 10,
    enabled = false,
    ingredients = {
      {"steel-plate", 5},
      {"electronic-circuit", 15},
      {"copper-plate", 5}
    },
    result = "solar-panel"
  },
  {
    type = "recipe",
    name = "rail",
    enabled = false,
    ingredients = {
      {"stone", 1},
      {"iron-stick", 1},
      {"steel-plate", 1}
    },
    result = "rail",
    result_count = 2
  },
  {
    type = "recipe",
    name = "locomotive",
    energy_required = 4,
    enabled = false,
    ingredients = {
      {"engine-unit", 20},
      {"electronic-circuit", 10},
      {"steel-plate", 30}
    },
    result = "locomotive"
  },
  {
    type = "recipe",
    name = "cargo-wagon",
    energy_required = 1,
    enabled = false,
    ingredients = {
      {"iron-gear-wheel", 10},
      {"iron-plate", 20},
      {"steel-plate", 20}
    },
    result = "cargo-wagon"
  },
  {
    type = "recipe",
    name = "rail-signal",
    enabled = false,
    ingredients = {
      {"electronic-circuit", 1},
      {"iron-plate", 5}
    },
    result = "rail-signal"
  },
  {
    type = "recipe",
    name = "rail-chain-signal",
    enabled = false,
    ingredients = {
      {"electronic-circuit", 1},
      {"iron-plate", 5}
    },
    result = "rail-chain-signal"
  },
  {
    type = "recipe",
    name = "train-stop",
    enabled = false,
    ingredients = {
      {"electronic-circuit", 5},
      {"iron-plate", 6},
      {"iron-stick", 6},
      {"steel-plate", 3}
    },
    result = "train-stop"
  },
  {
    type = "recipe",
    name = "copper-plate",
    category = "smelting",
    energy_required = 3.2,
    ingredients = {
        { "copper-ore", 1}
    },
    result = "copper-plate"
  },
  {
    type = "recipe",
    name = "iron-plate",
    category = "smelting",
    energy_required = 3.2,
    ingredients = {
        {"iron-ore", 1}
    },
    result = "iron-plate"
  },
  {
    type = "recipe",
    name = "stone-brick",
    category = "smelting",
    energy_required = 3.2,
    enabled = true,
    ingredients = {
        {"stone", 2}
    },
    result = "stone-brick"
  },
  {
    type = "recipe",
    name = "steel-plate",
    category = "smelting",
    normal =
    {
      enabled = false,
      energy_required = 16,
      ingredients = {
        {"iron-plate", 5}
      },
      result = "steel-plate"
    },
  },
  {
    type = "recipe",
    name = "arithmetic-combinator",
    enabled = false,
    ingredients = {
      {"copper-cable", 5},
      {"electronic-circuit", 5}
    },
    result = "arithmetic-combinator"
  },
  {
    type = "recipe",
    name = "decider-combinator",
    enabled = false,
    ingredients = {
      {"copper-cable", 5},
      {"electronic-circuit", 5}
    },
    result = "decider-combinator"
  },
  {
    type = "recipe",
    name = "constant-combinator",
    enabled = false,
    ingredients = {
      {"copper-cable", 5},
      {"electronic-circuit", 2}
    },
    result = "constant-combinator"
  },
  {
    type = "recipe",
    name = "power-switch",
    enabled = false,
    energy_required = 2,
    ingredients = {
      {"iron-plate", 5},
      {"copper-cable", 5},
      {"electronic-circuit", 2}
    },
    result = "power-switch"
  },
  {
    type = "recipe",
    name = "programmable-speaker",
    enabled = false,
    energy_required = 2,
    ingredients = {
      {"iron-plate", 3},
      {"iron-stick", 4},
      {"copper-cable", 5},
      {"electronic-circuit", 4}
    },
    result = "programmable-speaker"
  },
  {
    type = "recipe",
    name = "red-wire",
    enabled = false,
    ingredients = {
      {"electronic-circuit", 1},
      {"copper-cable", 1}
    },
    result = "red-wire"
  },
  {
    type = "recipe",
    name = "green-wire",
    enabled = false,
    ingredients = {
      {"electronic-circuit", 1},
      {"copper-cable", 1}
    },
    result = "green-wire"
  },
  {
    type = "recipe",
    name = "poison-capsule",
    enabled = false,
    energy_required = 8,
    ingredients = {
      {"steel-plate", 3},
      {"electronic-circuit", 3},
      {"coal", 10}
    },
    result = "poison-capsule"
  },
  {
    type = "recipe",
    name = "slowdown-capsule",
    enabled = false,
    energy_required = 8,
    ingredients = {
      {"steel-plate", 2},
      {"electronic-circuit", 2},
      {"coal", 5}
    },
    result = "slowdown-capsule"
  },
  {
    type = "recipe",
    name = "cluster-grenade",
    enabled = false,
    energy_required = 8,
    ingredients = {
      {"grenade", 7},
      {"explosives", 5},
      {"steel-plate", 5}
    },
    result = "cluster-grenade"
  },
  {
    type = "recipe",
    name = "defender-capsule",
    enabled = false,
    energy_required = 8,
    ingredients = {
      {"piercing-rounds-magazine", 3},
      {"electronic-circuit", 3},
      {"iron-gear-wheel", 3}
    },
    result = "defender-capsule"
  },
  {
    type = "recipe",
    name = "distractor-capsule",
    enabled = false,
    energy_required = 15,
    ingredients = {
      {"defender-capsule", 4},
      {"advanced-circuit", 3}
    },
    result = "distractor-capsule"
  },
  {
    type = "recipe",
    name = "destroyer-capsule",
    enabled = false,
    energy_required = 15,
    ingredients = {
      {"distractor-capsule", 4},
      {"speed-module", 1}
    },
    result = "destroyer-capsule"
  },
  {
    type = "recipe",
    name = "cliff-explosives",
    enabled = false,
    energy_required = 8,
    ingredients = {
      {"explosives", 10},
      {"grenade", 1},
      {"empty-barrel", 1}
    },
    result = "cliff-explosives"
  },
  {
    type = "recipe",
    name = "uranium-rounds-magazine",
    enabled = false,
    energy_required = 10,
    ingredients = {
      {"piercing-rounds-magazine", 1},
      {"uranium-238", 1}
    },
    result = "uranium-rounds-magazine"
  },
  {
    type = "recipe",
    name = "rocket",
    enabled = false,
    energy_required = 8,
    ingredients = {
      {"electronic-circuit", 1},
      {"explosives", 1},
      {"iron-plate", 2}
    },
    result = "rocket"
  },
  {
    type = "recipe",
    name = "explosive-rocket",
    enabled = false,
    energy_required = 8,
    ingredients = {
      {"rocket", 1},
      {"explosives", 2}
    },
    result = "explosive-rocket"
  },
  {
    type = "recipe",
    name = "atomic-bomb",
    enabled = false,
    energy_required = 50,
    ingredients = {
      {"rocket-control-unit", 10},
      {"explosives", 10},
      {"uranium-235", 30}
    },
    result = "atomic-bomb"
  },
  {
    type = "recipe",
    name = "piercing-shotgun-shell",
    enabled = false,
    energy_required = 8,
    ingredients = {
      {"shotgun-shell", 2},
      {"copper-plate", 5},
      {"steel-plate", 2}
    },
    result = "piercing-shotgun-shell"
  },
  {
    type = "recipe",
    name = "cannon-shell",
    normal =
    {
      enabled = false,
      energy_required = 8,
      ingredients = {
        {"steel-plate", 2},
        {"plastic-bar", 2},
        {"explosives", 1}
      },
      result = "cannon-shell"
    },
  },
  {
    type = "recipe",
    name = "explosive-cannon-shell",
    normal =
    {
      enabled = false,
      energy_required = 8,
      ingredients = {
        {"steel-plate", 2},
        {"plastic-bar", 2},
        {"explosives", 2}
      },
      result = "explosive-cannon-shell"
    },
  },
  {
    type = "recipe",
    name = "uranium-cannon-shell",
    enabled = false,
    energy_required = 12,
    ingredients = {
      {"cannon-shell", 1},
      {"uranium-238", 1}
    },
    result = "uranium-cannon-shell"
  },
  {
    type = "recipe",
    name = "explosive-uranium-cannon-shell",
    enabled = false,
    energy_required = 12,
    ingredients = {
      {"explosive-cannon-shell", 1},
      {"uranium-238", 1}
    },
    result = "explosive-uranium-cannon-shell"
  },
  {
    type = "recipe",
    name = "artillery-shell",
    enabled = false,
    energy_required = 15,
    ingredients = {
      {"explosive-cannon-shell", 4},
      {"radar", 1},
      {"explosives", 8}
    },
    result = "artillery-shell"
  },
  {
    type = "recipe",
    name = "flamethrower-ammo",
    category = "chemistry",
    enabled = false,
    energy_required = 6,
    ingredients = {
      {type = "item", name = "steel-plate", amount = 5},
      {type = "fluid", name = "crude-oil", amount = 100}
    },
    result = "flamethrower-ammo",
    crafting_machine_tint =
    {
      primary = {r = 1.000, g = 0.735, b = 0.643, a = 1.000}, -- #ffbba4ff
      secondary = {r = 0.749, g = 0.557, b = 0.490, a = 1.000}, -- #bf8e7dff
      tertiary = {r = 0.637, g = 0.637, b = 0.637, a = 1.000}, -- #a2a2a2ff
      quaternary = {r = 0.283, g = 0.283, b = 0.283, a = 1.000}, -- #484848ff
    }
  },
  {
    type = "recipe",
    name = "express-transport-belt",
    category = "crafting-with-fluid",
    normal =
    {
      enabled = false,

      ingredients = {
        {"iron-gear-wheel", 10},
        {"fast-transport-belt", 1},
        {type = "fluid", name = "lubricant", amount = 20}
      },
      result = "express-transport-belt"
    },
  },
  {
    type = "recipe",
    name = "assembling-machine-3",
    enabled = false,
    ingredients = {
      {"speed-module", 4},
      {"assembling-machine-2", 2}
    },
    result = "assembling-machine-3"
  },
  {
    type = "recipe",
    name = "tank",
    normal =
    {
      enabled = false,
      energy_required = 5,
      ingredients = {
        {"engine-unit", 32},
        {"steel-plate", 50},
        {"iron-gear-wheel", 15},
        {"advanced-circuit", 10}
      },
      result = "tank"
    },
  },
  {
    type = "recipe",
    name = "spidertron",
    enabled = false,
    energy_required = 10,
    ingredients = {
      {"exoskeleton-equipment", 4},
      {"fusion-reactor-equipment", 2},
      {"rocket-launcher", 4},
      {"rocket-control-unit", 16},
      {"low-density-structure", 150},
      {"radar", 2},
      {"effectivity-module-3", 2},
      {"raw-fish", 1}
    },
    result = "spidertron"
  },
  {
    type = "recipe",
    name = "spidertron-remote",
    enabled = false,
    ingredients = {
      {"rocket-control-unit", 1},
      {"radar", 1}
    },
    result = "spidertron-remote"
  },
  {
    type = "recipe",
    name = "fluid-wagon",
    enabled = false,
    energy_required = 1.5,
    ingredients = {
      {"iron-gear-wheel", 10},
      {"steel-plate", 16},
      {"pipe", 8},
      {"storage-tank", 1}
    },
    result = "fluid-wagon"
  },
  {
    type = "recipe",
    name = "artillery-wagon",
    energy_required = 4,
    enabled = false,
    ingredients = {
      {"engine-unit", 64},
      {"iron-gear-wheel", 10},
      {"steel-plate", 40},
      {"pipe", 16},
      {"advanced-circuit", 20}
    },
    result = "artillery-wagon"
  },
  {
    type = "recipe",
    name = "modular-armor",
    enabled = false,
    energy_required = 15,
    ingredients = {
      {"advanced-circuit", 30},
      {"steel-plate", 50}
    },
    result = "modular-armor"
  },
  {
    type = "recipe",
    name = "power-armor",
    enabled = false,
    energy_required = 20,
    ingredients = {
        { "processing-unit", 40},
        {"electric-engine-unit", 20},
        {"steel-plate", 40}
    },
    result = "power-armor",
    requester_paste_multiplier = 1
  },
  {
    type = "recipe",
    name = "power-armor-mk2",
    enabled = false,
    energy_required = 25,
    ingredients = {
        { "effectivity-module-2", 25},
        {"speed-module-2", 25},
        {"processing-unit", 60},
        {"electric-engine-unit", 40},
        {"low-density-structure", 30}
    },
    result = "power-armor-mk2",
    requester_paste_multiplier = 1
  },
  {
    type = "recipe",
    name = "flamethrower",
    enabled = false,
    energy_required = 10,
    ingredients = {
      {"steel-plate", 5},
      {"iron-gear-wheel", 10}
    },
    result = "flamethrower"
  },
  {
    type = "recipe",
    name = "land-mine",
    enabled = false,
    energy_required = 5,
    ingredients = {
      {"steel-plate", 1},
      {"explosives", 2}
    },
    result = "land-mine",
    result_count = 4
  },
  {
    type = "recipe",
    name = "rocket-launcher",
    enabled = false,
    energy_required = 10,
    ingredients = {
      {"iron-plate", 5},
      {"iron-gear-wheel", 5},
      {"electronic-circuit", 5}
    },
    result = "rocket-launcher"
  },
  {
    type = "recipe",
    name = "combat-shotgun",
    enabled = false,
    energy_required = 10,
    ingredients = {
      {"steel-plate", 15},
      {"iron-gear-wheel", 5},
      {"copper-plate", 10},
      {"wood", 10}
    },
    result = "combat-shotgun"
  },
  {
    type = "recipe",
    name = "chemical-science-pack",
    enabled = false,
    energy_required = 24,
    ingredients = {
      {"engine-unit", 2},
      {"advanced-circuit", 3},
      {"sulfur", 1}
    },
    result_count = 2,
    result = "chemical-science-pack"
  },
  {
    type = "recipe",
    name = "military-science-pack",
    enabled = false,
    energy_required = 10,
    ingredients = {
      {"piercing-rounds-magazine", 1},
      {"grenade", 1},
      {"stone-wall", 2}
    },
    result_count = 2,
    result = "military-science-pack"
  },
  {
    type = "recipe",
    name = "production-science-pack",
    enabled = false,
    energy_required = 21,
    ingredients = {
     {"electric-furnace", 1},
     {"productivity-module", 1},
     {"rail", 30}
    },
    result_count = 3,
    result = "production-science-pack"
  },
  {
    type = "recipe",
    name = "utility-science-pack",
    enabled = false,
    energy_required = 21,
    ingredients = {
      {"low-density-structure", 3},
      {"processing-unit", 2},
      {"flying-robot-frame", 1}
    },
    result_count = 3,
    result = "utility-science-pack"
  },
  {
    type = "recipe",
    name = "express-underground-belt",
    energy_required = 2,
    category = "crafting-with-fluid",
    enabled = false,
    ingredients = {
      {"iron-gear-wheel", 80},
      {"fast-underground-belt", 2},
      {type = "fluid", name = "lubricant", amount = 40}
    },
    result_count = 2,
    result = "express-underground-belt"
  },
  {
    type = "recipe",
    name = "fast-loader",
    enabled = false,
    hidden = true,
    energy_required = 3,
    ingredients = {
      {"fast-transport-belt", 5},
      {"loader", 1}
    },
    result = "fast-loader"
  },
  {
    type = "recipe",
    name = "express-loader",
    enabled = false,
    hidden = true,
    energy_required = 10,
    ingredients = {
      {"express-transport-belt", 5},
      {"fast-loader", 1}
    },
    result = "express-loader"
  },
  {
    type = "recipe",
    name = "express-splitter",
    category = "crafting-with-fluid",
    enabled = false,
    energy_required = 2,
    ingredients = {
      {"fast-splitter", 1},
      {"iron-gear-wheel", 10},
      {"advanced-circuit", 10},
      {type = "fluid", name = "lubricant", amount = 80}
    },
    result = "express-splitter"
  },
  {
    type = "recipe",
    name = "advanced-circuit",
    normal =
    {
      enabled = false,
      energy_required = 6,
      ingredients = {
        {"electronic-circuit", 2},
        {"plastic-bar", 2},
        {"copper-cable", 4}
      },
      result = "advanced-circuit"
    },
  },
  {
    type = "recipe",
    name = "processing-unit",
    category = "crafting-with-fluid",
    normal =
    {
      enabled = false,
      energy_required = 10,
      ingredients = {
        {"electronic-circuit", 20},
        {"advanced-circuit", 2},
        {type = "fluid", name = "sulfuric-acid", amount = 5}
      },
      result = "processing-unit"
    },
  },
  {
    type = "recipe",
    name = "logistic-robot",
    enabled = false,
    ingredients = {
      {"flying-robot-frame", 1},
      {"advanced-circuit", 2}
    },
    result = "logistic-robot"
  },
  {
    type = "recipe",
    name = "construction-robot",
    enabled = false,
    ingredients = {
      {"flying-robot-frame", 1},
      {"electronic-circuit", 2}
    },
    result = "construction-robot"
  },
  {
    type = "recipe",
    name = "logistic-chest-passive-provider",
    enabled = false,
    ingredients = {
      {"steel-chest", 1},
      {"electronic-circuit", 3},
      {"advanced-circuit", 1}
    },
    result = "logistic-chest-passive-provider"
  },
  {
    type = "recipe",
    name = "logistic-chest-active-provider",
    enabled = false,
    ingredients = {
      {"steel-chest", 1},
      {"electronic-circuit", 3},
      {"advanced-circuit", 1}
    },
    result = "logistic-chest-active-provider"
  },
  {
    type = "recipe",
    name = "logistic-chest-storage",
    enabled = false,
    ingredients = {
      {"steel-chest", 1},
      {"electronic-circuit", 3},
      {"advanced-circuit", 1}
    },
    result = "logistic-chest-storage"
  },
  {
    type = "recipe",
    name = "logistic-chest-buffer",
    enabled = false,
    ingredients = {
      {"steel-chest", 1},
      {"electronic-circuit", 3},
      {"advanced-circuit", 1}
    },
    result = "logistic-chest-buffer"
  },
  {
    type = "recipe",
    name = "logistic-chest-requester",
    enabled = false,
    ingredients = {
      {"steel-chest", 1},
      {"electronic-circuit", 3},
      {"advanced-circuit", 1}
    },
    result = "logistic-chest-requester"
  },
  {
    type = "recipe",
    name = "rocket-silo",
    enabled = false,
    ingredients = {
      {"steel-plate", 1000},
      {"concrete", 1000},
      {"pipe", 100},
      {"processing-unit", 200},
      {"electric-engine-unit", 200}
    },
    energy_required = 30,
    result = "rocket-silo",
    requester_paste_multiplier = 1
  },
  {
    type = "recipe",
    name = "roboport",
    enabled = false,
    energy_required = 5,
    ingredients = {
      {"steel-plate", 45},
      {"iron-gear-wheel", 45},
      {"advanced-circuit", 45}
    },
    result = "roboport"
  },
  {
    type = "recipe",
    name = "substation",
    enabled = false,
    ingredients = {
      {"steel-plate", 10},
      {"advanced-circuit", 5},
      {"copper-plate", 5}
    },
    result = "substation"
  },
  {
    type = "recipe",
    name = "accumulator",
    energy_required = 10,
    enabled = false,
    ingredients = {
      {"iron-plate", 2},
      {"battery", 5}
    },
    result = "accumulator"
  },
  {
    type = "recipe",
    name = "electric-furnace",
    ingredients = {
        {"steel-plate", 10},
        {"advanced-circuit", 5},
        {"stone-brick", 10}
    },
    result = "electric-furnace",
    energy_required = 5,
    enabled = false
  },
  {
    type = "recipe",
    name = "beacon",
    enabled = false,
    energy_required = 15,
    ingredients = {
      {"electronic-circuit", 20},
      {"advanced-circuit", 20},
      {"steel-plate", 10},
      {"copper-cable", 10}
    },
    result = "beacon"
  },
  {
    type = "recipe",
    name = "pumpjack",
    energy_required = 5,
    ingredients = {
      {"steel-plate", 5},
      {"iron-gear-wheel", 10},
      {"electronic-circuit", 5},
      {"pipe", 10}
    },
    result = "pumpjack",
    enabled = false
  },
  {
    type = "recipe",
    name = "oil-refinery",
    energy_required = 8,
    ingredients = {
      {"steel-plate", 15},
      {"iron-gear-wheel", 10},
      {"stone-brick", 10},
      {"electronic-circuit", 10},
      {"pipe", 10}
    },
    result = "oil-refinery",
    enabled = false
  },
  {
    type = "recipe",
    name = "electric-engine-unit",
    category = "crafting-with-fluid",
    energy_required = 10,
    ingredients = {
      {"engine-unit", 1},
      {type = "fluid", name =  "lubricant", amount = 15},
      {"electronic-circuit", 2}
    },
    result = "electric-engine-unit",
    enabled = false
  },
  {
    type = "recipe",
    name = "flying-robot-frame",
    energy_required = 20,
    ingredients = {
      {"electric-engine-unit", 1},
      {"battery", 2},
      {"steel-plate", 1},
      {"electronic-circuit", 3}
    },
    result = "flying-robot-frame",
    enabled = false
  },
  {
    type = "recipe",
    name = "explosives",
    category = "chemistry",
    crafting_machine_tint =
    {
      primary = {r = 0.968, g = 0.381, b = 0.259, a = 1.000}, -- #f66142ff
      secondary = {r = 0.892, g = 0.664, b = 0.534, a = 1.000}, -- #e3a988ff
      tertiary = {r = 1.000, g = 0.978, b = 0.513, a = 1.000}, -- #fff982ff
      quaternary = {r = 0.210, g = 0.170, b = 0.013, a = 1.000}, -- #352b03ff
    },
    normal =
    {
      energy_required = 4,
      enabled = false,
      ingredients = {
        {name = "sulfur", amount = 1},
        {type = "item", name = "coal", amount = 1},
        {type = "fluid", name = "water", amount = 10},
      },
      result= "explosives",
      result_count = 2
    },
  },
  {
    type = "recipe",
    name = "battery",
    category = "chemistry",
    normal =
    {
      energy_required = 4,
      enabled = false,
      ingredients = {
        {type = "fluid", name = "sulfuric-acid", amount = 20},
        {"iron-plate", 1},
        {"copper-plate", 1},
      },
      result = "battery"
    },
    crafting_machine_tint =
    {
      primary = {r = 0.965, g = 0.482, b = 0.338, a = 1.000}, -- #f67a56ff
      secondary = {r = 0.831, g = 0.560, b = 0.222, a = 1.000}, -- #d38e38ff
      tertiary = {r = 0.728, g = 0.818, b = 0.443, a = 1.000}, -- #b9d070ff
      quaternary = {r = 0.939, g = 0.763, b = 0.191, a = 1.000}, -- #efc230ff
    }
  },
  {
    type = "recipe",
    name = "storage-tank",
    energy_required = 3,
    enabled = false,
    ingredients = {
      {"iron-plate", 20},
      {"steel-plate", 5},
    },
    result= "storage-tank"
  },
  {
    type = "recipe",
    name = "pump",
    energy_required = 2,
    enabled = false,
    ingredients = {
      {"engine-unit", 1},
      {"steel-plate", 1},
      {"pipe", 1},
    },
    result= "pump"
  },
  {
    type = "recipe",
    name = "chemical-plant",
    energy_required = 5,
    enabled = false,
    ingredients = {
      {"steel-plate", 5},
      {"iron-gear-wheel", 5},
      {"electronic-circuit", 5},
      {"pipe", 5},
    },
    result= "chemical-plant"
  },
  {
    type = "recipe",
    name = "low-density-structure",
    category = "crafting",
    normal =
    {
      energy_required = 20,
      enabled = false,
      ingredients = {
        {"steel-plate", 2},
        {"copper-plate", 20},
        {"plastic-bar", 5}
      },
      result= "low-density-structure"
    },
  },
  {
    type = "recipe",
    name = "rocket-fuel",
    energy_required = 30,
    enabled = false,
    category = "crafting-with-fluid",
    ingredients = {
      {"solid-fuel", 10},
      {type = "fluid", name = "light-oil", amount = 10}
    },
    result= "rocket-fuel"
  },
  {
    type = "recipe",
    name = "rocket-control-unit",
    energy_required = 30,
    enabled = false,
    category = "crafting",
    ingredients = {
      {"processing-unit", 1},
      {"speed-module", 1},
    },
    result= "rocket-control-unit"
  },
  {
    type = "recipe",
    name = "rocket-part",
    energy_required = 3,
    enabled = false,
    hidden = true,
    category = "rocket-building",
    ingredients = {
      {"rocket-control-unit", 10},
      {"low-density-structure", 10},
      {"rocket-fuel", 10},
    },
    result= "rocket-part"
  },
  {
    type = "recipe",
    name = "satellite",
    energy_required = 5,
    enabled = false,
    category = "crafting",
    ingredients = {
      {"low-density-structure", 100},
      {"solar-panel", 100},
      {"accumulator", 100},
      {"radar", 5},
      {"processing-unit", 100},
      {"rocket-fuel", 50},
    },
    result= "satellite",
    requester_paste_multiplier = 1
  },
  {
    type = "recipe",
    name = "electric-energy-interface",
    energy_required = 0.5,
    enabled = false,
    ingredients = {
      {"iron-plate", 2},
      {"electronic-circuit", 5},
    },
    result = "electric-energy-interface"
  },
  {
    type = "recipe",
    name = "nuclear-reactor",
    energy_required = 8,
    enabled = false,
    ingredients = {
      {"concrete", 500},
      {"steel-plate", 500},
      {"advanced-circuit", 500},
      {"copper-plate", 500},
    },
    result = "nuclear-reactor",
    requester_paste_multiplier = 1
  },
  {
    type = "recipe",
    name = "centrifuge",
    energy_required = 4,
    enabled = false,
    ingredients = {
      {"concrete", 100},
      {"steel-plate", 50},
      {"advanced-circuit", 100},
      {"iron-gear-wheel", 100},
    },
    result = "centrifuge",
    requester_paste_multiplier= 10
  },
  {
    type = "recipe",
    name = "uranium-processing",
    energy_required = 12,
    enabled = false,
    category = "centrifuging",
    ingredients = {
        {"uranium-ore", 10},
    },
    icon = "__base__/graphics/icons/uranium-processing.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "raw-material",
    order = "k[uranium-processing]", -- k ordering so it shows up after explosives which is j ordering
    results =
    {
      {name = "uranium-235", probability = 0.007, amount = 1},
      {name = "uranium-238", probability = 0.993, amount = 1},
    },
  },
  {
    type = "recipe",
    name = "kovarex-enrichment-process",
    energy_required = 60,
    enabled = false,
    category = "centrifuging",
    ingredients = {
        {"uranium-235", 40},
        {"uranium-238", 5},
    },
    icon = "__base__/graphics/icons/kovarex-enrichment-process.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "intermediate-product",
    order = "r[uranium-processing]-c[kovarex-enrichment-process]",
    main_product = "",
    results = {
        {"uranium-235", 41},
        {"uranium-238", 2},
    },
    allow_decomposition = false
  },
  {
    type = "recipe",
    name = "nuclear-fuel",
    energy_required = 90,
    enabled = false,
    category = "centrifuging",
    ingredients = {
        {"uranium-235", 1},
        {"rocket-fuel", 1},
    },
    icon = "__base__/graphics/icons/nuclear-fuel.png",
    icon_size = 64, icon_mipmaps = 4,
    result = "nuclear-fuel"
  },
  {
    type = "recipe",
    name = "nuclear-fuel-reprocessing",
    energy_required = 60,
    enabled = false,
    category = "centrifuging",
    ingredients = {
        {"used-up-uranium-fuel-cell", 5},
    },
    icon = "__base__/graphics/icons/nuclear-fuel-reprocessing.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "intermediate-product",
    order = "r[uranium-processing]-b[nuclear-fuel-reprocessing]",
    main_product = "",
    results = {{"uranium-238", 3}},
    allow_decomposition = false
  },
  {
    type = "recipe",
    name = "uranium-fuel-cell",
    energy_required = 10,
    enabled = false,
    ingredients = {
      {"iron-plate", 10},
      {"uranium-235", 1},
      {"uranium-238", 19}
    },
    result = "uranium-fuel-cell",
    result_count = 10
  },
  {
    type = "recipe",
    name = "heat-exchanger",
    energy_required = 3,
    enabled = false,
    ingredients = {
        {"steel-plate", 10},
        {"copper-plate", 100},
        {"pipe", 10}
    },
    result = "heat-exchanger"
  },
  {
    type = "recipe",
    name = "heat-pipe",
    energy_required = 1,
    enabled = false,
    ingredients = {
        {"steel-plate", 10},
        {"copper-plate", 20},
    },
    result = "heat-pipe"
  },
  {
    type = "recipe",
    name = "steam-turbine",
    enabled = false,
    energy_required = 3,
    ingredients = {
        {"iron-gear-wheel", 50},
        {"copper-plate", 50},
        {"pipe", 20},
    },
    result = "steam-turbine"
  }
}
)

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

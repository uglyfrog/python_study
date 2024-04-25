local data_util = require("data_util")
local make_recipe = data_util.make_recipe

make_recipe({
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

make_recipe({
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

make_recipe({
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

make_recipe({
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



make_recipe({
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
make_recipe({
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

make_recipe({
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
make_recipe({
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

make_recipe({
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
make_recipe({
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

make_recipe({
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
make_recipe({
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


make_recipe({
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

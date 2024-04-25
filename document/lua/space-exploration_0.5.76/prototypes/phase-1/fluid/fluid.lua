local data_util = require("data_util")

local steam_max_temperature = 5000
data.raw.fluid.steam.max_temperature = math.max(data.raw.fluid.steam.max_temperature, steam_max_temperature)

local decompressing_steam = table.deepcopy(data.raw.fluid.steam)
decompressing_steam.name = data_util.mod_prefix .. "decompressing-steam"

local space_water = table.deepcopy(data.raw.fluid.water)
space_water.name = data_util.mod_prefix .. "space-water"
space_water.icon = "__space-exploration-graphics__/graphics/icons/fluid/space-water.png"
space_water.icon_size = 64
space_water.icon_mipmaps = 1
space_water.subgroup = "space-fluids"

local contaminated_space_water = table.deepcopy(data.raw.fluid.water)
contaminated_space_water.name = data_util.mod_prefix .. "contaminated-space-water"
contaminated_space_water.icon = "__space-exploration-graphics__/graphics/icons/fluid/contaminated-space-water.png"
contaminated_space_water.icon_size = 64
contaminated_space_water.icon_mipmaps = 1
contaminated_space_water.subgroup = "space-fluids"


--TODO: order strings
data:extend({
  decompressing_steam,
  {
    type = "fluid",
    name = data_util.mod_prefix .. "methane-gas",
    default_temperature = 15,
    max_temperature = 1000,
    heat_capacity = "0.1KJ",
    icon = "__space-exploration-graphics__/graphics/icons/fluid/methane-gas.png",
    icon_size = 64,
    icon_mipmaps = 1,
    base_color = {r=0.7, g=0.5, b=0.4},
    flow_color = {r=1.0, g=0.97, b=0.95},
    order = "a[fluid]-b[steam]",
    gas_temperature = -160,
    auto_barrel = true
  },
  space_water,
  contaminated_space_water,
  {
    type = "fluid",
    name = data_util.mod_prefix .. "liquid-rocket-fuel",
    default_temperature = 25,
    heat_capacity = "0.1KJ",
    fuel_category = "chemical",
    fuel_value = (100 / data_util.liquid_rocket_fuel_per_solid) .. "MJ", -- solid rocket fuel is "100MJ", 50 liquid to solid
    max_temperature = 100,
    base_color = {r=0.53, g=0.1, b=0},
    flow_color = {r=0.93, g=0.68, b=0.2},
    icon = "__space-exploration-graphics__/graphics/icons/fluid/liquid-rocket-fuel.png",
    icon_size = 64,
    icon_mipmaps = 1,
    order = "p-z-a",
    pressure_to_speed_ratio = 0.4,
    flow_to_energy_ratio = 0.59,
    subgroup = "processed-fuel",
  },
  --[[{
    type = "fluid",
    name = data_util.mod_prefix .. "space-coolant",
    default_temperature = data_util.coolant_temperature.hot,
    heat_capacity = "0.1KJ",
    min_temperature = -273,
    max_temperature = 1000,
    base_color = {r=80, g=27, b=255},
    flow_color = {r=178, g=155, b=255},
    icon = "__space-exploration-graphics__/graphics/icons/fluid/space-coolant.png",
    icon_size = 64,
    order = "a[fluid]-a[water]",
    pressure_to_speed_ratio = 0.4,
    flow_to_energy_ratio = 0.59,
  },]]--
  {
    type = "fluid",
    name = data_util.mod_prefix .. "space-coolant-hot",
    default_temperature = data_util.coolant_temperature.hot,
    heat_capacity = "0.1KJ",
    min_temperature = -273,
    max_temperature = steam_max_temperature,
    base_color = {r=159, g=27, b=255},
    flow_color = {r=212, g=155, b=255},
    icon = "__space-exploration-graphics__/graphics/icons/fluid/space-coolant-hot.png",
    icon_size = 64,
    icon_mipmaps = 1,
    order = "t-a",
    pressure_to_speed_ratio = 0.4,
    flow_to_energy_ratio = 0.59,
    subgroup = "space-fluids",
  },
  {
    type = "fluid",
    name = data_util.mod_prefix .. "space-coolant-warm",
    default_temperature = data_util.coolant_temperature.normal,
    heat_capacity = "0.1KJ",
    min_temperature = -273,
    max_temperature = steam_max_temperature,
    base_color = {r=121, g=27, b=255},
    flow_color = {r=196, g=155, b=255},
    icon = "__space-exploration-graphics__/graphics/icons/fluid/space-coolant-warm.png",
    icon_size = 64,
    icon_mipmaps = 1,
    order = "t-b",
    pressure_to_speed_ratio = 0.4,
    flow_to_energy_ratio = 0.59,
    subgroup = "space-fluids",
    auto_barrel = false,
  },
  {
    type = "fluid",
    name = data_util.mod_prefix .. "space-coolant-cold",
    default_temperature = data_util.coolant_temperature.cold,
    heat_capacity = "0.1KJ",
    min_temperature = -273,
    max_temperature = steam_max_temperature,
    base_color = {r=95, g=47, b=255},
    flow_color = {r=185, g=164, b=255},
    icon = "__space-exploration-graphics__/graphics/icons/fluid/space-coolant-cold.png",
    icon_size = 64,
    icon_mipmaps = 1,
    order = "t-c",
    pressure_to_speed_ratio = 0.4,
    flow_to_energy_ratio = 0.59,
    subgroup = "space-fluids",
    auto_barrel = false,
  },
  {
    type = "fluid",
    name = data_util.mod_prefix .. "space-coolant-supercooled",
    default_temperature = data_util.coolant_temperature.supercooled,
    heat_capacity = "0.1KJ",
    min_temperature = -273,
    max_temperature = steam_max_temperature,
    base_color = {r=98, g=111, b=255},
    flow_color = {r=186, g=192, b=255},
    icon = "__space-exploration-graphics__/graphics/icons/fluid/space-coolant-supercooled.png",
    icon_size = 64,
    icon_mipmaps = 1,
    order = "t-d",
    pressure_to_speed_ratio = 0.4,
    flow_to_energy_ratio = 0.59,
    subgroup = "space-fluids",
    auto_barrel = false,
  },
  {
    type = "fluid",
    name = data_util.mod_prefix .. "bio-sludge",
    default_temperature = 25,
    heat_capacity = "0.1KJ",
    max_temperature = 100,
    base_color = {r=0, g=84, b=3},
    flow_color = {r=133, g=226, b=18},
    icon = "__space-exploration-graphics__/graphics/icons/fluid/bio-sludge.png",
    icon_size = 64,
    icon_mipmaps = 1,
    order = "q-a",
    pressure_to_speed_ratio = 0.4,
    flow_to_energy_ratio = 0.59,
    subgroup = "space-fluids",
  },
  {
    type = "fluid",
    name = data_util.mod_prefix .. "contaminated-bio-sludge",
    default_temperature = 25,
    heat_capacity = "0.1KJ",
    max_temperature = 100,
    base_color = {r=71, g=46, b=5},
    flow_color = {r=135, g=121, b=9},
    icon = "__space-exploration-graphics__/graphics/icons/fluid/contaminated-bio-sludge.png",
    icon_size = 64,
    icon_mipmaps = 1,
    order = "q-b",
    pressure_to_speed_ratio = 0.4,
    flow_to_energy_ratio = 0.59,
    subgroup = "space-fluids",
  },
  {
    type = "fluid",
    name = data_util.mod_prefix .. "chemical-gel",
    default_temperature = 25,
    heat_capacity = "0.1KJ",
    max_temperature = 100,
    base_color = {r=103, g=31, b=0},
    flow_color = {r=234, g=135, b=0},
    icon = "__space-exploration-graphics__/graphics/icons/fluid/chemical-gel.png",
    icon_size = 64,
    icon_mipmaps = 1,
    order = "q-c",
    pressure_to_speed_ratio = 0.4,
    flow_to_energy_ratio = 0.59,
    subgroup = "space-fluids",
  },
  {
    type = "fluid",
    name = data_util.mod_prefix .. "nutrient-gel",
    default_temperature = 25,
    heat_capacity = "0.1KJ",
    max_temperature = 100,
    base_color = {r=191, g=64, b=87},
    flow_color = {r=248, g=62, b=122},
    icon = "__space-exploration-graphics__/graphics/icons/fluid/nutrient-gel.png",
    icon_size = 64,
    icon_mipmaps = 1,
    order = "q-d",
    pressure_to_speed_ratio = 0.4,
    flow_to_energy_ratio = 0.59,
    subgroup = "space-fluids",
  },
  {
    type = "fluid",
    name = data_util.mod_prefix .. "neural-gel",
    default_temperature = 25,
    heat_capacity = "0.1KJ",
    max_temperature = 100,
    base_color = {r=14, g=77, b=109},
    flow_color = {r=26, g=216, b=212},
    icon = "__space-exploration-graphics__/graphics/icons/fluid/neural-gel.png",
    icon_size = 64,
    icon_mipmaps = 1,
    order = "q-e",
    pressure_to_speed_ratio = 0.4,
    flow_to_energy_ratio = 0.59,
    subgroup = "space-fluids",
  },
  {
    type = "fluid",
    name = data_util.mod_prefix .. "neural-gel-2",
    default_temperature = 25,
    heat_capacity = "0.1KJ",
    max_temperature = 100,
    base_color = {r=56, g=6, b=143},
    flow_color = {r=135, g=0, b=234},
    icon = "__space-exploration-graphics__/graphics/icons/fluid/neural-gel-2.png",
    icon_size = 64,
    icon_mipmaps = 1,
    order = "q-f",
    pressure_to_speed_ratio = 0.4,
    flow_to_energy_ratio = 0.59,
    subgroup = "space-fluids",
  },
  {
    type = "fluid",
    name = data_util.mod_prefix .. "plasma-stream",
    default_temperature = 5000,
    heat_capacity = "0.01KJ",
    max_temperature = 100000,
    base_color = {r=255, g=0, b=0},
    flow_color = {r=255, g=235, b=0},
    icon = "__space-exploration-graphics__/graphics/icons/fluid/plasma-stream.png",
    icon_size = 64,
    icon_mipmaps = 1,
    order = "r-a",
    pressure_to_speed_ratio = 0.4,
    flow_to_energy_ratio = 0.59,
    gas_temperature = 0,
    auto_barrel = false,
    subgroup = "space-fluids",
  },
  {
    type = "fluid",
    name = data_util.mod_prefix .. "ion-stream",
    default_temperature = 5000,
    heat_capacity = "0.01KJ",
    max_temperature = 100000,
    base_color = {r=0, g=102, b=255},
    flow_color = {r=0, g=240, b=255},
    icon = "__space-exploration-graphics__/graphics/icons/fluid/ion-stream.png",
    icon_size = 64,
    icon_mipmaps = 1,
    order = "r-b",
    pressure_to_speed_ratio = 0.4,
    flow_to_energy_ratio = 0.59,
    gas_temperature = 0,
    auto_barrel = false,
    subgroup = "space-fluids",
  },
  {
    type = "fluid",
    name = data_util.mod_prefix .. "proton-stream",
    default_temperature = 5000,
    heat_capacity = "0.01KJ",
    max_temperature = 100000,
    base_color = {r=102, g=197, b=0},
    flow_color = {r=13, g=231, b=174},
    icon = "__space-exploration-graphics__/graphics/icons/fluid/proton-stream.png",
    icon_size = 64,
    icon_mipmaps = 1,
    order = "r-e",
    pressure_to_speed_ratio = 0.4,
    flow_to_energy_ratio = 0.59,
    gas_temperature = 0,
    auto_barrel = false,
    subgroup = "space-fluids",
  },
  {
    type = "fluid",
    name = data_util.mod_prefix .. "particle-stream",
    default_temperature = 5000,
    heat_capacity = "0.01KJ",
    max_temperature = 100000,
    base_color = {r=200, g=0, b=128},
    flow_color = {r=255, g=0, b=252},
    icon = "__space-exploration-graphics__/graphics/icons/fluid/particle-stream.png",
    icon_size = 64,
    icon_mipmaps = 1,
    order = "r-d",
    pressure_to_speed_ratio = 0.4,
    flow_to_energy_ratio = 0.59,
    gas_temperature = 0,
    auto_barrel = false,
    subgroup = "space-fluids",
  },
  {
    type = "fluid",
    name = data_util.mod_prefix .. "antimatter-stream",
    default_temperature = 10000,
    heat_capacity = "0.01KJ",
    max_temperature = 100000,
    base_color = {r=156, g=0, b=255},
    flow_color = {r=255, g=0, b=255},
    icon = "__space-exploration-graphics__/graphics/icons/fluid/antimatter-stream.png",
    icon_size = 64,
    icon_mipmaps = 1,
    order = "z",
    pressure_to_speed_ratio = 0.4,
    flow_to_energy_ratio = 0.59,
    gas_temperature = 0,
    auto_barrel = false,
    fuel_value = "20MJ", -- liquid rocket fuel is 2
    fuel_category = "antimatter",
    subgroup = "space-fluids",
  },
  {
    type = "fluid",
    name = data_util.mod_prefix .. "cryonite-slush",
    default_temperature = 0,
    heat_capacity = "0.01KJ",
    max_temperature = 25,
    base_color = {r=47, g=95, b=255},
    flow_color = {r=185, g=164, b=255},
    icon = "__space-exploration-graphics__/graphics/icons/fluid/cryonite-slush.png",
    icon_size = 64,
    icon_mipmaps = 1,
    order = "z",
    pressure_to_speed_ratio = 0.4,
    flow_to_energy_ratio = 0.59,
    auto_barrel = true,
    subgroup = "space-fluids",
  },
})

data:extend{
  {
      type = "int-setting",
      name = "se-meteor-interval",
      setting_type = "runtime-global",
      default_value = 30,
      minimum_value = 1,
      maximum_value = 2880,
      order = "a-a"
  },
  {
      type = "bool-setting",
      name = "se-print-meteor-info",
      setting_type = "runtime-per-user",
      default_value = true,
      order = "a-b"
  },
  {
      type = "int-setting",
      name = "se-plague-max-runtime",
      setting_type = "runtime-global",
      default_value = 5,
      minimum_value = 1,
      maximum_value = 1000,
      order = "b"
  },
  {
      type = "bool-setting",
      name = "se-print-satellite-discovered-nothing",
      setting_type = "runtime-per-user",
      default_value = true,
      order = "c-a"
  },
  {
      type = "bool-setting",
      name = "se-never-show-lifesupport",
      setting_type = "runtime-per-user",
      default_value = false,
      order = "c-b"
  },
  {
      type = "bool-setting",
      name = "se-show-zone-preview",
      setting_type = "runtime-per-user",
      default_value = true,
      order = "d"
  },
  {
      type = "int-setting",
      name = "se-cmes-max-frequency",
      setting_type = "runtime-global",
      minimum_value = 0,
      maximum_value = 200,
      default_value = 36,
      order = "a-c"
  },
  {
      type = "int-setting",
      name = "se-space-pipe-capacity",
      setting_type = "startup",
      default_value = 100,
      minimum_value = 50,
      maximum_value = 200,
      order = "e"
  },
  {
      type = "string-setting",
      name = "se-space-science-pack",
      setting_type = "startup",
      default_value = "Replace",
      allowed_values = {"Remove", "Replace", "OptimisationUranium", "OptimisationFish"},
      order = "i"
  },
  --[[{
      type = "bool-setting",
      name = "se-electric-boiler",
      setting_type = "startup",
      default_value = true
  },
  {
      type = "bool-setting",
      name = "se-deep-space-belt-black",
      setting_type = "startup",
      default_value = false
  },]]--
  {
      type = "int-setting",
      name = "se-deep-space-belt-speed",
      setting_type = "startup",
      default_value = 64,
      minimum_value = 1,
      maximum_value = 512,
      order = "f"
  },
  {
      type = "bool-setting",
      name = "se-deep-space-belt-white",
      setting_type = "startup",
      default_value = true,
      order = "g"
  },
  {
      type = "bool-setting",
      name = "se-deep-space-belt-red",
      setting_type = "startup",
      default_value = true,
      order = "g"
  },
  {
      type = "bool-setting",
      name = "se-deep-space-belt-magenta",
      setting_type = "startup",
      default_value = true,
      order = "g"
  },
  {
      type = "bool-setting",
      name = "se-deep-space-belt-blue",
      setting_type = "startup",
      default_value = true,
      order = "g"
  },
  {
      type = "bool-setting",
      name = "se-deep-space-belt-cyan",
      setting_type = "startup",
      default_value = true,
      order = "g"
  },
  {
      type = "bool-setting",
      name = "se-deep-space-belt-green",
      setting_type = "startup",
      default_value = true,
      order = "g"
  },
  {
      type = "bool-setting",
      name = "se-deep-space-belt-yellow",
      setting_type = "startup",
      default_value = true,
      order = "g"
  },
  {
      type = "bool-setting",
      name = "se-pylon-charge-points",
      setting_type = "startup",
      default_value = false,
      order = "e-b"
  },
  {
      type = "bool-setting",
      name = "se-spawn-small-resources",
      setting_type = "startup",
      default_value = true,
      order = "h"
  },
  {
      type = "bool-setting",
      name = "se-show-overhead-button-satellite-mode",
      setting_type = "runtime-per-user",
      default_value = true,
      order = "d-b"
  },
  {
      type = "bool-setting",
      name = "se-show-overhead-button-interstellar-map",
      setting_type = "runtime-per-user",
      default_value = true,
      order = "d-c"
  },
  {
      type = "bool-setting",
      name = "se-show-overhead-button-universe-explorer",
      setting_type = "runtime-per-user",
      default_value = true,
      order = "d-d"
  },
  {
      type = "bool-setting",
      name = "se-show-pin-help-tooltip",
      setting_type = "runtime-per-user",
      default_value = true,
      order = "e-a"
  },
  {
      type = "int-setting",
      name = "se-scan-search-budget",
      setting_type = "runtime-global",
      default_value = 1000,
      minimum_value = 1,
      maximum_value = 10000,
      order = "s-a"
  },
  {
      type = "int-setting",
      name = "se-scan-chart-budget",
      setting_type = "runtime-global",
      default_value = 10,
      minimum_value = 1,
      maximum_value = 1000,
      order = "s-b"
  },
  {
      type = "int-setting",
      name = "se-scan-alert-interval",
      setting_type = "runtime-global",
      default_value = 60,
      minimum_value = 0,
      maximum_value = 1000,
      order = "s-c"
  },
  {
      type = "int-setting",
      name = "se-supercharger-individual-charge-rate",
      setting_type = "startup",
      default_value = 90,
      minimum_value = 90,
      maximum_value = 1000,
      order = "e-c"
  }

}

for _, setting in pairs(data.raw["string-setting"]) do
  if string.find(setting.name, "alien-biomes-include-", 1, true) and setting.name ~= "alien-biomes-include-rivers" then
    setting.allowed_values = {"Enabled"}
  end
end
data.raw["string-setting"]["alien-biomes-disable-vegetation"].allowed_values = {"Disabled"}

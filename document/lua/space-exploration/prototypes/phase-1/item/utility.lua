local data_util = require("data_util")
data:extend{
  {
      type = "item",
      name = data_util.mod_prefix .. "struct-generic-settings",
      icon = "__space-exploration-graphics__/graphics/icons/settings.png",
      icon_size = 64, icon_mipmaps = 1,
      flags = { "hidden"},
      stack_size = 50,
  },
  {
      type = "item",
      name = data_util.mod_prefix .. "struct-generic-input",
      --icon = "__space-exploration-graphics__/graphics/icon/generic-input.png",
      icon = "__space-exploration-graphics__/graphics/icons/settings.png",
      icon_size = 64, icon_mipmaps = 1,
      flags = { "hidden"},
      stack_size = 50,
  },
  {
      type = "item",
      name = data_util.mod_prefix .. "struct-generic-output",
      --icon = "__space-exploration-graphics__/graphics/icon/generic-output.png",
      icon = "__space-exploration-graphics__/graphics/icons/settings.png",
      icon_size = 64, icon_mipmaps = 1,
      flags = { "hidden"},
      stack_size = 50,
  }
}

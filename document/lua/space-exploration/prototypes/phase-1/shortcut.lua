local data_util = require("data_util")

data:extend({
  {
    type = "shortcut",
    name = data_util.mod_prefix .. "remote-view",
    localised_name = { "shortcut."..data_util.mod_prefix .. "remote-view"},
    order = "a",
    action = "lua",
    style = "blue",
    icon = {
      filename = "__space-exploration-graphics__/graphics/icons/uplink.png",
      flags = {
        "icon"
      },
      priority = "extra-high-no-scale",
      scale = 1,
      size = 64
    },
    small_icon = {
      filename = "__space-exploration-graphics__/graphics/icons/uplink.png",
      flags = {
        "icon"
      },
      priority = "extra-high-no-scale",
      scale = 1,
      size = 64
    },
    disabled_small_icon = {
      filename = "__space-exploration-graphics__/graphics/icons/shortcut-toolbar/remote-view-24-black.png",
      flags = {
        "icon"
      },
      priority = "extra-high-no-scale",
      scale = 1,
      size = 24
    },
  },
  {
    type = "shortcut",
    name = data_util.mod_prefix .. "universe-explorer",
    localised_name = { "shortcut."..data_util.mod_prefix .. "universe-explorer"},
    order = "a",
    action = "lua",
    style = "blue",
    icon = {
      filename = "__space-exploration-graphics__/graphics/icons/astronomic/planet-orbit.png",
      flags = {
        "icon"
      },
      priority = "extra-high-no-scale",
      scale = 1,
      size = 64
    },
    small_icon = {
      filename = "__space-exploration-graphics__/graphics/icons/astronomic/planet-orbit.png",
      flags = {
        "icon"
      },
      priority = "extra-high-no-scale",
      scale = 1,
      size = 64
    },
    disabled_small_icon = {
      filename = "__space-exploration-graphics__/graphics/icons/astronomic/planet-orbit.png",
      flags = {
        "icon"
      },
      priority = "extra-high-no-scale",
      scale = 1,
      size = 64
    },
  },
  {
    type = "shortcut",
    name = data_util.mod_prefix .. "respawn",
    localised_name = { "shortcut."..data_util.mod_prefix .. "respawn"},
    order = "a",
    action = "lua",
    style = "red",
    icon = {
      filename = "__space-exploration-graphics__/graphics/icons/scull.png",
      flags = {
        "icon"
      },
      priority = "extra-high-no-scale",
      scale = 1,
      size = 64
    },
    small_icon = {
      filename = "__space-exploration-graphics__/graphics/icons/scull.png",
      flags = {
        "icon"
      },
      priority = "extra-high-no-scale",
      scale = 1,
      size = 64
    },
    disabled_small_icon = {
      filename = "__space-exploration-graphics__/graphics/icons/shortcut-toolbar/respawn-24-black.png",
      flags = {
        "icon"
      },
      priority = "extra-high-no-scale",
      scale = 1,
      size = 24
    },
  },
})

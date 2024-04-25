local data_util = require("data_util")

data:extend({
  {
    type = "sprite",
    name = data_util.mod_prefix .. "pin-add",
    filename = "__space-exploration-graphics__/graphics/icons/signal/pin-add.png",
    priority = "extra-high",
    width = 64,
    height = 64,
    shift = {0,0}
  },
  {
    type = "sprite",
    name = data_util.mod_prefix .. "pin-list",
    filename = "__space-exploration-graphics__/graphics/icons/signal/pin-list.png",
    priority = "extra-high",
    width = 64,
    height = 64,
    shift = {0,0}
  },
})

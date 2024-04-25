local data_util = require("data_util")
local noise = require("noise")

local tile = table.deepcopy(data.raw.tile["mineral-black-dirt-1"])
tile.name = "interior-divider"
tile.layer = 0
table.insert(tile.collision_mask, spaceship_collision_layer) -- prevents nukes from removing
table.insert(tile.collision_mask, flying_collision_layer)
tile.autoplace = nil

data:extend(
{
  tile
})

local data_util = require("data_util")

data_util.replace_or_add_ingredient("empty-memory-element", nil, data_util.mod_prefix .. "teleportation-data", 1)
data_util.tech_add_prerequisites("empty-memory-element", {data_util.mod_prefix .. "deep-space-science-pack-4"})
data_util.tech_add_ingredients("empty-memory-element", {data_util.mod_prefix .. "deep-space-science-pack-4"})

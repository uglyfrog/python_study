local data_util = require("data_util")

require("prototypes/phase-multi/no-recycle")

require("prototypes/phase-2/recipe-update")
require("prototypes/phase-2/generic-recycling")

require("prototypes/phase-2/modules")

require("prototypes/phase-2/capsules")

require("prototypes/phase-2/compatibility/general")
require("prototypes/phase-2/compatibility/krastorio2/krastorio2")

-- this is where space science pack goes now in SE, but other mods are more free to change it than when it was a critical mid-game pack.
data_util.tech_add_prerequisites("space-science-pack", {data_util.mod_prefix .. "processing-cryonite", "production-science-pack", "uranium-processing",})
data_util.tech_add_ingredients("space-science-pack", {"production-science-pack"}, true)

-- Give burner lamp space collision, because it's a one line fix and getting it done here is easier than trying to get it done in the owner's mod
if data.raw["assembling-machine"]["deadlock-copper-lamp"] then
   data.raw["assembling-machine"]["deadlock-copper-lamp"].se_allow_in_space = true
end

if data.raw["electric-turret"]["laser-turret"] then
  data.raw["electric-turret"]["laser-turret"].prepare_range = data.raw["electric-turret"]["laser-turret"].attack_parameters.range + 8
end

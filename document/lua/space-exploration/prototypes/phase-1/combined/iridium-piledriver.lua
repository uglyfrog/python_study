local data_util = require("data_util")

se_delivery_cannon_ammo_recipes[data_util.mod_prefix.."iridium-piledriver"] = {type = "ammo", name=data_util.mod_prefix.."iridium-piledriver", amount = 1}
table.insert(data.raw.technology[data_util.mod_prefix .. "delivery-cannon-weapon"].effects, { type = "unlock-recipe", recipe = data_util.mod_prefix .. "delivery-cannon-weapon-pack-" .. data_util.mod_prefix .. "iridium-piledriver"})

data:extend({
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
     type = "ammo",
     name = data_util.mod_prefix .. "iridium-piledriver",
     ammo_type = {
       action = {
         action_delivery = {
           projectile = data_util.mod_prefix .. "iridium-piledriver",
           source_effects = {
             entity_name = "explosion-hit",
             type = "create-entity"
           },
           starting_speed = 0.05,
           type = "projectile"
         },
         type = "direct"
       },
       category = "weapons-delivery-cannon",
       cooldown_modifier = 3,
       range_modifier = 3,
       target_type = "position"
     },
     icon = "__base__/graphics/icons/cannon-shell.png",
     icon_mipmaps = 4,
     icon_size = 64,
     order = "d[rocket-launcher]-c[atomic-bomb]",
     stack_size = 1,
     subgroup = "ammo",
   },
   {
     type = "projectile",
     name = data_util.mod_prefix .. "iridium-piledriver",
     acceleration = 0.005,
     action = {
       action_delivery = {
         target_effects = {
           {
             action = {
               action_delivery = {
                 target_effects = {
                   {
                     damage = {
                       amount = 10000,
                       type = "physical"
                     },
                     type = "damage"
                   },
                 },
                 type = "instant"
               },
               radius = 2,
               type = "area"
             },
             type = "nested-result"
           },
           {
             action = {
               action_delivery = {
                 target_effects = {
                   {
                     damage = {
                       amount = 1000,
                       type = "explosion"
                     },
                     type = "damage"
                   }
                 },
                 type = "instant"
               },
               radius = 4,
               type = "area"
             },
             type = "nested-result"
           },
           {
             action = {
               action_delivery = {
                 target_effects = {
                   {
                     damage = {
                       amount = 500,
                       type = "explosion"
                     },
                     type = "damage"
                   }
                 },
                 type = "instant"
               },
               radius = 8,
               type = "area"
             },
             type = "nested-result"
           },
           {
             action = {
               action_delivery = {
                 target_effects = {
                   {
                     damage = {
                       amount = 200,
                       type = "explosion"
                     },
                     type = "damage"
                   }
                 },
                 type = "instant"
               },
               radius = 16,
               type = "area"
             },
             type = "nested-result"
           },
           {
             initial_height = 0,
             max_radius = 3.5,
             offset_deviation = {
               {
                 -4,
                 -4
               },
               {
                 4,
                 4
               }
             },
             repeat_count = 240,
             smoke_name = "artillery-smoke",
             speed_from_center = 0.05,
             speed_from_center_deviation = 0.005,
             type = "create-trivial-smoke"
           },
           {
             entity_name = "big-artillery-explosion",
             type = "create-entity"
           },
           {
             check_buildability = true,
             entity_name = "small-scorchmark",
             type = "create-entity"
           },
           {
             scale = 0.25,
             type = "show-explosion-on-chart"
           }
         },
         type = "instant"
       },
       type = "direct"
     },
     animation = {
       filename = "__base__/graphics/entity/rocket/rocket.png",
       frame_count = 8,
       height = 35,
       line_length = 8,
       priority = "high",
       shift = {
         0,
         0
       },
       width = 9
     },
     flags = {
       "not-on-map"
     },
     light = {
       intensity = 0.8,
       size = 15
     },
     shadow = {
       filename = "__base__/graphics/entity/rocket/rocket-shadow.png",
       frame_count = 1,
       height = 24,
       priority = "high",
       shift = {
         0,
         0
       },
       width = 7
     },
     smoke = {
       {
         deviation = {
           0.15,
           0.15
         },
         frequency = 1,
         name = "smoke-fast",
         position = {
           0,
           1
         },
         slow_down_factor = 1,
         starting_frame = 3,
         starting_frame_deviation = 5,
         starting_frame_speed = 0,
         starting_frame_speed_deviation = 5
       }
     },
   },
})

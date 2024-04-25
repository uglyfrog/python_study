local data_util = require("data_util")

data.raw.capsule["raw-fish"].capsule_action = {
  attack_parameters = {
    ammo_category = "capsule",
    ammo_type = {
      action = {
        action_delivery = {
          target_effects = {
            damage = {
              amount = -10,
              type = "poison"
            },
            type = "damage"
          },
          type = "instant"
        },
        type = "direct"
      },
      category = "capsule",
      target_type = "position"
    },
    cooldown = 60,
    range = 0,
    type = "projectile"
  },
  type = "use-on-self"
}
data:extend({
  {
    icon = "__space-exploration-graphics__/graphics/icons/medpack-1.png",
    icon_size = 64,
    name = data_util.mod_prefix .. "medpack",
    order = "aa",
    stack_size = 20,
    subgroup = "tool",
    type = "capsule",
    capsule_action = {
      type = "use-on-self",
      attack_parameters = {
        activation_type = "consume",
        ammo_category = "capsule",
        ammo_type = {
          action = {
            action_delivery = {
              target_effects = {
                {
                  type = "play-sound",
                  sound = { filename = "__base__/sound/character-corpse-open.ogg", volume = 0.5 },
                },
                {
                  damage = {
                    amount = -50,
                    type = "poison"
                  },
                  type = "damage"
                }
              },
              type = "instant"
            },
            type = "direct"
          },
          category = "capsule",
          target_type = "position"
        },
        cooldown = 60,
        range = 0,
        type = "projectile"
      },
    },
  },
  {
    icon = "__space-exploration-graphics__/graphics/icons/medpack-2.png",
    icon_size = 64,
    name = data_util.mod_prefix .. "medpack-2",
    order = "aa",
    stack_size = 20,
    subgroup = "tool",
    type = "capsule",
    capsule_action = {
      type = "use-on-self",
      attack_parameters = {
        activation_type = "consume",
        ammo_category = "capsule",
        ammo_type = {
          action = {
            action_delivery = {
              target_effects = {
                {
                  type = "play-sound",
                  sound = { filename = "__base__/sound/character-corpse-open.ogg", volume = 0.5 },
                },
                {
                  damage = {
                    amount = -100,
                    type = "poison"
                  },
                  type = "damage"
                }
              },
              type = "instant"
            },
            type = "direct"
          },
          category = "capsule",
          target_type = "position"
        },
        cooldown = 60,
        range = 0,
        type = "projectile"
      },
    },
  },
  {
    icon = "__space-exploration-graphics__/graphics/icons/medpack-3.png",
    icon_size = 64,
    name = data_util.mod_prefix .. "medpack-3",
    order = "aa",
    stack_size = 20,
    subgroup = "tool",
    type = "capsule",
    capsule_action = {
      type = "use-on-self",
      attack_parameters = {
        activation_type = "consume",
        ammo_category = "capsule",
        ammo_type = {
          action = {
            action_delivery = {
              target_effects = {
                {
                  type = "play-sound",
                  sound = { filename = "__base__/sound/character-corpse-open.ogg", volume = 0.5 },
                },
                {
                  damage = {
                    amount = -200,
                    type = "poison"
                  },
                  type = "damage"
                }
              },
              type = "instant"
            },
            type = "direct"
          },
          category = "capsule",
          target_type = "position"
        },
        cooldown = 60,
        range = 0,
        type = "projectile"
      },
    },
  },
  {
    icon = "__space-exploration-graphics__/graphics/icons/medpack-4.png",
    icon_size = 64,
    name = data_util.mod_prefix .. "medpack-4",
    order = "aa",
    stack_size = 20,
    subgroup = "tool",
    type = "capsule",
    capsule_action = {
      type = "use-on-self",
      attack_parameters = {
        activation_type = "consume",
        ammo_category = "capsule",
        ammo_type = {
          action = {
            action_delivery = {
              target_effects = {
                {
                  type = "play-sound",
                  sound = { filename = "__base__/sound/character-corpse-open.ogg", volume = 0.5 },
                },
                {
                  damage = {
                    amount = -400,
                    type = "poison"
                  },
                  type = "damage"
                }
              },
              type = "instant"
            },
            type = "direct"
          },
          category = "capsule",
          target_type = "position"
        },
        cooldown = 60,
        range = 0,
        type = "projectile"
      },
    },
  },
})

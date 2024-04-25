local data_util = require("data_util")

data:extend({
  {
    type = "ammo-category",
    name = "railgun",
    bonus_gui_order = "k-c-b",
  },
  {
    type = "ammo",
    name = data_util.mod_prefix .. "railgun-ammo",
    icon = "__space-exploration-graphics__/graphics/icons/railgun-ammo.png",
    icon_size = 64, icon_mipmaps = 4,
    ammo_type =
    {
      category = "railgun",
      target_type = "direction",
      clamp_position = true,
      action =
      {
        type = "line",
        range = 100,
        width = 0.5,

        range_effects =
        {
          type = "create-explosion",
          entity_name = data_util.mod_prefix .. "railgun-beam"
        },
        action_delivery =
        {
          type = "instant",
          target_effects =
          {
            type = "damage",
            damage = { amount = 250, type="physical"}
          }
        }
      }
    },
    magazine_size = 4,
    subgroup = "ammo",
    order = "c[railgun]",
    stack_size = 200
  },
  {
    type = "gun",
    name =  data_util.mod_prefix .. "railgun",
    icon = "__space-exploration-graphics__/graphics/icons/railgun.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "gun",
    order = "c[railgun]",
    attack_parameters =
    {
      type = "projectile",
      ammo_category = "railgun",
      cooldown = 150,
      movement_slow_down_factor = 0.4,
      projectile_creation_distance = 0.6,
      range = 100,
      sound =
      {
        {
          filename = "__space-exploration__/sound/railgun.ogg",
          volume = 0.5
        }
      }
    },
    stack_size = 5
  },
  {
    type = "explosion",
    name = data_util.mod_prefix .. "railgun-beam",
    localised_name = {"entity-name."..data_util.mod_prefix .. "railgun-beam"},
    flags = {"not-on-map"},
    subgroup = "explosions",
    rotate = true,
    beam = true,
    animations = {
      {
        filename = "__space-exploration-graphics__/graphics/entity/railgun/beam.png",
        priority = "extra-high",
        width = 187,
        height = 1,
        frame_count = 6
      }
    },
    light = {intensity = 1, size = 10, color = {r = 1.0, g = 0.8, b = 0.5}},
    smoke = "smoke-fast",
    smoke_count = 2,
    smoke_slow_down_factor = 1
  },
})
for _, tech in pairs(data.raw.technology) do
  if tech.effects then
    for _, effect in pairs(tech.effects) do
      if (effect.type == "ammo-damage" or effect.type == "gun-speed") and effect.ammo_category == "bullet" then
        local c = table.deepcopy(effect)
        c.ammo_category = "railgun"
        table.insert(tech.effects, c)
      end
    end
  end
end

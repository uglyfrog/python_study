local data_util = require("data_util")

local blank_image = {
    filename = "__space-exploration-graphics__/graphics/blank.png",
    width = 1,
    height = 1,
    frame_count = 1,
    line_length = 1,
    direction_count = 1,
    shift = { 0, 0 },
}

local selection_box = { { -4.5, -4.5 }, { 4.5, 4.5 } }
local collision_box = { { -4.3, -4.3 }, { 4.3, 4.3 } }

data:extend({
  {
    type = "ammo-turret",
    name = data_util.mod_prefix .. "meteor-defence-container",
    minable = {
      mining_time = 0.5,
      result = data_util.mod_prefix .. "meteor-defence"
    },
    alert_when_attacking = false,
    automated_ammo_count = 4,
    attack_parameters = {
      ammo_category = data_util.mod_prefix .. "meteor-defence",
      cooldown = 300,
      range = 1,
      type = "projectile"
    },
    base_picture_render_layer = "object",
    base_picture = {
      layers = {
        {
            filename = "__space-exploration-graphics__/graphics/entity/meteor-defence/meteor-defence.png",
            shift = { 0, -4.75 },
            width = 616/2,
            height = 1198/2,
            hr_version = data_util.hr({
                filename = "__space-exploration-hr-graphics__/graphics/entity/meteor-defence/hr-meteor-defence.png",
                shift = { 0, -4.75 },
                width = 616,
                height = 1198,
                scale = 0.5,
            })
        },
        {
            draw_as_shadow = true,
            filename = "__space-exploration-graphics__/graphics/entity/meteor-defence/meteor-defence-shadow.png",
            shift = { 2.5, 2/32 },
            width = 890/2,
            height = 578/2,
            hr_version = data_util.hr({
                draw_as_shadow = true,
                filename = "__space-exploration-hr-graphics__/graphics/entity/meteor-defence/hr-meteor-defence-shadow.png",
                shift = { 2.5, 2/32 },
                width = 890,
                height = 578,
                scale = 0.5,
            })
        }
      }
    },
    call_for_help_radius = 40,
    folded_animation = blank_image,
    collision_box = collision_box,
    drawing_box = { { -4.5, -4.5-9 }, { 4.5, 4.5 } },
    collision_mask = {
      "water-tile",
      "item-layer",
      "object-layer",
      "player-layer",
      spaceship_collision_layer,
    },
    corpse = "big-remnants",
    dying_explosion = "medium-explosion",
    flags = {"placeable-neutral", "player-creation"},
    icon = "__space-exploration-graphics__/graphics/icons/meteor-defence.png",
    icon_size = 64,
    order = "b-a",
    inventory_size = 1,
    max_health = 8000,
    resistances = {
      { type = "impact", percent = 100 },
      { type = "fire", percent = 100 }
    },
    open_sound = {
      filename = "__base__/sound/machine-open.ogg",
      volume = 0.85
    },
    close_sound = {
      filename = "__base__/sound/machine-close.ogg",
      volume = 0.75
    },
    rotation_speed = 0.015,
    selection_box = selection_box,
    selection_priority = 100,
    vehicle_impact_sound = {
      filename = "__base__/sound/car-metal-impact.ogg",
      volume = 0.65
    }
  },
  {
    type = "electric-energy-interface",
    name = data_util.mod_prefix .. "meteor-defence-charger",
    icon = "__space-exploration-graphics__/graphics/icons/meteor-defence.png",
    flags = {"placeable-player", "player-creation", "placeable-off-grid", "not-deconstructable", "not-blueprintable"},
    icon_size = 64,
    order = "b-a",
    selectable_in_game = false,
    selection_box = { { -4.5, -4.5 }, { 4.5, 4.5 } },
    collision_box = collision_box,
    energy_source = {
      buffer_capacity = "2000MJ",
      input_flow_limit = "20MW",
      type = "electric",
      usage_priority = "secondary-input"
    },
    energy_usage = "5MW"
  },
  {
    type = "explosion",
    name = data_util.mod_prefix .. "meteor-defence-beam",
    animations = {
      {
        filename = "__space-exploration-graphics__/graphics/entity/meteor-defence/meteor-defence-beam.png",
        frame_count = 6,
        height = 1,
        priority = "extra-high",
        width = 187
      }
    },
    beam = true,
    flags = { "not-on-map", "placeable-off-grid"},
    light = {
      color = {
        b = 0,
        g = 0,
        r = 1
      },
      intensity = 1,
      size = 20
    },
    rotate = true,
    smoke = "smoke-fast",
    smoke_count = 2,
    smoke_slow_down_factor = 1,
    sound = {
      {
        filename = "__base__/sound/fight/old/huge-explosion.ogg",
        volume = 1
      }
    },
  },
  {
    type = "ammo-turret",
    name = data_util.mod_prefix .. "meteor-point-defence-container",
    minable = {
      mining_time = 0.3,
      result =  data_util.mod_prefix .. "meteor-point-defence",
    },
    alert_when_attacking = false,
    automated_ammo_count = 4,
    attack_parameters = {
      ammo_category = data_util.mod_prefix .. "meteor-point-defence",
      cooldown = 300,
      range = 64,
      type = "projectile"
    },
    base_picture_render_layer = "object",
    base_picture = {
      layers = {
        {
            filename = "__space-exploration-graphics__/graphics/entity/meteor-point-defence/meteor-point-defence-base.png",
            shift = { 1/32, -1.5 },
            width = 206/2,
            height = 400/2,
            hr_version = data_util.hr({
                filename = "__space-exploration-hr-graphics__/graphics/entity/meteor-point-defence/hr-meteor-point-defence-base.png",
                shift = { 1/32, -1.5 },
                width = 206,
                height = 400,
                scale = 0.5,
            })
        },
        {
            filename = "__space-exploration-graphics__/graphics/entity/meteor-point-defence/meteor-point-defence-mask.png",
            shift = { 1/32, -1.5 },
            width = 206/2,
            height = 400/2,
            tint = {r=255,g=0,b=0},
            hr_version = data_util.hr({
                filename = "__space-exploration-hr-graphics__/graphics/entity/meteor-point-defence/hr-meteor-point-defence-mask.png",
                shift = { 1/32, -1.5 },
                width = 206,
                height = 400,
                scale = 0.5,
                tint = {r=255,g=0,b=0},
            })
        },
        {
            draw_as_shadow = true,
            filename = "__space-exploration-graphics__/graphics/entity/meteor-point-defence/meteor-point-defence-shadow.png",
            shift = { 1.7, 0.6 },
            width = 408/2,
            height = 136/2,
            hr_version = data_util.hr({
                draw_as_shadow = true,
                filename = "__space-exploration-hr-graphics__/graphics/entity/meteor-point-defence/hr-meteor-point-defence-shadow.png",
                shift = { 1.7, 0.6 },
                width = 408,
                height = 136,
                scale = 0.5,
            })
        }
      }
    },
    call_for_help_radius = 40,
    folded_animation = blank_image,
    collision_box = { { -1.35, -1.35 }, { 1.35, 1.35 } },
    collision_mask = {
      "water-tile",
      "item-layer",
      "object-layer",
      "player-layer",
      spaceship_collision_layer,
    },
    corpse = "medium-remnants",
    dying_explosion = "medium-explosion",
    flags = {"placeable-neutral", "player-creation"},
    icon = "__space-exploration-graphics__/graphics/icons/meteor-point-defence.png",
    icon_size = 64,
    order = "a-a",
    inventory_size = 1,
    max_health = 2000,
    resistances = {
      { type = "impact", percent = 100 },
      { type = "fire", percent = 100 }
    },
    open_sound = {
      filename = "__base__/sound/machine-open.ogg",
      volume = 0.85
    },
    close_sound = {
      filename = "__base__/sound/machine-close.ogg",
      volume = 0.75
    },
    rotation_speed = 0.015,
    selection_box = { { -1.5, -1.5 }, { 1.5, 1.5 } },
    selection_priority = 100,
    vehicle_impact_sound = {
      filename = "__base__/sound/car-metal-impact.ogg",
      volume = 0.65
    }
  },
  {
    type = "sprite",
    name = data_util.mod_prefix .. "meteor-point-defence-mask",
    filename = "__space-exploration-graphics__/graphics/entity/meteor-point-defence/meteor-point-defence-mask.png",
    shift = { 1/32, -1.5 },
    width = 206/2,
    height = 400/2,
    hr_version = data_util.hr({
        filename = "__space-exploration-hr-graphics__/graphics/entity/meteor-point-defence/hr-meteor-point-defence-mask.png",
        shift = { 1/32, -1.5 },
        width = 206,
        height = 400,
        scale = 0.5,
    })
  },
  {
    type = "electric-energy-interface",
    name = data_util.mod_prefix .. "meteor-point-defence-charger",
    icon = "__space-exploration-graphics__/graphics/icons/meteor-point-defence.png",
    flags = {"placeable-player", "player-creation", "placeable-off-grid", "not-deconstructable", "not-blueprintable"},
	
	render_layer="object",
	picture = {
	layers = {
        {
            filename = "__space-exploration-graphics__/graphics/entity/meteor-point-defence/meteor-point-defence-base.png",
            shift = { 1/32, -1.5 },
            width = 206/2,
            height = 400/2,
            hr_version = data_util.hr({
                filename = "__space-exploration-hr-graphics__/graphics/entity/meteor-point-defence/hr-meteor-point-defence-base.png",
                shift = { 1/32, -1.5 },
                width = 206,
                height = 400,
                scale = 0.5,
            })
        },
		{
            filename = "__space-exploration-graphics__/graphics/entity/meteor-point-defence/meteor-point-defence-mask.png",
            shift = { 1/32, -1.5 },
            width = 206/2,
            height = 400/2,
            tint = {r=255,g=0,b=0},
            hr_version = data_util.hr({
                filename = "__space-exploration-hr-graphics__/graphics/entity/meteor-point-defence/hr-meteor-point-defence-mask.png",
                shift = { 1/32, -1.5 },
                width = 206,
                height = 400,
                scale = 0.5,
                tint = {r=255,g=0,b=0},
            })
        },
        {
            draw_as_shadow = true,
            filename = "__space-exploration-graphics__/graphics/entity/meteor-point-defence/meteor-point-defence-shadow.png",
            shift = { 1.7, 0.6 },
            width = 408/2,
            height = 136/2,
            hr_version = data_util.hr({
                draw_as_shadow = true,
                filename = "__space-exploration-hr-graphics__/graphics/entity/meteor-point-defence/hr-meteor-point-defence-shadow.png",
                shift = { 1.7, 0.6 },
                width = 408,
                height = 136,
                scale = 0.5,
            })
        }
      }
	},
	icon_size = 64,
    order = "a-a",
    selectable_in_game = false,
    selection_box = { { -1.5, -1.5 }, { 1.5, 1.5 } },
    collision_box = { { -1.35, -1.35 }, { 1.35, 1.35 } },
    collision_mask = {"not-colliding-with-itself"},
    energy_source = {
      buffer_capacity = "200MJ",
      input_flow_limit = "2MW",
      type = "electric",
      usage_priority = "secondary-input"
    },
    energy_usage = "0.5MW"
  },
  {
    type = "electric-energy-interface",
    name = data_util.mod_prefix .. "meteor-point-defence-charger-overcharged",
	
	render_layer="object",
	picture = { 
	  layers = {
        {
            filename = "__space-exploration-graphics__/graphics/entity/meteor-point-defence/meteor-point-defence-base.png",
            shift = { 1/32, -1.5 },
            width = 206/2,
            height = 400/2,
            hr_version = data_util.hr({
                filename = "__space-exploration-hr-graphics__/graphics/entity/meteor-point-defence/hr-meteor-point-defence-base.png",
                shift = { 1/32, -1.5 },
                width = 206,
                height = 400,
                scale = 0.5,
            })
        },
		{
            filename = "__space-exploration-graphics__/graphics/entity/meteor-point-defence/meteor-point-defence-mask.png",
            shift = { 1/32, -1.5 },
            width = 206/2,
            height = 400/2,
            tint = {r=200,g=100,b=0},
            hr_version = data_util.hr({
                filename = "__space-exploration-hr-graphics__/graphics/entity/meteor-point-defence/hr-meteor-point-defence-mask.png",
                shift = { 1/32, -1.5 },
                width = 206,
                height = 400,
                scale = 0.5,
                tint = {r=200,g=100,b=0},
            })
        },
        {
            draw_as_shadow = true,
            filename = "__space-exploration-graphics__/graphics/entity/meteor-point-defence/meteor-point-defence-shadow.png",
            shift = { 1.7, 0.6 },
            width = 408/2,
            height = 136/2,
            hr_version = data_util.hr({
                draw_as_shadow = true,
                filename = "__space-exploration-hr-graphics__/graphics/entity/meteor-point-defence/hr-meteor-point-defence-shadow.png",
                shift = { 1.7, 0.6 },
                width = 408,
                height = 136,
                scale = 0.5,
            })
        }
      }
	},
    icon = "__space-exploration-graphics__/graphics/icons/meteor-point-defence.png",
    flags = {"placeable-player", "player-creation", "placeable-off-grid", "not-deconstructable", "not-blueprintable"},
    icon_size = 64,
    selectable_in_game = false,
    selection_box = { { -1.5, -1.5 }, { 1.5, 1.5 } },
    collision_box = { { -1.35, -1.35 }, { 1.35, 1.35 } },
    collision_mask = {"not-colliding-with-itself"},
    energy_source = {
      buffer_capacity = "1000MJ",
      input_flow_limit = "10GW",
      type = "electric",
      usage_priority = "primary-input"
    },
    energy_usage = "0.25MW"
  },
  {
    type = "explosion",
    name = data_util.mod_prefix .. "meteor-point-defence-beam",
    animations = {
      {
        filename = "__space-exploration-graphics__/graphics/entity/meteor-point-defence/meteor-point-defence-beam.png",
        frame_count = 6,
        height = 1,
        priority = "extra-high",
        width = 576/6
      }
    },
    beam = true,
    flags = { "not-on-map", "placeable-off-grid"},
    light = {
      color = {
        b = 0.5,
        g = 0.95,
        r = 1
      },
      intensity = 1,
      size = 20
    },
    rotate = true,
    smoke = "smoke-fast",
    smoke_count = 2,
    smoke_slow_down_factor = 1,
    sound = {
      {
        filename = "__base__/sound/fight/heavy-gunshot-1.ogg",
        volume = 0.45
      },
      {
        filename = "__base__/sound/fight/heavy-gunshot-2.ogg",
        volume = 0.45
      },
      {
        filename = "__base__/sound/fight/heavy-gunshot-3.ogg",
        volume = 0.45
      },
      {
        filename = "__base__/sound/fight/heavy-gunshot-4.ogg",
        volume = 0.45
      }
    },
  },
})

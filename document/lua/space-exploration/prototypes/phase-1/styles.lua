local data_util = require("data_util")

local ui_width = 300
local margin_right = 20
local space_for_button = 36


data.raw["gui-style"]["default"]["space_platform_textfield"] = {
    width = ui_width - margin_right,
    type = "textbox_style",
}
data.raw["gui-style"]["default"]["space_platform_textfield_short"] = {
    width = ui_width - margin_right - space_for_button,
    type = "textbox_style",
}
data.raw["gui-style"]["default"]["space_platform_label"] = {
    width = ui_width - margin_right,
    parent= "label",
    type = "label_style",
    single_line = false,
}
data.raw["gui-style"]["default"]["space_platform_label_short"] = {
    width = ui_width - margin_right - space_for_button,
    parent= "label",
    type = "label_style",
    single_line = false,
}
data.raw["gui-style"]["default"]["space_platform_title"] = {
    width = ui_width - margin_right,
    parent= "label",
    type = "label_style",
    font = "default-large-semibold",
    single_line = false,
}
data.raw["gui-style"]["default"]["space_platform_title_short"] = {
    width = ui_width - margin_right - space_for_button,
    parent= "label",
    type = "label_style",
    font = "default-large-semibold",
    single_line = false,
}
data.raw["gui-style"]["default"]["space_platform_fieldset"] = {
    width = ui_width - margin_right,
    type = "frame_style",
    parent = "frame",
}
data.raw["gui-style"]["default"]["space_platform_container"] = {
    minimal_width = ui_width,
    type = "frame_style",
    parent = "frame",
}
data.raw["gui-style"]["default"]["space_platform_sprite_button"] = {
    type = "button_style",
    parent = "button",
    width = 32,
    height = 32,
    top_padding = 1,
    right_padding = 1,
    bottom_padding = 1,
    left_padding = 1,
}
data.raw["gui-style"]["default"]["space_platform_sprite_button_small"] = {
    type = "button_style",
    parent = "space_platform_sprite_button",
    width = 20,
    height = 20,
}
data.raw["gui-style"]["default"]["space_platform_button"] = {
    type = "button_style",
    parent = "button",
}
data.raw["gui-style"]["default"]["space_platform_progressbar_capsule"] = {
    type = "progressbar_style",
    parent = "progressbar",
    color = {
      r = 0/255,
      g = 255/255,
      b = 0/255
    }
}
data.raw["gui-style"]["default"]["space_platform_progressbar_sections"] = {
    type = "progressbar_style",
    parent = "progressbar",
    color = {
      r = 255/255,
      g = 255/255,
      b = 0/255
    }
}
data.raw["gui-style"]["default"]["space_platform_progressbar_fuel"] = {
    type = "progressbar_style",
    parent = "progressbar",
    color = {
      r = 233/255,
      g = 93/255,
      b = 0/255
    }
}
data.raw["gui-style"]["default"]["space_platform_progressbar_cargo"] = {
    type = "progressbar_style",
    parent = "progressbar",
    color = {
      r = 52/255,
      g = 107/255,
      b = 219/255
    }
}
data.raw["gui-style"]["default"]["space_platform_progressbar_integrity"] = {
    type = "progressbar_style",
    parent = "progressbar",
    color = {
      r = 233/255,
      g = 0/255,
      b = 0/255
    }
}
data.raw["gui-style"]["default"]["spaceship_progressbar_energy"] = {
    type = "progressbar_style",
    parent = "progressbar",
    bar_width = 24,
    color = {
      r = 233/255,
      g = 120/255,
      b = 0/255
    }
}
data.raw["gui-style"]["default"]["spaceship_progressbar_streamline"] = {
    type = "progressbar_style",
    parent = "progressbar",
    bar_width = 24,
    color = {
      r = 0/255,
      g = 120/255,
      b = 253/255
    }
}
data.raw["gui-style"]["default"]["spaceship_progressbar_integrity"] = {
    type = "progressbar_style",
    parent = "progressbar",
    bar_width = 24,
    color = {
      r = 233/255,
      g = 0/255,
      b = 0/255
    }
}
data.raw["gui-style"]["default"]["view_zone_button"] = {
    type = "button_style",
    vertical_align = "center",
    scale = 1,
    scalable = false,
    width = 300,
    height = 32,
    horizontally_stretchable = "off",
    vertically_stretchable = "off",
    horizontally_squashable = "off",
    vertically_squashable = "off",
    top_padding = 0,
    bottom_padding = 0,
    left_padding = 0,
    right_padding = 0,
    top_margin = 0,
    bottom_margin = 0,
    left_margin = 0,
    right_margin = 0,
}
data.raw["gui-style"]["default"]["view_zone_button_flow"] = {
    type = "horizontal_flow_style",
    vertical_align = "center",
    scale = 1,
    scalable = false,
    width = 300,
    height = 32,
    horizontally_stretchable = "off",
    vertically_stretchable = "off",
    horizontally_squashable = "off",
    vertically_squashable = "off",
    top_padding = 0,
    bottom_padding = 0,
    left_padding = 0,
    right_padding = 0,
    top_margin = 0,
    bottom_margin = 0,
    left_margin = 0,
    right_margin = 0,
}
data.raw["gui-style"]["default"]["view_zone_button_label"] = {
    type = "label_style",
    scale = 1,
    scalable = false,
    width = 200,
    height = 32,
    horizontally_stretchable = "off",
    vertically_stretchable = "off",
    horizontally_squashable = "off",
    vertically_squashable = "off",
    top_padding = 0,
    bottom_padding = 0,
    left_padding = 0,
    right_padding = 0,
    top_margin = 0,
    bottom_margin = 0,
    left_margin = 0,
    right_margin = 0,
}
data.raw["gui-style"]["default"]["view_zone_button_sprite"] = {
  type = "button_style",
  parent = "map_generator_preview_button",
  icon_horizontal_align = "left",
  width = 300
}

--icon_horizontal_align = "left",

-- ZONELIST UI
data.raw["gui-style"]["default"]["zonelist_priority_textfield"] = {
  type = "textbox_style",
  default_background = {
    base = {
      center = {
        position = {43,8},
        size = 1
      },
      corner_size = 8,
      draw_type = "inner",
      position = {34, 0}
    },
    shadow = nil
  },
  active_background = {
    base = {
      center = {
        position = {60,26},
        size = 1
      },
      corner_size = 8,
      draw_type = "inner",
      position = {51, 17}
    },
  }
}
data.raw["gui-style"]["default"]["zonelist_priority_button"] = {
  default_graphical_set = {
    base = {
      corner_size = 8,
      position = {
        247,
        17
      }
    },
    --[[shadow = {
      corner_size = 8,
      draw_type = "outer",
      position = {
        395,
        86
      }
    }]]--
  },
  type = "button_style"
}

data.raw["gui-style"]["default"]["zonelist_content_pane"] = {
  type = "scroll_pane_style",
  --extra_padding_when_activated = -4,
  graphical_set = {
    base = {},
    shadow = nil
  },
  vertical_scrollbar_style = {
    background_graphical_set = {
      blend_mode = "multiplicative-with-alpha",
      corner_size = 8,
      opacity = 0.7,
      position = {
        0,
        72
      }
    },
    type = "vertical_scrollbar_style"
  },
  vertically_stretchable = "on",
  horizontally_squashable = "on",
  padding = 12,
}

data.raw["gui-style"]["default"]["zonelist_progressbar"] = {
  type = "progressbar_style",
  parent = "progressbar",
  bar_width = 24,
  color = {
    r = 220/255,
    g = 200/255,
    b = 0/255
  }
}

data.raw["gui-style"]["default"]["zonelist_rows_pane"] = {
  type = "scroll_pane_style",
  graphical_set = {
    base = {},
    shadow = nil
  },
  vertical_scrollbar_style = {
    background_graphical_set = {
      blend_mode = "multiplicative-with-alpha",
      corner_size = 8,
      opacity = 0.7,
      position = {
        0,
        72
      }
    },
    type = "vertical_scrollbar_style"
  },
  vertically_stretchable = "on",
  horizontally_squashable = "on",
  padding = 0,
  extra_padding_when_activated = 0,
}


data.raw["gui-style"]["default"]["zonelist_row_button"] = {
  type = "button_style",
  horizontally_stretchable = "on",
  horizontally_squashable = "on",
  bottom_margin = -3,
  default_font_color = {250/255,250/255,250/255},
  hovered_font_color = { 0.0, 0.0, 0.0 },
  selected_clicked_font_color = { 0.97, 0.54, 0.15 },
  selected_font_color = { 0.97, 0.54, 0.15 },
  selected_hovered_font_color = { 0.97, 0.54, 0.15  },
  clicked_graphical_set = {
    corner_size = 8,
    position = { 51, 17 }
  },
  default_graphical_set = {
    corner_size = 8,
    position = { 208, 17 }
  },
  disabled_graphical_set = {
    corner_size = 8,
    position = { 17, 17 }
  },
  hovered_graphical_set = {
    base = {
      corner_size = 8,
      position = { 34, 17 }
    }
  }
}

data.raw["gui-style"]["default"]["zonelist_row_button_selected"] = {
  type = "button_style",
  parent = "zonelist_row_button",
  top_padding = 3,
  left_padding = 11,
  default_font_color = { 0.0, 0.0, 0.0 },
  hovered_font_color = { 0.0, 0.0, 0.0 },
  selected_clicked_font_color = { 0.0, 0.0, 0.0 },
  selected_font_color = { 0.0, 0.0, 0.0 },
  selected_hovered_font_color = { 0.0, 0.0, 0.0 },
  clicked_graphical_set = {
    border = 1,
    filename = "__core__/graphics/gui.png",
    position = { 75, 108 },
    scale = 1,
    size = 36
  },
  default_graphical_set = {
    border = 1,
    filename = "__core__/graphics/gui.png",
    position = {75,108},
    scale = 1,
    size = 36
  },
  hovered_graphical_set = {
    border = 1,
    filename = "__core__/graphics/gui.png",
    position = {75,108},
    scale = 1,
    size = 36
  },
}

data.raw["gui-style"]["default"]["se_frame_deep_slots_small"] = {
  type = "frame_style",
  parent = "slot_button_deep_frame",
  background_graphical_set = {
      position = {282, 17},
      corner_size = 8,
      overall_tiling_vertical_size = 32,
      overall_tiling_vertical_spacing = 8,
      overall_tiling_vertical_padding = 4,
      overall_tiling_horizontal_size = 32,
      overall_tiling_horizontal_spacing = 8,
      overall_tiling_horizontal_padding = 4
  }
}

data.raw["gui-style"]["default"]["se_sprite-button_inset"] = {
  type = "button_style",
  size = 40,
  padding = 0,
  default_graphical_set = data.raw["gui-style"]["default"].textbox.default_background,
  hovered_graphical_set = data.raw["gui-style"]["default"].rounded_button.clicked_graphical_set,
  clicked_graphical_set = data.raw["gui-style"]["default"].textbox.active_background,
  disabled_graphical_set = data.raw["gui-style"]["default"].rounded_button.disabled_graphical_set
}

data.raw["gui-style"]["default"]["se_sprite-button_inset_tiny"] = {
  type = "button_style",
  parent = "se_sprite-button_inset",
  size = 32
}

local graphic_set_down = {
  default_graphical_set = {
    base = {
      center = {
        position = {43,8},
        size = 1
      },
      corner_size = 8,
      draw_type = "inner",
      position = {34, 0}
    },
    shadow = {
      corner_size = 8,
      draw_type = "outer",
      position = {
        440,
        24
      }
    }
  },
}
local graphic_set_active_a = {
  default_font_color = { 0.0, 0.0, 0.0 },
  hovered_font_color = { 0.0, 0.0, 0.0 },
  selected_clicked_font_color = { 0.0, 0.0, 0.0 },
  selected_font_color = { 0.0, 0.0, 0.0 },
  selected_hovered_font_color = { 0.0, 0.0, 0.0 },
  default_graphical_set = {
    base = {
      corner_size = 8,
      position = {
        369,
        17
      }
    },
    shadow = {
      corner_size = 8,
      draw_type = "outer",
      position = {
        440,
        24
      }
    }
  },
}
data.raw["gui-style"]["default"]["se_button_discovery"] = {
  type = "button_style",
  parent = "se_generic_button",
  width = 165,
  height = 90,
  top_padding = 20,
  horizontal_align = "center",
  vertical_align = "center"
}
data.raw["gui-style"]["default"]["se_button_discovery_down"] = {
  type = "button_style",
  parent = "se_generic_button_down",
  width = 165,
  height = 90,
  top_padding = 20,
  horizontal_align = "center",
  vertical_align = "center"
}
data.raw["gui-style"]["default"]["se_button_discovery_active"] = {
  type = "button_style",
  parent = "se_generic_button_active",
  width = 165,
  height = 90,
  top_padding = 20,
  horizontal_align = "center",
  vertical_align = "center"
}

data.raw["gui-style"]["default"]["se_button_discovery_any"] = {
  type = "button_style",
  parent = "se_generic_button",
  width = 340,
  height = 70,
  padding = 10,
  horizontal_align = "center",
  vertical_align = "center",
  horizontally_stretchable = "on",
  font="heading-2",
}
data.raw["gui-style"]["default"]["se_button_discovery_any_down"] = {
  type = "button_style",
  parent = "se_generic_button_down",
  width = 340,
  height = 70,
  padding = 10,
  horizontal_align = "center",
  vertical_align = "center",
  horizontally_stretchable = "on",
  font="heading-2",
}
data.raw["gui-style"]["default"]["se_button_discovery_any_active"] = {
  type = "button_style",
  parent = "se_generic_button_active",
  width = 340,
  height = 70,
  padding = 10,
  horizontal_align = "center",
  vertical_align = "center",
  horizontally_stretchable = "on",
  font="heading-2",
}

local graphic_set_active_b = {
  default_graphical_set = {
    base = {
      center = {
        position = {43+17,8+17},
        size = 1
      },
      corner_size = 8,
      draw_type = "inner",
      position = {34+17, 0+17}
    },
    shadow = {
      corner_size = 8,
      draw_type = "outer",
      position = {
        440,
        24
      }
    }
  }
}

data_util.extend_style("frame_button", "se_generic_button", {
  padding = -4,
  default_font_color = { 1,1,1 },
})
data_util.extend_style("se_generic_button", "se_generic_button_down", graphic_set_down)
data_util.extend_style("se_generic_button", "se_generic_button_active", graphic_set_active_a)

local discovery_overrides = {
  width = 165,
  height = 90,
  top_padding = 20,
  horizontal_align = "center",
  vertical_align = "center"
}
data_util.extend_style("se_generic_button", "se_button_discovery", discovery_overrides)
data_util.extend_style("se_generic_button_down", "se_button_discovery_down", discovery_overrides)
data_util.extend_style("se_generic_button_active", "se_button_discovery_active", discovery_overrides)

local discovery_any_overrides = data_util.apply_styles(table.deepcopy(discovery_overrides), {
  width = 340,
  height = 70,
  padding = 10,
  horizontally_stretchable = "on",
  font="heading-2",
})
data_util.extend_style("se_generic_button", "se_button_discovery_any", discovery_any_overrides)
data_util.extend_style("se_generic_button_down", "se_button_discovery_any_down", discovery_any_overrides)
data_util.extend_style("se_generic_button_active", "se_button_discovery_any_active", discovery_any_overrides)

data_util.extend_style("frame_button", "se_generic_square_button", {
  size = 28,
  top_padding = -2,
  top_margin = -4,
  default_font_color = { 1,1,1 },
})
data_util.extend_style("se_generic_square_button", "se_generic_square_button_down", graphic_set_down)
data_util.extend_style("se_generic_square_button", "se_generic_square_button_active", graphic_set_active_b)

local zone_list_overrides = {
  height = 28,
  width = 28,
  right_margin = 5,
  top_margin = -2
}

data_util.extend_style("se_generic_square_button", "se_zone_list_filter", zone_list_overrides)
data_util.extend_style("se_generic_square_button_down", "se_zone_list_filter_down", zone_list_overrides)

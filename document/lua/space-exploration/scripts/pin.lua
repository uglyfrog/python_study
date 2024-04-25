local Pin = {}
--[[
Pins
Pins lets the player save locations and quickly jump to them in navigation view.
]]--

-- constants
Pin.name_button_add_pin = "remote-view-add-pin"
Pin.tag_pin_button = "se-pin-button"
Pin.name_button_confirm_pin = "remote-view-confirm-pin"
Pin.name_button_cancel_pin = "remote-view-cancel-pin"
Pin.name_button_update_position_pin = "remote-view-update-positioni-pin"
Pin.name_button_pins = "remote-view-open_pins"
Pin.name_dialog_root = "remote-view-dialog-root"
Pin.name_hotkey_dropdown = "selector_content_frame_table_hotkey_dropdown"
Pin.name_setting_expanded_tooltip = mod_prefix.."show-pin-help-tooltip"
Pin.name_all_root = "remote-view-all-root"
Pin.name_button_close = "remote-view-close-pins"
Pin.min_zoom = 0.40 -- pretty close approximation to what vanilla lets you max zoom out
Pin.max_zoom = 3.00 -- pretty close approximation to what vanilla lets you max zoom in

-- goto pin hotkeys
Pin.name_event_one = mod_prefix.."pin-one"
Pin.name_event_two = mod_prefix.."pin-two"
Pin.name_event_three = mod_prefix.."pin-three"
Pin.name_event_four = mod_prefix.."pin-four"
Pin.name_event_five = mod_prefix.."pin-five"
Pin.name_event_six = mod_prefix.."pin-six"
Pin.name_event_seven = mod_prefix.."pin-seven"
Pin.name_event_eight = mod_prefix.."pin-eight"
Pin.name_event_nine = mod_prefix.."pin-nine"
Pin.name_event_zero = mod_prefix.."pin-zero"

-- set pin hotkeys
Pin.name_event_set_one = mod_prefix.."pin-set-one"
Pin.name_event_set_two = mod_prefix.."pin-set-two"
Pin.name_event_set_three = mod_prefix.."pin-set-three"
Pin.name_event_set_four = mod_prefix.."pin-set-four"
Pin.name_event_set_five = mod_prefix.."pin-set-five"
Pin.name_event_set_six = mod_prefix.."pin-set-six"
Pin.name_event_set_seven = mod_prefix.."pin-set-seven"
Pin.name_event_set_eight = mod_prefix.."pin-set-eight"
Pin.name_event_set_nine = mod_prefix.."pin-set-nine"
Pin.name_event_set_zero = mod_prefix.."pin-set-zero"

--[[
Opens the pin GUI as part of the navigation view GUI.
]]--
function Pin.gui_open(player)
  local root = player.gui.left[RemoteView.name_gui_root]

  local pin_table = root.add {
    type = "table",
    name = "pin_table",
    column_count = 4,
    style = "filter_slot_table"
  }
  pin_table.style.top_margin = 10
  pin_table.style.horizontally_stretchable = true
  pin_table.style.column_alignments[1] = "left"
  pin_table.style.column_alignments[2] = "right"

  local pin_add_flow = pin_table.add{
    type = "flow",
    name = "pin_add_flow"
  }

  local pin_list_flow = pin_table.add{
    type = "flow",
    name = "pin_list_flow"
  }

  local new_pin_button = pin_add_flow.add {
    type = "sprite-button",
    sprite = ("se-pin-add"),
    name = Pin.name_button_add_pin,
    style="informatron_close_button",
    tooltip = {"space-exploration.remote-view-add-pin"},
    mouse_button_filter = {"left"}
  }
  new_pin_button.style.width = 32
  new_pin_button.style.height = 32

  local add_pin_label = pin_add_flow.add {
    type = "label",
    name = "add_pin_label",
    caption = {"space-exploration.remote-view-pin-make"}
  } -- left
  add_pin_label.style.font_color = {
    r = 0.5,
    g = 0.5,
    b = 0.5
  }
  add_pin_label.style.horizontally_stretchable = true
  add_pin_label.style.left_margin = 10

  local list_pins_label = pin_list_flow.add {
    type = "label",
    name = "list_pins_label",
    caption = {"space-exploration.remote-view-pins-list"}
  } -- left
  list_pins_label.style.font_color = {
    r = 0.5,
    g = 0.5,
    b = 0.5
  }
  list_pins_label.style.horizontally_stretchable = true
  list_pins_label.style.right_margin = 10

  local pins = pin_list_flow.add{
    type="sprite-button",
    name=Pin.name_button_pins,
    sprite = "se-pin-list",
    style="informatron_close_button",
    tooltip={"space-exploration.open-pins-remote-view"}
  }
  pins.style.width = 32
  pins.style.height = 32

  local pin_frame = root.add {
    type = "frame",
    name = "pin_frame",
    style = "se_frame_deep_slots_small"
  }
  pin_frame.style.horizontally_stretchable = true
  pin_frame.style.top_margin = 10

  local pins_table = pin_frame.add {
    type = "table",
    name = "pins_table",
    column_count = 10,
    style = "filter_slot_table"
  }
end

-- Maps the hotkey index to the tooltip string
local tooltip_map = {}
-- 0 is the dropdown menu for no selection (we don't use this)
-- 1 is the dropdown menu for none hotkey (we use this)
tooltip_map[2] = "space-exploration.remote-view-pin-button-tooltip-hotkey-one"
tooltip_map[3] = "space-exploration.remote-view-pin-button-tooltip-hotkey-two"
tooltip_map[4] = "space-exploration.remote-view-pin-button-tooltip-hotkey-three"
tooltip_map[5] = "space-exploration.remote-view-pin-button-tooltip-hotkey-four"
tooltip_map[6] = "space-exploration.remote-view-pin-button-tooltip-hotkey-five"
tooltip_map[7] = "space-exploration.remote-view-pin-button-tooltip-hotkey-six"
tooltip_map[8] = "space-exploration.remote-view-pin-button-tooltip-hotkey-seven"
tooltip_map[9] = "space-exploration.remote-view-pin-button-tooltip-hotkey-eight"
tooltip_map[10] = "space-exploration.remote-view-pin-button-tooltip-hotkey-nine"
tooltip_map[11] = "space-exploration.remote-view-pin-button-tooltip-hotkey-zero"

--[[
Determines the appropriate tooltip to use for a certain pin.
Based on if the pin has an associated hotkey, it will use a different tooltip to show the hotkey in the tooltip.
]]--
function Pin.get_tooltip_for_pin(playerdata, item_name)
  for key, value in pairs(playerdata.saved_hotkeys) do
    if value == item_name then
      return tooltip_map[key]
    end
  end
  return "space-exploration.remote-view-pin-button-tooltip"
end

--[[
Makes the data valid.
Deletes quick pins to deleted surfaces/spaceships.
]]
function Pin.make_valid(playerdata)
  -- determine invalid pins
  for key, value in pairs(playerdata.saved_pins) do
    if key ~= "id" then
      if not value then
        playerdata.saved_pins[key] = nil
      else
        local location = Location.from_reference(value.location_reference)
        if not location or not location.zone then
          playerdata.saved_pins[key] = nil
        end
      end
    end
  end
  -- replace the old pin table with a new pin table that doesn't include the invalid ones
  local saved_pins_new = {}
  for key, value in pairs(playerdata.saved_pins) do
    if value then
      saved_pins_new[key] = value
    end
  end
  playerdata.saved_pins = saved_pins_new
  -- remove hotkeys for deleted pins
  for key, value in pairs(playerdata.saved_hotkeys) do
    if not playerdata.saved_pins[value] then
      playerdata.saved_hotkeys[key] = nil
    end
  end
end

--[[
If it is valid for the player to add or update the position of pins from their current zone.
]]
function Pin.add_or_update_pin_position_valid(player)
  local root = player.gui.left[RemoteView.name_gui_root]
  if root then
    local currently_viewing_frame = root.currently_viewing_frame
    if currently_viewing_frame then
      return currently_viewing_frame.visible
    end
  end
  return true
end

--[[
Rebuilds the entire quick pin GUI.
Necessary to call in response to changes to the data displayed in the GUI.
]]--
function Pin.gui_update(player)
  local playerdata = Pin.get_make_pin_playerdata(player)

  -- makes the data valid (fix deletes surfaces)
  Pin.make_valid(playerdata)

  -- update the window too if it exists
  Pin.window_update(player)

  -- clear the data-driven part of the GUI
  local root = player.gui.left[RemoteView.name_gui_root]
  if not root then
    return
  end

  local pins_table = root.pin_frame.pins_table
  pins_table.clear()

  -- build the data-driven part of the GUI
  local add_or_update_pin_position_valid = Pin.add_or_update_pin_position_valid(player)

  for key, value in pairs(playerdata.saved_pins) do
    if key ~= "id" then
      local sprite_path = Pin.signal_to_sprite_path(value.signal)
      local location = Location.from_reference(value.location_reference)
      local name = location.name or ""
      local tooltip = {"", {Pin.get_tooltip_for_pin(playerdata, key), location.zone.name, name}}
      if settings.get_player_settings(player)[Pin.name_setting_expanded_tooltip].value == true then
        table.insert(tooltip, {"space-exploration.remote-view-pin-button-tooltip-help-text"})
        if add_or_update_pin_position_valid then
          table.insert(tooltip, {"space-exploration.remote-view-pin-button-tooltip-help-text-update-position"})
        end
      end
      if location.zone == Zone.from_surface(player.surface) then
        local pin_button = pins_table.add {
          type = "sprite-button",
          sprite = sprite_path,
          tags = {
            action = Pin.tag_pin_button,
            item_name = key
          },
          style = "se_sprite-button_inset",
          tooltip = tooltip
        }
      end
    end
  end


  -- add the new-pin button at the end of the list so it's always last
  if add_or_update_pin_position_valid then
    root.pin_table.pin_add_flow.add_pin_label.visible = true
    root.pin_table.pin_add_flow[Pin.name_button_add_pin].visible = true
  else
    root.pin_table.pin_add_flow.add_pin_label.visible = false
    root.pin_table.pin_add_flow[Pin.name_button_add_pin].visible = false
  end

  -- if there are no pins and adding pins is not valid, make the UI for pins invisible
  if #pins_table.children > 0 then
    --root.pin_table.visible = true
    root.pin_frame.visible = true
  else
    --root.pin_table.visible = false
    root.pin_frame.visible = false
  end
end

--[[
Handles click events anywhere on the UI:
  clicks on the add-pin button uses Pin.modal_open
  delegates clicks on pin buttons to Pin.on_gui_pin_button_click
  delegates clicks on the modal to Pin.on_gui_modal_click
Return value is if the quick pin UI consumed the event.
]]--
function Pin.on_gui_click(event)
  local element = event.element
  local player = game.players[event.player_index]

  if element.name == Pin.name_button_pins then
    Pin.window_toggle(player)
    return
  end
  if element.tags and element.tags.action == Pin.tag_pin_button then
    Pin.on_gui_pin_button_click(player, event) return true
  elseif element.name == Pin.name_button_add_pin then
    local playerdata = Pin.get_make_pin_playerdata(player)
    local id = playerdata.saved_pins.id
    local item_name = "pin-button-prefix-" .. id
    playerdata.saved_pins.id = playerdata.saved_pins.id + 1
    Pin.modal_open(player, item_name) return true
  else
    local root = gui_element_or_parent(element, Pin.name_dialog_root)
    if root then
        Pin.on_gui_modal_click(player, root, element) return true
    else
      root = gui_element_or_parent(element, Pin.name_all_root)
      if root then
        Pin.on_gui_window_click(player, root, element) return true
      end
    end
  end
  return false
end

--[[
Handles click events on the modal.
]]
function Pin.on_gui_modal_click(player, root, element)
  if element.name == Pin.name_button_confirm_pin then
    local name_textfield = root.selector_content_flow.selector_content_frame.selector_content_frame_flow
                          .selector_content_frame_table.selector_content_frame_table_name_textfield
    local icon_selector = root.selector_content_flow.selector_content_frame.selector_content_frame_flow
                          .selector_content_frame_table.selector_content_frame_table_icon_selector
    local zoom_textfield = root.selector_content_flow.selector_content_frame.selector_content_frame_flow
                          .selector_content_frame_table.selector_content_frame_table_zoom_flow.selector_content_frame_table_zoom_flow_textfield
    local hotkey_dropdown = root.selector_content_flow.selector_content_frame.selector_content_frame_flow
                          .selector_content_frame_table.selector_content_frame_table_hotkey_dropdown
    local text = name_textfield.text
    local icon = icon_selector.elem_value
    local zoom = zoom_textfield.text
    local hotkey = hotkey_dropdown.selected_index
    Pin.add_update_pin(player, text, icon, zoom, hotkey, true)
    Pin.modal_close(player)
  elseif element.name == Pin.name_button_cancel_pin then
    Pin.modal_close(player)
  elseif element.name == Pin.name_button_update_position_pin then
    local add_or_update_pin_position_valid = Pin.add_or_update_pin_position_valid(player)
    -- don't allow the player to update the position of a pin when their current position isn't valid
    if add_or_update_pin_position_valid then
      local playerdata = Pin.get_make_pin_playerdata(player)
      local saved_pin = playerdata.saved_pins[playerdata.quick_pin_opened_item_name]
      saved_pin.location_reference = Location.update_reference_position(saved_pin.location_reference, Zone.from_surface(player.surface), player.position)
      -- since we don't have a method for rebuilding the modal gui, make the changes to it here
      local root = player.gui.screen[Pin.name_dialog_root]
      if root then
        root.selector_content_flow.selector_content_frame.selector_content_frame_flow
            .selector_content_frame_table.selector_content_frame_table_location_flow
            .selector_content_frame_table_location_flow_label.caption = {"space-exploration.remote-view-pin-location-position", string.format("%.0f", player.position.x), string.format("%.0f", player.position.y)}
      end
    end
  end
end

--[[
Handles click events on the window.
]]
function Pin.on_gui_window_click(player, root, element)
  if element.name == Pin.name_button_close then
    Pin.window_close(player)
  end
end

--[[
Closes this GUI.
]]
function Pin.gui_close(player)
  Pin.modal_close(player)
  Pin.window_close(player)
end

--[[
Closes the modal.
]]--
function Pin.modal_close(player)
  if player.gui.screen[Pin.name_dialog_root] then
    player.gui.screen[Pin.name_dialog_root].destroy()
  end
end

--[[
Converts a signal to a sprite path.
The signal is chosen from a "choose-elem-button" UI element with "elem_type" set to "signal".
]]
function Pin.signal_to_sprite_path(signal)
  if signal then
    if signal.type == "item" then
      return "item/" .. signal.name
    elseif signal.type == "fluid" then
      return "fluid/" .. signal.name
    elseif signal.type == "virtual" then
      return "virtual-signal/" .. signal.name
    end
  end
  return nil
end

--[[
Converts a signal to a rich text icon.
The signal is chosen from a "choose-elem-button" UI element with "elem_type" set to "signal".
]]--
function Pin.signal_to_rich_text(signal)
  if signal then
    if signal.type == "item" then
      return "[img=item."..signal.name.."]"
    elseif signal.type == "fluid" then
      return "[img=fluid."..signal.name.."]"
    elseif signal.type == "virtual" then
      return "[img=virtual-signal."..signal.name.."]"
    end
  end
  return ""
end

--[[
Makes the rich text icon string for the hotkey dropdown option.
Each hotkey dropdown displays the hotkey itself followed by a rich text icon of the pin it is for.
This function creates that rich text icon based on the index of the dropdown option.
]]--
function Pin.make_hotkey_string(playerdata, index)
  if playerdata.saved_hotkeys[index] then
    local saved_pin = playerdata.saved_pins[playerdata.saved_hotkeys[index]]
    if saved_pin then
        return Pin.signal_to_rich_text(saved_pin.signal)
    end
  end
  return ""
end

--[[
Opens a modal for selecting the properties of the pin icon on the bar.
The modal is setup to match the look/feel of the vanilla map tag UI.
]]--
function Pin.modal_open(player, item_name)
  Pin.modal_close(player) -- always start fresh

  local playerdata = Pin.get_make_pin_playerdata(player)
  playerdata.quick_pin_opened_item_name = item_name

  local selector_frame = player.gui.screen.add {
    type = "frame",
    name = Pin.name_dialog_root,
    direction = "vertical"
  }
  selector_frame.style.maximal_height = 1440
  selector_frame.auto_center = true

  local selector_title_flow = selector_frame.add {
    type = "flow",
    direction = "horizontal"
  }
  selector_title_flow.drag_target = selector_frame
  selector_title_flow.style.vertically_stretchable = "off"

  local selector_title_label = selector_title_flow.add {
    type = "label",
    caption = {"space-exploration.remote-view-pin-details"},
    style = "frame_title",
    ignored_by_interaction = true
  }
  selector_title_label.style.vertically_stretchable = "on"
  selector_title_label.style.horizontally_squashable = "on"

  local selector_title_empty = selector_title_flow.add {
    type = "empty-widget",
    style = "draggable_space",
    ignored_by_interaction = true
  }
  selector_title_empty.style.horizontally_stretchable = "on"
  selector_title_empty.style.left_margin = 4
  selector_title_empty.style.right_margin = 0
  selector_title_empty.style.height = 24

  local selector_content_flow = selector_frame.add {
    type = "flow",
    name = "selector_content_flow",
    direction = "vertical"
  }

  local selector_content_frame = selector_content_flow.add {
    type = "frame",
    name = "selector_content_frame",
    direction = "vertical",
    style = "inside_shallow_frame_with_padding"
  }
  selector_content_frame.style.horizontally_stretchable = "on"

  local selector_content_frame_flow = selector_content_frame.add {
    type = "flow",
    name = "selector_content_frame_flow",
    direction = "horizontal"
  }
  selector_content_frame_flow.style.horizontally_stretchable = "on"

  local selector_content_frame_table = selector_content_frame_flow.add {
    type = "table",
    name = "selector_content_frame_table",
    column_count = 2,
    style = "player_input_table"
  }

  local selector_content_frame_table_name_label = selector_content_frame_table.add {
    type = "label",
    caption = {"space-exploration.remote-view-pin-name"}
  }

  local selector_content_frame_table_name_textfield = selector_content_frame_table.add {
    type = "textfield",
    name = "selector_content_frame_table_name_textfield"
  }
  selector_content_frame_table_name_textfield.style.maximal_width = 0
  selector_content_frame_table_name_textfield.style.horizontally_stretchable = "on"
  selector_content_frame_table_name_textfield.focus()
  selector_content_frame_table_name_textfield.select_all()

  local selector_content_frame_table_icon_label = selector_content_frame_table.add {
    type = "label",
    caption = {"space-exploration.remote-view-pin-icon"}
  }

  local selector_content_frame_table_icon_selector = selector_content_frame_table.add {
    type = "choose-elem-button",
    elem_type = "signal",
    name = "selector_content_frame_table_icon_selector"
  }

  local selector_content_frame_table_zoom_label = selector_content_frame_table.add {
    type = "label",
    caption = {"space-exploration.remote-view-pin-zoom"}
  }

  local selector_content_frame_table_zoom_flow = selector_content_frame_table.add {
    type = "flow",
    direction = "horizontal",
    name = "selector_content_frame_table_zoom_flow"
  }
  selector_content_frame_table_zoom_flow.style.vertical_align = "center"

  local selector_content_frame_table_zoom_flow_slider = selector_content_frame_table_zoom_flow.add {
    type = "slider",
    minimum_value = Pin.min_zoom,
    maximum_value = Pin.max_zoom,
    discrete_values = false,
    name = "selector_content_frame_table_zoom_flow_slider"
  }

  local selector_content_frame_table_zoom_flow_textfield = selector_content_frame_table_zoom_flow.add {
    type = "textfield",
    numeric = true,
    allow_decimal = true,
    name = "selector_content_frame_table_zoom_flow_textfield"
  }
  selector_content_frame_table_zoom_flow_textfield.style.width = 40

  local selector_content_frame_table_hotkey_label = selector_content_frame_table.add {
    type = "label",
    caption = {"space-exploration.remote-view-pin-hotkey"}
  }

  local selector_content_frame_table_hotkey_dropdown = selector_content_frame_table.add {
    type = "drop-down",
    name = Pin.name_hotkey_dropdown,
    items = {
      {"space-exploration.remote-view-pin-hotkey-none"},
      {"space-exploration.remote-view-pin-hotkey-one", Pin.make_hotkey_string(playerdata, 2)},
      {"space-exploration.remote-view-pin-hotkey-two", Pin.make_hotkey_string(playerdata, 3)},
      {"space-exploration.remote-view-pin-hotkey-three", Pin.make_hotkey_string(playerdata, 4)},
      {"space-exploration.remote-view-pin-hotkey-four", Pin.make_hotkey_string(playerdata, 5)},
      {"space-exploration.remote-view-pin-hotkey-five", Pin.make_hotkey_string(playerdata, 6)},
      {"space-exploration.remote-view-pin-hotkey-six", Pin.make_hotkey_string(playerdata, 7)},
      {"space-exploration.remote-view-pin-hotkey-seven", Pin.make_hotkey_string(playerdata, 8)},
      {"space-exploration.remote-view-pin-hotkey-eight", Pin.make_hotkey_string(playerdata, 9)},
      {"space-exploration.remote-view-pin-hotkey-nine", Pin.make_hotkey_string(playerdata, 10)},
      {"space-exploration.remote-view-pin-hotkey-zero", Pin.make_hotkey_string(playerdata, 11)}
    },
    selected_index = 1 -- start with none selected
  }

  -- update location is only valid if the saved_pin we are updating has a valid location
  local saved_pin = playerdata.saved_pins[playerdata.quick_pin_opened_item_name]
  if saved_pin then
    local location = Location.from_reference(saved_pin.location_reference)
    if location and location.position and location.zone == Zone.from_surface(player.surface) then
      local selector_content_frame_table_location_label = selector_content_frame_table.add {
        type = "label",
        caption = {"space-exploration.remote-view-pin-location"}
      }

      local selector_content_frame_table_location_flow = selector_content_frame_table.add {
        type = "flow",
        direction = "horizontal",
        name = "selector_content_frame_table_location_flow"
      }
      selector_content_frame_table_location_flow.style.vertical_align = "center"
      local selector_content_frame_table_location_flow_button = selector_content_frame_table_location_flow.add {
        type = "button",
        name = Pin.name_button_update_position_pin,
        caption = {"space-exploration.remote-view-pin-location-position-button"},
        tooltip = {"space-exploration.remote-view-pin-location-position-button-tooltip"},
        mouse_button_filter = {"left"}
      }
      local selector_content_frame_table_location_flow_label = selector_content_frame_table_location_flow.add {
        type = "label",
        caption = {"space-exploration.remote-view-pin-location-position", string.format("%.0f", location.position.x), string.format("%.0f", location.position.y)},
        name = "selector_content_frame_table_location_flow_label"
      }
    end
  end

  -- Button bar
  local button_bar = selector_frame.add {
    type = "flow",
    direction = "horizontal",
    style = "dialog_buttons_horizontal_flow"
  }
  button_bar.style.horizontal_spacing = 0
  button_bar.drag_target = selector_frame

  -- Cancel/Back button
  local button_cancel = button_bar.add {
      type = "button",
      name = Pin.name_button_cancel_pin,
      style = "back_button",
      caption = {"gui-tag-edit.cancel"},
      mouse_button_filter = {"left"}
  }
  button_cancel.style.minimal_width = 0
  button_cancel.style.padding = {1, 12, 0, 12}

  local button_empty = button_bar.add {
      type = "empty-widget",
      style = "draggable_space",
      ignored_by_interaction = true
  }
  button_empty.style.horizontally_stretchable = "on"
  button_empty.style.left_margin = 10
  button_empty.style.right_margin = 10
  button_empty.style.height = 24

  -- Submit button
  local button_submit = button_bar.add {
      type = "button",
      name = Pin.name_button_confirm_pin,
      caption = {"gui-tag-edit.confirm"},
      tooltip = {"gui.confirm-instruction"},
      style = "confirm_button",
      mouse_button_filter = {"left"}
  }
  button_submit.style.minimal_width = 0
  button_submit.style.padding = {1, 8, 0, 12}

  -- if we are opening an existing pin to modify it, pre-populate the modal with the info for that pin
  if saved_pin then
    local location = Location.from_reference(saved_pin.location_reference)
    selector_content_frame_table_name_textfield.text = location.name or ""
    selector_content_frame_table_icon_selector.elem_value = saved_pin.signal
    selector_content_frame_table_zoom_flow_slider.slider_value = saved_pin.zoom or selector_content_frame_table_zoom_flow_slider.slider_value
    selector_content_frame_table_hotkey_dropdown.selected_index = 1
    for key, value in pairs(playerdata.saved_hotkeys) do
      if value == playerdata.quick_pin_opened_item_name then
        selector_content_frame_table_hotkey_dropdown.selected_index = key
      end
    end
  end
  selector_content_frame_table_zoom_flow_textfield.text = string.format("%.2f", selector_content_frame_table_zoom_flow_slider.slider_value)
end

--[[
Handles text changes to the zoom textfield.
]]--
function Pin.on_gui_text_changed(event)
  if event.element.name == "selector_content_frame_table_zoom_flow_textfield" then
    local player = game.players[event.player_index]
    local root = player.gui.screen[Pin.name_dialog_root]
    local zoom_slider = root.selector_content_flow.selector_content_frame.selector_content_frame_flow
                          .selector_content_frame_table.selector_content_frame_table_zoom_flow.selector_content_frame_table_zoom_flow_slider
    local zoom = tonumber(event.text)
    if zoom < Pin.min_zoom then
      zoom = Pin.min_zoom
    end
    if zoom > Pin.max_zoom then
      zoom = Pin.max_zoom
    end
    zoom_slider.slider_value = zoom
  end
end
Event.addListener(defines.events.on_gui_text_changed, Pin.on_gui_text_changed)

--[[
Handles value changes to the zoom slider.
]]--
function Pin.on_gui_value_changed(event)
  if event.element.name == "selector_content_frame_table_zoom_flow_slider" then
    local player = game.players[event.player_index]
    local root = player.gui.screen[Pin.name_dialog_root]
    local zoom_textfield = root.selector_content_flow.selector_content_frame.selector_content_frame_flow
                          .selector_content_frame_table.selector_content_frame_table_zoom_flow.selector_content_frame_table_zoom_flow_textfield
    local zoom = event.element.slider_value
    zoom_textfield.text = string.format("%.2f", zoom)
  end
end
Event.addListener(defines.events.on_gui_value_changed, Pin.on_gui_value_changed)

-- Maps the input event name to the index that we save that hotkey's pin at.
local hotkey_map = {}
-- 0 is the dropdown menu for no selection (we don't use this)
-- 1 is the dropdown menu for none hotkey (we use this)
hotkey_map[Pin.name_event_one]=2
hotkey_map[Pin.name_event_two]=3
hotkey_map[Pin.name_event_three]=4
hotkey_map[Pin.name_event_four]=5
hotkey_map[Pin.name_event_five]=6
hotkey_map[Pin.name_event_six]=7
hotkey_map[Pin.name_event_seven]=8
hotkey_map[Pin.name_event_eight]=9
hotkey_map[Pin.name_event_nine]=10
hotkey_map[Pin.name_event_zero]=11
hotkey_map[Pin.name_event_set_one]=2
hotkey_map[Pin.name_event_set_two]=3
hotkey_map[Pin.name_event_set_three]=4
hotkey_map[Pin.name_event_set_four]=5
hotkey_map[Pin.name_event_set_five]=6
hotkey_map[Pin.name_event_set_six]=7
hotkey_map[Pin.name_event_set_seven]=8
hotkey_map[Pin.name_event_set_eight]=9
hotkey_map[Pin.name_event_set_nine]=10
hotkey_map[Pin.name_event_set_zero]=11

--[[
Handles pin hotkey presses.
]]--
function Pin.on_pin_hotkey_press(event)
  local player_index = event.player_index
  if player_index and game.players[player_index] and game.players[player_index].connected then
    local player = game.players[player_index]
    local playerdata = Pin.get_make_pin_playerdata(player)
    local index = hotkey_map[event.input_name]
    if index then
      if playerdata.saved_hotkeys[index] then
        Pin.do_pin(player, playerdata.saved_hotkeys[index])
      end
    end
  end
end
Event.addListener(Pin.name_event_one, Pin.on_pin_hotkey_press)
Event.addListener(Pin.name_event_two, Pin.on_pin_hotkey_press)
Event.addListener(Pin.name_event_three, Pin.on_pin_hotkey_press)
Event.addListener(Pin.name_event_four, Pin.on_pin_hotkey_press)
Event.addListener(Pin.name_event_five, Pin.on_pin_hotkey_press)
Event.addListener(Pin.name_event_six, Pin.on_pin_hotkey_press)
Event.addListener(Pin.name_event_seven, Pin.on_pin_hotkey_press)
Event.addListener(Pin.name_event_eight, Pin.on_pin_hotkey_press)
Event.addListener(Pin.name_event_nine, Pin.on_pin_hotkey_press)
Event.addListener(Pin.name_event_zero, Pin.on_pin_hotkey_press)

--[[
Handles set hotkey presses.
]]
function Pin.on_set_hotkey_press(event)
  local player_index = event.player_index
  if player_index and game.players[player_index] and game.players[player_index].connected then
    local player = game.players[player_index]
    local playerdata = Pin.get_make_pin_playerdata(player)
    local index = hotkey_map[event.input_name]
    if index then
      local id = playerdata.saved_pins.id
      local item_name = "pin-button-prefix-" .. id
      playerdata.saved_pins.id = playerdata.saved_pins.id + 1
      playerdata.quick_pin_opened_item_name = item_name
      local zone = Zone.from_surface(player.surface)
      if zone then
        Pin.add_update_pin(player, nil, {
          type = "virtual",
          name = Zone.get_signal_name(zone)
        }, Pin.min_zoom, index, false)
      end
    end
  end
end
Event.addListener(Pin.name_event_set_one, Pin.on_set_hotkey_press)
Event.addListener(Pin.name_event_set_two, Pin.on_set_hotkey_press)
Event.addListener(Pin.name_event_set_three, Pin.on_set_hotkey_press)
Event.addListener(Pin.name_event_set_four, Pin.on_set_hotkey_press)
Event.addListener(Pin.name_event_set_five, Pin.on_set_hotkey_press)
Event.addListener(Pin.name_event_set_six, Pin.on_set_hotkey_press)
Event.addListener(Pin.name_event_set_seven, Pin.on_set_hotkey_press)
Event.addListener(Pin.name_event_set_eight, Pin.on_set_hotkey_press)
Event.addListener(Pin.name_event_set_nine, Pin.on_set_hotkey_press)
Event.addListener(Pin.name_event_set_zero, Pin.on_set_hotkey_press)

--[[
Removes any pins that have the given hotkey as long as they are not player-modified.
This allows for the pin-set-hotkeys that create new locations to overwrite each other
and not leave a bunch of permanent pins if used a bunch of times in a row without
the player explicitly indicating that they want to permanently keep the hotkey by
manually opening the modal and changing something in it.
]]--
function Pin.remove_unmodified_with_hotkey(playerdata, hotkey)
  if hotkey then
    for key, value in pairs(playerdata.saved_hotkeys) do
      if key == hotkey and value and playerdata.saved_pins[value] then
        if not playerdata.saved_pins[value].player_modified then
          playerdata.saved_pins[value] = nil
        end
      end
    end
  end
end

--[[
Updates the hotkey associated with a pin.
First clears the hotkey associated with the pin.
Then adds the new hotkey.
]]--
function Pin.set_hotkey(playerdata, item_name, hotkey)
  if hotkey then
    for key, value in pairs(playerdata.saved_hotkeys) do
      if value == item_name then
        playerdata.saved_hotkeys[key] = nil
      end
    end
    -- only save hotkey information for proper hotkeys (not unselected or none)
    if hotkey > 1 then
      playerdata.saved_hotkeys[hotkey] = item_name
    end
  end
end

--[[
Creates or updates a pin.
Always sets the pin's name and icon.
When creating an entirely new pin, the pin's position is set based on the player's current position in the navigation view.
Forces a GUI rebuild.
]]--
function Pin.add_update_pin(player, name, signal, zoom, hotkey, player_modified)
  local playerdata = Pin.get_make_pin_playerdata(player)
  playerdata.saved_pins[playerdata.quick_pin_opened_item_name] = playerdata.saved_pins[playerdata.quick_pin_opened_item_name] or {}
  local saved_pin = playerdata.saved_pins[playerdata.quick_pin_opened_item_name]
  saved_pin.signal = signal
  saved_pin.zoom = tonumber(string.format("%.2f", zoom))
  saved_pin.player_modified = player_modified

  if not saved_pin.location_reference then
    saved_pin.location_reference = Location.make_reference(Zone.from_surface(player.surface), player.position, name)
  else
    saved_pin.location_reference = Location.update_reference_name(saved_pin.location_reference, name)
  end

  Pin.remove_unmodified_with_hotkey(playerdata, hotkey)
  Pin.set_hotkey(playerdata, playerdata.quick_pin_opened_item_name, hotkey)
  Pin.gui_update(player)
end

--[[
Performs a pin.
Opens/moves the player's navigation view to the pin's position.
Only attempts to perform the pin if the target is valid.
]]--
function Pin.do_pin(player, item_name)
  if item_name then
    local playerdata = Pin.get_make_pin_playerdata(player)
    local saved_pin = playerdata.saved_pins[item_name]
    if saved_pin then
      local location = Location.from_reference(saved_pin.location_reference)
      if location then
        RemoteView.start(player, location.zone, location.position, location.name)
      end
      -- if playerdata.surface_positions then
      --   playerdata.surface_positions[player.surface.index] = player.position
      -- end
      player.close_map()
      if saved_pin.zoom then
        player.zoom = saved_pin.zoom
      end
    end
  end
end

--[[
Deletes a pin.
Forces a GUI rebuild.
]]--
function Pin.delete_pin(player, item_name)
  local playerdata = Pin.get_make_pin_playerdata(player)
  playerdata.saved_pins[item_name] = nil
  Pin.gui_update(player)
end

--[[
Handles click events for the pin buttons.
Four distinct events are tracked:
  left-click performs a pin
  right-click opens the modal for editing the pin
  shift-right-click resets the pin position to the current location
  ctrl-right-click deletes the pin
]]--
function Pin.on_gui_pin_button_click(player, event)
  local element = event.element
  if not element or not element.tags or not element.tags.item_name then
    return
  end
  local item_name = element.tags.item_name

  if event.button == defines.mouse_button_type.left then
    Pin.do_pin(player, item_name)
  elseif event.button == defines.mouse_button_type.right then
    if event.control then
      Pin.delete_pin(player, item_name)
    elseif event.shift then
      local add_or_update_pin_position_valid = Pin.add_or_update_pin_position_valid(player)
      -- don't allow the player to update the position of a pin when their current position isn't valid
      if add_or_update_pin_position_valid then
        local playerdata = Pin.get_make_pin_playerdata(player)
        local saved_pin = playerdata.saved_pins[item_name]
        saved_pin.location_reference = Location.update_reference_position(saved_pin.location_reference, Zone.from_surface(player.surface), player.position)
      end
    else
      Pin.modal_open(player, item_name)
    end
  end
end

--[[
Closes the window.
]]--
function Pin.window_close(player)
  if player.gui.screen[Pin.name_all_root] then
    player.gui.screen[Pin.name_all_root].destroy()
  end
end

--[[
Toggles the window.
]]--
function Pin.window_toggle(player)
  if player.gui.screen[Pin.name_all_root] then
    Pin.window_close(player)
  else
    Pin.window_open(player)
  end
end

--[[
Opens the window for viewing all pins.
]]--
function Pin.window_open(player)
  Pin.window_close(player)

  local playerdata = Pin.get_make_pin_playerdata(player)

  local viewer_frame = player.gui.screen.add {
    type = "frame",
    name = Pin.name_all_root,
    direction = "vertical"
  }
  viewer_frame.style.maximal_height = 1440
  viewer_frame.auto_center = true

  local viewer_title_table = viewer_frame.add {
    type = "table",
    column_count = 2,
    draw_horizontal_lines = false,
  }
  viewer_title_table.style.horizontally_stretchable = true
  viewer_title_table.style.column_alignments[1] = "left"
  viewer_title_table.style.column_alignments[2] = "right"

  local viewer_title_flow = viewer_title_table.add {
    type = "flow",
    direction = "horizontal"
  }
  viewer_title_flow.drag_target = viewer_frame
  viewer_title_flow.style.vertically_stretchable = false

  local viewer_title_label = viewer_title_flow.add {
    type = "label",
    caption = {"space-exploration.remote-view-pin-viewer-title"},
    style = "frame_title",
    ignored_by_interaction = true
  }
  viewer_title_label.style.vertically_stretchable = true
  viewer_title_label.style.horizontally_squashable = true

  local viewer_title_empty = viewer_title_flow.add {
    type = "empty-widget",
    style = "draggable_space",
    ignored_by_interaction = true
  }
  viewer_title_empty.style.horizontally_stretchable = true
  viewer_title_empty.style.left_margin = 4
  viewer_title_empty.style.right_margin = 0
  viewer_title_empty.style.height = 24

  local viewer_title_close = viewer_title_table.add {
    type="sprite-button",
    name=Pin.name_button_close,
    sprite = "utility/close_white",
    style="informatron_close_button",
    tooltip={"space-exploration.exit-pins-remote-view"}
  }
  viewer_title_close.style.width = 28
  viewer_title_close.style.height = 28

  local viewer_content_flow = viewer_frame.add {
    type = "scroll-pane",
    name = "viewer_content_flow",
    horizontal_scroll_policy = "never"
  }
  viewer_content_flow.style.height = 420
  viewer_content_flow.style.minimal_width = 400
  viewer_content_flow.style.padding = 0

  Pin.window_update(player)
end

--[[
Makes a row containing some pins for the window.
]]
function Pin.make_window_row(player, playerdata, viewer_content_frame_flow, pins, zone_name)
  local pin_row_label = viewer_content_frame_flow.add {
    type = "label",
    caption = zone_name
  } -- left
  pin_row_label.style.font_color = {
    r = 0.5,
    g = 0.5,
    b = 0.5
  }

  local pin_row_frame = viewer_content_frame_flow.add {
    type = "frame",
    style = "se_frame_deep_slots_small"
  }
  pin_row_frame.style.horizontally_stretchable = true

  local pin_row_table = pin_row_frame.add {
    type = "table",
    column_count = 10,
    style = "filter_slot_table"
  }
  pin_row_table.style.width = 400

  local add_or_update_pin_position_valid = Pin.add_or_update_pin_position_valid(player)

  for key, value in pairs(pins) do
    local sprite_path = Pin.signal_to_sprite_path(value.signal)
    local location = Location.from_reference(value.location_reference)
    if location then
      local name = location.name or ""
      local tooltip = {"", {Pin.get_tooltip_for_pin(playerdata, key), location.zone.name, name}}
      if settings.get_player_settings(player)[Pin.name_setting_expanded_tooltip].value == true then
        table.insert(tooltip, {"space-exploration.remote-view-pin-button-tooltip-help-text"})
        if add_or_update_pin_position_valid then
          table.insert(tooltip, {"space-exploration.remote-view-pin-button-tooltip-help-text-update-position"})
        end
      end
      local pin_button = pin_row_table.add {
        type = "sprite-button",
        sprite = sprite_path,
        tags = {
          action = Pin.tag_pin_button,
          item_name = key
        },
        style = "se_sprite-button_inset",
        tooltip = tooltip
      }
    end
  end
end

--[[
Updates the pins window in response to changes to the data.
Rebuilds the entire window UI.
]]
function Pin.window_update(player)
  local playerdata = Pin.get_make_pin_playerdata(player)
  local force_name = player.force.name

  -- clear the data-driven part of the GUI
  local root = player.gui.screen[Pin.name_all_root]
  if not root then
    return
  end

  local viewer_content_flow = root.viewer_content_flow
  viewer_content_flow.clear()

  local zone_to_count = {}
  local spaceships

  -- count how many pins are in each zone
  for key, value in pairs(playerdata.saved_pins) do
    if key ~= "id" then
      local location = Location.from_reference(value.location_reference)
      if location then
        local priority = Zone.get_priority(location.zone, force_name)
        local zone_name = location.zone.name
        -- track spaceship pins separately from normal pins
        if location.type == "spaceship" then
          if spaceships then
            spaceships.pins[key] = value
            if priority > spaceships.priority then
              spaceships.priority = priority
            end
          else
            local pins = {}
            pins[key] = value
            spaceships = {pins=pins,priority=priority}
          end
        -- normal pins here
        else
          if zone_to_count[zone_name] then
            zone_to_count[zone_name].count = zone_to_count[zone_name].count + 1
            zone_to_count[zone_name].pins[key] = value
            if priority > zone_to_count[zone_name].priority then
              zone_to_count[zone_name].priority = priority
            end
          else
            local pins = {}
            pins[key] = value
            zone_to_count[zone_name] = {count=1,pins=pins,priority=priority}
          end
        end
      end
    end
  end

  local roots_to_count = {}

  -- for any zone that has < 2 pins, reassign its pins to either its star's zone (if possible)
  for key, value in pairs(zone_to_count) do
    local look_for_parent = value.count < 2
    if value.pins then
      local zone = Zone.from_name(key)
      local priority = value.priority
      if look_for_parent and zone then
        zone = Zone.find_parent_star(zone) or zone
      end
      for key2, value2 in pairs(value.pins) do
        local zone_name
        if zone then
          zone_name = zone.name
        else
          zone_name = key
        end
        if roots_to_count[zone_name] then
          roots_to_count[zone_name].count = roots_to_count[zone_name].count + 1
          roots_to_count[zone_name].pins[key2] = value2
          if priority > roots_to_count[zone_name].priority then
            roots_to_count[zone_name].priority = priority
          end
        else
          local pins = {}
          pins[key2] = value2
          roots_to_count[zone_name] = {count=1,pins=pins,priority=priority}
        end
      end
    end
  end

  local finals_to_count = {}

  -- for any zone that *still* has < 2 pins, reassign its pins to the misc zone
  for key, value in pairs(roots_to_count) do
    local assign_to_misc = value.count < 2
    if value.pins then
      local zone_name = key
      local priority = value.priority
      if assign_to_misc then
        zone_name = {"space-exploration.remote-view-pin-viewer-misc-row"}
      end
      for key2, value2 in pairs(value.pins) do
        if finals_to_count[zone_name] then
          finals_to_count[zone_name].count = finals_to_count[zone_name].count + 1
          finals_to_count[zone_name].pins[key2] = value2
          if priority > finals_to_count[zone_name].priority then
            finals_to_count[zone_name].priority = priority
          end
        else
          local pins = {}
          pins[key2] = value2
          finals_to_count[zone_name] = {count=1,pins=pins,priority=priority}
        end
      end
    end
  end

  -- assign all spaceship pins to a special row
  if spaceships then
    finals_to_count[{"space-exploration.remote-view-pin-viewer-spaceship-row"}] = {pins=spaceships.pins,priority=spaceships.priority}
  end

  -- sort the rows by priority
  local rows_array = {}
  for key, value in pairs(finals_to_count) do
    table.insert(rows_array, {key=key,value=value})
  end
  table.sort(rows_array, function (a, b)
    return a.value.priority > b.value.priority
  end)
  for index, element in ipairs(rows_array) do
    Pin.make_window_row(player, playerdata, viewer_content_flow, element.value.pins, element.key)
  end
end

--[[
Toggles if the pins window is open/closed.
]]
function Pin.window_toggle(player)
  if player.gui.screen[Pin.name_all_root] then
    Pin.window_close(player)
  else
    Pin.window_open(player)
  end
end

--[[
Get/Make PlayerData relevant to Pin.
Ensures that the returned PlayerData has two tables so accessing them can be done without nil checks:
  saved_pins stores a mapping of pin-id to the details about that quick pin
  saved_hotkeys stores a mapping of hotkey-id to the pin-id that hotkey links to
]]--
function Pin.get_make_pin_playerdata(player)
  local playerdata = get_make_playerdata(player)
  playerdata.saved_pins = playerdata.saved_pins or {
    id = 0
  }
  playerdata.saved_hotkeys = playerdata.saved_hotkeys or {}
  return playerdata
end

return Pin

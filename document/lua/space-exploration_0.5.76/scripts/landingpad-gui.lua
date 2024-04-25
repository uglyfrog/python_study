local LandingpadGUI = {}

LandingpadGUI.name_rocket_landing_pad_gui_root = mod_prefix .. "rocket-landing-pad-gui"

--- Create the landing pad gui for a player
---@param player LuaPlayer
---@param landing_pad Landingpad landing pad data
function LandingpadGUI.gui_open(player, landing_pad)
  LandingpadGUI.gui_close(player)
  if not landing_pad then Log.trace('LandingpadGUI.gui_open landing_pad not found') return end

  local gui = player.gui.relative
  local anchor = {gui=defines.relative_gui_type.container_gui, position=defines.relative_gui_position.left}
  local container = gui.add {
    type = "frame",
    name = LandingpadGUI.name_rocket_landing_pad_gui_root,
    style = "space_platform_container",
    direction = "vertical",
    anchor = anchor,
    -- use gui element tags to store a reference to what landing pad this gui is displaying/controls
    tags = {
      unit_number = landing_pad.unit_number
    }
  }

  local title_flow = container.add{type = "flow", "landingpad-title-flow", direction = "horizontal"}
  title_flow.add{type = "label", name = "landingpad-title-label", style = "frame_title", caption = {"space-exploration.relative-window-settings"}, ignored_by_interaction = true}
  local title_empty = title_flow.add {
    type = "empty-widget",
    style = "draggable_space",
    ignored_by_interaction = true
  }
  title_empty.style.horizontally_stretchable = "on"
  title_empty.style.left_margin = 4
  title_empty.style.right_margin = 0
  title_empty.style.height = 24

  local name_flow = container.add {
    type = "flow",
    name = "name-flow",
    direction = "vertical"
  }
  LandingpadGUI.make_change_name_button_flow(landing_pad, name_flow)

  container.add {type = "label", name = "cargo_capacity", caption = {"space-exploration.label_cargo", ""}}
  local bar = container.add {
    type = "progressbar",
    name = "cargo_capacity_progress",
    size = 300,
    value = 0,
    style = "space_platform_progressbar_cargo"
  }
  bar.style.horizontally_stretchable = true

  container.add {type = "label", name = "status", caption = {"space-exploration.label_status", ""}}

  LandingpadGUI.gui_update(player)
end

function LandingpadGUI.gui_update(player)
  local root = player.gui.relative[LandingpadGUI.name_rocket_landing_pad_gui_root]
  if root then
    local struct = Landingpad.from_unit_number(
      root and root.tags and root.tags.unit_number)
    if struct then
      if not (struct.container and struct.container.valid) then
        Landingpad.destroy(struct)
      else
        local inv = struct.container.get_inventory(defines.inventory.chest)
        local inv_used = count_inventory_slots_used(inv)

        root["cargo_capacity"].caption = {"space-exploration.label_cargo", {"space-exploration.simple-a-b-divide", math.min(inv_used, #inv), #inv}}
        root["cargo_capacity_progress"].value = math.min(inv_used, #inv) / #inv
        local message = ""
        if inv_used > 0 then
          message = {"space-exploration.landingpad_unloading_required"}
        else
          message = {"space-exploration.landingpad_ready"}
        end
        if struct.inbound_rocket then
          message = {"space-exploration.landingpad_rocket_inboud"}
        end
        root["status"].caption = {"space-exploration.label_status", message}
      end
    end
  end
end

function LandingpadGUI.make_change_name_button_flow(struct, name_flow)
  name_flow.clear()
  local name_horizontal_flow = name_flow.add{type="flow",direction="horizontal"}
  local name_label = name_horizontal_flow.add {
    type = "label",
    name = "show-name",
    caption = struct.name,
    style = "space_platform_title_short"
  }
  local rename_button = name_horizontal_flow.add {
    type = "sprite-button",
    name = "rename",
    sprite = "utility/rename_icon_normal",
    tooltip = {
      "space-exploration.rename-something", {"entity-name." .. Landingpad.name_rocket_landing_pad}
    },
    style = "space_platform_sprite_button_small"
  }
  local list, selected_index, values = Landingpad.dropdown_list_force_landing_pad_names(struct.force_name, struct.name)
   -- there is a default value at the start of the list, we don't want it here since landing pads always have a valid name
  table.remove(list, 1)
  table.remove(values, 1)
  local landingpads_dropdown = name_flow.add{ type="drop-down", name="change_name_dropdown", items=values, selected_index=selected_index-1}
end

function LandingpadGUI.make_change_name_confirm_flow(struct, name_flow)
  name_flow.clear()
  local name_horizontal_flow = name_flow.add{type="flow",direction="horizontal"}
  local name_label = name_horizontal_flow.add {
    type = "textfield",
    name = "write-name",
    text = struct.name,
    style = "space_platform_textfield_short"
  }
  name_label.select_all()
  name_label.focus()
  local rename_button = name_horizontal_flow.add {
    type = "sprite-button",
    name = "rename-confirm",
    sprite = "utility/enter",
    tooltip = {
      "space-exploration.rename-something", {"entity-name." .. Landingpad.name_rocket_landing_pad}
    },
    style = "space_platform_sprite_button_small"
  }
end

function LandingpadGUI.gui_selection_state_changed(event)
  if not (event.element and event.element.valid and event.element.name == "change_name_dropdown") then return end
  local element = event.element
  local root = gui_element_or_parent(element,
                               LandingpadGUI.name_rocket_landing_pad_gui_root)
  if not root then return end
  local struct = Landingpad.from_unit_number(root and root.tags and root.tags.unit_number)
  if not struct then return end

  local name_text = struct.name
  local new_name_text = element.get_item(element.selected_index)
  if new_name_text ~= "" and new_name_text ~= name_text then
    --do change name stuff
    Landingpad.rename(struct, new_name_text)
  end

  -- gui rebuild
  local player = game.players[event.player_index]
  LandingpadGUI.make_change_name_button_flow(struct, element.parent)
end
Event.addListener(defines.events.on_gui_selection_state_changed, LandingpadGUI.gui_selection_state_changed)

function LandingpadGUI.on_gui_click(event)
  if not (event.element and event.element.valid) then return end
  local element = event.element
  local player = game.players[event.player_index]
  local root = gui_element_or_parent(element,
                               LandingpadGUI.name_rocket_landing_pad_gui_root)
  if not root then return end
  local struct = Landingpad.from_unit_number(root and root.tags and root.tags.unit_number)
  if not struct then return end

  if element.name == "rename" then
    local name_flow = element.parent.parent
    LandingpadGUI.make_change_name_confirm_flow(struct, name_flow)
  elseif element.name == "rename-confirm" then -- don't confirm by clicking the textbox
    local name_flow = element.parent.parent
    local new_name = string.trim(element.parent["write-name"].text)
    if new_name ~= "" and new_name ~= struct.name then
      -- do change name stuff
      Landingpad.rename(struct, new_name)
    end
    LandingpadGUI.make_change_name_button_flow(struct, name_flow)
  end
end
Event.addListener(defines.events.on_gui_click, LandingpadGUI.on_gui_click)
Event.addListener(defines.events.on_gui_confirmed, LandingpadGUI.on_gui_click)

function LandingpadGUI.on_tick(struct)
  if game.tick % 60 == 0 then
    for _, player in pairs(game.connected_players) do
      LandingpadGUI.gui_update(player)
    end
  end
end
Event.addListener(defines.events.on_tick, LandingpadGUI.on_tick)

--- Close the landing pad gui for a player
---@param player any
function LandingpadGUI.gui_close(player)
  if player.gui.relative[LandingpadGUI.name_rocket_landing_pad_gui_root] then
    player.gui.relative[LandingpadGUI.name_rocket_landing_pad_gui_root].destroy()
  end
end

--- Respond to the main entity GUI being closed by destroying the relative GUI
---@param event any
function LandingpadGUI.on_gui_closed(event)
  local player = game.players[event.player_index]
  if player and event.entity and event.entity.name == Landingpad.name_rocket_landing_pad then
    LandingpadGUI.gui_close(player)
  end
end
Event.addListener(defines.events.on_gui_closed, LandingpadGUI.on_gui_closed)

--- Opens the landing pad gui when a landing pad is clicked
--- Closes the landing pad gui when another gui is opened
---@param event any
function LandingpadGUI.on_gui_opened(event)
  local player = game.players[event.player_index]
  if event.entity and event.entity.valid and event.entity.name == Landingpad.name_rocket_landing_pad then
    LandingpadGUI.gui_open(player, Landingpad.from_entity(event.entity))
  else
    LandingpadGUI.gui_close(player)
  end
end
Event.addListener(defines.events.on_gui_opened, LandingpadGUI.on_gui_opened)

return LandingpadGUI

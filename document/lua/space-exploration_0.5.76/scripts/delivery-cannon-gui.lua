local DeliveryCannonGUI = {}

DeliveryCannonGUI.name_delivery_cannon_gui_root = mod_prefix.."delivery-cannon"

--- Create the delivery cannon gui for a player
---@param player any
---@param delivery_cannon any
function DeliveryCannonGUI.gui_open(player, delivery_cannon)
  DeliveryCannonGUI.gui_close(player)
  if not delivery_cannon then Log.trace('DeliveryCannonGUI.gui_open delivery_cannon not found') return end

  local gui = player.gui.relative
  local playerdata = get_make_playerdata(player)

  local anchor = {gui=defines.relative_gui_type.assembling_machine_gui, position=defines.relative_gui_position.right}
  local container = gui.add{
    type = "frame",
    name = DeliveryCannonGUI.name_delivery_cannon_gui_root,
    style="space_platform_container",
    direction="vertical",
    anchor = anchor,
    -- use gui element tags to store a reference to what delivery cannon this gui is displaying/controls
    tags = {
      unit_number = delivery_cannon.unit_number
    }
  }
  container.style.vertically_stretchable = "stretch_and_expand"

  local title_flow = container.add{type = "flow", "cannon-title-flow", direction = "horizontal"}
  title_flow.add{type = "label", name = "cannon-title-label", style = "frame_title", caption = {"space-exploration.relative-window-settings"}, ignored_by_interaction = true}
  local title_empty = title_flow.add {
    type = "empty-widget",
    style = "draggable_space",
    ignored_by_interaction = true
  }
  title_empty.style.horizontally_stretchable = "on"
  title_empty.style.left_margin = 4
  title_empty.style.right_margin = 0
  title_empty.style.height = 24
  local title_informatron = title_flow.add {
    type="sprite-button",
    name="goto_informatron_delivery_cannons",
    sprite = "virtual-signal/informatron",
    style="informatron_close_button",
    tooltip={"space-exploration.informatron-open-help"}
  }
  title_informatron.style.width = 28
  title_informatron.style.height = 28

  local bar

  container.add{ type="label", name="energy", caption="Energy: "}
  bar = container.add{ type="progressbar", name="energy_progress", size = 300, value=0, style="space_platform_progressbar_capsule"}
  bar.style.horizontally_stretchable  = true

  container.add{ type="label", name="payload", caption="Payload: "}

  local active_container = container.add{ type="flow", name="active_container", direction="horizontal"}
  active_container.style.vertical_align = "center"

  local switch = active_container.add{type="switch", name="off_switch", left_label_caption={"space-exploration.off"}, right_label_caption={"space-exploration.on"}, switch_state = delivery_cannon.is_off and "left" or "right"}

  container.add{ type="line", name="line"}

  container.add{ type="label", name="destination-label", caption="Destination:"}
  container.add{type="checkbox", name="list-zones-alphabetical", caption={"space-exploration.list-destinations-alphabetically"}, state=playerdata.zones_alphabetical and true or false}

  local filter_container = container.add{ type="flow", name="filter_flow", direction="horizontal"}
  local filter_field = filter_container.add{ type="textfield", name="filter_list"}
  filter_field.style.width = 275
  local filter_button = filter_container.add{ type = "sprite-button", name="clear_filter", sprite="utility/search_icon",
    tooltip={"space-exploration.clear-filter"},}
  filter_button.style.left_margin = 5
  filter_button.style.width = 28
  filter_button.style.height = 28

  local destination_zone = delivery_cannon.destination.zone

  local list, selected_index, values
  if delivery_cannon.zone.type == "anomaly" or (delivery_cannon.zone.space_distortion and delivery_cannon.zone.space_distortion > 0) then -- only target none or self
    list = {"None",  Zone.dropdown_name_from_zone(delivery_cannon.zone)}
    values = { {type = "none"}, {type = delivery_cannon.zone.type == "spaceship" and "spaceship" or "zone", index = delivery_cannon.zone.index}}
    selected_index = destination_zone and 2 or 1
  else
    local star = Zone.find_parent_star(delivery_cannon.zone) or Zone.find_nearest_star(delivery_cannon.zone.stellar_position)
    list, selected_index, values = Zone.dropdown_list_zone_destinations(
      delivery_cannon.force_name,
      destination_zone,
      playerdata.zones_alphabetical,
      nil,
      {list = "None", value = {type = "none"}}, -- wildcard
      star
    )
    if selected_index == 1 then selected_index = 2 end
  end
  local zones_dropdown = container.add{ type="drop-down", name="delivery-cannon-list-zones", items=list, selected_index=selected_index or 2}
  zones_dropdown.style.horizontally_stretchable  = true
  player_set_dropdown_values(player, "delivery-cannon-list-zones", values)

  container.add{ type="label", name="destination-location-label", caption={"space-exploration.label_destination_position", ""}}

  local destination_location_table = container.add{type="table", name="destination_location_table", column_count=3, draw_horizontal_lines=false}
  destination_location_table.style.horizontally_stretchable = true
  destination_location_table.style.column_alignments[1] = "left" -- title, search, zone list table
  destination_location_table.style.column_alignments[2] = "right" -- starmap, close, selected zone info

  destination_location_table.add{ type="sprite-button", name="destination_location_button",
    sprite="item/artillery-targeting-remote", tooltip = {"space-exploration.choose_coordinates"}}
  destination_location_table.destination_location_button.style.right_margin = 10
  destination_location_table.add{ type="label", name="destination_location_coordinates", caption=""}
  destination_location_table.style.bottom_margin = 10

  if delivery_cannon.variant == "weapon" then
    local auto_switch = container.add{type="switch", name="auto_switch", left_label_caption={"space-exploration.wdc_auto_off"}, right_label_caption={"space-exploration.wdc_auto_on"}, switch_state = delivery_cannon.auto_select_targets and "right" or "left"}
  end

  if settings.get_player_settings(player)["se-show-zone-preview"].value then
    container.add{ type="label", name="destination-location-preview-label", caption={"space-exploration.destination_preview"}}
    local preview_frame = container.add{type="frame", name="destination-location-preview-frame", style="informatron_inside_deep_frame"}
    preview_frame.style.horizontally_stretchable = true
    preview_frame.style.vertically_stretchable = true
    preview_frame.style.top_margin = 10
    preview_frame.style.minimal_height = 200
  end
  DeliveryCannonGUI.gui_update(player)
end

function DeliveryCannonGUI.preview_frame_update(preview_frame, delivery_cannon)
  local valid_location = false
  local surface = nil
  if DeliveryCannon.has_destination(delivery_cannon) then
    surface = Zone.get_surface(delivery_cannon.destination.zone)
    if surface then
      valid_location = true
    end
  end
  preview_frame.clear()
  if valid_location then
    local camera = preview_frame.add{type="camera", name="preview_camera", position=delivery_cannon.destination.coordinate, zoom=0.5, surface_index=surface.index}
    camera.style.vertically_stretchable = true
    camera.style.horizontally_stretchable = true
  end
end

function DeliveryCannonGUI.gui_update(player)
  local root = player.gui.relative[DeliveryCannonGUI.name_delivery_cannon_gui_root]
  if (root and root.tags) then
    local delivery_cannon = DeliveryCannon.from_unit_number(root.tags.unit_number)
    if delivery_cannon then
      local valid = DeliveryCannon.is_valid(delivery_cannon)
      if valid then
        local format_energy = function(energy)
          return string.format("%.2f",energy/1000000) .. "MJ"
        end
        if root["energy"] then
          root["energy"].caption={
            "space-exploration.delivery_cannon_label_energy",
            format_energy(delivery_cannon.energy_interface.energy) .. " / " .. (delivery_cannon.required_energy and format_energy(delivery_cannon.required_energy) or "?")
          }
          root["energy_progress"].value = delivery_cannon.required_energy and ((delivery_cannon.energy or 0) / delivery_cannon.required_energy) or 0
        end

        if root["payload"] then
          root["payload"].caption={
            "space-exploration.delivery_cannon_label_payload",
            delivery_cannon.payload_name and (game.item_prototypes[delivery_cannon.payload_name].localised_name) or {"space-exploration.empty"}
          }
        end

        if root.destination_location_table and root.destination_location_table.destination_location_coordinates then
          local coordinate = DeliveryCannon.get_coordinate(delivery_cannon)
          if coordinate then
            root.destination_location_table.destination_location_coordinates.caption = {"space-exploration.delivery-cannon-valid-coordinates", coordinate.x, coordinate.y}
          else
            root.destination_location_table.destination_location_coordinates.caption = {"space-exploration.delivery-cannon-invalid-coordinates"}
          end
        end

        if root["auto_switch"] then
          root["auto_switch"].switch_state = delivery_cannon.auto_select_targets and "right" or "left"
        end

        if root["off_switch"] then
          root["off_switch"].switch_state = delivery_cannon.is_off and "left" or "right"
        end

        if root["destination-location-preview-frame"] then
          DeliveryCannonGUI.preview_frame_update(root["destination-location-preview-frame"], delivery_cannon)
        end
      end
    end
  end
end

function DeliveryCannonGUI.gui_update_destinations_list(player)
  local playerdata = get_make_playerdata(player)
  local root = player.gui.relative[DeliveryCannonGUI.name_delivery_cannon_gui_root]
  if root and root.tags then
    local delivery_cannon = DeliveryCannon.from_unit_number(root.tags.unit_number)
    if not delivery_cannon then return end

    local filter = nil
    if root.filter_flow and root.filter_flow.filter_list then
      filter = string.trim(root.filter_flow.filter_list.text)
      if filter == "" then
        filter = nil
      end
    end

    -- update the list
    local destination_zone = delivery_cannon.destination.zone

    if delivery_cannon.zone.type == "anomaly" or (delivery_cannon.zone.space_distortion and delivery_cannon.zone.space_distortion > 0) then -- only target none or self
      list = {"None",  Zone.dropdown_name_from_zone(delivery_cannon.zone)}
      values = { {type = "none"}, {type = delivery_cannon.zone.type == "spaceship" and "spaceship" or "zone", index = delivery_cannon.zone.index}}
      selected_index = destination_zone and 2 or 1
    else
      local star = Zone.find_parent_star(delivery_cannon.zone) or Zone.find_nearest_star(delivery_cannon.zone.stellar_position)
      list, selected_index, values = Zone.dropdown_list_zone_destinations(
        delivery_cannon.force_name,
        destination_zone,
        playerdata.zones_alphabetical,
        filter,
        {list = "None", value = {type = "none"}}, -- wildcard
        star
      )
      if selected_index == 1 then selected_index = 2 end
    end
    root["delivery-cannon-list-zones"].items = list
    root["delivery-cannon-list-zones"].selected_index = selected_index or 2
    player_set_dropdown_values(player, "delivery-cannon-list-zones", values)
  end
end

function DeliveryCannonGUI.on_gui_click(event)
  if not (event.element and event.element.valid) then return end
  local element = event.element
  local player = game.players[event.player_index]
  local root = gui_element_or_parent(element, DeliveryCannonGUI.name_delivery_cannon_gui_root)
  if not (root and root.tags) then return end
  local delivery_cannon = DeliveryCannon.from_unit_number(root.tags.unit_number)
  if not delivery_cannon then return end
  if element.name == "delivery-cannon-list-zones" then

    local value = player_get_dropdown_value(player, element.name, element.selected_index)
    if type(value) == "table" then
      if value.type == "zone" then
        local zone_index = value.index
        local zone = Zone.from_zone_index(zone_index)
        if zone then
          if delivery_cannon.destination.zone ~= zone then
            delivery_cannon.destination.zone = zone
            delivery_cannon.destination.coordinate = nil
          end
          delivery_cannon.required_energy = DeliveryCannon.variants[delivery_cannon.variant].energy_per_delta_v * DeliveryCannon.get_delta_v(delivery_cannon.zone, delivery_cannon.destination.zone)
          Log.trace("set destination to location: " .. zone.name )
        else
          delivery_cannon.destination.zone = nil
          delivery_cannon.required_energy = nil
        end
      else
        delivery_cannon.destination.zone = nil
        delivery_cannon.required_energy = nil
      end
      DeliveryCannonGUI.gui_update(player)
    else
      DeliveryCannonGUI.gui_close(player)
      Log.trace("Error: Non-table value ")
    end
  elseif element.name == "clear_filter" then
    element.parent.filter_list.text = ""
    DeliveryCannonGUI.gui_update_destinations_list(player)
  elseif element.name == "destination_location_button" then
    local playerdata = get_make_playerdata(player)
    local player_zone = Zone.from_surface(player.surface)
    -- if the player is not already in nav mode, put them in nav mode on their current surface to make the history nice
    RemoteView.start(player)
    RemoteView.start(player, delivery_cannon.destination.zone)
    -- only change the player's position to that of the delivery cannon if its on a different surface
    -- this lets the player keep updating the position of the delivery cannon as long as they stay in nav
    -- view on the targeted surface
    if delivery_cannon.destination.coordinate and (not player.character) and player_zone ~= delivery_cannon.destination.zone then
      player.teleport(DeliveryCannon.get_coordinate(delivery_cannon))
    end
    playerdata.remote_view_activity = {
      type = DeliveryCannon.name_target_activity_type,
      delivery_cannon = delivery_cannon
    }
    player.cursor_stack.set_stack({name = DeliveryCannon.name_delivery_cannon_targeter, count = 1})
    player.opened = nil
    RemoteView.gui_make_entity_back_button (player, delivery_cannon.main)
  elseif element.name == "goto_informatron_delivery_cannons" then
    remote.call("informatron", "informatron_open_to_page", {
      player_index = event.player_index,
      interface = "space-exploration",
      page_name = "delivery_cannons"
    })
  end
end
Event.addListener(defines.events.on_gui_click, DeliveryCannonGUI.on_gui_click)
Event.addListener(defines.events.on_gui_selection_state_changed, DeliveryCannonGUI.on_gui_click)

function DeliveryCannonGUI.on_gui_switch_state_changed(event)
  if not (event.element and event.element.valid) then return end
  local element = event.element
  local player = game.players[event.player_index]
  local root = gui_element_or_parent(element, DeliveryCannonGUI.name_delivery_cannon_gui_root)
  if not (root and root.tags) then return end
  local delivery_cannon = DeliveryCannon.from_unit_number(root.tags.unit_number)
  if not delivery_cannon then return end
  if element.name == "off_switch" then
    delivery_cannon.is_off = element.switch_state == "left"
  elseif element.name == "auto_switch" then
    delivery_cannon.auto_select_targets = element.switch_state == "right"
  end
end
Event.addListener(defines.events.on_gui_switch_state_changed, DeliveryCannonGUI.on_gui_switch_state_changed)

function DeliveryCannonGUI.on_gui_checked_state_changed(event)
  if not (event.element and event.element.valid) then return end
  local element = event.element
  local player = game.players[event.player_index]
  local root = gui_element_or_parent(element, DeliveryCannonGUI.name_delivery_cannon_gui_root)
  if not (root and root.tags) then return end
  local delivery_cannon = DeliveryCannon.from_unit_number(root.tags.unit_number)
  if not delivery_cannon then return end
  if element.name == "list-zones-alphabetical" then
    local playerdata = get_make_playerdata(player)
    playerdata.zones_alphabetical = element.state
    DeliveryCannonGUI.gui_update_destinations_list(player)
  end
end
Event.addListener(defines.events.on_gui_checked_state_changed, DeliveryCannonGUI.on_gui_checked_state_changed)

function DeliveryCannonGUI.on_gui_text_changed(event)
  if not (event.element and event.element.valid) then return end
  local element = event.element
  local player = game.players[event.player_index]
  local root = gui_element_or_parent(element, DeliveryCannonGUI.name_delivery_cannon_gui_root)
  if root then -- remote view
    if element.name == "filter_list" then
      DeliveryCannonGUI.gui_update_destinations_list(player)
    end
  end
end
Event.addListener(defines.events.on_gui_text_changed, DeliveryCannonGUI.on_gui_text_changed)

--- Close the delivery cannon gui for a player
---@param player any
function DeliveryCannonGUI.gui_close (player)
  if player.gui.relative[DeliveryCannonGUI.name_delivery_cannon_gui_root] then
    player.gui.relative[DeliveryCannonGUI.name_delivery_cannon_gui_root].destroy()
  end
end

--- Respond to the main entity GUI being closed by destroying the relative GUI
---@param event any
function DeliveryCannonGUI.on_gui_closed(event)
  local player = game.players[event.player_index]
  if player and event.entity and (event.entity.name == DeliveryCannon.variants["logistic"].name or event.entity.name == DeliveryCannon.variants["weapon"].name) then
    DeliveryCannonGUI.gui_close(player)
  end
end
Event.addListener(defines.events.on_gui_closed, DeliveryCannonGUI.on_gui_closed)

--- Opens the delivery cannon gui when a delivery cannon is clicked
--- Closes the delivery cannon gui when another gui is opened
---@param event any
function DeliveryCannonGUI.on_gui_opened(event)
  local player = game.players[event.player_index]
  if event.entity and event.entity.valid and
  (event.entity.name == DeliveryCannon.variants["logistic"].name or event.entity.name == DeliveryCannon.variants["weapon"].name) then
    if RemoteView.is_unlocked(player) then
      DeliveryCannonGUI.gui_open(player, DeliveryCannon.from_entity(event.entity))
    else
      player.print({"space-exploration.remote-view-requires-satellite"})
    end
  else
    DeliveryCannonGUI.gui_close(player)
  end
end
Event.addListener(defines.events.on_gui_opened, DeliveryCannonGUI.on_gui_opened)


return DeliveryCannonGUI

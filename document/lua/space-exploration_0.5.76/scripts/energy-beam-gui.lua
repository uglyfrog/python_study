local EnergyBeamGUI = {}

EnergyBeamGUI.name_transmitter_gui_root = "energy_transmitter"
EnergyBeamGUI.dropdown_options = {
  {caption={"space-exploration.energy_transmitter_label_off"},tooltip={"space-exploration.energy_transmitter_tooltip_off"}},
  {caption={"space-exploration.energy_transmitter_label_energise"},tooltip={"space-exploration.energy_transmitter_tooltip_energise"}},
  {caption={"space-exploration.energy_transmitter_label_glaive"},tooltip={"space-exploration.energy_transmitter_tooltip_glaive"}},
  {caption={"space-exploration.energy_transmitter_label_auto_glaive"},tooltip={"space-exploration.energy_transmitter_tooltip_auto_glaive"}}
}
EnergyBeamGUI.dropdown_idxs = {
  "off",
  "energise",
  "glaive",
  "auto-glaive"
}

--- Creates the energy beamer gui for a player
---@param player any
---@param tree any
function EnergyBeamGUI.gui_open(player, tree)
  EnergyBeamGUI.gui_close(player)
  if not tree then
    Log.trace('EnergyBeamGUI.gui_open tree not found')
    return
  end

  local gui = player.gui.relative
  local playerdata = get_make_playerdata(player)

  local anchor = {gui=defines.relative_gui_type.assembling_machine_gui, position=defines.relative_gui_position.right}
  local container = gui.add{
    type = "frame",
    name = EnergyBeamGUI.name_transmitter_gui_root,
    direction="vertical",
    anchor = anchor,
    -- use gui element tags to store a reference to what energy beam transmitter thhis gui is displaying/controls
    tags = {
      unit_number = tree.unit_number
    }
  }
  container.style.vertically_stretchable = "stretch_and_expand"

  local title_flow = container.add{type = "flow", "energy-beam-title-flow", direction = "horizontal"}
  title_flow.add{type = "label", name = "energy-beam-title-label", style = "frame_title", caption = {"space-exploration.relative-window-settings"}, ignored_by_interaction = true}
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
    name="goto_informatron_energy_beams",
    sprite = "virtual-signal/informatron",
    style="informatron_close_button",
    tooltip={"space-exploration.informatron-open-help"}
  }
  title_informatron.style.width = 28
  title_informatron.style.height = 28

  container.add{ type="label", name="energy", caption={"space-exploration.label_energy", ""}}
  container.add{ type="label", name="efficiency", caption={"space-exploration.label_efficiency", ""}}

  local active_container = container.add{ type="flow", name="active_container", direction="horizontal"}
  active_container.style.vertical_align = "center"

  local dropdown_tooltip_merged = {}
  for _, option in pairs(EnergyBeamGUI.dropdown_options) do
    local option_tooltip = {"space-exploration.simple-a-b-space", {"space-exploration.simple-bold", option.caption}, option.tooltip}
    if #dropdown_tooltip_merged == 0 then
      dropdown_tooltip_merged = option_tooltip
    else
      dropdown_tooltip_merged = {"space-exploration.simple-a-b-break", dropdown_tooltip_merged, option_tooltip}
    end
  end

  local dropdown = active_container.add{
    type = "drop-down",
    tooltip=dropdown_tooltip_merged,
    name = EnergyBeamGUI.name_transmitter_gui_root.."_dropdown",
    items = {
      {"space-exploration.energy_transmitter_label_off"},
      {"space-exploration.energy_transmitter_label_energise"},
      {"space-exploration.energy_transmitter_label_glaive"},
      {"space-exploration.energy_transmitter_label_auto_glaive"}
    },
    selected_index = 1 -- start with off selected
  }

  container.add{ type="line", name="line"}

  container.add{ type="label", name="destination-label", caption={"space-exploration.label_destination", ""}}
  container.add{type="checkbox", name="list-zones-alphabetical", caption={"space-exploration.list-destinations-alphabetically"}, state=playerdata.zones_alphabetical and true or false}

  local filter_container = container.add{ type="flow", name="filter_flow", direction="horizontal"}
  local filter_field = filter_container.add{ type="textfield", name="filter_list"}
  filter_field.style.width = 275
  local filter_button = filter_container.add{ type = "sprite-button", name="clear_filter", sprite="utility/search_icon",
    tooltip={"space-exploration.clear-filter"},}
  filter_button.style.left_margin = 5
  filter_button.style.width = 28
  filter_button.style.height = 28

  local destination_zone = tree.destination and tree.destination.zone

  local list, selected_index, values = Zone.dropdown_list_zone_destinations(
    tree.force_name,
    destination_zone,
    playerdata.zones_alphabetical,
    nil,
    {list = "None", value = {type = "none"}} -- wildcard
  )
  if selected_index == 1 then selected_index = 2 end
  local zones_dropdown = container.add{ type="drop-down", name="energy-transmitter-list-zones", items=list, selected_index=selected_index or 2}
  zones_dropdown.style.horizontally_stretchable  = true
  player_set_dropdown_values(player, "energy-transmitter-list-zones", values)

  container.add{ type="label", name="destination-location-label", caption={"space-exploration.label_destination_position", ""}}

  local destination_location_table = container.add{type="table", name="destination_location_table", column_count=2, draw_horizontal_lines=false}
  destination_location_table.style.horizontally_stretchable = true
  destination_location_table.style.column_alignments[1] = "left" -- title, search, zone list table
  destination_location_table.style.column_alignments[2] = "right" -- starmap, close, selected zone info

  destination_location_table.add{ type="sprite-button", name="destination_location_button",
    sprite="item/artillery-targeting-remote", tooltip = {"space-exploration.choose_coordinates"}}
  destination_location_table.destination_location_button.style.right_margin = 10
  destination_location_table.add{ type="label", name="destination_location_coordinates", caption=""}

  if settings.get_player_settings(player)["se-show-zone-preview"].value then
    container.add{ type="label", name="destination-location-preview-label", caption={"space-exploration.destination_preview"}}
    local preview_frame = container.add{type="frame", name="destination-location-preview-frame", style="informatron_inside_deep_frame"}
    preview_frame.style.horizontally_stretchable = true
    preview_frame.style.vertically_stretchable = true
    preview_frame.style.top_margin = 10
    preview_frame.style.minimal_height = 200
  end

  EnergyBeamGUI.gui_update(player)
end

function EnergyBeamGUI.preview_frame_update(preview_frame, tree)
  local valid_location = false
  local surface = nil
  if EnergyBeam.has_destination(tree) then
    surface = Zone.get_surface(tree.destination.zone)
    if surface then
      valid_location = true
    end
  end
  preview_frame.clear()
  if valid_location then
    local camera
    if tree.glaive_beam and tree.glaive_beam.valid then
      camera = preview_frame.add{type="camera", name="preview_camera", position=tree.destination.coordinate, zoom=0.5, surface_index=surface.index}
      camera.entity = tree.glaive_beam
    else
      camera = preview_frame.add{type="camera", name="preview_camera", position=tree.destination.coordinate, zoom=0.5, surface_index=surface.index}
    end
    camera.style.vertically_stretchable = true
    camera.style.horizontally_stretchable = true
  end
end

function EnergyBeamGUI.gui_update(player)
  local root = player.gui.relative[EnergyBeamGUI.name_transmitter_gui_root]
  if root and root.tags and root.tags.unit_number then
    local tree = EnergyBeam.from_unit_number(root.tags.unit_number)
    if tree then
      local transfer_per_tick = (tree.last_temperature or 0) / EnergyBeam.transfer_interval
      local energy_per_tick = transfer_per_tick * EnergyBeam.specific_heat
      local format_energy = function(energy)
        return string.format("%.2f",energy*60/1000000000) .. "GW"
      end
      if root["energy"] then
        root["energy"].caption={
          "space-exploration.energy_transmitter_label_transfer",
          format_energy(energy_per_tick)
        }
      end
      if root["efficiency"] then
        if Zone.is_solid(tree.zone) then
          root["efficiency"].caption={
            "space-exploration.energy_transmitter_label_efficiency_atmo",
            string.format("%.2f", (tree.last_efficiency or 0) * 100).."%"
          }
        else
          root["efficiency"].caption={
            "space-exploration.energy_transmitter_label_efficiency",
            string.format("%.2f", (tree.last_efficiency or 0) * 100).."%"
          }
        end
      end

      local mode = tree.mode or "off"
      if root["active_container"] then
        local dropdown = root["active_container"][EnergyBeamGUI.name_transmitter_gui_root.."_dropdown"]
        if dropdown then
          for idx, item in pairs(EnergyBeamGUI.dropdown_idxs) do
            if mode == item then
              dropdown.selected_index = idx
            end
          end
        end
      end

      if root.destination_location_table and root.destination_location_table.destination_location_coordinates then
        local coordinate = EnergyBeam.get_coordinate(tree)
        if coordinate then
          root.destination_location_table.destination_location_coordinates.caption = "X:"..string.format("%.0f", coordinate.x) .. "  Y:"..string.format("%.0f", coordinate.y)
        else
          root.destination_location_table.destination_location_coordinates.caption = {"space-exploration.no-coordinates-set"}
        end
      end

      if root["destination-location-preview-frame"] then
        EnergyBeamGUI.preview_frame_update(root["destination-location-preview-frame"], tree)
      end
    end
  end
end


function EnergyBeamGUI.on_gui_click(event)
  if not (event.element and event.element.valid) then return end
  local element = event.element
  local player = game.players[event.player_index]
  local root = gui_element_or_parent(element, EnergyBeamGUI.name_transmitter_gui_root)
  if not (root and root.tags and root.tags.unit_number) then return end
  local tree = EnergyBeam.from_unit_number(root.tags.unit_number)
  if not tree then return end
  if element.name == "energy-transmitter-list-zones" then

    local value = player_get_dropdown_value(player, element.name, element.selected_index)
    if type(value) == "table" then
      if value.type == "zone" then
        local zone_index = value.index
        local zone = Zone.from_zone_index(zone_index)
        if zone then
          tree.destination.zone = zone
          tree.destination.coordinate = nil
          Log.trace("set destination to location: " .. zone.name )
        else
          tree.destination.zone = nil
        end
      else
        tree.destination.zone = nil
      end
      EnergyBeamGUI.gui_update(player)
    else
      EnergyBeamGUI.gui_close(player)
      Log.trace("Error: Non-table value ")
    end
  elseif element.name == "clear_filter" then
    element.parent.filter_list.text = ""
    EnergyBeamGUI.gui_update_destinations_list(player)
  elseif element.name == "destination_location_button" then
    if RemoteView.is_unlocked(player) then
      if not player.cursor_stack then
        player.print("Error, invalid player control mode. Cannot set player.cursor_stack")
      else
        local playerdata = get_make_playerdata(player)
        local player_zone = Zone.from_surface(player.surface)
        -- if the player is not already in nav mode, put them in nav mode on their current surface to make the history nice
        RemoteView.start(player)
        RemoteView.start(player, tree.destination and tree.destination.zone)
        -- only change the player's position to that of the energy emitter if its on a different surface
        -- this lets the player keep updating the position of the energy emitter as long as they stay in nav
        -- view on the targeted surface
        local coordinate = EnergyBeam.get_coordinate(tree)
        if coordinate and (not player.character) and player_zone ~= tree.destination.zone then
          player.teleport(EnergyBeam.get_coordinate(tree))
        end
        playerdata.remote_view_activity = {
          type = EnergyBeam.name_target_activity_type,
          tree = tree
        }
        player.cursor_stack.set_stack({name = EnergyBeam.name_transmitter_targeter, count = 1})
        player.opened = nil
        RemoteView.gui_make_entity_back_button (player, tree.emitter)
      end
    else
      player.print({"space-exploration.satellite-required"})
    end
  elseif element.name == EnergyBeamGUI.name_transmitter_gui_root.."_dropdown" then
    tree.mode = EnergyBeamGUI.dropdown_idxs[element.selected_index]
    EnergyBeamGUI.gui_update(player)
    Log.trace(tree.mode)
  elseif element.name == "goto_informatron_energy_beams" then
    remote.call("informatron", "informatron_open_to_page", {
      player_index = event.player_index,
      interface = "space-exploration",
      page_name = "energy_beams"
    })
  end
end
Event.addListener(defines.events.on_gui_click, EnergyBeamGUI.on_gui_click)
Event.addListener(defines.events.on_gui_selection_state_changed, EnergyBeamGUI.on_gui_click)

function EnergyBeamGUI.gui_update_destinations_list(player)
  local playerdata = get_make_playerdata(player)
  local root = player.gui.relative[EnergyBeamGUI.name_transmitter_gui_root]
  if root then

    local filter = nil
    if root.filter_flow and root.filter_flow.filter_list then
      filter = string.trim(root.filter_flow.filter_list.text)
      if filter == "" then
        filter = nil
      end
    end

    -- update the list
    local unit_number = root and root.tags and root.tags.unit_number
    local tree = EnergyBeam.from_unit_number(unit_number)
    if not tree then
      EnergyBeamGUI.gui_close(player)
      return
    end
    local destination_zone
    if tree then destination_zone = tree.destination.zone end

    local list, selected_index, values = Zone.dropdown_list_zone_destinations(
      tree.force_name,
      destination_zone,
      playerdata.zones_alphabetical,
      filter,
      {list = "None", value = {type = "none"}} -- wildcard
    )
    if selected_index == 1 then selected_index = 2 end
    root["energy-transmitter-list-zones"].items = list
    root["energy-transmitter-list-zones"].selected_index = selected_index or 2
    player_set_dropdown_values(player, "energy-transmitter-list-zones", values)

  end
end

function EnergyBeamGUI.on_gui_checked_state_changed(event)
  if not (event.element and event.element.valid) then return end
  local element = event.element
  local player = game.players[event.player_index]
  local root = gui_element_or_parent(element, EnergyBeamGUI.name_transmitter_gui_root)
  if not (root and root.tags and root.tags.unit_number) then return end
  local tree = EnergyBeam.from_unit_number(root.tags.unit_number)
  if not tree then return end
  if element.name == "list-zones-alphabetical" then
    local playerdata = get_make_playerdata(player)
    playerdata.zones_alphabetical = element.state
    EnergyBeamGUI.gui_update_destinations_list(player)
  end
end
Event.addListener(defines.events.on_gui_checked_state_changed, EnergyBeamGUI.on_gui_checked_state_changed)

function EnergyBeamGUI.on_gui_text_changed(event)
  if not (event.element and event.element.valid) then return end
  local element = event.element
  local player = game.players[event.player_index]
  local root = gui_element_or_parent(element, EnergyBeamGUI.name_transmitter_gui_root)
  if root then -- remote view
    if element.name == "filter_list" then
      EnergyBeamGUI.gui_update_destinations_list(player)
    end
  end
end
Event.addListener(defines.events.on_gui_text_changed, EnergyBeamGUI.on_gui_text_changed)

--- Close the energy beamer gui for a player
---@param player any
function EnergyBeamGUI.gui_close (player)
  if player.gui.relative[EnergyBeamGUI.name_transmitter_gui_root] then
    player.gui.relative[EnergyBeamGUI.name_transmitter_gui_root].destroy()
  end
end

--- Respond to the main entity GUI being closed by destroying the relative GUI
---@param event any
function EnergyBeamGUI.on_gui_closed(event)
  local player = game.players[event.player_index]
  if player and event.entity and event.entity.name == EnergyBeam.name_emitter then
    EnergyBeamGUI.gui_close(player)
  end
end
Event.addListener(defines.events.on_gui_closed, EnergyBeamGUI.on_gui_closed)

--- Opens the energy beamer gui when an energy beamer is clicked
--- Closes the energy beamer gui when another gui is opened
---@param event any
function EnergyBeamGUI.on_gui_opened(event)
  local player = game.players[event.player_index]
  if event.entity and event.entity.valid and event.entity.name == EnergyBeam.name_emitter then
    EnergyBeamGUI.gui_open(player, EnergyBeam.from_entity(event.entity))
  else
    EnergyBeamGUI.gui_close(player)
  end
end
Event.addListener(defines.events.on_gui_opened, EnergyBeamGUI.on_gui_opened)


return EnergyBeamGUI

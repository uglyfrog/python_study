local LaunchpadGUI = {}

LaunchpadGUI.name_rocket_launch_pad_gui_root = mod_prefix.."rocket-launch-pad-gui"
LaunchpadGUI.name_window_close = "launchpad_close_button"

--- Create the launch pad gui for a player
---@param player any
---@param launch_pad Launchpad launch pad data
function LaunchpadGUI.gui_open(player, launch_pad)
  LaunchpadGUI.gui_close(player)
  if not launch_pad then Log.trace('LaunchpadGUI.gui_open launch_pad not found') return end

  local struct = launch_pad
  local gui = player.gui.relative
  local playerdata = get_make_playerdata(player)

  local anchor = {gui=defines.relative_gui_type.container_gui, position=defines.relative_gui_position.left}
  local container = gui.add{
    type = "frame",
    name = LaunchpadGUI.name_rocket_launch_pad_gui_root,
    anchor = anchor,
    style="space_platform_container",
    direction="vertical",
    -- use gui element tags to store a reference to what launch pad this gui is displaying/controls
    tags = {
      unit_number = struct.unit_number
    }
  }

  local title_table = container.add{type="table", name="launchpad-title-table", column_count=2, draw_horizontal_lines=false}
  title_table.style.horizontally_stretchable = true
  title_table.style.column_alignments[1] = "left"
  title_table.style.column_alignments[2] = "right"

  local title_frame = title_table.add{type="frame", name="launchpad-title-frame",
    caption = {"space-exploration.relative-window-settings"},
    style="informatron_title_frame"}
  title_frame.style.right_padding = -5

  local title_informatron = title_table.add{
    type="sprite-button",
    name="goto_informatron_cargo_rockets",
    sprite = "virtual-signal/informatron",
    style="informatron_close_button",
    tooltip={"space-exploration.informatron-open-help"}
  }
  title_informatron.style.width = 28
  title_informatron.style.height = 28

  local bar
  container.add{ type="label", name="crew_capsules", caption={"space-exploration.label_space_capsule", ""}}
  bar = container.add{ type="progressbar", name="crew_capsules_progress", size = 300, value=0, style="space_platform_progressbar_capsule"}
  bar.style.horizontally_stretchable  = true

  container.add{ type="label", name="rocket_sections", caption={"space-exploration.label_rocket_sections", ""}}
  bar = container.add{ type="progressbar", name="rocket_sections_progress", size = 300, value=0, style="space_platform_progressbar_sections"}
  bar.style.horizontally_stretchable  = true

  container.add{ type="label", name="fuel_capacity", caption={"space-exploration.label_liquid_rocket_fuel", ""}}
  bar = container.add{ type="progressbar", name="fuel_capacity_progress", size = 300, value=0, style="space_platform_progressbar_fuel"}
  bar.style.horizontally_stretchable  = true

  container.add{ type="label", name="cargo_capacity", caption={"space-exploration.label_cargo", ""}}
  bar = container.add{ type="progressbar", name="cargo_capacity_progress", size = 300, value=0, style="space_platform_progressbar_cargo"}
  bar.style.horizontally_stretchable  = true

  container.add{ type="label", name="trigger-label", caption={"space-exploration.launch_trigger"}}

  local list, selected_index = dropdown_from_preset(Launchpad.trigger_options, struct.launch_trigger)
  local trigger_dropdown = container.add{ type="drop-down", name="trigger", items=list, selected_index = selected_index}
  trigger_dropdown.style.horizontally_stretchable  = true

  container.add{ type="label", name="destination-label", caption={"space-exploration.label_destination", ""}}
  container.add{type="checkbox", name="list-zones-alphabetical", caption="List destinations alphabetically", state=playerdata.zones_alphabetical and true or false}

  local filter_container = container.add{ type="flow", name="filter_flow", direction="horizontal"}
  local filter_field = filter_container.add{ type="textfield", name="filter_list"}
  filter_field.style.width = 275
  local filter_button = filter_container.add{ type = "sprite-button", name="clear_filter", sprite="utility/search_icon", tooltip={"space-exploration.clear-filter"},}
  filter_button.style.left_margin = 5
  filter_button.style.width = 28
  filter_button.style.height = 28

  local destination_zone = struct.destination.zone
  local list, selected_index, values = Zone.dropdown_list_zone_destinations(struct.force_name, destination_zone, playerdata.zones_alphabetical, nil,
    {list = {"space-exploration.any_landing_pad_with_name"}, value = {type = "any"}} -- wildcard
  )
  if selected_index == 1 then selected_index = 2 end
  local zones_dropdown = container.add{ type="drop-down", name="launchpad-list-zones", items=list, selected_index=selected_index or 2}
  zones_dropdown.style.horizontally_stretchable  = true
  player_set_dropdown_values(player, "launchpad-list-zones", values)

  container.add{ type="label", name="destination-location-label", caption={"space-exploration.label_destination_position", ""}}
  local destination_pad_name = struct.destination.landing_pad_name
  local list, selected_index, values, landingpads_dropdown
  if destination_zone then
    list, selected_index, values = Landingpad.dropdown_list_zone_landing_pad_names(struct.force_name, destination_zone, destination_pad_name)
    landingpads_dropdown = container.add{ type="drop-down", name="launchpad-list-landing-pad-names", items=list, selected_index=selected_index}
    player_set_dropdown_values(player, "launchpad-list-landing-pad-names", values)
  else
    list, selected_index, values = Landingpad.dropdown_list_force_landing_pad_names(struct.force_name, destination_pad_name)
    landingpads_dropdown = container.add{ type="drop-down", name="launchpad-list-landing-pad-names", items=list, selected_index=selected_index}
    player_set_dropdown_values(player, "launchpad-list-landing-pad-names", values)
  end
  landingpads_dropdown.style.horizontally_stretchable  = true

  container.add{ type="label", name="cargo_loss", caption={"space-exploration.label_cargo_safety", ""}}
  container.add{ type="label", name="survivability_loss", caption={"space-exploration.label_landing_chance", ""}}

  container.add{ type="label", name="status", caption={"space-exploration.label_status", ""}}

  LaunchpadGUI.gui_update(player)
end

function LaunchpadGUI.gui_update(player)
  local root = player.gui.relative[LaunchpadGUI.name_rocket_launch_pad_gui_root]
  if root then
    local struct = Launchpad.from_unit_number(
      root and root.tags and root.tags.unit_number)
    if struct then
      Launchpad.prep(struct)

      local inv = struct.container.get_inventory(defines.inventory.chest)
      local inv_used = count_inventory_slots_used(inv)
      struct.crew_capsules = struct.crew_capsules or 0
      struct.rocket_sections = struct.rocket_sections or 0

      if root["crew_capsules"] then
        root["crew_capsules"].caption={"space-exploration.label_space_capsule", {"space-exploration.simple-a-b-divide", struct.crew_capsules, Launchpad.crew_capsules_per_rocket}}
        root["crew_capsules_progress"].value = struct.crew_capsules / Launchpad.crew_capsules_per_rocket
      end

      root["rocket_sections"].caption={"space-exploration.label_cargo_rocket_sections", {"space-exploration.simple-a-b-divide", struct.rocket_sections, Launchpad.rocket_sections_per_rocket}}
      root["rocket_sections_progress"].value = struct.rocket_sections / Launchpad.rocket_sections_per_rocket

      if struct.required_fuel then
        root["fuel_capacity"].caption={"space-exploration.label_liquid_rocket_fuel", {"space-exploration.simple-a-b-divide",
          Util.format_fuel(math.min(struct.total_fuel, struct.required_fuel)),
          Util.format_fuel(struct.required_fuel)}}
        root["fuel_capacity_progress"].value=math.min(struct.total_fuel, struct.required_fuel) / (struct.required_fuel)
      else
        root["fuel_capacity"].caption={"space-exploration.label_liquid_rocket_fuel", {"space-exploration.simple-a-b-divide",
          Util.format_fuel(math.floor(struct.total_fuel)),
          "?"}}
        root["fuel_capacity_progress"].value=0
      end

      root["cargo_capacity"].caption={"space-exploration.label_cargo", {"space-exploration.simple-a-b-divide", math.min(inv_used, Launchpad.rocket_capacity), Launchpad.rocket_capacity}}
      root["cargo_capacity_progress"].value=math.min(inv_used, Launchpad.rocket_capacity) / Launchpad.rocket_capacity

      local message = ""
      local ready = "disabled"
      if not (global.forces[player.force.name] and global.forces[player.force.name].satellites_launched > 0) then
        message = {"space-exploration.launchpad_requires_satellite"}
      elseif struct.launch_status > -1 then
        message = {"space-exploration.launchpad_launching_rocket"}
      elseif struct.rocket_sections < Launchpad.rocket_sections_per_rocket then
        message = {"space-exploration.launchpad_constructing_rocket"}
      elseif struct.crew_capsules < Launchpad.crew_capsules_per_rocket then
        message = {"space-exploration.launchpad_space_capsule_required"}
      elseif not struct.required_fuel then
        message = {"space-exploration.launchpad_invalid_destination"}
      elseif struct.total_fuel < struct.required_fuel then
        message = {"space-exploration.launchpad_loading_fuel"}
      elseif inv_used < Launchpad.rocket_capacity then
        message = {"space-exploration.launchpad_ready_loading_cargo"}
        ready = "ready"
      else
        message = {"space-exploration.launchpad_ready_cargo_full"}
        ready = "ready"
      end
      if ready == "ready" and struct.destination.landing_pad_name then
        if struct.destination.zone then
          local landing_pads = Landingpad.get_zone_landing_pads_availability(struct.force_name, struct.destination.zone, struct.destination.landing_pad_name)
          if #landing_pads.empty_landing_pads == 0 then
            message = {"space-exploration.launchpad_waiting_for_empty_pad"}
            ready = "delayed"
            if #landing_pads.filled_landing_pads == 0 then
              message = {"space-exploration.launchpad_waiting_for_pad"}
              ready = "disabled"
              if #landing_pads.blocked_landing_pads == 0 then
                message = {"space-exploration.launchpad_no_pad_matches"}
              end
            end
          end
        else
          local landing_pads = Landingpad.get_force_landing_pads_availability(struct.force_name, struct.destination.landing_pad_name)
          if #landing_pads.empty_landing_pads == 0 then
            message = {"space-exploration.launchpad_waiting_for_empty_pad"}
            ready = "delayed"
            if #landing_pads.filled_landing_pads == 0 then
              message = {"space-exploration.launchpad_waiting_for_pad"}
              ready = "disabled"
              if #landing_pads.blocked_landing_pads == 0 then
                message = {"space-exploration.launchpad_no_pad_matches"}
              end
            end
          end
        end
      end

      local delta_v = Zone.get_travel_delta_v(struct.zone, struct.destination.zone)
      if root.cargo_loss then
        local cargo_loss = Launchpad.get_cargo_loss(game.forces[struct.force_name], struct.destination.zone, delta_v)
        if struct.destination and struct.destination.landing_pad_name then
          cargo_loss = cargo_loss / 2
        end
        if struct.destination.zone then
          root.cargo_loss.caption = {"space-exploration.label_cargo_safety", string.format("%.2f", (1-cargo_loss)*100).."%"}
        else
          root.cargo_loss.caption = {"space-exploration.label_cargo_safety", {"space-exploration.variable"}}
        end
        root.cargo_loss.tooltip = {"space-exploration.cargo_loss_tooltip"}
      end
      if root.survivability_loss then
        local survivability_loss = Launchpad.get_survivability_loss(game.forces[struct.force_name], struct.destination.zone, delta_v)
        if struct.destination and struct.destination.landing_pad_name then
          if struct.destination.zone then
            root.survivability_loss.caption = {"space-exploration.label_landing_chance", string.format("%.2f", (1-survivability_loss)*100).."%"}
          else
            root.survivability_loss.caption = {"space-exploration.label_landing_chance", {"space-exploration.variable"}}
          end
          root.survivability_loss.tooltip = {"space-exploration.survivability_loss_tooltip"}
        else
          root.survivability_loss.caption = {"space-exploration.label_landing_chance", {"space-exploration.requires_landing_pad"}}
          root.survivability_loss.tooltip = {"space-exploration.survivability_loss_no_pad_tooltip"}
        end
      end

      root["status"].caption={"space-exploration.label_status", message}

      if ready == "ready" or ready == "delayed" then
        if root["launch-disabled"] then root["launch-disabled"].destroy() end
        if not root["launch"] then
          local launch_button
          if ready == "delayed" then
            launch_button = root.add{ type="button", name="launch", caption={"space-exploration.launchpad_launch_delayed"}, style="confirm_button",
              tooltip={"space-exploration.launchpad_launch_delayed_tooltip"}}
          else
            launch_button = root.add{ type="button", name="launch", caption={"space-exploration.button-launch"}, style="confirm_button"}
          end
          launch_button.style.top_margin = 10
          launch_button.style.horizontally_stretchable  = true
          launch_button.style.horizontal_align = "left"
        end
      else
        if root["launch"] then root["launch"].destroy() end
        if not root["launch-disabled"] then
          local launch_button = root.add{ type="button", name="launch-disabled", caption={"space-exploration.button-launch-disabled"}, style="red_confirm_button"}
          launch_button.style.top_margin = 10
          launch_button.style.horizontally_stretchable  = true
          launch_button.style.horizontal_align = "left"
        end
        local launch_button = root["launch-disabled"]
        if struct.launch_status > -1 then
          launch_button.caption = {"space-exploration.launchpad_launch_in_progress"}
        else
          launch_button.caption = {"space-exploration.button-launch-disabled"}
        end
      end

    end
  end
end

function LaunchpadGUI.on_gui_click(event)
  if not (event.element and event.element.valid) then return end
  local element = event.element
  local player = game.players[event.player_index]
  local root = gui_element_or_parent(element, LaunchpadGUI.name_rocket_launch_pad_gui_root)
  if not root then return end
  local struct = Launchpad.from_unit_number(
    root and root.tags and root.tags.unit_number)
  if not struct then return end
  if element.name == "trigger" then

    struct.launch_trigger = selected_name_from_dropdown_preset(element, Launchpad.trigger_options) or "none"

  elseif element.name == "launchpad-list-zones" then

    local value = player_get_dropdown_value(player, element.name, element.selected_index)
    if type(value) == "table" then
      if value.type == "zone" then
        local zone_index = value.index
        local zone = Zone.from_zone_index(zone_index)
        if zone then
          struct.destination.zone = zone
          Log.trace("set destination to location: " .. zone.name )
        end
        local pad_names = element.parent["launchpad-list-landing-pad-names"]
        local destination_pad_name = struct.destination.landing_pad_name
        local list, selected_index, values = Landingpad.dropdown_list_zone_landing_pad_names(struct.force_name, struct.destination.zone, destination_pad_name)
        pad_names.items = list
        pad_names.selected_index = selected_index
        player_set_dropdown_values(player, "launchpad-list-landing-pad-names", values)
      elseif value.type == "spaceship" then
        local spaceship_index = value.index
        local spaceship = Spaceship.from_index(spaceship_index)
        if spaceship then
          struct.destination.zone = spaceship
          Log.trace("set destination to spaceship : " .. spaceship.name )
        end
        local pad_names = element.parent["launchpad-list-landing-pad-names"]
        local destination_pad_name = struct.destination.landing_pad_name
        local list, selected_index, values = Landingpad.dropdown_list_zone_landing_pad_names(struct.force_name, struct.destination.zone, destination_pad_name)
        pad_names.items = list
        pad_names.selected_index = selected_index
        player_set_dropdown_values(player, "launchpad-list-landing-pad-names", values)
      elseif value.type == "any" then
        struct.destination.zone = nil
        Log.trace("set destination to location: any")
        local pad_names = element.parent["launchpad-list-landing-pad-names"]
        local destination_pad_name = struct.destination.landing_pad_name
        local list, selected_index, values = Landingpad.dropdown_list_force_landing_pad_names(struct.force_name, destination_pad_name)
        pad_names.items = list
        pad_names.selected_index = selected_index
        player_set_dropdown_values(player, "launchpad-list-landing-pad-names", values)
      end
      LaunchpadGUI.gui_update(player)
    else
      LaunchpadGUI.gui_close(player)
      Log.trace("Error: Non-table value ")
    end

  elseif element.name == "launchpad-list-landing-pad-names" then

    local value = player_get_dropdown_value(player, element.name, element.selected_index)
    local landing_pad_name = value
    if landing_pad_name and landing_pad_name ~= "" then
      struct.destination.landing_pad_name = landing_pad_name
      Log.trace("set destination to landing_pad " .. landing_pad_name )
    else
      struct.destination.landing_pad_name = nil
    end

  elseif element.name == "launch" then
    Launchpad.launch(struct, false, true)
  elseif element.name == "clear_filter" then
    element.parent.filter_list.text = ""
    LaunchpadGUI.gui_update_destinations_list(player)
  elseif element.name == "goto_informatron_cargo_rockets" then
    remote.call("informatron", "informatron_open_to_page", {
      player_index = event.player_index,
      interface = "space-exploration",
      page_name = "cargo_rockets"
    })
  end
end
Event.addListener(defines.events.on_gui_click, LaunchpadGUI.on_gui_click)
Event.addListener(defines.events.on_gui_selection_state_changed, LaunchpadGUI.on_gui_click)

function LaunchpadGUI.gui_update_destinations_list(player)
  local playerdata = get_make_playerdata(player)
  local root = player.gui.relative[LaunchpadGUI.name_rocket_launch_pad_gui_root]
  if root then
    local struct = Launchpad.from_unit_number(
      root and root.tags and root.tags.unit_number)
    if not struct then return end

    local filter = nil
    if root.filter_flow and root.filter_flow.filter_list then
      filter = string.trim(root.filter_flow.filter_list.text)
      if filter == "" then
        filter = nil
      end
    end

    -- update the list
    local destination_zone = struct.destination and struct.destination.zone
    local list, selected_index, values = Zone.dropdown_list_zone_destinations( struct.force_name, destination_zone, playerdata.zones_alphabetical, filter,
      {list = {"space-exploration.any_landing_pad_with_name"}, value = {type = "any"}} -- wildcard
    )
    if selected_index == 1 then selected_index = 2 end
    root["launchpad-list-zones"].items = list
    root["launchpad-list-zones"].selected_index = selected_index or 2
    player_set_dropdown_values(player, "launchpad-list-zones", values)

  end
end

function LaunchpadGUI.on_gui_checked_state_changed(event)
  if not (event.element and event.element.valid) then return end
  local element = event.element
  local player = game.players[event.player_index]
  local root = gui_element_or_parent(element, LaunchpadGUI.name_rocket_launch_pad_gui_root)
  if not root then return end
  local struct = Launchpad.from_unit_number(
    root and root.tags and root.tags.unit_number)
  if not struct then return end
  if element.name == "list-zones-alphabetical" then
    local playerdata = get_make_playerdata(player)
    playerdata.zones_alphabetical = element.state
    LaunchpadGUI.gui_update_destinations_list(player)
  end
end
Event.addListener(defines.events.on_gui_checked_state_changed, LaunchpadGUI.on_gui_checked_state_changed)

function LaunchpadGUI.on_gui_text_changed(event)
  if not (event.element and event.element.valid) then return end
  local element = event.element
  local player = game.players[event.player_index]
  local root = gui_element_or_parent(element, LaunchpadGUI.name_rocket_launch_pad_gui_root)
  if root then -- remote view
    if element.name == "filter_list" then
      LaunchpadGUI.gui_update_destinations_list(player)
    end
  end
end
Event.addListener(defines.events.on_gui_text_changed, LaunchpadGUI.on_gui_text_changed)

--- Close the launchpad gui for a player
---@param player any
function LaunchpadGUI.gui_close (player)
  if player.gui.relative[LaunchpadGUI.name_rocket_launch_pad_gui_root] then
    player.gui.relative[LaunchpadGUI.name_rocket_launch_pad_gui_root].destroy()
  end
end

--- Respond to the main entity GUI being closed by destroying the relative GUI
---@param event any
function LaunchpadGUI.on_gui_closed(event)
  local player = game.players[event.player_index]
  if player and event.entity and event.entity.name == Launchpad.name_rocket_launch_pad then
    LaunchpadGUI.gui_close(player)
  end
end
Event.addListener(defines.events.on_gui_closed, LaunchpadGUI.on_gui_closed)

--- Opens the launchpad gui when a launchpad is clicked
--- Closes the launchpad gui when another gui is opened
---@param event any
function LaunchpadGUI.on_gui_opened(event)
  local player = game.players[event.player_index]
  if event.entity and event.entity.valid and event.entity.name == Launchpad.name_rocket_launch_pad then
    LaunchpadGUI.gui_open(player, Launchpad.from_entity(event.entity))
  else
    LaunchpadGUI.gui_close(player)
  end
end
Event.addListener(defines.events.on_gui_opened, LaunchpadGUI.on_gui_opened)

return LaunchpadGUI

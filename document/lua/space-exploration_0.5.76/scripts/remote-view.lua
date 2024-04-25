local RemoteView = {}
--[[
Navigation View.
Remote view is the system that detaches the player from the character.
It displays a small you-are-here window on the top left with a buttons to:
  Open the zone list
  Open starmap
  Open system view
  Return to your body

]]--

-- constants
RemoteView.name_gui_root = mod_prefix.."remote-view"
RemoteView.name_shortcut = mod_prefix.."remote-view"
RemoteView.name_event = mod_prefix.."remote-view"
RemoteView.name_pins_event = mod_prefix.."remote-view-pins"
RemoteView.name_event_previous = mod_prefix.."remote-view-previous"
RemoteView.name_event_next = mod_prefix.."remote-view-next"
--RemoteView.name_permissions_group = mod_prefix.."remote-view"
RemoteView.name_button_overhead_satellite = mod_prefix .. "overhead_satellite"
RemoteView.name_setting_overhead_satellite = mod_prefix .. "show-overhead-button-satellite-mode"
RemoteView.name_window_close = "remote-view-close"
RemoteView.name_button_zonelist = "remote-view-open_zonelist"
RemoteView.name_button_starmap = "remote-view-open_starmap"
RemoteView.name_button_system_map = "system_map_button"
RemoteView.name_details_root = "remote-view-details-root"
RemoteView.name_button_history_previous = "remote-view-history-previous"
RemoteView.name_button_history_next = "remote-view-history-next"
RemoteView.name_button_history_delete = "remote-view-history-delete"

RemoteView.name_permission_group = "satellite"
RemoteView.name_permission_group_suffix = "_satellite"

RemoteView.action_zone_click = "se-remoteview-zone-click"
RemoteView.max_history = 50

RemoteView.satellite_block_actions = {
  defines.input_action.begin_mining_terrain,
  defines.input_action.change_riding_state,
  defines.input_action.change_shooting_state,
  defines.input_action.cursor_split,
  defines.input_action.destroy_opened_item,
  defines.input_action.drop_item,
  defines.input_action.fast_entity_split,
  defines.input_action.fast_entity_transfer,
  defines.input_action.inventory_split,
  defines.input_action.inventory_transfer,
  defines.input_action.map_editor_action,
  defines.input_action.open_equipment,
  defines.input_action.place_equipment,
  defines.input_action.set_car_weapons_control,
  defines.input_action.stack_split,
  defines.input_action.stack_transfer,
  defines.input_action.start_repair,
  defines.input_action.take_equipment,
  defines.input_action.toggle_driving,
  defines.input_action.toggle_map_editor,
}


function RemoteView.get_stack_limit(stack) -- must be lua item stack, not simple stack
  local name = stack.name
  local type = stack.type
  if type == "blueprint"
    or type == "blueprint-book"
    or type == "deconstruction-item"
    or type == "selection-tool"
    or type == "upgrade-item"
    or type == "copy-paste-tool"
    or type == "cut-paste-tool" then
      return stack.count
  end
  if name == "artillery-targeting-remote" -- type == "capsule" for the artillery remote
    --or name == "ion-cannon-targeter" -- still bugged
    or type == "spidertron-remote" then -- allow all spidertron remotes (not just the vanilla one named spidertron-remote) by using type
      return stack.count
  end
  if name == "red-wire"
    or name == "green-wire"
    or name == "copper-cable" then
      return 2
  end
  return 0
end

function RemoteView.drop_stack(player, stack, drop_count, drop_to_ground)
  if player and player.connected and RemoteView.is_active(player) then
    local entity = player.opened_gui_type == defines.gui_type.entity and player.opened or player.selected
    if entity then
      local inserted = entity.insert({name = stack.name, count = drop_count})
      if inserted < drop_count and drop_to_ground == true then
        player.surface.spill_item_stack(
          entity.position,
          {name = stack.name, count = drop_count - inserted},
          false, -- lootable
          player.force, -- deconstruct by force
          false) -- allow belts
      end
    elseif drop_to_ground then
      local limit = RemoteView.get_stack_limit(stack)
      if limit == 0 then
        player.surface.spill_item_stack(
          player.position,
          {name = stack.name, count = drop_count},
          false, -- lootable
          player.force, -- deconstruct by force
          false) -- allow belts
      end
    end
  end
end

function RemoteView.on_player_crafted_item(event)
  if not(event.item_stack and event.item_stack.valid_for_read) then return end
  local player = game.players[event.player_index]
  if player and player.connected and RemoteView.is_active(player) then
    local limit = RemoteView.get_stack_limit(event.item_stack)
    if limit > 0 then
      player.cursor_stack.set_stack(event.item_stack)
      if event.item_stack.count > limit then
        RemoteView.drop_stack(player, event.item_stack, event.item_stack.count - limit, false)
      end
      event.item_stack.count = limit
    else
      player.cursor_ghost = event.item_stack.prototype
      event.item_stack.count = 0
    end
  end
end
Event.addListener(defines.events.on_player_crafted_item, RemoteView.on_player_crafted_item)

function RemoteView.on_player_pipette(event)
  local player = game.players[event.player_index]
  if player and player.connected and RemoteView.is_active(player) then
    player.cursor_stack.clear()
    player.cursor_ghost = event.item
  end
end
Event.addListener(defines.events.on_player_pipette, RemoteView.on_player_pipette)

function RemoteView.on_player_cursor_stack_changed(event)
  local player = game.players[event.player_index]
  if player and player.connected and RemoteView.is_active(player) then
    local stack = player.cursor_stack
    if stack and stack.valid_for_read then
      local limit = RemoteView.get_stack_limit(stack)
      if limit > 0 then
        if stack.count > limit then
          if stack.name == "red-wire"
            or stack.name == "green-wire"
            or stack.name == "copper-cable" then
          --wire shortcuts mod messes things up
        else
          RemoteView.drop_stack(player, stack, stack.count - limit, true)
        end
        end
        stack.count = limit
      else
        RemoteView.drop_stack(player, stack, stack.count, true)
        player.cursor_ghost = stack.prototype
        player.cursor_stack.clear()
      end
    end
  end
end
Event.addListener(defines.events.on_player_cursor_stack_changed, RemoteView.on_player_cursor_stack_changed)

function RemoteView.on_player_main_inventory_changed(event)
  local player = game.players[event.player_index]
  if player and player.connected and RemoteView.is_active(player) then
    local inv = player.get_main_inventory()
    for i = 1, #inv do
      local stack = inv[i]
      if stack and stack.valid_for_read then
        local limit = RemoteView.get_stack_limit(stack)
        if limit > 0 then
          stack.count = limit
        else
          RemoteView.drop_stack(player, stack, stack.count, true)
          stack.count = 0
        end
      end
    end
  end
end
Event.addListener(defines.events.on_player_main_inventory_changed, RemoteView.on_player_main_inventory_changed)

function RemoteView.apply_permission_group_permissions(group_from, group_to)
  for _, action in pairs(defines.input_action) do
    group_to.set_allows_action(action, group_from.allows_action(action) )
  end
end

function RemoteView.player_set_satellite_permissions(player)
  local playerdata = get_make_playerdata(player)
  local permission_group = nil
  if player.permission_group then
    if player.permission_group.name == RemoteView.name_permission_group then
      return player.permission_group -- already in default satellite group
    elseif string.find(player.permission_group.name, RemoteView.name_permission_group_suffix, 1, true) then
      return player.permission_group -- already in special satellite group
    end
    -- make a new group from the existing group
    permission_group = game.permissions.get_group(player.permission_group.name..RemoteView.name_permission_group_suffix)
    if not permission_group then
      permission_group = game.permissions.create_group(player.permission_group.name..RemoteView.name_permission_group_suffix)
    end
    RemoteView.apply_permission_group_permissions(player.permission_group, permission_group)
  end

  -- get the default group
  if not permission_group then
    permission_group = game.permissions.get_group(RemoteView.name_permission_group)
  end

  -- make the default group
  if not permission_group then
    permission_group = game.permissions.create_group(RemoteView.name_permission_group)
  end

  for _, action in pairs(RemoteView.satellite_block_actions) do
    permission_group.set_allows_action(action, false)
  end

  return permission_group
end

function RemoteView.gui_close (player, keep_open_window)
  Pin.modal_close(player)
  if not keep_open_window then
    Pin.window_close(player)
  end
  if player.gui.left[RemoteView.name_gui_root] then
    player.gui.left[RemoteView.name_gui_root].destroy()
  end
end

function RemoteView.gui_update (player) -- only call when something changed
  local root = player.gui.left[RemoteView.name_gui_root]
  if root then
    if root.currently_viewing_frame
            and root.currently_viewing_frame.currently_viewing_table
            and root.currently_viewing_frame.currently_viewing_table.currently_viewing_value then
      local zone = Zone.from_surface(player.surface)

      -- current system button
      local current_system
      if zone then
        current_system = Zone.get_star_from_child(zone)
        root.system_toggles_table.system_map_button.style = "se_generic_button"
      else
        current_system = MapView.get_current_system(player)
        root.system_toggles_table.system_map_button.style = "se_generic_button_down"
      end
      root.system_toggles_table.system_map_button.style.padding = 5
      if current_system then
        root.system_toggles_table.system_map_button.caption = {
          "space-exploration.simple-a-b-space",
          "[img=se-map-gui-system]",
          { "space-exploration.solar-system", current_system.name } }
      else
        root.system_toggles_table.system_map_button.caption = {
          "space-exploration.simple-a-b-space",
          "[img=se-map-gui-starmap]",
          { "space-exploration.interstellar-map" } }
      end

      -- view details toggles
      local starmap_settings = MapView.get_settings(player)
      for _, element in pairs(root.system_toggles_table[MapView.name_toggles].children) do
        if starmap_settings[element.name] then
          element.style = "se_generic_square_button_down"
        else
          element.style = "se_generic_square_button"
        end
        element.style.width = 32
        element.style.height = 32
        element.visible = starmap_settings[element.name] ~= nil
      end

      if root.system_toggles_table.history_flow then
        local playerdata = get_make_playerdata(player)
        local history = playerdata.location_history
        if history then

          local next_locations = {}
          local next_locations_merged = {}
          for i = history.current_pointer +1, #history.references do
            local locale = Location.to_localised_string(history.references[i])
            if locale then
              table.insert(next_locations, locale)
              if #next_locations_merged == 0 then
                next_locations_merged = {"space-exploration.simple-bold", locale}
              else
                next_locations_merged = {"space-exploration.simple-a-b-break", next_locations_merged, locale}
              end
            end
          end

          local prev_locations = {}
          local prev_locations_merged = {}
          for i = history.current_pointer -1, 1, -1 do
            local locale = Location.to_localised_string(history.references[i])
            if locale then
              table.insert(prev_locations, locale)
              if #prev_locations_merged == 0 then
                prev_locations_merged = {"space-exploration.simple-bold", locale}
              else
                prev_locations_merged = {"space-exploration.simple-a-b-break", prev_locations_merged, locale}
              end
            end
          end

          if root.system_toggles_table.history_flow[RemoteView.name_button_history_delete] then
            root.system_toggles_table.history_flow[RemoteView.name_button_history_delete].enabled = #next_locations + #prev_locations > 0
          end

          if root.system_toggles_table.history_flow[RemoteView.name_button_history_next] then
            if #next_locations > 0 then
              root.system_toggles_table.history_flow[RemoteView.name_button_history_next].enabled = true
              root.system_toggles_table.history_flow[RemoteView.name_button_history_next].tooltip = {
                "space-exploration."..RemoteView.name_button_history_next, next_locations_merged}
            else
              root.system_toggles_table.history_flow[RemoteView.name_button_history_next].enabled = false
              root.system_toggles_table.history_flow[RemoteView.name_button_history_next].tooltip = {
                "space-exploration."..RemoteView.name_button_history_next, ""}
            end
          end

          if root.system_toggles_table.history_flow[RemoteView.name_button_history_previous] then
            if #prev_locations > 0 then
              root.system_toggles_table.history_flow[RemoteView.name_button_history_previous].enabled = true
              root.system_toggles_table.history_flow[RemoteView.name_button_history_previous].tooltip = {
                "space-exploration."..RemoteView.name_button_history_previous, prev_locations_merged}
            else
              root.system_toggles_table.history_flow[RemoteView.name_button_history_previous].enabled = false
              root.system_toggles_table.history_flow[RemoteView.name_button_history_previous].tooltip = {
                "space-exploration."..RemoteView.name_button_history_previous, ""}
            end
          end
        end
      end

      -- currently viewing path and name
      local currently_viewing_path = root.currently_viewing_frame.currently_viewing_table.currently_viewing_path
      currently_viewing_path.clear()
      currently_viewing_path.style.vertical_align = "center"

      local currently_viewing_name
      if zone then

        local parent_chain = {}
        local parent_zone = zone
        local found_star = false
        while parent_zone do
          table.insert(parent_chain, parent_zone) -- reverse order
          found_star = parent_zone.type == "star"
          parent_zone = parent_zone.parent
        end
        local buttons = {}
        for i = #parent_chain, 1, -1 do
          if zone.type ~= "spaceship" and not found_star then
            local space = currently_viewing_path.add{ type="sprite", sprite = "se-map-gui-starmap-small", tooltip = {"space-exploration.interstellar-space"} }
          end
          parent_zone = parent_chain[i]
          local zone_icon = Zone.get_icon(parent_zone)
          if parent_zone.type == "orbit" and parent_zone.parent.type == "star" then
            break
          end
          if parent_zone.type == "star" then
            parent_zone = parent_zone.orbit
          end
          if #currently_viewing_path.children > 0 then
            local arrow = currently_viewing_path.add{ type="label", caption = "▶" }
            arrow.style.font = "default-tiny-bold"
            arrow.style.top_margin = 1

            --currently_viewing_path.add{ type="sprite", sprite = zone_icon, tooltip = parent_zone.name }
            table.insert(buttons, currently_viewing_path.add {
              type = "sprite-button",
              sprite = zone_icon,
              tags = {
                action = RemoteView.action_zone_click,
                zone_index = parent_zone.index
              },
              style = "se_generic_square_button",
              tooltip = parent_zone.name
            })
          else
            --currently_viewing_path.add{ type="sprite", sprite = zone_icon, tooltip = parent_zone.name }
            table.insert(buttons, currently_viewing_path.add {
              type = "sprite-button",
              sprite = zone_icon,
              tags = {
                action = RemoteView.action_zone_click,
                zone_index = parent_zone.index
              },
              style = "se_generic_square_button",
              tooltip = parent_zone.name
            })
          end
        end

        currently_viewing_path.children[#currently_viewing_path.children].style = "se_generic_square_button_active"

        currently_viewing_name = zone.name

        if zone.orbit and zone.type ~= "star" then
          local arrow = currently_viewing_path.add{ type="label", caption = "▶" }
          arrow.style.font = "default-tiny-bold"
          arrow.style.top_margin = 1
          local zone_icon = Zone.get_icon(zone.orbit)
          table.insert(buttons, currently_viewing_path.add {
            type = "sprite-button",
            sprite = zone_icon,
            tags = {
              action = RemoteView.action_zone_click,
              zone_index = zone.orbit.index
            },
            style = "se_generic_square_button",
            tooltip = zone.orbit.name
          })
        end
        -- temp hack

        currently_viewing_path.style.vertical_align = "center"
        for _, button in pairs(buttons) do
          button.style.top_margin = 2
          button.style.bottom_margin = 2
          button.style.vertical_align = "center"
          button.style.width = 36
          button.style.height = 36
        end

      end

      if currently_viewing_name then
        root.system_toggles_table[MapView.name_toggles].visible = false
        root.currently_viewing_label.visible = true
        root.currently_viewing_frame.visible = true
        root.currently_viewing_frame.currently_viewing_table.currently_viewing_value.caption = currently_viewing_name
      else
        root.system_toggles_table[MapView.name_toggles].visible = true
        root.currently_viewing_label.visible = false
        root.currently_viewing_frame.visible = false
      end

      Pin.gui_update(player)
    end
  end
end

function RemoteView.gui_open (player)
  local gui = player.gui.left
  close_own_guis(player)
  RemoteView.gui_close(player, true)
  Lifesupport.gui_close(player)

  local main = gui.add{ type = "frame", name = RemoteView.name_gui_root, style="space_platform_container", direction="vertical"}
  main.style.horizontally_stretchable = true
  main.style.padding = 12
  main.style.top_padding = 6
   -- If the width can be expanded and you have 10+ pins, or system names are different,
   -- then you have the problem of the window size changing and the back button moves
   -- enough for the mouse to be over a different button.
  main.style.minimal_width = 432

  local title_table = main.add{type="table", name="title_table", column_count=2, draw_horizontal_lines=false}
  title_table.style.horizontally_stretchable = true
  title_table.style.column_alignments[1] = "left"
  title_table.style.column_alignments[2] = "right"

  local title_frame = title_table.add{type="frame", name="title_frame", caption={"space-exploration.remote-view-window-title"}, style="informatron_title_frame"}
  title_frame.style.right_padding = -5

  local right_flow = title_table.add{type="flow", name="title_flow_right"}

  local list = right_flow.add{type="sprite-button", name=RemoteView.name_button_zonelist, sprite = "se-map-gui-universe-explorer", style="informatron_close_button", tooltip={"space-exploration.zonelist-window-title"}}
  list.style.width = 28
  list.style.height = 28
  list.style.right_margin = 6

  local starmap = right_flow.add{type="sprite-button", name=RemoteView.name_button_starmap, sprite = "se-map-gui-starmap", style="informatron_close_button", tooltip={"space-exploration.star-map"},
    tags = {se_action="starmap-cycle"}}
  starmap.style.width = 28
  starmap.style.height = 28
  starmap.style.right_margin = 6

  --local close = right_flow.add{type="button", name=RemoteView.name_window_close, caption="✖", style="informatron_close_button", tooltip={"space-exploration.exit-remote-view"}}
  local close = right_flow.add{type="sprite-button", name=RemoteView.name_window_close, sprite = "utility/close_white", style="informatron_close_button", tooltip={"space-exploration.exit-remote-view"}}
  close.style.width = 28
  close.style.height = 28

  local system_toggles_table = main.add{ type="table", name="system_toggles_table", column_count=3, draw_horizontal_lines=false}
  system_toggles_table.style.horizontally_stretchable = true
  system_toggles_table.style.column_alignments[1] = "left"
  system_toggles_table.style.column_alignments[2] = "right"
  system_toggles_table.style.column_alignments[3] = "right"
  system_toggles_table.style.top_margin = 5

  local system_map_button = system_toggles_table.add{ type="button", name=RemoteView.name_button_system_map, style="se_generic_button", caption = ""}
  --system_map_button.style.horizontally_stretchable = true
  --system_map_button.style.width = 160
  system_map_button.style.left_padding = 4
  system_map_button.style.right_padding = 4
  system_map_button.style.height = 36

  local toggles_flow = system_toggles_table.add{type="flow", name=MapView.name_toggles}
  toggles_flow.style.horizontally_stretchable = true
  toggles_flow.style.horizontal_align = "right"

  local show_resources = toggles_flow.add{type="sprite-button", name=MapView.name_button_show_resources, sprite = "entity/stone", style="se_generic_square_button", tooltip={"space-exploration.remote-view-show-hide-resources"}}
  show_resources.style.width = 32
  show_resources.style.height = 32
  local show_stats = toggles_flow.add{type="sprite-button", name=MapView.name_button_show_stats, sprite = "entity/"..Landingpad.name_rocket_landing_pad, style="se_generic_square_button", tooltip={"space-exploration.remote-view-show-hide-stats"}}
  show_stats.style.width = 32
  show_stats.style.height = 32
  local show_anchor_info = toggles_flow.add{type="sprite-button", name=MapView.name_button_show_anchor_info, sprite = "virtual-signal/se-spaceship", style="se_generic_square_button", tooltip={"space-exploration.remote-view-show-hide-anchor-info"}}
  show_anchor_info.style.width = 32
  show_anchor_info.style.height = 32
  show_anchor_info.style.right_margin = 10
  local show_danger_zones = toggles_flow.add{type="sprite-button", name=MapView.name_button_show_danger_zones, sprite="utility/warning_icon", style="se_generic_square_button", tooltip={"space-exploration.remote-view-show-hide-danger-zones"}}
  show_danger_zones.style.width = 32
  show_danger_zones.style.height = 32
  show_danger_zones.style.right_margin = 10

  local history_flow = system_toggles_table.add{type="flow", name="history_flow"}
  history_flow.style.horizontally_stretchable = true
  history_flow.style.horizontal_align = "right"

  local history_delete = history_flow.add{
    type="sprite-button",
    name=RemoteView.name_button_history_delete,
    sprite = "utility/trash_white",
    style="se_generic_square_button",
    tooltip={"space-exploration."..RemoteView.name_button_history_delete}
  }
  history_delete.style.width = 32
  history_delete.style.height = 32
  history_delete.style.padding = 4
  local history_prev = history_flow.add{
    type="button",
    name= RemoteView.name_button_history_previous,
    caption = "←",
    style="se_generic_square_button",
    tooltip={"space-exploration."..RemoteView.name_button_history_previous}
  }
  history_prev.style.width = 32
  history_prev.style.height = 32
  local history_next = history_flow.add{
    type="button",
    name= RemoteView.name_button_history_next,
    caption = "→",
    style="se_generic_square_button",
    tooltip={"space-exploration."..RemoteView.name_button_history_next}
  }
  history_next.style.width = 32
  history_next.style.height = 32


  local currently_viewing_label = main.add{type="label", name="currently_viewing_label", caption={"space-exploration.remote-view-currently-viewing"}} -- left
  currently_viewing_label.style.font_color = {r=0.5,g=0.5,b=0.5}

  local currently_viewing_frame = main.add{type="frame", name="currently_viewing_frame", style="informatron_inside_deep_frame"}
  currently_viewing_frame.style.horizontally_stretchable = true
  --currently_viewing_frame.style.width = 280
  currently_viewing_frame.style.padding = 10
  currently_viewing_frame.style.top_padding = 6

  local currently_viewing_table = currently_viewing_frame.add{type="table", name="currently_viewing_table", column_count=2, draw_horizontal_lines=false}
  currently_viewing_table.style.horizontally_stretchable = true
  --currently_viewing_frame.style.width = 280
  currently_viewing_table.style.column_alignments[1] = "left"
  currently_viewing_table.style.column_alignments[2] = "right"

  local currently_viewing_path = currently_viewing_table.add{type="flow", name="currently_viewing_path", direction="horizontal"} -- right
  --currently_viewing_path.style.horizontally_stretchable = true -- this cuts off the label if both sides go to 50% size

  local currently_viewing_value = currently_viewing_table.add{type="label", name="currently_viewing_value", style = "heading_2_label"} -- right
  currently_viewing_value.style.horizontally_stretchable = true

  Pin.gui_open (player)
  RemoteView.gui_update (player)
end

function RemoteView.gui_make_entity_back_button (player, entity)
  local root = player.gui.left[RemoteView.name_gui_root]
  if root then
    if root.back_container then
      root.back_container.destroy()
    end
    local back_container = root.add{
      type = "flow",
      name = "back_container",
      direction = "horizontal"
    }
    local back = back_container.add{
      type = "button",
      name = "canel_activity",
      caption = {"space-exploration.simple-a-b-space", "[img=entity/"..entity.name.."]", {"space-exploration.back"}},
      style="back_button",
      tooltip= {"space-exploration.simple-a-b-space",  {"space-exploration.back-to"}, {"entity-name."..entity.name}},
      tags = {
        se_action = "go_to_entity_and_select",
        name = entity.name,
        surface_index = entity.surface.index,
        position = entity.position,
      }
    }
    back.style.top_margin = 10
  end
end

function RemoteView.stop (player)
  player.cheat_mode = false
  local playerdata = get_make_playerdata(player)
  -- exit remote view
  if playerdata.remote_view_active then
    playerdata.remote_view_active = nil
    playerdata.remote_view_activity = nil

    local location_reference = Location.make_reference(Zone.from_surface(player.surface), player.position, nil)
    RemoteView.add_history(player, location_reference, true)

    RemoteView.gui_close(player)
    MapView.stop_map(player)

    if playerdata.pre_nav_permission_group and playerdata.pre_nav_permission_group.valid and playerdata.pre_nav_permission_group.name ~= RemoteView.name_permission_group then
      player.permission_group = playerdata.pre_nav_permission_group
    else
      player.permission_group = nil
    end
    playerdata.pre_nav_permission_group = nil
    if playerdata.character and playerdata.character.valid then
      if playerdata.anchor_scouting_for_spaceship_index then
        player.set_controller{type = defines.controllers.ghost}
        playerdata.character.color = player.color
      else
        player.teleport(playerdata.character.position, playerdata.character.surface)
        player.set_controller{type = defines.controllers.character, character = playerdata.character}
      end
    elseif not player.character then
      Respawn.die(player)
    end
  end
end

function RemoteView.add_history(player, location_reference, force_to_end)
  if not location_reference then return end

  local playerdata = get_make_playerdata(player)
  if not playerdata.location_history then
    playerdata.location_history = {}
    playerdata.location_history.references = {location_reference}
    playerdata.location_history.current_pointer = 1
  else

    -- if back in history, clear any skipped forward
    if not force_to_end then
      for i = playerdata.location_history.current_pointer + 1, #playerdata.location_history.references do
        playerdata.location_history.references[i] = nil
      end
    end

     -- don't add duplicate
    if #playerdata.location_history.references > 0 then
      local last_ref = playerdata.location_history.references[#playerdata.location_history.references]
      --Log.trace(serpent.block(last_ref))
      --Log.trace(serpent.block(location_reference))
      if last_ref.type == location_reference.type and last_ref.index == location_reference.index then
        -- same zone, maybe have a setting to not have multiple history events on the same zone.
        if last_ref.position == nil or last_ref.name == nil then
          -- replace the postionless location
          playerdata.location_history.references[#playerdata.location_history.references] = location_reference
        elseif location_reference.position and Util.vectors_delta_length(last_ref.position, location_reference.position) > 1 then
          -- add different position
          table.insert(playerdata.location_history.references, location_reference)
        end
      else -- different zone, always add
        table.insert(playerdata.location_history.references, location_reference)
      end
    else
      table.insert(playerdata.location_history.references, location_reference)
    end

    -- fit in max history
    while #playerdata.location_history.references > RemoteView.max_history do
      table.remove(playerdata.location_history.references, 1)
    end

    -- update pointer
    playerdata.location_history.current_pointer = #playerdata.location_history.references
  end
end

--[[
Makes the data valid.
Deletes histories to deleted surfaces/spaceships
]]
function RemoteView.make_history_valid(player)
  local playerdata = get_make_playerdata(player)
  if playerdata.location_history then
    local old_history = playerdata.location_history
    playerdata.location_history = nil
    for _, location_reference in pairs(old_history.references) do
      if Location.from_reference(location_reference) then
        RemoteView.add_history(player, location_reference, true)
      end
    end
  end
end

function RemoteView.history_goto_next(player)
  local location_reference = RemoteView.history_next(player)
  if location_reference then
    local playerdata = get_make_playerdata(player)
    playerdata.location_history.current_pointer = playerdata.location_history.current_pointer + 1
    Location.goto_reference(player, location_reference, true)
  end
end

function RemoteView.history_next(player)
  local playerdata = get_make_playerdata(player)
  if not playerdata.location_history then return end
  return playerdata.location_history.references[playerdata.location_history.current_pointer + 1]
end

function RemoteView.history_goto_previous(player)
  local location_reference = RemoteView.history_previous(player)
  if location_reference then
    local playerdata = get_make_playerdata(player)
    playerdata.location_history.current_pointer = playerdata.location_history.current_pointer - 1
    Location.goto_reference(player, location_reference, true)
  end
end
function RemoteView.history_previous(player)
  local playerdata = get_make_playerdata(player)
  if not playerdata.location_history then return end
  return playerdata.location_history.references[playerdata.location_history.current_pointer - 1]
end

function RemoteView.history_delete_all(player)
  local playerdata = get_make_playerdata(player)
  if not playerdata.location_history then return end
  local current_history = nil
  if playerdata.location_history.current_pointer > 0 and playerdata.location_history.references then
    current_history = playerdata.location_history.references[playerdata.location_history.current_pointer]
  end
  playerdata.location_history.current_pointer = 0
  for key, value in pairs(playerdata.location_history.references) do
    playerdata.location_history.references[key] = nil
  end
  if current_history then
    playerdata.location_history.current_pointer = 1
    table.insert(playerdata.location_history.references, current_history)
  end
end

function RemoteView.history_goto_last(player)
  local playerdata = get_make_playerdata(player)
  if playerdata.location_history.references and playerdata.location_history.references then
    local location_reference = playerdata.location_history.references[#playerdata.location_history.references]
    if location_reference then
      Location.goto_reference(player, location_reference, true)
    end
  end
end

function RemoteView.is_unlocked_force(force_name)
  if global.debug_view_all_zones or
   (global.forces[force_name]
    and global.forces[force_name].satellites_launched > 0) then
      return true
  end
  return false
end
function RemoteView.is_unlocked(player)
  if global.debug_view_all_zones or
   (global.forces[player.force.name]
    and global.forces[player.force.name].satellites_launched > 0) then
      return true
  end
  return false
end

function RemoteView.start (player, zone, position, location_name, freeze_history)
  -- dont let the player enter nav view in the editor because it breaks
  if player.controller_type == defines.controllers.editor then return game.print({"space-exploration.cannot-open-nav-view-in-editor"}) end

  if RemoteView.is_unlocked(player) then
    local playerdata = get_make_playerdata(player)
    Spaceship.stop_anchor_scouting(player)

    local character = player.character
    -- enter remote view
    if not playerdata.remote_view_active then
      playerdata.remote_view_active = true
      if player.permission_group then
        playerdata.pre_nav_permission_group = game.permissions.get_group(player.permission_group.name)
      end
      --player.set_controller{type = defines.controllers.spectator}
      --player.set_controller{type = defines.controllers.ghost}
      player.set_controller{type = defines.controllers.god}
      player.cheat_mode = true
    end

    player.permission_group = RemoteView.player_set_satellite_permissions(player)

    if character then
      playerdata.character = character
      playerdata.character.color = player.color
      -- stop the character from continuing input action (running to doom)
      character.walking_state = {walking = false, direction = defines.direction.south}
      character.riding_state = {acceleration = defines.riding.acceleration.braking, direction = defines.riding.direction.straight}
      character.shooting_state = {state = defines.shooting.not_shooting, position=character.position}
    end

    if not zone then
      zone = Zone.from_surface(player.surface)
    end
    if not zone then
      local vault = Ancient.vault_from_surface(player.surface)
      if vault then
        zone = Zone.from_zone_index(vault.zone_index)
      end
    end
    if (not zone) and not playerdata.remote_view_active_map then
      zone = Zone.get_default()
    end
    if zone then
      if not freeze_history then
        local location_reference = Location.make_reference(zone, position, location_name)
        RemoteView.add_history(player, location_reference)
      end
      playerdata.remote_view_current_zone = zone
      playerdata.remote_view_active_map = nil
      if zone.type == "spaceship" then
        local spaceship = zone
        local surface = Spaceship.get_current_surface(zone)
        if player.surface ~= surface then
          if position then
            player.teleport(position, surface)
          elseif spaceship.console and spaceship.console.valid then
            player.teleport(spaceship.console.position, spaceship.console.surface)
          else
            if spaceship.known_tiles_average_x and spaceship.known_tiles_average_y then
              player.teleport({spaceship.known_tiles_average_x,spaceship.known_tiles_average_y}, surface)
            else
              player.teleport({0,0}, surface)
            end
          end
        elseif position then
          player.teleport(position)
        end
      else
        local surface = Zone.get_make_surface(zone)
        if not playerdata.surface_positions or not playerdata.surface_positions[surface.index] then
          player.force.chart(surface, util.position_to_area({x = 0, y = 0}, 256))
        elseif not position then
          position = playerdata.surface_positions[zone.surface_index]
        end
        if not position then
          position = {x = 0, y = 0}
        end
        player.teleport(position, surface)
        Zone.apply_markers(zone) -- in case the surface exists
      end
    else
      playerdata.remote_view_current_zone = nil
      playerdata.remote_view_active_map = nil
    end

    -- add zone select gui
    RemoteView.gui_open(player)
  else
    player.print({"space-exploration.remote-view-requires-satellite"})
  end
end

function RemoteView.is_active (player)
  return get_make_playerdata(player).remote_view_active == true
end

function RemoteView.toggle (player)
  if RemoteView.is_active(player) then
    RemoteView.stop(player)
  else
    RemoteView.start(player)
  end
end

function RemoteView.on_gui_click (event)
  if not (event.element and event.element.valid) then return end
  local element = event.element
  local player = game.players[event.player_index]

  if event.element.name == RemoteView.name_button_overhead_satellite then
    RemoteView.toggle(player) return
  end

  if Pin.on_gui_click(event) then
    return
  end

  if element.tags and element.tags.se_action == "go_to_entity_and_select" then
    local surface = game.surfaces[element.tags.surface_index]
    if surface then
      local zone = Zone.from_surface(surface)
      if zone then
        player.cursor_stack.clear()
        local entity = surface.find_entity(element.tags.name, element.tags.position)
        RemoteView.start(player, zone, element.tags.position)
        if entity then player.opened = entity end
        return
      end
    end
    RemoteView.stop(player)
    return
  end

  local root = gui_element_or_parent(element, RemoteView.name_gui_root)
  if root then -- remote view
    if element.name == RemoteView.name_window_close then
      RemoteView.stop(player)
    elseif element.name == RemoteView.name_button_zonelist then
      Zonelist.toggle_main_window(event.player_index)
    elseif element.name == RemoteView.name_button_system_map then
      local zone = Zone.from_surface(player.surface)
      if zone then
        local parent_star = Zone.get_star_from_child(zone)
        if parent_star then
          MapView.start_system_map(player, parent_star)
        else
          MapView.start_interstellar_map(player)
        end
      elseif MapView.get_current_system(player) then
        --RemoteView.start(player, MapView.get_current_system(player))
        RemoteView.history_goto_previous(player)
      else
        RemoteView.stop(player)
      end
    elseif element.parent and element.parent.name == MapView.name_toggles then
      MapView.toggle_setting(player, element.name)
      RemoteView.gui_update(player)
    elseif element.tags.action ==  RemoteView.action_zone_click then
      local zone = Zone.from_zone_index(element.tags.zone_index)
      if zone then RemoteView.start (player, zone) end
    elseif element.name == RemoteView.name_button_history_delete then
      RemoteView.history_delete_all(player)
      RemoteView.gui_update(player)
    elseif element.name == RemoteView.name_button_history_previous then
      RemoteView.history_goto_previous(player)
    elseif element.name == RemoteView.name_button_history_next then
      RemoteView.history_goto_next(player)
    end
    return
  end
end
Event.addListener(defines.events.on_gui_click, RemoteView.on_gui_click)

function RemoteView.on_lua_shortcut (event)
  if event.player_index
    and game.players[event.player_index]
    and game.players[event.player_index].connected then

      if event.prototype_name == RemoteView.name_shortcut then
        RemoteView.toggle(game.players[event.player_index])
      end

  end
end
Event.addListener(defines.events.on_lua_shortcut, RemoteView.on_lua_shortcut)

function RemoteView.on_remote_view_keypress (event)
  if event.player_index
    and game.players[event.player_index]
    and game.players[event.player_index].connected
  then
    local player = game.players[event.player_index]
    if event.input_name == RemoteView.name_event then
      RemoteView.toggle(player)
    elseif event.input_name == RemoteView.name_event_next then
      RemoteView.history_goto_next(player)
    elseif event.input_name == RemoteView.name_event_previous then
      RemoteView.history_goto_previous(player)
    end
  end
end
Event.addListener(RemoteView.name_event, RemoteView.on_remote_view_keypress)
Event.addListener(RemoteView.name_event_next, RemoteView.on_remote_view_keypress)
Event.addListener(RemoteView.name_event_previous, RemoteView.on_remote_view_keypress)


function RemoteView.on_remote_view_pins_keypress (event)
  if event.player_index
    and game.players[event.player_index]
    and game.players[event.player_index].connected
  then
    Pin.window_toggle(game.players[event.player_index])
  end
end
Event.addListener(RemoteView.name_pins_event, RemoteView.on_remote_view_pins_keypress)

function RemoteView.on_player_clicked_gps_tag (event)
  local player = game.players[event.player_index]
  if not player then return end
  local surface = game.surfaces[event.surface]
  if surface then
    local zone = Zone.from_surface(surface)
    if not zone then
      if event.surface ~= player.surface.name then
        return player.print({"space-exploration.gps_no_zone"})
      end
    else
      if not RemoteView.is_unlocked(player) then
        if event.surface ~= player.surface.name then
          return player.print({"space-exploration.gps_requires_satellite"})
        else
          -- default to map shift with no message
        end
      else
        if Zone.is_visible_to_force(zone, player.force.name) then
          local playerdata = get_make_playerdata(player)
          RemoteView.start(player, zone, event.position)
          player.close_map()
          player.zoom = 0.3
        else
          player.print({"space-exploration.gps_undiscovered"})
        end
      end
    end
  else
    player.print({"space-exploration.gps_invalid"})
  end
end
Event.addListener(defines.events.on_player_clicked_gps_tag, RemoteView.on_player_clicked_gps_tag)

function RemoteView.update_overhead_button(player_index)
  local player = game.players[player_index]
  local button_flow = mod_gui.get_button_flow(player)
  if button_flow then
    if settings.get_player_settings(player)[RemoteView.name_setting_overhead_satellite].value == true then
      if not button_flow[RemoteView.name_button_overhead_satellite] then
        button_flow.add{type="sprite-button", name=RemoteView.name_button_overhead_satellite, sprite="virtual-signal/"..mod_prefix.."remote-view", tooltip = {"space-exploration.remote-view"}}
      end
    else
      if button_flow[RemoteView.name_button_overhead_satellite] then
        button_flow[RemoteView.name_button_overhead_satellite].destroy()
      end
    end
  end
end

function RemoteView.on_runtime_mod_setting_changed(event)
  for _, player in pairs(game.connected_players) do
    RemoteView.update_overhead_button(player.index)
  end
end
Event.addListener(defines.events.on_runtime_mod_setting_changed, RemoteView.on_runtime_mod_setting_changed)

function RemoteView.on_configuration_changed()
  for _, player in pairs(game.connected_players) do
    RemoteView.update_overhead_button(player.index)
  end
end
Event.addListener("on_configuration_changed", RemoteView.on_configuration_changed, true)

return RemoteView

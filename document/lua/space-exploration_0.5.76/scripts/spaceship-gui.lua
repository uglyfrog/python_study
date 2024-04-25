local SpaceshipGUI = {}

SpaceshipGUI.name_spaceship_gui_root = mod_prefix.."spaceship-gui"
SpaceshipGUI.name_window_close = "spaceship_close_button"

function SpaceshipGUI.gui_open_panel(player, spaceship, flow, name)
  if name == "integrity" then
    SpaceshipGUI.gui_open_panel_integrity(player, spaceship, flow)
  elseif name == "speed" then
    SpaceshipGUI.gui_open_panel_speed(player, spaceship, flow)
  elseif name == "position" then
    SpaceshipGUI.gui_open_panel_position(player, spaceship, flow)
  elseif name == "destination" then
    SpaceshipGUI.gui_open_panel_destination(player, spaceship, flow)
  else
    Log.trace('SpaceshipGUI.gui_open_panel invalid name '..name)
  end
end

function SpaceshipGUI.gui_open_panel_integrity(player, spaceship, flow_integrity)
  if flow_integrity['panel_integrity'] then return end

  local panel_integrity = flow_integrity.add{ type="frame", name="panel_integrity", direction="vertical", style="b_inner_frame"}
  panel_integrity.style.horizontally_stretchable = true

  local bar = panel_integrity.add{ type="progressbar", name="structural_integrity_progress", size = 300, value=0, style="spaceship_progressbar_integrity"}
  bar.style.horizontally_stretchable  = true
  local label = panel_integrity.add{ type="label", name="structural_integrity", caption={"space-exploration.spaceship-structural-stress-hull", ""}}
  label.style.top_margin = -26
  label.style.left_margin = 5
  label.style.font = "default-bold"
  label.style.font_color = {}

  local bar = panel_integrity.add{ type="progressbar", name="container_integrity_progress", size = 300, value=0, style="spaceship_progressbar_integrity"}
  bar.style.horizontally_stretchable  = true
  local label = panel_integrity.add{ type="label", name="container_integrity", caption={"space-exploration.spaceship-structural-stress-container", ""}}
  label.style.top_margin = -26
  label.style.left_margin = 5
  label.style.font = "default-bold"
  label.style.font_color = {}

  local integrity_status = panel_integrity.add{ type="label", name="integrity-status", caption=""}
  integrity_status.style.width = 300
  integrity_status.style.single_line = false

  panel_integrity.add{ type="button", name="start-integrity-check", caption={"space-exploration.spaceship-button-start-integrity-check"}}
end

function SpaceshipGUI.gui_open_panel_speed(player, spaceship, flow_speed)
  if flow_speed['panel_speed'] then return end

  local panel_speed = flow_speed.add{ type="frame", name="panel_speed", direction="vertical", style="b_inner_frame"}
  panel_speed.style.horizontally_stretchable = true

  local target_speed_flow = panel_speed.add{ type="flow", name="target-speed-flow"}
  local label = target_speed_flow.add{type="label", name="target-speed-label", caption={"space-exploration.spaceship-target-speed"}}
  local target_speed_control_flow = panel_speed.add{ type="flow", name="target-speed-control-flow"}

  local textfield

  local normal_flow = target_speed_control_flow.add{type="flow", name="target-speed-normal-flow", direction="horizontal",
    tooltip={"space-exploration.spaceship-target-speed-normal-tooltip", SpaceshipObstacles.default_asteroid_density*100}}
  normal_flow.add{type="sprite", sprite="virtual-signal/se-star",
    tooltip={"space-exploration.spaceship-target-speed-normal-tooltip", SpaceshipObstacles.default_asteroid_density*100}}
  normal_flow.style.left_margin = 5
  textfield = normal_flow.add{type="textfield", name="normal-speed-textfield", numeric="true",
    tooltip={"space-exploration.spaceship-target-speed-normal-tooltip", SpaceshipObstacles.default_asteroid_density*100}}
  textfield.style.natural_width = 40
  textfield.style.width = 40

  local belt_flow = target_speed_control_flow.add{type="flow", name="target-speed-asteroid-belt-flow", direction="horizontal",
    tooltip={"space-exploration.spaceship-target-speed-asteroid-belt-tooltip", SpaceshipObstacles.asteroid_density_by_zone_type["asteroid-belt"]*100}}
  belt_flow.add{type="sprite", sprite="virtual-signal/se-asteroid-belt",
    tooltip={"space-exploration.spaceship-target-speed-asteroid-belt-tooltip", SpaceshipObstacles.asteroid_density_by_zone_type["asteroid-belt"]*100}}
  belt_flow.style.left_margin = 5
  textfield = belt_flow.add{type="textfield", name="belt-speed-textfield", numeric="true",
    tooltip={"space-exploration.spaceship-target-speed-asteroid-belt-tooltip", SpaceshipObstacles.asteroid_density_by_zone_type["asteroid-belt"]*100}}
  textfield.style.natural_width = 40
  textfield.style.width = 40

  local field_flow = target_speed_control_flow.add{type="flow", name="target-speed-asteroid-field-flow", direction="horizontal",
    tooltip={"space-exploration.spaceship-target-speed-asteroid-field-tooltip", SpaceshipObstacles.asteroid_density_by_zone_type["asteroid-field"]*100}}
  field_flow.add{type="sprite", sprite="virtual-signal/se-asteroid-field",
    tooltip={"space-exploration.spaceship-target-speed-asteroid-field-tooltip", SpaceshipObstacles.asteroid_density_by_zone_type["asteroid-field"]*100}}
  field_flow.style.left_margin = 5
  textfield = field_flow.add{type="textfield", name="field-speed-textfield", numeric="true",
    tooltip={"space-exploration.spaceship-target-speed-asteroid-field-tooltip", SpaceshipObstacles.asteroid_density_by_zone_type["asteroid-field"]*100}}
  textfield.style.natural_width = 40
  textfield.style.width = 40

  local root = panel_speed
  if spaceship.target_speed_normal and root['target-speed-control-flow'] and root['target-speed-control-flow']['target-speed-normal-flow'] and root['target-speed-control-flow']['target-speed-normal-flow']['normal-speed-textfield'] then
    root['target-speed-control-flow']['target-speed-normal-flow']['normal-speed-textfield'].text = tostring(spaceship.target_speed_normal)
  end
  if spaceship.target_speed_belt and root['target-speed-control-flow'] and root['target-speed-control-flow']['target-speed-asteroid-belt-flow'] and root['target-speed-control-flow']['target-speed-asteroid-belt-flow']['belt-speed-textfield'] then
    root['target-speed-control-flow']['target-speed-asteroid-belt-flow']['belt-speed-textfield'].text = tostring(spaceship.target_speed_belt)
  end
  if spaceship.target_speed_field and root['target-speed-control-flow'] and root['target-speed-control-flow']['target-speed-asteroid-field-flow'] and root['target-speed-control-flow']['target-speed-asteroid-field-flow']['field-speed-textfield'] then
    root['target-speed-control-flow']['target-speed-asteroid-field-flow']['field-speed-textfield'].text = tostring(spaceship.target_speed_field)
  end

  local bar = panel_speed.add{ type="progressbar", name="launch_energy_progress", size = 300, value=0, style="spaceship_progressbar_energy"}
  bar.style.horizontally_stretchable  = true
  local label = panel_speed.add{ type="label", name="launch_energy", caption={"space-exploration.spaceship-launch-energy", ""}}
  label.style.top_margin = -26
  label.style.left_margin = 5
  label.style.font = "default-bold"
  label.style.font_color = {}

  local bar = panel_speed.add{ type="progressbar", name="streamline_progress", size = 300, value=0, style="spaceship_progressbar_streamline"}
  bar.style.horizontally_stretchable  = true
  local label = panel_speed.add{ type="label", name="streamline", caption={"space-exploration.spaceship-streamline", ""}}
  label.style.top_margin = -26
  label.style.left_margin = 5
  label.style.font = "default-bold"
  label.style.font_color = {}
end

function SpaceshipGUI.gui_open_panel_position(player, spaceship, flow_position)
  if flow_position['panel_position'] then return end

  local panel_position = flow_position.add{ type="frame", name="panel_position", direction="vertical", style="b_inner_frame"}
  panel_position.style.horizontally_stretchable = true

  local space_distortion = panel_position.add{ type="label", name="anomaly-distance", caption=""}
  space_distortion.style.width = 300
  space_distortion.style.single_line = false

  local stellar_x = panel_position.add{ type="label", name="stellar-x", caption=""}
  stellar_x.style.width = 300
  stellar_x.style.single_line = false

  local stellar_y = panel_position.add{ type="label", name="stellar-y", caption=""}
  stellar_y.style.width = 300
  stellar_y.style.single_line = false

  local star_gravity = panel_position.add{ type="label", name="star-gravity", caption=""}
  star_gravity.style.width = 300
  star_gravity.style.single_line = false

  local planet_gravity = panel_position.add{ type="label", name="planet-gravity", caption=""}
  planet_gravity.style.width = 300
  planet_gravity.style.single_line = false

  local closest_location = panel_position.add{ type="label", name="closest-location", caption=""}
  closest_location.style.width = 300
  closest_location.style.single_line = false

  local asteroid_density = panel_position.add{ type="label", name="asteroid-density", caption=""}
  asteroid_density.style.width = 300
  asteroid_density.style.single_line = false
end

function SpaceshipGUI.gui_open_panel_destination(player, spaceship, flow_destination)
  if flow_destination['panel_destination'] then return end

  local playerdata = get_make_playerdata(player)

  local panel_destination = flow_destination.add{ type="frame", name="panel_destination", direction="vertical", style="b_inner_frame"}
  panel_destination.style.horizontally_stretchable = true


  panel_destination.add{ type="label", name="destination-label", caption={"space-exploration.spaceship-heading-destination"}, style="space_platform_title"}

  panel_destination.add{type="checkbox", name="list-zones-alphabetical", caption={"space-exploration.list-destinations-alphabetically"}, state=playerdata.zones_alphabetical and true or false}

  local filter_container = panel_destination.add{ type="flow", name="filter_flow", direction="horizontal"}
  local filter_field = filter_container.add{ type="textfield", name="filter_list"}
  filter_field.style.width = 275
  local filter_button = filter_container.add{ type = "sprite-button", name="clear_filter", sprite="utility/search_icon", tooltip={"space-exploration.clear-filter"},}
  filter_button.style.left_margin = 5
  filter_button.style.width = 28
  filter_button.style.height = 28

  local destination_zone = Spaceship.get_destination_zone(spaceship)
  if not destination_zone then destination_zone = Zone.from_zone_index(spaceship.zone_index) end
  if not destination_zone then destination_zone = Zone.find_nearest_zone(
    spaceship.space_distortion,
    spaceship.stellar_position,
    spaceship.star_gravity_well,
    spaceship.planet_gravity_well)
  end
  local list, selected_index, values = Zone.dropdown_list_zone_destinations(spaceship.force_name, destination_zone, playerdata.zones_alphabetical)
  local zones_dropdown = panel_destination.add{ type="drop-down", name="spaceship-list-zones", items=list, selected_index=selected_index}
  zones_dropdown.style.horizontally_stretchable  = true
  player_set_dropdown_values(player, "spaceship-list-zones", values)

  panel_destination.add{ type="label", name="travel-time", caption=""}

  local travel_status = panel_destination.add{ type="label", name="travel-status", caption=""}
  travel_status.style.width = 300
  travel_status.style.single_line = false

  spaceship.distance_to_destination = Spaceship.get_distance_to_destination(spaceship)
end

--- Opens the spaceship gui for a player for a certain spaceship
---@param player any the player
---@param spaceship any the spaceship
function SpaceshipGUI.gui_open(player, spaceship)
  SpaceshipGUI.gui_close(player)
  if not spaceship then
    player.print({"space-exploration.spaceship_try_replace_console"})
    return
  end
  local gui = player.gui.left

  local container = gui.add{
    type = "frame",
    name = SpaceshipGUI.name_spaceship_gui_root,
    style="space_platform_container",
    direction="vertical",
    -- use gui element tags to store a reference to what spaceship this gui is displaying/controls
    tags = {
      index = spaceship.index
    }
  }


  local spaceship_title_table = container.add {
    type = "table",
    name = "spaceship_title_table",
    column_count = 3,
    draw_horizontal_lines = false,
  }
  spaceship_title_table.style.horizontally_stretchable = true
  spaceship_title_table.style.column_alignments[1] = "left"
  spaceship_title_table.style.column_alignments[2] = "right"
  spaceship_title_table.style.column_alignments[3] = "right"

  local spaceship_title_flow = spaceship_title_table.add {
    type = "flow",
    name="spaceship_title_flow",
    direction = "horizontal"
  }
  spaceship_title_flow.style.vertically_stretchable = false

  local spaceship_icon = spaceship_title_flow.add {
    type = "label",
    caption = "[img=virtual-signal/se-spaceship]  ",
    style = "frame_title",
    ignored_by_interaction = true
  }
  local spaceship_title_label = spaceship_title_flow.add {
    type = "label",
    name = "show-name",
    caption = {"space-exploration.spaceship-name-the", spaceship.name},
    style = "frame_title",
    ignored_by_interaction = true
  }
  spaceship_title_label.style.vertically_stretchable = true
  spaceship_title_label.style.horizontally_squashable = true

  local spaceship_title_empty = spaceship_title_table.add {
    type = "empty-widget",
    style = "draggable_space",
    ignored_by_interaction = true
  }
  spaceship_title_empty.style.horizontally_stretchable = true
  spaceship_title_empty.style.left_margin = 4
  spaceship_title_empty.style.right_margin = 0
  spaceship_title_empty.style.height = 24

  local spaceship_title_buttons = spaceship_title_table.add {
    type = "flow",
    name = "spaceship_title_buttons",
    direction = "horizontal"
  }
  local spaceship_title_rename = spaceship_title_buttons.add {
    type="sprite-button",
    name="rename",
    sprite = "utility/rename_icon_normal",
    style="informatron_close_button",
    tooltip={"space-exploration.rename-something", {"entity-name.se-spaceship-console"}},
  }
  spaceship_title_rename.style.width = 28
  spaceship_title_rename.style.height = 28

  local spaceship_title_informatron = spaceship_title_buttons.add {
    type="sprite-button",
    name="goto_informatron_spaceships",
    sprite = "virtual-signal/informatron",
    style="informatron_close_button",
    tooltip={"space-exploration.informatron-open-help"}
  }
  spaceship_title_informatron.style.width = 28
  spaceship_title_informatron.style.height = 28

  local spaceship_title_close = spaceship_title_buttons.add {
    type="sprite-button",
    name=SpaceshipGUI.name_window_close,
    sprite = "utility/close_white",
    style="informatron_close_button",
    tooltip={"space-exploration.close-instruction-only-confirm"}
  }
  spaceship_title_close.style.width = 28
  spaceship_title_close.style.height = 28


  local flow_integrity = container.add{ type="flow", name="flow_integrity", direction="vertical"}
  local button_integrity = flow_integrity.add{ type="button", name="button_integrity", tags={collapse="panel_integrity"}, style = "se_generic_button"}
  button_integrity.style.horizontally_stretchable = true
  button_integrity.style.top_margin = 10
  button_integrity.style.padding = 0
  button_integrity.style.left_padding = 5
  button_integrity.style.horizontal_align = "left"


  local flow_speed = container.add{ type="flow", name="flow_speed", direction="vertical"}
  local button_speed = flow_speed.add{ type="button", name="button_speed", tags={collapse="panel_speed"}, style = "se_generic_button"}
  button_speed.style.horizontally_stretchable = true
  button_speed.style.top_margin = 10
  button_speed.style.padding = 0
  button_speed.style.left_padding = 5
  button_speed.style.horizontal_align = "left"

  local flow_position = container.add{ type="flow", name="flow_position", direction="vertical"}
  local button_position = flow_position.add{ type="button", name="button_position", tags={collapse="panel_position"}, style = "se_generic_button"}
  button_position.style.horizontally_stretchable = true
  button_position.style.top_margin = 10
  button_position.style.padding = 0
  button_position.style.left_padding = 5
  button_position.style.horizontal_align = "left"



  local flow_destination = container.add{ type="flow", name="flow_destination", direction="vertical"}
  local button_destination = flow_destination.add{ type="button", name="button_destination", tags={collapse="panel_destination"}, style = "se_generic_button"}
  button_destination.style.horizontally_stretchable = true
  button_destination.style.top_margin = 10
  button_destination.style.padding = 0
  button_destination.style.left_padding = 5
  button_destination.style.horizontal_align = "left"


  container.add{ type="flow", name="action-flow", direction="horizontal"}

  container.add{ type="flow", name="back-flow", direction="horizontal"}

  SpaceshipGUI.update_panel_states(player, spaceship, container)
  SpaceshipGUI.gui_update(player)
end

function SpaceshipGUI.gui_update(player)
  local root = player.gui.left[SpaceshipGUI.name_spaceship_gui_root]
  if root and root.tags and root.tags.index then
    local spaceship = Spaceship.from_index(root.tags.index)

    if spaceship then
      local playerdata = get_make_playerdata(player)
      local energy_required = Spaceship.get_launch_energy_cost(spaceship)

      if root["flow_integrity"] and root["flow_integrity"]["panel_integrity"] then
        local panel = root["flow_integrity"]["panel_integrity"]
        if panel["structural_integrity"] and panel["structural_integrity_progress"] then
          if spaceship.integrity_stress_structure and spaceship.integrity_stress_structure_max and spaceship.integrity_limit then
            panel["structural_integrity"].caption={"space-exploration.spaceship-structural-stress-hull", string.format("%.2f", spaceship.integrity_stress_structure) .. " ["..string.format("%.2f", spaceship.integrity_stress_structure_max) .. "] / " .. spaceship.integrity_limit}
            panel["structural_integrity_progress"].value = math.min(1, spaceship.integrity_stress_structure / spaceship.integrity_limit)

            local structural_integrity_tooltip = {"space-exploration.spaceship-structural-stress-hull-tooltip", string.format("%.2f", spaceship.integrity_stress_structure), string.format("%.2f", spaceship.integrity_stress_structure_max), spaceship.integrity_limit}
            panel["structural_integrity"].tooltip=structural_integrity_tooltip
            panel["structural_integrity_progress"].tooltip=structural_integrity_tooltip
          else
            panel["structural_integrity"].caption={"space-exploration.spaceship-structural-stress-hull-invalid"}
            panel["structural_integrity_progress"].value = 0
            panel["structural_integrity"].tooltip=nil
            panel["structural_integrity_progress"].tooltip=nil
          end
        end

        if panel["container_integrity"] and panel["container_integrity_progress"] then
          if spaceship.integrity_stress_container and spaceship.integrity_limit then
            panel["container_integrity"].caption={"space-exploration.spaceship-structural-stress-container", string.format("%.2f", spaceship.integrity_stress_container).. " / " .. spaceship.integrity_limit}
            panel["container_integrity_progress"].value = math.min(1, spaceship.integrity_stress_container / spaceship.integrity_limit)

            local container_integrity_tooltip = {"space-exploration.spaceship-structural-stress-container-tooltip", string.format("%.2f", spaceship.integrity_stress_container), spaceship.integrity_limit}
            panel["container_integrity"].tooltip=container_integrity_tooltip
            panel["container_integrity_progress"].tooltip=container_integrity_tooltip
          else
            panel["container_integrity"].caption={"space-exploration.spaceship-structural-stress-container-invalid"}
            panel["container_integrity_progress"].value = 0
            panel["container_integrity"].tooltip=nil
            panel["container_integrity_progress"].tooltip=nil
          end
        end

        if panel["integrity-status"] then
          --root["integrity-status"].caption="Integrity Status: "
          --  .. (spaceship.integrity_valid and "Valid: " or "Invalid: ")
          --  .. (spaceship.check_message or  "")
          if spaceship.integrity_valid then
            panel["integrity-status"].caption = {"space-exploration.spaceship-integrity-status-valid", (spaceship.check_message or  "")}
          else
            panel["integrity-status"].caption = {"space-exploration.spaceship-integrity-status-invalid", (spaceship.check_message or  "")}
          end
        end
      end

      if root["flow_speed"] and root["flow_speed"]["panel_speed"] then
        local panel = root["flow_speed"]["panel_speed"]

        if panel["target-speed-flow"] and panel["target-speed-flow"]["target-speed-label"] then
          if spaceship.target_speed_source == "manual-override" then
            panel["target-speed-flow"]["target-speed-label"].caption = {"space-exploration.spaceship-target-speed-manual-override", "0"}
          elseif not spaceship.target_speed then
            panel["target-speed-flow"]["target-speed-label"].caption = {"space-exploration.spaceship-target-speed-unlimited"}
          else
            if spaceship.target_speed_source == "circuit" then
              panel["target-speed-flow"]["target-speed-label"].caption = {"space-exploration.spaceship-target-speed-circuit", math.floor(spaceship.target_speed)}
            elseif spaceship.target_speed_source == "asteroid-belt" then
              panel["target-speed-flow"]["target-speed-label"].caption = {"space-exploration.spaceship-target-speed-asteroid-belt", spaceship.target_speed}
            elseif spaceship.target_speed_source == "asteroid-field" then
              panel["target-speed-flow"]["target-speed-label"].caption = {"space-exploration.spaceship-target-speed-asteroid-field", spaceship.target_speed}
            else
              panel["target-speed-flow"]["target-speed-label"].caption = {"space-exploration.spaceship-target-speed-normal", spaceship.target_speed}
            end
          end
        end
        if panel["target-speed-control-flow"] then
          if panel['target-speed-control-flow']['target-speed-normal-flow'] and panel['target-speed-control-flow']['target-speed-normal-flow']['normal-speed-textfield'] then
            local text = spaceship.target_speed_normal and tostring(spaceship.target_speed_normal) or ""
            if panel['target-speed-control-flow']['target-speed-normal-flow']['normal-speed-textfield'].text ~= text then
              panel['target-speed-control-flow']['target-speed-normal-flow']['normal-speed-textfield'].text = text
            end
          end
          if panel['target-speed-control-flow']['target-speed-asteroid-belt-flow'] and panel['target-speed-control-flow']['target-speed-asteroid-belt-flow']['belt-speed-textfield'] then
            local text = spaceship.target_speed_belt and tostring(spaceship.target_speed_belt) or ""
            if panel['target-speed-control-flow']['target-speed-asteroid-belt-flow']['belt-speed-textfield'].text ~= text then
              panel['target-speed-control-flow']['target-speed-asteroid-belt-flow']['belt-speed-textfield'].text = text
            end
          end
          if panel['target-speed-control-flow']['target-speed-asteroid-field-flow'] and panel['target-speed-control-flow']['target-speed-asteroid-field-flow']['field-speed-textfield'] then
            local text = spaceship.target_speed_field and tostring(spaceship.target_speed_field) or ""
            if panel['target-speed-control-flow']['target-speed-asteroid-field-flow']['field-speed-textfield'].text ~= text then
              panel['target-speed-control-flow']['target-speed-asteroid-field-flow']['field-speed-textfield'].text = text
            end
          end
        end

        if panel["launch_energy"] then
          if spaceship.zone_index then
            if energy_required and spaceship.launch_energy then
              panel["launch_energy"].caption={"space-exploration.spaceship-launch-energy", Util.format_energy(spaceship.launch_energy) .. " / " .. Util.format_energy(energy_required, true)}
              panel["launch_energy_progress"].value = math.min(1, spaceship.launch_energy / energy_required)

              local launch_energy_tooltip = {"space-exploration.spaceship-launch-energy-tooltip", Util.format_energy(spaceship.launch_energy), Util.format_energy(energy_required, true)}
              panel["launch_energy"].tooltip=launch_energy_tooltip
              panel["launch_energy_progress"].tooltip=launch_energy_tooltip
            else
              panel["launch_energy"].caption={"space-exploration.spaceship-launch-energy-invalid"}
              panel["launch_energy_progress"].value = 0
              panel["launch_energy"].tooltip=nil
              panel["launch_energy_progress"].tooltip=nil
            end
          else
            -- repurpose for speed
            if spaceship.speed > 0 then
              panel["launch_energy"].caption={"space-exploration.spaceship-speed", string.format("%.2f", spaceship.speed or 0) .. " / " .. string.format("%.2f", spaceship.max_speed or 0)}
              panel["launch_energy_progress"].value = math.min(1, spaceship.speed / (spaceship.max_speed or spaceship.speed))
            else
              panel["launch_energy"].caption={"space-exploration.spaceship-speed", " 0 / " .. string.format("%.2f", spaceship.max_speed or 0)}
              panel["launch_energy_progress"].value = 0
            end
          end
        end
        if panel["streamline"] and panel["streamline_progress"] then
          if spaceship.streamline then
            panel["streamline"].caption={"space-exploration.spaceship-streamline", string.format("%.2f",(spaceship.streamline or 0) * 100).."%"}
            panel["streamline_progress"].value = spaceship.streamline or 0

            local streamline_tooltip = {"space-exploration.spaceship-streamline-tooltip", string.format("%.2f",(spaceship.streamline or 0) * 100).."%", "100.00%"}
            panel["streamline"].tooltip=streamline_tooltip
            panel["streamline_progress"].tooltip=streamline_tooltip
          end
        end
      end

      if root["flow_position"] and root["flow_position"]["panel_position"] then
        local panel = root["flow_position"]["panel_position"]
        if spaceship.space_distortion > 0 then
          --root["anomaly-distance"].caption = "Spacial Distortion: " .. string.format("%.2f", spaceship.space_distortion * Zone.travel_cost_space_distortion)
          panel["anomaly-distance"].caption = {"space-exploration.spaceship-location-spatial-distortion", string.format("%.2f", spaceship.space_distortion * Zone.travel_cost_space_distortion)}
        else
          panel["anomaly-distance"].caption = ""
        end
        if spaceship.space_distortion > 0.05 then
          panel["stellar-x"].caption = ""
          panel["stellar-y"].caption = ""
          panel["star-gravity"].caption = ""
          panel["planet-gravity"].caption = ""
        else
          --root["stellar-x"].caption = "Quadrant X: " .. string.format("%.2f", spaceship.stellar_position.x * Zone.travel_cost_interstellar)
          --root["stellar-y"].caption = "Quadrant Y: " .. string.format("%.2f", spaceship.stellar_position.y * Zone.travel_cost_interstellar)
          panel["stellar-x"].caption = {"space-exploration.spaceship-location-stellar-x", string.format("%.2f", spaceship.stellar_position.x * Zone.travel_cost_interstellar)}
          panel["stellar-y"].caption = {"space-exploration.spaceship-location-stellar-y", string.format("%.2f", spaceship.stellar_position.y * Zone.travel_cost_interstellar)}
          if spaceship.star_gravity_well > 0 then
            --root["star-gravity"].caption = "Star gravity well: " .. string.format("%.2f", spaceship.star_gravity_well * Zone.travel_cost_star_gravity)
            panel["star-gravity"].caption = {"space-exploration.spaceship-location-star-gravity-well", string.format("%.2f", spaceship.star_gravity_well * Zone.travel_cost_star_gravity)}
          else
            panel["star-gravity"].caption = ""
          end
          if spaceship.planet_gravity_well > 0 then
            --root["planet-gravity"].caption = "Planet gravity well: " .. string.format("%.2f", spaceship.planet_gravity_well * Zone.travel_cost_planet_gravity)
            panel["planet-gravity"].caption = {"space-exploration.spaceship-location-planet-gravity-well", string.format("%.2f", spaceship.planet_gravity_well * Zone.travel_cost_planet_gravity)}
          else
            panel["planet-gravity"].caption = ""
          end
        end

        if panel["closest-location"] and ((game.tick + 30) % 60 == 0  or panel["closest-location"].caption == "") then
          local closest = Zone.find_nearest_zone(
          spaceship.space_distortion,
          spaceship.stellar_position,
          spaceship.star_gravity_well,
          spaceship.planet_gravity_well)
          if Zone.is_visible_to_force(closest, player.force.name) then
            panel["closest-location"].caption = {"space-exploration.spaceship-closest-location", closest.name}
          else
            local closest_type = ""
            if closest.type == "asteroid-belt" then
              closest_type = {"space-exploration.asteroid-belt"}
            elseif closest.type == "asteroid-field" then
              closest_type = {"space-exploration.asteroid-field"}
            end
            panel["closest-location"].caption = {"space-exploration.spaceship-closest-location-unknown", closest_type}
          end
        end

        if spaceship.asteroid_density and panel["asteroid-density"] then
          panel["asteroid-density"].caption = {"space-exploration.spaceship-asteroid-density", SpaceshipObstacles.get_asteroid_density_caption(spaceship)}
        end
      end

      if root["flow_destination"] and root["flow_destination"]["panel_destination"] then
        local panel = root["flow_destination"]["panel_destination"]
        if game.tick % 60 == 0 then
          spaceship.distance_to_destination = Spaceship.get_distance_to_destination(spaceship)
          spaceship.distance_to_destination_tick = game.tick
        end
        if spaceship.distance_to_destination and spaceship.speed then
          if spaceship.speed == 0 then
            if not spaceship.max_speed or spaceship.max_speed == 0 then
              --root["travel-time"].caption = "Travel time: Unknown. Test max speed for estimate."
              panel["travel-time"].caption = {"space-exploration.spaceship-travel-time-unknown"}
            else
              --root["travel-time"].caption = "Travel time: "..
              --  Util.seconds_to_clock(spaceship.distance_to_destination / ((spaceship.max_speed or 1) * Spaceship.travel_speed_multiplier) / 60)
              --  .. "s at max speed"
              panel["travel-time"].caption = {"space-exploration.spaceship-travel-time-max", Util.seconds_to_clock(spaceship.distance_to_destination / ((spaceship.max_speed or 1) * Spaceship.travel_speed_multiplier) / 60)}
            end
          else
            panel["travel-time"].caption = {"space-exploration.spaceship-travel-time-current", Util.seconds_to_clock(spaceship.distance_to_destination / ((spaceship.speed or 1) * Spaceship.travel_speed_multiplier) / 60)}
          end
        else
          panel["travel-time"].caption = {"space-exploration.spaceship-travel-time-current", 0}
        end

        if panel["travel-status"] then
          --root["travel-status"].caption="Travel Status: " .. (spaceship.travel_message or  "")
          panel["travel-status"].caption={"space-exploration.spaceship-travel-status", (spaceship.travel_message or  "")}
        end

      end


      -- button modes:
      --[[
      launch when on a surface
      Anchor when near a surface the is the destination
      Stop when moving.
      Engage when in space and:
        a destination is selected
        or not near a surface
      ]]--

      local button
      if spaceship.zone_index then
        -- launch
        if not root["action-flow"]["launch"] then
          root["action-flow"].clear()
          root["action-flow"].add{ type="button", name="launch", caption={"space-exploration.spaceship-button-launch"}, style="confirm_button"}
        end
        button = root["action-flow"]["launch"]
        if spaceship.integrity_valid then
          if energy_required and spaceship.launch_energy and spaceship.launch_energy >= energy_required then
            --button.caption = "Launch"
            button.caption = {"space-exploration.spaceship-button-launch"}
            --button.tooltip = "Ready to launch"
            button.tooltip = {"space-exploration.spaceship-button-launch-tooltip"}
            button.style = "confirm_button"
          else
            --button.caption = "Launch (disabled)"
            button.caption = {"space-exploration.spaceship-button-launch-disabled"}
            --button.tooltip = "Requires fuel in booster tanks"
            button.tooltip = {"space-exploration.spaceship-button-launch-disabled-fuel-tooltip"}
            button.style = "red_confirm_button"
          end
        else
          --button.caption = "Launch (disabled)"
          button.caption = {"space-exploration.spaceship-button-launch-disabled"}
          --button.tooltip = "Requires valid integrity check"
          button.tooltip = {"space-exploration.spaceship-button-launch-disabled-integrity-tooltip"}
          button.style = "red_confirm_button"
        end

      elseif spaceship.awaiting_requests then
        -- launch in progress
        if not root["action-flow"]["launch"] then
          root["action-flow"].clear()
          root["action-flow"].add{ type="button", name="launch", caption={"space-exploration.spaceship-button-launching"}, style="confirm_button"}
        end
        button = root["action-flow"]["launch"]
        button.caption = {"space-exploration.spaceship-button-launching"}
        button.tooltip = {"space-exploration.spaceship-button-launching-tooltip"}
        button.style = "yellow_confirm_button"
      elseif spaceship.near and
       (spaceship.destination == nil
        or (spaceship.near.type == "zone" and spaceship.destination.index == spaceship.near.index)) then
          -- anchor
          local zone = Zone.from_zone_index(spaceship.near.index)
          if not root["action-flow"]["button_anchor"] then
            root["action-flow"].clear()
            root["action-flow"].add{ type="button", name="button_anchor", caption={"space-exploration.spaceship-button-anchor"}, style="confirm_button"}
          end
          button = root["action-flow"]["button_anchor"]
          if playerdata.anchor_scouting_for_spaceship_index then
            --button.caption = "Confirm Anchor"
            button.caption = {"space-exploration.spaceship-button-confirm-anchor"}
            button.style = "confirm_button"
          else
            --local context = Zone.is_solid(zone) and "on" or "to"
            --button.caption = "Anchor "..context.." "..zone.name
            if Zone.is_solid(zone) then
              button.caption = {"space-exploration.spaceship-button-anchor-on", zone.name}
            else
              button.caption = {"space-exploration.spaceship-button-anchor-to", zone.name}
            end
            button.style = "confirm_button"
          end

      elseif spaceship.near and spaceship.near.type == "spaceship" and spaceship.destination
        and spaceship.destination.type == "spaceship" and spaceship.destination.index == spaceship.near.index then

          -- board
          local othership = Spaceship.from_index(spaceship.near.index)
          if not othership then
            spaceship.destination = nil
          end
          local name = othership and othership.name or "MISSING"
          if not root["action-flow"]["board"] then
            root["action-flow"].clear()
            root["action-flow"].add{ type="button", name="board", caption={"space-exploration.spaceship-button-board", name}, style="confirm_button"}
          end
          button = root["action-flow"]["board"]


      elseif spaceship.destination and not spaceship.stopped then

        if not root["action-flow"]["stop"] then
          root["action-flow"].clear()
          root["action-flow"].add{ type="button", name="stop", caption={"space-exploration.spaceship-button-stop"}, style="confirm_button"}
        end
        button = root["action-flow"]["stop"]

      else

        if not root["action-flow"]["start"] then
          root["action-flow"].clear()
          root["action-flow"].add{ type="button", name="start", caption={"space-exploration.spaceship-button-start"}, style="confirm_button"}
        end
        button = root["action-flow"]["start"]

      end

      button.style.top_margin = 10
      button.style.horizontally_stretchable  = true
      button.style.horizontal_align = "left"

      if playerdata.anchor_scouting_for_spaceship_index then
        if not root["back-flow"]["cancel_anchor_scouting"] then
          local back = root["back-flow"].add{type = "button", name = "cancel_anchor_scouting",
            caption = {"space-exploration.spaceship-button-scouting-back"}, style="back_button", tooltip={"space-exploration.spaceship-button-scouting-back-tooltip"}}
          back.style.top_margin = 10
        end
      elseif root["back-flow"]["cancel_anchor_scouting"] then
        root["back-flow"]["cancel_anchor_scouting"].destroy()
      end
    end
  end
end

--- Updates the state for a particular collapsible panel to reflect its state in playerdata
---@param player LuaPlayer the player to modify the GUI for
---@param spaceship Spaceship the spaceship data
---@param root LuaGuiElement the root gui element in which the panel is
---@param name string name of the panel
function SpaceshipGUI.update_panel_state(player, spaceship, root, name)
  local flow = root['flow_' .. name]
  if not flow then return end
  local element = flow['panel_' .. name]
  local button = flow['button_' .. name]
  local playerdata = get_make_playerdata(player)
  playerdata.collapse_map = playerdata.collapse_map or {position = true}
  if playerdata.collapse_map[name] then
    if element then element.destroy() end
    button.caption={"space-exploration.panel-closed", {"space-exploration.panel-"..name.."-name"}}
  else
    SpaceshipGUI.gui_open_panel(player, spaceship, flow, name)
    button.caption={"space-exploration.panel-open", {"space-exploration.panel-"..name.."-name"}}
  end
end

--- Updates the state for all collapsible panels to reflect their states in playerdata
---@param player any
---@param spaceship any
---@param root any
function SpaceshipGUI.update_panel_states(player, spaceship, root)
  SpaceshipGUI.update_panel_state(player, spaceship, root, "integrity")
  SpaceshipGUI.update_panel_state(player, spaceship, root, "speed")
  SpaceshipGUI.update_panel_state(player, spaceship, root, "position")
  SpaceshipGUI.update_panel_state(player, spaceship, root, "destination")
  SpaceshipGUI.gui_update(player) -- force GUI update immediately
end

function SpaceshipGUI.on_gui_click(event)
  if not (event.element and event.element.valid) then return end
  local element = event.element
  local player = game.players[event.player_index]
  local root = gui_element_or_parent(element, SpaceshipGUI.name_spaceship_gui_root)
  if not (root and root.tags and root.tags.index) then return end
  local playerdata = get_make_playerdata(player)
  local spaceship = Spaceship.from_index(root.tags.index)
  if not spaceship then
    if playerdata.anchor_scouting_for_spaceship_index then
      Spaceship.stop_anchor_scouting(player)
    end
    return
  end

  if element.tags and element.tags.collapse then
    playerdata.collapse_map = playerdata.collapse_map or {position = true}
    if element.tags.collapse == "panel_integrity" then
      playerdata.collapse_map['integrity'] = not playerdata.collapse_map['integrity']
    elseif element.tags.collapse == "panel_speed" then
      playerdata.collapse_map['speed'] = not playerdata.collapse_map['speed']
    elseif element.tags.collapse == "panel_position" then
      playerdata.collapse_map['position'] = not playerdata.collapse_map['position']
    elseif element.tags.collapse == "panel_destination" then
      playerdata.collapse_map['destination'] = not playerdata.collapse_map['destination']
    end
    SpaceshipGUI.update_panel_states(player, spaceship, root)
  end
  if element.name == "launch" then

    if spaceship.zone_index and not spaceship.entities_to_restore then
      spaceship.is_launching = true
      spaceship.is_landing = false
      Spaceship.start_integrity_check(spaceship)
      spaceship.is_doing_check_slowly = nil -- never slowly if the player asks for the check
    end

  elseif element.name == "button_anchor" then

    if spaceship.near and spaceship.near.type == "zone" and not spaceship.entities_to_restore then
      if playerdata.anchor_scouting_for_spaceship_index then
        local position = table.deepcopy(player.position)
        Spaceship.stop_anchor_scouting(player)
        Spaceship.land_at_position(spaceship, position)
      else
        spaceship.is_launching = false
        spaceship.is_landing = true
        Spaceship.start_anchor_scouting(spaceship, player)
        Spaceship.start_integrity_check(spaceship)
      end
    elseif playerdata.anchor_scouting_for_spaceship_index then
        Spaceship.stop_anchor_scouting(player)
    end

  elseif element.name == "board" then
    if spaceship.near and spaceship.near.type == "spaceship" then
      local othership = Spaceship.from_index(spaceship.near.index)
      if othership and Zone.get_travel_delta_v_sub(spaceship, othership) < 1 then
        if not othership.own_surface_index then
          player.print({"space-exploration.fail-board-target-anchored"})
        else
          local character = player.character
          if not character then
            local playerdata = get_make_playerdata(player)
            character = playerdata.character
          end
          if not character then
            player.print({"space-exploration.fail-board-no-character"})
          else
            if character.surface.index ~= spaceship.own_surface_index then
              player.print({"space-exploration.fail-board-remote-character"})
            else
              local surface = Spaceship.get_current_surface(othership)
              local boarding_position = Spaceship.get_boarding_position(othership)
              --teleport_non_colliding_player(player, boarding_position, surface)
              teleport_character_to_surface(character, surface, boarding_position)
              SpaceshipGUI.gui_close(player)
            end
          end
        end
      end
    end

  elseif element.name == "stop" then

    spaceship.stopped = true
    spaceship.target_speed = nil
    spaceship.target_speed_source = 'manual-override'

  elseif element.name == "start" then

    spaceship.stopped = false
    spaceship.target_speed = nil
    spaceship.target_speed_source = nil
    Spaceship.start_integrity_check(spaceship)

  elseif element.name == "cancel_anchor_scouting" then

    Spaceship.stop_anchor_scouting(player)

  elseif element.name == "start-integrity-check" then

    spaceship.max_speed = 0
    Spaceship.start_integrity_check(spaceship, 0.1)

  elseif element.name == "rename" then

    if not root["spaceship_title_table"]["spaceship_title_flow"] then
      SpaceshipGUI.gui_close(player)
      return
    end
    if root["spaceship_title_table"]["spaceship_title_flow"]["show-name"] then
      root["spaceship_title_table"]["spaceship_title_flow"]["show-name"].destroy()
      local textfield = root["spaceship_title_table"]["spaceship_title_flow"].add{ type = "textfield", name="write-name", text=spaceship.name, style="space_platform_textfield_short"}
      textfield.style.horizontally_squashable = true
      textfield.style.maximal_width = 180
      element.sprite = "utility/enter"
    elseif  root["spaceship_title_table"]["spaceship_title_flow"]["write-name"] then
      local new_name = string.trim(root["spaceship_title_table"]["spaceship_title_flow"]["write-name"].text)
      if newname ~= "" and new_name ~= spaceship.name then
        spaceship.name = new_name
      end
      root["spaceship_title_table"]["spaceship_title_flow"]["write-name"].destroy()
      local spaceship_title_label = root["spaceship_title_table"]["spaceship_title_flow"].add {
        type = "label",
        name = "show-name",
        caption = {"space-exploration.spaceship-name-the", spaceship.name},
        style = "frame_title",
        ignored_by_interaction = true
      }
      spaceship_title_label.style.vertically_stretchable = true
      spaceship_title_label.style.horizontally_squashable = true
      element.sprite = "utility/rename_icon_normal"
    else
      SpaceshipGUI.gui_close(player)
      return
    end
  elseif element.name == "spaceship-list-zones" then

    local value = player_get_dropdown_value(player, element.name, element.selected_index)
    if type(value) == "table" then
      if value.type == "zone" then
        local zone_index = value.index
        local zone = Zone.from_zone_index(zone_index)
        if zone then
          spaceship.destination = {type = "zone", index = zone_index}
          spaceship.travel_message = {"space-exploration.spaceship-travel-message-new-course-plotted"}
          --spaceship.destination_zone_index = zone_index
          Log.trace("set destination to location: " .. zone.name )
        end

      elseif value.type == "spaceship" then
        local spaceship_index = value.index
        local destination_spaceship = Spaceship.from_index(spaceship_index)
        if destination_spaceship == spaceship then
          player.print({"space-exploration.spaceship-cannot-set-destination-to-self"})
        else
          spaceship.destination = {type = "spaceship", index = spaceship_index}
          spaceship.travel_message = {"space-exploration.spaceship-travel-message-new-course-plotted"}
          Log.trace("set destination to spaceship : " .. spaceship.name )
        end
      end
      Spaceship.update_output_combinator(spaceship)
    else
      SpaceshipGUI.gui_close(player)
      Log.trace("Error: Non-table value ")
    end

  elseif element.name == "clear_filter" then
    element.parent.filter_list.text = ""
    SpaceshipGUI.gui_update_destinations_list(player)
  elseif element.name == SpaceshipGUI.name_window_close then
    SpaceshipGUI.gui_close(player)
  elseif element.name == "goto_informatron_spaceships" then
    remote.call("informatron", "informatron_open_to_page", {
      player_index = event.player_index,
      interface = "space-exploration",
      page_name = "spaceships"
    })
  end
end
Event.addListener(defines.events.on_gui_click, SpaceshipGUI.on_gui_click)
Event.addListener(defines.events.on_gui_selection_state_changed, SpaceshipGUI.on_gui_click)


function SpaceshipGUI.on_gui_checked_state_changed(event)
  if not (event.element and event.element.valid) then return end
  local element = event.element
  local player = game.players[event.player_index]
  local root = gui_element_or_parent(element, SpaceshipGUI.name_spaceship_gui_root)
  if not (root and root.tags and root.tags.index) then return end
  local spaceship = Spaceship.from_index(root.tags.index)
  if not spaceship then return end
  if element.name == "list-zones-alphabetical" then
    local playerdata = get_make_playerdata(player)
    playerdata.zones_alphabetical = element.state
    SpaceshipGUI.gui_update_destinations_list(player)
  end
end
Event.addListener(defines.events.on_gui_checked_state_changed, SpaceshipGUI.on_gui_checked_state_changed)

function SpaceshipGUI.gui_update_destinations_list(player)

  local playerdata = get_make_playerdata(player)
  local root = player.gui.left[SpaceshipGUI.name_spaceship_gui_root]
  if not (root and root.tags and root.tags.index) then return end
  local spaceship = Spaceship.from_index(root.tags.index)
  if not spaceship then return end
  if root then
    local panel = root["flow_destination"]["panel_destination"]
    if panel then

      local filter = nil
      if panel.filter_flow and panel.filter_flow.filter_list then
        filter = string.trim(panel.filter_flow.filter_list.text)
        if filter == "" then
          filter = nil
        end
      end

      -- update the list
      local destination_zone = Spaceship.get_destination_zone(spaceship)
      if not destination_zone then destination_zone = Zone.from_zone_index(spaceship.zone_index) end

      local list, selected_index, values = Zone.dropdown_list_zone_destinations(spaceship.force_name, destination_zone, playerdata.zones_alphabetical, filter)
      panel["spaceship-list-zones"].items = list
      panel["spaceship-list-zones"].selected_index = selected_index or 1
      player_set_dropdown_values(player, "spaceship-list-zones", values)
    end
  end
end

function SpaceshipGUI.on_gui_text_changed(event)
  if not (event.element and event.element.valid) then return end
  local element = event.element
  local player = game.players[event.player_index]
  local root = gui_element_or_parent(element, SpaceshipGUI.name_spaceship_gui_root)
  if root then -- remote view
    if element.name == "filter_list" then
      SpaceshipGUI.gui_update_destinations_list(player)
    else
      if root.tags and root.tags.index then
        local spaceship = Spaceship.from_index(root.tags.index)
        if element.name == "normal-speed-textfield" then
          local target = 0
          if element.text and element.text ~= "" then
            target = tonumber(element.text)
          end
          if target > 0 then
            spaceship.target_speed_normal = target
          else
            spaceship.target_speed_normal = nil
          end
        elseif element.name == "belt-speed-textfield" then
          local target = 0
          if element.text and element.text ~= "" then
            target = tonumber(element.text)
          end
          if target > 0 then
            spaceship.target_speed_belt = target
          else
            spaceship.target_speed_belt = nil
          end
        elseif element.name == "field-speed-textfield" then
          local target = 0
          if element.text and element.text ~= "" then
            target = tonumber(element.text)
          end
          if target > 0 then
            spaceship.target_speed_field = target
          else
            spaceship.target_speed_field = nil
          end
        end
      end
    end
  end
end
Event.addListener(defines.events.on_gui_text_changed, SpaceshipGUI.on_gui_text_changed)

--- Close the spaceship gui for a player
---@param player any
function SpaceshipGUI.gui_close(player)
  if player.gui.left[SpaceshipGUI.name_spaceship_gui_root] then
    player.gui.left[SpaceshipGUI.name_spaceship_gui_root].destroy()
  end
  Spaceship.stop_anchor_scouting(player)
end

--- Opens the spaceship gui when a spaceship console is clicked
--- Closes the spaceship gui when another gui is opened
---@param event any
function SpaceshipGUI.on_gui_opened(event)
  local player = game.players[event.player_index]
  if event.entity and event.entity.valid and event.entity.name == Spaceship.name_spaceship_console then
    SpaceshipGUI.gui_open(player, Spaceship.from_entity(event.entity))
    player.opened = nil -- don't display the vanilla GUI for an accumulator
  else
    -- when the crafting menu is opened we close the gui and then close the crafting menu
    if player.gui.left[SpaceshipGUI.name_spaceship_gui_root] and player.opened_self then
      player.opened = nil
    end
    SpaceshipGUI.gui_close(player)
  end
end
Event.addListener(defines.events.on_gui_opened, SpaceshipGUI.on_gui_opened)

return SpaceshipGUI


local LinkedContainer = {}

function LinkedContainer.tint_from_int(int)
  local hue = (int / 1.61803398875)%1
  local rgb = {}
  rgb[1], rgb[2], rgb[3]= util.HSVToRGB(hue*360, 1, 0.5)
  return rgb
end

function LinkedContainer.on_entity_created(event, player_initiated)
  local entity
  if event.entity and event.entity.valid then
    entity = event.entity
  end
  if event.created_entity and event.created_entity.valid then
    entity = event.created_entity
  end
  if not entity then return end

  if entity.type == "linked-container" then

    local link_id = entity.surface.index + 2
    local zone = Zone.from_surface(entity.surface)

    if zone and zone.type == "anomaly" then
      link_id = (math.floor(game.tick / 3600) % 600) + 1
    end

    -- since the index of a spaceship surface is not consistent, allowing players
    -- to put arcolinks on an in-transit spaceship lets them get arcolinks
    -- with a link_id that they can no longer obtain anymore when the spaceship
    -- lands and another surface takes that id
    -- 
    -- to prevent this sadness, if the player or their robots try to initiate the placement of
    -- an arcolink on an in-transit spaceship, we cancel the placement and display an informative message
    --
    -- we must still allow scripts to place arcolinks on in-transit spaceships to allow for spaceship
    -- launch/landing to work properly
    if zone and zone.type == "spaceship" and player_initiated then
      -- we can let the player have placed arcolinks be for the nearest surface if they're in docking range
      local spaceship = Spaceship.from_own_surface_index(entity.surface.index)
      if spaceship.near and spaceship.near.type == "zone" then
        local nearby_zone = Zone.from_zone_index(spaceship.near.index)
        local nearby_surface = Zone.get_make_surface(nearby_zone)
        link_id = nearby_surface.index + 2
      else
        return cancel_entity_creation(entity, event.player_index, {"space-exploration.construction-denied-linked-container-on-transient-surface"})
      end
    end

    if not zone then
      local vault = Ancient.vault_from_surface(entity.surface)
      if vault then
        link_id = 1
      end
    end

    if event.link_id_override then
      link_id = event.link_id_override
    end

    local text_id = rendering.draw_text{
      text = link_id,
      surface = entity.surface,
      target = entity,
      target_offset = {0, -0.75},
      color = {r=1,b=1,g=1},
      alignment = "center",
      scale = 1,
      only_in_alt_mode = true
    }
    local effect_id = rendering.draw_animation{
      animation = mod_prefix.."map-star-cloud",
      surface = entity.surface,
      target = entity,
      target_offset = {0, -0.35},
      x_scale = 0.07,
      y_scale = 0.055,
      animation_speed = 1,
      tint = LinkedContainer.tint_from_int(link_id)
    }

    global.linked_containers = global.linked_containers or {}
    global.linked_containers[entity.unit_number] = {
      unit_number = entity.unit_number,
      container = entity,
      link_id = link_id,
      text_id = text_id,
      effect_id = effect_id
    }
    entity.link_id = link_id
  end

end

function LinkedContainer.on_entity_created_player_cause(event)
  return LinkedContainer.on_entity_created(event, true)
end
Event.addListener(defines.events.on_robot_built_entity, LinkedContainer.on_entity_created_player_cause)
Event.addListener(defines.events.on_built_entity, LinkedContainer.on_entity_created_player_cause)
function LinkedContainer.on_entity_created_nonplayer_cause(event)
  return LinkedContainer.on_entity_created(event, false)
end
Event.addListener(defines.events.script_raised_built, LinkedContainer.on_entity_created_nonplayer_cause)
Event.addListener(defines.events.script_raised_revive, LinkedContainer.on_entity_created_nonplayer_cause)

function LinkedContainer.on_entity_cloned(event)
  if event.destination and event.destination.valid and event.destination.type == "linked-container" then
    local link_id_override
    if event.source and event.source.valid then
      global.linked_containers = global.linked_containers or {}
      if global.linked_containers[event.source.unit_number] then
        link_id_override = global.linked_containers[event.source.unit_number].link_id
      end
    end
    LinkedContainer.on_entity_created({entity = event.destination, link_id_override = link_id_override})
  end
end
Event.addListener(defines.events.on_entity_cloned, LinkedContainer.on_entity_cloned)

function LinkedContainer.update()
  if not global.linked_containers then return end
  for unit_number, linked_container in pairs(global.linked_containers) do
    if linked_container.container and linked_container.container.valid then
      linked_container.container.link_id = linked_container.link_id
      if not (linked_container.text_id and rendering.is_valid(linked_container.text_id)) then
        linked_container.text_id = rendering.draw_text{
          text = linked_container.link_id,
          surface = entity.surface,
          target = entity,
          target_offset = {0, -0.5},
          color = {r=1,b=1,g=1},
          alignment = "center",
          scale = 1,
          only_in_alt_mode = true
        }
      end
      if not (linked_container.effect_id and rendering.is_valid(linked_container.effect_id)) then
        linked_container.effect_id = rendering.draw_animation{
          animation = mod_prefix.."map-star-cloud",
          surface = entity.surface,
          target = entity,
          target_offset = {0, -0.35},
          x_scale = 0.07,
          y_scale = 0.055,
          animation_speed = 1,
          tint = LinkedContainer.tint_from_int(linked_container.link_id)
        }
      end
    else
      global.linked_containers[linked_container.unit_number] = nil
    end
  end
end

function LinkedContainer.on_nth_tick_3600()
  LinkedContainer.update()
end
Event.addListener("on_nth_tick_36000", LinkedContainer.on_nth_tick_36000) -- 10 minutes

return LinkedContainer

local Nexus = {}

Nexus.name_nexus = mod_prefix.."nexus"
Nexus.name_nexus_charger = mod_prefix.."nexus-charger"
Nexus.power_usage_per_speed =  10000000
Nexus.power_usage_dimension_drive = 6000000000
Nexus.name_distortion_drive_recipe = mod_prefix .. "distortion-drive"
Nexus.distortion_drive_speed = Shared.spaceship_victory_speed
Nexus.distortion_drive_duration = Shared.spaceship_victory_duration

function Nexus.on_entity_created(event)
  local entity
  if event.entity and event.entity.valid then
    entity = event.entity
  end
  if event.created_entity and event.created_entity.valid then
    entity = event.created_entity
  end
  if not entity then return end
  if entity.name == Nexus.name_nexus then
    -- check is on spaceship floor
    if entity.surface.count_tiles_filtered{
      collision_mask = {global.named_collision_masks.spaceship_collision_layer},
      area = entity.bounding_box
    } < 7*7 then
      cancel_entity_creation(entity, event.player_index, {"space-exploration.construction-denied-spaceship-only"})
    else
      global.nexus = global.nexus or {}
      global.nexus[entity.unit_number] = {
        unit_unber = entity.unit_number,
        force_name = entity.force.name,
        entity = entity,
        charger = nil,
        data_progress = 0
      }
      entity.active = false
    end
  end
end
Event.addListener(defines.events.on_built_entity, Nexus.on_entity_created)
Event.addListener(defines.events.on_robot_built_entity, Nexus.on_entity_created)
Event.addListener(defines.events.script_raised_built, Nexus.on_entity_created)
Event.addListener(defines.events.script_raised_revive, Nexus.on_entity_created)

--- Ensures that all nexi in an area on a surface are valid
---@param surface any
---@param area any
function Nexus.reset_surface(surface, area)
  for _, entity in pairs(surface.find_entities_filtered{
    name = Nexus.name_nexus_charger,
    area = area
  }) do
    entity.destroy()
  end
  for _, entity in pairs(surface.find_entities_filtered{
    name = Nexus.name_nexus,
    area = area
  }) do
    Nexus.on_entity_created({entity = entity})
  end
end

function Nexus.on_nth_tick_60()
  if global.nexus then
    for _, nexus in pairs(global.nexus) do
      if not nexus.entity.valid then
        if nexus.charger and nexus.charger.valid then
          nexus.charger.destroy()
        end
        if nexus.charger2 and nexus.charger2.valid then
          nexus.charger2.destroy()
        end
        global.nexus[nexus.unit_unber] = nil
      else
        local clear_speed_reached_tick = true
        local delete_charger_2 = true
        local zone = Zone.from_surface(nexus.entity.surface)
        if zone and zone.type == "spaceship" then
          local spaceship = zone
          if spaceship.speed and spaceship.speed > 10 then
            nexus.entity.active = true
            if not ( nexus.charger and nexus.charger.valid ) then
              nexus.charger = nexus.entity.surface.create_entity{name = Nexus.name_nexus_charger, position = nexus.entity.position, force = nexus.entity.force}
            end
            local power_draw = 5 * Nexus.power_usage_per_speed / 60 -- min

            local recipe = nexus.entity.get_recipe()
            if nexus.entity.status ~= defines.entity_status.working then
              nexus.charger.power_usage = power_draw
            else
              if recipe and recipe.name == Nexus.name_distortion_drive_recipe then
                power_draw = math.max(power_draw, math.min(spaceship.speed, Nexus.distortion_drive_speed) / Nexus.distortion_drive_speed * Nexus.power_usage_dimension_drive / 60)
                -- Can't exceed 6GW, need 2 chargers
                if power_draw > 6000000000 then
                  if not ( nexus.charger2 and nexus.charger2.valid ) then
                    nexus.charger2 = nexus.entity.surface.create_entity{name = Nexus.name_nexus_charger, position = nexus.entity.position, force = nexus.entity.force}
                  end
                  delete_charger_2 = false
                  nexus.charger.power_usage = power_draw / 2
                  nexus.charger2.power_usage = power_draw / 2
                else
                  nexus.charger.power_usage = power_draw
                end
              else
                power_draw = math.max(power_draw, spaceship.speed * Nexus.power_usage_per_speed / 60)
                nexus.charger.power_usage = power_draw
              end
            end
            if nexus.charger.energy > 10000000 and nexus.entity.status == defines.entity_status.working and spaceship.star_gravity_well == 0 then -- 10%
              nexus.data_progress = nexus.data_progress + math.pow(spaceship.speed, 2) * (spaceship.integrity_stress or 0) / 1000
              if spaceship.speed > Nexus.distortion_drive_speed and spaceship.integrity_stress >= 3000 then
                local forcedata = global.forces[nexus.entity.force.name]
                if recipe and recipe.name == Nexus.name_distortion_drive_recipe and nexus.entity.force.technologies[mod_prefix.."spaceship-victory"].researched then
                  local outer_bounds = math.sqrt(#global.universe.stars + #global.universe.space_zones) * 50
                  spaceship.stellar_position = {
                    x = (math.random() - 0.5) * 2 * outer_bounds,
                    y = (math.random() - 0.5) * 2  * outer_bounds
                  }
                  spaceship.space_distortion = 0.1
                  -- TODO: update spaceship position on maps

                  if not nexus.speed_reached_tick then
                    nexus.speed_reached_tick = game.tick
                  end
                  local text = math.max(0, math.min(Nexus.distortion_drive_duration, Nexus.distortion_drive_duration + 1 - math.ceil((game.tick - nexus.speed_reached_tick ) / 60)))
                  clear_speed_reached_tick = false
                  if text <= 0 then
                    text = "Active"
                  end
                  if nexus.countdown_id and rendering.is_valid(nexus.countdown_id) then
                    rendering.set_text(nexus.countdown_id , text)
                  else
                    nexus.countdown_id = rendering.draw_text{
                      text = text,
                      surface = nexus.entity.surface,
                      target = nexus.entity,
                      target_offset = {0, -1.7},
                      color = {r=1,b=1,g=1},
                      alignment = "center",
                      scale = 4
                    }
                  end
                  if game.tick - nexus.speed_reached_tick > Nexus.distortion_drive_duration*60 and game.tick % 60 == 0 then
                    if nexus.entity.surface.count_entities_filtered{type = "character"} > 0 then
                      if not forcedata.spaceship_victory then
                        nexus.entity.force.print({"space-exploration.victory-message-spaceship"})
                        game.set_game_state{
                          game_finished=true,
                          player_won=true,
                          can_continue=true,
                          victorious_force=nexus.entity.force
                        }
                        forcedata.spaceship_victory = game.tick
                      end
                      local characters = nexus.entity.surface.find_entities_filtered{type = "character"}
                      for _, character in pairs(characters) do
                        if character.player then
                          local playerdata = get_make_playerdata(character.player)
                          if playerdata and not playerdata.spaceship_victory then
                            playerdata.spaceship_victory = game.tick
                            nexus.entity.force.print({"space-exploration.victory-message-spaceship-player"})
                          end
                        end
                      end
                    else
                      nexus.entity.force.print({"space-exploration.nexus_no_characters", spaceship.name })
                    end
                  end

                end
              end
              nexus.entity.crafting_progress = math.min(0.9, nexus.data_progress / 100000)
              while nexus.data_progress > 100000 do -- once per 10 seconds at 100 speed
                nexus.data_progress = nexus.data_progress - 100000
                local input = nexus.entity.get_inventory(defines.inventory.assembling_machine_input)
                local output = nexus.entity.get_inventory(defines.inventory.assembling_machine_output)
                if input.get_item_count(mod_prefix.."empty-data") > 0 then
                  if output.can_insert({name = mod_prefix.."interstellar-data", count = 1}) then
                    nexus.entity.products_finished = nexus.entity.products_finished + 1
                    nexus.entity.crafting_progress = 0.001
                    output.insert({name = mod_prefix.."interstellar-data", count = 1})
                    nexus.entity.force.item_production_statistics.on_flow(mod_prefix.."interstellar-data", 1)
                    input.remove({name = mod_prefix.."empty-data", count = 1})
                    nexus.entity.force.item_production_statistics.on_flow(mod_prefix.."empty-data", -1)
                  end
                end
              end
            end

          else
            nexus.entity.active = false
            if not ( nexus.charger and nexus.charger.valid ) then
              nexus.charger = nexus.entity.surface.create_entity{name = Nexus.name_nexus_charger, position = nexus.entity.position, force = nexus.entity.force}
            end
            nexus.charger.power_usage = 1 * Nexus.power_usage_per_speed / 60
          end
        else
          nexus.entity.active = false
          if nexus.charger and nexus.charger.valid then
            nexus.charger.destroy()
            nexus.charger = nil
          end
        end
        if delete_charger_2 then
          if nexus.charger2 and nexus.charger2.valid then
            nexus.charger2.destroy()
            nexus.charger2 = nil
          end
        end
        if clear_speed_reached_tick then
          nexus.speed_reached_tick = nil
          if nexus.countdown_id and rendering.is_valid(nexus.countdown_id) then
            rendering.destroy(nexus.countdown_id)
            nexus.countdown_id = nil
          end
        end
      end
    end
  end
end
Event.addListener("on_nth_tick_60", Nexus.on_nth_tick_60) -- 1 second

return Nexus

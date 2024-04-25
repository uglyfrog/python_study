local EntityMove = {}

-- whitelist is MUCH easier
EntityMove.whitelist_exact = {
  "se-linked-container",
  "se-pylon",
  "se-pylon-substation",
  "se-space-curved-rail",
  "se-space-stright-rail",
  "se-supercharger",
  "se-delivery-cannon-chest",
  "se-space-probe-rocket-silo",
  "se-fluid-burner-generator",

}
EntityMove.whitelist_find = { -- include grunded/spaced version, colour variants, etc
  "se-linked-container",
  "se-space-pipe",
  "se-deep-space-transport-belt",
  "se-deep-space-underground-belt",
  "se-deep-space-splitter",
  "se-addon-power-pole",
  "se-naquium-heat-pipe",
  "se-space-thermodynamics-laboratory",
  "se-recycling-facility",
  "se-space-mechanical-laboratory",
  "se-pulveriser",
  "se-space-assembling-machine",
  "se-space-manufactory",
  "se-lifesupport-facility",
  "se-space-biochemical-laboratory",
  "se-space-decontamination-facility",
  "se-space-genetics-laboratory",
  "se-space-growth-facility",
  "se-fuel-refinery",
  "se-space-radiation-laboratory",
  "se-space-electromagnetics-laboratory",
  "se-space-laser-laboratory",
  "se-space-material-fabricator",
  "se-space-laser-laboratory",
  "se-space-particle-accelerator",
  "se-space-particle-collider",
  "se-space-plasma-generator",
  "se-space-hypercooler",
  "se-space-radiator",
  "se-space-astrometrics-laboratory",
  "se-space-gravimetrics-laboratory",
  "se-space-supercomputer",
  "se-space-laser-laboratory",
  "se-space-telescope",
  "se-space-science-lab",
  "se-cargo-rocket-cargo-pod",
  "se-space-laser-laboratory",
  "se-big-heat-exchanger",
  "se-antimatter-reactor",
  "se-electric-boiler",
  "se-space-solar-panel",
  "se-space-accumulator",
  "se-wide-beacon",
}

function EntityMove.on_dolly_moved(event)
  if event.moved_entity and event.moved_entity.valid then
    local entity = event.moved_entity
    if event.moved_entity.type == "beacon" then
      local prototype = entity.prototype
      local area = util.area_extend(entity.bounding_box, prototype.supply_area_distance)
      local structures = entity.surface.find_entities_filtered{type = Beacon.affected_types, area = area}
      for _, structure in pairs(structures) do
        Beacon.validate_entity(structure, 0)
      end
      local start_area = Util.area_add_position(area, Util.vectors_delta(entity.position, event.start_pos))
      structures = entity.surface.find_entities_filtered{type = Beacon.affected_types, area = start_area}
      for _, structure in pairs(structures) do
        Beacon.validate_entity(structure, 0)
      end
    else
      Beacon.validate_entity(entity, 0)
    end
  end
end

function EntityMove.allow_move()
  if remote.interfaces["PickerDollies"] and remote.interfaces["PickerDollies"]["add_blacklist_name"] then
    for prototype_name, prototype in pairs(game.entity_prototypes) do
      if string.starts(prototype_name, mod_prefix) then
        local allowed = false
        for _, name in pairs(EntityMove.whitelist_find) do
          if string.find(prototype_name, name, 1, true) then
            allowed = true
          end
        end
        for _, name in pairs(EntityMove.whitelist_exact) do
          if prototype_name == name then
            allowed = true
          end
        end
        if not allowed then
          remote.call("PickerDollies", "add_blacklist_name", prototype_name)
        end
      end
    end
  end
end

function EntityMove.on_load()
  if remote.interfaces["PickerDollies"] and remote.interfaces["PickerDollies"]["dolly_moved_entity_id"] then
      script.on_event(remote.call("PickerDollies", "dolly_moved_entity_id"), EntityMove.on_dolly_moved)
  end
end
Event.addListener("on_load", EntityMove.on_load, true)

function EntityMove.on_init()
  if remote.interfaces["PickerDollies"] and remote.interfaces["PickerDollies"]["dolly_moved_entity_id"] then
      script.on_event(remote.call("PickerDollies", "dolly_moved_entity_id"), EntityMove.on_dolly_moved)
  end
  EntityMove.allow_move()
end
Event.addListener("on_init", EntityMove.on_init, true)

function EntityMove.on_configuration_changed()
  EntityMove.allow_move()
end
Event.addListener("on_configuration_changed", EntityMove.on_configuration_changed, true)

return EntityMove

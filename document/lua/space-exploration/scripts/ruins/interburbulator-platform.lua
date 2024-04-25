local interburbulator_platform = {
  name = "interburbulator-platform",
  center = {x = 0, y = 0},
  force_name = "ignore",
  entities = { -- not blueprintable
    ["se-burbulator"] = {
      {x = 0, y = -17, orientation = 1, destructible = false}
    },
    ["se-interburbulator-projector"] = {
      {x = -9.25, y = -9.25, direction = defines.direction.east, destructible = false},
      {x = 9.25, y = -9.25, direction = defines.direction.south, destructible = false},
      {x = 9.25, y = 9.25, direction = defines.direction.west, destructible = false},
      {x = -9.25, y = 9.25, direction = defines.direction.north, destructible = false}
    },
    ["se-interburbulator-interface"] = {
      --{x = -9, y = -8.25, direction = defines.direction.east},
      --{x = 9, y = -8.25, direction = defines.direction.south},
      {x = 0, y = 10.25, direction = defines.direction.west, destructible = false},
      --{x = -9, y = 10.25, direction = defines.direction.north}
    },
    ["se-interburbulator-control"] = {
      {x = 0, y = 9.5, direction = defines.direction.west, destructible = false},
    }
  },
  clear_entity_areas = {
    {{-20,-13},{20,13}},
    {{-13,-20},{13,20}},
    {{-18,-18},{18,18}},
  },
  clear_decorative_areas = {
    {{-20,-13},{20,13}},
    {{-13,-20},{13,20}},
    {{-18,-18},{18,18}},
  },
  postbuild = function(surface, ruin_position, ruin)
    local ruin_position_center_offset = Util.vectors_delta(ruin.center, ruin_position)
    local entities = surface.find_entities_filtered{area = Util.area_add_position({{-21, -21},{21,21}}, ruin_position_center_offset)}
    for _, entity in pairs(entities) do
      if entity.force.name == "ignore" then
        entity.destructible = false
      end
      if entity.type == "gate" or entity.type == "wall" or entity.name == "se-interburbulator-control" then
        entity.force = "friendly"
      end
    end
    local burbulator = surface.find_entity("se-burbulator", Util.vectors_add(ruin_position_center_offset, {x = 0, y = -17}))
    burbulator.autopilot_destination = Util.vectors_add(ruin_position_center_offset, {x = 0, y = -11})
  end,
  tiles = {
    ["volcanic-orange-heat-1"] = {{-19,-9}, {-19,-8}, {-19,-7}, {-19,-6}, {-19,-5}, {-19,-4}, {-19,3}, {-19,4}, {-19,5}, {-19,6}, {-19,7}, {-18,-10}, {-18,-9}, {-18,-8}, {-18,-7}, {-18,-6}, {-18,-5}, {-18,-4}, {-18,3}, {-18,4}, {-18,5}, {-18,6}, {-18,7}, {-18,8}, {-17,-11}, {-17,-10}, {-17,-9}, {-17,-8}, {-17,-7}, {-17,-6}, {-17,-4}, {-17,3}, {-17,5}, {-17,6}, {-17,8}, {-17,9}, {-16,-12}, {-16,-11}, {-16,-10}, {-16,-9}, {-16,-8}, {-16,-7}, {-16,-6}, {-16,-4}, {-16,3}, {-16,5}, {-16,6}, {-16,7}, {-16,8}, {-16,9}, {-16,10}, {-15,-13}, {-15,-11}, {-15,-10}, {-15,-6}, {-15,-4}, {-15,3}, {-15,5}, {-15,7}, {-15,8}, {-15,9}, {-15,10}, {-15,11}, {-14,-14}, {-14,-10}, {-14,-9}, {-14,-8}, {-14,-7}, {-14,-6}, {-14,5}, {-14,7}, {-14,8}, {-14,9}, {-14,11}, {-14,12}, {-13,-15}, {-13,-14}, {-13,-13}, {-13,-12}, {-13,-10}, {-13,-8}, {-13,-6}, {-13,5}, {-13,7}, {-13,11}, {-13,12}, {-13,13}, {-12,-16}, {-12,-15}, {-12,-14}, {-12,-13}, {-12,-12}, {-12,11}, {-12,12}, {-12,13}, {-12,14}, {-11,-17}, {-11,-16}, {-11,-13}, {-11,-12}, {-11,12}, {-11,15}, {-10,-18}, {-10,-17}, {-10,-16}, {-10,-14}, {-10,-13}, {-10,12}, {-10,14}, {-10,15}, {-10,16}, {-9,-19}, {-9,-18}, {-9,-15}, {-9,-14}, {-9,13}, {-9,14}, {-9,15}, {-9,16}, {-9,17}, {-8,-19}, {-8,-18}, {-8,-17}, {-8,-14}, {-8,-13}, {-8,12}, {-8,13}, {-8,16}, {-8,17}, {-8,18}, {-7,-19}, {-7,-18}, {-7,-17}, {-7,-16}, {-7,-14}, {-7,13}, {-7,15}, {-7,16}, {-7,17}, {-7,18}, {-6,-19}, {-6,-18}, {-6,-17}, {-6,-16}, {-6,-15}, {-6,-14}, {-6,-13}, {-6,12}, {-6,13}, {-6,14}, {-6,15}, {-6,16}, {-6,17}, {-6,18}, {-5,-19}, {-5,-18}, {-5,-15}, {-5,14}, {-5,17}, {-5,18}, {-4,-19}, {-4,-18}, {-4,-17}, {-4,14}, {-4,15}, {-4,16}, {-4,17}, {-4,18}, {3,-19}, {3,-18}, {3,-15}, {3,14}, {3,15}, {3,16}, {3,17}, {3,18}, {4,-19}, {4,-18}, {4,-17}, {4,14}, {4,16}, {4,17}, {4,18}, {5,-19}, {5,-18}, {5,-17}, {5,-16}, {5,-15}, {5,-14}, {5,-13}, {5,12}, {5,13}, {5,15}, {5,16}, {5,17}, {5,18}, {6,-19}, {6,-18}, {6,-17}, {6,-16}, {6,-15}, {6,13}, {6,15}, {6,16}, {6,17}, {6,18}, {7,-19}, {7,-18}, {7,-17}, {7,-14}, {7,-13}, {7,12}, {7,13}, {7,16}, {7,17}, {7,18}, {8,-18}, {8,-17}, {8,-16}, {8,-15}, {8,-14}, {8,13}, {8,14}, {8,15}, {8,16}, {8,17}, {9,-17}, {9,-16}, {9,-15}, {9,-14}, {9,-13}, {9,12}, {9,13}, {9,14}, {9,15}, {9,16}, {10,-16}, {10,-15}, {10,-13}, {10,-12}, {10,11}, {10,12}, {10,15}, {11,-15}, {11,-14}, {11,-13}, {11,-12}, {11,-11}, {11,11}, {11,12}, {11,13}, {11,14}, {12,-14}, {12,-13}, {12,-12}, {12,-11}, {12,-8}, {12,-6}, {12,5}, {12,7}, {12,9}, {12,10}, {12,11}, {12,12}, {12,13}, {13,-13}, {13,-12}, {13,-9}, {13,-8}, {13,-7}, {13,-6}, {13,-5}, {13,4}, {13,5}, {13,7}, {13,8}, {13,11}, {13,12}, {14,-12}, {14,-10}, {14,-9}, {14,-6}, {14,-4}, {14,3}, {14,5}, {14,8}, {14,9}, {14,10}, {14,11}, {15,-11}, {15,-10}, {15,-9}, {15,-7}, {15,-6}, {15,-4}, {15,3}, {15,5}, {15,6}, {15,8}, {15,9}, {15,10}, {16,-10}, {16,-9}, {16,-8}, {16,-7}, {16,-6}, {16,-5}, {16,-4}, {16,3}, {16,4}, {16,5}, {16,6}, {16,7}, {16,8}, {16,9}, {17,-9}, {17,-8}, {17,-7}, {17,-6}, {17,-5}, {17,-4}, {17,3}, {17,4}, {17,5}, {17,6}, {17,7}, {17,8}, {18,-8}, {18,-7}, {18,-6}, {18,-5}, {18,-4}, {18,3}, {18,4}, {18,5}, {18,6}, {18,7}, },
    ["stone-path"] = {{-19,-3}, {-19,2}, {-18,-3}, {-18,2}, {-17,-3}, {-17,2}, {-16,-3}, {-16,2}, {-15,-3}, {-15,2}, {-14,-3}, {-14,2}, {-13,-4}, {-13,3}, {-12,-9}, {-12,-8}, {-12,-7}, {-12,-6}, {-12,-5}, {-12,4}, {-12,5}, {-12,6}, {-12,7}, {-12,8}, {-11,-10}, {-11,9}, {-10,-11}, {-10,10}, {-9,-12}, {-9,11}, {-8,-12}, {-8,11}, {-7,-12}, {-7,11}, {-6,-12}, {-6,11}, {-5,-12}, {-5,11}, {-4,-13}, {-4,12}, {-3,-19}, {-3,-18}, {-3,-17}, {-3,-16}, {-3,-15}, {-3,-14}, {-3,13}, {-3,14}, {-3,15}, {-3,16}, {-3,17}, {-3,18}, {-2,-15}, {-2,14}, {-1,-15}, {-1,14}, {0,-15}, {0,14}, {1,-15}, {1,14}, {2,-19}, {2,-18}, {2,-17}, {2,-16}, {2,-15}, {2,-14}, {2,13}, {2,14}, {2,15}, {2,16}, {2,17}, {2,18}, {3,-13}, {3,12}, {4,-12}, {4,11}, {5,-12}, {5,11}, {6,-12}, {6,11}, {7,-12}, {7,11}, {8,-12}, {8,11}, {9,-11}, {9,10}, {10,-10}, {10,9}, {11,-9}, {11,-8}, {11,-7}, {11,-6}, {11,-5}, {11,4}, {11,5}, {11,6}, {11,7}, {11,8}, {12,-4}, {12,3}, {13,-3}, {13,2}, {14,-3}, {14,2}, {15,-3}, {15,2}, {16,-3}, {16,2}, {17,-3}, {17,2}, {18,-3}, {18,2}, },
    ["refined-concrete"] = {{-19,-2}, {-19,-1}, {-19,0}, {-19,1}, {-18,-2}, {-18,-1}, {-18,0}, {-18,1}, {-17,-2}, {-17,-1}, {-17,0}, {-17,1}, {-16,-2}, {-16,-1}, {-16,0}, {-16,1}, {-15,-2}, {-15,-1}, {-15,0}, {-15,1}, {-14,-2}, {-14,-1}, {-14,0}, {-14,1}, {-13,-2}, {-13,-1}, {-13,0}, {-13,1}, {-12,-2}, {-12,-1}, {-12,0}, {-12,1}, {-11,-2}, {-11,-1}, {-11,0}, {-11,1}, {-10,-2}, {-10,-1}, {-10,0}, {-10,1}, {-3,-13}, {-3,-12}, {-3,-11}, {-3,10}, {-3,11}, {-3,12}, {-2,-19}, {-2,-18}, {-2,-17}, {-2,-16}, {-2,-14}, {-2,-13}, {-2,-12}, {-2,-11}, {-2,-10}, {-2,9}, {-2,10}, {-2,11}, {-2,12}, {-2,13}, {-2,15}, {-2,16}, {-2,17}, {-2,18}, {-1,-19}, {-1,-18}, {-1,-17}, {-1,-16}, {-1,-14}, {-1,-13}, {-1,-12}, {-1,-11}, {-1,-10}, {-1,9}, {-1,10}, {-1,11}, {-1,12}, {-1,13}, {-1,15}, {-1,16}, {-1,17}, {-1,18}, {0,-19}, {0,-18}, {0,-17}, {0,-16}, {0,-14}, {0,-13}, {0,-12}, {0,-11}, {0,-10}, {0,9}, {0,10}, {0,11}, {0,12}, {0,13}, {0,15}, {0,16}, {0,17}, {0,18}, {1,-19}, {1,-18}, {1,-17}, {1,-16}, {1,-14}, {1,-13}, {1,-12}, {1,-11}, {1,-10}, {1,9}, {1,10}, {1,11}, {1,12}, {1,13}, {1,15}, {1,16}, {1,17}, {1,18}, {2,-13}, {2,-12}, {2,-11}, {2,10}, {2,11}, {2,12}, {9,-2}, {9,-1}, {9,0}, {9,1}, {10,-2}, {10,-1}, {10,0}, {10,1}, {11,-2}, {11,-1}, {11,0}, {11,1}, {12,-2}, {12,-1}, {12,0}, {12,1}, {13,-2}, {13,-1}, {13,0}, {13,1}, {14,-2}, {14,-1}, {14,0}, {14,1}, {15,-2}, {15,-1}, {15,0}, {15,1}, {16,-2}, {16,-1}, {16,0}, {16,1}, {17,-2}, {17,-1}, {17,0}, {17,1}, {18,-2}, {18,-1}, {18,0}, {18,1}, },
    ["volcanic-orange-heat-2"] = {{-17,-5}, {-17,4}, {-17,7}, {-16,-5}, {-16,4}, {-15,-12}, {-15,-9}, {-15,-8}, {-15,-7}, {-15,-5}, {-15,4}, {-15,6}, {-14,-13}, {-14,-12}, {-14,-11}, {-14,6}, {-14,10}, {-13,-11}, {-13,9}, {-13,10}, {-11,-15}, {-11,-14}, {-11,13}, {-11,14}, {-10,-15}, {-10,13}, {-9,-17}, {-9,-16}, {-8,-15}, {-8,14}, {-8,15}, {-7,-15}, {-7,14}, {-5,-17}, {-5,-16}, {-5,15}, {-5,16}, {-4,-16}, {-4,-15}, {3,-17}, {3,-16}, {4,-16}, {4,-15}, {4,15}, {5,14}, {6,-14}, {6,14}, {7,-16}, {7,-15}, {7,14}, {7,15}, {10,-14}, {10,13}, {10,14}, {12,-10}, {13,-11}, {13,-10}, {13,6}, {13,9}, {13,10}, {14,-11}, {14,-8}, {14,-7}, {14,-5}, {14,4}, {14,6}, {14,7}, {15,-8}, {15,-5}, {15,4}, },
    ["volcanic-orange-heat-3"] = {{-14,-5}, {-14,4}, {-13,-9}, {-13,8}, {-12,-11}, {-12,-10}, {-12,9}, {-12,10}, {-11,-11}, {-11,10}, {-11,11}, {-10,-12}, {-10,11}, {-9,-13}, {-9,12}, {-8,-16}, {-7,12}, {-5,-14}, {-5,13}, {4,-14}, {4,13}, {8,-13}, {8,12}, {9,-12}, {9,11}, {10,-11}, {10,10}, {11,-10}, {11,9}, {11,10}, {12,-9}, {12,8}, {15,7}, },
    ["volcanic-orange-heat-4"] = {{-14,-4}, {-14,3}, {-13,-7}, {-13,-5}, {-13,-3}, {-13,2}, {-13,4}, {-13,6}, {-12,-4}, {-12,-3}, {-12,2}, {-11,-4}, {-11,-3}, {-11,2}, {-11,3}, {-10,-4}, {-10,-3}, {-10,2}, {-10,3}, {-7,-13}, {-5,-13}, {-5,12}, {-4,-14}, {-4,-12}, {-4,-11}, {-4,-10}, {-4,9}, {-4,10}, {-4,13}, {-3,-10}, {-3,9}, {2,-10}, {2,9}, {3,-14}, {3,-12}, {3,-11}, {3,-10}, {3,9}, {3,10}, {3,13}, {4,-13}, {4,12}, {6,-13}, {6,12}, {9,-4}, {9,-3}, {9,2}, {9,3}, {10,-4}, {10,-3}, {10,2}, {10,3}, {11,-4}, {11,-3}, {11,2}, {11,3}, {12,-7}, {12,-5}, {12,-3}, {12,2}, {12,4}, {12,6}, {13,-4}, {13,3}, {-12,3}, {-4,11}, {3,11}, },
    ["refined-hazard-concrete-left"] = {{-11,-9}, {-11,-8}, {-11,-7}, {-11,-6}, {-11,-5}, {-10,-10}, {-10,-9}, {-10,-8}, {-10,-7}, {-10,-6}, {-10,-5}, {-9,-11}, {-9,-10}, {-8,-11}, {-8,-10}, {-7,-11}, {-7,-10}, {-6,-11}, {-6,-10}, {-5,-11}, {-5,-10}, {4,9}, {4,10}, {5,9}, {5,10}, {6,9}, {6,10}, {7,9}, {7,10}, {8,9}, {8,10}, {9,4}, {9,5}, {9,6}, {9,7}, {9,8}, {9,9}, {10,4}, {10,5}, {10,6}, {10,7}, {10,8}, },
    ["refined-hazard-concrete-right"] = {{-11,4}, {-11,5}, {-11,6}, {-11,7}, {-11,8}, {-10,4}, {-10,5}, {-10,6}, {-10,7}, {-10,8}, {-10,9}, {-9,9}, {-9,10}, {-8,9}, {-8,10}, {-7,9}, {-7,10}, {-6,9}, {-6,10}, {-5,9}, {-5,10}, {4,-11}, {4,-10}, {5,-11}, {5,-10}, {6,-11}, {6,-10}, {7,-11}, {7,-10}, {8,-11}, {8,-10}, {9,-10}, {9,-9}, {9,-8}, {9,-7}, {9,-6}, {9,-5}, {10,-9}, {10,-8}, {10,-7}, {10,-6}, {10,-5}, },
    ["tutorial-grid"] = {{-9,-9}, {-9,-8}, {-9,-7}, {-9,-6}, {-9,-5}, {-9,-4}, {-9,-3}, {-9,-2}, {-9,-1}, {-9,0}, {-9,1}, {-9,2}, {-9,3}, {-9,4}, {-9,5}, {-9,6}, {-9,7}, {-9,8}, {-8,-9}, {-8,8}, {-7,-9}, {-7,8}, {-6,-9}, {-6,8}, {-5,-9}, {-5,8}, {-4,-9}, {-4,8}, {-3,-9}, {-3,8}, {-2,-9}, {-2,8}, {-1,-9}, {-1,8}, {0,-9}, {0,8}, {1,-9}, {1,8}, {2,-9}, {2,8}, {3,-9}, {3,8}, {4,-9}, {4,8}, {5,-9}, {5,8}, {6,-9}, {6,8}, {7,-9}, {7,8}, {8,-9}, {8,-8}, {8,-7}, {8,-6}, {8,-5}, {8,-4}, {8,-3}, {8,-2}, {8,-1}, {8,0}, {8,1}, {8,2}, {8,3}, {8,4}, {8,5}, {8,6}, {8,7}, {8,8}, },
    --["lab-dark-1"]
    ["out-of-map"]
     = {{-8,-8}, {-8,-7}, {-8,-6}, {-8,-5}, {-8,-4}, {-8,-3}, {-8,-2}, {-8,-1}, {-8,0}, {-8,1}, {-8,2}, {-8,3}, {-8,4}, {-8,5}, {-8,6}, {-8,7}, {-7,-8}, {-7,-7}, {-7,-6}, {-7,-5}, {-7,-4}, {-7,-3}, {-7,-2}, {-7,-1}, {-7,0}, {-7,1}, {-7,2}, {-7,3}, {-7,4}, {-7,5}, {-7,6}, {-7,7}, {-6,-8}, {-6,-7}, {-6,-6}, {-6,-5}, {-6,-4}, {-6,-3}, {-6,-2}, {-6,-1}, {-6,0}, {-6,1}, {-6,2}, {-6,3}, {-6,4}, {-6,5}, {-6,6}, {-6,7}, {-5,-8}, {-5,-7}, {-5,-6}, {-5,-5}, {-5,-4}, {-5,-3}, {-5,-2}, {-5,-1}, {-5,0}, {-5,1}, {-5,2}, {-5,3}, {-5,4}, {-5,5}, {-5,6}, {-5,7}, {-4,-8}, {-4,-7}, {-4,-6}, {-4,-5}, {-4,-4}, {-4,-3}, {-4,-2}, {-4,-1}, {-4,0}, {-4,1}, {-4,2}, {-4,3}, {-4,4}, {-4,5}, {-4,6}, {-4,7}, {-3,-8}, {-3,-7}, {-3,-6}, {-3,-5}, {-3,-4}, {-3,-3}, {-3,-2}, {-3,-1}, {-3,0}, {-3,1}, {-3,2}, {-3,3}, {-3,4}, {-3,5}, {-3,6}, {-3,7}, {-2,-8}, {-2,-7}, {-2,-6}, {-2,-5}, {-2,-4}, {-2,-3}, {-2,-2}, {-2,-1}, {-2,0}, {-2,1}, {-2,2}, {-2,3}, {-2,4}, {-2,5}, {-2,6}, {-2,7}, {-1,-8}, {-1,-7}, {-1,-6}, {-1,-5}, {-1,-4}, {-1,-3}, {-1,-2}, {-1,-1}, {-1,0}, {-1,1}, {-1,2}, {-1,3}, {-1,4}, {-1,5}, {-1,6}, {-1,7}, {0,-8}, {0,-7}, {0,-6}, {0,-5}, {0,-4}, {0,-3}, {0,-2}, {0,-1}, {0,0}, {0,1}, {0,2}, {0,3}, {0,4}, {0,5}, {0,6}, {0,7}, {1,-8}, {1,-7}, {1,-6}, {1,-5}, {1,-4}, {1,-3}, {1,-2}, {1,-1}, {1,0}, {1,1}, {1,2}, {1,3}, {1,4}, {1,5}, {1,6}, {1,7}, {2,-8}, {2,-7}, {2,-6}, {2,-5}, {2,-4}, {2,-3}, {2,-2}, {2,-1}, {2,0}, {2,1}, {2,2}, {2,3}, {2,4}, {2,5}, {2,6}, {2,7}, {3,-8}, {3,-7}, {3,-6}, {3,-5}, {3,-4}, {3,-3}, {3,-2}, {3,-1}, {3,0}, {3,1}, {3,2}, {3,3}, {3,4}, {3,5}, {3,6}, {3,7}, {4,-8}, {4,-7}, {4,-6}, {4,-5}, {4,-4}, {4,-3}, {4,-2}, {4,-1}, {4,0}, {4,1}, {4,2}, {4,3}, {4,4}, {4,5}, {4,6}, {4,7}, {5,-8}, {5,-7}, {5,-6}, {5,-5}, {5,-4}, {5,-3}, {5,-2}, {5,-1}, {5,0}, {5,1}, {5,2}, {5,3}, {5,4}, {5,5}, {5,6}, {5,7}, {6,-8}, {6,-7}, {6,-6}, {6,-5}, {6,-4}, {6,-3}, {6,-2}, {6,-1}, {6,0}, {6,1}, {6,2}, {6,3}, {6,4}, {6,5}, {6,6}, {6,7}, {7,-8}, {7,-7}, {7,-6}, {7,-5}, {7,-4}, {7,-3}, {7,-2}, {7,-1}, {7,0}, {7,1}, {7,2}, {7,3}, {7,4}, {7,5}, {7,6}, {7,7}, },
    -- it is better without extra tiles for the walls, but this is needed over water, maybe in the future filter these by water tiles
    ["mineral-grey-dirt-2"] = {{-21,-4}, {-21,-3}, {-21,-2}, {-21,-1}, {-21,0}, {-21,1}, {-21,2}, {-21,3}, {-20,-10}, {-20,-9}, {-20,-8}, {-20,-7}, {-20,-6}, {-20,-5}, {-20,-4}, {-20,-3}, {-20,-2}, {-20,-1}, {-20,0}, {-20,1}, {-20,2}, {-20,3}, {-20,4}, {-20,5}, {-20,6}, {-20,7}, {-20,8}, {-19,-11}, {-19,-10}, {-19,8}, {-19,9}, {-18,-12}, {-18,-11}, {-18,9}, {-18,10}, {-17,-13}, {-17,-12}, {-17,10}, {-17,11}, {-16,-14}, {-16,-13}, {-16,11}, {-16,12}, {-15,-15}, {-15,-14}, {-15,12}, {-15,13}, {-14,-16}, {-14,-15}, {-14,13}, {-14,14}, {-13,-17}, {-13,-16}, {-13,14}, {-13,15}, {-12,-18}, {-12,-17}, {-12,15}, {-12,16}, {-11,-19}, {-11,-18}, {-11,16}, {-11,17}, {-10,-20}, {-10,-19}, {-10,17}, {-10,18}, {-9,-20}, {-9,18}, {-9,19}, {-8,-20}, {-8,19}, {-7,-20}, {-7,19}, {-6,-20}, {-6,19}, {-5,-20}, {-5,19}, {-4,-21}, {-4,-20}, {-4,19}, {-4,20}, {-3,-21}, {-3,-20}, {-3,19}, {-3,20}, {-2,-21}, {-2,-20}, {-2,19}, {-2,20}, {-1,-21}, {-1,-20}, {-1,19}, {-1,20}, {0,-21}, {0,-20}, {0,19}, {0,20}, {1,-21}, {1,-20}, {1,19}, {1,20}, {2,-21}, {2,-20}, {2,19}, {2,20}, {3,-21}, {3,-20}, {3,19}, {3,20}, {4,-20}, {4,19}, {5,-20}, {5,19}, {6,-20}, {6,19}, {7,-20}, {7,19}, {8,-20}, {8,-19}, {8,18}, {8,19}, {9,-19}, {9,-18}, {9,17}, {9,18}, {10,-18}, {10,-17}, {10,16}, {10,17}, {11,-17}, {11,-16}, {11,15}, {11,16}, {12,-16}, {12,-15}, {12,14}, {12,15}, {13,-15}, {13,-14}, {13,13}, {13,14}, {14,-14}, {14,-13}, {14,12}, {14,13}, {15,-13}, {15,-12}, {15,11}, {15,12}, {16,-12}, {16,-11}, {16,10}, {16,11}, {17,-11}, {17,-10}, {17,9}, {17,10}, {18,-10}, {18,-9}, {18,8}, {18,9}, {19,-9}, {19,-8}, {19,-7}, {19,-6}, {19,-5}, {19,-4}, {19,-3}, {19,-2}, {19,-1}, {19,0}, {19,1}, {19,2}, {19,3}, {19,4}, {19,5}, {19,6}, {19,7}, {19,8}, {20,-4}, {20,-3}, {20,-2}, {20,-1}, {20,0}, {20,1}, {20,2}, {20,3}, },

  },
  under_tiles = {
    ["volcanic-orange-heat-1"] = {
      -- copy all tile positions from above
{-19,-3}, {-19,2}, {-18,-3}, {-18,2}, {-17,-3}, {-17,2}, {-16,-3}, {-16,2}, {-15,-3}, {-15,2}, {-14,-3}, {-14,2}, {-13,-4}, {-13,3}, {-12,-9}, {-12,-8}, {-12,-7}, {-12,-6}, {-12,-5}, {-12,4}, {-12,5}, {-12,6}, {-12,7}, {-12,8}, {-11,-10}, {-11,9}, {-10,-11}, {-10,10}, {-9,-12}, {-9,11}, {-8,-12}, {-8,11}, {-7,-12}, {-7,11}, {-6,-12}, {-6,11}, {-5,-12}, {-5,11}, {-4,-13}, {-4,12}, {-3,-19}, {-3,-18}, {-3,-17}, {-3,-16}, {-3,-15}, {-3,-14}, {-3,13}, {-3,14}, {-3,15}, {-3,16}, {-3,17}, {-3,18}, {-2,-15}, {-2,14}, {-1,-15}, {-1,14}, {0,-15}, {0,14}, {1,-15}, {1,14}, {2,-19}, {2,-18}, {2,-17}, {2,-16}, {2,-15}, {2,-14}, {2,13}, {2,14}, {2,15}, {2,16}, {2,17}, {2,18}, {3,-13}, {3,12}, {4,-12}, {4,11}, {5,-12}, {5,11}, {6,-12}, {6,11}, {7,-12}, {7,11}, {8,-12}, {8,11}, {9,-11}, {9,10}, {10,-10}, {10,9}, {11,-9}, {11,-8}, {11,-7}, {11,-6}, {11,-5}, {11,4}, {11,5}, {11,6}, {11,7}, {11,8}, {12,-4}, {12,3}, {13,-3}, {13,2}, {14,-3}, {14,2}, {15,-3}, {15,2}, {16,-3}, {16,2}, {17,-3}, {17,2}, {18,-3}, {18,2},

{-19,-2}, {-19,-1}, {-19,0}, {-19,1}, {-18,-2}, {-18,-1}, {-18,0}, {-18,1}, {-17,-2}, {-17,-1}, {-17,0}, {-17,1}, {-16,-2}, {-16,-1}, {-16,0}, {-16,1}, {-15,-2}, {-15,-1}, {-15,0}, {-15,1}, {-14,-2}, {-14,-1}, {-14,0}, {-14,1}, {-13,-2}, {-13,-1}, {-13,0}, {-13,1}, {-12,-2}, {-12,-1}, {-12,0}, {-12,1}, {-11,-2}, {-11,-1}, {-11,0}, {-11,1}, {-10,-2}, {-10,-1}, {-10,0}, {-10,1}, {-3,-13}, {-3,-12}, {-3,-11}, {-3,10}, {-3,11}, {-3,12}, {-2,-19}, {-2,-18}, {-2,-17}, {-2,-16}, {-2,-14}, {-2,-13}, {-2,-12}, {-2,-11}, {-2,-10}, {-2,9}, {-2,10}, {-2,11}, {-2,12}, {-2,13}, {-2,15}, {-2,16}, {-2,17}, {-2,18}, {-1,-19}, {-1,-18}, {-1,-17}, {-1,-16}, {-1,-14}, {-1,-13}, {-1,-12}, {-1,-11}, {-1,-10}, {-1,9}, {-1,10}, {-1,11}, {-1,12}, {-1,13}, {-1,15}, {-1,16}, {-1,17}, {-1,18}, {0,-19}, {0,-18}, {0,-17}, {0,-16}, {0,-14}, {0,-13}, {0,-12}, {0,-11}, {0,-10}, {0,9}, {0,10}, {0,11}, {0,12}, {0,13}, {0,15}, {0,16}, {0,17}, {0,18}, {1,-19}, {1,-18}, {1,-17}, {1,-16}, {1,-14}, {1,-13}, {1,-12}, {1,-11}, {1,-10}, {1,9}, {1,10}, {1,11}, {1,12}, {1,13}, {1,15}, {1,16}, {1,17}, {1,18}, {2,-13}, {2,-12}, {2,-11}, {2,10}, {2,11}, {2,12}, {9,-2}, {9,-1}, {9,0}, {9,1}, {10,-2}, {10,-1}, {10,0}, {10,1}, {11,-2}, {11,-1}, {11,0}, {11,1}, {12,-2}, {12,-1}, {12,0}, {12,1}, {13,-2}, {13,-1}, {13,0}, {13,1}, {14,-2}, {14,-1}, {14,0}, {14,1}, {15,-2}, {15,-1}, {15,0}, {15,1}, {16,-2}, {16,-1}, {16,0}, {16,1}, {17,-2}, {17,-1}, {17,0}, {17,1}, {18,-2}, {18,-1}, {18,0}, {18,1},
{-11,-9}, {-11,-8}, {-11,-7}, {-11,-6}, {-11,-5}, {-10,-10}, {-10,-9}, {-10,-8}, {-10,-7}, {-10,-6}, {-10,-5}, {-9,-11}, {-9,-10}, {-8,-11}, {-8,-10}, {-7,-11}, {-7,-10}, {-6,-11}, {-6,-10}, {-5,-11}, {-5,-10}, {4,9}, {4,10}, {5,9}, {5,10}, {6,9}, {6,10}, {7,9}, {7,10}, {8,9}, {8,10}, {9,4}, {9,5}, {9,6}, {9,7}, {9,8}, {9,9}, {10,4}, {10,5}, {10,6}, {10,7}, {10,8},

{-11,4}, {-11,5}, {-11,6}, {-11,7}, {-11,8}, {-10,4}, {-10,5}, {-10,6}, {-10,7}, {-10,8}, {-10,9}, {-9,9}, {-9,10}, {-8,9}, {-8,10}, {-7,9}, {-7,10}, {-6,9}, {-6,10}, {-5,9}, {-5,10}, {4,-11}, {4,-10}, {5,-11}, {5,-10}, {6,-11}, {6,-10}, {7,-11}, {7,-10}, {8,-11}, {8,-10}, {9,-10}, {9,-9}, {9,-8}, {9,-7}, {9,-6}, {9,-5}, {10,-9}, {10,-8}, {10,-7}, {10,-6}, {10,-5},

{-9,-9}, {-9,-8}, {-9,-7}, {-9,-6}, {-9,-5}, {-9,-4}, {-9,-3}, {-9,-2}, {-9,-1}, {-9,0}, {-9,1}, {-9,2}, {-9,3}, {-9,4}, {-9,5}, {-9,6}, {-9,7}, {-9,8}, {-8,-9}, {-8,8}, {-7,-9}, {-7,8}, {-6,-9}, {-6,8}, {-5,-9}, {-5,8}, {-4,-9}, {-4,8}, {-3,-9}, {-3,8}, {-2,-9}, {-2,8}, {-1,-9}, {-1,8}, {0,-9}, {0,8}, {1,-9}, {1,8}, {2,-9}, {2,8}, {3,-9}, {3,8}, {4,-9}, {4,8}, {5,-9}, {5,8}, {6,-9}, {6,8}, {7,-9}, {7,8}, {8,-9}, {8,-8}, {8,-7}, {8,-6}, {8,-5}, {8,-4}, {8,-3}, {8,-2}, {8,-1}, {8,0}, {8,1}, {8,2}, {8,3}, {8,4}, {8,5}, {8,6}, {8,7}, {8,8},

{-8,-8}, {-8,-7}, {-8,-6}, {-8,-5}, {-8,-4}, {-8,-3}, {-8,-2}, {-8,-1}, {-8,0}, {-8,1}, {-8,2}, {-8,3}, {-8,4}, {-8,5}, {-8,6}, {-8,7}, {-7,-8}, {-7,-7}, {-7,-6}, {-7,-5}, {-7,-4}, {-7,-3}, {-7,-2}, {-7,-1}, {-7,0}, {-7,1}, {-7,2}, {-7,3}, {-7,4}, {-7,5}, {-7,6}, {-7,7}, {-6,-8}, {-6,-7}, {-6,-6}, {-6,-5}, {-6,-4}, {-6,-3}, {-6,-2}, {-6,-1}, {-6,0}, {-6,1}, {-6,2}, {-6,3}, {-6,4}, {-6,5}, {-6,6}, {-6,7}, {-5,-8}, {-5,-7}, {-5,-6}, {-5,-5}, {-5,-4}, {-5,-3}, {-5,-2}, {-5,-1}, {-5,0}, {-5,1}, {-5,2}, {-5,3}, {-5,4}, {-5,5}, {-5,6}, {-5,7}, {-4,-8}, {-4,-7}, {-4,-6}, {-4,-5}, {-4,-4}, {-4,-3}, {-4,-2}, {-4,-1}, {-4,0}, {-4,1}, {-4,2}, {-4,3}, {-4,4}, {-4,5}, {-4,6}, {-4,7}, {-3,-8}, {-3,-7}, {-3,-6}, {-3,-5}, {-3,-4}, {-3,-3}, {-3,-2}, {-3,-1}, {-3,0}, {-3,1}, {-3,2}, {-3,3}, {-3,4}, {-3,5}, {-3,6}, {-3,7}, {-2,-8}, {-2,-7}, {-2,-6}, {-2,-5}, {-2,-4}, {-2,-3}, {-2,-2}, {-2,-1}, {-2,0}, {-2,1}, {-2,2}, {-2,3}, {-2,4}, {-2,5}, {-2,6}, {-2,7}, {-1,-8}, {-1,-7}, {-1,-6}, {-1,-5}, {-1,-4}, {-1,-3}, {-1,-2}, {-1,-1}, {-1,0}, {-1,1}, {-1,2}, {-1,3}, {-1,4}, {-1,5}, {-1,6}, {-1,7}, {0,-8}, {0,-7}, {0,-6}, {0,-5}, {0,-4}, {0,-3}, {0,-2}, {0,-1}, {0,0}, {0,1}, {0,2}, {0,3}, {0,4}, {0,5}, {0,6}, {0,7}, {1,-8}, {1,-7}, {1,-6}, {1,-5}, {1,-4}, {1,-3}, {1,-2}, {1,-1}, {1,0}, {1,1}, {1,2}, {1,3}, {1,4}, {1,5}, {1,6}, {1,7}, {2,-8}, {2,-7}, {2,-6}, {2,-5}, {2,-4}, {2,-3}, {2,-2}, {2,-1}, {2,0}, {2,1}, {2,2}, {2,3}, {2,4}, {2,5}, {2,6}, {2,7}, {3,-8}, {3,-7}, {3,-6}, {3,-5}, {3,-4}, {3,-3}, {3,-2}, {3,-1}, {3,0}, {3,1}, {3,2}, {3,3}, {3,4}, {3,5}, {3,6}, {3,7}, {4,-8}, {4,-7}, {4,-6}, {4,-5}, {4,-4}, {4,-3}, {4,-2}, {4,-1}, {4,0}, {4,1}, {4,2}, {4,3}, {4,4}, {4,5}, {4,6}, {4,7}, {5,-8}, {5,-7}, {5,-6}, {5,-5}, {5,-4}, {5,-3}, {5,-2}, {5,-1}, {5,0}, {5,1}, {5,2}, {5,3}, {5,4}, {5,5}, {5,6}, {5,7}, {6,-8}, {6,-7}, {6,-6}, {6,-5}, {6,-4}, {6,-3}, {6,-2}, {6,-1}, {6,0}, {6,1}, {6,2}, {6,3}, {6,4}, {6,5}, {6,6}, {6,7}, {7,-8}, {7,-7}, {7,-6}, {7,-5}, {7,-4}, {7,-3}, {7,-2}, {7,-1}, {7,0}, {7,1}, {7,2}, {7,3}, {7,4}, {7,5}, {7,6}, {7,7},
    }
  },
  blueprint_strings = {
    { -- walls, heat piptes, gates
      string = "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"
    }
  }
}

return interburbulator_platform

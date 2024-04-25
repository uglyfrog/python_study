local ICONPATH = "__nullius__/graphics/icons/"
local ENTICONPATH = "__nullius__/graphics/icons/entity/"
local ENTITYPATH = "__nullius__/graphics/entity/"

data:extend({
  {
    type = "recipe",
    name = "nullius-stone-block",
    enabled = false,
    category = "medium-crafting",
    order = "nullius-bb",
    allow_decomposition = false,
    always_show_made_in = true,
    energy_required = 3,
    ingredients = {
      {"stone", 2}
    },
    results = {
      {type="item", name="stone-brick", amount=5},
      {type="item", name="nullius-gravel", amount=1}
    },
    main_product = "stone-brick"
  },
  {
    type = "recipe",
    name = "nullius-boxed-stone-brick",
    enabled = false,
    category = "huge-assembly",
    subgroup = "boxed-terrain",
    allow_decomposition = false,
    always_show_made_in = true,
    energy_required = 30,
    ingredients = {
      {"nullius-box-stone", 4}
    },
    results = {
      {type="item", name="nullius-box-stone-brick", amount=5},
      {type="item", name="nullius-box-gravel", amount=2}
    },
    main_product = "nullius-box-stone-brick"
  },
  {
    type = "recipe",
    name = "nullius-limestone-block",
    localised_name = {"recipe-name.nullius-limestone-brick"},
    icons = {
      {
        icon = "__base__/graphics/icons/stone-brick.png",
        icon_size = 64,
        icon_mipmaps = 4
      },
      {
        icon = "__angelsrefining__/graphics/icons/angels-ore6/angels-ore6-3.png",
        tint = {0.898, 0.773, 0.688},
        icon_size = 32,
        scale = 0.5,
        shift = {-12, -12}
      }
    },
    enabled = false,
    category = "medium-crafting",
    order = "nullius-bd",
    allow_decomposition = false,
    allow_as_intermediate = false,
    always_show_made_in = true,
    energy_required = 5,
    ingredients = {
      {"nullius-limestone", 4}
    },
    results = {
      {type="item", name="stone-brick", amount=12},
      {type="item", name="nullius-crushed-limestone", amount=1}
    },
    main_product = "stone-brick"
  },
  {
    type = "recipe",
    name = "nullius-sandstone-block",
    localised_name = {"recipe-name.nullius-sandstone-brick"},
    icons = {
      {
        icon = "__base__/graphics/icons/stone-brick.png",
        icon_size = 64,
        icon_mipmaps = 4
      },
      {
        icon = "__angelsrefining__/graphics/icons/angels-ore6/angels-ore6-2.png",
        tint = {0.690, 0.611, 0.427},
        icon_size = 32,
        scale = 0.5,
        shift = {-12, -12}
      }
    },
    enabled = false,
    category = "medium-crafting",
    order = "nullius-bc",
    allow_decomposition = false,
    allow_as_intermediate = false,
    always_show_made_in = true,
    energy_required = 4,
    ingredients = {
      {"nullius-sandstone", 3}
    },
    results = {
      {type="item", name="stone-brick", amount=10},
      {type="item", name="nullius-sand", amount=1}
    },
    main_product = "stone-brick"
  },

  {
    type = "recipe",
    name = "nullius-inserter-1",
    enabled = false,
    always_show_made_in = true,
    show_amount_in_title = false,
    always_show_products = true,
    category = "small-crafting",
    energy_required = 5,
    ingredients = {
      {"nullius-motor-1", 1},
      {"nullius-iron-gear", 2},
      {"nullius-iron-rod", 3}
    },
    result = "inserter",
    result_count = 3
  },
  {
    type = "recipe",
    name = "nullius-boxed-inserter-1",
    enabled = false,
    always_show_made_in = true,
    show_amount_in_title = false,
    always_show_products = true,
    category = "large-assembly",
    subgroup = "boxed-inserter",
    energy_required = 20,
    ingredients = {
      {"nullius-box-motor-1", 1},
      {"nullius-box-steel-gear", 1},
      {"nullius-box-steel-rod", 2}
    },
    result = "nullius-box-inserter-1",
    result_count = 4
  },
  {
    type = "recipe",
    name = "nullius-inserter-2",
    enabled = false,
    always_show_made_in = true,
    category = "small-crafting",
    energy_required = 3,
    ingredients = {
      {"inserter", 1},
      {"nullius-motor-1", 1},
      {"nullius-steel-gear", 1},
      {"nullius-aluminum-rod", 1}
    },
    result = "turbo-inserter"
  },
  {
    type = "recipe",
    name = "nullius-boxed-inserter-2",
    enabled = false,
    always_show_made_in = true,
    category = "large-assembly",
    subgroup = "boxed-inserter",
    energy_required = 15,
    ingredients = {
      {"nullius-box-inserter-1", 1},
      {"nullius-box-motor-1", 1},
      {"nullius-box-steel-gear", 1},
      {"nullius-box-aluminum-rod", 1}
    },
    result = "nullius-box-inserter-2"
  },
  {
    type = "recipe",
    name = "nullius-filter-inserter-2",
    enabled = false,
    always_show_made_in = true,
    category = "small-crafting",
    energy_required = 1,
    ingredients = {
      {"turbo-inserter", 1},
      {"decider-combinator", 1}
    },
    result = "turbo-filter-inserter"
  },
  {
    type = "recipe",
    name = "nullius-boxed-filter-inserter-2",
    enabled = false,
    always_show_made_in = true,
    category = "large-assembly",
    subgroup = "boxed-inserter",
    energy_required = 5,
    ingredients = {
      {"nullius-box-inserter-2", 1},
      {"nullius-box-logic-circuit", 1}
    },
    result = "nullius-box-filter-inserter-2"
  },

  {
    type = "recipe",
    name = "nullius-inserter-3",
    enabled = false,
    always_show_made_in = true,
    category = "small-crafting",
    energy_required = 4,
    ingredients = {
      {"turbo-filter-inserter", 1},
      {"nullius-motor-2", 1},
      {"nullius-bearing", 1},
      {"nullius-rubber", 2}
    },
    result = "stack-inserter"
  },
  {
    type = "recipe",
    name = "nullius-boxed-inserter-3",
    enabled = false,
    always_show_made_in = true,
    category = "large-assembly",
    subgroup = "boxed-inserter",
    energy_required = 20,
    ingredients = {
      {"nullius-box-filter-inserter-2", 1},
      {"nullius-box-motor-2", 1},
      {"nullius-box-bearing", 1},
      {"nullius-box-rubber", 2}
    },
    result = "nullius-box-inserter-3"
  },
  {
    type = "recipe",
    name = "nullius-filter-inserter-3",
    enabled = false,
    always_show_made_in = true,
    category = "small-crafting",
    energy_required = 1,
    ingredients = {
      {"stack-inserter", 1},
      {"nullius-sensor-1", 1}
    },
    result = "stack-filter-inserter"
  },
  {
    type = "recipe",
    name = "nullius-boxed-filter-inserter-3",
    enabled = false,
    always_show_made_in = true,
    category = "large-assembly",
    subgroup = "boxed-inserter",
    energy_required = 5,
    ingredients = {
      {"nullius-box-inserter-3", 1},
      {"nullius-box-sensor-1", 1}
    },
    result = "nullius-box-filter-inserter-3"
  },

  {
    type = "recipe",
    name = "nullius-inserter-4",
    enabled = false,
    always_show_made_in = true,
    category = "small-crafting",
    energy_required = 6,
    ingredients = {
      {"stack-filter-inserter", 2},
      {"nullius-motor-3", 1},
      {"nullius-titanium-rod", 2},
      {"nullius-carbon-composite", 3}
    },
    result = "express-stack-inserter"
  },
  {
    type = "recipe",
    name = "nullius-boxed-inserter-4",
    enabled = false,
    always_show_made_in = true,
    category = "large-assembly",
    subgroup = "boxed-inserter",
    energy_required = 30,
    ingredients = {
      {"nullius-box-filter-inserter-3", 2},
      {"nullius-box-motor-3", 1},
      {"nullius-box-titanium-rod", 2},
      {"nullius-box-carbon-composite", 3}
    },
    result = "nullius-box-inserter-4"
  },
  {
    type = "recipe",
    name = "nullius-filter-inserter-4",
    enabled = false,
    always_show_made_in = true,
    category = "small-crafting",
    energy_required = 1,
    ingredients = {
      {"express-stack-inserter", 1},
      {"nullius-sensor-2", 1}
    },
    result = "express-stack-filter-inserter"
  },
  {
    type = "recipe",
    name = "nullius-boxed-filter-inserter-4",
    enabled = false,
    always_show_made_in = true,
    category = "large-assembly",
    subgroup = "boxed-inserter",
    energy_required = 5,
    ingredients = {
      {"nullius-box-inserter-4", 1},
      {"nullius-box-sensor-2", 1}
    },
    result = "nullius-box-filter-inserter-4"
  },

  {
    type = "recipe",
    name = "nullius-conveyor-belt-1",
    enabled = false,
    always_show_made_in = true,
    show_amount_in_title = false,
    always_show_products = true,
    category = "medium-crafting",
    energy_required = 4,
    ingredients = {
      {"nullius-motor-1", 1},
      {"nullius-iron-gear", 2},
      {"nullius-iron-sheet", 2},
      {"nullius-iron-rod", 2}
    },
    result = "transport-belt",
    result_count = 15
  },
  {
    type = "recipe",
    name = "nullius-boxed-belt-1",
    enabled = false,
    always_show_made_in = true,
    show_amount_in_title = false,
    always_show_products = true,
    category = "large-assembly",
    subgroup = "boxed-belt",
    energy_required = 12,
    ingredients = {
      {"nullius-box-motor-1", 1},
      {"nullius-box-iron-gear", 1},
      {"nullius-box-steel-sheet", 2},
      {"nullius-box-steel-rod", 1}
    },
    result = "nullius-box-belt-1",
    result_count = 18
  },
  {
    type = "recipe",
    name = "nullius-underground-belt-1",
    enabled = false,
    always_show_made_in = true,
    show_amount_in_title = false,
    always_show_products = true,
    category = "medium-crafting",
    energy_required = 3,
    ingredients = {
      {"transport-belt", 10},
      {"nullius-underground-pipe-1", 2}
    },
    result = "underground-belt",
    result_count = 2
  },
  {
    type = "recipe",
    name = "nullius-boxed-underground-belt-1",
    enabled = false,
    always_show_made_in = true,
    show_amount_in_title = false,
    always_show_products = true,
    category = "large-assembly",
    subgroup = "boxed-belt",
    energy_required = 15,
    ingredients = {
      {"nullius-box-belt-1", 10},
      {"nullius-box-underground-pipe-1", 2}
    },
    result = "nullius-box-underground-belt-1",
    result_count = 2
  },
  {
    type = "recipe",
    name = "nullius-splitter-1",
    enabled = false,
    always_show_made_in = true,
    show_amount_in_title = false,
    always_show_products = true,
    category = "medium-crafting",
    energy_required = 3,
    ingredients = {
      {"underground-belt", 2},
      {"nullius-plastic", 2}
    },
    result = "splitter"
  },
  {
    type = "recipe",
    name = "nullius-boxed-splitter-1",
    localised_name = {"recipe-name.nullius-boxed", {"entity-name.nullius-splitter-1"}},
    icons = {
      {
        icon = ICONPATH .. "crate.png",
        icon_size = 64
      },
      {
        icon = "__base__/graphics/icons/splitter.png",
        icon_size = 64,
        scale = 0.45
      }
    },
    enabled = false,
    always_show_made_in = true,
    show_amount_in_title = false,
    always_show_products = true,
    category = "large-assembly",
    subgroup = "boxed-belt",
    energy_required = 15,
    ingredients = {
      {"nullius-box-underground-belt-1", 2},
      {"nullius-box-plastic", 2}
    },
    result = "splitter",
    result_count = 5
  },

  {
    type = "recipe",
    name = "nullius-conveyor-belt-2",
    enabled = false,
    always_show_made_in = true,
    show_amount_in_title = false,
    always_show_products = true,
    category = "large-fluid-assembly",
    energy_required = 4,
    ingredients = {
      {type="item", name="transport-belt", amount=6},
      {type="item", name="nullius-motor-2", amount=1},
      {type="item", name="nullius-steel-gear", amount=2},
      {type="item", name="nullius-rubber", amount=4},
      {type="fluid", name="nullius-lubricant", amount=10, fluidbox_index=1}
    },
    result = "fast-transport-belt",
    result_count = 6
  },
  {
    type = "recipe",
    name = "nullius-boxed-belt-2",
    enabled = false,
    always_show_made_in = true,
    show_amount_in_title = false,
    always_show_products = true,
    category = "large-fluid-assembly",
    subgroup = "boxed-belt",
    energy_required = 20,
    ingredients = {
      {type="item", name="nullius-box-belt-1", amount=6},
      {type="item", name="nullius-box-motor-2", amount=1},
      {type="item", name="nullius-box-steel-gear", amount=2},
      {type="item", name="nullius-box-rubber", amount=4},
      {type="fluid", name="nullius-lubricant", amount=50, fluidbox_index=1}
    },
    result = "nullius-box-belt-2",
    result_count = 6
  },
  {
    type = "recipe",
    name = "nullius-underground-belt-2",
    enabled = false,
    always_show_made_in = true,
    show_amount_in_title = false,
    always_show_products = true,
    category = "medium-crafting",
    energy_required = 4,
    ingredients = {
      {"fast-transport-belt", 10},
      {"underground-belt", 1},
      {"nullius-underground-pipe-2", 1}
    },
    result = "fast-underground-belt",
    result_count = 2
  },
  {
    type = "recipe",
    name = "nullius-boxed-underground-belt-2",
    enabled = false,
    always_show_made_in = true,
    show_amount_in_title = false,
    always_show_products = true,
    category = "large-assembly",
    subgroup = "boxed-belt",
    energy_required = 20,
    ingredients = {
      {"nullius-box-belt-2", 10},
      {"nullius-box-underground-belt-1", 1},
      {"nullius-box-underground-pipe-2", 1}
    },
    result = "nullius-box-underground-belt-2",
    result_count = 2
  },
  {
    type = "recipe",
    name = "nullius-splitter-2",
    enabled = false,
    always_show_made_in = true,
    show_amount_in_title = false,
    always_show_products = true,
    category = "medium-crafting",
    energy_required = 4,
    ingredients = {
      {"fast-underground-belt", 1},
      {"splitter", 1},
      {"nullius-steel-sheet", 4},
      {"decider-combinator", 1}
    },
    result = "fast-splitter"
  },
  {
    type = "recipe",
    name = "nullius-boxed-splitter-2",
    localised_name = {"recipe-name.nullius-boxed", {"entity-name.nullius-splitter-2"}},
    icons = {
      {
        icon = ICONPATH .. "crate.png",
        icon_size = 64
      },
      {
        icon = "__base__/graphics/icons/fast-splitter.png",
        icon_size = 64,
        scale = 0.45
      }
    },
    enabled = false,
    always_show_made_in = true,
    show_amount_in_title = false,
    always_show_products = true,
    category = "large-assembly",
    subgroup = "boxed-belt",
    energy_required = 20,
    ingredients = {
      {"nullius-box-underground-belt-2", 1},
      {"splitter", 5},
      {"nullius-box-steel-sheet", 4},
      {"nullius-box-logic-circuit", 1}
    },
    result = "fast-splitter",
    result_count = 5
  },

  {
    type = "recipe",
    name = "nullius-conveyor-belt-3",
    enabled = false,
    always_show_made_in = true,
    show_amount_in_title = false,
    always_show_products = true,
    category = "medium-crafting",
    energy_required = 5,
    ingredients = {
      {type="item", name="fast-transport-belt", amount=8},
      {type="item", name="nullius-textile", amount=4},
      {type="item", name="nullius-bearing", amount=2},
      {type="item", name="nullius-fiberglass", amount=3}
    },
    result = "express-transport-belt",
    result_count = 6
  },
  {
    type = "recipe",
    name = "nullius-boxed-belt-3",
    enabled = false,
    always_show_made_in = true,
    show_amount_in_title = false,
    always_show_products = true,
    category = "large-assembly",
    subgroup = "boxed-belt",
    energy_required = 25,
    ingredients = {
      {type="item", name="nullius-box-belt-2", amount=8},
      {type="item", name="nullius-box-textile", amount=4},
      {type="item", name="nullius-box-bearing", amount=2},
      {type="item", name="nullius-box-fiberglass", amount=3}
    },
    result = "nullius-box-belt-3",
    result_count = 6
  },
  {
    type = "recipe",
    name = "nullius-underground-belt-3",
    enabled = false,
    always_show_made_in = true,
    show_amount_in_title = false,
    always_show_products = true,
    category = "medium-crafting",
    energy_required = 5,
    ingredients = {
      {"express-transport-belt", 12},
      {"fast-underground-belt", 2},
      {"nullius-underground-pipe-3", 1}
    },
    result = "express-underground-belt",
    result_count = 2
  },
  {
    type = "recipe",
    name = "nullius-boxed-underground-belt-3",
    enabled = false,
    always_show_made_in = true,
    show_amount_in_title = false,
    always_show_products = true,
    category = "large-assembly",
    subgroup = "boxed-belt",
    energy_required = 25,
    ingredients = {
      {"nullius-box-belt-3", 12},
      {"nullius-box-underground-belt-2", 2},
      {"nullius-box-underground-pipe-3", 1}
    },
    result = "nullius-box-underground-belt-3",
    result_count = 2
  },
  {
    type = "recipe",
    name = "nullius-splitter-3",
    enabled = false,
    always_show_made_in = true,
    show_amount_in_title = false,
    always_show_products = true,
    category = "medium-crafting",
    energy_required = 5,
    ingredients = {
      {"express-underground-belt", 1},
      {"fast-splitter", 1},
      {"nullius-sensor-1", 1}
    },
    result = "express-splitter"
  },
  {
    type = "recipe",
    name = "nullius-boxed-splitter-3",
    localised_name = {"recipe-name.nullius-boxed", {"entity-name.nullius-splitter-3"}},
    icons = {
      {
        icon = ICONPATH .. "crate.png",
        icon_size = 64
      },
      {
        icon = "__base__/graphics/icons/express-splitter.png",
        icon_size = 64,
        scale = 0.45
      }
    },
    enabled = false,
    always_show_made_in = true,
    show_amount_in_title = false,
    always_show_products = true,
    category = "large-assembly",
    subgroup = "boxed-inserter",
    order = "nullius-pb",
    energy_required = 25,
    ingredients = {
      {"nullius-box-underground-belt-3", 1},
      {"fast-splitter", 5},
      {"nullius-box-sensor-1", 1}
    },
    result = "express-splitter",
    result_count = 5
  },

  {
    type = "recipe",
    name = "nullius-conveyor-belt-4",
    enabled = false,
    always_show_made_in = true,
    show_amount_in_title = false,
    always_show_products = true,
    category = "medium-crafting",
    energy_required = 15,
    ingredients = {
      {type="item", name="express-transport-belt", amount=16},
      {type="item", name="nullius-motor-3", amount=2},
      {type="item", name="nullius-carbon-composite", amount=8},
      {type="item", name="nullius-titanium-sheet", amount=5},
      {type="item", name="nullius-transformer", amount=1}
    },
    result = "ultimate-transport-belt",
    result_count = 10
  },
  {
    type = "recipe",
    name = "nullius-boxed-conveyor-belt-4",
    enabled = false,
    always_show_made_in = true,
    show_amount_in_title = false,
    always_show_products = true,
    category = "large-assembly",
    subgroup = "boxed-belt",
    energy_required = 75,
    ingredients = {
      {type="item", name="nullius-box-belt-3", amount=16},
      {type="item", name="nullius-box-motor-3", amount=2},
      {type="item", name="nullius-box-carbon-composite", amount=8},
      {type="item", name="nullius-box-titanium-sheet", amount=5},
      {type="item", name="nullius-box-transformer", amount=1}
    },
    result = "nullius-box-belt-4",
    result_count = 10
  },
  {
    type = "recipe",
    name = "nullius-underground-belt-4",
    enabled = false,
    always_show_made_in = true,
    show_amount_in_title = false,
    always_show_products = true,
    category = "medium-crafting",
    energy_required = 8,
    ingredients = {
      {"ultimate-transport-belt", 16},
      {"express-underground-belt", 2},
      {"nullius-underground-pipe-4", 2}
    },
    result = "ultimate-underground-belt",
    result_count = 2
  },
  {
    type = "recipe",
    name = "nullius-boxed-underground-belt-4",
    enabled = false,
    always_show_made_in = true,
    show_amount_in_title = false,
    always_show_products = true,
    category = "large-assembly",
    subgroup = "boxed-belt",
    energy_required = 40,
    ingredients = {
      {"nullius-box-belt-4", 16},
      {"nullius-box-underground-belt-3", 2},
      {"nullius-box-underground-pipe-4", 2}
    },
    result = "nullius-box-underground-belt-4",
    result_count = 2
  },
  {
    type = "recipe",
    name = "nullius-splitter-4",
    enabled = false,
    always_show_made_in = true,
    show_amount_in_title = false,
    always_show_products = true,
    category = "small-crafting",
    energy_required = 10,
    ingredients = {
      {"ultimate-underground-belt", 2},
      {"express-splitter", 2},
      {"express-stack-filter-inserter", 1}
    },
    result = "ultimate-splitter"
  },
  {
    type = "recipe",
    name = "nullius-boxed-splitter-4",
    localised_name = {"recipe-name.nullius-boxed", {"entity-name.nullius-splitter-4"}},
    icons = {
      {
        icon = ICONPATH .. "crate.png",
        icon_size = 64
      },
      {
        icon = ENTICONPATH .. "splitter4.png",
        icon_size = 64,
        scale = 0.45
      }
    },
    enabled = false,
    always_show_made_in = true,
    show_amount_in_title = false,
    always_show_products = true,
    category = "medium-only-assembly",
    subgroup = "boxed-inserter",
    order = "nullius-pc",
    energy_required = 50,
    ingredients = {
      {"nullius-box-underground-belt-4", 2},
      {"express-splitter", 10},
      {"nullius-box-filter-inserter-4", 1}
    },
    result = "ultimate-splitter",
    result_count = 5
  },

  {
    type = "recipe",
    name = "nullius-rail",
    enabled = false,
    category = "large-crafting",
    always_show_made_in = true,
    show_amount_in_title = false,
    always_show_products = true,
    energy_required = 3,
    ingredients = {
      {"nullius-steel-beam", 2},
      {"nullius-plastic", 3},
      {"nullius-steel-rod", 1},
      {"nullius-gravel", 3}
    },
    result = "rail",
    result_count = 2
  },
  {
    type = "recipe",
    name = "nullius-boxed-rail",
    enabled = false,
    category = "huge-assembly",
    subgroup = "boxed-rail",
    always_show_made_in = true,
    show_amount_in_title = false,
    always_show_products = true,
    energy_required = 15,
    ingredients = {
      {"nullius-box-steel-beam", 2},
      {"nullius-box-plastic", 3},
      {"nullius-box-steel-rod", 1},
      {"nullius-box-gravel", 3}
    },
    result = "nullius-box-rail",
    result_count = 2
  },

  {
    type = "recipe",
    name = "nullius-train-stop",
    enabled = false,
    category = "medium-crafting",
    always_show_made_in = true,
    energy_required = 5,
    ingredients = {
      {"nullius-steel-sheet", 5},
      {"decider-combinator", 2},
      {"programmable-speaker", 1},
      {"small-lamp", 2}
    },
    result = "train-stop"
  },
  {
    type = "recipe",
    name = "nullius-boxed-train-stop",
    enabled = false,
    category = "large-assembly",
    subgroup = "boxed-rail",
    always_show_made_in = true,
    energy_required = 25,
    ingredients = {
      {"nullius-box-steel-sheet", 5},
      {"nullius-box-logic-circuit", 2},
      {"nullius-box-antenna", 1},
      {"nullius-box-lamp-1", 2}
    },
    result = "nullius-box-train-stop"
  },
  {
    type = "recipe",
    name = "nullius-rail-signal",
    enabled = false,
    category = "small-crafting",
    always_show_made_in = true,
    energy_required = 1,
    ingredients = {
      {"decider-combinator", 1},
      {"small-lamp", 3},
      {"nullius-sensor-1", 1}
    },
    result = "rail-signal"
  },
  {
    type = "recipe",
    name = "nullius-boxed-rail-signal",
    enabled = false,
    category = "large-assembly",
    subgroup = "boxed-rail",
    always_show_made_in = true,
    energy_required = 5,
    ingredients = {
      {"nullius-box-logic-circuit", 1},
      {"nullius-box-lamp-1", 3},
      {"nullius-box-sensor-1", 1}
    },
    result = "nullius-box-rail-signal"
  },
  {
    type = "recipe",
    name = "nullius-chain-signal",
    enabled = false,
    category = "small-crafting",
    always_show_made_in = true,
    energy_required = 1,
    ingredients = {
      {"rail-signal", 1},
      {"copper-cable", 2}
    },
    result = "rail-chain-signal"
  },
  {
    type = "recipe",
    name = "nullius-boxed-chain-signal",
    enabled = false,
    category = "large-assembly",
    subgroup = "boxed-rail",
    always_show_made_in = true,
    energy_required = 5,
    ingredients = {
      {"nullius-box-rail-signal", 1},
      {"nullius-box-insulated-wire", 2}
    },
    result = "nullius-box-chain-signal"
  },

  {
    type = "recipe",
    name = "nullius-power-switch",
    enabled = false,
    category = "small-crafting",
    always_show_made_in = true,
    energy_required = 1,
    ingredients = {
      {"copper-cable", 2},
      {"nullius-steel-sheet", 1},
      {"nullius-rubber", 1},
      {"nullius-iron-rod", 1}
    },
    result = "power-switch"
  },
  {
    type = "recipe",
    name = "nullius-boxed-power-switch",
    enabled = false,
    category = "large-assembly",
    subgroup = "boxed-circuit",
    always_show_made_in = true,
    energy_required = 5,
    ingredients = {
      {"nullius-box-insulated-wire", 2},
      {"nullius-box-steel-sheet", 1},
      {"nullius-box-rubber", 1},
      {"nullius-box-iron-rod", 1}
    },
    result = "nullius-box-power-switch"
  },
  {
    type = "recipe",
    name = "nullius-red-wire",
    enabled = false,
    category = "small-crafting",
    always_show_made_in = true,
    show_amount_in_title = false,
    always_show_products = true,
    energy_required = 2,
    ingredients = {
      {"copper-cable", 5},
      {"decider-combinator", 1}
    },
    result = "red-wire",
    result_count = 8
  },
  {
    type = "recipe",
    name = "nullius-boxed-red-wire",
    enabled = false,
    category = "large-assembly",
    subgroup = "boxed-circuit",
    always_show_made_in = true,
    show_amount_in_title = false,
    always_show_products = true,
    energy_required = 10,
    ingredients = {
      {"nullius-box-insulated-wire", 5},
      {"nullius-box-logic-circuit", 1}
    },
    result = "nullius-box-red-wire",
    result_count = 8
  },
  {
    type = "recipe",
    name = "nullius-green-wire",
    enabled = false,
    category = "small-crafting",
    always_show_made_in = true,
    show_amount_in_title = false,
    always_show_products = true,
    energy_required = 1,
    ingredients = {
      {"red-wire", 5}
    },
    result = "green-wire",
    result_count = 4
  },
  {
    type = "recipe",
    name = "nullius-boxed-green-wire",
    enabled = false,
    category = "large-assembly",
    subgroup = "boxed-circuit",
    always_show_made_in = true,
    show_amount_in_title = false,
    always_show_products = true,
    energy_required = 5,
    ingredients = {
      {"nullius-box-red-wire", 5}
    },
    result = "nullius-box-green-wire",
    result_count = 4
  },

  {
    type = "recipe",
    name = "nullius-wall",
    enabled = false,
    category = "large-crafting",
    always_show_made_in = true,
    energy_required = 2,
    ingredients = {
      {"refined-concrete", 4},
      {"nullius-steel-beam", 3},
      {"nullius-insulation", 1},
      {"nullius-mortar", 1}
    },
    result = "stone-wall"
  },
  {
    type = "recipe",
    name = "nullius-boxed-wall",
    enabled = false,
    category = "huge-assembly",
    subgroup = "boxed-terrain",
    always_show_made_in = true,
    energy_required = 10,
    ingredients = {
      {"nullius-box-reinforced-concrete", 2},
      {"nullius-box-steel-beam", 3},
      {"nullius-box-insulation", 1},
      {"nullius-mortar", 5}
    },
    result = "nullius-box-wall"
  },
  {
    type = "recipe",
    name = "nullius-gate",
    enabled = false,
    category = "large-crafting",
    always_show_made_in = true,
    energy_required = 3,
    ingredients = {
      {"stone-wall", 1},
      {"nullius-steel-plate", 2},
      {"nullius-steel-gear", 1},
      {"nullius-motor-2", 1},
      {"nullius-sensor-1", 1},
      {"rail-signal", 1}
    },
    result = "gate"
  },
  {
    type = "recipe",
    name = "nullius-boxed-gate",
    enabled = false,
    category = "huge-assembly",
    subgroup = "boxed-terrain",
    always_show_made_in = true,
    energy_required = 15,
    ingredients = {
      {"nullius-box-wall", 1},
      {"nullius-box-steel-plate", 2},
      {"nullius-box-steel-gear", 1},
      {"nullius-box-motor-2", 1},
      {"nullius-box-sensor-1", 1},
      {"nullius-box-rail-signal", 1}
    },
    result = "nullius-box-gate"
  },

  {
    type = "recipe",
    name = "nullius-barrel",
    enabled = false,
    category = "large-crafting",
    subgroup = "canisters",
    order = "nullius-bb",
    always_show_made_in = true,
    allow_decomposition = false,
    show_amount_in_title = false,
    always_show_products = true,
    energy_required = 3,
    ingredients = {
      {type="item", name="nullius-small-tank-1", amount=1},
      {type="item", name="nullius-one-way-valve", amount=5}
    },
    result = "empty-barrel",
    result_count = 5
  },
  {
    type = "recipe",
    name = "nullius-boxed-barrel",
    enabled = false,
    category = "huge-assembly",
    subgroup = "boxed-canister",
    always_show_made_in = true,
    allow_decomposition = false,
    show_amount_in_title = false,
    always_show_products = true,
    energy_required = 15,
    ingredients = {
      {type="item", name="nullius-box-small-tank-1", amount=1},
      {type="item", name="nullius-box-one-way-valve", amount=5}
    },
    result = "nullius-box-barrel",
    result_count = 5
  },
  {
    type = "recipe",
    name = "nullius-barrel-recycling",
    localised_name = {"recipe-name.nullius-barrel-recycling"},
    icon = "__base__/graphics/icons/fluid/barreling/barrel-empty.png",
    icon_size = 64,
    icon_mipmaps = 4,
    enabled = false,
    category = "medium-crafting",
    subgroup = "canisters",
    order = "nullius-bc",
    always_show_made_in = true,
    no_productivity = true,
    allow_decomposition = false,
    allow_as_intermediate = false,
    energy_required = 2,
    ingredients = {
      {type="item", name="empty-barrel", amount=5}
    },
    results = {
      {type="item", name="nullius-iron-ingot", amount=2},
      {type="item", name="nullius-plastic", amount=2}
    }
  },


  {
    type = "recipe",
    name = "nullius-geology-pack-1",
    localised_name = {"recipe-name.nullius-geology-pack-1"},
    show_amount_in_title = false,
    always_show_products = true,
    always_show_made_in = true,
    enabled = false,
    category = "small-crafting",
    energy_required = 15,
    ingredients = {
      {"nullius-bauxite", 2},
      {"nullius-sandstone", 2},
      {"iron-ore", 2}
    },
    result = "nullius-geology-pack"
  },
  {
    type = "recipe",
    name = "nullius-geology-pack-2",
    localised_name = {"recipe-name.nullius-geology-pack-2"},
    show_amount_in_title = false,
    always_show_products = true,
    always_show_made_in = true,
    enabled = false,
    category = "small-crafting",
    energy_required = 8,
    ingredients = {
      {"nullius-crushed-iron-ore", 1},
      {"nullius-crushed-bauxite", 1},
      {"nullius-crushed-limestone", 1},
      {"nullius-sand", 1},
      {"nullius-mineral-dust", 4}
    },
    result = "nullius-geology-pack",
    result_count = 2
  },
  {
    type = "recipe",
    name = "nullius-boxed-geology-pack",
    show_amount_in_title = false,
    always_show_products = true,
    always_show_made_in = true,
    enabled = false,
    category = "large-assembly",
    subgroup = "boxed-science",
    energy_required = 40,
    ingredients = {
      {"nullius-box-crushed-iron-ore", 1},
      {"nullius-box-crushed-bauxite", 1},
      {"nullius-box-crushed-limestone", 1},
      {"nullius-box-sand", 1},
      {"nullius-box-mineral-dust", 4}
    },
    result = "nullius-box-geology-pack",
    result_count = 2
  },

  {
    type = "recipe",
    name = "nullius-mechanical-pack-1",
    localised_name = {"", {"item-name.nullius-mechanical-pack"}, " ", 1},
    enabled = false,
    always_show_made_in = true,
    show_amount_in_title = false,
    always_show_products = true,
    category = "medium-crafting",
    order = "nullius-db",
    energy_required = 15,
    ingredients = {
      {"nullius-motor-1", 1},
      {"nullius-iron-gear", 3}
    },
    result = "nullius-mechanical-pack"
  },
  {
    type = "recipe",
    name = "nullius-boxed-mechanical-pack-1",
    localised_name = {"", {"item-name.nullius-box", {"item-name.nullius-mechanical-pack"}}, " ", 1},
    enabled = false,
    always_show_made_in = true,
    show_amount_in_title = false,
    always_show_products = true,
    category = "large-assembly",
    subgroup = "boxed-science",
    order = "nullius-db",
    energy_required = 75,
    ingredients = {
      {"nullius-box-motor-1", 1},
      {"nullius-box-iron-gear", 3}
    },
    result = "nullius-box-mechanical-pack"
  },
  {
    type = "recipe",
    name = "nullius-mechanical-pack-2",
    localised_name = {"", {"item-name.nullius-mechanical-pack"}, " ", 2},
    enabled = false,
    always_show_made_in = true,
    show_amount_in_title = false,
    always_show_products = true,
    category = "medium-crafting",
    order = "nullius-dc",
    energy_required = 80,
    ingredients = {
      {"nullius-pump-3", 1},
      {"nullius-steel-cable", 5}
    },
    result = "nullius-mechanical-pack",
    result_count = 15
  },
  {
    type = "recipe",
    name = "nullius-boxed-mechanical-pack-2",
    localised_name = {"", {"item-name.nullius-box", {"item-name.nullius-mechanical-pack"}}, " ", 2},
    enabled = false,
    always_show_made_in = true,
    show_amount_in_title = false,
    always_show_products = true,
    category = "large-assembly",
    subgroup = "boxed-science",
    order = "nullius-dc",
    energy_required = 400,
    ingredients = {
      {"nullius-box-pump-3", 1},
      {"nullius-box-steel-cable", 5}
    },
    result = "nullius-box-mechanical-pack",
    result_count = 15
  },

  {
    type = "recipe",
    name = "nullius-electrical-pack",
    enabled = false,
    category = "small-crafting",
    always_show_made_in = true,
    show_amount_in_title = false,
    always_show_products = true,
    energy_required = 12,
    ingredients = {
      {"decider-combinator", 1},
      {"small-lamp", 1},
      {"copper-cable", 2},
      {"nullius-capacitor", 1}
    },
    result = "nullius-electrical-pack"
  },
  {
    type = "recipe",
    name = "nullius-boxed-electrical-pack",
    enabled = false,
    always_show_made_in = true,
    show_amount_in_title = false,
    always_show_products = true,
    category = "large-assembly",
    subgroup = "boxed-science",
    energy_required = 60,
    ingredients = {
      {"nullius-box-logic-circuit", 1},
      {"nullius-box-lamp-1", 1},
      {"nullius-box-insulated-wire", 2},
      {"nullius-box-capacitor", 1}
    },
    result = "nullius-box-electrical-pack"
  },
  {
    type = "recipe",
    name = "nullius-physics-pack",
    enabled = false,
    category = "huge-assembly",
    subgroup = "research-pack",
    order = "nullius-g",
    always_show_made_in = true,
    show_amount_in_title = false,
    always_show_products = true,
    energy_required = 400,
    ingredients = {
      {"nullius-stirling-engine-2", 1},
      {"nullius-nanofabricator-1", 1},
      {"nullius-box-underground-belt-3", 1},
      {"nullius-lab-2", 1},
      {"nullius-combustion-chamber-3", 1},
      {"nullius-substation-2", 1},
      {"nullius-drone-launcher-1", 1},
      {"nullius-box-missile-1", 3}
    },
    result = "nullius-box-physics-pack",
    result_count = 10
  },

  {
    type = "recipe",
    name = "nullius-crushed-copper-ore",
    enabled = false,
    category = "ore-crushing",
    energy_required = 4,
    ingredients = {
        {"copper-ore", 4}
    },
    results = {
      {type="item", name="nullius-crushed-copper-ore", amount=3},
      {type="item", name="stone", amount=1}
    },
    main_product = "nullius-crushed-copper-ore"
  },
  {
    type = "recipe",
    name = "nullius-boxed-crushed-copper-ore",
    enabled = false,
    category = "ore-crushing",
    subgroup = "boxed-copper",
    energy_required = 20,
    ingredients = {
        {"nullius-box-copper-ore", 4}
    },
    results = {
      {type="item", name="nullius-box-crushed-copper-ore", amount=3},
      {type="item", name="nullius-box-stone", amount=1}
    },
    main_product = "nullius-box-crushed-copper-ore"
  },
  {
    type = "recipe",
    name = "nullius-copper-solution",
    enabled = false,
    icon_size = 32,
    category = "ore-flotation",
    subgroup = "copper",
    order = "nullius-d",
    energy_required = 15,
    ingredients = {
      {type="item", name="nullius-crushed-copper-ore", amount=5},
      {type="fluid", name="nullius-acid-sulfuric", amount=25},
      {type="fluid", name="nullius-solvent", amount=15}
    },
    results = {
      {type="fluid", name="nullius-copper-solution", amount=40},
      {type="fluid", name="nullius-sludge", amount=20}
    },
    main_product = "nullius-copper-solution"
  },
  {
    type = "recipe",
    name = "nullius-boxed-copper-solution",
    localised_name = {"recipe-name.nullius-boxed", {"fluid-name.nullius-copper-solution"}},
    enabled = false,
    icon_size = 32,
    category = "ore-flotation",
    subgroup = "boxed-copper",
    order = "nullius-d",
    energy_required = 15,
    ingredients = {
      {type="item", name="nullius-box-crushed-copper-ore", amount=1},
      {type="fluid", name="nullius-acid-sulfuric", amount=25},
      {type="fluid", name="nullius-solvent", amount=15}
    },
    results = {
      {type="fluid", name="nullius-copper-solution", amount=40},
      {type="fluid", name="nullius-sludge", amount=20}
    },
    main_product = "nullius-copper-solution"
  },
  {
    type = "recipe",
    name = "nullius-copper-ingot",
    enabled = false,
    category = "nullius-electrolysis",
    energy_required = 1,
    ingredients = {
      {type="fluid", name="nullius-copper-solution", amount=20}
    },
    results = {
      {type="item", name="nullius-copper-ingot", amount=3},
      {type="fluid", name="nullius-wastewater", amount=10, fluidbox_index=1}
    },
    main_product = "nullius-copper-ingot"
  },
  {
    type = "recipe",
    name = "nullius-boxed-copper-ingot",
    enabled = false,
    category = "nullius-electrolysis",
    subgroup = "boxed-copper",
    energy_required = 5,
    ingredients = {
      {type="fluid", name="nullius-copper-solution", amount=100}
    },
    results = {
      {type="item", name="nullius-box-copper-ingot", amount=3},
      {type="fluid", name="nullius-wastewater", amount=50, fluidbox_index=1}
    },
    main_product = "nullius-box-copper-ingot"
  },
  {
    type = "recipe",
    name = "nullius-copper-wire",
    enabled = false,
    show_amount_in_title = false,
    always_show_products = true,
    category = "machine-casting",
    energy_required = 1,
    ingredients = {
      {type="item", name="nullius-copper-ingot", amount=1},
      {type="fluid", name="nullius-lubricant", amount=1}
    },
    result = "nullius-copper-wire",
    result_count = 2
  },
  {
    type = "recipe",
    name = "nullius-boxed-copper-wire",
    enabled = false,
    show_amount_in_title = false,
    always_show_products = true,
    category = "machine-casting",
    subgroup = "boxed-copper",
    energy_required = 5,
    ingredients = {
      {type="item", name="nullius-box-copper-ingot", amount=1},
      {type="fluid", name="nullius-lubricant", amount=5}
    },
    result = "nullius-box-copper-wire",
    result_count = 2
  },
  {
    type = "recipe",
    name = "nullius-copper-sheet",
    enabled = false,
    show_amount_in_title = false,
    always_show_products = true,
    category = "machine-casting",
    energy_required = 1,
    ingredients = {
      {type="item", name="nullius-copper-ingot", amount=1},
      {type="fluid", name="nullius-acid-sulfuric", amount=1}
    },
    result = "nullius-copper-sheet"
  },
  {
    type = "recipe",
    name = "nullius-boxed-copper-sheet",
    enabled = false,
    show_amount_in_title = false,
    always_show_products = true,
    category = "machine-casting",
    subgroup = "boxed-copper",
    energy_required = 5,
    ingredients = {
      {type="item", name="nullius-box-copper-ingot", amount=1},
      {type="fluid", name="nullius-acid-sulfuric", amount=5}
    },
    result = "nullius-box-copper-sheet"
  },

  {
    type = "recipe",
    name = "nullius-crushed-iron-ore",
    enabled = false,
    category = "ore-crushing",
    energy_required = 6,
    ingredients = {
        {"iron-ore", 8}
    },
    results = {
      {type="item", name="nullius-crushed-iron-ore", amount=7},
      {type="item", name="stone", amount=1}
    },
    main_product = "nullius-crushed-iron-ore"
  },
  {
    type = "recipe",
    name = "nullius-boxed-crushed-iron-ore",
    enabled = false,
    category = "ore-crushing",
    subgroup = "boxed-iron",
    energy_required = 30,
    ingredients = {
        {"nullius-box-iron-ore", 8}
    },
    results = {
      {type="item", name="nullius-box-crushed-iron-ore", amount=7},
      {type="item", name="nullius-box-stone", amount=1}
    },
    main_product = "nullius-box-crushed-iron-ore"
  },

  {
    type = "recipe",
    name = "nullius-iron-oxide",
    enabled = false,
    icon_size = 32,
    category = "ore-flotation",
    energy_required = 4,
    ingredients = {
      {type="item", name="nullius-crushed-iron-ore", amount=6},
      {type="fluid", name="nullius-caustic-solution", amount=40, fluidbox_index=1}
    },
    results = {
      {type="item", name="nullius-iron-oxide", amount=5},
      {type="fluid", name="nullius-sludge", amount=20, fluidbox_index=1}
    },
    main_product = "nullius-iron-oxide"
  },
  {
    type = "recipe",
    name = "nullius-boxed-iron-oxide",
    enabled = false,
    icon_size = 32,
    category = "ore-flotation",
    subgroup = "boxed-iron",
    energy_required = 20,
    ingredients = {
      {type="item", name="nullius-box-crushed-iron-ore", amount=6},
      {type="fluid", name="nullius-caustic-solution", amount=250, fluidbox_index=1}
    },
    results = {
      {type="item", name="nullius-box-iron-oxide", amount=5},
      {type="fluid", name="nullius-sludge", amount=100, fluidbox_index=1}
    },
    main_product = "nullius-box-iron-oxide"
  },

  {
    type = "recipe",
    name = "nullius-crushed-limestone-1",
    localised_name = {"", {"item-name.nullius-crushed-limestone"}, " ", 1},
    enabled = false,
    icon_size = 32,
    category = "ore-crushing",
    order = "nullius-db",
    energy_required = 4,
    ingredients = {
        {"nullius-limestone", 8}
    },
    results = {
      {type="item", name="nullius-crushed-limestone", amount=5},
      {type="item", name="stone", amount=3}
    },
    main_product = "nullius-crushed-limestone"
  },
  {
    type = "recipe",
    name = "nullius-boxed-crushed-limestone-1",
    localised_name = {"", {"item-name.nullius-box", {"item-name.nullius-crushed-limestone"}}, " ", 1},
    enabled = false,
    icon_size = 32,
    category = "ore-crushing",
    subgroup = "boxed-calcium",
    order = "nullius-cb",
    energy_required = 20,
    ingredients = {
        {"nullius-box-limestone", 8}
    },
    results = {
      {type="item", name="nullius-box-crushed-limestone", amount=5},
      {type="item", name="nullius-box-stone", amount=3}
    },
    main_product = "nullius-box-crushed-limestone"
  },
  {
    type = "recipe",
    name = "nullius-crushed-limestone-2",
    localised_name = {"", {"item-name.nullius-crushed-limestone"}, " ", 2},
    enabled = false,
    icon_size = 32,
    category = "ore-crushing",
    order = "nullius-dc",
    energy_required = 7,
    ingredients = {
        {"nullius-limestone", 15}
    },
    results = {
      {type="item", name="nullius-crushed-limestone", amount=10},
      {type="item", name="nullius-gypsum", amount=1},
      {type="item", name="stone", amount=5}
    },
    main_product = "nullius-crushed-limestone"
  },
  {
    type = "recipe",
    name = "nullius-boxed-crushed-limestone-2",
    localised_name = {"", {"item-name.nullius-box", {"item-name.nullius-crushed-limestone"}}, " ", 2},
    enabled = false,
    icon_size = 32,
    category = "ore-crushing",
    subgroup = "boxed-calcium",
    order = "nullius-cc",
    energy_required = 35,
    ingredients = {
        {"nullius-box-limestone", 15}
    },
    results = {
      {type="item", name="nullius-box-crushed-limestone", amount=10},
      {type="item", name="nullius-box-gypsum", amount=1},
      {type="item", name="nullius-box-stone", amount=5}
    },
    main_product = "nullius-box-crushed-limestone"
  },

  {
    type = "recipe",
    name = "nullius-crushed-bauxite",
    enabled = false,
    category = "ore-crushing",
    energy_required = 5,
    ingredients = {
        {"nullius-bauxite", 7}
    },
    results = {
      {type="item", name="nullius-crushed-bauxite", amount=5},
      {type="item", name="nullius-crushed-iron-ore", amount=1},
      {type="item", name="nullius-sand", amount=1}
    },
    main_product = "nullius-crushed-bauxite"
  },
  {
    type = "recipe",
    name = "nullius-boxed-crushed-bauxite",
    enabled = false,
    category = "ore-crushing",
    subgroup = "boxed-titanium",
    order = "nullius-b",
    energy_required = 25,
    ingredients = {
        {"nullius-box-bauxite", 7}
    },
    results = {
      {type="item", name="nullius-box-crushed-bauxite", amount=5},
      {type="item", name="nullius-box-crushed-iron-ore", amount=1},
      {type="item", name="nullius-box-sand", amount=1}
    },
    main_product = "nullius-box-crushed-bauxite"
  },

  {
    type = "recipe",
    name = "nullius-crushed-sandstone",
    enabled = false,
    category = "hand-crushing",
    always_show_made_in = true,
    allow_decomposition = false,
    energy_required = 4,
    ingredients = {
        {"nullius-sandstone", 5}
    },
    results = {
      {type="item", name="nullius-sand", amount=4},
      {type="item", name="stone", amount=1}
    },
    main_product = "nullius-sand"
  },
  {
    type = "recipe",
    name = "nullius-boxed-crushed-sandstone",
    enabled = false,
    category = "ore-crushing",
    subgroup = "boxed-silicon",
    always_show_made_in = true,
    allow_decomposition = false,
    energy_required = 20,
    ingredients = {
        {"nullius-box-sandstone", 5}
    },
    results = {
      {type="item", name="nullius-box-sand", amount=4},
      {type="item", name="nullius-box-stone", amount=1}
    },
    main_product = "nullius-box-sand"
  },

  {
    type = "recipe",
    name = "nullius-crushed-stone",
    enabled = false,
    icon_size = 32,
    category = "hand-crushing",
    always_show_made_in = true,
    show_amount_in_title = false,
    always_show_products = true,
    allow_decomposition = false,
    energy_required = 0.5,
    ingredients = {
        {"stone", 1}
    },
    result = "nullius-gravel"
  },
  {
    type = "recipe",
    name = "nullius-boxed-gravel",
    enabled = false,
    icon_size = 32,
    category = "ore-crushing",
    subgroup = "boxed-silicon",
    always_show_made_in = true,
    show_amount_in_title = false,
    always_show_products = true,
    allow_decomposition = false,
    energy_required = 2.5,
    ingredients = {
        {"nullius-box-stone", 1}
    },
    result = "nullius-box-gravel"
  },

  {
    type = "recipe",
    name = "nullius-gravel-disposal",
    localised_name = {"recipe-name.nullius-gravel-disposal"},
    show_amount_in_title = false,
    always_show_products = true,
    enabled = false,
    icon_size = 32,
    category = "ore-crushing",
    order = "nullius-nb",
    energy_required = 2,
    ingredients = {
        {"nullius-gravel", 4}
    },
    result = "nullius-mineral-dust",
    result_count = 3
  },
  {
    type = "recipe",
    name = "nullius-boxed-mineral-dust",
    show_amount_in_title = false,
    always_show_products = true,
    enabled = false,
    icon_size = 32,
    category = "ore-crushing",
    subgroup = "boxed-silicon",
    order = "nullius-nb",
    energy_required = 10,
    ingredients = {
        {"nullius-box-gravel", 4}
    },
    result = "nullius-box-mineral-dust",
    result_count = 3
  },
  {
    type = "recipe",
    name = "nullius-slag-reprocessing",
    localised_name = {"recipe-name.nullius-slag-reprocessing"},
    show_amount_in_title = false,
    always_show_products = true,
    enabled = false,
    icon_size = 32,
    category = "ore-crushing",
    order = "nullius-nc",
    energy_required = 4,
    ingredients = {
        {"nullius-gravel", 6}
    },
    results = {
      {type="item", name="nullius-sand", amount=2},
      {type="item", name="nullius-mineral-dust", amount=3}
    },
    main_product = "nullius-sand"
  },
  {
    type = "recipe",
    name = "nullius-boxed-slag-reprocessing",
    localised_name = {"recipe-name.nullius-boxed", {"recipe-name.nullius-slag-reprocessing"}},
    show_amount_in_title = false,
    always_show_products = true,
    enabled = false,
    icon_size = 32,
    category = "ore-crushing",
    subgroup = "boxed-silicon",
    order = "nullius-nc",
    energy_required = 20,
    ingredients = {
        {"nullius-box-gravel", 6}
    },
    results = {
      {type="item", name="nullius-box-sand", amount=2},
      {type="item", name="nullius-box-mineral-dust", amount=3}
    },
    main_product = "nullius-box-sand"
  },

  {
    type = "recipe",
    name = "nullius-iron-disposal",
    localised_name = {"recipe-name.nullius-iron-disposal"},
    icon_size = 32,
    show_amount_in_title = false,
    always_show_products = true,
    enabled = false,
    category = "ore-crushing",
    subgroup = "iron-ingot",
    order = "nullius-n",
    no_productivity = true,
    energy_required = 2,
    ingredients = {
        {"nullius-crushed-iron-ore", 4}
    },
    result = "nullius-gravel",
    result_count = 3
  },
  {
    type = "recipe",
    name = "nullius-bauxite-disposal",
    localised_name = {"recipe-name.nullius-bauxite-disposal"},
    show_amount_in_title = false,
    always_show_products = true,
    no_productivity = true,
    enabled = false,
    category = "ore-crushing",
    subgroup = "aluminum-product",
    order = "nullius-n",
    energy_required = 2,
    ingredients = {
        {"nullius-crushed-bauxite", 5}
    },
    result = "nullius-mineral-dust",
    result_count = 4
  },
  {
    type = "recipe",
    name = "nullius-limestone-disposal",
    localised_name = {"recipe-name.nullius-limestone-disposal"},
    show_amount_in_title = false,
    always_show_products = true,
    no_productivity = true,
    enabled = false,
    category = "ore-crushing",
    subgroup = "calcium-product",
    order = "nullius-m",
    energy_required = 2,
    ingredients = {
        {"nullius-crushed-limestone", 4}
    },
    result = "nullius-mineral-dust",
    result_count = 3
  },
  {
    type = "recipe",
    name = "nullius-boxed-limestone-disposal",
    localised_name = {"recipe-name.nullius-boxed", {"recipe-name.nullius-limestone-disposal"}},
    show_amount_in_title = false,
    always_show_products = true,
    no_productivity = true,
    enabled = false,
    category = "ore-crushing",
    subgroup = "boxed-calcium",
    order = "nullius-y",
    energy_required = 10,
    ingredients = {
        {"nullius-box-crushed-limestone", 4}
    },
    result = "nullius-box-mineral-dust",
    result_count = 3
  },

  {
    type = "recipe",
    name = "nullius-iron-ingot-1",
    localised_name = {"recipe-name.nullius-iron-ingot-1"},
    enabled = false,
    category = "dry-smelting",
    energy_required = 8,
    ingredients = {
      {"iron-ore", 5}
    },
    results = {
      {type="item", name="nullius-iron-ingot", amount=2},
      {type="item", name="nullius-gravel", amount=1}
    },
    main_product = "nullius-iron-ingot"
  },
  {
    type = "recipe",
    name = "nullius-iron-ingot-2",
    localised_name = {"recipe-name.nullius-iron-ingot-2"},
    enabled = false,
    category = "dry-smelting",
    energy_required = 15,
    ingredients = {
      {"nullius-crushed-iron-ore", 8},
      {"nullius-graphite", 1}
    },
    results = {
      {type="item", name="nullius-iron-ingot", amount=6},
      {type="item", name="nullius-gravel", amount=2}
    },
    main_product = "nullius-iron-ingot"
  },
  {
    type = "recipe",
    name = "nullius-iron-ingot-3",
    localised_name = {"recipe-name.nullius-iron-ingot-3"},
    enabled = false,
    category = "vent-smelting",
    energy_required = 18,
    ingredients = {
      {"nullius-iron-oxide", 7},
      {"nullius-crushed-limestone", 2},
      {"nullius-graphite", 2}
    },
    results = {
      {type="item", name="nullius-iron-ingot", amount=9},
      {type="item", name="nullius-gravel", amount=2},
      {type="item", name="nullius-lime", amount=1},
      {type="fluid", name="nullius-carbon-dioxide", amount=40}
    },
    main_product = "nullius-iron-ingot"
  },
  {
    type = "recipe",
    name = "nullius-boxed-iron-ingot",
    enabled = false,
    category = "bulk-smelting",
    subgroup = "boxed-iron",
    energy_required = 18,
    ingredients = {
      {"nullius-box-iron-oxide", 7},
      {"nullius-box-crushed-limestone", 2},
      {"nullius-box-graphite", 2}
    },
    results = {
      {type="item", name="nullius-box-iron-ingot", amount=9},
      {type="item", name="nullius-box-gravel", amount=2},
      {type="item", name="nullius-box-lime", amount=1},
      {type="fluid", name="nullius-carbon-dioxide", amount=200}
    },
    main_product = "nullius-box-iron-ingot"
  },

  {
    type = "recipe",
    name = "nullius-steel-ingot-1",
    localised_name = {"recipe-name.nullius-steel-ingot-1"},
    enabled = false,
    category = "machine-casting",
    energy_required = 12,
    ingredients = {
      {type="item", name="nullius-iron-ingot", amount=5},
      {type="fluid", name="nullius-oxygen", amount=60}
    },
    results = {
      {type="item", name="nullius-steel-ingot", amount=2},
      {type="item", name="nullius-gravel", amount=1},
      {type="fluid", name="nullius-carbon-dioxide", amount=25}
    },
    main_product = "nullius-steel-ingot"
  },
  {
    type = "recipe",
    name = "nullius-steel-ingot-2",
    localised_name = {"recipe-name.nullius-steel-ingot-2"},
    enabled = false,
    category = "wet-smelting",
    energy_required = 25,
    ingredients = {
      {type="item", name="nullius-iron-ingot", amount=11},
      {type="item", name="nullius-lime", amount=2},
      {type="fluid", name="nullius-oxygen", amount=100}
    },
    results = {
      {type="item", name="nullius-steel-ingot", amount=6},
      {type="item", name="nullius-gravel", amount=2},
      {type="item", name="nullius-crushed-limestone", amount=1}
    },
    main_product = "nullius-steel-ingot"
  },
  {
    type = "recipe",
    name = "nullius-boxed-steel-ingot-1",
    localised_name = {"", {"item-name.nullius-box", {"item-name.nullius-steel-ingot"}}, " ", 1},
    enabled = false,
    category = "bulk-smelting",
    subgroup = "boxed-steel",
    order = "nullius-ab",
    energy_required = 25,
    ingredients = {
      {type="item", name="nullius-box-iron-ingot", amount=11},
      {type="item", name="nullius-box-lime", amount=2},
      {type="fluid", name="nullius-oxygen", amount=500}
    },
    results = {
      {type="item", name="nullius-box-steel-ingot", amount=6},
      {type="item", name="nullius-box-gravel", amount=2},
      {type="item", name="nullius-box-crushed-limestone", amount=1}
    },
    main_product = "nullius-box-steel-ingot"
  },
  {
    type = "recipe",
    name = "nullius-steel-ingot-3",
    localised_name = {"", {"item-name.nullius-steel-ingot"}, " ", 3},
    enabled = false,
    category = "wet-smelting",
    energy_required = 60,
    ingredients = {
      {type="item", name="nullius-iron-ingot", amount=30},
      {type="item", name="nullius-calcium", amount=5},
      {type="item", name="nullius-boron", amount=1},
      {type="fluid", name="nullius-oxygen", amount=300}
    },
    results = {
      {type="item", name="nullius-steel-ingot", amount=24},
      {type="item", name="nullius-gravel", amount=5},
      {type="item", name="nullius-crushed-limestone", amount=4}
    },
    main_product = "nullius-steel-ingot"
  },
  {
    type = "recipe",
    name = "nullius-boxed-steel-ingot-2",
    localised_name = {"", {"item-name.nullius-box", {"item-name.nullius-steel-ingot"}}, " ", 2},
    enabled = false,
    category = "bulk-smelting",
    subgroup = "boxed-steel",
    order = "nullius-ac",
    energy_required = 60,
    ingredients = {
      {type="item", name="nullius-box-iron-ingot", amount=30},
      {type="item", name="nullius-box-calcium", amount=5},
      {type="item", name="nullius-box-boron", amount=1},
      {type="fluid", name="nullius-oxygen", amount=1500}
    },
    results = {
      {type="item", name="nullius-box-steel-ingot", amount=24},
      {type="item", name="nullius-box-gravel", amount=5},
      {type="item", name="nullius-box-crushed-limestone", amount=4}
    },
    main_product = "nullius-box-steel-ingot"
  },

  {
    type = "recipe",
    name = "nullius-lime",
    enabled = false,
    category = "vent-smelting",
    energy_required = 5,
    ingredients = {
        {"nullius-crushed-limestone", 3}
    },
    results = {
      {type="item", name="nullius-lime", amount=2},
      {type="fluid", name="nullius-carbon-dioxide", amount=40}
    },
    main_product = "nullius-lime"
  },

  {
    type = "recipe",
    name = "nullius-boxed-lime",
    enabled = false,
    category = "bulk-smelting",
    subgroup = "boxed-calcium",
    energy_required = 5,
    ingredients = {
        {"nullius-box-crushed-limestone", 3}
    },
    results = {
      {type="item", name="nullius-box-lime", amount=2},
      {type="fluid", name="nullius-carbon-dioxide", amount=200}
    },
    main_product = "nullius-box-lime"
  },
  {
    type = "recipe",
    name = "nullius-limestone-precipitation",
    localised_name = {"recipe-name.nullius-limestone-precipitation"},
    enabled = false,
    no_productivity = true,
    category = "ore-flotation",
    order = "nullius-dd",
    energy_required = 6,
    ingredients = {
      {type="item", name="nullius-lime", amount=4},
      {type="fluid", name="nullius-carbon-dioxide", amount=100},
      {type="fluid", name="nullius-water", amount=25}
    },
    results = {
      {type="item", name="nullius-crushed-limestone", amount=4},
      {type="fluid", name="nullius-wastewater", amount=25}
    },
    main_product = "nullius-crushed-limestone"
  },
  {
    type = "recipe",
    name = "nullius-boxed-limestone-precipitation",
    localised_name = {"recipe-name.nullius-boxed", {"recipe-name.nullius-limestone-precipitation"}},
    enabled = false,
    no_productivity = true,
    category = "ore-flotation",
    subgroup = "boxed-calcium",
    order = "nullius-cd",
    energy_required = 30,
    ingredients = {
      {type="item", name="nullius-box-lime", amount=4},
      {type="fluid", name="nullius-carbon-dioxide", amount=500},
      {type="fluid", name="nullius-water", amount=125}
    },
    results = {
      {type="item", name="nullius-box-crushed-limestone", amount=4},
      {type="fluid", name="nullius-wastewater", amount=125}
    },
    main_product = "nullius-box-crushed-limestone"
  },

  {
    type = "recipe",
    name = "nullius-gypsum-decomposition",
    localised_name = {"recipe-name.nullius-gypsum-decomposition"},
    enabled = false,
    icon_size = 32,
    category = "vent-smelting",
    order = "nullius-bc",
    energy_required = 3,
    ingredients = {
        {"nullius-gypsum", 2}
    },
    results = {
      {type="item", name="nullius-lime", amount=1},
      {type="fluid", name="nullius-sulfur-dioxide", amount=12}
    },
    main_product = "nullius-lime"
  },
  {
    type = "recipe",
    name = "nullius-boxed-gypsum-decomposition",
    localised_name = {"recipe-name.nullius-boxed",
        {"recipe-name.nullius-gypsum-decomposition"}},
    enabled = false,
    category = "bulk-smelting",
    subgroup = "boxed-calcium",
    order = "nullius-dc",
    energy_required = 3,
    ingredients = {
        {"nullius-box-gypsum", 2}
    },
    results = {
      {type="item", name="nullius-box-lime", amount=1},
      {type="fluid", name="nullius-sulfur-dioxide", amount=60}
    },
    main_product = "nullius-box-lime"
  },

  {
    type = "recipe",
    name = "nullius-gypsum-1",
    localised_name = {"recipe-name.nullius-gypsum-1"},
    enabled = false,
    always_show_made_in = true,
    category = "ore-flotation",
    energy_required = 2,
    ingredients = {
      {type="item", name="nullius-lime", amount=1},
      {type="fluid", name="nullius-acid-sulfuric", amount=20, fluidbox_index=1}
    },
    results = {
      {type="item", name="nullius-gypsum", amount=1},
      {type="fluid", name="nullius-wastewater", amount=15, fluidbox_index=1}
    },
    main_product = "nullius-gypsum"
  },
  {
    type = "recipe",
    name = "nullius-boxed-gypsum-1",
    localised_name = {"", {"item-name.nullius-box", {"item-name.nullius-gypsum"}}, " ", 1},
    enabled = false,
    always_show_made_in = true,
    category = "ore-flotation",
    subgroup = "boxed-glass",
    order = "nullius-ef",
    crafting_machine_tint = {
      primary = data.raw.fluid["nullius-acid-sulfuric"].flow_color,
      secondary = data.raw.fluid["nullius-acid-sulfuric"].flow_color
    },
    energy_required = 10,
    ingredients = {
      {type="item", name="nullius-box-lime", amount=1},
      {type="fluid", name="nullius-acid-sulfuric", amount=100, fluidbox_index=1}
    },
    results = {
      {type="item", name="nullius-box-gypsum", amount=1},
      {type="fluid", name="nullius-wastewater", amount=75, fluidbox_index=1}
    },
    main_product = "nullius-box-gypsum"
  },
  {
    type = "recipe",
    name = "nullius-gypsum-2",
    localised_name = {"recipe-name.nullius-gypsum-2"},
    enabled = false,
    always_show_made_in = true,
    category = "ore-flotation",
    crafting_machine_tint = {
      primary = data.raw.fluid["nullius-acid-sulfuric"].flow_color,
      secondary = data.raw.fluid["nullius-brine"].flow_color
    },
    energy_required = 3,
    ingredients = {
      {type="item", name="nullius-sodium-sulfate", amount=3},
      {type="fluid", name="nullius-calcium-chloride-solution", amount=40, fluidbox_index=1}
    },
    results = {
      {type="item", name="nullius-gypsum", amount=2},
      {type="fluid", name="nullius-brine", amount=30, fluidbox_index=1}
    },
    main_product = "nullius-gypsum"
  },
  {
    type = "recipe",
    name = "nullius-boxed-gypsum-2",
    localised_name = {"", {"item-name.nullius-box", {"item-name.nullius-gypsum"}}, " ", 2},
    enabled = false,
    always_show_made_in = true,
    category = "ore-flotation",
    subgroup = "boxed-glass",
    order = "nullius-eg",
    crafting_machine_tint = {
      primary = data.raw.fluid["nullius-acid-sulfuric"].flow_color,
      secondary = data.raw.fluid["nullius-brine"].flow_color
    },
    energy_required = 15,
    ingredients = {
      {type="item", name="nullius-box-sodium-sulfate", amount=3},
      {type="fluid", name="nullius-calcium-chloride-solution", amount=200, fluidbox_index=1}
    },
    results = {
      {type="item", name="nullius-box-gypsum", amount=2},
      {type="fluid", name="nullius-brine", amount=150, fluidbox_index=1}
    },
    main_product = "nullius-box-gypsum"
  },

  {
    type = "recipe",
    name = "nullius-calcium-chloride-1",
    localised_name = {"", {"item-name.nullius-calcium-chloride"}, " ", 1},
    category = "basic-chemistry",
    subgroup = "inorganic-chemistry",
    order = "nullius-fb",
    enabled = false,
    always_show_made_in = true,
    crafting_machine_tint = {
      primary = data.raw.fluid["nullius-acid-hydrochloric"].flow_color,
      secondary = data.raw.fluid["nullius-carbon-dioxide"].flow_color
    },
    energy_required = 1,
    ingredients = {
      {type="item", name="nullius-crushed-limestone", amount=1},
      {type="fluid", name="nullius-acid-hydrochloric", amount=25, fluidbox_index=1}
    },
    results = {
      {type="fluid", name="nullius-calcium-chloride-solution", amount=16},
      {type="fluid", name="nullius-carbon-dioxide", amount=10}
    },
    main_product = "nullius-calcium-chloride-solution"
  },
  {
    type = "recipe",
    name = "nullius-boxed-calcium-chloride-1",
    localised_name = {"recipe-name.nullius-boxed", {"", {"item-name.nullius-calcium-chloride"}, " ", 1}},
    category = "basic-chemistry",
    subgroup = "boxed-fluid",
    order = "nullius-ccb",
    enabled = false,
    always_show_made_in = true,
    crafting_machine_tint = {
      primary = data.raw.fluid["nullius-acid-hydrochloric"].flow_color,
      secondary = data.raw.fluid["nullius-carbon-dioxide"].flow_color
    },
    energy_required = 5,
    ingredients = {
      {type="item", name="nullius-box-crushed-limestone", amount=1},
      {type="fluid", name="nullius-acid-hydrochloric", amount=125, fluidbox_index=1}
    },
    results = {
      {type="fluid", name="nullius-calcium-chloride-solution", amount=80},
      {type="fluid", name="nullius-carbon-dioxide", amount=50}
    },
    main_product = "nullius-calcium-chloride-solution"
  },
  {
    type = "recipe",
    name = "nullius-calcium-chloride-2",
    localised_name = {"", {"item-name.nullius-calcium-chloride"}, " ", 2},
    enabled = false,
    category = "basic-chemistry",
    subgroup = "inorganic-chemistry",
    order = "nullius-fc",
    crafting_machine_tint = {
      primary = data.raw.fluid["nullius-acid-hydrochloric"].flow_color,
      secondary = data.raw.fluid["nullius-oxygen"].flow_color
    },
    energy_required = 2,
    ingredients = {
      {type="item", name="nullius-lime", amount=3},
      {type="fluid", name="nullius-chlorine", amount=50},
      {type="fluid", name="nullius-water", amount=60}
    },
    results = {
      {type="fluid", name="nullius-calcium-chloride-solution", amount=60},
      {type="fluid", name="nullius-oxygen", amount=20}
    },
    main_product = "nullius-calcium-chloride-solution"
  },
  {
    type = "recipe",
    name = "nullius-boxed-calcium-chloride-2",
    localised_name = {"recipe-name.nullius-boxed", {"", {"item-name.nullius-calcium-chloride"}, " ", 2}},
    enabled = false,
    category = "basic-chemistry",
    subgroup = "boxed-fluid",
    order = "nullius-ccc",
    crafting_machine_tint = {
      primary = data.raw.fluid["nullius-acid-hydrochloric"].flow_color,
      secondary = data.raw.fluid["nullius-oxygen"].flow_color
    },
    energy_required = 10,
    ingredients = {
      {type="item", name="nullius-box-lime", amount=3},
      {type="fluid", name="nullius-chlorine", amount=250},
      {type="fluid", name="nullius-water", amount=300}
    },
    results = {
      {type="fluid", name="nullius-calcium-chloride-solution", amount=300},
      {type="fluid", name="nullius-oxygen", amount=100}
    },
    main_product = "nullius-calcium-chloride-solution"
  },
  {
    type = "recipe",
    name = "nullius-calcium-chloride-dehydration",
    localised_name = {"recipe-name.nullius-dehydration", {"item-name.nullius-calcium-chloride"}},
    enabled = false,
    category = "distillation",
    order = "nullius-ic",
    crafting_machine_tint = {
      primary = data.raw.fluid["nullius-calcium-chloride-solution"].flow_color,
      secondary = data.raw.fluid["nullius-steam"].flow_color
    },
    energy_required = 1,
    ingredients = {
      {type="fluid", name="nullius-calcium-chloride-solution", amount=40}
    },
    results = {
      {type="item", name="nullius-calcium-chloride", amount=2},
      {type="fluid", name="nullius-steam", amount=60, fluidbox_index=2}
    },
    main_product = "nullius-calcium-chloride"
  },
  {
    type = "recipe",
    name = "nullius-boxed-calcium-chloride-dehydration",
    localised_name = {"recipe-name.nullius-dehydration",
      {"item-name.nullius-box", {"item-name.nullius-calcium-chloride"}}},
    enabled = false,
    category = "distillation",
    subgroup = "boxed-calcium",
    order = "nullius-fc",
    crafting_machine_tint = {
      primary = data.raw.fluid["nullius-calcium-chloride-solution"].flow_color,
      secondary = data.raw.fluid["nullius-steam"].flow_color
    },
    energy_required = 5,
    ingredients = {
      {type="fluid", name="nullius-calcium-chloride-solution", amount=200}
    },
    results = {
      {type="item", name="nullius-box-calcium-chloride", amount=2},
      {type="fluid", name="nullius-steam", amount=300, fluidbox_index=2}
    },
    main_product = "nullius-box-calcium-chloride"
  },
  {
    type = "recipe",
    name = "nullius-calcium-chloride-decomposition",
    localised_name = {"recipe-name.nullius-calcium-chloride-decomposition"},
    enabled = false,
    icon_size = 32,
    category = "wet-smelting",
    order = "nullius-bd",
    energy_required = 2,
    ingredients = {
      {type="item", name="nullius-calcium-chloride", amount=2},
      {type="fluid", name="nullius-steam", amount=100}
    },
    results = {
      {type="item", name="nullius-lime", amount=1},
      {type="fluid", name="nullius-hydrogen-chloride", amount=10}
    },
    main_product = "nullius-lime"
  },
  {
    type = "recipe",
    name = "nullius-boxed-calcium-chloride-decomposition",
    localised_name = {"recipe-name.nullius-boxed",
        {"recipe-name.nullius-calcium-chloride-decomposition"}},
    enabled = false,
    icon_size = 32,
    category = "bulk-smelting",
    subgroup = "boxed-calcium",
    order = "nullius-dd",
    energy_required = 2,
    ingredients = {
      {type="item", name="nullius-box-calcium-chloride", amount=2},
      {type="fluid", name="nullius-steam", amount=500}
    },
    results = {
      {type="item", name="nullius-box-lime", amount=1},
      {type="fluid", name="nullius-hydrogen-chloride", amount=50}
    },
    main_product = "nullius-box-lime"
  },
  {
    type = "recipe",
    name = "nullius-calcium",
    enabled = false,
    category = "nullius-electrolysis",
    energy_required = 1,
    ingredients = {
      {type="item", name="nullius-calcium-chloride", amount=4}
    },
    results = {
      {type="item", name="nullius-calcium", amount=3},
      {type="fluid", name="nullius-chlorine", amount=12, fluidbox_index=1}
    },
    main_product = "nullius-calcium"
  },
  {
    type = "recipe",
    name = "nullius-boxed-calcium",
    enabled = false,
    category = "nullius-electrolysis",
    subgroup = "boxed-calcium",
    energy_required = 5,
    ingredients = {
      {type="item", name="nullius-box-calcium-chloride", amount=4}
    },
    results = {
      {type="item", name="nullius-box-calcium", amount=3},
      {type="fluid", name="nullius-chlorine", amount=60, fluidbox_index=1}
    },
    main_product = "nullius-box-calcium"
  },

  {
    type = "recipe",
    name = "nullius-silica-1",
    localised_name = {"recipe-name.nullius-silica-1"},
    enabled = false,
    category = "ore-flotation",
    energy_required = 5,
    ingredients = {
      {type="item", name="nullius-sand", amount=8},
      {type="fluid", name="nullius-saline", amount=60, fluidbox_index=1}
    },
    results = {
      {type="item", name="nullius-silica", amount=6},
      {type="fluid", name="nullius-wastewater", amount=50, fluidbox_index=1}
    },
    main_product = "nullius-silica"
  },
  {
    type = "recipe",
    name = "nullius-silica-2",
    localised_name = {"recipe-name.nullius-silica-2"},
    enabled = false,
    category = "ore-flotation",
    energy_required = 15,
    ingredients = {
      {type="item", name="nullius-sand", amount=15},
      {type="fluid", name="nullius-caustic-solution", amount=60},
      {type="fluid", name="nullius-acid-hydrochloric", amount=75}
    },
    results = {
      {type="item", name="nullius-silica", amount=12},
      {type="item", name="nullius-rutile", amount=1},
      {type="fluid", name="nullius-wastewater", amount=120, fluidbox_index=1}
    },
    main_product = "nullius-silica"
  },
  {
    type = "recipe",
    name = "nullius-boxed-silica-1",
    localised_name = {"", {"item-name.nullius-box", {"item-name.nullius-silica"}}, " ", 1},
    enabled = false,
    category = "ore-flotation",
    subgroup = "boxed-silicon",
    energy_required = 25,
    ingredients = {
      {type="item", name="nullius-box-sand", amount=8},
      {type="fluid", name="nullius-saline", amount=300, fluidbox_index=1}
    },
    results = {
      {type="item", name="nullius-box-silica", amount=6},
      {type="fluid", name="nullius-wastewater", amount=250, fluidbox_index=1}
    },
    main_product = "nullius-box-silica"
  },
  {
    type = "recipe",
    name = "nullius-boxed-silica-2",
    localised_name = {"", {"item-name.nullius-box", {"item-name.nullius-silica"}}, " ", 2},
    enabled = false,
    category = "ore-flotation",
    subgroup = "boxed-silicon",
    energy_required = 75,
    ingredients = {
      {type="item", name="nullius-box-sand", amount=15},
      {type="fluid", name="nullius-caustic-solution", amount=300},
      {type="fluid", name="nullius-acid-hydrochloric", amount=375}
    },
    results = {
      {type="item", name="nullius-box-silica", amount=12},
      {type="item", name="nullius-box-rutile", amount=1},
      {type="fluid", name="nullius-wastewater", amount=600, fluidbox_index=1}
    },
    main_product = "nullius-box-silica"
  },
  {
    type = "recipe",
    name = "nullius-rutile",
    enabled = false,
    category = "ore-flotation",
    energy_required = 3,
    ingredients = {
      {type="item", name="nullius-sand", amount=5},
      {type="fluid", name="nullius-acid-sulfuric", amount=12, fluidbox_index=1}
    },
    results = {
      {type="item", name="nullius-rutile", amount=1},
      {type="fluid", name="nullius-sludge", amount=10},
      {type="fluid", name="nullius-carbon-dioxide", amount=5}
    },
    main_product = "nullius-rutile"
  },
  {
    type = "recipe",
    name = "nullius-boxed-rutile",
    enabled = false,
    category = "ore-flotation",
    subgroup = "boxed-titanium",
    order = "nullius-bb",
    energy_required = 15,
    ingredients = {
      {type="item", name="nullius-box-sand", amount=5},
      {type="fluid", name="nullius-acid-sulfuric", amount=60, fluidbox_index=1}
    },
    results = {
      {type="item", name="nullius-box-rutile", amount=1},
      {type="fluid", name="nullius-sludge", amount=50},
      {type="fluid", name="nullius-carbon-dioxide", amount=25}
    },
    main_product = "nullius-box-rutile"
  },

  {
    type = "recipe",
    name = "nullius-silica-glass",
    localised_name = {"recipe-name.nullius-silica-glass"},
    show_amount_in_title = false,
    always_show_products = true,
    enabled = false,
    category = "machine-casting",
    order = "nullius-bb",
    energy_required = 16,
    ingredients = {
        {"nullius-silica", 3}
    },
    result = "nullius-glass"
  },
  {
    type = "recipe",
    name = "nullius-soda-lime-glass-1",
    localised_name = {"recipe-name.nullius-soda-lime-glass-1"},
    show_amount_in_title = false,
    always_show_products = true,
    enabled = false,
    category = "machine-casting",
    order = "nullius-bc",
    energy_required = 24,
    ingredients = {
      {"nullius-silica", 9},
      {"nullius-soda-ash", 2},
      {"nullius-lime", 1}
    },
    results = {
      {type="item", name="nullius-glass", amount=6},
      {type="fluid", name="nullius-carbon-dioxide", amount=20}
    },
    main_product = "nullius-glass"
  },
  {
    type = "recipe",
    name = "nullius-soda-lime-glass-2",
    localised_name = {"recipe-name.nullius-soda-lime-glass-2"},
    show_amount_in_title = false,
    always_show_products = true,
    enabled = false,
    category = "machine-casting",
    order = "nullius-bd",
    energy_required = 30,
    ingredients = {
      {"nullius-silica", 12},
      {"nullius-alumina", 3},
      {"nullius-lime", 3},
      {"nullius-soda-ash", 3},
      {"nullius-sodium-sulfate", 1}
    },
    results = {
      {type="item", name="nullius-glass", amount=16},
      {type="fluid", name="nullius-carbon-dioxide", amount=40}
    },
    main_product = "nullius-glass"
  },
  {
    type = "recipe",
    name = "nullius-boxed-glass",
    show_amount_in_title = false,
    always_show_products = true,
    enabled = false,
    category = "machine-casting",
    subgroup = "boxed-glass",
    energy_required = 150,
    ingredients = {
      {"nullius-box-silica", 12},
      {"nullius-box-alumina", 3},
      {"nullius-box-lime", 3},
      {"nullius-box-soda-ash", 3},
      {"nullius-box-sodium-sulfate", 1}
    },
    results = {
      {type="item", name="nullius-box-glass", amount=16},
      {type="fluid", name="nullius-carbon-dioxide", amount=200}
    },
    main_product = "nullius-box-glass"
  },

  {
    type = "recipe",
    name = "nullius-hard-glass",
    show_amount_in_title = false,
    always_show_products = true,
    enabled = false,
    category = "dry-smelting",
    energy_required = 40,
    ingredients = {
      {"nullius-silica", 5},
      {"nullius-alumina", 3},
      {"nullius-lime", 2},
      {"nullius-acid-boric", 1}
    },
    result = "nullius-hard-glass",
    result_count = 4
  },
  {
    type = "recipe",
    name = "nullius-boxed-hard-glass",
    show_amount_in_title = false,
    always_show_products = true,
    enabled = false,
    category = "bulk-smelting",
    subgroup = "boxed-glass",
    energy_required = 40,
    ingredients = {
      {"nullius-box-silica", 5},
      {"nullius-box-alumina", 3},
      {"nullius-box-lime", 2},
      {"nullius-box-acid-boric", 1}
    },
    result = "nullius-box-hard-glass",
    result_count = 4
  },

  {
    type = "recipe",
    name = "nullius-glass-fiber",
    show_amount_in_title = false,
    always_show_products = true,
    enabled = false,
    category = "machine-casting",
    energy_required = 15,
    ingredients = {
      {type="item", name="nullius-hard-glass", amount=2},
      {type="fluid", name="nullius-water", amount=20}
    },
    results = {
      {type="item", name="nullius-glass-fiber", amount=3},
      {type="fluid", name="nullius-steam", amount=50}
    },
    main_product = "nullius-glass-fiber"
  },
  {
    type = "recipe",
    name = "nullius-boxed-glass-fiber",
    show_amount_in_title = false,
    always_show_products = true,
    enabled = false,
    category = "machine-casting",
    subgroup = "boxed-glass",
    energy_required = 75,
    ingredients = {
      {type="item", name="nullius-box-hard-glass", amount=2},
      {type="fluid", name="nullius-water", amount=100}
    },
    results = {
      {type="item", name="nullius-box-glass-fiber", amount=3},
      {type="fluid", name="nullius-steam", amount=250}
    },
    main_product = "nullius-box-glass-fiber"
  },

  {
    type = "recipe",
    name = "nullius-boron",
    enabled = false,
    category = "vent-smelting",
    energy_required = 10,
    ingredients = {
      {type="item", name="nullius-acid-boric", amount=4},
      {type="item", name="nullius-aluminum-ingot", amount=3}
    },
    results = {
      {type="item", name="nullius-boron", amount=3},
      {type="item", name="nullius-alumina", amount=2},
      {type="fluid", name="nullius-wastewater", amount=4}
    },
    main_product = "nullius-boron"
  },
  {
    type = "recipe",
    name = "nullius-boxed-boron",
    enabled = false,
    category = "bulk-smelting",
    subgroup = "boxed-glass",
    energy_required = 10,
    ingredients = {
      {type="item", name="nullius-box-acid-boric", amount=4},
      {type="item", name="nullius-box-aluminum-ingot", amount=3}
    },
    results = {
      {type="item", name="nullius-box-boron", amount=3},
      {type="item", name="nullius-box-alumina", amount=2},
      {type="fluid", name="nullius-wastewater", amount=20}
    },
    main_product = "nullius-box-boron"
  },


  {
    type = "recipe",
    name = "nullius-iron-rod-1",
    enabled = false,
    show_amount_in_title = false,
    always_show_products = true,
    category = "machine-casting",
    energy_required = 4,
    ingredients = {
      {"nullius-iron-ingot", 4}
    },
    result = "nullius-iron-rod",
    result_count = 5
  },
  {
    type = "recipe",
    name = "nullius-iron-rod-2",
    localised_name = {"recipe-name.nullius-iron-rod-2"},
    enabled = false,
    category = "machine-casting",
    energy_required = 4,
    ingredients = {
      {type="item", name="nullius-iron-ingot", amount=5},
      {type="fluid", name="nullius-acid-hydrochloric", amount=4}
    },
    results = {
      {type="item", name="nullius-iron-rod", amount=7},
      {type="fluid", name="nullius-sludge", amount=1}
    },
    main_product = "nullius-iron-rod"
  },
  {
    type = "recipe",
    name = "nullius-boxed-iron-rod",
    enabled = false,
    category = "machine-casting",
    subgroup = "boxed-iron",
    energy_required = 20,
    ingredients = {
      {type="item", name="nullius-box-iron-ingot", amount=5},
      {type="fluid", name="nullius-acid-hydrochloric", amount=20}
    },
    results = {
      {type="item", name="nullius-box-iron-rod", amount=7},
      {type="fluid", name="nullius-sludge", amount=5}
    },
    main_product = "nullius-box-iron-rod"
  },

  {
    type = "recipe",
    name = "nullius-steel-rod-1",
    enabled = false,
    show_amount_in_title = false,
    always_show_products = true,
    category = "machine-casting",
    energy_required = 5,
    ingredients = {
      {"nullius-steel-ingot", 4}
    },
    result = "nullius-steel-rod",
    result_count = 5
  },
  {
    type = "recipe",
    name = "nullius-steel-rod-2",
    localised_name = {"recipe-name.nullius-steel-rod-2"},
    enabled = false,
    category = "machine-casting",
    energy_required = 5,
    ingredients = {
      {type="item", name="nullius-steel-ingot", amount=5},
      {type="fluid", name="nullius-acid-sulfuric", amount=3}
    },
    results = {
      {type="item", name="nullius-steel-rod", amount=7},
      {type="fluid", name="nullius-sludge", amount=2}
    },
    main_product = "nullius-steel-rod"
  },
  {
    type = "recipe",
    name = "nullius-boxed-steel-rod",
    enabled = false,
    category = "machine-casting",
    subgroup = "boxed-steel",
    energy_required = 25,
    ingredients = {
      {type="item", name="nullius-box-steel-ingot", amount=5},
      {type="fluid", name="nullius-acid-sulfuric", amount=15}
    },
    results = {
      {type="item", name="nullius-box-steel-rod", amount=7},
      {type="fluid", name="nullius-sludge", amount=10}
    },
    main_product = "nullius-box-steel-rod"
  },

  {
    type = "recipe",
    name = "nullius-aluminum-rod-1",
    enabled = false,
    show_amount_in_title = false,
    always_show_products = true,
    category = "machine-casting",
    energy_required = 4,
    ingredients = {
      {"nullius-aluminum-ingot", 4}
    },
    result = "nullius-aluminum-rod",
    result_count = 5
  },
  {
    type = "recipe",
    name = "nullius-aluminum-rod-2",
    localised_name = {"recipe-name.nullius-aluminum-rod-2"},
    enabled = false,
    category = "machine-casting",
    energy_required = 4,
    ingredients = {
      {type="item", name="nullius-aluminum-ingot", amount=5},
      {type="fluid", name="nullius-caustic-solution", amount=2}
    },
    results = {
      {type="item", name="nullius-aluminum-rod", amount=7},
      {type="fluid", name="nullius-wastewater", amount=2}
    },
    main_product = "nullius-aluminum-rod"
  },
  {
    type = "recipe",
    name = "nullius-boxed-aluminum-rod",
    enabled = false,
    category = "machine-casting",
    subgroup = "boxed-aluminum",
    energy_required = 20,
    ingredients = {
      {type="item", name="nullius-box-aluminum-ingot", amount=5},
      {type="fluid", name="nullius-caustic-solution", amount=10}
    },
    results = {
      {type="item", name="nullius-box-aluminum-rod", amount=7},
      {type="fluid", name="nullius-wastewater", amount=10}
    },
    main_product = "nullius-box-aluminum-rod"
  },

  {
    type = "recipe",
    name = "nullius-steel-beam",
    enabled = false,
    show_amount_in_title = false,
    always_show_products = true,
    category = "machine-casting",
    energy_required = 2,
    ingredients = {
      {"nullius-steel-ingot", 3}
    },
    result = "nullius-steel-beam",
    result_count = 2
  },
  {
    type = "recipe",
    name = "nullius-boxed-steel-beam",
    enabled = false,
    show_amount_in_title = false,
    always_show_products = true,
    category = "machine-casting",
    subgroup = "boxed-steel",
    energy_required = 10,
    ingredients = {
      {"nullius-box-steel-ingot", 3}
    },
    result = "nullius-box-steel-beam",
    result_count = 2
  },


  {
    type = "recipe",
    name = "nullius-aluminum-plate-1",
    enabled = false,
    show_amount_in_title = false,
    always_show_products = true,
    category = "machine-casting",
    energy_required = 4,
    ingredients = {
      {"nullius-aluminum-ingot", 4}
    },
    result = "nullius-aluminum-plate",
    result_count = 3
  },
  {
    type = "recipe",
    name = "nullius-aluminum-plate-2",
    localised_name = {"recipe-name.nullius-aluminum-plate-2"},
    enabled = false,
    category = "machine-casting",
    energy_required = 4,
    ingredients = {
      {type="item", name="nullius-aluminum-ingot", amount=6},
      {type="fluid", name="nullius-caustic-solution", amount=3}
    },
    results = {
      {type="item", name="nullius-aluminum-plate", amount=5},
      {type="fluid", name="nullius-wastewater", amount=3}
    },
    main_product = "nullius-aluminum-plate"
  },
  {
    type = "recipe",
    name = "nullius-boxed-aluminum-plate",
    enabled = false,
    category = "machine-casting",
    subgroup = "boxed-aluminum",
    energy_required = 20,
    ingredients = {
      {type="item", name="nullius-box-aluminum-ingot", amount=6},
      {type="fluid", name="nullius-caustic-solution", amount=15}
    },
    results = {
      {type="item", name="nullius-box-aluminum-plate", amount=5},
      {type="fluid", name="nullius-wastewater", amount=15}
    },
    main_product = "nullius-box-aluminum-plate"
  },

  {
    type = "recipe",
    name = "nullius-iron-plate-1",
    enabled = false,
    show_amount_in_title = false,
    always_show_products = true,
    category = "machine-casting",
    energy_required = 3,
    ingredients = {
      {"nullius-iron-ingot", 4}
    },
    result = "nullius-iron-plate",
    result_count = 3
  },
  {
    type = "recipe",
    name = "nullius-iron-plate-2",
    localised_name = {"recipe-name.nullius-iron-plate-2"},
    enabled = false,
    category = "machine-casting",
    energy_required = 3,
    ingredients = {
      {type="item", name="nullius-iron-ingot", amount=6},
      {type="fluid", name="nullius-acid-hydrochloric", amount=3}
    },
    results = {
      {type="item", name="nullius-iron-plate", amount=5},
      {type="fluid", name="nullius-sludge", amount=1}
    },
    main_product = "nullius-iron-plate"
  },
  {
    type = "recipe",
    name = "nullius-boxed-iron-plate",
    enabled = false,
    category = "machine-casting",
    subgroup = "boxed-iron",
    energy_required = 15,
    ingredients = {
      {type="item", name="nullius-box-iron-ingot", amount=6},
      {type="fluid", name="nullius-acid-hydrochloric", amount=15}
    },
    results = {
      {type="item", name="nullius-box-iron-plate", amount=5},
      {type="fluid", name="nullius-sludge", amount=5}
    },
    main_product = "nullius-box-iron-plate"
  },

  {
    type = "recipe",
    name = "nullius-steel-plate-1",
    enabled = false,
    show_amount_in_title = false,
    always_show_products = true,
    category = "machine-casting",
    energy_required = 4,
    ingredients = {
      {"nullius-steel-ingot", 4}
    },
    result = "nullius-steel-plate",
    result_count = 3
  },
  {
    type = "recipe",
    name = "nullius-steel-plate-2",
    localised_name = {"recipe-name.nullius-steel-plate-2"},
    enabled = false,
    category = "machine-casting",
    energy_required = 4,
    ingredients = {
      {type="item", name="nullius-steel-ingot", amount=5},
      {type="fluid", name="nullius-acid-sulfuric", amount=2}
    },
    results = {
      {type="item", name="nullius-steel-plate", amount=4},
      {type="fluid", name="nullius-sludge", amount=1}
    },
    main_product = "nullius-steel-plate"
  },
  {
    type = "recipe",
    name = "nullius-boxed-steel-plate",
    enabled = false,
    category = "machine-casting",
    subgroup = "boxed-steel",
    energy_required = 20,
    ingredients = {
      {type="item", name="nullius-box-steel-ingot", amount=5},
      {type="fluid", name="nullius-acid-sulfuric", amount=10}
    },
    results = {
      {type="item", name="nullius-box-steel-plate", amount=4},
      {type="fluid", name="nullius-sludge", amount=5}
    },
    main_product = "nullius-box-steel-plate"
  },

  {
    type = "recipe",
    name = "nullius-iron-sheet-1",
    enabled = false,
    category = "hand-casting",
    always_show_made_in = true,
    show_amount_in_title = false,
    always_show_products = true,
    energy_required = 5,
    ingredients = {
      {"nullius-iron-plate", 5}
    },
    result = "nullius-iron-sheet",
    result_count = 6
  },
  {
    type = "recipe",
    name = "nullius-iron-sheet-2",
    localised_name = {"recipe-name.nullius-iron-sheet-2"},
    enabled = false,
    show_amount_in_title = false,
    always_show_products = true,
    allow_decomposition = false,
    allow_as_intermediate = false,
    category = "machine-casting",
    energy_required = 4,
    ingredients = {
      {type="item", name="nullius-iron-plate", amount=6},
      {type="fluid", name="nullius-lubricant", amount=1}
    },
    result = "nullius-iron-sheet",
    result_count = 8
  },
  {
    type = "recipe",
    name = "nullius-boxed-iron-sheet",
    enabled = false,
    show_amount_in_title = false,
    always_show_products = true,
    allow_decomposition = false,
    allow_as_intermediate = false,
    category = "machine-casting",
    subgroup = "boxed-iron",
    energy_required = 20,
    ingredients = {
      {type="item", name="nullius-box-iron-plate", amount=6},
      {type="fluid", name="nullius-lubricant", amount=5}
    },
    result = "nullius-box-iron-sheet",
    result_count = 8
  },

  {
    type = "recipe",
    name = "nullius-steel-sheet-1",
    enabled = false,
    category = "hand-casting",
    always_show_made_in = true,
    show_amount_in_title = false,
    always_show_products = true,
    energy_required = 5,
    ingredients = {
      {"nullius-steel-plate", 5}
    },
    result = "nullius-steel-sheet",
    result_count = 6
  },
  {
    type = "recipe",
    name = "nullius-steel-sheet-2",
    localised_name = {"recipe-name.nullius-steel-sheet-2"},
    enabled = false,
    show_amount_in_title = false,
    always_show_products = true,
    allow_decomposition = false,
    allow_as_intermediate = false,
    category = "machine-casting",
    energy_required = 5,
    ingredients = {
      {type="item", name="nullius-steel-plate", amount=5},
      {type="fluid", name="nullius-lubricant", amount=2}
    },
    result = "nullius-steel-sheet",
    result_count = 7
  },
  {
    type = "recipe",
    name = "nullius-boxed-steel-sheet",
    enabled = false,
    show_amount_in_title = false,
    always_show_products = true,
    allow_decomposition = false,
    allow_as_intermediate = false,
    category = "machine-casting",
    subgroup = "boxed-steel",
    energy_required = 25,
    ingredients = {
      {type="item", name="nullius-box-steel-plate", amount=5},
      {type="fluid", name="nullius-lubricant", amount=10}
    },
    result = "nullius-box-steel-sheet",
    result_count = 7
  },

  {
    type = "recipe",
    name = "nullius-aluminum-sheet-1",
    enabled = false,
    category = "hand-casting",
    always_show_made_in = true,
    show_amount_in_title = false,
    always_show_products = true,
    energy_required = 4,
    ingredients = {
      {"nullius-aluminum-plate", 4}
    },
    result = "nullius-aluminum-sheet",
    result_count = 5
  },
  {
    type = "recipe",
    name = "nullius-aluminum-sheet-2",
    localised_name = {"recipe-name.nullius-aluminum-sheet-2"},
    enabled = false,
    show_amount_in_title = false,
    always_show_products = true,
    allow_decomposition = false,
    allow_as_intermediate = false,
    category = "machine-casting",
    energy_required = 4,
    ingredients = {
      {type="item", name="nullius-aluminum-plate", amount=5},
      {type="fluid", name="nullius-lubricant", amount=1}
    },
    result = "nullius-aluminum-sheet",
    result_count = 7
  },
  {
    type = "recipe",
    name = "nullius-boxed-aluminum-sheet",
    enabled = false,
    show_amount_in_title = false,
    always_show_products = true,
    allow_decomposition = false,
    allow_as_intermediate = false,
    category = "machine-casting",
    subgroup = "boxed-aluminum",
    energy_required = 20,
    ingredients = {
      {type="item", name="nullius-box-aluminum-plate", amount=5},
      {type="fluid", name="nullius-lubricant", amount=5}
    },
    result = "nullius-box-aluminum-sheet",
    result_count = 7
  },

  {
    type = "recipe",
    name = "nullius-iron-gear",
    enabled = false,
    category = "small-crafting",
    always_show_made_in = true,
    show_amount_in_title = false,
    always_show_products = true,
    energy_required = 4,
    ingredients = {
      {"nullius-iron-plate", 2},
      {"nullius-iron-rod", 1}
    },
    result = "nullius-iron-gear",
    result_count = 2
  },
  {
    type = "recipe",
    name = "nullius-boxed-iron-gear",
    enabled = false,
    category = "large-assembly",
    subgroup = "boxed-iron",
    always_show_made_in = true,
    show_amount_in_title = false,
    always_show_products = true,
    energy_required = 20,
    ingredients = {
      {"nullius-box-iron-plate", 2},
      {"nullius-box-iron-rod", 1}
    },
    result = "nullius-box-iron-gear",
    result_count = 2
  },

  {
    type = "recipe",
    name = "nullius-steel-gear",
    enabled = false,
    category = "small-crafting",
    always_show_made_in = true,
    show_amount_in_title = false,
    always_show_products = true,
    energy_required = 6,
    ingredients = {
      {"nullius-steel-plate", 2},
      {"nullius-steel-rod", 1}
    },
    result = "nullius-steel-gear",
    result_count = 2
  },
  {
    type = "recipe",
    name = "nullius-boxed-steel-gear",
    enabled = false,
    category = "large-assembly",
    subgroup = "boxed-steel",
    always_show_made_in = true,
    show_amount_in_title = false,
    always_show_products = true,
    energy_required = 30,
    ingredients = {
      {"nullius-box-steel-plate", 2},
      {"nullius-box-steel-rod", 1}
    },
    result = "nullius-box-steel-gear",
    result_count = 2
  },

  {
    type = "recipe",
    name = "nullius-iron-wire-1",
    enabled = false,
    category = "hand-casting",
    always_show_made_in = true,
    show_amount_in_title = false,
    always_show_products = true,
    energy_required = 4,
    ingredients = {
      {"nullius-iron-rod", 3}
    },
    result = "nullius-iron-wire",
    result_count = 4
  },
  {
    type = "recipe",
    name = "nullius-iron-wire-2",
    localised_name = {"recipe-name.nullius-iron-wire-2"},
    enabled = false,
    show_amount_in_title = false,
    always_show_products = true,
    allow_decomposition = false,
    allow_as_intermediate = false,
    category = "machine-casting",
    energy_required = 5,
    ingredients = {
      {type="item", name="nullius-iron-rod", amount=5},
      {type="fluid", name="nullius-lubricant", amount=1}
    },
    result = "nullius-iron-wire",
    result_count = 8
  },
  {
    type = "recipe",
    name = "nullius-boxed-iron-wire",
    enabled = false,
    show_amount_in_title = false,
    always_show_products = true,
    allow_decomposition = false,
    allow_as_intermediate = false,
    category = "machine-casting",
    subgroup = "boxed-iron",
    energy_required = 25,
    ingredients = {
      {type="item", name="nullius-box-iron-rod", amount=5},
      {type="fluid", name="nullius-lubricant", amount=5}
    },
    result = "nullius-box-iron-wire",
    result_count = 8
  },

  {
    type = "recipe",
    name = "nullius-aluminum-wire-1",
    enabled = false,
    category = "hand-casting",
    always_show_made_in = true,
    show_amount_in_title = false,
    always_show_products = true,
    energy_required = 5,
    ingredients = {
      {"nullius-aluminum-rod", 5}
    },
    result = "nullius-aluminum-wire",
    result_count = 7
  },
  {
    type = "recipe",
    name = "nullius-aluminum-wire-2",
    localised_name = {"recipe-name.nullius-aluminum-wire-2"},
    enabled = false,
    show_amount_in_title = false,
    always_show_products = true,
    allow_decomposition = false,
    allow_as_intermediate = false,
    category = "machine-casting",
    energy_required = 4,
    ingredients = {
      {type="item", name="nullius-aluminum-rod", amount=6},
      {type="fluid", name="nullius-lubricant", amount=1}
    },
    result = "nullius-aluminum-wire",
    result_count = 10
  },
  {
    type = "recipe",
    name = "nullius-boxed-aluminum-wire",
    enabled = false,
    show_amount_in_title = false,
    always_show_products = true,
    allow_decomposition = false,
    allow_as_intermediate = false,
    category = "machine-casting",
    subgroup = "boxed-aluminum",
    energy_required = 20,
    ingredients = {
      {type="item", name="nullius-box-aluminum-rod", amount=6},
      {type="fluid", name="nullius-lubricant", amount=5}
    },
    result = "nullius-box-aluminum-wire",
    result_count = 10
  },

  {
    type = "recipe",
    name = "nullius-steel-wire",
    enabled = false,
    show_amount_in_title = false,
    always_show_products = true,
    category = "machine-casting",
    energy_required = 2,
    ingredients = {
      {type="item", name="nullius-steel-rod", amount=2},
      {type="fluid", name="nullius-lubricant", amount=1}
    },
    result = "nullius-steel-wire",
    result_count = 3
  },
  {
    type = "recipe",
    name = "nullius-boxed-steel-wire",
    enabled = false,
    show_amount_in_title = false,
    always_show_products = true,
    category = "machine-casting",
    subgroup = "boxed-steel",
    energy_required = 10,
    ingredients = {
      {type="item", name="nullius-box-steel-rod", amount=2},
      {type="fluid", name="nullius-lubricant", amount=5}
    },
    result = "nullius-box-steel-wire",
    result_count = 3
  },
  {
    type = "recipe",
    name = "nullius-steel-cable",
    enabled = false,
    show_amount_in_title = false,
    always_show_products = true,
    category = "large-fluid-assembly",
    energy_required = 1,
    ingredients = {
      {type="item", name="nullius-steel-wire", amount=4},
      {type="fluid", name="nullius-lubricant", amount=1, fluidbox_index=1}
    },
    result = "nullius-steel-cable"
  },
  {
    type = "recipe",
    name = "nullius-boxed-steel-cable",
    enabled = false,
    show_amount_in_title = false,
    always_show_products = true,
    category = "huge-fluid-assembly",
    subgroup = "boxed-steel",
    energy_required = 5,
    ingredients = {
      {type="item", name="nullius-box-steel-wire", amount=4},
      {type="fluid", name="nullius-lubricant", amount=5, fluidbox_index=1}
    },
    result = "nullius-box-steel-cable"
  },
  {
    type = "recipe",
    name = "nullius-insulated-wire-1",
    localised_name = {"", {"item-name.nullius-insulated-wire"}, " ", 1},
    enabled = false,
    category = "small-crafting",
    always_show_made_in = true,
    show_amount_in_title = false,
    always_show_products = true,
    energy_required = 4,
    ingredients = {
      {"nullius-aluminum-wire", 3},
      {"nullius-rubber", 2}
    },
    result = "copper-cable",
    result_count = 4
  },
  {
    type = "recipe",
    name = "nullius-boxed-insulated-wire-1",
    localised_name = {"", {"item-name.nullius-box", {"item-name.nullius-insulated-wire"}}, " ", 1},
    enabled = false,
    category = "large-assembly",
    subgroup = "boxed-electrical",
    always_show_made_in = true,
    show_amount_in_title = false,
    always_show_products = true,
    energy_required = 20,
    ingredients = {
      {"nullius-box-aluminum-wire", 3},
      {"nullius-box-rubber", 2}
    },
    result = "nullius-box-insulated-wire",
    result_count = 4
  },
  {
    type = "recipe",
    name = "nullius-insulated-wire-2",
    localised_name = {"", {"item-name.nullius-insulated-wire"}, " ", 2},
    enabled = false,
    always_show_made_in = true,
    show_amount_in_title = false,
    always_show_products = true,
    category = "small-crafting",
    energy_required = 3,
    ingredients = {
      {"nullius-copper-wire", 1},
      {"nullius-rubber", 2}
    },
    result = "copper-cable",
    result_count = 6
  },
  {
    type = "recipe",
    name = "nullius-boxed-insulated-wire-2",
    localised_name = {"", {"item-name.nullius-box", {"item-name.nullius-insulated-wire"}}, " ", 2},
    enabled = false,
    always_show_made_in = true,
    show_amount_in_title = false,
    always_show_products = true,
    category = "large-assembly",
    subgroup = "boxed-electrical",
    energy_required = 15,
    ingredients = {
      {"nullius-box-copper-wire", 1},
      {"nullius-box-rubber", 2}
    },
    result = "nullius-box-insulated-wire",
    result_count = 6
  },

  {
    type = "recipe",
    name = "nullius-optical-cable",
    enabled = false,
    category = "small-fluid-assembly",
    energy_required = 1,
    ingredients = {
      {type="item", name="red-wire", amount=2},
      {type="item", name="nullius-glass-fiber", amount=1},
      {type="item", name="nullius-plastic", amount=1},
      {type="fluid", name="nullius-epoxy", amount=1},
      {type="fluid", name="nullius-argon", amount=1}
    },
    result = "nullius-optical-cable"
  },
  {
    type = "recipe",
    name = "nullius-boxed-optical-cable",
    enabled = false,
    category = "medium-only-assembly",
    subgroup = "boxed-electrical",
    energy_required = 5,
    ingredients = {
      {type="item", name="nullius-box-red-wire", amount=2},
      {type="item", name="nullius-box-glass-fiber", amount=1},
      {type="item", name="nullius-box-plastic", amount=1},
      {type="fluid", name="nullius-epoxy", amount=5},
      {type="fluid", name="nullius-argon", amount=5}
    },
    result = "nullius-box-optical-cable"
  },

  {
    type = "recipe",
    name = "nullius-motor-1",
    enabled = false,
    category = "medium-crafting",
    always_show_made_in = true,
    energy_required = 8,
    ingredients = {
      {"nullius-iron-wire", 2},
      {"nullius-iron-plate", 2},
      {"nullius-plastic", 1},
      {"nullius-iron-rod", 1}
    },
    result = "nullius-motor-1"
  },
  {
    type = "recipe",
    name = "nullius-boxed-motor-1",
    enabled = false,
    category = "huge-assembly",
    subgroup = "boxed-mechanical",
    order = "nullius-cb",
    always_show_made_in = true,
    energy_required = 30,
    ingredients = {
      {"nullius-box-insulated-wire", 1},
      {"nullius-box-iron-plate", 2},
      {"nullius-box-iron-rod", 1}
    },
    result = "nullius-box-motor-1"
  },
  {
    type = "recipe",
    name = "nullius-motor-2",
    enabled = false,
    category = "large-fluid-assembly",
    energy_required = 12,
    ingredients = {
      {type="item", name="copper-cable", amount=3},
      {type="item", name="nullius-steel-plate", amount=2},
      {type="item", name="nullius-steel-gear", amount=1},
      {type="item", name="nullius-steel-rod", amount=1},
      {type="fluid", name="nullius-lubricant", amount=6, fluidbox_index=1}
    },
    result = "nullius-motor-2"
  },
  {
    type = "recipe",
    name = "nullius-boxed-motor-2",
    enabled = false,
    category = "huge-fluid-assembly",
    subgroup = "boxed-mechanical",
    order = "nullius-cc",
    energy_required = 60,
    ingredients = {
      {type="item", name="nullius-box-insulated-wire", amount=3},
      {type="item", name="nullius-box-steel-plate", amount=2},
      {type="item", name="nullius-box-steel-gear", amount=1},
      {type="item", name="nullius-box-steel-rod", amount=1},
      {type="fluid", name="nullius-lubricant", amount=30, fluidbox_index=1}
    },
    result = "nullius-box-motor-2"
  },
  {
    type = "recipe",
    name = "nullius-motor-3",
    enabled = false,
    category = "large-fluid-assembly",
    energy_required = 16,
    ingredients = {
      {type="item", name="nullius-motor-2", amount=1},
      {type="item", name="nullius-aluminum-wire", amount=8},
      {type="item", name="nullius-heat-pipe-2", amount=1},
      {type="item", name="nullius-titanium-plate", amount=4},
      {type="item", name="nullius-textile", amount=3},
      {type="item", name="nullius-bearing", amount=1},
      {type="fluid", name="nullius-epoxy", amount=6, fluidbox_index=1}
    },
    result = "nullius-motor-3"
  },
  {
    type = "recipe",
    name = "nullius-boxed-motor-3",
    enabled = false,
    category = "huge-fluid-assembly",
    subgroup = "boxed-mechanical",
    order = "nullius-cd",
    energy_required = 80,
    ingredients = {
      {type="item", name="nullius-box-motor-2", amount=1},
      {type="item", name="nullius-box-aluminum-wire", amount=8},
      {type="item", name="nullius-box-heat-pipe-2", amount=1},
      {type="item", name="nullius-box-titanium-plate", amount=4},
      {type="item", name="nullius-box-textile", amount=3},
      {type="item", name="nullius-box-bearing", amount=1},
      {type="fluid", name="nullius-epoxy", amount=30, fluidbox_index=1}
    },
    result = "nullius-box-motor-3"
  },

  {
    type = "recipe",
    name = "nullius-refractory-brick-1",
    localised_name = {"", {"item-name.nullius-refractory-brick"}, " ", 1},
    order = "nullius-cb",
    enabled = false,
    show_amount_in_title = false,
    always_show_products = true,
    category = "dry-smelting",
    energy_required = 8,
    ingredients = {
      {"nullius-silica", 3}
    },
    result = "nullius-refractory-brick",
    result_count = 5
  },
  {
    type = "recipe",
    name = "nullius-refractory-brick-2",
    localised_name = {"", {"item-name.nullius-refractory-brick"}, " ", 2},
    order = "nullius-cc",
    enabled = false,
    show_amount_in_title = false,
    always_show_products = true,
    category = "dry-smelting",
    energy_required = 5,
    ingredients = {
      {"nullius-ceramic-powder", 2}
    },
    result = "nullius-refractory-brick",
    result_count = 12
  },
  {
    type = "recipe",
    name = "nullius-boxed-refractory-brick",
    enabled = false,
    show_amount_in_title = false,
    always_show_products = true,
    category = "bulk-smelting",
    subgroup = "boxed-terrain",
    energy_required = 5,
    ingredients = {
      {"nullius-box-ceramic-powder", 2}
    },
    result = "nullius-box-refractory-brick",
    result_count = 6
  },

  {
    type = "recipe",
    name = "nullius-crucible",
    enabled = false,
    show_amount_in_title = false,
    always_show_products = true,
    category = "machine-casting",
    energy_required = 30,
    ingredients = {
      {"nullius-silica", 15}
    },
    result = "nullius-crucible"
  },

  {
    type = "recipe",
    name = "nullius-bauxite-flotation-1",
    localised_name = {"", {"item-name.nullius-aluminum-hydroxide"}, " ", 1},
    enabled = false,
    category = "ore-flotation",
    order = "nullius-db",
    energy_required = 5,
    ingredients = {
      {type="item", name="nullius-crushed-bauxite", amount=4},
      {type="fluid", name="nullius-caustic-solution", amount=30, fluidbox_index=1}
    },
    results = {
      {type="item", name="nullius-aluminum-hydroxide", amount=3},
      {type="fluid", name="nullius-sludge", amount=12, fluidbox_index=1}
    },
    main_product = "nullius-aluminum-hydroxide"
  },
  {
    type = "recipe",
    name = "nullius-boxed-bauxite-flotation-1",
    localised_name = {"", {"item-name.nullius-box", {"item-name.nullius-aluminum-hydroxide"}}, " ", 1},
    enabled = false,
    category = "ore-flotation",
    subgroup = "boxed-aluminum",
    order = "nullius-db",
    energy_required = 25,
    ingredients = {
      {type="item", name="nullius-box-crushed-bauxite", amount=4},
      {type="fluid", name="nullius-caustic-solution", amount=150, fluidbox_index=1}
    },
    results = {
      {type="item", name="nullius-box-aluminum-hydroxide", amount=3},
      {type="fluid", name="nullius-sludge", amount=60, fluidbox_index=1}
    },
    main_product = "nullius-box-aluminum-hydroxide"
  },
  {
    type = "recipe",
    name = "nullius-bauxite-flotation-2",
    localised_name = {"", {"item-name.nullius-aluminum-hydroxide"}, " ", 2},
    enabled = false,
    category = "ore-flotation",
    order = "nullius-dc",
    energy_required = 7,
    ingredients = {
      {type="item", name="nullius-crushed-bauxite", amount=7},
      {type="fluid", name="nullius-caustic-solution", amount=40},
      {type="fluid", name="nullius-acid-sulfuric", amount=15}
    },
    results = {
      {type="item", name="nullius-aluminum-hydroxide", amount=6},
      {type="fluid", name="nullius-sludge", amount=25},
      {type="fluid", name="nullius-sulfur-dioxide", amount=3}
    },
    main_product = "nullius-aluminum-hydroxide"
  },
  {
    type = "recipe",
    name = "nullius-boxed-bauxite-flotation-2",
    localised_name = {"", {"item-name.nullius-box", {"item-name.nullius-aluminum-hydroxide"}}, " ", 2},
    enabled = false,
    category = "ore-flotation",
    subgroup = "boxed-aluminum",
    order = "nullius-dc",
    energy_required = 35,
    ingredients = {
      {type="item", name="nullius-box-crushed-bauxite", amount=7},
      {type="fluid", name="nullius-caustic-solution", amount=200},
      {type="fluid", name="nullius-acid-sulfuric", amount=75}
    },
    results = {
      {type="item", name="nullius-box-aluminum-hydroxide", amount=6},
      {type="fluid", name="nullius-sludge", amount=125},
      {type="fluid", name="nullius-sulfur-dioxide", amount=15}
    },
    main_product = "nullius-box-aluminum-hydroxide"
  },

  {
    type = "recipe",
    name = "nullius-alumina-1",
    localised_name = {"recipe-name.nullius-alumina-1"},
    enabled = false,
    show_amount_in_title = false,
    always_show_products = true,
    category = "dry-smelting",
    order = "nullius-eb",
    energy_required = 2,
    ingredients = {
      {"nullius-aluminum-hydroxide", 4}
    },
    result = "nullius-alumina",
    result_count = 3
  },
  {
    type = "recipe",
    name = "nullius-alumina-2",
    localised_name = {"recipe-name.nullius-alumina-2"},
    enabled = false,
    category = "wet-smelting",
    order = "nullius-ec",
    energy_required = 2,
    ingredients = {
      {type="item", name="nullius-aluminum-hydroxide", amount=6},
      {type="fluid", name="nullius-water", amount=10}
    },
    results = {
      {type="item", name="nullius-alumina", amount=5},
      {type="fluid", name="nullius-wastewater", amount=30}
    },
    main_product = "nullius-alumina"
  },
  {
    type = "recipe",
    name = "nullius-boxed-alumina",
    enabled = false,
    category = "bulk-smelting",
    subgroup = "boxed-aluminum",
    order = "nullius-ec",
    energy_required = 2,
    ingredients = {
      {type="item", name="nullius-box-aluminum-hydroxide", amount=6},
      {type="fluid", name="nullius-water", amount=50}
    },
    results = {
      {type="item", name="nullius-box-alumina", amount=5},
      {type="fluid", name="nullius-wastewater", amount=150}
    },
    main_product = "nullius-box-alumina"
  },

  {
    type = "recipe",
    name = "nullius-aluminum-hydroxide",
    localised_name = {"recipe-name.nullius-aluminum-carbide-reprocessing"},
    enabled = false,
    no_productivity = true,
    category = "basic-chemistry",
    order = "nullius-dd",
    crafting_machine_tint = {
      primary = data.raw.fluid["nullius-methane"].flow_color,
      secondary = data.raw.fluid["water"].flow_color
    },
    energy_required = 4,
    ingredients = {
      {type="item", name="nullius-aluminum-carbide", amount=6},
      {type="fluid", name="nullius-water", amount=80, fluidbox_index=2}
    },
    results = {
      {type="item", name="nullius-aluminum-hydroxide", amount=4},
      {type="fluid", name="nullius-methane", amount=80}
    },
    main_product = "nullius-aluminum-hydroxide"
  },
  {
    type = "recipe",
    name = "nullius-aluminum-ingot-1",
    localised_name = {"recipe-name.nullius-aluminum-ingot-1"},
    enabled = false,
    category = "dry-smelting",
    order = "nullius-gb",
    energy_required = 10,
    ingredients = {
      {"nullius-alumina", 9},
      {"nullius-graphite", 5}
    },
    results = {
      {type="item", name="nullius-aluminum-ingot", amount=3},
      {type="item", name="nullius-aluminum-carbide", amount=4}
    },
    main_product = "nullius-aluminum-ingot"
  },
  {
    type = "recipe",
    name = "nullius-aluminum-ingot-2",
    localised_name = {"recipe-name.nullius-aluminum-ingot-2"},
    enabled = false,
    category = "vent-smelting",
    order = "nullius-gc",
    energy_required = 25,
    ingredients = {
      {"nullius-aluminum-carbide", 5},
      {"nullius-alumina", 4}
    },
    results = {
      {type="item", name="nullius-aluminum-ingot", amount=9},
      {type="fluid", name="nullius-carbon-monoxide", amount=80}
    },
    main_product = "nullius-aluminum-ingot"
  },
  {
    type = "recipe",
    name = "nullius-boxed-aluminum-carbide",
    enabled = false,
    category = "bulk-smelting",
    subgroup = "boxed-aluminum",
    order = "nullius-gb",
    energy_required = 10,
    ingredients = {
      {"nullius-box-alumina", 9},
      {"nullius-box-graphite", 5}
    },
    results = {
      {type="item", name="nullius-box-aluminum-ingot", amount=3},
      {type="item", name="nullius-box-aluminum-carbide", amount=4}
    },
    main_product = "nullius-box-aluminum-carbide"
  },
  {
    type = "recipe",
    name = "nullius-boxed-aluminum-ingot-1",
    localised_name = {"", {"item-name.nullius-box", {"item-name.nullius-aluminum-ingot"}}, " ", 1},
    enabled = false,
    category = "bulk-smelting",
    subgroup = "boxed-aluminum",
    order = "nullius-gc",
    energy_required = 25,
    ingredients = {
      {"nullius-box-aluminum-carbide", 5},
      {"nullius-box-alumina", 4}
    },
    results = {
      {type="item", name="nullius-box-aluminum-ingot", amount=9},
      {type="fluid", name="nullius-carbon-monoxide", amount=400}
    },
    main_product = "nullius-box-aluminum-ingot"
  },
  {
    type = "recipe",
    name = "nullius-aluminum-ingot-3",
    localised_name = {"", {"item-name.nullius-aluminum-ingot"}, " ", 3},
    enabled = false,
    category = "wet-smelting",
    order = "nullius-gd",
    energy_required = 12,
    ingredients = {
      {type="item", name="nullius-alumina", amount=11},
      {type="item", name="nullius-graphite", amount=6},
      {type="item", name="nullius-soda-ash", amount=1},
      {type="fluid", name="nullius-water", amount=25}
    },
    results = {
      {type="item", name="nullius-aluminum-ingot", amount=6},
      {type="item", name="nullius-aluminum-carbide", amount=7},
      {type="item", name="nullius-sodium-hydroxide", amount=1},
      {type="fluid", name="nullius-carbon-monoxide", amount=60}
    },
    main_product = "nullius-aluminum-ingot"
  },
  {
    type = "recipe",
    name = "nullius-boxed-aluminum-ingot-2",
    localised_name = {"", {"item-name.nullius-box", {"item-name.nullius-aluminum-ingot"}}, " ", 2},
    enabled = false,
    category = "bulk-smelting",
    subgroup = "boxed-aluminum",
    order = "nullius-gd",
    energy_required = 12,
    ingredients = {
      {type="item", name="nullius-box-alumina", amount=11},
      {type="item", name="nullius-box-graphite", amount=6},
      {type="item", name="nullius-box-soda-ash", amount=1},
      {type="fluid", name="nullius-water", amount=125}
    },
    results = {
      {type="item", name="nullius-box-aluminum-ingot", amount=6},
      {type="item", name="nullius-box-aluminum-carbide", amount=7},
      {type="item", name="nullius-box-sodium-hydroxide", amount=1},
      {type="fluid", name="nullius-carbon-monoxide", amount=300}
    },
    main_product = "nullius-box-aluminum-ingot"
  },

  {
    type = "recipe",
    name = "nullius-silicon-ingot-1",
    localised_name = {"recipe-name.nullius-silicon-ingot-1"},
    enabled = false,
    show_amount_in_title = false,
    always_show_products = true,
    category = "dry-smelting",
    energy_required = 10,
    ingredients = {
      {"nullius-silica", 5},
      {"nullius-graphite", 2}
    },
    result = "nullius-silicon-ingot",
    result_count = 3
  },
  {
    type = "recipe",
    name = "nullius-silicon-ingot-2",
    localised_name = {"recipe-name.nullius-silicon-ingot-2"},
    enabled = false,
    category = "wet-smelting",
    energy_required = 12,
    ingredients = {
      {type="item", name="nullius-silica", amount=6},
      {type="item", name="nullius-graphite", amount=3},
      {type="fluid", name="nullius-oxygen", amount=10}
    },
    results = {
      {type="item", name="nullius-silicon-ingot", amount=5},
      {type="fluid", name="nullius-carbon-monoxide", amount=50}
    },
    main_product = "nullius-silicon-ingot"
  },
  {
    type = "recipe",
    name = "nullius-boxed-silicon-ingot",
    enabled = false,
    category = "bulk-smelting",
    subgroup = "boxed-silicon",
    energy_required = 12,
    ingredients = {
      {type="item", name="nullius-box-silica", amount=6},
      {type="item", name="nullius-box-graphite", amount=3},
      {type="fluid", name="nullius-oxygen", amount=50}
    },
    results = {
      {type="item", name="nullius-box-silicon-ingot", amount=5},
      {type="fluid", name="nullius-carbon-monoxide", amount=250}
    },
    main_product = "nullius-box-silicon-ingot"
  },

  {
    type = "recipe",
    name = "nullius-polycrystalline-silicon",
    enabled = false,
    category = "basic-chemistry",
    crafting_machine_tint = {
      primary = data.raw.fluid["nullius-hydrogen"].flow_color,
      secondary = data.raw.fluid["nullius-chlorine"].flow_color
    },
    energy_required = 6,
    ingredients = {
      {type="item", name="nullius-silicon-ingot", amount=3},
      {type="fluid", name="nullius-hydrogen-chloride", amount=45, fluidbox_index=1},
      {type="fluid", name="nullius-nitrogen", amount=20, fluidbox_index=3}
    },
    results = {
      {type="item", name="nullius-polycrystalline-silicon", amount=2},
      {type="fluid", name="nullius-hydrogen", amount=15},
      {type="fluid", name="nullius-chlorine", amount=15}
    },
    main_product = "nullius-polycrystalline-silicon"
  },
  {
    type = "recipe",
    name = "nullius-monocrystalline-silicon",
    enabled = false,
    show_amount_in_title = false,
    always_show_products = true,
    category = "nanotechnology",
    energy_required = 16,
    ingredients = {
      {type="item", name="nullius-polycrystalline-silicon", amount=5},
      {type="fluid", name="nullius-argon", amount=10, fluidbox_index=1}
    },
    result = "nullius-monocrystalline-silicon",
    result_count = 3
  },
  {
    type = "recipe",
    name = "nullius-boxed-polycrystalline-silicon",
    enabled = false,
    category = "basic-chemistry",
    subgroup = "boxed-silicon",
    crafting_machine_tint = {
      primary = data.raw.fluid["nullius-hydrogen"].flow_color,
      secondary = data.raw.fluid["nullius-chlorine"].flow_color
    },
    energy_required = 30,
    ingredients = {
      {type="item", name="nullius-box-silicon-ingot", amount=3},
      {type="fluid", name="nullius-hydrogen-chloride", amount=200, fluidbox_index=1},
      {type="fluid", name="nullius-nitrogen", amount=50, fluidbox_index=3}
    },
    results = {
      {type="item", name="nullius-box-polycrystalline-silicon", amount=2},
      {type="fluid", name="nullius-hydrogen", amount=75},
      {type="fluid", name="nullius-chlorine", amount=75}
    },
    main_product = "nullius-box-polycrystalline-silicon"
  },
  {
    type = "recipe",
    name = "nullius-boxed-monocrystalline-silicon",
    enabled = false,
    show_amount_in_title = false,
    always_show_products = true,
    category = "nanotechnology",
    subgroup = "boxed-silicon",
    energy_required = 80,
    ingredients = {
      {type="item", name="nullius-box-polycrystalline-silicon", amount=5},
      {type="fluid", name="nullius-argon", amount=50, fluidbox_index=1}
    },
    result = "nullius-box-monocrystalline-silicon",
    result_count = 3
  },

  {
    type = "recipe",
    name = "nullius-empty-canister",
    enabled = false,
    category = "small-crafting",
    always_show_made_in = true,
    show_amount_in_title = false,
    always_show_products = true,
    energy_required = 5,
    ingredients = {
      {type="item", name="empty-barrel", amount=1},
      {type="item", name="nullius-aluminum-sheet", amount=2},
      {type="item", name="nullius-top-up-valve", amount=1}
    },
    result = "nullius-canister",
    result_count = 5
  },
  {
    type = "recipe",
    name = "nullius-boxed-canister",
    enabled = false,
    category = "large-assembly",
    subgroup = "boxed-canister",
    always_show_made_in = true,
    show_amount_in_title = false,
    always_show_products = true,
    energy_required = 25,
    ingredients = {
      {type="item", name="nullius-box-barrel", amount=1},
      {type="item", name="nullius-box-aluminum-sheet", amount=2},
      {type="item", name="nullius-box-top-up-valve", amount=1}
    },
    result = "nullius-box-canister",
    result_count = 5
  },

  {
    type = "recipe",
    name = "nullius-filter-1",
    enabled = false,
    show_amount_in_title = false,
    always_show_products = true,
    category = "basic-chemistry",
    order = "nullius-cb",
    crafting_machine_tint = {
      primary = data.raw.fluid["nullius-carbon-dioxide"].flow_color,
      secondary = data.raw.fluid["nullius-carbon-dioxide"].flow_color
    },
    energy_required = 4,
    ingredients = {
      {type="item", name="nullius-plastic", amount=2},
      {type="item", name="nullius-graphite", amount=2},
      {type="item", name="nullius-iron-sheet", amount=1},
      {type="fluid", name="nullius-carbon-dioxide", amount=10, fluidbox_index=3}
    },
    result = "nullius-filter-1"
  },
  {
    type = "recipe",
    name = "nullius-boxed-filter-1",
    enabled = false,
    show_amount_in_title = false,
    always_show_products = true,
    category = "basic-chemistry",
    subgroup = "boxed-mechanical",
    order = "nullius-bb",
    crafting_machine_tint = {
      primary = data.raw.fluid["nullius-carbon-dioxide"].flow_color,
      secondary = data.raw.fluid["nullius-carbon-dioxide"].flow_color
    },
    energy_required = 20,
    ingredients = {
      {type="item", name="nullius-box-plastic", amount=2},
      {type="item", name="nullius-box-graphite", amount=2},
      {type="item", name="nullius-box-iron-sheet", amount=1},
      {type="fluid", name="nullius-carbon-dioxide", amount=50, fluidbox_index=3}
    },
    result = "nullius-box-filter-1"
  },
  {
    type = "recipe",
    name = "nullius-pressure-filter-1",
    localised_name = {"recipe-name.nullius-pressure", {"item-name.nullius-filter-1"}},
    enabled = false,
    show_amount_in_title = false,
    always_show_products = true,
    category = "basic-chemistry",
    order = "nullius-cc",
    crafting_machine_tint = {
      primary = data.raw.fluid["nullius-carbon-dioxide"].flow_color,
      secondary = data.raw.fluid["nullius-carbon-dioxide"].flow_color
    },
    energy_required = 3,
    ingredients = {
      {type="item", name="nullius-plastic", amount=4},
      {type="item", name="nullius-graphite", amount=3},
      {type="item", name="nullius-aluminum-sheet", amount=1},
      {type="fluid", name="nullius-compressed-carbon-dioxide", amount=4, fluidbox_index=3}
    },
    result = "nullius-filter-1",
    result_count = 2
  },
  {
    type = "recipe",
    name = "nullius-boxed-pressure-filter-1",
    localised_name = {"recipe-name.nullius-pressure", {"item-name.nullius-box", {"item-name.nullius-filter-1"}}},
    enabled = false,
    show_amount_in_title = false,
    always_show_products = true,
    category = "basic-chemistry",
    subgroup = "boxed-mechanical",
    order = "nullius-bc",
    crafting_machine_tint = {
      primary = data.raw.fluid["nullius-carbon-dioxide"].flow_color,
      secondary = data.raw.fluid["nullius-carbon-dioxide"].flow_color
    },
    energy_required = 15,
    ingredients = {
      {type="item", name="nullius-box-plastic", amount=4},
      {type="item", name="nullius-box-graphite", amount=3},
      {type="item", name="nullius-box-aluminum-sheet", amount=1},
      {type="fluid", name="nullius-compressed-carbon-dioxide", amount=20, fluidbox_index=3}
    },
    result = "nullius-box-filter-1",
    result_count = 2
  },

  {
    type = "recipe",
    name = "nullius-filter-2",
    enabled = false,
    show_amount_in_title = false,
    always_show_products = true,
    always_show_made_in = true,
    category = "tiny-crafting",
    energy_required = 6,
    ingredients = {
      {type="item", name="nullius-filter-1", amount=2},
      {type="item", name="nullius-titanium-sheet", amount=1},
      {type="item", name="nullius-graphene", amount=2},
      {type="item", name="nullius-textile", amount=2},
      {type="item", name="nullius-alumina", amount=3}
    },
    result = "nullius-filter-2"
  },
  {
    type = "recipe",
    name = "nullius-boxed-filter-2",
    enabled = false,
    show_amount_in_title = false,
    always_show_products = true,
    always_show_made_in = true,
    category = "tiny-assembly",
    subgroup = "boxed-mechanical",
    order = "nullius-bd",
    energy_required = 30,
    ingredients = {
      {type="item", name="nullius-box-filter-1", amount=2},
      {type="item", name="nullius-box-titanium-sheet", amount=1},
      {type="item", name="nullius-box-graphene", amount=2},
      {type="item", name="nullius-box-textile", amount=2},
      {type="item", name="nullius-box-alumina", amount=3}
    },
    result = "nullius-box-filter-2"
  },
  {
    type = "recipe",
    name = "nullius-cement-1",
    localised_name = {"recipe-name.nullius-cement-1"},
    enabled = false,
    show_amount_in_title = false,
    always_show_products = true,
    category = "dry-smelting",
    energy_required = 10,
    ingredients = {
      {type="item", name="nullius-lime", amount=12},
      {type="item", name="nullius-silica", amount=4},
      {type="item", name="nullius-aluminum-hydroxide", amount=1}
    },
    result = "nullius-cement",
    result_count = 4
  },
  {
    type = "recipe",
    name = "nullius-cement-2",
    localised_name = {"recipe-name.nullius-cement-2"},
    enabled = false,
    show_amount_in_title = false,
    always_show_products = true,
    category = "dry-smelting",
    order = "nullius-cc",
    energy_required = 20,
    ingredients = {
      {type="item", name="nullius-lime", amount=16},
      {type="item", name="nullius-aluminum-hydroxide", amount=6},
      {type="item", name="nullius-silica", amount=5},
      {type="item", name="nullius-gypsum", amount=3},
      {type="item", name="nullius-iron-oxide", amount=2},
      {type="item", name="nullius-soda-ash", amount=1}
    },
    result = "nullius-cement",
    result_count = 16
  },
  {
    type = "recipe",
    name = "nullius-boxed-cement",
    enabled = false,
    show_amount_in_title = false,
    always_show_products = true,
    category = "bulk-smelting",
    subgroup = "boxed-glass",
    energy_required = 20,
    ingredients = {
      {type="item", name="nullius-box-lime", amount=16},
      {type="item", name="nullius-box-aluminum-hydroxide", amount=6},
      {type="item", name="nullius-box-silica", amount=5},
      {type="item", name="nullius-box-gypsum", amount=3},
      {type="item", name="nullius-box-iron-oxide", amount=2},
      {type="item", name="nullius-box-soda-ash", amount=1}
    },
    result = "nullius-box-cement",
    result_count = 16
  },

  {
    type = "recipe",
    name = "nullius-mortar",
    enabled = false,
    show_amount_in_title = false,
    always_show_products = true,
    category = "ore-flotation",
    energy_required = 2,
    ingredients = {
      {type="item", name="nullius-cement", amount=1},
      {type="item", name="nullius-lime", amount=1},
      {type="item", name="nullius-sand", amount=5},
      {type="fluid", name="nullius-water", amount=8, fluidbox_index=1}
    },
    result = "nullius-mortar",
    result_count = 4
  },
  {
    type = "recipe",
    name = "nullius-boxed-mortar",
    localised_name = {"recipe-name.nullius-boxed", {"item-name.nullius-mortar"}},
    enabled = false,
    show_amount_in_title = false,
    always_show_products = true,
    category = "ore-flotation",
    subgroup = "boxed-calcium",
    order = "nullius-x",
    energy_required = 8,
    ingredients = {
      {type="item", name="nullius-box-cement", amount=1},
      {type="item", name="nullius-box-lime", amount=1},
      {type="item", name="nullius-box-sand", amount=5},
      {type="fluid", name="nullius-water", amount=40, fluidbox_index=1}
    },
    result = "nullius-mortar",
    result_count = 20
  },

  {
    type = "recipe",
    name = "nullius-concrete-1",
    localised_name = {"", {"item-name.concrete"}, " ", 1},
    order = "nullius-db",
    enabled = false,
    show_amount_in_title = false,
    always_show_products = true,
    category = "ore-flotation",
    energy_required = 3,
    ingredients = {
      {type="item", name="nullius-cement", amount=1},
      {type="item", name="nullius-sand", amount=2},
      {type="item", name="nullius-gravel", amount=4},
      {type="fluid", name="nullius-water", amount=6, fluidbox_index=1}
    },
    result = "concrete",
    result_count = 5
  },
  {
    type = "recipe",
    name = "nullius-concrete-2",
    localised_name = {"", {"item-name.concrete"}, " ", 2},
    order = "nullius-dc",
    enabled = false,
    show_amount_in_title = false,
    always_show_products = true,
    category = "ore-flotation",
    energy_required = 8,
    ingredients = {
      {type="item", name="nullius-cement", amount=3},
      {type="item", name="nullius-sand", amount=7},
      {type="item", name="nullius-gravel", amount=15},
      {type="fluid", name="nullius-calcium-chloride-solution", amount=5},
      {type="fluid", name="nullius-water", amount=15}
    },
    result = "concrete",
    result_count = 20
  },
  {
    type = "recipe",
    name = "nullius-boxed-concrete",
    enabled = false,
    show_amount_in_title = false,
    always_show_products = true,
    category = "ore-flotation",
    order = "nullius-ax",
    subgroup = "boxed-concrete",
    energy_required = 40,
    ingredients = {
      {type="item", name="nullius-box-cement", amount=3},
      {type="item", name="nullius-box-sand", amount=7},
      {type="item", name="nullius-box-gravel", amount=15},
      {type="fluid", name="nullius-calcium-chloride-solution", amount=25},
      {type="fluid", name="nullius-water", amount=75}
    },
    result = "nullius-box-concrete",
    result_count = 10
  },

  {
    type = "recipe",
    name = "nullius-reinforced-concrete",
    enabled = false,
    show_amount_in_title = false,
    always_show_products = true,
    category = "ore-flotation",
    energy_required = 12,
    ingredients = {
      {type="item", name="nullius-cement", amount=3},
      {type="item", name="nullius-sand", amount=4},
      {type="item", name="nullius-gravel", amount=7},
      {type="fluid", name="nullius-water", amount=8, fluidbox_index=1},
      {type="item", name="nullius-textile", amount=1},
      {type="item", name="nullius-steel-wire", amount=2},
      {type="item", name="nullius-steel-rod", amount=2}
    },
    result = "refined-concrete",
    result_count = 10
  },
  {
    type = "recipe",
    name = "nullius-boxed-reinforced-concrete",
    enabled = false,
    show_amount_in_title = false,
    always_show_products = true,
    category = "ore-flotation",
    subgroup = "boxed-concrete",
    energy_required = 60,
    ingredients = {
      {type="item", name="nullius-box-cement", amount=3},
      {type="item", name="nullius-box-sand", amount=4},
      {type="item", name="nullius-box-gravel", amount=7},
      {type="fluid", name="nullius-water", amount=40, fluidbox_index=1},
      {type="item", name="nullius-box-textile", amount=1},
      {type="item", name="nullius-box-steel-wire", amount=2},
      {type="item", name="nullius-box-steel-rod", amount=2}
    },
    result = "nullius-box-reinforced-concrete",
    result_count = 5
  },

  {
    type = "recipe",
    name = "nullius-red-concrete",
    enabled = false,
    no_productivity = true,
    show_amount_in_title = false,
    always_show_products = true,
    category = "basic-chemistry",
    energy_required = 10,
    ingredients = {
      {type="item", name="refined-concrete", amount=60},
      {type="item", name="nullius-iron-oxide", amount=2},
      {type="fluid", name="nullius-water", amount=4},
      {type="fluid", name="nullius-epoxy", amount=3}
    },
    result = "nullius-red-concrete",
    result_count = 60
  },
  {
    type = "recipe",
    name = "nullius-boxed-red-concrete",
    enabled = false,
    no_productivity = true,
    show_amount_in_title = false,
    always_show_products = true,
    category = "basic-chemistry",
    subgroup = "boxed-concrete",
    energy_required = 50,
    ingredients = {
      {type="item", name="nullius-box-reinforced-concrete", amount=30},
      {type="item", name="nullius-box-iron-oxide", amount=2},
      {type="fluid", name="nullius-water", amount=20},
      {type="fluid", name="nullius-epoxy", amount=15}
    },
    result = "nullius-box-red-concrete",
    result_count = 30
  },

  {
    type = "recipe",
    name = "nullius-blue-concrete",
    enabled = false,
    no_productivity = true,
    show_amount_in_title = false,
    always_show_products = true,
    category = "basic-chemistry",
    energy_required = 15,
    ingredients = {
      {type="item", name="refined-concrete", amount=60},
      {type="item", name="nullius-sodium-sulfate", amount=1},
      {type="item", name="nullius-aluminum-hydroxide", amount=1},
      {type="item", name="nullius-silica", amount=1},
      {type="item", name="nullius-graphite", amount=1},
      {type="fluid", name="nullius-water", amount=3},
      {type="fluid", name="nullius-epoxy", amount=3}
    },
    result = "nullius-blue-concrete",
    result_count = 60
  },
  {
    type = "recipe",
    name = "nullius-boxed-blue-concrete",
    enabled = false,
    no_productivity = true,
    show_amount_in_title = false,
    always_show_products = true,
    category = "basic-chemistry",
    subgroup = "boxed-concrete",
    energy_required = 75,
    ingredients = {
      {type="item", name="nullius-box-reinforced-concrete", amount=30},
      {type="item", name="nullius-box-sodium-sulfate", amount=1},
      {type="item", name="nullius-box-aluminum-hydroxide", amount=1},
      {type="item", name="nullius-box-silica", amount=1},
      {type="item", name="nullius-box-graphite", amount=1},
      {type="fluid", name="nullius-water", amount=15},
      {type="fluid", name="nullius-epoxy", amount=15}
    },
    result = "nullius-box-blue-concrete",
    result_count = 30
  },

  {
    type = "recipe",
    name = "nullius-yellow-concrete",
    enabled = false,
    no_productivity = true,
    show_amount_in_title = false,
    always_show_products = true,
    category = "basic-chemistry",
    energy_required = 12,
    ingredients = {
      {type="item", name="refined-concrete", amount=60},
      {type="item", name="nullius-iron-wire", amount=1},
      {type="item", name="nullius-sodium-hydroxide", amount=1},
      {type="fluid", name="nullius-acid-hydrochloric", amount=5},
      {type="fluid", name="nullius-epoxy", amount=3}
    },
    result = "nullius-yellow-concrete",
    result_count = 60
  },
  {
    type = "recipe",
    name = "nullius-boxed-yellow-concrete",
    enabled = false,
    no_productivity = true,
    show_amount_in_title = false,
    always_show_products = true,
    category = "basic-chemistry",
    subgroup = "boxed-concrete",
    energy_required = 60,
    ingredients = {
      {type="item", name="nullius-box-reinforced-concrete", amount=30},
      {type="item", name="nullius-box-iron-wire", amount=1},
      {type="item", name="nullius-box-sodium-hydroxide", amount=1},
      {type="fluid", name="nullius-acid-hydrochloric", amount=25},
      {type="fluid", name="nullius-epoxy", amount=15}
    },
    result = "nullius-box-yellow-concrete",
    result_count = 30
  },

  {
    type = "recipe",
    name = "nullius-green-concrete",
    enabled = false,
    no_productivity = true,
    always_show_made_in = true,
    show_amount_in_title = false,
    always_show_products = true,
    category = "large-crafting",
    energy_required = 1,
    ingredients = {
      {type="item", name="nullius-yellow-concrete", amount=15},
      {type="item", name="nullius-blue-concrete", amount=15}
    },
    result = "nullius-green-concrete",
    result_count = 30
  },
  {
    type = "recipe",
    name = "nullius-boxed-green-concrete",
    enabled = false,
    no_productivity = true,
    always_show_made_in = true,
    show_amount_in_title = false,
    always_show_products = true,
    category = "huge-assembly",
    subgroup = "boxed-concrete",
    energy_required = 2,
    ingredients = {
      {type="item", name="nullius-box-yellow-concrete", amount=3},
      {type="item", name="nullius-box-blue-concrete", amount=3}
    },
    result = "nullius-box-green-concrete",
    result_count = 6
  },


  {
    type = "recipe",
    name = "nullius-purple-concrete",
    enabled = false,
    no_productivity = true,
    always_show_made_in = true,
    show_amount_in_title = false,
    always_show_products = true,
    category = "large-crafting",
    energy_required = 1,
    ingredients = {
      {type="item", name="nullius-red-concrete", amount=15},
      {type="item", name="nullius-blue-concrete", amount=15}
    },
    result = "nullius-purple-concrete",
    result_count = 30
  },
  {
    type = "recipe",
    name = "nullius-boxed-purple-concrete",
    enabled = false,
    no_productivity = true,
    always_show_made_in = true,
    show_amount_in_title = false,
    always_show_products = true,
    category = "huge-assembly",
    subgroup = "boxed-concrete",
    energy_required = 2,
    ingredients = {
      {type="item", name="nullius-box-red-concrete", amount=3},
      {type="item", name="nullius-box-blue-concrete", amount=3}
    },
    result = "nullius-box-purple-concrete",
    result_count = 6
  },


  {
    type = "recipe",
    name = "nullius-brown-concrete",
    enabled = false,
    no_productivity = true,
    always_show_made_in = true,
    show_amount_in_title = false,
    always_show_products = true,
    category = "large-crafting",
    energy_required = 1,
    ingredients = {
      {type="item", name="nullius-yellow-concrete", amount=15},
      {type="item", name="nullius-red-concrete", amount=15}
    },
    result = "nullius-brown-concrete",
    result_count = 30
  },
  {
    type = "recipe",
    name = "nullius-boxed-brown-concrete",
    enabled = false,
    no_productivity = true,
    always_show_made_in = true,
    show_amount_in_title = false,
    always_show_products = true,
    category = "huge-assembly",
    subgroup = "boxed-concrete",
    energy_required = 2,
    ingredients = {
      {type="item", name="nullius-box-yellow-concrete", amount=3},
      {type="item", name="nullius-box-red-concrete", amount=3}
    },
    result = "nullius-box-brown-concrete",
    result_count = 6
  },

  {
    type = "recipe",
    name = "nullius-black-concrete",
    enabled = false,
    no_productivity = true,
    always_show_made_in = true,
    show_amount_in_title = false,
    always_show_products = true,
    category = "large-crafting",
    energy_required = 3,
    ingredients = {
      {type="item", name="nullius-red-concrete", amount=20},
      {type="item", name="nullius-blue-concrete", amount=20},
      {type="item", name="nullius-yellow-concrete", amount=20},
      {type="item", name="nullius-graphite", amount=1}
    },
    result = "nullius-black-concrete",
    result_count = 60
  },
  {
    type = "recipe",
    name = "nullius-boxed-black-concrete",
    enabled = false,
    no_productivity = true,
    always_show_made_in = true,
    show_amount_in_title = false,
    always_show_products = true,
    category = "huge-assembly",
    subgroup = "boxed-concrete",
    energy_required = 15,
    ingredients = {
      {type="item", name="nullius-box-red-concrete", amount=10},
      {type="item", name="nullius-box-blue-concrete", amount=10},
      {type="item", name="nullius-box-yellow-concrete", amount=10},
      {type="item", name="nullius-box-graphite", amount=1}
    },
    result = "nullius-box-black-concrete",
    result_count = 30
  },

  {
    type = "recipe",
    name = "nullius-hazard-concrete",
    enabled = false,
    category = "large-crafting",
    always_show_made_in = true,
    no_productivity = true,
    show_amount_in_title = false,
    always_show_products = true,
    energy_required = 2,
    ingredients = {
      {type="item", name="nullius-yellow-concrete", amount=24},
      {type="item", name="nullius-black-concrete", amount=16}
    },
    result = "refined-hazard-concrete",
    result_count = 40
  },
  {
    type = "recipe",
    name = "nullius-boxed-hazard-concrete",
    enabled = false,
    category = "huge-assembly",
    subgroup = "boxed-concrete",
    always_show_made_in = true,
    no_productivity = true,
    show_amount_in_title = false,
    always_show_products = true,
    energy_required = 10,
    ingredients = {
      {type="item", name="nullius-box-yellow-concrete", amount=12},
      {type="item", name="nullius-box-black-concrete", amount=8}
    },
    result = "nullius-box-hazard-concrete",
    result_count = 20
  },

  {
    type = "recipe",
    name = "nullius-sensor-1",
    enabled = false,
    category = "small-crafting",
    always_show_made_in = true,
    show_amount_in_title = false,
    always_show_products = true,
    energy_required = 3,
    ingredients = {
      {"arithmetic-combinator", 1},
      {"nullius-glass", 1},
      {"small-lamp", 1},
      {"nullius-capacitor", 1},
      {"nullius-polycrystalline-silicon", 1},
      {"red-wire", 2}
    },
    result = "nullius-sensor-1",
    result_count = 2
  },
  {
    type = "recipe",
    name = "nullius-boxed-sensor-1",
    enabled = false,
    category = "large-assembly",
    subgroup = "boxed-mechanical",
    order = "nullius-gb",
    always_show_made_in = true,
    show_amount_in_title = false,
    always_show_products = true,
    energy_required = 15,
    ingredients = {
      {"nullius-box-arithmetic-circuit", 1},
      {"nullius-box-glass", 1},
      {"nullius-box-lamp-1", 1},
      {"nullius-box-capacitor", 1},
      {"nullius-box-polycrystalline-silicon", 1},
      {"nullius-box-red-wire", 2}
    },
    result = "nullius-box-sensor-1",
    result_count = 2
  },

  {
    type = "recipe",
    name = "nullius-sensor-2",
    enabled = false,
    category = "nanotechnology",
    always_show_made_in = true,
    energy_required = 3,
    ingredients = {
      {type="item", name="nullius-sensor-1", amount=1},
      {type="item", name="nullius-processor-1", amount=1},
      {type="item", name="nullius-lamp-2", amount=1},
      {type="item", name="nullius-optical-cable", amount=1},
      {type="item", name="nullius-ceramic-powder", amount=1},
      {type="fluid", name="nullius-titanium-tetrachloride", amount=2, fluidbox_index=1},
      {type="fluid", name="nullius-oxygen", amount=8, fluidbox_index=2}
    },
    results = {
      {type="item", name="nullius-sensor-2", amount=1},
      {type="fluid", name="nullius-chlorine", amount=6}
    },
    main_product = "nullius-sensor-2"
  },
  {
    type = "recipe",
    name = "nullius-boxed-sensor-2",
    enabled = false,
    category = "nanotechnology",
    subgroup = "boxed-mechanical",
    order = "nullius-gc",
    always_show_made_in = true,
    energy_required = 15,
    ingredients = {
      {type="item", name="nullius-box-sensor-1", amount=1},
      {type="item", name="nullius-box-processor-1", amount=1},
      {type="item", name="nullius-box-lamp-2", amount=1},
      {type="item", name="nullius-box-optical-cable", amount=1},
      {type="item", name="nullius-box-ceramic-powder", amount=1},
      {type="fluid", name="nullius-titanium-tetrachloride", amount=10, fluidbox_index=1},
      {type="fluid", name="nullius-oxygen", amount=40, fluidbox_index=2}
    },
    results = {
      {type="item", name="nullius-box-sensor-2", amount=1},
      {type="fluid", name="nullius-chlorine", amount=30}
    },
    main_product = "nullius-box-sensor-2"
  },

  {
    type = "recipe",
    name = "nullius-ceramic-powder",
    enabled = false,
    category = "wet-smelting",
    always_show_made_in = true,
    energy_required = 30,
    ingredients = {
      {type="item", name="nullius-silicon-ingot", amount=15},
      {type="item", name="nullius-graphite", amount=12},
      {type="item", name="nullius-boron", amount=1},
      {type="fluid", name="nullius-nitrogen", amount=200}
    },
    results = {
      {type="item", name="nullius-ceramic-powder", amount=12},
      {type="fluid", name="nullius-carbon-monoxide", amount=60}
    },
    main_product = "nullius-ceramic-powder"
  },
  {
    type = "recipe",
    name = "nullius-boxed-ceramic-powder",
    enabled = false,
    category = "bulk-smelting",
    subgroup = "boxed-glass",
    always_show_made_in = true,
    energy_required = 30,
    ingredients = {
      {type="item", name="nullius-box-silicon-ingot", amount=15},
      {type="item", name="nullius-box-graphite", amount=12},
      {type="item", name="nullius-box-boron", amount=1},
      {type="fluid", name="nullius-nitrogen", amount=1000}
    },
    results = {
      {type="item", name="nullius-box-ceramic-powder", amount=12},
      {type="fluid", name="nullius-carbon-monoxide", amount=300}
    },
    main_product = "nullius-box-ceramic-powder"
  },

  {
    type = "recipe",
    name = "nullius-bearing",
    enabled = false,
    category = "machine-casting",
    always_show_made_in = true,
    energy_required = 2,
    ingredients = {
      {type="item", name="nullius-ceramic-powder", amount=1},
      {type="fluid", name="nullius-lubricant", amount=1}
    },
    result = "nullius-bearing"
  },
  {
    type = "recipe",
    name = "nullius-boxed-bearing",
    enabled = false,
    category = "machine-casting",
    subgroup = "boxed-mechanical",
    always_show_made_in = true,
    energy_required = 10,
    ingredients = {
      {type="item", name="nullius-box-ceramic-powder", amount=1},
      {type="fluid", name="nullius-lubricant", amount=5}
    },
    result = "nullius-box-bearing"
  },

  {
    type = "recipe",
    name = "nullius-acrylic-fiber",
    enabled = false,
    category = "ore-flotation",
    always_show_made_in = true,
    show_amount_in_title = false,
    always_show_products = true,
    energy_required = 2,
    ingredients = {
      {type="fluid", name="nullius-acrylonitrile", amount=4},
      {type="fluid", name="nullius-water", amount=3}
    },
    result = "nullius-acrylic-fiber"
  },
  {
    type = "recipe",
    name = "nullius-boxed-acrylic-fiber",
    enabled = false,
    category = "ore-flotation",
    subgroup = "boxed-organic-2",
    order = "nullius-f",
    always_show_made_in = true,
    show_amount_in_title = false,
    always_show_products = true,
    energy_required = 10,
    ingredients = {
      {type="fluid", name="nullius-acrylonitrile", amount=20},
      {type="fluid", name="nullius-water", amount=15}
    },
    result = "nullius-box-acrylic-fiber"
  },

  {
    type = "recipe",
    name = "nullius-carbon-fiber",
    enabled = false,
    category = "wet-smelting",
    always_show_made_in = true,
    energy_required = 8,
    ingredients = {
      {type="item", name="nullius-acrylic-fiber", amount=3},
      {type="fluid", name="nullius-argon", amount=1}
    },
    results = {
      {type="item", name="nullius-carbon-fiber", amount=1},
      {type="fluid", name="nullius-ammonia", amount=15}
    },
    main_product = "nullius-carbon-fiber"
  },
  {
    type = "recipe",
    name = "nullius-boxed-carbon-fiber",
    enabled = false,
    category = "bulk-smelting",
    subgroup = "boxed-organic-2",
    order = "nullius-g",
    always_show_made_in = true,
    energy_required = 8,
    ingredients = {
      {type="item", name="nullius-box-acrylic-fiber", amount=3},
      {type="fluid", name="nullius-argon", amount=5}
    },
    results = {
      {type="item", name="nullius-box-carbon-fiber", amount=1},
      {type="fluid", name="nullius-ammonia", amount=75}
    },
    main_product = "nullius-box-carbon-fiber"
  },

  {
    type = "recipe",
    name = "nullius-textile-1",
    localised_name = {"", {"item-name.nullius-textile"}, " ", 1},
    enabled = false,
    always_show_made_in = true,
    show_amount_in_title = false,
    always_show_products = true,
    category = "medium-assembly",
    order = "nullius-db",
    energy_required = 15,
    ingredients = {
      {type="item", name="nullius-acrylic-fiber", amount=10},
      {type="item", name="nullius-sodium-sulfate", amount=1}
    },
    result = "nullius-textile",
    result_count = 5
  },
  {
    type = "recipe",
    name = "nullius-boxed-textile-1",
    localised_name = {"", {"item-name.nullius-box", {"item-name.nullius-textile"}}, " ", 1},
    enabled = false,
    always_show_made_in = true,
    show_amount_in_title = false,
    always_show_products = true,
    category = "large-assembly",
    subgroup = "boxed-organic-2",
    order = "nullius-hb",
    energy_required = 75,
    ingredients = {
      {type="item", name="nullius-box-acrylic-fiber", amount=10},
      {type="item", name="nullius-box-sodium-sulfate", amount=1}
    },
    result = "nullius-box-textile",
    result_count = 5
  },
  {
    type = "recipe",
    name = "nullius-textile-2",
    localised_name = {"", {"item-name.nullius-textile"}, " ", 2},
    enabled = false,
    always_show_made_in = true,
    show_amount_in_title = false,
    always_show_products = true,
    category = "medium-assembly",
    order = "nullius-dc",
    energy_required = 12,
    ingredients = {
      {type="item", name="nullius-acrylic-fiber", amount=8},
      {type="item", name="nullius-cellulose", amount=6},
      {type="item", name="nullius-sodium-sulfate", amount=1}
    },
    result = "nullius-textile",
    result_count = 12
  },
  {
    type = "recipe",
    name = "nullius-boxed-textile-2",
    localised_name = {"", {"item-name.nullius-box", {"item-name.nullius-textile"}}, " ", 2},
    enabled = false,
    always_show_made_in = true,
    show_amount_in_title = false,
    always_show_products = true,
    category = "large-assembly",
    subgroup = "boxed-organic-2",
    order = "nullius-hc",
    energy_required = 60,
    ingredients = {
      {type="item", name="nullius-box-acrylic-fiber", amount=8},
      {type="item", name="nullius-box-cellulose", amount=6},
      {type="item", name="nullius-box-sodium-sulfate", amount=1}
    },
    result = "nullius-box-textile",
    result_count = 12
  },

  {
    type = "recipe",
    name = "nullius-titanium-tetrachloride",
    enabled = false,
    category = "wet-smelting",
    subgroup = "titanium-product",
    order = "nullius-c",
    energy_required = 10,
    ingredients = {
      {type="item", name="nullius-rutile", amount=4},
      {type="item", name="nullius-graphite", amount=7},
      {type="fluid", name="nullius-chlorine", amount=80}
    },
    results = {
      {type="fluid", name="nullius-titanium-tetrachloride", amount=15},
      {type="item", name="nullius-mineral-dust", amount=2}
    },
    main_product = "nullius-titanium-tetrachloride"
  },
  {
    type = "recipe",
    name = "nullius-boxed-titanium-tetrachloride",
    enabled = false,
    category = "bulk-smelting",
    subgroup = "boxed-titanium",
    order = "nullius-c",
    energy_required = 10,
    ingredients = {
      {type="item", name="nullius-box-rutile", amount=4},
      {type="item", name="nullius-box-graphite", amount=7},
      {type="fluid", name="nullius-chlorine", amount=400}
    },
    results = {
      {type="fluid", name="nullius-titanium-tetrachloride", amount=75},
      {type="item", name="nullius-box-mineral-dust", amount=2}
    },
    main_product = "nullius-titanium-tetrachloride"
  },

  {
    type = "recipe",
    name = "nullius-titanium-ingot-1",
    enabled = false,
    category = "ore-flotation",
    order = "nullius-db",
    energy_required = 8,
    ingredients = {
      {type="fluid", name="nullius-titanium-tetrachloride", amount=10},
      {type="item", name="nullius-sodium", amount=6},
      {type="fluid", name="nullius-argon", amount=1}
    },
    results = {
      {type="item", name="nullius-titanium-ingot", amount=1},
      {type="item", name="nullius-salt", amount=4}
    },
    main_product = "nullius-titanium-ingot"
  },
  {
    type = "recipe",
    name = "nullius-boxed-titanium-ingot-1",
    localised_name = {"", {"item-name.nullius-box", {"item-name.nullius-titanium-ingot"}}, " ", 1},
    enabled = false,
    category = "ore-flotation",
    subgroup = "boxed-titanium",
    order = "nullius-db",
    energy_required = 40,
    ingredients = {
      {type="fluid", name="nullius-titanium-tetrachloride", amount=50},
      {type="item", name="nullius-box-sodium", amount=6},
      {type="fluid", name="nullius-argon", amount=5}
    },
    results = {
      {type="item", name="nullius-box-titanium-ingot", amount=1},
      {type="item", name="nullius-box-salt", amount=4}
    },
    main_product = "nullius-box-titanium-ingot"
  },
  {
    type = "recipe",
    name = "nullius-titanium-ingot-2",
    localised_name = {"", {"item-name.nullius-titanium-ingot"}, " ", 2},
    enabled = false,
    category = "vent-smelting",
    order = "nullius-dc",
    energy_required = 20,
    ingredients = {
      {type="item", name="nullius-rutile", amount=7},
      {type="item", name="nullius-calcium", amount=4},
      {type="item", name="nullius-calcium-chloride", amount=2}
    },
    results = {
      {type="item", name="nullius-titanium-ingot", amount=5},
      {type="item", name="nullius-lime", amount=4},
      {type="fluid", name="nullius-chlorine", amount=5}
    },
    main_product = "nullius-titanium-ingot"
  },
  {
    type = "recipe",
    name = "nullius-boxed-titanium-ingot-2",
    localised_name = {"", {"item-name.nullius-box", {"item-name.nullius-titanium-ingot"}}, " ", 2},
    enabled = false,
    category = "bulk-smelting",
    subgroup = "boxed-titanium",
    order = "nullius-dc",
    energy_required = 20,
    ingredients = {
      {type="item", name="nullius-box-rutile", amount=7},
      {type="item", name="nullius-box-calcium", amount=4},
      {type="item", name="nullius-box-calcium-chloride", amount=2}
    },
    results = {
      {type="item", name="nullius-box-titanium-ingot", amount=5},
      {type="item", name="nullius-box-lime", amount=4},
      {type="fluid", name="nullius-chlorine", amount=25}
    },
    main_product = "nullius-box-titanium-ingot"
  },

  {
    type = "recipe",
    name = "nullius-titanium-plate",
    enabled = false,
    category = "machine-casting",
    energy_required = 5,
    ingredients = {
      {type="item", name="nullius-titanium-ingot", amount=4},
      {type="fluid", name="nullius-acid-nitric", amount=2}
    },
    results = {
      {type="item", name="nullius-titanium-plate", amount=3},
      {type="fluid", name="nullius-sludge", amount=1}
    },
    main_product = "nullius-titanium-plate"
  },
  {
    type = "recipe",
    name = "nullius-boxed-titanium-plate",
    enabled = false,
    category = "machine-casting",
    subgroup = "boxed-titanium",
    energy_required = 25,
    ingredients = {
      {type="item", name="nullius-box-titanium-ingot", amount=4},
      {type="fluid", name="nullius-acid-nitric", amount=10}
    },
    results = {
      {type="item", name="nullius-box-titanium-plate", amount=3},
      {type="fluid", name="nullius-sludge", amount=5}
    },
    main_product = "nullius-box-titanium-plate"
  },

  {
    type = "recipe",
    name = "nullius-titanium-rod",
    enabled = false,
    category = "machine-casting",
    energy_required = 6,
    ingredients = {
      {type="item", name="nullius-titanium-ingot", amount=4},
      {type="fluid", name="nullius-acid-nitric", amount=2}
    },
    results = {
      {type="item", name="nullius-titanium-rod", amount=5},
      {type="fluid", name="nullius-sludge", amount=1}
    },
    main_product = "nullius-titanium-rod"
  },
  {
    type = "recipe",
    name = "nullius-boxed-titanium-rod",
    enabled = false,
    category = "machine-casting",
    subgroup = "boxed-titanium",
    energy_required = 30,
    ingredients = {
      {type="item", name="nullius-box-titanium-ingot", amount=4},
      {type="fluid", name="nullius-acid-nitric", amount=10}
    },
    results = {
      {type="item", name="nullius-box-titanium-rod", amount=5},
      {type="fluid", name="nullius-sludge", amount=5}
    },
    main_product = "nullius-box-titanium-rod"
  },

  {
    type = "recipe",
    name = "nullius-titanium-sheet",
    enabled = false,
    category = "machine-casting",
    always_show_made_in = true,
    show_amount_in_title = false,
    always_show_products = true,
    energy_required = 6,
    ingredients = {
      {type="item", name="nullius-titanium-plate", amount=4},
      {type="fluid", name="nullius-lubricant", amount=1}
    },
    result = "nullius-titanium-sheet",
    result_count = 5
  },
  {
    type = "recipe",
    name = "nullius-boxed-titanium-sheet",
    enabled = false,
    category = "machine-casting",
    subgroup = "boxed-titanium",
    always_show_made_in = true,
    show_amount_in_title = false,
    always_show_products = true,
    energy_required = 30,
    ingredients = {
      {type="item", name="nullius-box-titanium-plate", amount=4},
      {type="fluid", name="nullius-lubricant", amount=5}
    },
    result = "nullius-box-titanium-sheet",
    result_count = 5
  },

  {
    type = "recipe",
    name = "nullius-robot-frame-1",
    enabled = false,
    show_amount_in_title = false,
    always_show_products = true,
    always_show_made_in = true,
    category = "tiny-crafting",
    energy_required = 12,
    ingredients = {
      {"nullius-standard-turbine-1", 1},
      {"nullius-capacitor", 2},
      {"turbo-filter-inserter", 2},
      {"constant-combinator", 2},
      {"programmable-speaker", 1},
      {"nullius-aluminum-sheet", 3}
    },
    result = "nullius-robot-frame-1",
    result_count = 2
  },
  {
    type = "recipe",
    name = "nullius-boxed-robot-frame-1",
    enabled = false,
    show_amount_in_title = false,
    always_show_products = true,
    always_show_made_in = true,
    category = "medium-only-assembly",
    subgroup = "boxed-hangar",
    order = "nullius-gb",
    energy_required = 60,
    ingredients = {
      {"nullius-box-standard-turbine-1", 1},
      {"nullius-box-capacitor", 2},
      {"nullius-box-filter-inserter-2", 2},
      {"nullius-box-memory-circuit", 2},
      {"nullius-box-antenna", 1},
      {"nullius-box-aluminum-sheet", 3}
    },
    result = "nullius-box-robot-frame-1",
    result_count = 2
  },
  {
    type = "recipe",
    name = "nullius-robot-frame-2",
    enabled = false,
    show_amount_in_title = false,
    always_show_products = true,
    always_show_made_in = true,
    category = "tiny-crafting",
    energy_required = 15,
    ingredients = {
      {"nullius-robot-frame-1", 1},
      {"nullius-standard-turbine-2", 1},
      {"nullius-battery-1", 2},
      {"nullius-sensor-1", 2},
      {"nullius-fiberglass", 5}
    },
    result = "nullius-robot-frame-2",
    result_count = 2
  },
  {
    type = "recipe",
    name = "nullius-boxed-robot-frame-2",
    enabled = false,
    show_amount_in_title = false,
    always_show_products = true,
    always_show_made_in = true,
    category = "medium-only-assembly",
    subgroup = "boxed-hangar",
    order = "nullius-gc",
    energy_required = 75,
    ingredients = {
      {"nullius-box-robot-frame-1", 1},
      {"nullius-box-standard-turbine-2", 1},
      {"nullius-box-battery-1", 3},
      {"nullius-box-sensor-1", 2},
      {"nullius-box-fiberglass", 5}
    },
    result = "nullius-box-robot-frame-2",
    result_count = 2
  },
  {
    type = "recipe",
    name = "nullius-robot-frame-3",
    enabled = false,
    show_amount_in_title = false,
    always_show_products = true,
    always_show_made_in = true,
    category = "tiny-crafting",
    energy_required = 20,
    ingredients = {
      {"nullius-robot-frame-2", 2},
      {"nullius-standard-turbine-3", 1},
      {"nullius-battery-2", 2},
      {"nullius-carbon-composite", 5},
      {"nullius-relay-3", 1},
      {"express-stack-filter-inserter", 3}
    },
    result = "nullius-robot-frame-3",
    result_count = 2
  },
  {
    type = "recipe",
    name = "nullius-boxed-robot-frame-3",
    enabled = false,
    show_amount_in_title = false,
    always_show_products = true,
    always_show_made_in = true,
    category = "medium-only-assembly",
    subgroup = "boxed-hangar",
    order = "nullius-gd",
    energy_required = 100,
    ingredients = {
      {"nullius-box-robot-frame-2", 2},
      {"nullius-box-standard-turbine-3", 1},
      {"nullius-box-battery-2", 2},
      {"nullius-box-carbon-composite", 5},
      {"nullius-box-relay-3", 1},
      {"express-stack-filter-inserter", 3}
    },
    result = "nullius-box-robot-frame-3",
    result_count = 2
  },
  {
    type = "recipe",
    name = "nullius-robot-frame-4",
    enabled = false,
    show_amount_in_title = false,
    always_show_products = true,
    always_show_made_in = true,
    category = "tiny-crafting",
    energy_required = 30,
    ingredients = {
      {"nullius-robot-frame-3", 1},
      {"nullius-titanium-sheet", 6},
      {"nullius-copper-wire", 4},
      {"nullius-night-vision-3", 1},
      {"nullius-levitation-field-2", 1},
      {"nullius-processor-3", 2}
    },
    result = "nullius-robot-frame-4"
  },
  {
    type = "recipe",
    name = "nullius-boxed-robot-frame-4",
    enabled = false,
    show_amount_in_title = false,
    always_show_products = true,
    always_show_made_in = true,
    category = "tiny-crafting",
    subgroup = "boxed-hangar",
    order = "nullius-ge",
    energy_required = 150,
    ingredients = {
      {"nullius-box-robot-frame-3", 1},
      {"nullius-box-titanium-sheet", 6},
      {"nullius-box-copper-wire", 4},
      {"nullius-night-vision-3", 5},
      {"nullius-levitation-field-2", 5},
      {"nullius-box-processor-3", 2}
    },
    result = "nullius-box-robot-frame-4"
  },

  {
    type = "recipe",
    name = "nullius-fiberglass",
    enabled = false,
    show_amount_in_title = false,
    always_show_products = true,
    category = "large-fluid-assembly",
    energy_required = 8,
    ingredients = {
      {type="item", name="nullius-glass-fiber", amount=2},
      {type="fluid", name="nullius-epoxy", amount=15, fluidbox_index=1}
    },
    result = "nullius-fiberglass",
    result_count = 5
  },
  {
    type = "recipe",
    name = "nullius-boxed-fiberglass",
    enabled = false,
    show_amount_in_title = false,
    always_show_products = true,
    category = "huge-fluid-assembly",
    subgroup = "boxed-glass",
    energy_required = 40,
    ingredients = {
      {type="item", name="nullius-box-glass-fiber", amount=2},
      {type="fluid", name="nullius-epoxy", amount=75, fluidbox_index=1}
    },
    result = "nullius-box-fiberglass",
    result_count = 5
  },

  {
    type = "recipe",
    name = "nullius-carbon-composite",
    enabled = false,
    show_amount_in_title = false,
    always_show_products = true,
    category = "machine-casting",
    energy_required = 6,
    ingredients = {
      {type="item", name="nullius-carbon-fiber", amount=2},
      {type="fluid", name="nullius-epoxy", amount=8}
    },
    result = "nullius-carbon-composite"
  },
  {
    type = "recipe",
    name = "nullius-boxed-carbon-composite",
    enabled = false,
    show_amount_in_title = false,
    always_show_products = true,
    category = "machine-casting",
    subgroup = "boxed-organic-2",
    order = "nullius-i",
    energy_required = 30,
    ingredients = {
      {type="item", name="nullius-box-carbon-fiber", amount=2},
      {type="fluid", name="nullius-epoxy", amount=40}
    },
    result = "nullius-box-carbon-composite"
  },

  {
    type = "recipe",
    name = "nullius-graphene",
    enabled = false,
    category = "nanotechnology",
    energy_required = 24,
    ingredients = {
      {type="item", name="nullius-graphite", amount=3},
      {type="item", name="nullius-monocrystalline-silicon", amount=2},
      {type="fluid", name="nullius-acid-nitric", amount=10, fluidbox_index=1},
      {type="fluid", name="nullius-compressed-argon", amount=3, fluidbox_index=2}
    },
    results = {
      {type="item", name="nullius-graphene", amount=1},
      {type="item", name="nullius-silica", amount=2},
      {type="fluid", name="nullius-wastewater", amount=12}
    },
    main_product = "nullius-graphene"
  },
  {
    type = "recipe",
    name = "nullius-boxed-graphene",
    enabled = false,
    category = "nanotechnology",
    subgroup = "boxed-organic-2",
    order = "nullius-j",
    energy_required = 120,
    ingredients = {
      {type="item", name="nullius-box-graphite", amount=3},
      {type="item", name="nullius-box-monocrystalline-silicon", amount=2},
      {type="fluid", name="nullius-acid-nitric", amount=50, fluidbox_index=1},
      {type="fluid", name="nullius-compressed-argon", amount=15, fluidbox_index=2},
    },
    results = {
      {type="item", name="nullius-box-graphene", amount=1},
      {type="item", name="nullius-box-silica", amount=2},
      {type="fluid", name="nullius-wastewater", amount=60}
    },
    main_product = "nullius-box-graphene"
  },

  {
    type = "recipe",
    name = "nullius-insulation",
    enabled = false,
    show_amount_in_title = false,
    always_show_products = true,
    category = "medium-assembly",
    energy_required = 4,
    ingredients = {
      {"nullius-gypsum", 3},
      {"nullius-glass-fiber", 2},
      {"nullius-plastic", 2},
      {"nullius-textile", 1}
    },
    result = "nullius-insulation",
    result_count = 2
  },
  {
    type = "recipe",
    name = "nullius-boxed-insulation",
    enabled = false,
    show_amount_in_title = false,
    always_show_products = true,
    category = "huge-assembly",
    subgroup = "boxed-glass",
    energy_required = 20,
    ingredients = {
      {"nullius-box-gypsum", 3},
      {"nullius-box-glass-fiber", 2},
      {"nullius-box-plastic", 2},
      {"nullius-box-textile", 1}
    },
    result = "nullius-box-insulation",
    result_count = 2
  },

  {
    type = "recipe",
    name = "nullius-processor-1",
    enabled = false,
    category = "nanotechnology",
    energy_required = 6,
    ingredients = {
      {type="item", name="nullius-fiberglass", amount=1},
      {type="item", name="nullius-monocrystalline-silicon", amount=2},
      {type="item", name="nullius-ceramic-powder", amount=1},
      {type="item", name="constant-combinator", amount=3},
      {type="item", name="green-wire", amount=2},
      {type="fluid", name="nullius-acid-nitric", amount=3, fluidbox_index=2},
      {type="fluid", name="nullius-argon", amount=2, fluidbox_index=3}
    },
    result = "nullius-processor-1"
  },
  {
    type = "recipe",
    name = "nullius-boxed-processor-1",
    enabled = false,
    category = "nanotechnology",
    subgroup = "boxed-electrical",
    energy_required = 30,
    ingredients = {
      {type="item", name="nullius-box-fiberglass", amount=1},
      {type="item", name="nullius-box-monocrystalline-silicon", amount=2},
      {type="item", name="nullius-box-ceramic-powder", amount=1},
      {type="item", name="nullius-box-memory-circuit", amount=3},
      {type="item", name="nullius-box-green-wire", amount=2},
      {type="fluid", name="nullius-acid-nitric", amount=15, fluidbox_index=2},
      {type="fluid", name="nullius-argon", amount=10, fluidbox_index=3}
    },
    result = "nullius-box-processor-1"
  },
  {
    type = "recipe",
    name = "nullius-processor-2",
    enabled = false,
    category = "nanotechnology",
    energy_required = 15,
    ingredients = {
      {type="item", name="nullius-processor-1", amount=2},
      {type="item", name="arithmetic-combinator", amount=3},
      {type="item", name="nullius-battery-1", amount=1},
      {type="item", name="nullius-heat-pipe-2", amount=1},
      {type="item", name="nullius-graphene", amount=1},
      {type="fluid", name="nullius-acid-sulfuric", amount=4, fluidbox_index=2},
      {type="fluid", name="nullius-helium", amount=8, fluidbox_index=3}
    },
    result = "nullius-processor-2"
  },
  {
    type = "recipe",
    name = "nullius-boxed-processor-2",
    enabled = false,
    category = "nanotechnology",
    subgroup = "boxed-electrical",
    energy_required = 75,
    ingredients = {
      {type="item", name="nullius-box-processor-1", amount=2},
      {type="item", name="nullius-box-arithmetic-circuit", amount=3},
      {type="item", name="nullius-box-battery-1", amount=1},
      {type="item", name="nullius-box-heat-pipe-2", amount=1},
      {type="item", name="nullius-box-graphene", amount=1},
      {type="fluid", name="nullius-acid-sulfuric", amount=20, fluidbox_index=2},
      {type="fluid", name="nullius-helium", amount=40, fluidbox_index=3}
    },
    result = "nullius-box-processor-2"
  },

  {
    type = "recipe",
    name = "nullius-processor-3",
    enabled = false,
    category = "nanotechnology",
    energy_required = 25,
    ingredients = {
      {type="item", name="nullius-processor-2", amount=2},
      {type="item", name="nullius-sensor-2", amount=1},
      {type="item", name="nullius-copper-wire", amount=4},
      {type="item", name="nullius-copper-sheet", amount=1},
      {type="item", name="nullius-monocrystalline-silicon", amount=3},
      {type="item", name="nullius-heat-pipe-3", amount=1},
      {type="fluid", name="nullius-helium", amount=8, fluidbox_index=2},
      {type="fluid", name="nullius-compressed-oxygen", amount=10, fluidbox_index=3}
    },
    result = "nullius-processor-3"
  },
  {
    type = "recipe",
    name = "nullius-boxed-processor-3",
    enabled = false,
    category = "nanotechnology",
    subgroup = "boxed-electrical",
    energy_required = 125,
    ingredients = {
      {type="item", name="nullius-box-processor-2", amount=2},
      {type="item", name="nullius-box-sensor-2", amount=1},
      {type="item", name="nullius-box-copper-wire", amount=4},
      {type="item", name="nullius-box-copper-sheet", amount=1},
      {type="item", name="nullius-box-monocrystalline-silicon", amount=3},
      {type="item", name="nullius-box-heat-pipe-3", amount=1},
      {type="fluid", name="nullius-helium", amount=40, fluidbox_index=2},
      {type="fluid", name="nullius-compressed-oxygen", amount=50, fluidbox_index=3}
    },
    result = "nullius-box-processor-3"
  },
  {
    type = "recipe",
    name = "nullius-transformer",
    enabled = false,
    always_show_made_in = true,
    category = "medium-crafting",
    energy_required = 4,
    ingredients = {
      {type="item", name="nullius-iron-plate", amount=2},
      {type="item", name="nullius-heat-pipe-1", amount=1},
      {type="item", name="copper-cable", amount=3},
      {type="item", name="nullius-plastic", amount=1}
    },
    result = "nullius-transformer"
  },
  {
    type = "recipe",
    name = "nullius-boxed-transformer",
    enabled = false,
    always_show_made_in = true,
    category = "large-assembly",
    subgroup = "boxed-electrical",
    energy_required = 20,
    ingredients = {
      {type="item", name="nullius-box-iron-plate", amount=2},
      {type="item", name="nullius-box-heat-pipe-1", amount=1},
      {type="item", name="nullius-box-insulated-wire", amount=3},
      {type="item", name="nullius-box-plastic", amount=1}
    },
    result = "nullius-box-transformer"
  },

  {
    type = "recipe",
    name = "nullius-crushed-uranium-ore",
    enabled = false,
    category = "ore-crushing",
    energy_required = 12,
    ingredients = {
        {"uranium-ore", 5}
    },
    results = {
      {type="item", name="nullius-crushed-uranium-ore", amount=2},
      {type="item", name="nullius-mineral-dust", amount=3}
    },
    main_product = "nullius-crushed-uranium-ore"
  },
  {
    type = "recipe",
    name = "nullius-yellowcake",
    enabled = false,
    icon_size = 32,
    category = "ore-flotation",
    energy_required = 4,
    ingredients = {
      {type="item", name="nullius-crushed-uranium-ore", amount=2},
      {type="fluid", name="nullius-acid-sulfuric", amount=25, fluidbox_index=1}
    },
    results = {
      {type="item", name="nullius-yellowcake", amount=1},
      {type="fluid", name="nullius-sludge", amount=10, fluidbox_index=1}
    },
    main_product = "nullius-yellowcake"
  },

  {
    type = "recipe",
    name = "nullius-uranium",
    enabled = false,
    category = "vent-smelting",
    energy_required = 16,
    ingredients = {
      {"nullius-yellowcake", 5},
      {"nullius-soda-ash", 2}
    },
    results = {
      {type="item", name="nullius-uranium", amount=3},
      {type="item", name="nullius-gravel", amount=2},
      {type="fluid", name="nullius-sulfur-dioxide", amount=8}
    },
    main_product = "nullius-uranium"
  },

  {
    type = "recipe",
    name = "nullius-enriched-uranium",
    enabled = false,
    category = "nanotechnology",
    energy_required = 20,
    ingredients = {
      {type="item", name="nullius-uranium", amount=4},
      {type="fluid", name="nullius-tritium", amount=2, fluidbox_index=1}
    },
    results = {
      {type="item", name="nullius-enriched-uranium", amount=1},
      {type="item", name="nullius-mineral-dust", amount=4},
      {type="fluid", name="nullius-deuterium", amount=2, fluidbox_index=1}
    },
    main_product = "nullius-enriched-uranium"
  },

  {
    type = "recipe",
    name = "nullius-fission-cell",
    enabled = false,
    show_amount_in_title = false,
    always_show_products = true,
    category = "machine-casting",
    energy_required = 6,
    ingredients = {
      {type="item", name="nullius-steel-sheet", amount=3},
      {type="item", name="nullius-uranium", amount=5},
      {type="item", name="nullius-enriched-uranium", amount=1}
    },
    result = "nullius-fission-cell"
  },
  {
    type = "recipe",
    name = "nullius-fission-recycling",
    icon = "__base__/graphics/icons/used-up-uranium-fuel-cell.png",
    icon_size = 64,
    icon_mipmaps = 4,
    enabled = false,
    show_amount_in_title = false,
    always_show_products = true,
    category = "ore-flotation",
    subgroup = "nuclear",
    order = "nullius-ec",
    energy_required = 4,
    ingredients = {
      {type="item", name="nullius-spent-fission-cell", amount=1},
      {type="fluid", name="nullius-acid-sulfuric", amount=50},
      {type="fluid", name="nullius-caustic-solution", amount=40}
    },
    results = {
      {type="item", name="nullius-iron-oxide", amount=1},
      {type="item", name="nullius-yellowcake", amount=3},
      {type="fluid", name="nullius-wastewater", amount=80, fluidbox_index=1}
    }
  },


  {
    type = "recipe",
    name = "nullius-antimatter-trap",
    enabled = false,
    always_show_made_in = true,
    category = "tiny-crafting",
    energy_required = 20,
    ingredients = {
      {type="item", name="nullius-fission-cell", amount=1},
      {type="item", name="nullius-breeder-cell", amount=2},
      {type="item", name="nullius-box-copper-wire", amount=1},
      {type="item", name="nullius-processor-3", amount=1},
      {type="item", name="nullius-sensor-2", amount=1},
      {type="item", name="nullius-battery-2", amount=2}
    },
    result = "nullius-antimatter-trap"
  },

})
=================================================================================================

data:extend({
  {
    type = "recipe",
    name = "nullius-climatology-pack-1",
    localised_name = {"recipe-name.nullius-climatology-pack-1"},
    show_amount_in_title = false,
    always_show_products = true,
    enabled = false,
    category = "nullius-water-treatment",
    energy_required = 25,
    ingredients = {
      {type="fluid", name="nullius-air", amount=3000},
      {type="fluid", name="nullius-seawater", amount=2000}
    },
    result = "nullius-climatology-pack"
  },
  {
    type = "recipe",
    name = "nullius-climatology-pack-2",
    localised_name = {"recipe-name.nullius-climatology-pack-2"},
    show_amount_in_title = false,
    always_show_products = true,
    enabled = false,
    category = "basic-chemistry",
    crafting_machine_tint = {
      primary = data.raw.fluid["nullius-wastewater"].flow_color,
      secondary = data.raw.fluid["nullius-nitrogen"].flow_color
    },
    energy_required = 6,
    ingredients = {
      {type="fluid", name="nullius-nitrogen", amount=80},
      {type="fluid", name="nullius-wastewater", amount=40},
      {type="fluid", name="nullius-volcanic-gas", amount=2}
    },
    result = "nullius-climatology-pack"
  },
  {
    type = "recipe",
    name = "nullius-boxed-climatology-pack",
    show_amount_in_title = false,
    always_show_products = true,
    enabled = false,
    category = "basic-chemistry",
    subgroup = "boxed-science",
    crafting_machine_tint = {
      primary = data.raw.fluid["nullius-wastewater"].flow_color,
      secondary = data.raw.fluid["nullius-nitrogen"].flow_color
    },
    energy_required = 30,
    ingredients = {
      {type="fluid", name="nullius-nitrogen", amount=400},
      {type="fluid", name="nullius-wastewater", amount=200},
      {type="fluid", name="nullius-volcanic-gas", amount=10}
    },
    result = "nullius-box-climatology-pack"
  },

  {
    type = "recipe",
    name = "nullius-chemical-pack",
    enabled = false,
    category = "basic-chemistry",
    show_amount_in_title = false,
    always_show_products = true,
    crafting_machine_tint = {
      primary = data.raw.fluid["nullius-ammonia"].flow_color,
      secondary = data.raw.fluid["nullius-acid-sulfuric"].flow_color
    },
    energy_required = 25,
    ingredients = {
      {type="item", name="nullius-glass", amount=3},
      {type="item", name="concrete", amount=6},
      {type="item", name="nullius-ammonia-barrel", amount=1},
      {type="item", name="nullius-sodium-hydroxide", amount=2},
      {type="fluid", name="nullius-acid-sulfuric", amount=18},
      {type="fluid", name="nullius-lubricant", amount=5}
    },
    result = "nullius-chemical-pack",
    result_count = 2
  },
  {
    type = "recipe",
    name = "nullius-boxed-chemical-pack",
    enabled = false,
    show_amount_in_title = false,
    always_show_products = true,
    category = "basic-chemistry",
    subgroup = "boxed-science",
    crafting_machine_tint = {
      primary = data.raw.fluid["nullius-ammonia"].flow_color,
      secondary = data.raw.fluid["nullius-acid-sulfuric"].flow_color
    },
    energy_required = 125,
    ingredients = {
      {type="item", name="nullius-box-glass", amount=3},
      {type="item", name="nullius-box-concrete", amount=6},
      {type="item", name="nullius-ammonia-barrel", amount=5},
      {type="item", name="nullius-box-sodium-hydroxide", amount=2},
      {type="fluid", name="nullius-acid-sulfuric", amount=90},
      {type="fluid", name="nullius-lubricant", amount=25}
    },
    result = "nullius-box-chemical-pack",
    result_count = 2
  },

  {
    type = "recipe",
    name = "nullius-caustic-solution",
    enabled = false,
    category = "nullius-water-treatment",
    subgroup = "inorganic-chemistry",
    order = "nullius-eb",
    show_amount_in_title = false,
    always_show_products = true,
    energy_required = 1,
    ingredients = {
      {type="fluid", name="nullius-water", amount=80},
      {type="item", name="nullius-sodium-hydroxide", amount=3}
    },
    results = {
      {type="fluid", name="nullius-caustic-solution", amount=100}
    },
    main_product = "nullius-caustic-solution"
  },
  {
    type = "recipe",
    name = "nullius-boxed-caustic-solution",
    localised_name = {"recipe-name.nullius-boxed", {"fluid-name.nullius-caustic-solution"}},
    enabled = false,
    category = "nullius-water-treatment",
    subgroup = "boxed-fluid",
    order = "nullius-cb",
    show_amount_in_title = false,
    always_show_products = true,
    energy_required = 5,
    ingredients = {
      {type="fluid", name="nullius-water", amount=400},
      {type="item", name="nullius-box-sodium-hydroxide", amount=3}
    },
    results = {
      {type="fluid", name="nullius-caustic-solution", amount=500}
    }
  },

  {
    type = "recipe",
    name = "nullius-hydrogen-chloride",
    enabled = false,
    category = "basic-chemistry",
    subgroup = "inorganic-chemistry",
    order = "nullius-b",
    crafting_machine_tint = {
      primary = data.raw.fluid["nullius-hydrogen"].flow_color,
      secondary = data.raw.fluid["nullius-chlorine"].flow_color
    },
    show_amount_in_title = false,
    always_show_products = true,
    energy_required = 1,
    no_productivity = true,
    ingredients = {
      {type="fluid", name="nullius-hydrogen", amount=30},
      {type="fluid", name="nullius-chlorine", amount=30}
    },
    results = {
      {type="fluid", name="nullius-hydrogen-chloride", amount=60}
    },
    main_product = "nullius-hydrogen-chloride"
  },
  {
    type = "recipe",
    name = "nullius-hydrogen-chloride-electrolysis",
    icons = angelsmods.functions.create_gas_recipe_icon(
        {{"__angelspetrochem__/graphics/icons/molecules/hydrogen.png", 72},
        {"__angelspetrochem__/graphics/icons/molecules/chlorine.png", 72}},
      {element_tint["hydrogen"], element_tint["chlorine"], element_tint["chlorine"]},
      nil
    ),
    enabled = false,
    category = "nullius-electrolysis",
    subgroup = "inorganic-chemistry",
    order = "nullius-c",
    crafting_machine_tint = {
      primary = data.raw.fluid["nullius-hydrogen"].flow_color,
      secondary = data.raw.fluid["nullius-chlorine"].flow_color
    },
    energy_required = 1,
    no_productivity = true,
    ingredients = {
      {type="fluid", name="nullius-hydrogen-chloride", amount=240}
    },
    results = {
      {type="fluid", name="nullius-hydrogen", amount=120, fluidbox_index=1},
      {type="fluid", name="nullius-chlorine", amount=120, fluidbox_index=3}
    }
  },
  {
    type = "recipe",
    name = "nullius-acid-hydrochloric",
    enabled = false,
    category = "basic-chemistry",
    subgroup = "inorganic-chemistry",
    order = "nullius-d",
    crafting_machine_tint = {
      primary = data.raw.fluid["nullius-hydrogen-chloride"].flow_color,
      secondary = data.raw.fluid["nullius-acid-hydrochloric"].flow_color
    },
    show_amount_in_title = false,
    always_show_products = true,
    energy_required = 1,
    ingredients = {
      {type="fluid", name="nullius-hydrogen-chloride", amount=35},
      {type="fluid", name="nullius-water", amount=40}
    },
    results = {
      {type="fluid", name="nullius-acid-hydrochloric", amount=40}
    },
    main_product = "nullius-acid-hydrochloric"
  },
  {
    type = "recipe",
    name = "nullius-hydrochloric-neutralization",
    localised_name = {"recipe-name.nullius-hydrochloric-neutralization"},
    show_amount_in_title = false,
    always_show_products = true,
    enabled = false,
    category = "nullius-water-treatment",
    subgroup = "inorganic-chemistry",
    order = "nullius-ec",
    energy_required = 1,
    no_productivity = true,
    ingredients = {
      {type="fluid", name="nullius-acid-hydrochloric", amount=100},
      {type="fluid", name="nullius-caustic-solution", amount=100}
    },
    results = {
      {type="fluid", name="nullius-saline", amount=120}
    },
    main_product = "nullius-saline"
  },
  {
    type = "recipe",
    name = "nullius-acid-sulfuric",
    enabled = false,
    category = "basic-chemistry",
    subgroup = "inorganic-chemistry",
    order = "nullius-g",
    crafting_machine_tint = {
      primary = data.raw.fluid["nullius-sulfur-dioxide"].flow_color,
      secondary = data.raw.fluid["nullius-oxygen"].flow_color
    },
    show_amount_in_title = false,
    always_show_products = true,
    energy_required = 1,
    ingredients = {
      {type="fluid", name="nullius-sulfur-dioxide", amount=8},
      {type="fluid", name="nullius-water", amount=16},
      {type="fluid", name="nullius-oxygen", amount=4}
    },
    results = {
      {type="fluid", name="nullius-acid-sulfuric", amount=20}
    },
    main_product = "nullius-acid-sulfuric"
  },
  {
    type = "recipe",
    name = "nullius-ammonia",
    enabled = false,
    category = "basic-chemistry",
    subgroup = "inorganic-chemistry",
    order = "nullius-h",
    crafting_machine_tint = {
      primary = data.raw.fluid["nullius-compressed-hydrogen"].flow_color,
      secondary = data.raw.fluid["nullius-compressed-nitrogen"].flow_color
    },
    show_amount_in_title = false,
    always_show_products = true,
    energy_required = 1,
    ingredients = {
      {type="fluid", name="nullius-compressed-hydrogen", amount=6},
      {type="fluid", name="nullius-compressed-nitrogen", amount=2}
    },
    results = {
      {type="fluid", name="nullius-ammonia", amount=15}
    },
    main_product = "nullius-ammonia"
  },
  {
    type = "recipe",
    name = "nullius-acid-nitric",
    enabled = false,
    category = "basic-chemistry",
    subgroup = "inorganic-chemistry",
    order = "nullius-i",
    crafting_machine_tint = {
      primary = data.raw.fluid["nullius-ammonia"].flow_color,
      secondary = data.raw.fluid["nullius-oxygen"].flow_color
    },
    show_amount_in_title = false,
    always_show_products = true,
    energy_required = 1,
    ingredients = {
      {type="fluid", name="nullius-oxygen", amount=20},
      {type="fluid", name="nullius-ammonia", amount=10}
    },
    results = {
      {type="fluid", name="nullius-acid-nitric", amount=5}
    },
    main_product = "nullius-acid-nitric"
  },
  {
    type = "recipe",
    name = "nullius-soda-ash-1",
    localised_name = {"recipe-name.nullius-soda-ash-1"},
    enabled = false,
    category = "basic-chemistry",
    order = "nullius-fb",
    crafting_machine_tint = {
      primary = data.raw.fluid["nullius-carbon-dioxide"].flow_color,
      secondary = data.raw.fluid["nullius-brine"].flow_color
    },
    energy_required = 8,
    ingredients = {
      {type="fluid", name="nullius-carbon-dioxide", amount=80},
      {type="fluid", name="nullius-brine", amount=30},
      {type="fluid", name="nullius-ammonia", amount=8}
    },
    results = {
      {type="item", name="nullius-soda-ash", amount=1},
      {type="fluid", name="nullius-hydrogen-chloride", amount=15}
    },
    main_product = "nullius-soda-ash"
  },
  {
    type = "recipe",
    name = "nullius-soda-ash-2",
    localised_name = {"recipe-name.nullius-soda-ash-2"},
    enabled = false,
    category = "distillation",
    order = "nullius-fc",
    crafting_machine_tint = {
      primary = data.raw.fluid["nullius-sulfur-dioxide"].flow_color },
    energy_required = 2,
    ingredients = {
      {type="item", name="nullius-sodium-sulfate", amount=4},
      {type="item", name="nullius-graphite", amount=3},
      {type="item", name="nullius-crushed-limestone", amount=4},
      {type="fluid", name="nullius-acid-hydrochloric", amount=80},
      {type="fluid", name="nullius-oxygen", amount=50}
    },
    results = {
      {type="item", name="nullius-soda-ash", amount=7},
      {type="fluid", name="nullius-calcium-chloride-solution", amount=60},
      {type="fluid", name="nullius-carbon-dioxide", amount=80},
      {type="fluid", name="nullius-sulfur-dioxide", amount=10}
    },
    main_product = "nullius-soda-ash"
  },
  {
    type = "recipe",
    name = "nullius-boxed-soda-ash",
    enabled = false,
    category = "distillation",
    subgroup = "boxed-sodium",
    order = "nullius-f",
    crafting_machine_tint = {
      primary = data.raw.fluid["nullius-sulfur-dioxide"].flow_color },
    energy_required = 15,
    ingredients = {
      {type="item", name="nullius-box-sodium-sulfate", amount=4},
      {type="item", name="nullius-box-graphite", amount=3},
      {type="item", name="nullius-box-crushed-limestone", amount=4},
      {type="fluid", name="nullius-acid-hydrochloric", amount=400},
      {type="fluid", name="nullius-oxygen", amount=250}
    },
    results = {
      {type="item", name="nullius-box-soda-ash", amount=7},
      {type="fluid", name="nullius-calcium-chloride-solution", amount=300},
      {type="fluid", name="nullius-carbon-dioxide", amount=400},
      {type="fluid", name="nullius-sulfur-dioxide", amount=50}
    },
    main_product = "nullius-box-soda-ash"
  },

  {
    type = "recipe",
    name = "nullius-sodium-sulfate-1",
    localised_name = {"recipe-name.nullius-sodium-sulfate-1"},
    enabled = false,
    category = "basic-chemistry",
    order = "nullius-eb",
    crafting_machine_tint = {
      primary = data.raw.fluid["nullius-acid-sulfuric"].flow_color,
      secondary = data.raw.fluid["nullius-hydrogen-chloride"].flow_color
    },
    energy_required = 1,
    ingredients = {
      {type="fluid", name="nullius-acid-sulfuric", amount=10, fluidbox_index=1},
      {type="item", name="nullius-salt", amount=2}
    },
    results = {
      {type="item", name="nullius-sodium-sulfate", amount=1},
      {type="fluid", name="nullius-acid-hydrochloric", amount=8}
    },
    main_product = "nullius-sodium-sulfate"
  },
  {
    type = "recipe",
    name = "nullius-boxed-sodium-sulfate-1",
    localised_name = {"", {"item-name.nullius-box", {"item-name.nullius-sodium-sulfate"}}, " ", 1},
    enabled = false,
    category = "basic-chemistry",
    subgroup = "boxed-sodium",
    order = "nullius-eb",
    crafting_machine_tint = {
      primary = data.raw.fluid["nullius-acid-sulfuric"].flow_color,
      secondary = data.raw.fluid["nullius-hydrogen-chloride"].flow_color
    },
    energy_required = 5,
    ingredients = {
      {type="fluid", name="nullius-acid-sulfuric", amount=50, fluidbox_index=1},
      {type="item", name="nullius-box-salt", amount=2}
    },
    results = {
      {type="item", name="nullius-box-sodium-sulfate", amount=1},
      {type="fluid", name="nullius-acid-hydrochloric", amount=40}
    },
    main_product = "nullius-box-sodium-sulfate"
  },
  {
    type = "recipe",
    name = "nullius-sodium-sulfate-2",
    localised_name = {"recipe-name.nullius-sodium-sulfate-2"},
    enabled = false,
    category = "basic-chemistry",
    order = "nullius-ec",
    crafting_machine_tint = {
      primary = data.raw.fluid["nullius-acid-sulfuric"].flow_color,
      secondary = data.raw.fluid["nullius-caustic-solution"].flow_color
    },
    energy_required = 1,
    ingredients = {
      {type="fluid", name="nullius-acid-sulfuric", amount=20, fluidbox_index=1},
      {type="item", name="nullius-sodium-hydroxide", amount=5}
    },
    results = {
      {type="item", name="nullius-sodium-sulfate", amount=2},
      {type="fluid", name="nullius-wastewater", amount=15}
    },
    main_product = "nullius-sodium-sulfate"
  },
  {
    type = "recipe",
    name = "nullius-boxed-sodium-sulfate-2",
    localised_name = {"", {"item-name.nullius-box", {"item-name.nullius-sodium-sulfate"}}, " ", 2},
    enabled = false,
    category = "basic-chemistry",
    subgroup = "boxed-sodium",
    order = "nullius-ec",
    crafting_machine_tint = {
      primary = data.raw.fluid["nullius-acid-sulfuric"].flow_color,
      secondary = data.raw.fluid["nullius-caustic-solution"].flow_color
    },
    energy_required = 5,
    ingredients = {
      {type="fluid", name="nullius-acid-sulfuric", amount=100, fluidbox_index=1},
      {type="item", name="nullius-box-sodium-hydroxide", amount=5}
    },
    results = {
      {type="item", name="nullius-box-sodium-sulfate", amount=2},
      {type="fluid", name="nullius-wastewater", amount=75}
    },
    main_product = "nullius-box-sodium-sulfate"
  },

  {
    type = "recipe",
    name = "nullius-air-filtration",
    enabled = false,
    hide_from_player_crafting = true,
    category = "air-filtration",
    subgroup = "air-filtration",
    order = "nullius-bb",
    energy_required = 1,
    ingredients = {
        {name="none-recipe", amount=0}
    },
    results = {
      {type="fluid", name="nullius-air", amount=50},
    },
    main_product = "nullius-air"
  },
  {
    type = "recipe",
    name = "nullius-freshwater",
    enabled = false,
    hide_from_player_crafting = true,
    category = "water-pumping",
    subgroup = "nullius-water-treatment",
    energy_required = 1,
    ingredients = {
        {name="none-recipe", amount=0}
    },
    results = {
      {type="fluid", name="nullius-freshwater", amount=125},
    },
    main_product = "nullius-freshwater"
  },
  {
    type = "recipe",
    name = "nullius-seawater-filtration",
    localised_name = {"recipe-name.nullius-seawater-filtration"},
    order = "nullius-b",
    enabled = false,
    category = "nullius-water-treatment",
    subgroup = "nullius-water-treatment",
    energy_required = 1,
    ingredients = {
      {type="fluid", name="nullius-seawater", amount=100}
    },
    results = {
      {type="fluid", name="nullius-saline", amount=70},
      {type="fluid", name="nullius-wastewater", amount=20},
    },
    main_product = "nullius-saline"
  },
  {
    type = "recipe",
    name = "nullius-freshwater-filtration",
    localised_name = {"recipe-name.nullius-freshwater-filtration"},
    order = "nullius-c",
    enabled = false,
    category = "nullius-water-treatment",
    subgroup = "nullius-water-treatment",
    energy_required = 1,
    ingredients = {
      {type="fluid", name="nullius-freshwater", amount=200}
    },
    results = {
      {type="fluid", name="nullius-water", amount=170},
      {type="fluid", name="nullius-wastewater", amount=20},
    },
    main_product = "nullius-water"
  },
  {
    type = "recipe",
    name = "nullius-wastewater-filtration",
    localised_name = {"recipe-name.nullius-wastewater-filtration"},
    enabled = false,
    category = "nullius-water-treatment",
    subgroup = "waste-management",
    order = "nullius-db",
    energy_required = 1,
    ingredients = {
      {type="fluid", name="nullius-wastewater", amount=200}
    },
    results = {
      {type="fluid", name="nullius-saline", amount=150},
      {type="fluid", name="nullius-sludge", amount=25}
    }
  },
  {
    type = "recipe",
    name = "nullius-heavy-water",
    enabled = false,
    category = "distillation",
    subgroup = "waste-management",
    order = "nullius-dc",
    energy_required = 5,
    ingredients = {
      {type="fluid", name="nullius-wastewater", amount=750}
    },
    results = {
      {type="fluid", name="nullius-saline", amount=500},
      {type="fluid", name="nullius-heavy-water", amount=1},
      {type="fluid", name="nullius-sludge", amount=75}
    },
    main_product = "nullius-heavy-water"
  },
  {
    type = "recipe",
    name = "nullius-desalination",
    localised_name = {"", {"recipe-name.nullius-desalination"}, " ", 1},
    enabled = false,
    category = "distillation",
    subgroup = "nullius-water-treatment",
    order = "nullius-ebb",
    crafting_machine_tint = { primary = data.raw.fluid["nullius-saline"].flow_color },
    energy_required = 1,
    ingredients = {
      {type="fluid", name="nullius-saline", amount=125}
    },
    results = {
      {type="fluid", name="nullius-water", amount=90},
      {type="fluid", name="nullius-brine", amount=30}
    }
  },
  {
    type = "recipe",
    name = "nullius-desalination-2",
    localised_name = {"", {"recipe-name.nullius-desalination"}, " ", 2},
    enabled = false,
    category = "distillation",
    subgroup = "nullius-water-treatment",
    order = "nullius-ebc",
    crafting_machine_tint = { primary = data.raw.fluid["nullius-seawater"].flow_color },
    energy_required = 1,
    ingredients = {
      {type="fluid", name="nullius-seawater", amount=250},
      {type="fluid", name="nullius-steam", amount=50}
    },
    results = {
      {type="fluid", name="nullius-water", amount=125},
      {type="fluid", name="nullius-wastewater", amount=75},
      {type="fluid", name="nullius-brine", amount=60}
    }
  },

  {
    type = "recipe",
    name = "nullius-saline-electrolysis",
    enabled = false,
    category = "nullius-electrolysis",
    subgroup = "nullius-water-treatment",
    order = "nullius-i",
    energy_required = 1,
    ingredients = {
      {type="fluid", name="nullius-saline", amount=40}
    },
    results = {
      {type="fluid", name="nullius-hydrogen", amount=110, fluidbox_index=1},
      {type="fluid", name="nullius-oxygen", amount=45, fluidbox_index=3},
      {type="fluid", name="nullius-chlorine", amount=14, fluidbox_index=2},
      {type="item", name="nullius-sodium-hydroxide", amount=1},
    }
  },
  {
    type = "recipe",
    name = "nullius-water-electrolysis",
    enabled = false,
    category = "nullius-electrolysis",
    subgroup = "nullius-water-treatment",
    order = "nullius-hb",
    energy_required = 1,
    ingredients = {
      {type="fluid", name="nullius-water", amount=45}
    },
    results = {
      {type="fluid", name="nullius-hydrogen", amount=140, fluidbox_index=1},
      {type="fluid", name="nullius-oxygen", amount=70, fluidbox_index=3}
    }
  },
  {
    type = "recipe",
    name = "nullius-pressure-water-electrolysis",
    enabled = false,
    category = "nullius-electrolysis",
    subgroup = "nullius-water-treatment",
    order = "nullius-hc",
    energy_required = 1,
    ingredients = {
      {type="fluid", name="nullius-water", amount=40}
    },
    results = {
      {type="fluid", name="nullius-compressed-hydrogen", amount=32, fluidbox_index=1},
      {type="fluid", name="nullius-compressed-oxygen", amount=16, fluidbox_index=3}
    }
  },
  {
    type = "recipe",
    name = "nullius-brine-electrolysis",
    enabled = false,
    category = "nullius-electrolysis",
    subgroup = "nullius-water-treatment",
    order = "nullius-j",
    energy_required = 1,
    ingredients = {
      {type="fluid", name="nullius-brine", amount=30}
    },
    results = {
      {type="fluid", name="nullius-hydrogen", amount=42, fluidbox_index=1},
      {type="fluid", name="nullius-chlorine", amount=42, fluidbox_index=3},
      {type="item", name="nullius-sodium-hydroxide", amount=3},
    }
  },
  {
    type = "recipe",
    name = "nullius-boxed-brine-electrolysis",
    localised_name = {"recipe-name.nullius-boxed", {"recipe-name.nullius-brine-electrolysis"}},
    enabled = false,
    category = "nullius-electrolysis",
    subgroup = "boxed-sodium",
    order = "nullius-cb",
    energy_required = 5,
    ingredients = {
      {type="fluid", name="nullius-brine", amount=150}
    },
    results = {
      {type="fluid", name="nullius-hydrogen", amount=210, fluidbox_index=1},
      {type="fluid", name="nullius-chlorine", amount=210, fluidbox_index=3},
      {type="item", name="nullius-box-sodium-hydroxide", amount=3},
    },
    main_product = "nullius-box-sodium-hydroxide"
  },
  {
    type = "recipe",
    name = "nullius-deuterium",
    enabled = false,
    category = "nullius-electrolysis",
    subgroup = "nullius-water-treatment",
    order = "nullius-k",
    energy_required = 10,
    ingredients = {
      {type="fluid", name="nullius-heavy-water", amount=40}
    },
    results = {
      {type="fluid", name="nullius-deuterium", amount=80},
      {type="fluid", name="nullius-oxygen", amount=80},
      {type="fluid", name="nullius-tritium", amount=1}
    },
    main_product = "nullius-deuterium"
  },
  {
    type = "recipe",
    name = "nullius-salt",
    enabled = false,
    category = "distillation",
    crafting_machine_tint = { primary = data.raw.fluid["nullius-brine"].flow_color },
    energy_required = 1,
    ingredients = {
      {type="fluid", name="nullius-brine", amount=40}
    },
    results = {
      {type="item", name="nullius-salt", amount=3},
      {type="fluid", name="nullius-steam", amount=60},
      {type="fluid", name="nullius-saline", amount=15}
    },
    main_product = "nullius-salt"
  },
  {
    type = "recipe",
    name = "nullius-boxed-salt",
    enabled = false,
    category = "distillation",
    subgroup = "boxed-sodium",
    order = "nullius-bb",
    crafting_machine_tint = { primary = data.raw.fluid["nullius-brine"].flow_color },
    energy_required = 5,
    ingredients = {
      {type="fluid", name="nullius-brine", amount=200}
    },
    results = {
      {type="item", name="nullius-box-salt", amount=3},
      {type="fluid", name="nullius-steam", amount=300},
      {type="fluid", name="nullius-saline", amount=75}
    },
    main_product = "nullius-box-salt"
  },
  {
    type = "recipe",
    name = "nullius-salination",
    localised_name = {"recipe-name.nullius-salination"},
    enabled = false,
    no_productivity = true,
    show_amount_in_title = false,
    always_show_products = true,
    allow_as_intermediate = false,
    allow_decomposition = false,
    category = "nullius-water-treatment",
    order = "nullius-ec",
    energy_required = 1,
    ingredients = {
      {type="fluid", name="nullius-freshwater", amount=200},
      {type="item", name="nullius-salt", amount=5}
    },
    results = {
      {type="fluid", name="nullius-seawater", amount=200}
    }
  },
  {
    type = "recipe",
    name = "nullius-boxed-salination",
    localised_name = {"recipe-name.nullius-boxed", {"recipe-name.nullius-salination"}},
    enabled = false,
    no_productivity = true,
    show_amount_in_title = false,
    always_show_products = true,
    category = "nullius-water-treatment",
    subgroup = "boxed-fluid",
    order = "nullius-d",
    energy_required = 1,
    ingredients = {
      {type="fluid", name="nullius-freshwater", amount=200},
      {type="item", name="nullius-box-salt", amount=1}
    },
    results = {
      {type="fluid", name="nullius-seawater", amount=200}
    }
  },

  {
    type = "recipe",
    name = "nullius-salt-electrolysis",
    localised_name = {"recipe-name.nullius-salt-electrolysis"},
    enabled = false,
    category = "nullius-electrolysis",
    order = "nullius-db",
    energy_required = 1,
    ingredients = {
      {type="item", name="nullius-salt", amount=3}
    },
    results = {
      {type="item", name="nullius-sodium", amount=2},
      {type="fluid", name="nullius-chlorine", amount=25, fluidbox_index=1}
    },
    main_product = "nullius-sodium"
  },
  {
    type = "recipe",
    name = "nullius-boxed-sodium-1",
    localised_name = {"", {"item-name.nullius-box", {"item-name.nullius-sodium"}}, " ", 1},
    enabled = false,
    category = "nullius-electrolysis",
    subgroup = "boxed-sodium",
    order = "nullius-db",
    energy_required = 5,
    ingredients = {
      {type="item", name="nullius-box-salt", amount=3}
    },
    results = {
      {type="item", name="nullius-box-sodium", amount=2},
      {type="fluid", name="nullius-chlorine", amount=125, fluidbox_index=1}
    },
    main_product = "nullius-box-sodium"
  },
  {
    type = "recipe",
    name = "nullius-sodium-hydroxide-electrolysis",
    localised_name = {"recipe-name.nullius-sodium-hydroxide-electrolysis"},
    enabled = false,
    category = "nullius-electrolysis",
    order = "nullius-dc",
    energy_required = 1,
    ingredients = {
      {type="item", name="nullius-sodium-hydroxide", amount=4}
    },
    results = {
      {type="item", name="nullius-sodium", amount=3},
      {type="fluid", name="nullius-oxygen", amount=30, fluidbox_index=3},
      {type="fluid", name="nullius-water", amount=15, fluidbox_index=1}
    },
    main_product = "nullius-sodium"
  },
  {
    type = "recipe",
    name = "nullius-boxed-sodium-2",
    localised_name = {"", {"item-name.nullius-box", {"item-name.nullius-sodium"}}, " ", 2},
    enabled = false,
    category = "nullius-electrolysis",
    subgroup = "boxed-sodium",
    order = "nullius-dc",
    energy_required = 5,
    ingredients = {
      {type="item", name="nullius-box-sodium-hydroxide", amount=4}
    },
    results = {
      {type="item", name="nullius-box-sodium", amount=3},
      {type="fluid", name="nullius-oxygen", amount=150, fluidbox_index=3},
      {type="fluid", name="nullius-water", amount=75, fluidbox_index=1}
    },
    main_product = "nullius-box-sodium"
  },

  {
    type = "recipe",
    name = "nullius-lithium-chloride",
    enabled = false,
    category = "nullius-water-treatment",
    crafting_machine_tint = { primary = {0.9, 0.75, 1} },
    energy_required = 30,
    ingredients = {
      {type="fluid", name="nullius-brine", amount=400}
    },
    results = {
      {type="item", name="nullius-salt", amount=25},
      {type="item", name="nullius-lithium-chloride", amount=1},
      {type="fluid", name="nullius-saline", amount=150},
      {type="fluid", name="nullius-steam", amount=400}
    },
    main_product = "nullius-lithium-chloride"
  },
  {
    type = "recipe",
    name = "nullius-boxed-lithium-chloride",
    enabled = false,
    category = "nullius-water-treatment",
    subgroup = "boxed-sodium",
    order = "nullius-bc",
    crafting_machine_tint = { primary = {0.95, 0.8, 1} },
    energy_required = 150,
    ingredients = {
      {type="fluid", name="nullius-brine", amount=2000}
    },
    results = {
      {type="item", name="nullius-box-salt", amount=25},
      {type="item", name="nullius-box-lithium-chloride", amount=1},
      {type="fluid", name="nullius-saline", amount=750},
      {type="fluid", name="nullius-steam", amount=2000}
    },
    main_product = "nullius-box-lithium-chloride"
  },
  {
    type = "recipe",
    name = "nullius-lithium",
    enabled = false,
    category = "nullius-electrolysis",
    energy_required = 1,
    ingredients = {
      {type="item", name="nullius-lithium-chloride", amount=2}
    },
    results = {
      {type="item", name="nullius-lithium", amount=1},
      {type="fluid", name="nullius-chlorine", amount=20, fluidbox_index=1}
    },
    main_product = "nullius-lithium"
  },
  {
    type = "recipe",
    name = "nullius-boxed-lithium",
    enabled = false,
    category = "nullius-electrolysis",
    subgroup = "boxed-sodium",
    energy_required = 5,
    ingredients = {
      {type="item", name="nullius-box-lithium-chloride", amount=2}
    },
    results = {
      {type="item", name="nullius-box-lithium", amount=1},
      {type="fluid", name="nullius-chlorine", amount=100, fluidbox_index=1}
    },
    main_product = "nullius-box-lithium"
  },

  {
    type = "recipe",
    name = "nullius-air-separation-1",
    enabled = false,
    category = "distillation",
    subgroup = "air-filtration",
    order = "nullius-cb",
    crafting_machine_tint = { primary = data.raw.fluid["nullius-air"].flow_color },
    energy_required = 1,
    ingredients = {
      {type="fluid", name="nullius-air", amount=150}
    },
    results = {
      {type="fluid", name="nullius-nitrogen", amount=90},
      {type="fluid", name="nullius-carbon-dioxide", amount=40}
    }
  },
  {
    type = "recipe",
    name = "nullius-air-separation-2",
    enabled = false,
    category = "distillation",
    subgroup = "air-filtration",
    order = "nullius-cc",
    crafting_machine_tint = { primary = {r = 62, g = 154, b = 247} },
    energy_required = 1,
    ingredients = {
      {type="fluid", name="nullius-air", amount=100}
    },
    results = {
      {type="fluid", name="nullius-nitrogen", amount=66},
      {type="fluid", name="nullius-residual-gas", amount=3},
      {type="fluid", name="nullius-carbon-dioxide", amount=30}
    }
  },
  {
    type = "recipe",
    name = "nullius-pressure-air-separation",
    enabled = false,
    category = "distillation",
    subgroup = "air-filtration",
    order = "nullius-cd",
    crafting_machine_tint = { primary = {r = 62, g = 154, b = 247} },
    energy_required = 2,
    ingredients = {
      {type="fluid", name="nullius-compressed-air", amount=100}
    },
    results = {
      {type="fluid", name="nullius-compressed-nitrogen", amount=66},
      {type="fluid", name="nullius-compressed-residual-gas", amount=3},
      {type="fluid", name="nullius-compressed-carbon-dioxide", amount=30}
    }
  },
  {
    type = "recipe",
    name = "nullius-residual-gas",
    localised_name = {"fluid-name.nullius-residual-gas"},
    enabled = false,
    category = "distillation",
    subgroup = "air-filtration",
    order = "nullius-ce",
    crafting_machine_tint = { primary = {r = 77, g = 160, b = 244} },
    energy_required = 1,
    ingredients = {
      {type="fluid", name="nullius-compressed-air", amount=60}
    },
    results = {
      {type="fluid", name="nullius-air", amount=120},
      {type="fluid", name="nullius-compressed-nitrogen", amount=20},
      {type="fluid", name="nullius-compressed-residual-gas", amount=4}
    },
    main_product = "nullius-compressed-residual-gas"
  },
  {
    type = "recipe",
    name = "nullius-residual-separation",
    enabled = false,
    category = "distillation",
    subgroup = "air-filtration",
    order = "nullius-db",
    crafting_machine_tint = { primary = data.raw.fluid["nullius-residual-gas"].flow_color },
    energy_required = 5,
    ingredients = {
      {type="fluid", name="nullius-residual-gas", amount=50}
    },
    results = {
      {type="fluid", name="nullius-argon", amount=20},
      {type="fluid", name="nullius-trace-gas", amount=2},
      {type="fluid", name="nullius-water", amount=3}
    }
  },
  {
    type = "recipe",
    name = "nullius-pressure-residual-separation",
    enabled = false,
    category = "distillation",
    subgroup = "air-filtration",
    order = "nullius-dc",
    crafting_machine_tint = { primary = data.raw.fluid["nullius-residual-gas"].flow_color },
    energy_required = 10,
    ingredients = {
      {type="fluid", name="nullius-compressed-residual-gas", amount=50}
    },
    results = {
      {type="fluid", name="nullius-compressed-argon", amount=20},
      {type="fluid", name="nullius-compressed-trace-gas", amount=2},
      {type="fluid", name="nullius-steam", amount=28}
    }
  },
  {
    type = "recipe",
    name = "nullius-trace-separation",
    enabled = false,
    category = "distillation",
    subgroup = "air-filtration",
    order = "nullius-eb",
    crafting_machine_tint = { primary = data.raw.fluid["nullius-trace-gas"].flow_color },
    energy_required = 2,
    ingredients = {
      {type="fluid", name="nullius-trace-gas", amount=6}
    },
    results = {
      {type="fluid", name="nullius-helium", amount=3},
      {type="fluid", name="nullius-volcanic-gas", amount=1},
      {type="fluid", name="nullius-methane", amount=2}
    }
  },
  {
    type = "recipe",
    name = "nullius-pressure-trace-separation",
    enabled = false,
    category = "distillation",
    subgroup = "air-filtration",
    order = "nullius-ec",
    crafting_machine_tint = { primary = data.raw.fluid["nullius-trace-gas"].flow_color },
    energy_required = 10,
    ingredients = {
      {type="fluid", name="nullius-compressed-trace-gas", amount=15}
    },
    results = {
      {type="fluid", name="nullius-compressed-helium", amount=12},
      {type="fluid", name="nullius-volcanic-gas", amount=10},
      {type="fluid", name="nullius-compressed-methane", amount=5}
    }
  },
  {
    type = "recipe",
    name = "nullius-volcanic-separation-1",
    localised_name = {"", {"recipe-name.nullius-volcanic-separation"}, " ", 1},
    enabled = false,
    category = "distillation",
    subgroup = "air-filtration",
    order = "nullius-fb",
    crafting_machine_tint = { primary = data.raw.fluid["nullius-volcanic-gas"].flow_color },
    energy_required = 1,
    ingredients = {
      {type="fluid", name="nullius-volcanic-gas", amount=40}
    },
    results = {
      {type="fluid", name="nullius-sulfur-dioxide", amount=10},
      {type="fluid", name="nullius-air", amount=15},
      {type="fluid", name="nullius-carbon-monoxide", amount=12}
    }
  },
  {
    type = "recipe",
    name = "nullius-volcanic-separation-2",
    localised_name = {"", {"recipe-name.nullius-volcanic-separation"}, " ", 2},
    enabled = false,
    category = "distillation",
    subgroup = "air-filtration",
    order = "nullius-fc",
    crafting_machine_tint = { primary = data.raw.fluid["nullius-volcanic-gas"].flow_color },
    energy_required = 3,
    ingredients = {
      {type="fluid", name="nullius-volcanic-gas", amount=80}
    },
    results = {
      {type="fluid", name="nullius-sulfur-dioxide", amount=20},
      {type="fluid", name="nullius-air", amount=30},
      {type="fluid", name="nullius-carbon-monoxide", amount=25},
      {type="item", name="nullius-acid-boric", amount=1}
    }
  },
  {
    type = "recipe",
    name = "nullius-boxed-volcanic",
    localised_name = {"recipe-name.nullius-boxed", {"recipe-name.nullius-volcanic-separation"}},
    enabled = false,
    category = "distillation",
    subgroup = "boxed-fluid",
    order = "nullius-b",
    crafting_machine_tint = { primary = data.raw.fluid["nullius-volcanic-gas"].flow_color },
    energy_required = 15,
    ingredients = {
      {type="fluid", name="nullius-volcanic-gas", amount=400}
    },
    results = {
      {type="fluid", name="nullius-sulfur-dioxide", amount=100},
      {type="fluid", name="nullius-air", amount=150},
      {type="fluid", name="nullius-carbon-monoxide", amount=125},
      {type="item", name="nullius-box-acid-boric", amount=1}
    },
    main_product = "nullius-box-acid-boric"
  },

  {
    type = "recipe",
    name = "nullius-carbon-dioxide-to-monoxide",
    localised_name = {"recipe-name.nullius-carbon-dioxide-to-monoxide"},
    enabled = false,
    category = "basic-chemistry",
    subgroup = "carbon",
    order = "nullius-c",
    crafting_machine_tint = {
      primary = data.raw.fluid["nullius-carbon-dioxide"].flow_color,
      secondary = data.raw.fluid["nullius-hydrogen"].flow_color
    },
    energy_required = 1,
    ingredients = {
      {type="fluid", name="nullius-carbon-dioxide", amount=40, fluidbox_index=1},
      {type="fluid", name="nullius-hydrogen", amount=40, fluidbox_index=2}
    },
    results = {
      {type="fluid", name="nullius-carbon-monoxide", amount=26},
      {type="fluid", name="nullius-water", amount=8}
    },
    main_product = "nullius-carbon-monoxide"
  },
  {
    type = "recipe",
    name = "nullius-pressure-carbon-monoxide",
    enabled = false,
    category = "basic-chemistry",
    subgroup = "compressed-organic",
    order = "nullius-c",
    crafting_machine_tint = {
      primary = data.raw.fluid["nullius-carbon-dioxide"].flow_color,
      secondary = data.raw.fluid["nullius-hydrogen"].flow_color
    },
    energy_required = 1,
    ingredients = {
      {type="fluid", name="nullius-compressed-carbon-dioxide", amount=20, fluidbox_index=1},
      {type="fluid", name="nullius-compressed-hydrogen", amount=20, fluidbox_index=2}
    },
    results = {
      {type="fluid", name="nullius-compressed-carbon-monoxide", amount=13},
      {type="fluid", name="nullius-water", amount=16}
    }
  },
  {
    type = "recipe",
    name = "nullius-carbon-monoxide-to-dioxide",
    localised_name = {"recipe-name.nullius-carbon-monoxide-to-dioxide"},
    enabled = false,
    category = "basic-chemistry",
    subgroup = "carbon",
    order = "nullius-b",
    crafting_machine_tint = {
      primary = data.raw.fluid["nullius-carbon-monoxide"].flow_color,
      secondary = data.raw.fluid["nullius-water"].flow_color
    },
    energy_required = 1,
    ingredients = {
      {type="fluid", name="nullius-carbon-monoxide", amount=40, fluidbox_index=1},
      {type="fluid", name="nullius-water", amount=12, fluidbox_index=2}
    },
    results = {
      {type="fluid", name="nullius-carbon-dioxide", amount=30},
      {type="fluid", name="nullius-hydrogen", amount=30}
    },
    main_product = "nullius-carbon-dioxide"
  },
  {
    type = "recipe",
    name = "nullius-pressure-carbon-dioxide",
    enabled = false,
    category = "basic-chemistry",
    subgroup = "compressed-organic",
    order = "nullius-b",
    crafting_machine_tint = {
      primary = data.raw.fluid["nullius-carbon-monoxide"].flow_color,
      secondary = data.raw.fluid["nullius-water"].flow_color
    },
    energy_required = 1,
    ingredients = {
      {type="fluid", name="nullius-compressed-carbon-monoxide", amount=20, fluidbox_index=1},
      {type="fluid", name="nullius-water", amount=24, fluidbox_index=2}
    },
    results = {
      {type="fluid", name="nullius-compressed-carbon-dioxide", amount=15},
      {type="fluid", name="nullius-compressed-hydrogen", amount=15}
    }
  },
  {
    type = "recipe",
    name = "nullius-carbon-monoxide-to-graphite",
    enabled = false,
    category = "basic-chemistry",
    subgroup = "organic-material-1",
    order = "nullius-bb",
    crafting_machine_tint = {
      primary = data.raw.fluid["nullius-carbon-monoxide"].flow_color,
      secondary = data.raw.fluid["nullius-hydrogen"].flow_color
    },
    energy_required = 2,
    ingredients = {
      {type="fluid", name="nullius-carbon-monoxide", amount=28},
      {type="fluid", name="nullius-hydrogen", amount=36}
    },
    results = {
      {type="item", name="nullius-graphite", amount=1},
      {type="fluid", name="nullius-water", amount=5}
    }
  },
  {
    type = "recipe",
    name = "nullius-pressure-monoxide-to-graphite",
    enabled = false,
    category = "basic-chemistry",
    subgroup = "organic-material-1",
    order = "nullius-bc",
    crafting_machine_tint = {
      primary = data.raw.fluid["nullius-carbon-monoxide"].flow_color,
      secondary = data.raw.fluid["nullius-hydrogen"].flow_color
    },
    energy_required = 1,
    ingredients = {
      {type="fluid", name="nullius-compressed-carbon-monoxide", amount=7},
      {type="fluid", name="nullius-compressed-hydrogen", amount=9}
    },
    results = {
      {type="item", name="nullius-graphite", amount=1},
      {type="fluid", name="nullius-water", amount=5}
    }
  },
  {
    type = "recipe",
    name = "nullius-graphite-to-carbon-monoxide",
    enabled = false,
    category = "basic-chemistry",
    subgroup = "carbon",
    order = "nullius-d",
    crafting_machine_tint = {
      primary = data.raw.fluid["nullius-carbon-monoxide"].flow_color,
      secondary = data.raw.fluid["nullius-water"].flow_color
    },
    energy_required = 3,
    ingredients = {
      {type="item", name="nullius-graphite", amount=2},
      {type="fluid", name="nullius-water", amount=10, fluidbox_index=2}
    },
    results = {
      {type="fluid", name="nullius-carbon-monoxide", amount=25},
      {type="fluid", name="nullius-hydrogen", amount=25}
    }
  },
  {
    type = "recipe",
    name = "nullius-boxed-carbon-monoxide",
    localised_name = {"recipe-name.nullius-boxed", {"fluid-name.nullius-carbon-monoxide"}},
    enabled = false,
    category = "basic-chemistry",
    subgroup = "boxed-organic-1",
    order = "nullius-bm",
    crafting_machine_tint = {
      primary = data.raw.fluid["nullius-carbon-monoxide"].flow_color,
      secondary = data.raw.fluid["nullius-water"].flow_color
    },
    energy_required = 15,
    ingredients = {
      {type="item", name="nullius-box-graphite", amount=2},
      {type="fluid", name="nullius-water", amount=50, fluidbox_index=2}
    },
    results = {
      {type="fluid", name="nullius-carbon-monoxide", amount=125},
      {type="fluid", name="nullius-hydrogen", amount=125}
    }
  },

  {
    type = "recipe",
    name = "nullius-carbon-monoxide-to-alkenes",
    localised_name = {"recipe-name.nullius-alkene-synthesis"},
    enabled = false,
    category = "distillation",
    subgroup = "carbon",
    order = "nullius-i",
    crafting_machine_tint = { primary = data.raw.fluid["nullius-carbon-monoxide"].flow_color },
    energy_required = 2,
    ingredients = {
      {type="fluid", name="nullius-carbon-monoxide", amount=100},
      {type="fluid", name="nullius-hydrogen", amount=180}
    },
    results = {
      {type="fluid", name="nullius-ethylene", amount=18},
      {type="fluid", name="nullius-propene", amount=12},
      {type="fluid", name="nullius-benzene", amount=3}
    },
    main_product = "nullius-benzene"
  },
  {
    type = "recipe",
    name = "nullius-pressure-alkene-synthesis",
    enabled = false,
    category = "distillation",
    subgroup = "compressed-organic",
    order = "nullius-fb",
    crafting_machine_tint = { primary = data.raw.fluid["nullius-carbon-monoxide"].flow_color },
    energy_required = 1,
    ingredients = {
      {type="fluid", name="nullius-compressed-carbon-monoxide", amount=25},
      {type="fluid", name="nullius-compressed-hydrogen", amount=45}
    },
    results = {
      {type="fluid", name="nullius-ethylene", amount=18},
      {type="fluid", name="nullius-propene", amount=12},
      {type="fluid", name="nullius-benzene", amount=3}
    }
  },
  {
    type = "recipe",
    name = "nullius-alkene-synthesis-light",
    localised_name = {"recipe-name.nullius-light", {"recipe-name.nullius-alkene-synthesis"}},
    enabled = false,
    category = "distillation",
    subgroup = "compressed-organic",
    order = "nullius-fc",
    crafting_machine_tint = { primary = {r = 0.75, g = 0.3, b = 0.3} },
    energy_required = 1,
    ingredients = {
      {type="fluid", name="nullius-compressed-carbon-monoxide", amount=30},
      {type="fluid", name="nullius-compressed-hydrogen", amount=65}
    },
    results = {
      {type="fluid", name="nullius-methane", amount=36},
      {type="fluid", name="nullius-ethylene", amount=24},
      {type="fluid", name="nullius-propene", amount=12}
    }
  },

  {
    type = "recipe",
    name = "nullius-carbon-dioxide-to-methane",
    enabled = false,
    category = "basic-chemistry",
    subgroup = "carbon",
    order = "nullius-f",
    crafting_machine_tint = {
      primary = data.raw.fluid["nullius-carbon-dioxide"].flow_color,
      secondary = data.raw.fluid["nullius-hydrogen"].flow_color
    },
    energy_required = 1,
    ingredients = {
      {type="fluid", name="nullius-carbon-dioxide", amount=32, fluidbox_index=1},
      {type="fluid", name="nullius-hydrogen", amount=110, fluidbox_index=2}
    },
    results = {
      {type="fluid", name="nullius-methane", amount=24},
      {type="fluid", name="nullius-water", amount=10}
    },
    main_product = "nullius-methane"
  },
  {
    type = "recipe",
    name = "nullius-pressure-methane",
    enabled = false,
    category = "basic-chemistry",
    subgroup = "compressed-organic",
    order = "nullius-d",
    crafting_machine_tint = {
      primary = data.raw.fluid["nullius-carbon-dioxide"].flow_color,
      secondary = data.raw.fluid["nullius-hydrogen"].flow_color
    },
    energy_required = 1,
    ingredients = {
      {type="fluid", name="nullius-compressed-carbon-dioxide", amount=16, fluidbox_index=1},
      {type="fluid", name="nullius-compressed-hydrogen", amount=55, fluidbox_index=2}
    },
    results = {
      {type="fluid", name="nullius-compressed-methane", amount=12},
      {type="fluid", name="nullius-water", amount=20}
    }
  },
  {
    type = "recipe",
    name = "nullius-methane-to-ethylene",
    enabled = false,
    category = "basic-chemistry",
    subgroup = "carbon",
    order = "nullius-h",
    crafting_machine_tint = {
      primary = data.raw.fluid["nullius-methane"].flow_color,
      secondary = data.raw.fluid["nullius-oxygen"].flow_color
    },
    energy_required = 1,
    ingredients = {
      {type="fluid", name="nullius-methane", amount=60, fluidbox_index=1},
      {type="fluid", name="nullius-oxygen", amount=40, fluidbox_index=2}
    },
    results = {
      {type="fluid", name="nullius-ethylene", amount=16},
      {type="fluid", name="nullius-water", amount=8}
    },
    main_product = "nullius-ethylene"
  },
  {
    type = "recipe",
    name = "nullius-pressure-ethylene",
    localised_name = {"recipe-name.nullius-pressure-ethylene"},
    enabled = false,
    category = "basic-chemistry",
    subgroup = "compressed-organic",
    order = "nullius-e",
    crafting_machine_tint = {
      primary = data.raw.fluid["nullius-methane"].flow_color,
      secondary = data.raw.fluid["nullius-oxygen"].flow_color
    },
    energy_required = 1,
    ingredients = {
      {type="fluid", name="nullius-compressed-methane", amount=30, fluidbox_index=1},
      {type="fluid", name="nullius-compressed-oxygen", amount=20, fluidbox_index=2}
    },
    results = {
      {type="fluid", name="nullius-ethylene", amount=32},
      {type="fluid", name="nullius-water", amount=16}
    },
    main_product = "nullius-ethylene"
  },
  {
    type = "recipe",
    name = "nullius-methanol",
    enabled = false,
    show_amount_in_title = false,
    always_show_products = true,
    category = "basic-chemistry",
    crafting_machine_tint = {
      primary = data.raw.fluid["nullius-oxygen"].flow_color,
      secondary = data.raw.fluid["nullius-methane"].flow_color
    },
    energy_required = 1,
    ingredients = {
      {type="fluid", name="nullius-methane", amount=12, fluidbox_index=1},
      {type="fluid", name="nullius-oxygen", amount=6, fluidbox_index=2}
    },
    results = {
      {type="fluid", name="nullius-methanol", amount=2}
    },
    main_product = "nullius-methanol"
  },
  {
    type = "recipe",
    name = "nullius-pressure-methanol",
    localised_name = {"recipe-name.nullius-pressure-methanol"},
    enabled = false,
    show_amount_in_title = false,
    always_show_products = true,
    category = "basic-chemistry",
    subgroup = "compressed-organic",
    order = "nullius-h",
    crafting_machine_tint = {
      primary = data.raw.fluid["nullius-oxygen"].flow_color,
      secondary = data.raw.fluid["nullius-methane"].flow_color
    },
    energy_required = 1,
    ingredients = {
      {type="fluid", name="nullius-compressed-methane", amount=6, fluidbox_index=1},
      {type="fluid", name="nullius-compressed-oxygen", amount=3, fluidbox_index=2}
    },
    results = {
      {type="fluid", name="nullius-methanol", amount=4}
    },
    main_product = "nullius-methanol"
  },

  {
    type = "recipe",
    name = "nullius-butadiene",
    enabled = false,
    category = "distillation",
    crafting_machine_tint = { primary = data.raw.fluid["nullius-ethylene"].flow_color },
    energy_required = 1,
    ingredients = {
      {type="fluid", name="nullius-ethylene", amount=50},
      {type="fluid", name="nullius-steam", amount=150}
    },
    results = {
      {type="fluid", name="nullius-butadiene", amount=30},
      {type="fluid", name="nullius-hydrogen", amount=20}
    },
    main_product = "nullius-butadiene"
  },
  {
    type = "recipe",
    name = "nullius-styrene",
    enabled = false,
    category = "basic-chemistry",
    crafting_machine_tint = {
      primary = data.raw.fluid["nullius-benzene"].flow_color,
      secondary = data.raw.fluid["nullius-ethylene"].flow_color
    },
    energy_required = 2,
    ingredients = {
      {type="fluid", name="nullius-ethylene", amount=20, fluidbox_index=1},
      {type="fluid", name="nullius-benzene", amount=10, fluidbox_index=2}
    },
    results = {
      {type="fluid", name="nullius-styrene", amount=9},
      {type="fluid", name="nullius-hydrogen", amount=15}
    },
    main_product = "nullius-styrene"
  },
  {
    type = "recipe",
    name = "nullius-acrylonitrile",
    enabled = false,
    category = "basic-chemistry",
    crafting_machine_tint = {
      primary = data.raw.fluid["nullius-propene"].flow_color,
      secondary = data.raw.fluid["nullius-ammonia"].flow_color
    },
    energy_required = 1,
    ingredients = {
      {type="fluid", name="nullius-propene", amount=20},
      {type="fluid", name="nullius-oxygen", amount=30},
      {type="fluid", name="nullius-ammonia", amount=20}
    },
    results = {
      {type="fluid", name="nullius-acrylonitrile", amount=10},
      {type="fluid", name="nullius-wastewater", amount=12}
    },
    main_product = "nullius-acrylonitrile"
  },

  {
    type = "recipe",
    name = "nullius-rubber",
    localised_name = {"recipe-name.nullius-rubber-1"},
    enabled = false,
    show_amount_in_title = false,
    always_show_products = true,
    category = "ore-flotation",
    order = "nullius-cb",
    crafting_machine_tint = {
      primary = data.raw.fluid["nullius-butadiene"].flow_color,
      secondary = data.raw.fluid["nullius-styrene"].flow_color
    },
    energy_required = 3,
    ingredients = {
      {type="fluid", name="nullius-butadiene", amount=12},
      {type="fluid", name="nullius-styrene", amount=3}
    },
    results = {
      {type="item", name="nullius-rubber", amount=1}
    },
    main_product = "nullius-rubber"
  },
  {
    type = "recipe",
    name = "nullius-rubber-nbr",
    localised_name = {"recipe-name.nullius-rubber-2"},
    enabled = false,
    show_amount_in_title = false,
    always_show_products = true,
    category = "basic-chemistry",
    order = "nullius-cc",
    crafting_machine_tint = {
      primary = data.raw.fluid["nullius-butadiene"].flow_color,
      secondary = data.raw.fluid["nullius-acrylonitrile"].flow_color
    },
    energy_required = 12,
    ingredients = {
      {type="fluid", name="nullius-butadiene", amount=60},
      {type="fluid", name="nullius-acrylonitrile", amount=8},
      {type="fluid", name="nullius-solvent", amount=1}
    },
    results = {
      {type="item", name="nullius-rubber", amount=8}
    },
    main_product = "nullius-rubber"
  },
  {
    type = "recipe",
    name = "nullius-boxed-rubber",
    enabled = false,
    show_amount_in_title = false,
    always_show_products = true,
    category = "basic-chemistry",
      subgroup = "boxed-organic-2",
    order = "nullius-c",
    crafting_machine_tint = {
      primary = data.raw.fluid["nullius-butadiene"].flow_color,
      secondary = data.raw.fluid["nullius-acrylonitrile"].flow_color
    },
    energy_required = 60,
    ingredients = {
      {type="fluid", name="nullius-butadiene", amount=300},
      {type="fluid", name="nullius-acrylonitrile", amount=40},
      {type="fluid", name="nullius-solvent", amount=5}
    },
    results = {
      {type="item", name="nullius-box-rubber", amount=8}
    },
    main_product = "nullius-box-rubber"
  },

  {
    type = "recipe",
    name = "nullius-boiling-water",
    localised_name = {"recipe-name.nullius-boiling", {"fluid-name.nullius-water"}},
    show_amount_in_title = false,
    always_show_products = true,
    enabled = false,
    category = "boiling",
    subgroup = "boiling",
    order = "nullius-b",
    energy_required = 1,
    no_productivity = true,
    ingredients = {
      {type="fluid", name="nullius-water", amount=65}
    },
    results = {
      {type="fluid", name="nullius-steam", amount=270, fluidbox_index=1}
    },
    main_product = "nullius-steam"
  },
  {
    type = "recipe",
    name = "nullius-boiling-saline",
    localised_name = {"recipe-name.nullius-boiling", {"fluid-name.nullius-saline"}},
    show_amount_in_title = false,
    always_show_products = true,
    enabled = false,
    category = "boiling",
    subgroup = "boiling",
    order = "nullius-c",
    energy_required = 1,
    no_productivity = true,
    ingredients = {
      {type="fluid", name="nullius-saline", amount=70}
    },
    results = {
      {type="fluid", name="nullius-steam", amount=255},
      {type="fluid", name="nullius-brine", amount=15}
    },
    main_product = "nullius-steam"
  },
  {
    type = "recipe",
    name = "nullius-boiling-seawater",
    localised_name = {"recipe-name.nullius-boiling", {"fluid-name.nullius-seawater"}},
    show_amount_in_title = false,
    always_show_products = true,
    enabled = false,
    category = "boiling",
    subgroup = "boiling",
    order = "nullius-d",
    energy_required = 1,
    no_productivity = true,
    ingredients = {
      {type="fluid", name="nullius-seawater", amount=75}
    },
    results = {
      {type="fluid", name="nullius-steam", amount=235},
      {type="fluid", name="nullius-wastewater", amount=20}
    },
    main_product = "nullius-steam"
  },
  {
    type = "recipe",
    name = "nullius-boiling-freshwater",
    localised_name = {"recipe-name.nullius-boiling", {"fluid-name.nullius-freshwater"}},
    show_amount_in_title = false,
    always_show_products = true,
    enabled = false,
    category = "boiling",
    subgroup = "boiling",
    order = "nullius-e",
    energy_required = 1,
    no_productivity = true,
    ingredients = {
      {type="fluid", name="nullius-freshwater", amount=70}
    },
    results = {
      {type="fluid", name="nullius-steam", amount=260},
      {type="fluid", name="nullius-wastewater", amount=8}
    },
    main_product = "nullius-steam"
  },
  {
    type = "recipe",
    name = "nullius-boiling-wastewater",
    localised_name = {"recipe-name.nullius-boiling", {"fluid-name.nullius-wastewater"}},
    show_amount_in_title = false,
    always_show_products = true,
    enabled = false,
    category = "boiling",
    subgroup = "boiling",
    order = "nullius-f",
    energy_required = 1,
    no_productivity = true,
    ingredients = {
      {type="fluid", name="nullius-wastewater", amount=75}
    },
    results = {
      {type="fluid", name="nullius-steam", amount=225},
      {type="fluid", name="nullius-sludge", amount=12}
    },
    main_product = "nullius-steam"
  },
  {
    type = "recipe",
    name = "nullius-condensation",
    localised_name = {"recipe-name.nullius-condensation"},
    show_amount_in_title = false,
    always_show_products = true,
    icon_size = 64,
    enabled = false,
    category = "distillation",
    subgroup = "boiling",
    order = "nullius-m",
    energy_required = 0.5,
    no_productivity = true,
    ingredients = {
      {type="fluid", name="nullius-steam", amount=2500}
    },
    results = {
      {type="fluid", name="nullius-water", amount=250}
    },
    main_product = "nullius-water"
  },

  {
    type = "recipe",
    name = "nullius-hydrogen-combustion-1",
    localised_name = {"recipe-name.nullius-hydrogen-combustion-1"},
    icon_size = 64,
    enabled = false,
    category = "combustion",
    subgroup = "combustion",
    order = "nullius-db",
    show_amount_in_title = false,
    always_show_products = true,
    energy_required = 1,
    ingredients = {
      {type="fluid", name="nullius-hydrogen", amount=200},
      {type="fluid", name="nullius-oxygen", amount=100}
    },
    results = {
      {type="fluid", name="nullius-steam", amount=440}
    }
  },
  {
    type = "recipe",
    name = "nullius-hydrogen-combustion-2",
    localised_name = {"recipe-name.nullius-hydrogen-combustion-2"},
    icon_size = 64,
    enabled = false,
    category = "combustion",
    subgroup = "combustion",
    order = "nullius-dc",
    show_amount_in_title = false,
    always_show_products = true,
    energy_required = 1,
    ingredients = {
      {type="fluid", name="nullius-compressed-hydrogen", amount=65},
      {type="fluid", name="nullius-oxygen", amount=130}
    },
    results = {
      {type="fluid", name="nullius-steam", amount=600}
    },
    main_product = "nullius-steam"
  },
  {
    type = "recipe",
    name = "nullius-hydrogen-combustion-3",
    localised_name = {"recipe-name.nullius-hydrogen-combustion-3"},
    icon_size = 64,
    enabled = false,
    category = "combustion",
    subgroup = "combustion",
    order = "nullius-dd",
    show_amount_in_title = false,
    always_show_products = true,
    energy_required = 1,
    ingredients = {
      {type="fluid", name="nullius-compressed-hydrogen", amount=90},
      {type="fluid", name="nullius-compressed-oxygen", amount=45}
    },
    results = {
      {type="fluid", name="nullius-steam", amount=850}
    },
    main_product = "nullius-steam"
  },

  {
    type = "recipe",
    name = "nullius-methane-combustion-1",
    localised_name = {"recipe-name.nullius-methane-combustion-1"},
    enabled = false,
    category = "combustion",
    subgroup = "combustion",
    order = "nullius-eb",
    energy_required = 1,
    ingredients = {
      {type="fluid", name="nullius-methane", amount=45},
      {type="fluid", name="nullius-oxygen", amount=90}
    },
    results = {
      {type="fluid", name="nullius-steam", amount=300},
      {type="fluid", name="nullius-carbon-dioxide", amount=35}
    },
    main_product = "nullius-steam"
  },
  {
    type = "recipe",
    name = "nullius-methane-combustion-2",
    localised_name = {"recipe-name.nullius-methane-combustion-2"},
    enabled = false,
    category = "combustion",
    subgroup = "combustion",
    order = "nullius-ec",
    energy_required = 1,
    ingredients = {
      {type="fluid", name="nullius-compressed-methane", amount=20},
      {type="fluid", name="nullius-compressed-oxygen", amount=40}
    },
    results = {
      {type="fluid", name="nullius-steam", amount=650},
      {type="fluid", name="nullius-compressed-carbon-dioxide", amount=16}
    },
    main_product = "nullius-steam"
  },

  {
    type = "recipe",
    name = "nullius-ethylene-combustion",
    localised_name = {"recipe-name.nullius-ethylene-combustion"},
    icon_size = 64,
    enabled = false,
    category = "combustion",
    subgroup = "combustion",
    order = "nullius-fb",
    energy_required = 1,
    ingredients = {
      {type="fluid", name="nullius-ethylene", amount=40},
      {type="fluid", name="nullius-oxygen", amount=120}
    },
    results = {
      {type="fluid", name="nullius-steam", amount=325},
      {type="fluid", name="nullius-carbon-dioxide", amount=65}
    },
    main_product = "nullius-steam"
  },
  {
    type = "recipe",
    name = "nullius-propene-combustion",
    localised_name = {"recipe-name.nullius-propene-combustion"},
    enabled = false,
    category = "combustion",
    subgroup = "combustion",
    order = "nullius-fc",
    energy_required = 1,
    ingredients = {
      {type="fluid", name="nullius-propene", amount=30},
      {type="fluid", name="nullius-oxygen", amount=130}
    },
    results = {
      {type="fluid", name="nullius-steam", amount=400},
      {type="fluid", name="nullius-carbon-dioxide", amount=70}
    },
    main_product = "nullius-steam"
  },
  {
    type = "recipe",
    name = "nullius-benzene-combustion",
    localised_name = {"recipe-name.nullius-benzene-combustion"},
    enabled = false,
    category = "combustion",
    subgroup = "combustion",
    order = "nullius-fd",
    energy_required = 1,
    ingredients = {
      {type="fluid", name="nullius-benzene", amount=8},
      {type="fluid", name="nullius-oxygen", amount=125}
    },
    results = {
      {type="fluid", name="nullius-steam", amount=425},
      {type="fluid", name="nullius-carbon-dioxide", amount=75}
    },
    main_product = "nullius-steam"
  },
  {
    type = "recipe",
    name = "nullius-biodiesel-combustion",
    localised_name = {"recipe-name.nullius-biodiesel-combustion"},
    icon_size = 64,
    enabled = false,
    category = "combustion",
    subgroup = "combustion",
    order = "nullius-fe",
    energy_required = 1,
    ingredients = {
      {type="fluid", name="nullius-biodiesel", amount=8},
      {type="fluid", name="nullius-compressed-oxygen", amount=40}
    },
    results = {
      {type="fluid", name="nullius-steam", amount=1000},
      {type="fluid", name="nullius-compressed-carbon-dioxide", amount=15}
    },
    main_product = "nullius-steam"
  },

  {
    type = "recipe",
    name = "nullius-methane-to-graphite",
    enabled = false,
    category = "wet-smelting",
    subgroup = "organic-material-1",
    order = "nullius-bd",
    energy_required = 1,
    ingredients = {
      {type="fluid", name="nullius-methane", amount=50}
    },
    results = {
      {type="item", name="nullius-graphite", amount=2},
      {type="fluid", name="nullius-hydrogen", amount=60}
    }
  },
  {
    type = "recipe",
    name = "nullius-pressure-methane-to-graphite",
    enabled = false,
    category = "wet-smelting",
    subgroup = "organic-material-1",
    order = "nullius-be",
    energy_required = 1,
    ingredients = {
      {type="fluid", name="nullius-compressed-methane", amount=25}
    },
    results = {
      {type="item", name="nullius-graphite", amount=4},
      {type="fluid", name="nullius-compressed-hydrogen", amount=30}
    }
  },
  {
    type = "recipe",
    name = "nullius-boxed-graphite",
    enabled = false,
    category = "bulk-smelting",
    subgroup = "boxed-organic-1",
    order = "nullius-bd",
    energy_required = 1,
    ingredients = {
      {type="fluid", name="nullius-methane", amount=250}
    },
    results = {
      {type="item", name="nullius-box-graphite", amount=2},
      {type="fluid", name="nullius-hydrogen", amount=300}
    },
    main_product = "nullius-box-graphite"
  },
  {
    type = "recipe",
    name = "nullius-boxed-pressure-graphite",
    localised_name = {"recipe-name.nullius-pressure", {"item-name.nullius-box", {"item-name.nullius-graphite"}}},
    enabled = false,
    category = "bulk-smelting",
    subgroup = "boxed-organic-1",
    order = "nullius-be",
    energy_required = 1,
    ingredients = {
      {type="fluid", name="nullius-compressed-methane", amount=125}
    },
    results = {
      {type="item", name="nullius-box-graphite", amount=4},
      {type="fluid", name="nullius-compressed-hydrogen", amount=150}
    },
    main_product = "nullius-box-graphite"
  },

  {
    type = "recipe",
    name = "nullius-ethylene-pyrolysis",
    localised_name = {"recipe-name.nullius-ethylene-pyrolysis"},
    enabled = false,
    category = "distillation",
    subgroup = "carbon",
    order = "nullius-pb",
    energy_required = 3,
    ingredients = {
      {type="fluid", name="nullius-ethylene", amount=120}
    },
    results = {
      {type="fluid", name="nullius-methane", amount=50},
      {type="fluid", name="nullius-propene", amount=25},
      {type="fluid", name="nullius-benzene", amount=4}
    },
    main_product = "nullius-methane"
  },
  {
    type = "recipe",
    name = "nullius-propene-pyrolysis",
    localised_name = {"recipe-name.nullius-propene-pyrolysis"},
    enabled = false,
    category = "distillation",
    subgroup = "carbon",
    order = "nullius-pc",
    energy_required = 3,
    ingredients = {
      {type="fluid", name="nullius-propene", amount=80}
    },
    results = {
      {type="fluid", name="nullius-methane", amount=30},
      {type="fluid", name="nullius-ethylene", amount=40},
      {type="fluid", name="nullius-benzene", amount=6}
    },
    main_product = "nullius-methane"
  },
  {
    type = "recipe",
    name = "nullius-methane-reforming",
    localised_name = {"recipe-name.nullius-reforming", {"fluid-name.nullius-methane"}},
    enabled = false,
    category = "distillation",
    subgroup = "compressed-organic",
    order = "nullius-g",
    energy_required = 1,
    ingredients = {
      {type="fluid", name="nullius-compressed-methane", amount=20},
      {type="fluid", name="nullius-compressed-carbon-dioxide", amount=20}
    },
    results = {
      {type="fluid", name="nullius-compressed-hydrogen", amount=30},
      {type="fluid", name="nullius-compressed-carbon-monoxide", amount=25}
    },
    main_product = "nullius-compressed-carbon-monoxide"
  },
  {
    type = "recipe",
    name = "nullius-benzene-reforming",
    localised_name = {"recipe-name.nullius-reforming", {"fluid-name.nullius-benzene"}},
    enabled = false,
    category = "distillation",
    subgroup = "carbon",
    order = "nullius-q",
    energy_required = 1,
    ingredients = {
      {type="fluid", name="nullius-benzene", amount=10},
      {type="fluid", name="nullius-steam", amount=125}
    },
    results = {
      {type="fluid", name="nullius-hydrogen", amount=80},
      {type="fluid", name="nullius-carbon-monoxide", amount=40},
      {type="fluid", name="nullius-carbon-dioxide", amount=25}
    },
    main_product = "nullius-carbon-monoxide"
  }
})

  {
    type = "recipe",
    name = "nullius-canister-emptying",
    enabled = false,
    category = "nullius-unbarrel",
    icon = ICONPATH .. "canister-water.png",
    icon_size = 64,
    subgroup = "canisters",
    order = "nullius-h",
    crafting_machine_tint = {
      primary = data.raw.fluid["nullius-water"].flow_color,
      secondary = data.raw.fluid["nullius-water"].flow_color
    },
    energy_required = 0.2,
    no_productivity = true,
    ingredients = {
      {type="item", name="nullius-water-canister", amount=1}
    },
    results = {
      {type="item", name="nullius-canister", amount=1},
      {type="fluid", name="nullius-water", amount=50}
    }
  },
  {
    type = "recipe",
    name = "nullius-boxed-canister-emptying",
    localised_name = {"recipe-name.nullius-boxed", {"recipe-name.nullius-canister-emptying"}},
    enabled = false,
    category = "nullius-unbarrel",
    subgroup = "boxed-canister",
    order = "nullius-h",
    crafting_machine_tint = {
      primary = data.raw.fluid["nullius-water"].flow_color,
      secondary = data.raw.fluid["nullius-water"].flow_color
    },
    energy_required = 1,
    no_productivity = true,
    ingredients = {
      {type="item", name="nullius-box-water-canister", amount=1}
    },
    results = {
      {type="item", name="nullius-box-canister", amount=1},
      {type="fluid", name="nullius-water", amount=250}
    }
  },

  {
    type = "recipe",
    name = "nullius-hydrogen-canister-1",
    enabled = false,
    show_amount_in_title = false,
    always_show_products = true,
    category = "basic-chemistry",
    order = "nullius-db",
    crafting_machine_tint = {
      primary = data.raw.fluid["nullius-hydrogen"].flow_color,
      secondary = data.raw.fluid["nullius-oxygen"].flow_color
    },
    energy_required = 2,
    no_productivity = true,
    ingredients = {
      {type="item", name="nullius-canister", amount=1},
      {type="fluid", name="nullius-hydrogen", amount=300, fluidbox_index=1},
      {type="fluid", name="nullius-oxygen", amount=150, fluidbox_index=2}
    },
    result = "nullius-hydrogen-canister"
  },
  {
    type = "recipe",
    name = "nullius-boxed-hydrogen-canister-1",
    enabled = false,
    show_amount_in_title = false,
    always_show_products = true,
    category = "basic-chemistry",
    subgroup = "boxed-canister",
    order = "nullius-db",
    crafting_machine_tint = {
      primary = data.raw.fluid["nullius-hydrogen"].flow_color,
      secondary = data.raw.fluid["nullius-oxygen"].flow_color
    },
    energy_required = 10,
    no_productivity = true,
    ingredients = {
      {type="item", name="nullius-box-canister", amount=1},
      {type="fluid", name="nullius-hydrogen", amount=1500, fluidbox_index=1},
      {type="fluid", name="nullius-oxygen", amount=750, fluidbox_index=2}
    },
    result = "nullius-box-hydrogen-canister"
  },
  {
    type = "recipe",
    name = "nullius-hydrogen-canister-2",
    localised_name = {"recipe-name.nullius-pressure", {"item-name.nullius-hydrogen-canister"}},
    enabled = false,
    show_amount_in_title = false,
    always_show_products = true,
    category = "basic-chemistry",
    order = "nullius-dc",
    crafting_machine_tint = {
      primary = data.raw.fluid["nullius-hydrogen"].flow_color,
      secondary = data.raw.fluid["nullius-oxygen"].flow_color
    },
    energy_required = 0.5,
    no_productivity = true,
    ingredients = {
      {type="item", name="nullius-canister", amount=1},
      {type="fluid", name="nullius-compressed-hydrogen", amount=70, fluidbox_index=1},
      {type="fluid", name="nullius-compressed-oxygen", amount=35, fluidbox_index=2}
    },
    result = "nullius-hydrogen-canister"
  },
  {
    type = "recipe",
    name = "nullius-boxed-hydrogen-canister-2",
    localised_name = {"recipe-name.nullius-pressure",
        {"item-name.nullius-box", {"item-name.nullius-hydrogen-canister"}}},
    enabled = false,
    show_amount_in_title = false,
    always_show_products = true,
    category = "basic-chemistry",
    subgroup = "boxed-canister",
    order = "nullius-dc",
    crafting_machine_tint = {
      primary = data.raw.fluid["nullius-hydrogen"].flow_color,
      secondary = data.raw.fluid["nullius-oxygen"].flow_color
    },
    energy_required = 2.5,
    no_productivity = true,
    ingredients = {
      {type="item", name="nullius-box-canister", amount=1},
      {type="fluid", name="nullius-compressed-hydrogen", amount=350, fluidbox_index=1},
      {type="fluid", name="nullius-compressed-oxygen", amount=175, fluidbox_index=2}
    },
    result = "nullius-box-hydrogen-canister"
  },

  {
    type = "recipe",
    name = "nullius-methanol-canister-1",
    enabled = false,
    show_amount_in_title = false,
    always_show_products = true,
    category = "basic-chemistry",
    order = "nullius-eb",
    crafting_machine_tint = {
      primary = data.raw.fluid["nullius-methanol"].flow_color,
      secondary = data.raw.fluid["nullius-oxygen"].flow_color
    },
    energy_required = 3,
    no_productivity = true,
    ingredients = {
      {type="item", name="nullius-canister", amount=1},
      {type="fluid", name="nullius-methanol", amount=32},
      {type="fluid", name="nullius-oxygen", amount=420},
      {type="fluid", name="nullius-benzene", amount=3}
    },
    result = "processed-fuel"
  },
  {
    type = "recipe",
    name = "nullius-boxed-methanol-canister-1",
    enabled = false,
    show_amount_in_title = false,
    always_show_products = true,
    category = "basic-chemistry",
    subgroup = "boxed-canister",
    order = "nullius-eb",
    crafting_machine_tint = {
      primary = data.raw.fluid["nullius-methanol"].flow_color,
      secondary = data.raw.fluid["nullius-oxygen"].flow_color
    },
    energy_required = 15,
    no_productivity = true,
    ingredients = {
      {type="item", name="nullius-box-canister", amount=1},
      {type="fluid", name="nullius-methanol", amount=160},
      {type="fluid", name="nullius-oxygen", amount=2100},
      {type="fluid", name="nullius-benzene", amount=15}
    },
    result = "nullius-box-methanol-canister"
  },
  {
    type = "recipe",
    name = "nullius-methanol-canister-2",
    localised_name = {"recipe-name.nullius-pressure", {"item-name.nullius-methanol-canister"}},
    enabled = false,
    show_amount_in_title = false,
    always_show_products = true,
    category = "basic-chemistry",
    order = "nullius-ec",
    crafting_machine_tint = {
      primary = data.raw.fluid["nullius-methanol"].flow_color,
      secondary = data.raw.fluid["nullius-oxygen"].flow_color
    },
    energy_required = 1,
    no_productivity = true,
    ingredients = {
      {type="item", name="nullius-canister", amount=1},
      {type="fluid", name="nullius-methanol", amount=28},
      {type="fluid", name="nullius-compressed-oxygen", amount=95},
      {type="fluid", name="nullius-benzene", amount=2}
    },
    result = "processed-fuel"
  },
  {
    type = "recipe",
    name = "nullius-boxed-methanol-canister-2",
    localised_name = {"recipe-name.nullius-pressure", {"item-name.nullius-methanol-canister"}},
    enabled = false,
    show_amount_in_title = false,
    always_show_products = true,
    category = "basic-chemistry",
    subgroup = "boxed-canister",
    order = "nullius-ec",
    crafting_machine_tint = {
      primary = data.raw.fluid["nullius-methanol"].flow_color,
      secondary = data.raw.fluid["nullius-oxygen"].flow_color
    },
    energy_required = 5,
    no_productivity = true,
    ingredients = {
      {type="item", name="nullius-box-canister", amount=1},
      {type="fluid", name="nullius-methanol", amount=140},
      {type="fluid", name="nullius-compressed-oxygen", amount=375},
      {type="fluid", name="nullius-benzene", amount=10}
    },
    result = "nullius-box-methanol-canister"
  },
  {
    type = "recipe",
    name = "nullius-biodiesel-canister",
    enabled = false,
    show_amount_in_title = false,
    always_show_products = true,
    no_productivity = true,
    category = "small-assembly",
    order = "nullius-fc",
    energy_required = 1,
    ingredients = {
      {type="item", name="nullius-canister", amount=1},
      {type="fluid", name="nullius-biodiesel", amount=32},
      {type="fluid", name="nullius-compressed-oxygen", amount=160}
    },
    result = "nullius-biodiesel-canister"
  },
  {
    type = "recipe",
    name = "nullius-boxed-biodiesel-canister",
    enabled = false,
    show_amount_in_title = false,
    always_show_products = true,
    no_productivity = true,
    category = "small-assembly",
    subgroup = "boxed-canister",
    order = "nullius-fc",
    energy_required = 5,
    ingredients = {
      {type="item", name="nullius-box-canister", amount=1},
      {type="fluid", name="nullius-biodiesel", amount=160},
      {type="fluid", name="nullius-compressed-oxygen", amount=800}
    },
    result = "nullius-box-biodiesel-canister"
  },

  {
    type = "recipe",
    name = "nullius-rocket-fuel",
    enabled = false,
    show_amount_in_title = false,
    always_show_products = true,
    category = "basic-chemistry",
    crafting_machine_tint = {
      primary = data.raw.fluid["nullius-ammonia"].flow_color,
      secondary = data.raw.fluid["nullius-acid-hydrochloric"].flow_color
    },
    energy_required = 30,
    ingredients = {
      {type="item", name="processed-fuel", amount=1},
      {type="fluid", name="nullius-ammonia", amount=240},
      {type="fluid", name="nullius-acid-hydrochloric", amount=300},
      {type="fluid", name="nullius-compressed-oxygen", amount=150},
      {type="item", name="nullius-salt", amount=5},
      {type="item", name="nullius-iron-oxide", amount=3},
      {type="item", name="nullius-aluminum-wire", amount=20},
      {type="item", name="nullius-rubber", amount=14},
      {type="item", name="cliff-explosives", amount=2}
    },
    results = {
      {type="item", name="rocket-fuel", amount=3},
      {type="fluid", name="nullius-wastewater", amount=200}
    },
    main_product = "rocket-fuel"
  },
  {
    type = "recipe",
    name = "nullius-boxed-rocket-fuel",
    enabled = false,
    show_amount_in_title = false,
    always_show_products = true,
    category = "basic-chemistry",
    subgroup = "boxed-canister",
    crafting_machine_tint = {
      primary = data.raw.fluid["nullius-ammonia"].flow_color,
      secondary = data.raw.fluid["nullius-acid-hydrochloric"].flow_color
    },
    energy_required = 150,
    ingredients = {
      {type="item", name="nullius-box-methanol-canister", amount=1},
      {type="fluid", name="nullius-ammonia", amount=1200},
      {type="fluid", name="nullius-acid-hydrochloric", amount=1500},
      {type="fluid", name="nullius-compressed-oxygen", amount=750},
      {type="item", name="nullius-box-salt", amount=5},
      {type="item", name="nullius-box-iron-oxide", amount=3},
      {type="item", name="nullius-box-aluminum-wire", amount=20},
      {type="item", name="nullius-box-rubber", amount=14},
      {type="item", name="nullius-box-explosive", amount=2}
    },
    results = {
      {type="item", name="nullius-box-rocket-fuel", amount=3},
      {type="fluid", name="nullius-wastewater", amount=1000}
    },
    main_product = "nullius-box-rocket-fuel"
  },

  {
    type = "recipe",
    name = "nullius-compressed-air",
    enabled = false,
    show_amount_in_title = false,
    always_show_products = true,
    category = "compression",
    energy_required = 1,
    ingredients = {
      {type="fluid", name="nullius-air", amount=260}
    },
    results = {
      {type="fluid", name="nullius-compressed-air", amount=65}
    },
    main_product = "nullius-compressed-air"
  },
  {
    type = "recipe",
    name = "nullius-compressed-nitrogen",
    enabled = false,
    show_amount_in_title = false,
    always_show_products = true,
    category = "compression",
    energy_required = 1,
    ingredients = {
      {type="fluid", name="nullius-nitrogen", amount=208}
    },
    results = {
      {type="fluid", name="nullius-compressed-nitrogen", amount=52}
    },
    main_product = "nullius-compressed-nitrogen"
  },
  {
    type = "recipe",
    name = "nullius-compressed-argon",
    enabled = false,
    show_amount_in_title = false,
    always_show_products = true,
    category = "compression",
    energy_required = 1,
    ingredients = {
      {type="fluid", name="nullius-argon", amount=160}
    },
    results = {
      {type="fluid", name="nullius-compressed-argon", amount=40}
    },
    main_product = "nullius-compressed-argon"
  },
  {
    type = "recipe",
    name = "nullius-compressed-helium",
    enabled = false,
    show_amount_in_title = false,
    always_show_products = true,
    category = "compression",
    energy_required = 1,
    ingredients = {
      {type="fluid", name="nullius-helium", amount=80}
    },
    results = {
      {type="fluid", name="nullius-compressed-helium", amount=32}
    },
    main_product = "nullius-compressed-helium"
  },
  {
    type = "recipe",
    name = "nullius-compressed-hydrogen",
    enabled = false,
    show_amount_in_title = false,
    always_show_products = true,
    category = "compression",
    energy_required = 1,
    ingredients = {
      {type="fluid", name="nullius-hydrogen", amount=960}
    },
    results = {
      {type="fluid", name="nullius-compressed-hydrogen", amount=240}
    },
    main_product = "nullius-compressed-hydrogen"
  },
  {
    type = "recipe",
    name = "nullius-compressed-oxygen",
    enabled = false,
    show_amount_in_title = false,
    always_show_products = true,
    category = "compression",
    energy_required = 1,
    ingredients = {
      {type="fluid", name="nullius-oxygen", amount=960}
    },
    results = {
      {type="fluid", name="nullius-compressed-oxygen", amount=240}
    },
    main_product = "nullius-compressed-oxygen"
  },
  {
    type = "recipe",
    name = "nullius-compressed-carbon-dioxide",
    enabled = false,
    show_amount_in_title = false,
    always_show_products = true,
    category = "compression",
    energy_required = 1,
    ingredients = {
      {type="fluid", name="nullius-carbon-dioxide", amount=320}
    },
    results = {
      {type="fluid", name="nullius-compressed-carbon-dioxide", amount=80}
    },
    main_product = "nullius-compressed-carbon-dioxide"
  },
  {
    type = "recipe",
    name = "nullius-compressed-carbon-monoxide",
    enabled = false,
    show_amount_in_title = false,
    always_show_products = true,
    category = "compression",
    energy_required = 1,
    ingredients = {
      {type="fluid", name="nullius-carbon-monoxide", amount=480}
    },
    results = {
      {type="fluid", name="nullius-compressed-carbon-monoxide", amount=120}
    },
    main_product = "nullius-compressed-carbon-monoxide"
  },
  {
    type = "recipe",
    name = "nullius-compressed-methane",
    enabled = false,
    show_amount_in_title = false,
    always_show_products = true,
    category = "compression",
    energy_required = 1,
    ingredients = {
      {type="fluid", name="nullius-methane", amount=640}
    },
    results = {
      {type="fluid", name="nullius-compressed-methane", amount=160}
    },
    main_product = "nullius-compressed-methane"
  },

  {
    type = "recipe",
    name = "nullius-decompress-air",
    localised_name = {"recipe-name.nullius-decompress-air"},
    enabled = false,
    show_amount_in_title = false,
    always_show_products = true,
    category = "decompression",
    subgroup = "decompression",
    order = "nullius-b",
    energy_required = 1,
    ingredients = {
      {type="fluid", name="nullius-compressed-air", amount=125}
    },
    results = {
      {type="fluid", name="nullius-air", amount=500}
    },
    main_product = "nullius-air"
  },
  {
    type = "recipe",
    name = "nullius-decompress-nitrogen",
    localised_name = {"recipe-name.nullius-decompress-nitrogen"},
    enabled = false,
    show_amount_in_title = false,
    always_show_products = true,
    category = "decompression",
    subgroup = "decompression",
    order = "nullius-c",
    energy_required = 1,
    ingredients = {
      {type="fluid", name="nullius-compressed-nitrogen", amount=150}
    },
    results = {
      {type="fluid", name="nullius-nitrogen", amount=600}
    },
    main_product = "nullius-nitrogen"
  },
  {
    type = "recipe",
    name = "nullius-decompress-argon",
    localised_name = {"recipe-name.nullius-decompress-argon"},
    enabled = false,
    show_amount_in_title = false,
    always_show_products = true,
    category = "decompression",
    subgroup = "decompression",
    order = "nullius-d",
    energy_required = 1,
    ingredients = {
      {type="fluid", name="nullius-compressed-argon", amount=125}
    },
    results = {
      {type="fluid", name="nullius-argon", amount=500}
    },
    main_product = "nullius-argon"
  },
  {
    type = "recipe",
    name = "nullius-decompress-helium",
    localised_name = {"recipe-name.nullius-decompress-helium"},
    enabled = false,
    show_amount_in_title = false,
    always_show_products = true,
    category = "decompression",
    subgroup = "decompression",
    order = "nullius-e",
    energy_required = 1,
    ingredients = {
      {type="fluid", name="nullius-compressed-helium", amount=128}
    },
    results = {
      {type="fluid", name="nullius-helium", amount=320}
    },
    main_product = "nullius-helium"
  },
  {
    type = "recipe",
    name = "nullius-decompress-hydrogen",
    localised_name = {"recipe-name.nullius-decompress-hydrogen"},
    enabled = false,
    show_amount_in_title = false,
    always_show_products = true,
    category = "decompression",
    subgroup = "decompression",
    order = "nullius-f",
    energy_required = 1,
    ingredients = {
      {type="fluid", name="nullius-compressed-hydrogen", amount=125}
    },
    results = {
      {type="fluid", name="nullius-hydrogen", amount=500}
    },
    main_product = "nullius-hydrogen"
  },
  {
    type = "recipe",
    name = "nullius-decompress-oxygen",
    localised_name = {"recipe-name.nullius-decompress-oxygen"},
    enabled = false,
    show_amount_in_title = false,
    always_show_products = true,
    category = "decompression",
    subgroup = "decompression",
    order = "nullius-g",
    energy_required = 1,
    ingredients = {
      {type="fluid", name="nullius-compressed-oxygen", amount=125}
    },
    results = {
      {type="fluid", name="nullius-oxygen", amount=500}
    },
    main_product = "nullius-oxygen"
  },
  {
    type = "recipe",
    name = "nullius-decompress-carbon-dioxide",
    localised_name = {"recipe-name.nullius-decompress-carbon-dioxide"},
    enabled = false,
    show_amount_in_title = false,
    always_show_products = true,
    category = "decompression",
    subgroup = "decompression",
    order = "nullius-h",
    energy_required = 1,
    ingredients = {
      {type="fluid", name="nullius-compressed-carbon-dioxide", amount=150}
    },
    results = {
      {type="fluid", name="nullius-carbon-dioxide", amount=600}
    },
    main_product = "nullius-carbon-dioxide"
  },
  {
    type = "recipe",
    name = "nullius-decompress-carbon-monoxide",
    localised_name = {"recipe-name.nullius-decompress-carbon-monoxide"},
    enabled = false,
    show_amount_in_title = false,
    always_show_products = true,
    category = "decompression",
    subgroup = "decompression",
    order = "nullius-i",
    energy_required = 1,
    ingredients = {
      {type="fluid", name="nullius-compressed-carbon-monoxide", amount=150}
    },
    results = {
      {type="fluid", name="nullius-carbon-monoxide", amount=600}
    },
    main_product = "nullius-carbon-monoxide"
  },
  {
    type = "recipe",
    name = "nullius-decompress-methane",
    localised_name = {"recipe-name.nullius-decompress-methane"},
    enabled = false,
    show_amount_in_title = false,
    always_show_products = true,
    category = "decompression",
    subgroup = "decompression",
    order = "nullius-j",
    energy_required = 1,
    ingredients = {
      {type="fluid", name="nullius-compressed-methane", amount=150}
    },
    results = {
      {type="fluid", name="nullius-methane", amount=600}
    },
    main_product = "nullius-methane"
  },

  {
    type = "recipe",
    name = "nullius-sludge-disposal-1",
    localised_name = {"recipe-name.nullius-sludge-disposal-1"},
    enabled = false,
    show_amount_in_title = false,
    always_show_products = true,
    category = "nullius-water-treatment",
    subgroup = "waste-management",
    order = "nullius-bb",
    energy_required = 1,
    no_productivity = true,
    ingredients = {
      {type="fluid", name="nullius-sludge", amount=40},
      {type="fluid", name="nullius-seawater", amount=200}
    },
    results = {
      {type="fluid", name="nullius-wastewater", amount=120}
    },
    main_product = "nullius-wastewater"
  },
  {
    type = "recipe",
    name = "nullius-sludge-disposal-2",
    localised_name = {"recipe-name.nullius-sludge-disposal-2"},
    enabled = false,
    show_amount_in_title = false,
    always_show_products = true,
    category = "nullius-water-treatment",
    subgroup = "waste-management",
    order = "nullius-bc",
    energy_required = 1,
    no_productivity = true,
    ingredients = {
      {type="fluid", name="nullius-sludge", amount=75},
      {type="fluid", name="nullius-freshwater", amount=150}
    },
    results = {
      {type="fluid", name="nullius-wastewater", amount=250}
    },
    main_product = "nullius-wastewater"
  },
  {
    type = "recipe",
    name = "nullius-sand-disposal",
    localised_name = {"recipe-name.nullius-sand-disposal"},
    enabled = false,
    show_amount_in_title = false,
    always_show_products = true,
    category = "nullius-water-treatment",
    subgroup = "waste-management",
    order = "nullius-c",
    energy_required = 1,
    no_productivity = true,
    ingredients = {
      {type="item", name="nullius-sand", amount=4},
      {type="fluid", name="nullius-seawater", amount=80}
    },
    results = {
      {type="fluid", name="nullius-wastewater", amount=100}
    },
    main_product = "nullius-wastewater"
  },
  {
    type = "recipe",
    name = "nullius-dust-disposal-1",
    localised_name = {"recipe-name.nullius-dust-disposal-1"},
    enabled = false,
    category = "ore-flotation",
    subgroup = "waste-management",
    order = "nullius-eb",
    energy_required = 1,
    ingredients = {
      {type="item", name="nullius-mineral-dust", amount=1},
      {type="fluid", name="nullius-acid-hydrochloric", amount=6, fluidbox_index=1}
    },
    results = {
      {type="fluid", name="nullius-sludge", amount=6},
      {type="fluid", name="nullius-carbon-dioxide", amount=5}
    },
    main_product = "nullius-sludge"
  },
  {
    type = "recipe",
    name = "nullius-boxed-sludge-1",
    localised_name = {"recipe-name.nullius-boxed", {"", {"fluid-name.nullius-sludge"}, " ", 1}},
    enabled = false,
    category = "ore-flotation",
    subgroup = "boxed-fluid",
    order = "nullius-sb",
    energy_required = 5,
    ingredients = {
      {type="item", name="nullius-box-mineral-dust", amount=1},
      {type="fluid", name="nullius-acid-hydrochloric", amount=30, fluidbox_index=1}
    },
    results = {
      {type="fluid", name="nullius-sludge", amount=30},
      {type="fluid", name="nullius-carbon-dioxide", amount=25}
    },
    main_product = "nullius-sludge"
  },
  {
    type = "recipe",
    name = "nullius-dust-disposal-2",
    localised_name = {"recipe-name.nullius-dust-disposal-2"},
    enabled = false,
    category = "ore-flotation",
    subgroup = "waste-management",
    order = "nullius-ec",
    energy_required = 1,
    ingredients = {
      {type="item", name="nullius-mineral-dust", amount=3},
      {type="fluid", name="nullius-acid-sulfuric", amount=8, fluidbox_index=1}
    },
    results = {
      {type="fluid", name="nullius-sludge", amount=20},
      {type="fluid", name="nullius-carbon-dioxide", amount=18}
    },
    main_product = "nullius-sludge"
  },
  {
    type = "recipe",
    name = "nullius-boxed-sludge-2",
    localised_name = {"recipe-name.nullius-boxed", {"", {"fluid-name.nullius-sludge"}, " ", 2}},
    enabled = false,
    category = "ore-flotation",
    subgroup = "boxed-fluid",
    order = "nullius-sc",
    energy_required = 5,
    ingredients = {
      {type="item", name="nullius-box-mineral-dust", amount=3},
      {type="fluid", name="nullius-acid-sulfuric", amount=40, fluidbox_index=1}
    },
    results = {
      {type="fluid", name="nullius-sludge", amount=100},
      {type="fluid", name="nullius-carbon-dioxide", amount=90}
    },
    main_product = "nullius-sludge"
  },

  {
    type = "recipe",
    name = "nullius-plastic",
    localised_name = {"recipe-name.nullius-pvc"},
    enabled = false,
    category = "basic-chemistry",
    order = "nullius-bb",
    crafting_machine_tint = {
      primary = data.raw.fluid["nullius-ethylene"].flow_color,
      secondary = data.raw.fluid["nullius-chlorine"].flow_color
    },
    energy_required = 3,
    ingredients = {
      {type="fluid", name="nullius-ethylene", amount=30},
      {type="fluid", name="nullius-chlorine", amount=30}
    },
    results = {
      {type="item", name="nullius-plastic", amount=1},
      {type="fluid", name="nullius-hydrogen-chloride", amount=20}
    },
    main_product = "nullius-plastic"
  },
  {
    type = "recipe",
    name = "nullius-polypropylene",
    localised_name = {"recipe-name.nullius-polypropylene"},
    show_amount_in_title = false,
    always_show_products = true,
    enabled = false,
    category = "ore-flotation",
    order = "nullius-bc",
    crafting_machine_tint = {
      primary = data.raw.fluid["nullius-propene"].flow_color,
      secondary = data.raw.fluid["nullius-ethylene"].flow_color
    },
    energy_required = 8,
    ingredients = {
      {type="fluid", name="nullius-propene", amount=45},
      {type="fluid", name="nullius-ethylene", amount=5}
    },
    result = "nullius-plastic",
    result_count = 4
  },
  {
    type = "recipe",
    name = "nullius-plastic-pc-abs",
    localised_name = {"recipe-name.nullius-pc-abs"},
    show_amount_in_title = false,
    always_show_products = true,
    enabled = false,
    category = "basic-chemistry",
    order = "nullius-bd",
    crafting_machine_tint = {
      primary = data.raw.fluid["nullius-acrylonitrile"].flow_color,
      secondary = data.raw.fluid["nullius-styrene"].flow_color
    },
    energy_required = 8,
    ingredients = {
      {type="item", name="nullius-bpa", amount=1},
      {type="fluid", name="nullius-butadiene", amount=6},
      {type="fluid", name="nullius-styrene", amount=4},
      {type="fluid", name="nullius-acrylonitrile", amount=3}
    },
    result = "nullius-plastic",
    result_count = 8
  },
  {
    type = "recipe",
    name = "nullius-boxed-plastic",
    show_amount_in_title = false,
    always_show_products = true,
    enabled = false,
    category = "basic-chemistry",
      subgroup = "boxed-organic-1",
    crafting_machine_tint = {
      primary = data.raw.fluid["nullius-acrylonitrile"].flow_color,
      secondary = data.raw.fluid["nullius-styrene"].flow_color
    },
    energy_required = 40,
    ingredients = {
      {type="item", name="nullius-box-bpa", amount=1},
      {type="fluid", name="nullius-butadiene", amount=30},
      {type="fluid", name="nullius-styrene", amount=20},
      {type="fluid", name="nullius-acrylonitrile", amount=15}
    },
    result = "nullius-box-plastic",
    result_count = 8
  },

  {
    type = "recipe",
    name = "nullius-lubricant",
    enabled = false,
    category = "basic-chemistry",
    subgroup = "organic-chemistry",
    order = "nullius-e",
    crafting_machine_tint = {
      primary = data.raw.fluid["nullius-methane"].flow_color,
      secondary = data.raw.fluid["nullius-hydrogen-chloride"].flow_color
    },
    energy_required = 4,
    ingredients = {
      {type="item", name="nullius-silicon-ingot", amount=1},
      {type="fluid", name="nullius-methanol", amount=12, fluidbox_index=1},
      {type="fluid", name="nullius-hydrogen-chloride", amount=50, fluidbox_index=2}
    },
    results = {
      {type="fluid", name="nullius-lubricant", amount=10},
      {type="fluid", name="nullius-acid-hydrochloric", amount=12}
    },
    main_product = "nullius-lubricant"
  },
  {
    type = "recipe",
    name = "nullius-boxed-lubricant",
    localised_name = {"recipe-name.nullius-boxed", {"fluid-name.nullius-lubricant"}},
    enabled = false,
    category = "basic-chemistry",
    subgroup = "boxed-fluid",
    order = "nullius-e",
    crafting_machine_tint = {
      primary = data.raw.fluid["nullius-methane"].flow_color,
      secondary = data.raw.fluid["nullius-hydrogen-chloride"].flow_color
    },
    energy_required = 20,
    ingredients = {
      {type="item", name="nullius-box-silicon-ingot", amount=1},
      {type="fluid", name="nullius-methanol", amount=60, fluidbox_index=1},
      {type="fluid", name="nullius-hydrogen-chloride", amount=250, fluidbox_index=2}
    },
    results = {
      {type="fluid", name="nullius-lubricant", amount=50},
      {type="fluid", name="nullius-acid-hydrochloric", amount=60}
    },
    main_product = "nullius-lubricant"
  },

  {
    type = "recipe",
    name = "nullius-solvent",
    enabled = false,
    category = "basic-chemistry",
    crafting_machine_tint = {
      primary = data.raw.fluid["nullius-methane"].flow_color,
      secondary = data.raw.fluid["nullius-oxygen"].flow_color
    },
    energy_required = 3,
    ingredients = {
      {type="fluid", name="nullius-methanol", amount=20},
      {type="fluid", name="nullius-carbon-monoxide", amount=40},
      {type="fluid", name="nullius-oxygen", amount=20}
    },
    results = {
      {type="fluid", name="nullius-solvent", amount=10},
      {type="fluid", name="nullius-wastewater", amount=10}
    },
    main_product = "nullius-solvent"
  },
  {
    type = "recipe",
    name = "nullius-pressure-solvent",
    localised_name = {"recipe-name.nullius-pressure-solvent"},
    icons = angelsmods.functions.create_liquid_recipe_icon(nil,
      {element_tint["solvent"], element_tint["solvent"], element_tint["solvent"]},
      nil
    ),
    enabled = false,
    category = "basic-chemistry",
    subgroup = "compressed-organic",
    order = "nullius-i",
    crafting_machine_tint = {
      primary = data.raw.fluid["nullius-methane"].flow_color,
      secondary = data.raw.fluid["nullius-oxygen"].flow_color
    },
    energy_required = 3,
    ingredients = {
      {type="fluid", name="nullius-methanol", amount=40},
      {type="fluid", name="nullius-compressed-carbon-monoxide", amount=20},
      {type="fluid", name="nullius-compressed-oxygen", amount=10}
    },
    results = {
      {type="fluid", name="nullius-solvent", amount=20},
      {type="fluid", name="nullius-wastewater", amount=20}
    },
    main_product = "nullius-solvent"
  },

  {
    type = "recipe",
    name = "nullius-bpa",
    enabled = false,
    category = "basic-chemistry",
    order = "nullius-cb",
    crafting_machine_tint = {
      primary = data.raw.fluid["nullius-benzene"].flow_color,
      secondary = data.raw.fluid["nullius-propene"].flow_color
    },
    energy_required = 3,
    ingredients = {
      {type="fluid", name="nullius-propene", amount=40},
      {type="fluid", name="nullius-oxygen", amount=120},
      {type="fluid", name="nullius-benzene", amount=10}
    },
    results = {
      {type="item", name="nullius-bpa", amount=5},
      {type="fluid", name="nullius-wastewater", amount=15},
      {type="fluid", name="nullius-carbon-dioxide", amount=50}
    },
    main_product = "nullius-bpa"
  },
  {
    type = "recipe",
    name = "nullius-pressure-bpa",
    enabled = false,
    category = "basic-chemistry",
    subgroup = "organic-material-1",
    order = "nullius-cc",
    crafting_machine_tint = {
      primary = data.raw.fluid["nullius-benzene"].flow_color,
      secondary = data.raw.fluid["nullius-propene"].flow_color
    },
    energy_required = 1,
    ingredients = {
      {type="fluid", name="nullius-propene", amount=24},
      {type="fluid", name="nullius-compressed-oxygen", amount=18},
      {type="fluid", name="nullius-benzene", amount=6}
    },
    results = {
      {type="item", name="nullius-bpa", amount=3},
      {type="fluid", name="nullius-wastewater", amount=9},
      {type="fluid", name="nullius-compressed-carbon-dioxide", amount=8}
    }
  },
  {
    type = "recipe",
    name = "nullius-boxed-bpa",
    enabled = false,
    category = "basic-chemistry",
    subgroup = "boxed-organic-1",
    order = "nullius-cb",
    crafting_machine_tint = {
      primary = data.raw.fluid["nullius-benzene"].flow_color,
      secondary = data.raw.fluid["nullius-propene"].flow_color
    },
    energy_required = 15,
    ingredients = {
      {type="fluid", name="nullius-propene", amount=200},
      {type="fluid", name="nullius-oxygen", amount=600},
      {type="fluid", name="nullius-benzene", amount=50}
    },
    results = {
      {type="item", name="nullius-box-bpa", amount=5},
      {type="fluid", name="nullius-wastewater", amount=75},
      {type="fluid", name="nullius-carbon-dioxide", amount=250}
    },
    main_product = "nullius-box-bpa"
  },
  {
    type = "recipe",
    name = "nullius-boxed-pressure-bpa",
    localised_name = {"recipe-name.nullius-pressure", {"item-name.nullius-box", {"item-name.nullius-bpa"}}},
    enabled = false,
    category = "basic-chemistry",
    subgroup = "boxed-organic-1",
    order = "nullius-cc",
    crafting_machine_tint = {
      primary = data.raw.fluid["nullius-benzene"].flow_color,
      secondary = data.raw.fluid["nullius-propene"].flow_color
    },
    energy_required = 5,
    ingredients = {
      {type="fluid", name="nullius-propene", amount=120},
      {type="fluid", name="nullius-compressed-oxygen", amount=90},
      {type="fluid", name="nullius-benzene", amount=30}
    },
    results = {
      {type="item", name="nullius-box-bpa", amount=3},
      {type="fluid", name="nullius-wastewater", amount=45},
      {type="fluid", name="nullius-compressed-carbon-dioxide", amount=40}
    }
  },

  {
    type = "recipe",
    name = "nullius-ech",
    localised_name = {"", {"fluid-name.nullius-ech"}, " ", 1},
    enabled = false,
    category = "basic-chemistry",
    crafting_machine_tint = {
      primary = data.raw.fluid["nullius-propene"].flow_color,
      secondary = data.raw.fluid["nullius-caustic-solution"].flow_color
    },
    energy_required = 1,
    ingredients = {
      {type="fluid", name="nullius-propene", amount=16},
      {type="fluid", name="nullius-chlorine", amount=30},
      {type="fluid", name="nullius-caustic-solution", amount=18}
    },
    results = {
      {type="fluid", name="nullius-ech", amount=5},
      {type="fluid", name="nullius-brine", amount=12}
    },
    main_product = "nullius-ech"
  },
  {
    type = "recipe",
    name = "nullius-glycerol",
    enabled = false,
    category = "basic-chemistry",
    crafting_machine_tint = {
      primary = data.raw.fluid["nullius-ech"].flow_color,
      secondary = data.raw.fluid["nullius-acid-hydrochloric"].flow_color
    },
    energy_required = 1,
    ingredients = {
      {type="fluid", name="nullius-ech", amount=12, fluidbox_index=1},
      {type="item", name="nullius-sodium-hydroxide", amount=4},
      {type="fluid", name="nullius-acid-hydrochloric", amount=60, fluidbox_index=2}
    },
    results = {
      {type="fluid", name="nullius-glycerol", amount=6},
      {type="fluid", name="nullius-wastewater", amount=60}
    },
    main_product = "nullius-glycerol"
  },
  {
    type = "recipe",
    name = "nullius-boxed-glycerol",
    localised_name = {"recipe-name.nullius-boxed", {"fluid-name.nullius-glycerol"}},
    enabled = false,
    category = "basic-chemistry",
    subgroup = "boxed-fluid",
    order = "nullius-g",
    crafting_machine_tint = {
      primary = data.raw.fluid["nullius-ech"].flow_color,
      secondary = data.raw.fluid["nullius-acid-hydrochloric"].flow_color
    },
    energy_required = 5,
    ingredients = {
      {type="fluid", name="nullius-ech", amount=60, fluidbox_index=1},
      {type="item", name="nullius-box-sodium-hydroxide", amount=4},
      {type="fluid", name="nullius-acid-hydrochloric", amount=300, fluidbox_index=2}
    },
    results = {
      {type="fluid", name="nullius-glycerol", amount=30},
      {type="fluid", name="nullius-wastewater", amount=300}
    },
    main_product = "nullius-glycerol"
  },
  {
    type = "recipe",
    name = "nullius-glycerol-to-ech",
    localised_name = {"", {"fluid-name.nullius-ech"}, " ", 2},
    icons = angelsmods.functions.create_liquid_recipe_icon(
        {{"__angelspetrochem__/graphics/icons/molecules/epichlorohydrin.png", 72}},
      {element_tint["carbon"], element_tint["chlorine"], element_tint["oxygen"]},
      {{"__angelspetrochem__/graphics/icons/molecules/glycerol.png", 72}}
    ),
    enabled = false,
    category = "basic-chemistry",
    crafting_machine_tint = {
      primary = data.raw.fluid["nullius-glycerol"].flow_color,
      secondary = data.raw.fluid["nullius-ech"].flow_color
    },
    energy_required = 1,
    ingredients = {
      {type="fluid", name="nullius-glycerol", amount=20},
      {type="fluid", name="nullius-caustic-solution", amount=50},
      {type="fluid", name="nullius-acid-hydrochloric", amount=60}
    },
    results = {
      {type="fluid", name="nullius-ech", amount=15},
      {type="fluid", name="nullius-wastewater", amount=90}
    },
    main_product = "nullius-ech"
  },

  {
    type = "recipe",
    name = "nullius-epoxy",
    enabled = false,
    category = "basic-chemistry",
    crafting_machine_tint = {
      primary = data.raw.fluid["nullius-ech"].flow_color,
      secondary = data.raw.fluid["nullius-solvent"].flow_color
    },
    energy_required = 1,
    ingredients = {
      {type="item", name="nullius-bpa", amount=3},
      {type="fluid", name="nullius-ech", amount=10, fluidbox_index=2},
      {type="fluid", name="nullius-solvent", amount=3, fluidbox_index=1}
    },
    results = {
      {type="fluid", name="nullius-epoxy", amount=8},
      {type="fluid", name="nullius-wastewater", amount=5}
    },
    main_product = "nullius-epoxy"
  },
  {
    type = "recipe",
    name = "nullius-boxed-epoxy",
    localised_name = {"recipe-name.nullius-boxed", {"fluid-name.nullius-epoxy"}},
    enabled = false,
    category = "basic-chemistry",
    subgroup = "boxed-fluid",
    order = "nullius-f",
    crafting_machine_tint = {
      primary = data.raw.fluid["nullius-ech"].flow_color,
      secondary = data.raw.fluid["nullius-solvent"].flow_color
    },
    energy_required = 5,
    ingredients = {
      {type="item", name="nullius-box-bpa", amount=3},
      {type="fluid", name="nullius-ech", amount=50, fluidbox_index=2},
      {type="fluid", name="nullius-solvent", amount=15, fluidbox_index=1}
    },
    results = {
      {type="fluid", name="nullius-epoxy", amount=40},
      {type="fluid", name="nullius-wastewater", amount=25}
    },
    main_product = "nullius-epoxy"
  },

  {
    type = "recipe",
    name = "nullius-limestone-recovery",
    localised_name = {"recipe-name.nullius-limestone-recovery"},
    enabled = false,
    allow_as_intermediate = false,
    allow_decomposition = false,
    category = "ore-flotation",
    subgroup = "calcium-product",
    order = "nullius-o",
    energy_required = 20,
    ingredients = {
      {type="fluid", name="nullius-sludge", amount=200},
      {type="item", name="nullius-soda-ash", amount=5},
      {type="fluid", name="nullius-freshwater", amount=250}
    },
    results = {
      {type="item", name="nullius-crushed-limestone", amount=8},
      {type="item", name="nullius-crushed-bauxite", amount=4},
      {type="fluid", name="nullius-wastewater", amount=200, fluidbox_index=1}
    },
    main_product = "nullius-crushed-limestone"
  },
  {
    type = "recipe",
    name = "nullius-iron-recovery",
    localised_name = {"recipe-name.nullius-iron-recovery"},
    enabled = false,
    allow_as_intermediate = false,
    allow_decomposition = false,
    category = "ore-flotation",
    subgroup = "iron-ingot",
    order = "nullius-o",
    energy_required = 20,
    ingredients = {
      {type="fluid", name="nullius-sludge", amount=200},
      {type="fluid", name="nullius-caustic-solution", amount=160}
    },
    results = {
      {type="item", name="nullius-crushed-iron-ore", amount=8},
      {type="item", name="nullius-crushed-limestone", amount=4},
      {type="fluid", name="nullius-wastewater", amount=150, fluidbox_index=1}
    },
    main_product = "nullius-crushed-iron-ore"
  },
  {
    type = "recipe",
    name = "nullius-bauxite-recovery",
    localised_name = {"recipe-name.nullius-bauxite-recovery"},
    enabled = false,
    allow_as_intermediate = false,
    allow_decomposition = false,
    category = "ore-flotation",
    subgroup = "aluminum-ingot",
    order = "nullius-o",
    energy_required = 20,
    ingredients = {
      {type="fluid", name="nullius-sludge", amount=200},
      {type="fluid", name="nullius-acid-sulfuric", amount=180}
    },
    results = {
      {type="item", name="nullius-crushed-bauxite", amount=8},
      {type="item", name="nullius-sand", amount=4},
      {type="fluid", name="nullius-wastewater", amount=150},
      {type="fluid", name="nullius-sulfur-dioxide", amount=40}
    },
    main_product = "nullius-crushed-bauxite"
  },
  {
    type = "recipe",
    name = "nullius-sand-recovery",
    localised_name = {"recipe-name.nullius-sand-recovery"},
    enabled = false,
    allow_as_intermediate = false,
    allow_decomposition = false,
    category = "ore-flotation",
    subgroup = "silicon-product",
    order = "nullius-o",
    energy_required = 20,
    ingredients = {
      {type="fluid", name="nullius-sludge", amount=200},
      {type="fluid", name="nullius-acid-hydrochloric", amount=180}
    },
    results = {
      {type="item", name="nullius-sand", amount=8},
      {type="item", name="nullius-crushed-iron-ore", amount=4},
      {type="fluid", name="nullius-wastewater", amount=150},
      {type="fluid", name="nullius-carbon-dioxide", amount=100}
    },
    main_product = "nullius-sand"
  },
  {
    type = "recipe",
    name = "nullius-stone-recovery",
    localised_name = {"recipe-name.nullius-stone-recovery"},
    enabled = false,
    allow_as_intermediate = false,
    allow_decomposition = false,
    category = "ore-flotation",
    subgroup = "masonry-material",
    order = "nullius-o",
    energy_required = 30,
    ingredients = {
      {type="fluid", name="nullius-sludge", amount=250},
      {type="item", name="nullius-cement", amount=4},
      {type="fluid", name="nullius-freshwater", amount=200}
    },
    results = {
      {type="item", name="stone", amount=15},
      {type="fluid", name="nullius-wastewater", amount=150, fluidbox_index=1}
    },
    main_product = "stone"
  },

  {
    type = "recipe",
    name = "nullius-eutectic-salt",
    enabled = false,
    category = "basic-chemistry",
    crafting_machine_tint = {
      primary = data.raw.fluid["nullius-acid-nitric"].flow_color,
      secondary = data.raw.fluid["nullius-carbon-dioxide"].flow_color
    },
    energy_required = 3,
    ingredients = {
      {type="item", name="nullius-crushed-limestone", amount=2},
      {type="item", name="nullius-soda-ash", amount=3},
      {type="fluid", name="nullius-acid-nitric", amount=80, fluidbox_index=2}
    },
    results = {
      {type="item", name="nullius-eutectic-salt", amount=5},
      {type="fluid", name="nullius-carbon-dioxide", amount=100},
      {type="fluid", name="nullius-wastewater", amount=50}
    },
    main_product = "nullius-eutectic-salt"
  },
  {
    type = "recipe",
    name = "nullius-boxed-eutectic-salt",
    enabled = false,
    category = "basic-chemistry",
    subgroup = "boxed-sodium",
    order = "nullius-g",
    crafting_machine_tint = {
      primary = data.raw.fluid["nullius-acid-nitric"].flow_color,
      secondary = data.raw.fluid["nullius-carbon-dioxide"].flow_color
    },
    energy_required = 15,
    ingredients = {
      {type="item", name="nullius-box-crushed-limestone", amount=2},
      {type="item", name="nullius-box-soda-ash", amount=3},
      {type="fluid", name="nullius-acid-nitric", amount=400, fluidbox_index=2}
    },
    results = {
      {type="item", name="nullius-box-eutectic-salt", amount=5},
      {type="fluid", name="nullius-carbon-dioxide", amount=500},
      {type="fluid", name="nullius-wastewater", amount=250}
    },
    main_product = "nullius-box-eutectic-salt"
  },
  {
    type = "recipe",
    name = "nullius-fusion-cell",
    enabled = false,
    show_amount_in_title = false,
    always_show_products = true,
    category = "basic-chemistry",
    crafting_machine_tint = {
      primary = data.raw.fluid["nullius-deuterium"].flow_color,
      secondary = data.raw.fluid["nullius-tritium"].flow_color
    },
    energy_required = 8,
    ingredients = {
      {type="item", name="nullius-canister", amount=1},
      {type="fluid", name="nullius-deuterium", amount=7},
      {type="fluid", name="nullius-tritium", amount=4}
    },
    result = "nullius-fusion-cell"
  },
  {
    type = "recipe",
    name = "nullius-fusion-recycling",
    icon = ICONPATH .. "fusion-spent.png",
    icon_size = 64,
    icon_mipmaps = 4,
    enabled = false,
    show_amount_in_title = false,
    always_show_products = true,
    category = "basic-chemistry",
    subgroup = "nuclear",
    order = "nullius-cc",
    crafting_machine_tint = {
      primary = data.raw.fluid["nullius-helium"].flow_color,
      secondary = data.raw.fluid["nullius-helium"].flow_color
    },
    energy_required = 15,
    ingredients = {
      {type="item", name="nullius-spent-fusion-cell", amount=4},
      {type="fluid", name="nullius-water", amount=100, fluidbox_index=1}
    },
    results = {
      {type="item", name="nullius-canister", amount=2},
      {type="fluid", name="nullius-helium", amount=20},
      {type="fluid", name="nullius-wastewater", amount=80}
    }
  },
  {
    type = "recipe",
    name = "nullius-breeder-cell",
    enabled = false,
    show_amount_in_title = false,
    always_show_products = true,
    category = "nanotechnology",
    energy_required = 10,
    ingredients = {
      {type="item", name="nullius-fusion-cell", amount=1},
      {type="item", name="nullius-lithium", amount=2},
      {type="item", name="nullius-boron", amount=1},
      {type="item", name="nullius-ceramic-powder", amount=3},
      {type="fluid", name="nullius-deuterium", amount=12},
      {type="fluid", name="nullius-compressed-helium", amount=10}
    },
    result = "nullius-breeder-cell"
  },
  {
    type = "recipe",
    name = "nullius-breeder-recycling",
    icon = ICONPATH .. "breeder-spent.png",
    icon_size = 64,
    icon_mipmaps = 4,
    enabled = false,
    show_amount_in_title = false,
    always_show_products = true,
    category = "distillation",
    subgroup = "nuclear",
    order = "nullius-dc",
    crafting_machine_tint = { primary = data.raw.fluid["nullius-tritium"].flow_color },
    energy_required = 20,
    ingredients = {
      {type="item", name="nullius-spent-breeder-cell", amount=3},
      {type="fluid", name="nullius-water", amount=120, fluidbox_index=1}
    },
    results = {
      {type="item", name="nullius-canister", amount=1},
      {type="item", name="nullius-lithium", amount=2},
      {type="fluid", name="nullius-tritium", amount=16},
      {type="fluid", name="nullius-helium", amount=60},
      {type="fluid", name="nullius-wastewater", amount=100}
    },
  },
====================================================================================

data:extend({
   {
    type = "recipe",
    name = "nullius-sugar-1",
    localised_name = {"", {"item-name.nullius-sugar"}, " ", 1},
    icons = {
      {
        icon = ICONPATH .. "sugar.png",
        icon_size = 64
      },
      {
        icon = "__angelspetrochem__/graphics/icons/molecules/glycerol.png",
        icon_size = 72,
        scale = 0.3,
        shift = {7, -9}
      }
    },
    enabled = false,
    show_amount_in_title = false,
    always_show_products = true,
    category = "nanotechnology",
    order = "nullius-bc",
    energy_required = 20,
    ingredients = {
      {type="fluid", name="nullius-glycerol", amount=10, fluidbox_index=1},
      {type="fluid", name="nullius-oxygen", amount=30, fluidbox_index=2}
    },
    results = {
      {type="item", name="nullius-sugar", amount=1},
      {type="fluid", name="nullius-wastewater", amount=5}
    },
    main_product = "nullius-sugar"
  },
  {
    type = "recipe",
    name = "nullius-sugar-2",
    localised_name = {"", {"item-name.nullius-sugar"}, " ", 2},
    enabled = false,
    show_amount_in_title = false,
    always_show_products = true,
    category = "basic-chemistry",
    order = "nullius-bd",
    crafting_machine_tint = {
      primary = data.raw.fluid["nullius-glycerol"].flow_color,
      secondary = data.raw.fluid["nullius-acid-hydrochloric"].flow_color
    },
    energy_required = 1,
    ingredients = {
      {type="item", name="nullius-cellulose", amount=3},
      {type="fluid", name="nullius-acid-hydrochloric", amount=4, fluidbox_index=1},
      {type="fluid", name="nullius-caustic-solution", amount=4, fluidbox_index=2}
    },
    results = {
      {type="item", name="nullius-sugar", amount=4},
      {type="fluid", name="nullius-wastewater", amount=6}
    },
    main_product = "nullius-sugar"
  },
  {
    type = "recipe",
    name = "nullius-boxed-sugar",
    enabled = false,
    show_amount_in_title = false,
    always_show_products = true,
    category = "basic-chemistry",
    subgroup = "boxed-biology",
    order = "nullius-fb",
    crafting_machine_tint = {
      primary = data.raw.fluid["nullius-glycerol"].flow_color,
      secondary = data.raw.fluid["nullius-acid-hydrochloric"].flow_color
    },
    energy_required = 5,
    ingredients = {
      {type="item", name="nullius-box-cellulose", amount=3},
      {type="fluid", name="nullius-acid-hydrochloric", amount=20, fluidbox_index=1},
      {type="fluid", name="nullius-caustic-solution", amount=20, fluidbox_index=2}
    },
    results = {
      {type="item", name="nullius-box-sugar", amount=4},
      {type="fluid", name="nullius-wastewater", amount=30}
    },
    main_product = "nullius-box-sugar"
  },
  {
    type = "recipe",
    name = "nullius-cellulose",
    enabled = false,
    show_amount_in_title = false,
    always_show_products = true,
    category = "nanotechnology",
    energy_required = 15,
    ingredients = {
      {type="item", name="nullius-sugar", amount=5},
      {type="fluid", name="nullius-solvent", amount=4, fluidbox_index=1}
    },
    results = {
      {type="item", name="nullius-cellulose", amount=3},
      {type="fluid", name="nullius-wastewater", amount=6}
    },
    main_product = "nullius-cellulose"
  },
  {
    type = "recipe",
    name = "nullius-amino-acids",
    enabled = false,
    show_amount_in_title = false,
    always_show_products = true,
    category = "nanotechnology",
    subgroup = "biochemistry",
    energy_required = 8,
    ingredients = {
      {type="fluid", name="nullius-ammonia", amount=6},
      {type="fluid", name="nullius-glycerol", amount=2},
      {type="fluid", name="nullius-oxygen", amount=12}
    },
    results = {
      {type="fluid", name="nullius-amino-acids", amount=1}
    },
    main_product = "nullius-amino-acids"
  },
  {
    type = "recipe",
    name = "nullius-fatty-acids",
    enabled = false,
    show_amount_in_title = false,
    always_show_products = true,
    category = "nanotechnology",
    subgroup = "biology-oil",
    order = "nullius-bb",
    energy_required = 5,
    ingredients = {
      {type="fluid", name="nullius-propene", amount=8},
      {type="fluid", name="nullius-methanol", amount=1},
      {type="fluid", name="nullius-oxygen", amount=4}
    },
    results = {
      {type="fluid", name="nullius-fatty-acids", amount=1}
    },
    main_product = "nullius-fatty-acids"
  },
  {
    type = "recipe",
    name = "nullius-oil",
    enabled = false,
    show_amount_in_title = false,
    always_show_products = true,
    category = "basic-chemistry",
    subgroup = "biology-oil",
    order = "nullius-c",
    energy_required = 2,
    ingredients = {
      {type="fluid", name="nullius-fatty-acids", amount=6},
      {type="fluid", name="nullius-glycerol", amount=1}
    },
    results = {
      {type="fluid", name="nullius-oil", amount=5}
    },
    main_product = "nullius-oil"
  },
  {
    type = "recipe",
    name = "nullius-oil-cracking",
    localised_name = {"recipe-name.nullius-cracking", {"fluid-name.nullius-oil"}},
    icons = {
      data.raw.fluid["nullius-fatty-acids"].icons[2],
      data.raw.fluid["nullius-fatty-acids"].icons[3],
      data.raw.fluid["nullius-fatty-acids"].icons[4],
      {
        icon = "__base__/graphics/icons/fluid/light-oil.png",
        icon_size = 64,
        scale = 0.25,
        shift = {-9, -9}
      }
    },
    enabled = false,
    show_amount_in_title = false,
    always_show_products = true,
    category = "distillation",
    subgroup = "biology-oil",
    order = "nullius-bc",
    energy_required = 1,
    ingredients = {
      {type="fluid", name="nullius-oil", amount=100},
      {type="fluid", name="nullius-steam", amount=250}
    },
    results = {
      {type="fluid", name="nullius-fatty-acids", amount=75},
      {type="fluid", name="nullius-glycerol", amount=15}
    },
    main_product = "nullius-fatty-acids"
  },
  {
    type = "recipe",
    name = "nullius-biodiesel",
    enabled = false,
    show_amount_in_title = false,
    always_show_products = true,
    category = "distillation",
    subgroup = "biology-oil",
    order = "nullius-d",
    energy_required = 1,
    ingredients = {
      {type="fluid", name="nullius-fatty-acids", amount=20},
      {type="fluid", name="nullius-methanol", amount=6}
    },
    results = {
      {type="fluid", name="nullius-biodiesel", amount=25},
      {type="fluid", name="nullius-wastewater", amount=5}
    },
    main_product = "nullius-biodiesel"
  },
  {
    type = "recipe",
    name = "nullius-nucleotides",
    enabled = false,
    show_amount_in_title = false,
    always_show_products = true,
    category = "nanotechnology",
    subgroup = "biochemistry",
    energy_required = 24,
    ingredients = {
      {type="item", name="nullius-sugar", amount=1},
      {type="fluid", name="nullius-amino-acids", amount=3},
      {type="fluid", name="nullius-methanol", amount=2},
      {type="fluid", name="nullius-acid-nitric", amount=4}
    },
    results = {
      {type="fluid", name="nullius-nucleotides", amount=2}
    },
    main_product = "nullius-nucleotides"
  },

  {
    type = "recipe",
    name = "nullius-protocell-1",
    localised_name = {"", {"fluid-name.nullius-protocell"}, " ", 1},
    enabled = false,
    category = "nanotechnology",
    order = "nullius-fb",
    energy_required = 50,
    ingredients = {
      {type="fluid", name="nullius-amino-acids", amount=5},
      {type="fluid", name="nullius-fatty-acids", amount=8},
      {type="fluid", name="nullius-saline", amount=20},
      {type="item", name="nullius-sugar", amount=1},
      {type="item", name="nullius-mineral-dust", amount=1}
    },
    results = {
      {type="fluid", name="nullius-protocell", amount=2},
      {type="item", name="nullius-graphite", amount=1}
    },
    main_product = "nullius-protocell"
  },
  {
    type = "recipe",
    name = "nullius-protocell-2",
    localised_name = {"", {"fluid-name.nullius-protocell"}, " ", 2},
    icons = {
      {
        icon = ICONPATH .. "protocell.png",
        icon_size = 64
      },
      {
        icon = ICONPATH .. "bacteria.png",
        icon_size = 64,
        scale = 0.35,
        shift = {11, -10}
      }
    },
    enabled = false,
    category = "nanotechnology",
    order = "nullius-fc",
    energy_required = 8,
    ingredients = {
      {type="fluid", name="nullius-bacteria", amount=12},
      {type="fluid", name="nullius-saline", amount=20}
    },
    results = {
      {type="fluid", name="nullius-protocell", amount=5},
      {type="item", name="nullius-graphite", amount=1}
    },
    main_product = "nullius-protocell"
  },
  {
    type = "recipe",
    name = "nullius-fertilizer",
    enabled = false,
    show_amount_in_title = false,
    always_show_products = true,
    category = "basic-chemistry",
    crafting_machine_tint = {
      primary = data.raw.fluid["nullius-ammonia"].flow_color,
      secondary = data.raw.fluid["nullius-acid-nitric"].flow_color
    },
    energy_required = 10,
    ingredients = {
      {type="fluid", name="nullius-ammonia", amount=70},
      {type="fluid", name="nullius-acid-nitric", amount=35},
      {type="fluid", name="nullius-sludge", amount=20},
      {type="item", name="nullius-algae", amount=4},
      {type="item", name="nullius-cellulose", amount=5}
    },
    result = "nullius-fertilizer",
    result_count = 6
  },
  {
    type = "recipe",
    name = "nullius-fatty-acid-pyrolysis",
    localised_name = {"recipe-name.nullius-pyrolysis", {"fluid-name.nullius-fatty-acids"}},
    icons = angelsmods.functions.create_liquid_recipe_icon(
        {{"__angelspetrochem__/graphics/icons/molecules/ethylene.png", 72},
        {"__angelspetrochem__/graphics/icons/molecules/benzene.png", 72},
        {"__angelspetrochem__/graphics/icons/molecules/propene.png", 72}},
      {element_tint["carbon"], element_tint["carbon"], element_tint["hydrogen"]}
    ),
    enabled = false,
    category = "distillation",
    subgroup = "biology-oil",
    order = "nullius-g",
    energy_required = 3,
    ingredients = {
      {type="fluid", name="nullius-fatty-acids", amount=30}
    },
    results = {
      {type="fluid", name="nullius-ethylene", amount=50},
      {type="fluid", name="nullius-propene", amount=70},
      {type="fluid", name="nullius-benzene", amount=4},
      {type="item", name="nullius-graphite", amount=1}
    },
    main_product = "nullius-propene"
  },
  {
    type = "recipe",
    name = "nullius-boxed-fatty-acid-pyrolysis",
    enabled = false,
    category = "distillation",
    subgroup = "boxed-biology",
    order = "nullius-o",
    energy_required = 15,
    ingredients = {
      {type="fluid", name="nullius-fatty-acids", amount=150}
    },
    results = {
      {type="fluid", name="nullius-ethylene", amount=250},
      {type="fluid", name="nullius-propene", amount=350},
      {type="fluid", name="nullius-benzene", amount=20},
      {type="item", name="nullius-box-graphite", amount=1}
    },
    main_product = "nullius-propene"
  },

  {
    type = "recipe",
    name = "nullius-glycerol-reforming",
    localised_name = {"recipe-name.nullius-reforming", {"fluid-name.nullius-glycerol"}},
    icons = angelsmods.functions.create_liquid_recipe_icon(
        {{"__angelspetrochem__/graphics/icons/molecules/carbon-monoxide.png", 72},
       {"__angelspetrochem__/graphics/icons/molecules/hydrogen.png", 72}},
      {element_tint["carbon"], element_tint["hydrogen"], element_tint["oxygen"]},
      {{"__angelspetrochem__/graphics/icons/molecules/glycerol.png", 72}}
    ),
    enabled = false,
    category = "distillation",
    subgroup = "biology-oil",
    order = "nullius-h",
    energy_required = 1,
    ingredients = {
      {type="fluid", name="nullius-glycerol", amount=20},
      {type="fluid", name="nullius-compressed-carbon-dioxide", amount=10}
    },
    results = {
      {type="fluid", name="nullius-compressed-hydrogen", amount=12},
      {type="fluid", name="nullius-compressed-carbon-monoxide", amount=16},
      {type="fluid", name="nullius-steam", amount=25}
    },
    main_product = "nullius-compressed-carbon-monoxide"
  },

  {
    type = "recipe",
    name = "nullius-bacteria-genome",
    enabled = false,
    category = "nanotechnology",
    energy_required = 30,
    ingredients = {
      {type="fluid", name="nullius-nucleotides", amount=8, fluidbox_index=1},
      {type="item", name="nullius-box-astronomy-pack", amount=5},
      {type="item", name="nullius-box-chemical-pack", amount=4},
      {type="item", name="nullius-canister", amount=1}
    },
    results = {
      {type="item", name="nullius-bacteria-genome", amount=1},
      {type="fluid", name="nullius-wastewater", amount=5}
    },
    main_product = "nullius-bacteria-genome"
  },
  {
    type = "recipe",
    name = "nullius-bacteria-1",
    localised_name = {"", {"fluid-name.nullius-bacteria"}, " ", 1},
    icons = {
      {
        icon = ICONPATH .. "bacteria.png",
        icon_size = 64
      },
      {
        icon = ICONPATH .. "protocell.png",
        icon_size = 64,
        scale = 0.3,
        shift = {9, -9}
      }
    },
    enabled = false,
    allow_decomposition = false,
    category = "nanotechnology",
    subgroup = "biology-bacteria",
    order = "nullius-cb",
    energy_required = 100,
    ingredients = {
      {type="item", name="nullius-bacteria-genome", amount=1},
      {type="fluid", name="nullius-protocell", amount=2},
      {type="fluid", name="nullius-amino-acids", amount=2},
      {type="fluid", name="nullius-fatty-acids", amount=1},
      {type="item", name="nullius-sugar", amount=1}
    },
    results = {
      {type="fluid", name="nullius-bacteria", amount=1},
      {type="item", name="nullius-graphite", amount=1}
    },
    main_product = "nullius-bacteria"
  },
  {
    type = "recipe",
    name = "nullius-bacteria-2",
    localised_name = {"", {"fluid-name.nullius-bacteria"}, " ", 2},
    enabled = false,
    allow_decomposition = false,
    category = "ore-flotation",
    subgroup = "biology-bacteria",
    order = "nullius-cc",
    energy_required = 8,
    ingredients = {
      {type="fluid", name="nullius-saline", amount=40},
      {type="fluid", name="nullius-bacteria", amount=6},
      {type="item", name="nullius-sugar", amount=2},
      {type="item", name="nullius-cellulose", amount=3},
      {type="item", name="nullius-mineral-dust", amount=1}
    },
    results = {
      {type="fluid", name="nullius-bacteria", amount=10},
      {type="fluid", name="nullius-methane", amount=50}
    },
    main_product = "nullius-bacteria"
  },

  {
    type = "recipe",
    name = "nullius-fermentation",
    localised_name = {"recipe-name.nullius-fermentation"},
    icons = {
      data.raw.fluid["nullius-methanol"].icons[2],
      data.raw.fluid["nullius-methanol"].icons[3],
      data.raw.fluid["nullius-methanol"].icons[4],
      {
        icon = ICONPATH .. "sugar.png",
        icon_size = 64,
        scale = 0.25,
        shift = {-9, -9}
      }
    },
    enabled = false,
    always_show_made_in = true,
    show_amount_in_title = false,
    always_show_products = true,
    category = "distillation",
    subgroup = "biology-bacteria",
    order = "nullius-f",
    crafting_machine_tint = { primary = data.raw.fluid["nullius-methanol"].flow_color },
    energy_required = 3,
    ingredients = {
      {type="item", name="nullius-sugar", amount=4},
      {type="fluid", name="nullius-freshwater", amount=20},
      {type="fluid", name="nullius-bacteria", amount=1}
    },
    results = {
      {type="fluid", name="nullius-methanol", amount=25},
      {type="fluid", name="nullius-carbon-dioxide", amount=20},
      {type="fluid", name="nullius-wastewater", amount=10}
    },
    main_product = "nullius-methanol"
  },
  {
    type = "recipe",
    name = "nullius-boxed-fermentation",
    localised_name = {"recipe-name.nullius-boxed", {"recipe-name.nullius-fermentation"}},
    icons = {
      {
        icon = ICONPATH .. "crate.png",
        icon_size = 64
      },
      data.raw.fluid["nullius-methanol"].icons[2],
      data.raw.fluid["nullius-methanol"].icons[3],
      data.raw.fluid["nullius-methanol"].icons[4],
      {
        icon = ICONPATH .. "sugar.png",
        icon_size = 64,
        scale = 0.23,
        shift = {-8, -8}
      }
    },
    enabled = false,
    always_show_made_in = true,
    show_amount_in_title = false,
    always_show_products = true,
    category = "distillation",
    subgroup = "boxed-biology",
    order = "nullius-fc",
    crafting_machine_tint = { primary = data.raw.fluid["nullius-methanol"].flow_color },
    energy_required = 15,
    ingredients = {
      {type="item", name="nullius-box-sugar", amount=4},
      {type="fluid", name="nullius-freshwater", amount=100},
      {type="fluid", name="nullius-bacteria", amount=5}
    },
    results = {
      {type="fluid", name="nullius-methanol", amount=125},
      {type="fluid", name="nullius-carbon-dioxide", amount=100},
      {type="fluid", name="nullius-wastewater", amount=50}
    },
    main_product = "nullius-methanol"
  },
  {
    type = "recipe",
    name = "nullius-amino-acid-metabolism",
    localised_name = {"recipe-name.nullius-metabolism", {"fluid-name.nullius-amino-acids"}},
    icons = {
      data.raw.fluid["nullius-ammonia"].icons[2],
      data.raw.fluid["nullius-ammonia"].icons[3],
      data.raw.fluid["nullius-ammonia"].icons[4],
      {
        icon = ICONPATH .. "bacteria.png",
        icon_size = 64,
        scale = 0.35,
        shift = {-8, -9}
      }
    },
    enabled = false,
    always_show_made_in = true,
    show_amount_in_title = false,
    always_show_products = true,
    category = "distillation",
    subgroup = "biology-bacteria",
    order = "nullius-g",
    crafting_machine_tint = { primary = data.raw.fluid["nullius-ammonia"].flow_color },
    energy_required = 2,
    ingredients = {
      {type="fluid", name="nullius-amino-acids", amount=25},
      {type="fluid", name="nullius-bacteria", amount=1}
    },
    results = {
      {type="fluid", name="nullius-ammonia", amount=75},
      {type="fluid", name="nullius-methane", amount=30},
      {type="fluid", name="nullius-wastewater", amount=10}
    },
    main_product = "nullius-ammonia"
  },
  {
    type = "recipe",
    name = "nullius-nucleotide-metabolism",
    localised_name = {"recipe-name.nullius-metabolism", {"fluid-name.nullius-nucleotides"}},
    icons = {
      data.raw.fluid["nullius-amino-acids"].icons[2],
      data.raw.fluid["nullius-amino-acids"].icons[3],
      data.raw.fluid["nullius-amino-acids"].icons[4],
      {
        icon = ICONPATH .. "bacteria.png",
        icon_size = 64,
        scale = 0.35,
        shift = {-8, -9}
      }
    },
    enabled = false,
    always_show_made_in = true,
    show_amount_in_title = false,
    always_show_products = true,
    category = "distillation",
    subgroup = "biology-bacteria",
    order = "nullius-g",
    crafting_machine_tint = { primary = data.raw.fluid["nullius-nucleotides"].flow_color },
    energy_required = 4,
    ingredients = {
      {type="fluid", name="nullius-nucleotides", amount=15},
      {type="fluid", name="nullius-bacteria", amount=2}
    },
    results = {
      {type="fluid", name="nullius-amino-acids", amount=5},
      {type="item", name="nullius-sugar", amount=1},
      {type="fluid", name="nullius-methane", amount=8},
      {type="fluid", name="nullius-wastewater", amount=6}
    },
    main_product = "nullius-amino-acids"
  },

  {
    type = "recipe",
    name = "nullius-algae-genome",
    enabled = false,
    category = "nanotechnology",
    energy_required = 20,
    ingredients = {
      {type="item", name="nullius-bacteria-genome", amount=1},
      {type="fluid", name="nullius-nucleotides", amount=6, fluidbox_index=1},
      {type="item", name="nullius-box-astronomy-pack", amount=3},
      {type="item", name="nullius-box-climatology-pack", amount=4}
    },
    results = {
      {type="item", name="nullius-algae-genome", amount=1},
      {type="fluid", name="nullius-wastewater", amount=3}
    },
    main_product = "nullius-algae-genome"
  },
  {
    type = "recipe",
    name = "nullius-algae-progenitor",
    enabled = false,
    category = "nanotechnology",
    energy_required = 150,
    ingredients = {
      {type="item", name="nullius-algae-genome", amount=1},
      {type="fluid", name="nullius-protocell", amount=8},
      {type="fluid", name="nullius-amino-acids", amount=5},
      {type="fluid", name="nullius-fatty-acids", amount=3},
      {type="item", name="nullius-sugar", amount=1},
      {type="item", name="nullius-cellulose", amount=1}
    },
    results = {
      {type="item", name="nullius-algae-progenitor", amount=1},
      {type="fluid", name="nullius-wastewater", amount=5}
    },
    main_product = "nullius-algae-progenitor"
  },
  {
    type = "recipe",
    name = "nullius-algae-1",
    localised_name = {"", {"item-name.nullius-algae"}, " ", 1},
    icons = {
      {
        icon = ICONPATH .. "algae.png",
        icon_size = 64
      },
      {
        icon = ICONPATH .. "protocell.png",
        icon_size = 64,
        scale = 0.3,
        shift = {9, -9}
      }
    },
    enabled = false,
    allow_decomposition = false,
    category = "ore-flotation",
    order = "nullius-db",
    energy_required = 10,
    ingredients = {
      {type="fluid", name="nullius-seawater", amount=125},
      {type="fluid", name="nullius-air", amount=500},
      {type="item", name="nullius-algae-progenitor", amount=1},
      {type="item", name="nullius-mineral-dust", amount=1}
    },
    results = {
      {type="item", name="nullius-algae", amount=2},
      {type="fluid", name="nullius-wastewater", amount=80},
      {type="fluid", name="nullius-oxygen", amount=120}
    },
    main_product = "nullius-algae"
  },
  {
    type = "recipe",
    name = "nullius-algae-2",
    localised_name = {"", {"item-name.nullius-algae"}, " ", 2},
    enabled = false,
    allow_decomposition = false,
    category = "ore-flotation",
    order = "nullius-dc",
    energy_required = 12,
    ingredients = {
      {type="fluid", name="nullius-seawater", amount=500},
      {type="fluid", name="nullius-air", amount=2000},
      {type="item", name="nullius-algae-spore", amount=10},
      {type="item", name="nullius-mineral-dust", amount=3}
    },
    results = {
      {type="item", name="nullius-algae", amount=8},
      {type="fluid", name="nullius-wastewater", amount=300},
      {type="fluid", name="nullius-oxygen", amount=500}
    },
    main_product = "nullius-algae"
  },
  {
    type = "recipe",
    name = "nullius-algae-spore",
    enabled = false,
    always_show_made_in = true,
    show_amount_in_title = false,
    always_show_products = true,
    category = "bio-harvesting",
    energy_required = 4,
    ingredients = {
      {type="item", name="nullius-algae", amount=3}
    },
    results = {
      {type="item", name="nullius-algae-spore", amount=5},
      {type="fluid", name="nullius-sludge", amount=15},
      {type="item", name="nullius-cellulose", amount=1}
    },
    main_product = "nullius-algae-spore"
  },
  {
    type = "recipe",
    name = "nullius-biomass-cultivation",
    localised_name = {"recipe-name.nullius-biomass-cultivation"},
    icons = {
      {
        icon = "__base__/graphics/icons/fluid/light-oil.png",
        icon_size = 64,
        icon_mipmaps = 4,
        scale = 0.5
      },
      {
        icon = ICONPATH .. "algae.png",
        icon_size = 64,
        scale = 0.36,
        shift = {-4, -4}
      }
    },
    enabled = false,
    always_show_made_in = true,
    show_amount_in_title = false,
    always_show_products = true,
    category = "ore-flotation",
    subgroup = "biology-algae",
    order = "nullius-f",
    energy_required = 15,
    ingredients = {
      {type="item", name="nullius-algae-spore", amount=3},
      {type="item", name="nullius-mineral-dust", amount=30},
      {type="fluid", name="nullius-wastewater", amount=800},
      {type="fluid", name="nullius-bacteria", amount=2}
    },
    results = {
      {type="item", name="nullius-cellulose", amount=10},
      {type="fluid", name="nullius-oil", amount=120},
      {type="fluid", name="nullius-methane", amount=180}
    },
    main_product = "nullius-oil"
  },
  {
    type = "recipe",
    name = "nullius-boxed-biomass-cultivation",
    localised_name = {"recipe-name.nullius-biomass-cultivation"},
    icons = {
      {
        icon = "__base__/graphics/icons/fluid/light-oil.png",
        icon_size = 64,
        icon_mipmaps = 4,
        scale = 0.5
      },
      {
        icon = ICONPATH .. "algae.png",
        icon_size = 64,
        scale = 0.36,
        shift = {-4, -4}
      }
    },
    enabled = false,
    always_show_made_in = true,
    show_amount_in_title = false,
    always_show_products = true,
    category = "ore-flotation",
    subgroup = "boxed-biology",
    order = "nullius-fd",
    energy_required = 15,
    ingredients = {
      {type="item", name="nullius-algae-spore", amount=3},
      {type="item", name="nullius-box-mineral-dust", amount=6},
      {type="fluid", name="nullius-wastewater", amount=800},
      {type="fluid", name="nullius-bacteria", amount=2}
    },
    results = {
      {type="item", name="nullius-box-cellulose", amount=2},
      {type="fluid", name="nullius-oil", amount=120},
      {type="fluid", name="nullius-methane", amount=180}
    },
    main_product = "nullius-oil"
  },

  {
    type = "recipe",
    name = "nullius-grass-genome",
    enabled = false,
    category = "nanotechnology",
    energy_required = 30,
    ingredients = {
      {type="fluid", name="nullius-nucleotides", amount=8, fluidbox_index=1},
      {type="fluid", name="nullius-bacteria", amount=1, fluidbox_index=2},
      {type="item", name="nullius-algae-genome", amount=1},
      {type="item", name="nullius-box-astronomy-pack", amount=4},
      {type="item", name="nullius-box-geology-pack", amount=5}
    },
    results = {
      {type="item", name="nullius-grass-genome", amount=1},
      {type="fluid", name="nullius-wastewater", amount=3}
    },
    main_product = "nullius-grass-genome"
  },
  {
    type = "recipe",
    name = "nullius-grass-progenitor",
    enabled = false,
    category = "nanotechnology",
    energy_required = 200,
    ingredients = {
      {type="item", name="nullius-grass-genome", amount=1},
      {type="fluid", name="nullius-protocell", amount=10},
      {type="fluid", name="nullius-amino-acids", amount=8},
      {type="fluid", name="nullius-fatty-acids", amount=5},
      {type="item", name="nullius-sugar", amount=3},
      {type="item", name="nullius-cellulose", amount=2}
    },
    results = {
      {type="item", name="nullius-grass-progenitor", amount=1},
      {type="fluid", name="nullius-wastewater", amount=8}
    },
    main_product = "nullius-grass-progenitor"
  },
  {
    type = "recipe",
    name = "nullius-grass-1",
    localised_name = {"", {"item-name.nullius-grass"}, " ", 1},
    icons = {
      {
        icon = ICONPATH .. "grass.png",
        icon_size = 64
      },
      {
        icon = ICONPATH .. "protocell.png",
        icon_size = 64,
        scale = 0.3,
        shift = {9, -9}
      }
    },
    enabled = false,
    allow_decomposition = false,
    category = "nullius-water-treatment",
    order = "nullius-db",
    energy_required = 15,
    ingredients = {
      {type="fluid", name="nullius-freshwater", amount=100},
      {type="fluid", name="nullius-air", amount=600},
      {type="item", name="nullius-land-fill-bauxite", amount=1},
      {type="item", name="nullius-grass-progenitor", amount=1}
    },
    results = {
      {type="item", name="nullius-grass", amount=2},
      {type="fluid", name="nullius-sludge", amount=10},
      {type="fluid", name="nullius-oxygen", amount=150}
    },
    main_product = "nullius-grass"
  },
  {
    type = "recipe",
    name = "nullius-grass-2",
    localised_name = {"", {"item-name.nullius-grass"}, " ", 2},
    enabled = false,
    allow_decomposition = false,
    category = "nullius-water-treatment",
    order = "nullius-dc",
    energy_required = 18,
    ingredients = {
      {type="fluid", name="nullius-freshwater", amount=400},
      {type="fluid", name="nullius-air", amount=2500},
      {type="item", name="nullius-land-fill-bauxite", amount=2},
      {type="item", name="nullius-fertilizer", amount=2},
      {type="item", name="nullius-grass-seed", amount=18}
    },
    results = {
      {type="item", name="nullius-grass", amount=8},
      {type="fluid", name="nullius-sludge", amount=40},
      {type="fluid", name="nullius-oxygen", amount=600}
    },
    main_product = "nullius-grass"
  },
  {
    type = "recipe",
    name = "nullius-grass-seed",
    enabled = false,
    always_show_made_in = true,
    show_amount_in_title = false,
    always_show_products = true,
    category = "bio-harvesting",
    energy_required = 5,
    ingredients = {
      {type="item", name="nullius-grass", amount=5},
      {type="fluid", name="nullius-water", amount=15}
    },
    results = {
      {type="item", name="nullius-grass-seed", amount=20},
      {type="fluid", name="nullius-sludge", amount=12},
      {type="item", name="nullius-cellulose", amount=16}
    },
    main_product = "nullius-grass-seed"
  },
  {
    type = "recipe",
    name = "nullius-boxed-grass-seed",
    enabled = false,
    always_show_made_in = true,
    show_amount_in_title = false,
    always_show_products = true,
    category = "bio-harvesting",
    subgroup = "boxed-biology",
    order = "nullius-bb",
    energy_required = 25,
    ingredients = {
      {type="item", name="nullius-grass", amount=25},
      {type="fluid", name="nullius-water", amount=75}
    },
    results = {
      {type="item", name="nullius-box-grass-seed", amount=20},
      {type="fluid", name="nullius-sludge", amount=60},
      {type="item", name="nullius-box-cellulose", amount=16}
    },
    main_product = "nullius-box-grass-seed"
  },
  {
    type = "recipe",
    name = "nullius-grass-seed-milling",
    localised_name = {"recipe-name.nullius-grass-seed-milling"},
    icons = {
      {
        icon = "__base__/graphics/decorative/brown-asterisk/hr-brown-asterisk-11.png",
        icon_size = 54
      },
      {
        icon = ICONPATH .. "protocell.png",
        icon_size = 64,
        tint = {1, 1, 1, 0.8},
        scale = 0.4,
        shift = {-8, -7}
      },
      {
        icon = ICONPATH .. "grass.png",
        icon_size = 64,
        scale = 0.36,
        shift = {-8, -7}
      }
    },
    enabled = false,
    always_show_made_in = true,
    show_amount_in_title = false,
    always_show_products = true,
    category = "bio-harvesting",
    subgroup = "biology-grass",
    order = "nullius-g",
    energy_required = 1,
    ingredients = {
      {type="item", name="nullius-grass-seed", amount=5}
    },
    results = {
      {type="item", name="nullius-cellulose", amount=3},
      {type="item", name="nullius-sugar", amount=2}
    },
    main_product = "nullius-cellulose"
  },
  {
    type = "recipe",
    name = "nullius-boxed-grass-seed-milling",
    localised_name = {"recipe-name.nullius-boxed", {"recipe-name.nullius-grass-seed-milling"}},
    icons = {
      {
        icon = ICONPATH .. "crate.png",
        icon_size = 64
      },
      {
        icon = "__base__/graphics/decorative/brown-asterisk/hr-brown-asterisk-11.png",
        icon_size = 54,
        scale = 0.5333
      },
      {
        icon = ICONPATH .. "protocell.png",
        icon_size = 64,
        tint = {1, 1, 1, 0.8},
        scale = 0.36,
        shift = {-7, -6}
      },
      {
        icon = ICONPATH .. "grass.png",
        icon_size = 64,
        scale = 0.32,
        shift = {-7, -6}
      }
    },
    enabled = false,
    always_show_made_in = true,
    show_amount_in_title = false,
    always_show_products = true,
    category = "bio-harvesting",
    subgroup = "boxed-biology",
    order = "nullius-bc",
    energy_required = 5,
    ingredients = {
      {type="item", name="nullius-box-grass-seed", amount=5}
    },
    results = {
      {type="item", name="nullius-box-cellulose", amount=3},
      {type="item", name="nullius-box-sugar", amount=2}
    },
    main_product = "nullius-box-cellulose"
  },

  {
    type = "recipe",
    name = "nullius-cellulose-burning",
    localised_name = {"recipe-name.nullius-burning", {"item-name.nullius-cellulose"}},
    icons = {
      data.raw.fluid["nullius-carbon-dioxide"].icons[2],
      data.raw.fluid["nullius-carbon-dioxide"].icons[3],
      data.raw.fluid["nullius-carbon-dioxide"].icons[4],
      {
        icon = "__base__/graphics/decorative/brown-asterisk/hr-brown-asterisk-11.png",
        icon_size = 54,
        scale = 0.32,
        shift = {-8, -8}
      }
    },
    enabled = false,
    category = "combustion",
    subgroup = "biology-material",
    order = "nullius-pb",
    energy_required = 1,
    ingredients = {
      {type="item", name="nullius-cellulose", amount=4},
      {type="fluid", name="nullius-oxygen", amount=60}
    },
    results = {
      {type="item", name="nullius-graphite", amount=1},
      {type="fluid", name="nullius-carbon-dioxide", amount=100}
    }
  },
  {
    type = "recipe",
    name = "nullius-boxed-cellulose-burning",
    localised_name = {"recipe-name.nullius-boxed", {"recipe-name.nullius-burning",
        {"item-name.nullius-cellulose"}}},
    icons = {
      {
        icon = ICONPATH .. "crate.png",
        icon_size = 64
      },
      data.raw.fluid["nullius-carbon-dioxide"].icons[2],
      data.raw.fluid["nullius-carbon-dioxide"].icons[3],
      data.raw.fluid["nullius-carbon-dioxide"].icons[4],
      {
        icon = "__base__/graphics/decorative/brown-asterisk/hr-brown-asterisk-11.png",
        icon_size = 54,
        scale = 0.29,
        shift = {-7, -7}
      }
    },
    enabled = false,
    category = "combustion",
    subgroup = "boxed-organic-1",
    order = "nullius-bgb",
    energy_required = 5,
    ingredients = {
      {type="item", name="nullius-box-cellulose", amount=4},
      {type="fluid", name="nullius-oxygen", amount=300}
    },
    results = {
      {type="item", name="nullius-box-graphite", amount=1},
      {type="fluid", name="nullius-carbon-dioxide", amount=500}
    }
  },
  {
    type = "recipe",
    name = "nullius-cellulose-pyrolysis",
    localised_name = {"recipe-name.nullius-pyrolysis", {"item-name.nullius-cellulose"}},
    icons = {
      {
        icon = "__base__/graphics/icons/coal-dark-background.png",
        icon_size = 64,
        icon_mipmaps = 4
      },
      {
        icon = "__base__/graphics/decorative/brown-asterisk/hr-brown-asterisk-11.png",
        icon_size = 54,
        scale = 0.32,
        shift = {-8, -8}
      }
    },
    enabled = false,
    category = "wet-smelting",
    subgroup = "biology-material",
    order = "nullius-pc",
    energy_required = 2,
    ingredients = {
      {type="item", name="nullius-cellulose", amount=3},
      {type="fluid", name="nullius-nitrogen", amount=25}
    },
    results = {
      {type="item", name="nullius-graphite", amount=2},
      {type="fluid", name="nullius-carbon-monoxide", amount=10}
    }
  },
  {
    type = "recipe",
    name = "nullius-boxed-cellulose-pyrolysis",
    localised_name = {"recipe-name.nullius-boxed", {"recipe-name.nullius-pyrolysis",
        {"item-name.nullius-cellulose"}}},
    icons = {
      {
        icon = ICONPATH .. "crate.png",
        icon_size = 64
      },
      {
        icon = "__base__/graphics/icons/coal-dark-background.png",
        icon_size = 64,
        icon_mipmaps = 4,
        scale = 0.45
      },
      {
        icon = "__base__/graphics/decorative/brown-asterisk/hr-brown-asterisk-11.png",
        icon_size = 54,
        scale = 0.29,
        shift = {-7, -7}
      }
    },
    enabled = false,
    category = "bulk-smelting",
    subgroup = "boxed-organic-1",
    order = "nullius-bgc",
    energy_required = 2,
    ingredients = {
      {type="item", name="nullius-box-cellulose", amount=3},
      {type="fluid", name="nullius-nitrogen", amount=125}
    },
    results = {
      {type="item", name="nullius-box-graphite", amount=2},
      {type="fluid", name="nullius-carbon-monoxide", amount=50}
    }
  },
  {
    type = "recipe",
    name = "nullius-wood-burning",
    localised_name = {"recipe-name.nullius-burning", {"item-name.nullius-wood"}},
    icons = {
      {
        icon = "__base__/graphics/icons/fluid/steam.png",
        icon_size = 64,
        icon_mipmaps = 4
      },
      {
        icon = "__base__/graphics/icons/wood.png",
        icon_size = 64,
        icon_mipmaps = 4,
        scale = 0.3,
        shift = {-8, -8}
      }
    },
    enabled = false,
    category = "combustion",
    subgroup = "biology-tree",
    order = "nullius-h",
    energy_required = 1,
    ingredients = {
      {type="item", name="nullius-wood", amount=3},
      {type="fluid", name="nullius-water", amount=100},
      {type="fluid", name="nullius-oxygen", amount=200}
    },
    results = {
      {type="item", name="nullius-graphite", amount=1},
      {type="fluid", name="nullius-steam", amount=700},
      {type="fluid", name="nullius-carbon-dioxide", amount=100}
    },
    main_product = "nullius-steam"
  },
  {
    type = "recipe",
    name = "nullius-boxed-wood-burning",
    localised_name = {"recipe-name.nullius-boxed", {"recipe-name.nullius-burning",
        {"item-name.nullius-wood"}}},
    icons = {
      {
        icon = ICONPATH .. "crate.png",
        icon_size = 64
      },
      {
        icon = "__base__/graphics/icons/fluid/steam.png",
        icon_size = 64,
        icon_mipmaps = 4,
        scale = 0.45
      },
      {
        icon = "__base__/graphics/icons/wood.png",
        icon_size = 64,
        icon_mipmaps = 4,
        scale = 0.27,
        shift = {-7, -7}
      }
    },
    enabled = false,
    category = "combustion",
    subgroup = "boxed-wood",
    order = "nullius-cc",
    energy_required = 5,
    ingredients = {
      {type="item", name="nullius-box-wood", amount=3},
      {type="fluid", name="nullius-water", amount=500},
      {type="fluid", name="nullius-oxygen", amount=1000}
    },
    results = {
      {type="item", name="nullius-box-graphite", amount=1},
      {type="fluid", name="nullius-steam", amount=3500},
      {type="fluid", name="nullius-carbon-dioxide", amount=500}
    },
    main_product = "nullius-steam"
  },
  {
    type = "recipe",
    name = "nullius-worm-genome",
    enabled = false,
    category = "nanotechnology",
    energy_required = 40,
    ingredients = {
      {type="fluid", name="nullius-nucleotides", amount=10, fluidbox_index=1},
      {type="fluid", name="nullius-bacteria", amount=2, fluidbox_index=2},
      {type="item", name="nullius-algae-genome", amount=1},
      {type="item", name="nullius-box-astronomy-pack", amount=6},
      {type="item", name="nullius-box-geology-pack", amount=4}
    },
    results = {
      {type="item", name="nullius-worm-genome", amount=1},
      {type="fluid", name="nullius-wastewater", amount=4}
    },
    main_product = "nullius-worm-genome"
  },
  {
    type = "recipe",
    name = "nullius-worm-progenitor",
    enabled = false,
    category = "nanotechnology",
    energy_required = 240,
    ingredients = {
      {type="item", name="nullius-worm-genome", amount=1},
      {type="fluid", name="nullius-protocell", amount=12},
      {type="fluid", name="nullius-amino-acids", amount=10},
      {type="fluid", name="nullius-oil", amount=6},
      {type="item", name="nullius-sugar", amount=8}
    },
    results = {
      {type="item", name="nullius-worm-progenitor", amount=1},
      {type="fluid", name="nullius-wastewater", amount=10}
    },
    main_product = "nullius-worm-progenitor"
  },
  {
    type = "recipe",
    name = "nullius-worm-1",
    localised_name = {"", {"item-name.nullius-worm"}, " ", 1},
    icons = {
      {
        icon = "__base__/graphics/icons/small-worm.png",
        icon_size = 64,
        icon_mipmaps = 4
      },
      {
        icon = ICONPATH .. "protocell.png",
        icon_size = 64,
        scale = 0.3,
        shift = {9, -9}
      }
    },
    enabled = false,
    allow_decomposition = false,
    category = "ore-flotation",
    order = "nullius-db",
    energy_required = 20,
    ingredients = {
      {type="fluid", name="nullius-sludge", amount=100},
      {type="item", name="nullius-sand", amount=2},
      {type="fluid", name="nullius-oxygen", amount=150},
      {type="item", name="nullius-grass", amount=2},
      {type="item", name="nullius-worm-progenitor", amount=1}
    },
    results = {
      {type="item", name="nullius-worm", amount=1},
      {type="item", name="nullius-worm-egg", amount=2},
      {type="fluid", name="nullius-carbon-dioxide", amount=125, fluidbox_index=1}
    },
    main_product = "nullius-worm"
  },
  {
    type = "recipe",
    name = "nullius-worm-2",
    localised_name = {"", {"item-name.nullius-worm"}, " ", 2},
    enabled = false,
    allow_decomposition = false,
    category = "ore-flotation",
    order = "nullius-dc",
    energy_required = 25,
    ingredients = {
      {type="fluid", name="nullius-sludge", amount=300},
      {type="item", name="nullius-sand", amount=7},
      {type="fluid", name="nullius-oxygen", amount=600},
      {type="item", name="nullius-grass", amount=9},
      {type="item", name="nullius-worm-egg", amount=9}
    },
    results = {
      {type="item", name="nullius-worm", amount=8},
      {type="item", name="nullius-worm-egg", amount=10},
      {type="fluid", name="nullius-carbon-dioxide", amount=500, fluidbox_index=1}
    },
    main_product = "nullius-worm"
  },
  {
    type = "recipe",
    name = "nullius-worm-harvest",
    localised_name = {"recipe-name.nullius-harvest", {"item-name.nullius-worm"}},
    icons = {
      data.raw.fluid["nullius-amino-acids"].icons[2],
      data.raw.fluid["nullius-amino-acids"].icons[3],
      data.raw.fluid["nullius-amino-acids"].icons[4],
      {
        icon = "__base__/graphics/icons/small-worm.png",
        icon_size = 64,
        icon_mipmaps = 4,
        scale = 0.4,
        shift = {-8, -4}
      }
    },
    enabled = false,
    always_show_made_in = true,
    show_amount_in_title = false,
    always_show_products = true,
    category = "distillation",
    subgroup = "biology-worm",
    order = "nullius-fb",
    crafting_machine_tint = { primary = data.raw.fluid["nullius-amino-acids"].flow_color },
    energy_required = 8,
    ingredients = {
      {type="item", name="nullius-worm", amount=2},
      {type="fluid", name="nullius-saline", amount=60}
    },
    results = {
      {type="fluid", name="nullius-amino-acids", amount=45},
      {type="fluid", name="nullius-ammonia", amount=20},
      {type="fluid", name="nullius-wastewater", amount=50},
      {type="item", name="nullius-rutile", amount=1}
    },
    main_product = "nullius-amino-acids"
  },
  {
    type = "recipe",
    name = "nullius-worm-disposal",
    localised_name = {"recipe-name.nullius-disposal", {"item-name.nullius-worm"}},
    icons = {
      {
        icon = FLUIDPATH .. "sludge.png",
        icon_size = 64,
        icon_mipmaps = 4
      },
      {
        icon = "__base__/graphics/icons/small-worm.png",
        icon_size = 64,
        icon_mipmaps = 4,
        scale = 0.4,
        shift = {-8, -4}
      }
    },
    enabled = false,
    always_show_made_in = true,
    show_amount_in_title = false,
    always_show_products = true,
    category = "bio-harvesting",
    subgroup = "biology-worm",
    order = "nullius-fc",
    energy_required = 1,
    ingredients = {
      {type="item", name="nullius-worm", amount=1}
    },
    results = {
      {type="fluid", name="nullius-sludge", amount=20}
    },
    main_product = "nullius-sludge"
  },
  {
    type = "recipe",
    name = "nullius-worm-egg-harvest",
    localised_name = {"recipe-name.nullius-harvest", {"item-name.nullius-worm-egg"}},
    icons = {
      data.raw.fluid["nullius-amino-acids"].icons[2],
      data.raw.fluid["nullius-amino-acids"].icons[3],
      data.raw.fluid["nullius-amino-acids"].icons[4],
      {
        icon = ICONPATH .. "protocell.png",
        icon_size = 64,
        tint = {1, 1, 1, 0.8},
        scale = 0.4,
        shift = {-8, -7}
      },
      {
        icon = "__base__/graphics/icons/small-worm.png",
        icon_size = 64,
        icon_mipmaps = 4,
        scale = 0.32,
        shift = {-8, -7}
      }
    },
    enabled = false,
    always_show_made_in = true,
    show_amount_in_title = false,
    always_show_products = true,
    category = "distillation",
    subgroup = "biology-worm",
    order = "nullius-gb",
    crafting_machine_tint = { primary = data.raw.fluid["nullius-amino-acids"].flow_color },
    energy_required = 8,
    ingredients = {
      {type="item", name="nullius-worm-egg", amount=5},
      {type="fluid", name="nullius-saline", amount=10}
    },
    results = {
      {type="fluid", name="nullius-amino-acids", amount=6},
      {type="fluid", name="nullius-nucleotides", amount=2},
      {type="fluid", name="nullius-wastewater", amount=10}
    },
    main_product = "nullius-amino-acids"
  },
  {
    type = "recipe",
    name = "nullius-worm-egg-disposal",
    localised_name = {"recipe-name.nullius-disposal", {"item-name.nullius-worm-egg"}},
    icons = {
      {
        icon = FLUIDPATH .. "sludge.png",
        icon_size = 64,
        icon_mipmaps = 4
      },
      {
        icon = ICONPATH .. "protocell.png",
        icon_size = 64,
        tint = {1, 1, 1, 0.8},
        scale = 0.4,
        shift = {-8, -7}
      },
      {
        icon = "__base__/graphics/icons/small-worm.png",
        icon_size = 64,
        icon_mipmaps = 4,
        scale = 0.32,
        shift = {-8, -7}
      }
    },
    enabled = false,
    always_show_made_in = true,
    show_amount_in_title = false,
    always_show_products = true,
    category = "bio-harvesting",
    subgroup = "biology-worm",
    order = "nullius-gc",
    energy_required = 1,
    ingredients = {
      {type="item", name="nullius-worm-egg", amount=3}
    },
    results = {
      {type="fluid", name="nullius-sludge", amount=10}
    },
    main_product = "nullius-sludge"
  },

  {
    type = "recipe",
    name = "nullius-tree-genome",
    enabled = false,
    category = "nanotechnology",
    energy_required = 60,
    ingredients = {
      {type="fluid", name="nullius-nucleotides", amount=6, fluidbox_index=1},
      {type="item", name="nullius-grass-genome", amount=2},
      {type="item", name="nullius-box-astronomy-pack", amount=3},
      {type="item", name="nullius-box-mechanical-pack", amount=8}
    },
    results = {
      {type="item", name="nullius-tree-genome", amount=1},
      {type="fluid", name="nullius-wastewater", amount=5}
    },
    main_product = "nullius-tree-genome"
  },
  {
    type = "recipe",
    name = "nullius-tree-progenitor",
    enabled = false,
    category = "nanotechnology",
    energy_required = 270,
    ingredients = {
      {type="item", name="nullius-tree-genome", amount=1},
      {type="fluid", name="nullius-protocell", amount=15},
      {type="fluid", name="nullius-amino-acids", amount=10},
      {type="fluid", name="nullius-oil", amount=12},
      {type="item", name="nullius-sugar", amount=3},
      {type="item", name="nullius-rubber", amount=2},
      {type="item", name="nullius-cellulose", amount=10}
    },
    results = {
      {type="item", name="nullius-tree-progenitor", amount=1},
      {type="fluid", name="nullius-wastewater", amount=12}
    },
    main_product = "nullius-tree-progenitor"
  },
  {
    type = "recipe",
    name = "nullius-tree-1",
    localised_name = {"", {"item-name.nullius-tree"}, " ", 1},
    icons = {
      {
        icon = "__base__/graphics/icons/tree-08.png",
        icon_size = 64,
        icon_mipmaps = 4
      },
      {
        icon = ICONPATH .. "protocell.png",
        icon_size = 64,
        scale = 0.3,
        shift = {9, -9}
      }
    },
    enabled = false,
    allow_decomposition = false,
    category = "nullius-water-treatment",
    order = "nullius-db",
    energy_required = 40,
    ingredients = {
      {type="fluid", name="nullius-freshwater", amount=150},
      {type="fluid", name="nullius-air", amount=1000},
      {type="item", name="nullius-land-fill-sand", amount=1},
      {type="item", name="nullius-fertilizer", amount=1},
      {type="item", name="nullius-tree-progenitor", amount=1}
    },
    results = {
      {type="item", name="nullius-tree", amount=1},
      {type="fluid", name="nullius-sludge", amount=25},
      {type="fluid", name="nullius-oxygen", amount=250}
    },
    main_product = "nullius-tree"
  },
  {
    type = "recipe",
    name = "nullius-tree-2",
    localised_name = {"", {"item-name.nullius-tree"}, " ", 2},
    enabled = false,
    allow_decomposition = false,
    category = "nullius-water-treatment",
    order = "nullius-dc",
    energy_required = 50,
    ingredients = {
      {type="fluid", name="nullius-freshwater", amount=600},
      {type="fluid", name="nullius-air", amount=5000},
      {type="item", name="nullius-land-fill-sand", amount=4},
      {type="item", name="nullius-fertilizer", amount=5},
      {type="item", name="nullius-worm", amount=2},
      {type="item", name="nullius-tree-seed", amount=9}
    },
    results = {
      {type="item", name="nullius-tree", amount=5},
      {type="fluid", name="nullius-sludge", amount=100},
      {type="fluid", name="nullius-oxygen", amount=1200}
    },
    main_product = "nullius-tree"
  },
  {
    type = "recipe",
    name = "nullius-wood",
    enabled = false,
    always_show_made_in = true,
    show_amount_in_title = false,
    always_show_products = true,
    category = "bio-harvesting",
    subgroup = "biology-tree",
    order = "nullius-fb",
    energy_required = 3,
    ingredients = {
      {type="item", name="nullius-tree", amount=1}
    },
    results = {
      {type="item", name="nullius-wood", amount=15},
      {type="item", name="nullius-cellulose", amount=6},
      {type="item", name="nullius-tree-seed", amount=2},
      {type="fluid", name="nullius-sludge", amount=5}
    },
    main_product = "nullius-wood"
  },
  {
    type = "recipe",
    name = "nullius-boxed-wood",
    enabled = false,
    always_show_made_in = true,
    show_amount_in_title = false,
    always_show_products = true,
    category = "bio-harvesting",
    subgroup = "boxed-wood",
    order = "nullius-bb",
    energy_required = 15,
    ingredients = {
      {type="item", name="nullius-tree", amount=5}
    },
    results = {
      {type="item", name="nullius-box-wood", amount=15},
      {type="item", name="nullius-box-cellulose", amount=6},
      {type="item", name="nullius-tree-seed", amount=10},
      {type="fluid", name="nullius-sludge", amount=25}
    },
    main_product = "nullius-box-wood"
  },
  {
    type = "recipe",
    name = "nullius-latex",
    localised_name = {"recipe-name.nullius-latex"},
    icons = {
      {
        icon = ICONPATH .. "rubber.png",
        icon_size = 64
      },
      {
        icon = "__base__/graphics/icons/tree-08.png",
        icon_size = 64,
        icon_mipmaps = 4,
        scale = 0.3,
        shift = {-8, -8}
      }
    },
    enabled = false,
    category = "distillation",
    subgroup = "biology-tree",
    order = "nullius-fc",
    crafting_machine_tint = { primary = data.raw.fluid["nullius-acid-sulfuric"].flow_color },
    energy_required = 10,
    ingredients = {
      {type="item", name="nullius-tree", amount=2},
      {type="fluid", name="nullius-acid-sulfuric", amount=10},
      {type="item", name="nullius-sodium-sulfate", amount=1}
    },
    results = {
      {type="item", name="nullius-wood", amount=30},
      {type="item", name="nullius-cellulose", amount=10},
      {type="item", name="nullius-tree-seed", amount=4},
      {type="item", name="nullius-rubber", amount=8},
      {type="item", name="nullius-sugar", amount=6},
      {type="fluid", name="nullius-wastewater", amount=10}
    },
    main_product = "nullius-rubber"
  },
  {
    type = "recipe",
    name = "nullius-boxed-latex",
    localised_name = {"recipe-name.nullius-boxed", {"recipe-name.nullius-latex"}},
    icons = {
      {
        icon = ICONPATH .. "crate.png",
        icon_size = 64
      },
      {
        icon = ICONPATH .. "rubber.png",
        icon_size = 64,
        scale = 0.45
      },
      {
        icon = "__base__/graphics/icons/tree-08.png",
        icon_size = 64,
        icon_mipmaps = 4,
        scale = 0.27,
        shift = {-7, -7}
      }
    },
    enabled = false,
    category = "distillation",
    subgroup = "boxed-wood",
    order = "nullius-bc",
    crafting_machine_tint = { primary = data.raw.fluid["nullius-acid-sulfuric"].flow_color },
    energy_required = 50,
    ingredients = {
      {type="item", name="nullius-tree", amount=10},
      {type="fluid", name="nullius-acid-sulfuric", amount=50},
      {type="item", name="nullius-box-sodium-sulfate", amount=1}
    },
    results = {
      {type="item", name="nullius-box-wood", amount=30},
      {type="item", name="nullius-box-cellulose", amount=10},
      {type="item", name="nullius-tree-seed", amount=20},
      {type="item", name="nullius-box-rubber", amount=8},
      {type="item", name="nullius-box-sugar", amount=6},
      {type="fluid", name="nullius-wastewater", amount=50}
    },
    main_product = "nullius-box-rubber"
  },
  {
    type = "recipe",
    name = "nullius-wood-pulping",
    localised_name = {"recipe-name.nullius-wood-pulping"},
    icons = {
      {
        icon = "__base__/graphics/decorative/brown-asterisk/hr-brown-asterisk-11.png",
        icon_size = 54
      },
      {
        icon = "__base__/graphics/icons/wood.png",
        icon_size = 64,
        icon_mipmaps = 4,
        scale = 0.33,
        shift = {-8, -4}
      }
    },
    enabled = false,
    always_show_made_in = true,
    show_amount_in_title = false,
    always_show_products = true,
    category = "bio-harvesting",
    subgroup = "biology-tree",
    order = "nullius-g",
    energy_required = 1,
    ingredients = {
      {type="item", name="nullius-wood", amount=2}
    },
    result = "nullius-cellulose",
    result_count = 3
  },
  {
    type = "recipe",
    name = "nullius-boxed-wood-pulping",
    localised_name = {"recipe-name.nullius-boxed", {"recipe-name.nullius-wood-pulping"}},
    icons = {
      {
        icon = ICONPATH .. "crate.png",
        icon_size = 64
      },
      {
        icon = "__base__/graphics/decorative/brown-asterisk/hr-brown-asterisk-11.png",
        icon_size = 54,
        scale = 0.53
      },
      {
        icon = "__base__/graphics/icons/wood.png",
        icon_size = 64,
        icon_mipmaps = 4,
        scale = 0.3,
        shift = {-7, -4}
      }
    },
    enabled = false,
    always_show_made_in = true,
    show_amount_in_title = false,
    always_show_products = true,
    category = "bio-harvesting",
    subgroup = "boxed-wood",
    order = "nullius-cb",
    energy_required = 5,
    ingredients = {
      {type="item", name="nullius-box-wood", amount=2}
    },
    result = "nullius-box-cellulose",
    result_count = 3
  },
  {
    type = "recipe",
    name = "nullius-tree-seed-harvest",
    localised_name = {"recipe-name.nullius-harvest", {"item-name.nullius-tree-seed"}},
    icons = {
      {
        icon = "__base__/graphics/decorative/brown-asterisk/hr-brown-asterisk-11.png",
        icon_size = 54
      },
      {
        icon = ICONPATH .. "protocell.png",
        icon_size = 64,
        tint = {1, 1, 1, 0.8},
        scale = 0.4,
        shift = {-8, -7}
      },
      {
        icon = "__base__/graphics/icons/tree-08.png",
        icon_size = 64,
        icon_mipmaps = 4,
        scale = 0.28,
        shift = {-8, -7}
      }
    },
    enabled = false,
    always_show_made_in = true,
    show_amount_in_title = false,
    always_show_products = true,
    category = "bio-harvesting",
    subgroup = "biology-tree",
    order = "nullius-i",
    energy_required = 1,
    ingredients = {
      {type="item", name="nullius-tree-seed", amount=4}
    },
    results = {
      {type="item", name="nullius-cellulose", amount=2},
      {type="fluid", name="nullius-oil", amount=3}
    },
    main_product = "nullius-cellulose"
  },
  {
    type = "recipe",
    name = "nullius-fish-genome",
    enabled = false,
    category = "nanotechnology",
    energy_required = 60,
    ingredients = {
      {type="fluid", name="nullius-nucleotides", amount=8, fluidbox_index=1},
      {type="item", name="nullius-worm-genome", amount=2},
      {type="item", name="nullius-box-astronomy-pack", amount=4},
      {type="item", name="nullius-box-mechanical-pack", amount=6}
    },
    results = {
      {type="item", name="nullius-fish-genome", amount=1},
      {type="fluid", name="nullius-wastewater", amount=5}
    },
    main_product = "nullius-fish-genome"
  },
  {
    type = "recipe",
    name = "nullius-fish-progenitor",
    enabled = false,
    category = "nanotechnology",
    energy_required = 300,
    ingredients = {
      {type="item", name="nullius-fish-genome", amount=1},
      {type="fluid", name="nullius-protocell", amount=18},
      {type="fluid", name="nullius-amino-acids", amount=12},
      {type="fluid", name="nullius-oil", amount=15},
      {type="item", name="nullius-calcium", amount=2},
      {type="item", name="nullius-sugar", amount=10}
    },
    results = {
      {type="item", name="nullius-fish-progenitor", amount=1},
      {type="fluid", name="nullius-wastewater", amount=15}
    },
    main_product = "nullius-fish-progenitor"
  },
  {
    type = "recipe",
    name = "nullius-fish-1",
    localised_name = {"", {"item-name.nullius-fish"}, " ", 1},
    icons = {
      {
        icon = "__base__/graphics/icons/fish.png",
        icon_size = 64,
        icon_mipmaps = 4
      },
      {
        icon = ICONPATH .. "protocell.png",
        icon_size = 64,
        scale = 0.3,
        shift = {9, -9}
      }
    },
    enabled = false,
    allow_decomposition = false,
    category = "ore-flotation",
    order = "nullius-db",
    energy_required = 35,
    ingredients = {
      {type="fluid", name="nullius-seawater", amount=400},
      {type="fluid", name="nullius-oxygen", amount=500},
      {type="item", name="nullius-algae", amount=6},
      {type="item", name="nullius-worm", amount=2},
      {type="item", name="nullius-fish-progenitor", amount=2}
    },
    results = {
      {type="item", name="nullius-fish", amount=2},
      {type="item", name="nullius-fish-egg", amount=1},
      {type="fluid", name="nullius-wastewater", amount=300},
      {type="fluid", name="nullius-carbon-dioxide", amount=400}
    },
    main_product = "nullius-fish"
  },
  {
    type = "recipe",
    name = "nullius-fish-2",
    localised_name = {"", {"item-name.nullius-fish"}, " ", 2},
    enabled = false,
    allow_decomposition = false,
    category = "ore-flotation",
    order = "nullius-dc",
    energy_required = 40,
    ingredients = {
      {type="fluid", name="nullius-seawater", amount=800},
      {type="fluid", name="nullius-oxygen", amount=1000},
      {type="item", name="nullius-algae", amount=10},
      {type="item", name="nullius-worm", amount=3},
      {type="item", name="nullius-fish-egg", amount=8}
    },
    results = {
      {type="item", name="nullius-fish", amount=6},
      {type="item", name="nullius-fish-egg", amount=10},
      {type="fluid", name="nullius-wastewater", amount=600},
      {type="fluid", name="nullius-carbon-dioxide", amount=800}
    },
    main_product = "nullius-fish"
  },
  {
    type = "recipe",
    name = "nullius-fish-harvest",
    localised_name = {"recipe-name.nullius-harvest", {"item-name.nullius-fish"}},
    icons = {
      data.raw.fluid["nullius-oil"].icons[1],
      {
        icon = "__base__/graphics/icons/fish.png",
        icon_size = 64,
        icon_mipmaps = 4,
        scale = 0.3,
        shift = {-8, -8}
      }
    },
    enabled = false,
    always_show_made_in = true,
    show_amount_in_title = false,
    always_show_products = true,
    category = "distillation",
    subgroup = "biology-fish",
    order = "nullius-fb",
    crafting_machine_tint = { primary = data.raw.fluid["nullius-oil"].flow_color },
    energy_required = 10,
    ingredients = {
      {type="item", name="nullius-fish", amount=2},
      {type="fluid", name="nullius-saline", amount=80}
    },
    results = {
      {type="fluid", name="nullius-oil", amount=80},
      {type="fluid", name="nullius-amino-acids", amount=30},
      {type="fluid", name="nullius-wastewater", amount=50},
      {type="item", name="nullius-lithium-chloride", amount=1}
    },
    main_product = "nullius-oil"
  },
  {
    type = "recipe",
    name = "nullius-fish-disposal",
    localised_name = {"recipe-name.nullius-disposal", {"item-name.nullius-fish"}},
    icons = {
      {
        icon = FLUIDPATH .. "sludge.png",
        icon_size = 64,
        icon_mipmaps = 4
      },
      {
        icon = "__base__/graphics/icons/fish.png",
        icon_size = 64,
        icon_mipmaps = 4,
        scale = 0.3,
        shift = {-8, -8}
      }
    },
    enabled = false,
    always_show_made_in = true,
    show_amount_in_title = false,
    always_show_products = true,
    category = "bio-harvesting",
    subgroup = "biology-fish",
    order = "nullius-fc",
    energy_required = 1,
    ingredients = {
      {type="item", name="nullius-fish", amount=1}
    },
    results = {
      {type="fluid", name="nullius-sludge", amount=25}
    },
    main_product = "nullius-sludge"
  },
  {
    type = "recipe",
    name = "nullius-fish-egg-harvest",
    localised_name = {"recipe-name.nullius-harvest", {"item-name.nullius-fish-egg"}},
    icons = {
      data.raw.fluid["nullius-oil"].icons[1],
      {
        icon = ICONPATH .. "protocell.png",
        icon_size = 64,
        tint = {1, 1, 1, 0.8},
        scale = 0.4,
        shift = {-8, -7}
      },
      {
        icon = "__base__/graphics/icons/fish.png",
        icon_size = 64,
        icon_mipmaps = 4,
        scale = 0.25,
        tint = {1, 1, 1, 0.9},
        shift = {-8, -7}
      }
    },
    enabled = false,
    always_show_made_in = true,
    show_amount_in_title = false,
    always_show_products = true,
    category = "distillation",
    subgroup = "biology-fish",
    order = "nullius-gb",
    crafting_machine_tint = { primary = data.raw.fluid["nullius-oil"].flow_color },
    energy_required = 10,
    ingredients = {
      {type="item", name="nullius-fish-egg", amount=5},
      {type="fluid", name="nullius-saline", amount=15}
    },
    results = {
      {type="fluid", name="nullius-oil", amount=10},
      {type="fluid", name="nullius-nucleotides", amount=3},
      {type="fluid", name="nullius-wastewater", amount=10}
    },
    main_product = "nullius-oil"
  },
  {
    type = "recipe",
    name = "nullius-fish-egg-disposal",
    localised_name = {"recipe-name.nullius-disposal", {"item-name.nullius-fish-egg"}},
    icons = {
      {
        icon = FLUIDPATH .. "sludge.png",
        icon_size = 64,
        icon_mipmaps = 4
      },
      {
        icon = ICONPATH .. "protocell.png",
        icon_size = 64,
        tint = {1, 1, 1, 0.8},
        scale = 0.4,
        shift = {-8, -7}
      },
      {
        icon = "__base__/graphics/icons/fish.png",
        icon_size = 64,
        icon_mipmaps = 4,
        scale = 0.25,
        tint = {1, 1, 1, 0.9},
        shift = {-8, -7}
      }
    },
    enabled = false,
    always_show_made_in = true,
    show_amount_in_title = false,
    always_show_products = true,
    category = "bio-harvesting",
    subgroup = "biology-fish",
    order = "nullius-gc",
    energy_required = 1,
    ingredients = {
      {type="item", name="nullius-fish-egg", amount=4}
    },
    results = {
      {type="fluid", name="nullius-sludge", amount=15}
    },
    main_product = "nullius-sludge"
  },

  {
    type = "recipe",
    name = "nullius-arthropod-genome",
    enabled = false,
    category = "nanotechnology",
    energy_required = 80,
    ingredients = {
      {type="fluid", name="nullius-nucleotides", amount=15, fluidbox_index=1},
      {type="fluid", name="nullius-bacteria", amount=3, fluidbox_index=2},
      {type="item", name="nullius-fish-genome", amount=1},
      {type="item", name="nullius-box-astronomy-pack", amount=12},
      {type="item", name="nullius-box-physics-pack", amount=10}
    },
    results = {
      {type="item", name="nullius-arthropod-genome", amount=1},
      {type="fluid", name="nullius-wastewater", amount=10}
    },
    main_product = "nullius-arthropod-genome"
  },
  {
    type = "recipe",
    name = "nullius-arthropod-progenitor",
    enabled = false,
    category = "nanotechnology",
    energy_required = 360,
    ingredients = {
      {type="item", name="nullius-arthropod-genome", amount=1},
      {type="fluid", name="nullius-protocell", amount=25},
      {type="fluid", name="nullius-amino-acids", amount=20},
      {type="fluid", name="nullius-oil", amount=16},
      {type="item", name="nullius-plastic", amount=3},
      {type="item", name="nullius-graphene", amount=1},
      {type="item", name="nullius-sugar", amount=8},
      {type="item", name="nullius-cellulose", amount=6}
    },
    results = {
      {type="item", name="nullius-arthropod-progenitor", amount=1},
      {type="fluid", name="nullius-sludge", amount=10}
    },
    main_product = "nullius-arthropod-progenitor"
  },
  {
    type = "recipe",
    name = "nullius-arthropod-1",
    localised_name = {"", {"item-name.nullius-arthropod"}, " ", 1},
    icons = {
      {
        icon = "__base__/graphics/icons/small-biter.png",
        icon_size = 64,
        icon_mipmaps = 4
      },
      {
        icon = ICONPATH .. "protocell.png",
        icon_size = 64,
        scale = 0.3,
        shift = {9, -9}
      }
    },
    enabled = false,
    allow_decomposition = false,
    category = "nullius-water-treatment",
    order = "nullius-db",
    energy_required = 35,
    ingredients = {
      {type="fluid", name="nullius-freshwater", amount=200},
      {type="fluid", name="nullius-oxygen", amount=800},
      {type="item", name="nullius-cellulose", amount=10},
      {type="item", name="nullius-fish", amount=5},
      {type="item", name="nullius-arthropod-progenitor", amount=2},
      {type="item", name="nullius-gun", amount=1},
      {type="item", name="nullius-magazine", amount=3}
    },
    results = {
      {type="item", name="nullius-arthropod", amount=2},
      {type="item", name="nullius-arthropod-egg", amount=1},
      {type="item", name="nullius-iron-oxide", amount=1},
      {type="fluid", name="nullius-sludge", amount=50},
      {type="fluid", name="nullius-carbon-dioxide", amount=600}
    },
    main_product = "nullius-arthropod"
  },
  {
    type = "recipe",
    name = "nullius-arthropod-2",
    localised_name = {"", {"item-name.nullius-arthropod"}, " ", 2},
    enabled = false,
    allow_decomposition = false,
    category = "nullius-water-treatment",
    order = "nullius-dc",
    energy_required = 40,
    ingredients = {
      {type="fluid", name="nullius-freshwater", amount=400},
      {type="fluid", name="nullius-oxygen", amount=1500},
      {type="item", name="nullius-box-wood", amount=2},
      {type="item", name="nullius-fish", amount=8},
      {type="item", name="nullius-arthropod-egg", amount=7},
      {type="item", name="nullius-gun", amount=1},
      {type="item", name="nullius-box-magazine", amount=2}
    },
    results = {
      {type="item", name="nullius-arthropod", amount=6},
      {type="item", name="nullius-arthropod-egg", amount=9},
      {type="item", name="nullius-iron-oxide", amount=4},
      {type="fluid", name="nullius-sludge", amount=100},
      {type="fluid", name="nullius-carbon-dioxide", amount=1200}
    },
    main_product = "nullius-arthropod"
  },
  {
    type = "recipe",
    name = "nullius-arthropod-harvest",
    localised_name = {"recipe-name.nullius-harvest", {"item-name.nullius-arthropod"}},
    icons = {
      {
        icon = ICONPATH .. "plate.png",
        icon_size = 64,
        tint = {0.4, 0.4, 0.4, 0.4}
      },
      {
        icon = "__base__/graphics/icons/small-biter.png",
        icon_size = 64,
        icon_mipmaps = 4,
        scale = 0.3,
        shift = {-8, -8}
      }
    },
    enabled = false,
    always_show_made_in = true,
    show_amount_in_title = false,
    always_show_products = true,
    category = "distillation",
    subgroup = "biology-arthropod",
    order = "nullius-fb",
    crafting_machine_tint = { primary = data.raw.fluid["nullius-amino-acids"].flow_color },
    energy_required = 8,
    ingredients = {
      {type="item", name="nullius-arthropod", amount=1},
      {type="fluid", name="nullius-saline", amount=60}
    },
    results = {
      {type="item", name="nullius-plastic", amount=8},
      {type="item", name="nullius-cellulose", amount=3},
      {type="item", name="nullius-graphene", amount=1},
      {type="fluid", name="nullius-oil", amount=30},
      {type="fluid", name="nullius-amino-acids", amount=40},
      {type="fluid", name="nullius-heavy-water", amount=5}
    },
    main_product = "nullius-graphene"
  },
  {
    type = "recipe",
    name = "nullius-boxed-arthropod-harvest",
    localised_name = {"recipe-name.nullius-boxed", {"recipe-name.nullius-harvest", {"item-name.nullius-arthropod"}}},
    icons = {
      {
        icon = ICONPATH .. "crate.png",
        icon_size = 64
      },
      {
        icon = ICONPATH .. "plate.png",
        icon_size = 64,
        tint = {0.4, 0.4, 0.4, 0.4},
        scale = 0.45
      },
      {
        icon = "__base__/graphics/icons/small-biter.png",
        icon_size = 64,
        icon_mipmaps = 4,
        scale = 0.27,
        shift = {-7, -7}
      }
    },
    enabled = false,
    always_show_made_in = true,
    show_amount_in_title = false,
    always_show_products = true,
    category = "distillation",
    subgroup = "boxed-biology",
    order = "nullius-mb",
    crafting_machine_tint = { primary = data.raw.fluid["nullius-oil"].flow_color },
    energy_required = 40,
    ingredients = {
      {type="item", name="nullius-arthropod", amount=5},
      {type="fluid", name="nullius-saline", amount=300}
    },
    results = {
      {type="item", name="nullius-box-plastic", amount=8},
      {type="item", name="nullius-box-cellulose", amount=3},
      {type="item", name="nullius-box-graphene", amount=1},
      {type="fluid", name="nullius-oil", amount=150},
      {type="fluid", name="nullius-amino-acids", amount=200},
      {type="fluid", name="nullius-heavy-water", amount=25}
    },
    main_product = "nullius-box-graphene"
  },
  {
    type = "recipe",
    name = "nullius-arthropod-disposal",
    localised_name = {"recipe-name.nullius-disposal", {"item-name.nullius-arthropod"}},
    icons = {
      {
        icon = FLUIDPATH .. "sludge.png",
        icon_size = 64,
        icon_mipmaps = 4
      },
      {
        icon = "__base__/graphics/icons/small-biter.png",
        icon_size = 64,
        icon_mipmaps = 4,
        scale = 0.3,
        shift = {-8, -8}
      }
    },
    enabled = false,
    always_show_made_in = true,
    show_amount_in_title = false,
    always_show_products = true,
    category = "bio-harvesting",
    subgroup = "biology-arthropod",
    order = "nullius-fc",
    energy_required = 4,
    ingredients = {
      {type="fluid", name="nullius-saline", amount=12},
      {type="item", name="nullius-arthropod", amount=1}
    },
    results = {
      {type="fluid", name="nullius-sludge", amount=30},
      {type="item", name="nullius-plastic", amount=5},
      {type="item", name="nullius-cellulose", amount=1}
    },
    main_product = "nullius-plastic"
  },
  {
    type = "recipe",
    name = "nullius-boxed-arthropod-disposal",
    localised_name = {"recipe-name.nullius-boxed", {"recipe-name.nullius-disposal", {"item-name.nullius-arthropod"}}},
    icons = {
      {
        icon = ICONPATH .. "crate.png",
        icon_size = 64
      },
      {
        icon = FLUIDPATH .. "sludge.png",
        icon_size = 64,
        icon_mipmaps = 4,
        scale = 0.45
      },
      {
        icon = "__base__/graphics/icons/small-biter.png",
        icon_size = 64,
        icon_mipmaps = 4,
        scale = 0.27,
        shift = {-7, -7}
      }
    },
    enabled = false,
    always_show_made_in = true,
    show_amount_in_title = false,
    always_show_products = true,
    category = "bio-harvesting",
    subgroup = "boxed-biology",
    order = "nullius-mc",
    energy_required = 20,
    ingredients = {
      {type="fluid", name="nullius-saline", amount=60},
      {type="item", name="nullius-arthropod", amount=5}
    },
    results = {
      {type="fluid", name="nullius-sludge", amount=150},
      {type="item", name="nullius-box-plastic", amount=5},
      {type="item", name="nullius-box-cellulose", amount=1}
    },
    main_product = "nullius-box-plastic"
  },
  {
    type = "recipe",
    name = "nullius-arthropod-egg-harvest",
    localised_name = {"recipe-name.nullius-harvest", {"item-name.nullius-arthropod-egg"}},
    icons = {
      data.raw.fluid["nullius-nucleotides"].icons[2],
      data.raw.fluid["nullius-nucleotides"].icons[3],
      data.raw.fluid["nullius-nucleotides"].icons[4],
      {
        icon = ICONPATH .. "protocell.png",
        icon_size = 64,
        tint = {1, 1, 1, 0.8},
        scale = 0.4,
        shift = {-8, -7}
      },
      {
        icon = "__base__/graphics/icons/small-biter.png",
        icon_size = 64,
        icon_mipmaps = 4,
        scale = 0.28,
        tint = {1, 1, 1, 0.9},
        shift = {-8, -7}
      }
    },
    enabled = false,
    always_show_made_in = true,
    show_amount_in_title = false,
    always_show_products = true,
    category = "distillation",
    subgroup = "biology-arthropod",
    order = "nullius-gb",
    crafting_machine_tint = { primary = data.raw.fluid["nullius-nucleotides"].flow_color },
    energy_required = 5,
    ingredients = {
      {type="item", name="nullius-arthropod-egg", amount=2},
      {type="fluid", name="nullius-saline", amount=15}
    },
    results = {
      {type="item", name="nullius-plastic", amount=3},
      {type="fluid", name="nullius-amino-acids", amount=12},
      {type="fluid", name="nullius-nucleotides", amount=5},
      {type="fluid", name="nullius-heavy-water", amount=2}
    },
    main_product = "nullius-nucleotides"
  },
  {
    type = "recipe",
    name = "nullius-arthropod-egg-disposal",
    localised_name = {"recipe-name.nullius-disposal", {"item-name.nullius-arthropod-egg"}},
    icons = {
      {
        icon = FLUIDPATH .. "sludge.png",
        icon_size = 64,
        icon_mipmaps = 4
      },
      {
        icon = ICONPATH .. "protocell.png",
        icon_size = 64,
        tint = {1, 1, 1, 0.8},
        scale = 0.4,
        shift = {-8, -7}
      },
      {
        icon = "__base__/graphics/icons/small-biter.png",
        icon_size = 64,
        icon_mipmaps = 4,
        scale = 0.28,
        tint = {1, 1, 1, 0.9},
        shift = {-8, -7}
      }
    },
    enabled = false,
    always_show_made_in = true,
    show_amount_in_title = false,
    always_show_products = true,
    category = "bio-harvesting",
    subgroup = "biology-arthropod",
    order = "nullius-gc",
    energy_required = 1,
    ingredients = {
      {type="item", name="nullius-arthropod-egg", amount=1}
    },
    results = {
      {type="fluid", name="nullius-sludge", amount=6},
      {type="item", name="nullius-plastic", amount=1}
    },
    main_product = "nullius-plastic"
  },
  {
    type = "recipe",
    name = "nullius-plastic-pyrolysis",
    localised_name = {"recipe-name.nullius-pyrolysis", {"item-name.nullius-plastic"}},
    icons = {
      {
        icon = "__base__/graphics/icons/coal-dark-background.png",
        icon_size = 64,
        icon_mipmaps = 4
      },
      {
        icon = "__base__/graphics/icons/plastic-bar.png",
        icon_size = 64,
        icon_mipmaps = 4,
        scale = 0.3,
        shift = {-8, -8}
      }
    },
    enabled = false,
    category = "wet-smelting",
    subgroup = "biology-material",
    order = "nullius-q",
    energy_required = 1,
    ingredients = {
      {type="item", name="nullius-plastic", amount=10},
      {type="fluid", name="nullius-oxygen", amount=60}
    },
    results = {
      {type="item", name="nullius-graphite", amount=4},
      {type="fluid", name="nullius-carbon-monoxide", amount=40}
    }
  },
  {
    type = "recipe",
    name = "nullius-boxed-plastic-pyrolysis",
    localised_name = {"recipe-name.nullius-boxed", {"recipe-name.nullius-pyrolysis", {"item-name.nullius-plastic"}}},
    icons = {
      {
        icon = ICONPATH .. "crate.png",
        icon_size = 64
      },
      {
        icon = "__base__/graphics/icons/coal-dark-background.png",
        icon_size = 64,
        icon_mipmaps = 4,
        scale = 0.45
      },
      {
        icon = "__base__/graphics/icons/plastic-bar.png",
        icon_size = 64,
        icon_mipmaps = 4,
        scale = 0.27,
        shift = {-7, -7}
      }
    },
    enabled = false,
    category = "bulk-smelting",
    subgroup = "boxed-organic-1",
    order = "nullius-bh",
    energy_required = 1,
    ingredients = {
      {type="item", name="nullius-box-plastic", amount=10},
      {type="fluid", name="nullius-oxygen", amount=300}
    },
    results = {
      {type="item", name="nullius-box-graphite", amount=4},
      {type="fluid", name="nullius-carbon-monoxide", amount=200}
    }
  },

  {
    type = "recipe",
    name = "nullius-wooden-chest",
    localised_name = {"recipe-name.nullius-wooden", {"entity-name.nullius-small-chest-1"}},
    icons = {{
      icon = "__base__/graphics/icons/wooden-chest.png",
      icon_size = 64,
      icon_mipmaps = 4
    }},
    enabled = false,
    always_show_made_in = true,
    show_amount_in_title = false,
    always_show_products = true,
    allow_as_intermediate = false,
    category = "medium-crafting",
    subgroup = "woodworking",
    order = "nullius-b",
    energy_required = 3,
    ingredients = {
      {type="item", name="nullius-wood", amount=2},
      {type="item", name="nullius-iron-rod", amount=1},
      {type="fluid", name="nullius-epoxy", amount=1}
    },
    results = {
      {type="item", name="nullius-small-chest-1", amount=2},
      {type="item", name="nullius-cellulose", amount=1}
    },
    main_product = "nullius-small-chest-1"
  },

  {
    type = "recipe",
    name = "nullius-wooden-power-pole-1",
    localised_name = {"recipe-name.nullius-wooden", {"entity-name.nullius-power-pole-1"}},
    icons = {{
      icon = "__base__/graphics/icons/small-electric-pole.png",
      icon_size = 64,
      icon_mipmaps = 4,
      tint = {0.75, 0.75, 0.9}
    }},
    enabled = false,
    always_show_made_in = true,
    show_amount_in_title = false,
    always_show_products = true,
    allow_as_intermediate = false,
    category = "medium-crafting",
    subgroup = "woodworking",
    order = "nullius-cb",
    energy_required = 3,
    ingredients = {
      {"nullius-aluminum-wire", 2},
      {"nullius-wood", 1}
    },
    result = "nullius-power-pole-1",
    result_count = 2
  },
  {
    type = "recipe",
    name = "nullius-boxed-wooden-power-pole-1",
    localised_name = {"recipe-name.nullius-wooden", {"item-name.nullius-box", {"entity-name.nullius-power-pole-1"}}},
    icons = {
      {
        icon = ICONPATH .. "crate.png",
        icon_size = 64
      },
      {
        icon = "__base__/graphics/icons/small-electric-pole.png",
        icon_size = 64,
        icon_mipmaps = 4,
        tint = {0.75, 0.75, 0.9},
        scale = 0.45
      }
    },
    enabled = false,
    always_show_made_in = true,
    show_amount_in_title = false,
    always_show_products = true,
    category = "large-assembly",
    subgroup = "boxed-wood",
    order = "nullius-wbb",
    energy_required = 15,
    ingredients = {
      {"nullius-box-aluminum-wire", 2},
      {"nullius-box-wood", 1}
    },
    result = "nullius-box-power-pole-1",
    result_count = 2
  },
  {
    type = "recipe",
    name = "nullius-wooden-power-pole-2",
    localised_name = {"recipe-name.nullius-wooden", {"entity-name.nullius-power-pole-2"}},
    icons = {{
      icon = "__base__/graphics/icons/small-electric-pole.png",
      icon_size = 64,
      icon_mipmaps = 4,
      tint = {1, 0.85, 0.85}
    }},
    enabled = false,
    always_show_made_in = true,
    show_amount_in_title = false,
    always_show_products = true,
    allow_as_intermediate = false,
    category = "medium-crafting",
    subgroup = "woodworking",
    order = "nullius-cc",
    energy_required = 5,
    ingredients = {
      {type="item", name="nullius-power-pole-1", amount=1},
      {type="item", name="copper-cable", amount=4},
      {type="item", name="nullius-wood", amount=3},
      {type="fluid", name="nullius-epoxy", amount=2}
    },
    result = "nullius-power-pole-2",
    result_count = 3
  },
  {
    type = "recipe",
    name = "nullius-boxed-wooden-power-pole-2",
    localised_name = {"recipe-name.nullius-wooden", {"item-name.nullius-box", {"entity-name.nullius-power-pole-2"}}},
    icons = {
      {
        icon = ICONPATH .. "crate.png",
        icon_size = 64
      },
      {
        icon = "__base__/graphics/icons/small-electric-pole.png",
        icon_size = 64,
        icon_mipmaps = 4,
        tint = {1, 0.85, 0.85},
        scale = 0.45
      }
    },
    enabled = false,
    always_show_made_in = true,
    show_amount_in_title = false,
    always_show_products = true,
    category = "large-assembly",
    subgroup = "boxed-wood",
    order = "nullius-wbc",
    energy_required = 25,
    ingredients = {
      {type="item", name="nullius-box-power-pole-1", amount=1},
      {type="item", name="nullius-box-insulated-wire", amount=4},
      {type="item", name="nullius-box-wood", amount=3},
      {type="fluid", name="nullius-epoxy", amount=10}
    },
    result = "nullius-box-power-pole-2",
    result_count = 3
  },

  {
    type = "recipe",
    name = "nullius-wooden-rail",
    localised_name = {"recipe-name.nullius-wooden", {"item-name.rail"}},
    icons = {
      {
        icon = "__base__/graphics/icons/rail.png",
        icon_size = 64,
        icon_mipmaps = 4
      },
      {
        icon = "__base__/graphics/icons/wood.png",
        icon_size = 64,
        icon_mipmaps = 4,
        scale = 0.3,
        shift = {-8, -8}
      }
    },
    enabled = false,
    always_show_made_in = true,
    show_amount_in_title = false,
    always_show_products = true,
    allow_as_intermediate = false,
    category = "large-crafting",
    subgroup = "woodworking",
    order = "nullius-d",
    energy_required = 4,
    ingredients = {
      {type="item", name="nullius-steel-beam", amount=2},
      {type="item", name="nullius-wood", amount=3},
      {type="item", name="nullius-steel-rod", amount=1},
      {type="item", name="nullius-gravel", amount=5},
      {type="fluid", name="nullius-epoxy", amount=2}
    },
    result = "rail",
    result_count = 4
  },
  {
    type = "recipe",
    name = "nullius-boxed-wooden-rail",
    localised_name = {"recipe-name.nullius-wooden", {"item-name.nullius-box", {"item-name.rail"}}},
    icons = {
      {
        icon = ICONPATH .. "crate.png",
        icon_size = 64
      },
      {
        icon = "__base__/graphics/icons/rail.png",
        icon_size = 64,
        icon_mipmaps = 4,
        scale = 0.45
      },
      {
        icon = "__base__/graphics/icons/wood.png",
        icon_size = 64,
        icon_mipmaps = 4,
        scale = 0.27,
        shift = {-7, -7}
      }
    },
    enabled = false,
    always_show_made_in = true,
    show_amount_in_title = false,
    always_show_products = true,
    category = "huge-assembly",
    subgroup = "boxed-wood",
    order = "nullius-wc",
    energy_required = 20,
    ingredients = {
      {type="item", name="nullius-box-steel-beam", amount=2},
      {type="item", name="nullius-box-wood", amount=3},
      {type="item", name="nullius-box-steel-rod", amount=1},
      {type="item", name="nullius-box-gravel", amount=5},
      {type="fluid", name="nullius-epoxy", amount=10}
    },
    result = "nullius-box-rail",
    result_count = 4
  },
  {
    type = "recipe",
    name = "nullius-wooden-wall",
    localised_name = {"recipe-name.nullius-wooden", {"entity-name.stone-wall"}},
    icons = {
      {
        icon = "__base__/graphics/icons/wall.png",
        icon_size = 64,
        icon_mipmaps = 4
      },
      {
        icon = "__base__/graphics/icons/wood.png",
        icon_size = 64,
        icon_mipmaps = 4,
        scale = 0.3,
        shift = {-8, -8}
      }
    },
    enabled = false,
    always_show_made_in = true,
    show_amount_in_title = false,
    always_show_products = true,
    allow_as_intermediate = false,
    category = "large-crafting",
    subgroup = "woodworking",
    order = "nullius-e",
    energy_required = 4,
    ingredients = {
      {type="item", name="refined-concrete", amount=4},
      {type="item", name="nullius-steel-beam", amount=2},
      {type="item", name="nullius-insulation", amount=2},
      {type="item", name="nullius-mortar", amount=1},
      {type="item", name="nullius-wood", amount=8},
      {type="item", name="nullius-steel-rod", amount=1},
      {type="fluid", name="nullius-epoxy", amount=5}
    },
    results = {
      {type="item", name="stone-wall", amount=5},
      {type="item", name="nullius-cellulose", amount=3}
    },
    main_product = "stone-wall"
  },
  {
    type = "recipe",
    name = "nullius-boxed-wooden-wall",
    localised_name = {"recipe-name.nullius-wooden", {"item-name.nullius-box", {"entity-name.stone-wall"}}},
    icons = {
      {
        icon = ICONPATH .. "crate.png",
        icon_size = 64
      },
      {
        icon = "__base__/graphics/icons/wall.png",
        icon_size = 64,
        icon_mipmaps = 4,
        scale = 0.45
      },
      {
        icon = "__base__/graphics/icons/wood.png",
        icon_size = 64,
        icon_mipmaps = 4,
        scale = 0.27,
        shift = {-7, -7}
      }
    },
    enabled = false,
    always_show_made_in = true,
    show_amount_in_title = false,
    always_show_products = true,
    category = "huge-assembly",
    subgroup = "boxed-wood",
    order = "nullius-wd",
    energy_required = 20,
    ingredients = {
      {type="item", name="nullius-box-reinforced-concrete", amount=2},
      {type="item", name="nullius-box-steel-beam", amount=2},
      {type="item", name="nullius-box-insulation", amount=2},
      {type="item", name="nullius-mortar", amount=5},
      {type="item", name="nullius-box-wood", amount=8},
      {type="item", name="nullius-box-steel-rod", amount=1},
      {type="fluid", name="nullius-epoxy", amount=25}
    },
    results = {
      {type="item", name="nullius-box-wall", amount=5},
      {type="item", name="nullius-box-cellulose", amount=3}
    },
    main_product = "nullius-box-wall"
  },
  {
    type = "recipe",
    name = "nullius-wooden-medium-assembler-1",
    localised_name = {"recipe-name.nullius-wooden", {"entity-name.nullius-medium-assembler-1"}},
    icons = {
      data.raw.item["nullius-medium-assembler-1"].icons[1],
      {
        icon = "__base__/graphics/icons/wood.png",
        icon_size = 64,
        icon_mipmaps = 4,
        scale = 0.3,
        shift = {-8, -8}
      }
    },
    enabled = false,
    always_show_made_in = true,
    show_amount_in_title = false,
    always_show_products = true,
    allow_as_intermediate = false,
    category = "large-crafting",
    subgroup = "woodworking",
    order = "nullius-f",
    energy_required = 15,
    ingredients = {
      {"nullius-small-assembler-1", 5},
      {"nullius-wood", 7}
    },
    result = "nullius-medium-assembler-1",
    result_count = 3
  },
  {
    type = "recipe",
    name = "nullius-wooden-medium-miner-1",
    localised_name = {"recipe-name.nullius-wooden", {"entity-name.nullius-medium-miner-1"}},
    icons = {
      data.raw.item["nullius-medium-miner-1"].icons[1],
      {
        icon = "__base__/graphics/icons/wood.png",
        icon_size = 64,
        icon_mipmaps = 4,
        scale = 0.3,
        shift = {-8, -8}
      }
    },
    enabled = false,
    always_show_made_in = true,
    show_amount_in_title = false,
    always_show_products = true,
    allow_as_intermediate = false,
    category = "large-crafting",
    subgroup = "woodworking",
    order = "nullius-g",
    energy_required = 15,
    ingredients = {
      {"nullius-small-miner-1", 5},
      {"nullius-box-wood", 2}
    },
    result = "nullius-medium-miner-1",
    result_count = 3
  },

  {
    type = "recipe",
    name = "nullius-biochemistry-pack",
    enabled = false,
    category = "basic-chemistry",
    crafting_machine_tint = {
      primary = data.raw.fluid["nullius-amino-acids"].flow_color,
      secondary = data.raw.fluid["nullius-fatty-acids"].flow_color
    },
    energy_required = 80,
    ingredients = {
      {type="item", name="nullius-box-chemical-pack", amount=10},
      {type="item", name="nullius-box-electrical-pack", amount=5},
      {type="item", name="nullius-box-sugar", amount=5},
      {type="fluid", name="nullius-amino-acids", amount=200},
      {type="fluid", name="nullius-fatty-acids", amount=250},
      {type="fluid", name="nullius-nucleotides", amount=100}
    },
    result = "nullius-biochemistry-pack"
  },
  {
    type = "recipe",
    name = "nullius-microbiology-pack",
    enabled = false,
    category = "small-fluid-assembly",
    energy_required = 90,
    ingredients = {
      {type="item", name="nullius-algae-progenitor", amount=1},
      {type="item", name="nullius-algae", amount=50},
      {type="fluid", name="nullius-bacteria", amount=100}
    },
    result = "nullius-microbiology-pack"
  },
  {
    type = "recipe",
    name = "nullius-botany-pack",
    enabled = false,
    always_show_made_in = true,
    category = "small-crafting",
    energy_required = 120,
    ingredients = {
      {type="item", name="nullius-grass-progenitor", amount=1},
      {type="item", name="nullius-grass", amount=50},
      {type="item", name="nullius-box-cellulose", amount=40}
    },
    result = "nullius-botany-pack"
  },
  {
    type = "recipe",
    name = "nullius-dendrology-pack",
    enabled = false,
    always_show_made_in = true,
    category = "huge-crafting",
    energy_required = 160,
    ingredients = {
      {type="item", name="nullius-tree-progenitor", amount=1},
      {type="item", name="nullius-tree", amount=25},
      {type="item", name="nullius-box-wood", amount=20}
    },
    result = "nullius-dendrology-pack"
  },
  {
    type = "recipe",
    name = "nullius-nematology-pack",
    enabled = false,
    category = "small-fluid-assembly",
    energy_required = 100,
    ingredients = {
      {type="item", name="nullius-worm-progenitor", amount=1},
      {type="item", name="nullius-worm", amount=40},
      {type="fluid", name="nullius-carbon-dioxide", amount=2000}
    },
    result = "nullius-nematology-pack"
  },
  {
    type = "recipe",
    name = "nullius-ichthyology-pack",
    enabled = false,
    category = "small-fluid-assembly",
    energy_required = 120,
    ingredients = {
      {type="item", name="nullius-fish-progenitor", amount=1},
      {type="item", name="nullius-fish", amount=30},
      {type="fluid", name="nullius-wastewater", amount=2000}
    },
    result = "nullius-ichthyology-pack"
  },
  {
    type = "recipe",
    name = "nullius-zoology-pack",
    enabled = false,
    always_show_made_in = true,
    category = "large-crafting",
    energy_required = 200,
    ingredients = {
      {type="item", name="nullius-arthropod-progenitor", amount=1},
      {type="item", name="nullius-arthropod", amount=20},
      {type="item", name="nullius-box-plastic", amount=10}
    },
    result = "nullius-zoology-pack"
  },

  {
    type = "recipe",
    name = "nullius-broken-air-filter",
    localised_name = {"recipe-name.nullius-repair", {"entity-name.nullius-air-filter-1"}},
    icons = data.raw.item["nullius-broken-air-filter"].icons,
      enabled = false,
    always_show_made_in = true,
    show_amount_in_title = false,
    always_show_products = true,
    allow_decomposition = false,
    allow_as_intermediate = false,
    no_productivity = true,
    category = "hand-crafting",
    subgroup = "broken",
    order = "nullius-c",
    energy_required = 3,
    ingredients = {
      {"nullius-broken-air-filter", 1},
      {"nullius-iron-sheet", 2}
    },
    result = "nullius-air-filter-1"
  },
  {
    type = "recipe",
    name = "nullius-broken-hydro-plant",
    localised_name = {"recipe-name.nullius-repair", {"entity-name.nullius-hydro-plant-1"}},
    icons = data.raw.item["nullius-broken-hydro-plant"].icons,
      enabled = false,
    always_show_made_in = true,
    show_amount_in_title = false,
    always_show_products = true,
    allow_decomposition = false,
    allow_as_intermediate = false,
    no_productivity = true,
    category = "hand-crafting",
    subgroup = "broken",
    order = "nullius-e",
    energy_required = 4,
    ingredients = {
      {"nullius-broken-hydro-plant", 1},
      {"nullius-pipe-1", 4}
    },
    result = "nullius-hydro-plant-1"
  },
  {
    type = "recipe",
    name = "nullius-broken-electrolyzer",
    localised_name = {"recipe-name.nullius-repair", {"entity-name.nullius-priority-electrolyzer-1"}},
    icons = data.raw.item["nullius-broken-electrolyzer"].icons,
      enabled = false,
    always_show_made_in = true,
    show_amount_in_title = false,
    always_show_products = true,
    allow_decomposition = false,
    allow_as_intermediate = false,
    no_productivity = true,
    category = "large-crafting",
    subgroup = "broken",
    order = "nullius-g",
    energy_required = 6,
    ingredients = {
      {"nullius-broken-electrolyzer", 1},
      {"nullius-iron-wire", 5}
    },
    result = "nullius-priority-electrolyzer-1"
  },
  {
    type = "recipe",
    name = "nullius-broken-chemical-plant",
    localised_name = {"recipe-name.nullius-repair", {"entity-name.nullius-chemical-plant-1"}},
    icons = data.raw.item["nullius-broken-chemical-plant"].icons,
      enabled = false,
    always_show_made_in = true,
    show_amount_in_title = false,
    always_show_products = true,
    allow_decomposition = false,
    allow_as_intermediate = false,
    no_productivity = true,
    category = "hand-crafting",
    subgroup = "broken",
    order = "nullius-i",
    energy_required = 5,
    ingredients = {
      {"nullius-broken-chemical-plant", 1},
      {"nullius-one-way-valve", 2}
    },
    result = "nullius-chemical-plant-1"
  },
  {
    type = "recipe",
    name = "nullius-broken-foundry",
    localised_name = {"recipe-name.nullius-repair", {"entity-name.nullius-foundry-1"}},
    icons = data.raw.item["nullius-broken-foundry"].icons,
      enabled = false,
    always_show_made_in = true,
    show_amount_in_title = false,
    always_show_products = true,
    allow_decomposition = false,
    allow_as_intermediate = false,
    no_productivity = true,
    category = "hand-crafting",
    subgroup = "broken",
    order = "nullius-k",
    energy_required = 4,
    ingredients = {
      {"nullius-broken-foundry", 1},
      {"stone-brick", 5}
    },
    result = "nullius-foundry-1"
  },
  {
    type = "recipe",
    name = "nullius-broken-assembler",
    localised_name = {"recipe-name.nullius-repair", {"entity-name.nullius-medium-assembler-1"}},
    icons = data.raw.item["nullius-broken-assembler"].icons,
      enabled = false,
    always_show_made_in = true,
    show_amount_in_title = false,
    always_show_products = true,
    allow_decomposition = false,
    allow_as_intermediate = false,
    no_productivity = true,
    category = "hand-crafting",
    subgroup = "broken",
    order = "nullius-m",
    energy_required = 3,
    ingredients = {
      {"nullius-broken-assembler", 1},
      {"nullius-iron-gear", 2}
    },
    result = "nullius-medium-assembler-1"
  },
  {
    type = "recipe",
    name = "nullius-broken-pylon",
    localised_name = {"recipe-name.nullius-repair", {"entity-name.nullius-pylon-1"}},
    icons = data.raw.item["nullius-broken-pylon"].icons,
      enabled = false,
    always_show_made_in = true,
    show_amount_in_title = false,
    always_show_products = true,
    allow_decomposition = false,
    allow_as_intermediate = false,
    no_productivity = true,
    category = "hand-crafting",
    subgroup = "broken",
    order = "nullius-o",
    energy_required = 2,
    ingredients = {
      {"nullius-broken-pylon", 1},
      {"nullius-iron-rod", 2}
    },
    result = "big-electric-pole"
  },
  {
    type = "recipe",
    name = "nullius-broken-solar-panel",
    localised_name = {"recipe-name.nullius-repair", {"entity-name.nullius-solar-panel-1"}},
    icons = data.raw.item["nullius-broken-solar-panel"].icons,
      enabled = false,
    always_show_made_in = true,
    show_amount_in_title = false,
    always_show_products = true,
    allow_decomposition = false,
    allow_as_intermediate = false,
    no_productivity = true,
    category = "hand-crafting",
    subgroup = "broken",
    order = "nullius-q",
    energy_required = 8,
    ingredients = {
      {"nullius-broken-solar-panel", 1},
      {"nullius-sand", 1}
    },
    result = "nullius-solar-panel-1"
  },
  {
    type = "recipe",
    name = "nullius-broken-grid-battery",
    localised_name = {"recipe-name.nullius-repair", {"entity-name.nullius-grid-battery-1"}},
    icons = data.raw.item["nullius-broken-grid-battery"].icons,
      enabled = false,
    always_show_made_in = true,
    show_amount_in_title = false,
    always_show_products = true,
    allow_decomposition = false,
    allow_as_intermediate = false,
    no_productivity = true,
    category = "hand-crafting",
    subgroup = "broken",
    order = "nullius-s",
    energy_required = 6,
    ingredients = {
      {"nullius-broken-grid-battery", 1},
      {"nullius-graphite", 1}
    },
    result = "nullius-grid-battery-1"
  },
  {
    type = "recipe",
    name = "nullius-broken-sensor-node",
    localised_name = {"recipe-name.nullius-repair", {"entity-name.nullius-sensor-node-1"}},
    icons = data.raw.item["nullius-broken-sensor-node"].icons,
      enabled = false,
    always_show_made_in = true,
    show_amount_in_title = false,
    always_show_products = true,
    allow_decomposition = false,
    allow_as_intermediate = false,
    no_productivity = true,
    category = "hand-crafting",
    subgroup = "broken",
    order = "nullius-u",
    energy_required = 10,
    ingredients = {
      {"nullius-broken-sensor-node", 1},
      {"decider-combinator", 1},
      {"small-lamp", 2}
    },
    result = "nullius-sensor-node-1"
  },

  =============================================================================

  {
    type = "recipe",
    name = "nullius-small-furnace-1",
    enabled = false,
    category = "medium-crafting",
    always_show_made_in = true,
    energy_required = 8,
    ingredients = {
      {"stone-brick", 4},
      {"nullius-iron-wire", 2},
      {"nullius-iron-plate", 1}
    },
    result = "nullius-small-furnace-1"
  },

  {
    type = "recipe",
    name = "nullius-small-furnace-2",
    enabled = false,
    category = "medium-crafting",
    always_show_made_in = true,
    energy_required = 15,
    ingredients = {
      {"nullius-small-furnace-1", 1},
      {"nullius-refractory-brick", 8},
      {"nullius-crucible", 1},
      {"nullius-steel-plate", 4}
    },
    result = "nullius-small-furnace-2"
  },

  {
    type = "recipe",
    name = "nullius-small-furnace-3",
    enabled = false,
    category = "medium-crafting",
    always_show_made_in = true,
    energy_required = 20,
    ingredients = {
      {"nullius-small-furnace-2", 1},
      {"nullius-refractory-brick", 15},
      {"nullius-mortar", 8},
      {"nullius-iron-wire", 6},
      {"nullius-aluminum-wire", 6},
      {"nullius-sensor-1", 1}
    },
    result = "nullius-small-furnace-3"
  },

  {
    type = "recipe",
    name = "nullius-medium-furnace-1",
    enabled = false,
    category = "large-crafting",
    always_show_made_in = true,
    energy_required = 15,
    ingredients = {
      {"nullius-small-furnace-2", 2},
      {"nullius-chimney-1", 1}
    },
    result = "nullius-medium-furnace-1"
  },

  {
    type = "recipe",
    name = "nullius-medium-furnace-2",
    enabled = false,
    category = "large-crafting",
    always_show_made_in = true,
    energy_required = 30,
    ingredients = {
      {"nullius-medium-furnace-1", 1},
      {"nullius-small-furnace-3", 1},
      {"nullius-combustion-chamber-2", 1},
      {"nullius-heat-pipe-1", 3}
    },
    result = "nullius-medium-furnace-2"
  },

  {
    type = "recipe",
    name = "nullius-medium-furnace-3",
    enabled = false,
    always_show_made_in = true,
    category = "large-crafting",
    energy_required = 40,
    ingredients = {
      {"nullius-medium-furnace-2", 1},
      {"nullius-air-filter-2", 1},
      {"nullius-combustion-chamber-3", 1},
      {"nullius-box-heat-pipe-2", 1},
      {"nullius-transformer", 1},
      {"nullius-box-titanium-plate", 2},
      {"nullius-box-wall", 2}
    },
    result = "nullius-medium-furnace-3"
  },

  {
    type = "recipe",
    name = "nullius-large-furnace-1",
    enabled = false,
    category = "huge-crafting",
    always_show_made_in = true,
    energy_required = 20,
    ingredients = {
      {"nullius-medium-furnace-2", 2},
      {"nullius-steel-beam", 8},
      {"concrete", 20}
    },
    result = "nullius-large-furnace-1"
  },

  {
    type = "recipe",
    name = "nullius-large-furnace-2",
    enabled = false,
    always_show_made_in = true,
    category = "huge-crafting",
    energy_required = 30,
    ingredients = {
      {"nullius-large-furnace-1", 1},
      {"nullius-medium-furnace-3", 2},
      {"nullius-substation-2", 1},
      {"nullius-box-insulation", 2},
      {"nullius-box-belt-4", 2}
    },
    result = "nullius-large-furnace-2"
  },

  {
    type = "recipe",
    name = "nullius-small-assembler-1",
    enabled = false,
    category = "medium-crafting",
    always_show_made_in = true,
    energy_required = 6,
    ingredients = {
      {"inserter", 1},
      {"transport-belt", 1},
      {"nullius-small-chest-1", 1}
    },
    result = "nullius-small-assembler-1"
  },
  {
    type = "recipe",
    name = "nullius-small-assembler-2",
    enabled = false,
    category = "medium-crafting",
    always_show_made_in = true,
    energy_required = 12,
    ingredients = {
      {"nullius-small-assembler-1", 1},
      {"repair-pack", 2},
      {"splitter", 1},
      {"nullius-small-chest-2", 2}
    },
    result = "nullius-small-assembler-2"
  },
  {
    type = "recipe",
    name = "nullius-small-assembler-3",
    enabled = false,
    show_amount_in_title = false,
    always_show_products = true,
    always_show_made_in = true,
    category = "tiny-crafting",
    energy_required = 20,
    ingredients = {
      {"nullius-small-assembler-2", 2},
      {"nullius-hangar-1", 1},
      {"nullius-construction-bot-2", 2},
      {"nullius-large-buffer-chest-1", 1},
      {"express-stack-filter-inserter", 3}
    },
    result = "nullius-small-assembler-3",
    result_count = 2
  },

  {
    type = "recipe",
    name = "nullius-medium-assembler-1",
    enabled = false,
    category = "large-crafting",
    always_show_made_in = true,
    energy_required = 10,
    ingredients = {
      {"nullius-small-assembler-1", 2},
      {"nullius-steel-beam", 2}
    },
    result = "nullius-medium-assembler-1"
  },
  {
    type = "recipe",
    name = "nullius-medium-assembler-2",
    enabled = false,
    category = "large-crafting",
    always_show_made_in = true,
    energy_required = 15,
    ingredients = {
      {"nullius-medium-assembler-1", 1},
      {"nullius-small-assembler-2", 1},
      {"nullius-aluminum-sheet", 6},
      {"red-wire", 4}
    },
    result = "nullius-medium-assembler-2"
  },
  {
    type = "recipe",
    name = "nullius-medium-assembler-3",
    enabled = false,
    category = "small-crafting",
    always_show_made_in = true,
    energy_required = 20,
    ingredients = {
      {"nullius-medium-assembler-2", 1},
      {"nullius-small-assembler-3", 1},
      {"nullius-charger-2", 1},
      {"nullius-logistic-bot-2", 1},
      {"express-transport-belt", 4},
      {"stone-wall", 4}
    },
    result = "nullius-medium-assembler-3"
  },

  {
    type = "recipe",
    name = "nullius-large-assembler-1",
    enabled = false,
    category = "large-crafting",
    always_show_made_in = true,
    energy_required = 20,
    ingredients = {
      {"nullius-medium-assembler-2", 2},
      {"stone-brick", 20},
      {"nullius-mortar", 5},
      {"fast-transport-belt", 12}
    },
    result = "nullius-large-assembler-1"
  },
  {
    type = "recipe",
    name = "nullius-large-assembler-2",
    enabled = false,
    category = "huge-crafting",
    always_show_made_in = true,
    energy_required = 30,
    ingredients = {
      {"nullius-large-assembler-1", 1},
      {"nullius-medium-assembler-3", 1},
      {"nullius-relay-2", 1},
      {"gate", 2},
      {"nullius-substation-2", 1}
    },
    result = "nullius-large-assembler-2"
  },


  {
    type = "recipe",
    name = "nullius-small-miner-1",
    enabled = false,
    always_show_made_in = true,
    show_amount_in_title = false,
    always_show_products = true,
    category = "medium-crafting",
    energy_required = 6,
    ingredients = {
      {"nullius-motor-1", 2},
      {"nullius-iron-gear", 3},
      {"nullius-iron-plate", 4}
    },
    result = "nullius-small-miner-1",
    result_count = 2
  },
  {
    type = "recipe",
    name = "nullius-small-miner-2",
    enabled = false,
    always_show_made_in = true,
    category = "medium-crafting",
    energy_required = 10,
    ingredients = {
      {"nullius-small-miner-1", 1},
      {"nullius-motor-2", 1},
      {"nullius-steel-plate", 5},
      {"nullius-aluminum-carbide", 2}
    },
    result = "nullius-small-miner-2"
  },
  {
    type = "recipe",
    name = "nullius-small-miner-3",
    enabled = false,
    always_show_made_in = true,
    category = "medium-crafting",
    energy_required = 15,
    ingredients = {
      {type="item", name="nullius-small-miner-2", amount=1},
      {type="item", name="nullius-motor-3", amount=1},
      {type="item", name="nullius-titanium-plate", amount=4},
      {type="item", name="nullius-box-ceramic-powder", amount=2},
      {type="item", name="express-splitter", amount=1}
    },
    result = "nullius-small-miner-3"
  },

  {
    type = "recipe",
    name = "nullius-medium-miner-1",
    enabled = false,
    category = "large-crafting",
    always_show_made_in = true,
    energy_required = 10,
    ingredients = {
      {"nullius-small-miner-1", 2},
      {"nullius-steel-beam", 3}
    },
    result = "nullius-medium-miner-1"
  },
  {
    type = "recipe",
    name = "nullius-medium-miner-2",
    enabled = false,
    category = "large-crafting",
    always_show_made_in = true,
    energy_required = 20,
    ingredients = {
      {"nullius-medium-miner-1", 1},
      {"nullius-small-miner-2", 2},
      {"nullius-steel-gear", 6},
      {"nullius-aluminum-plate", 3}
    },
    result = "nullius-medium-miner-2"
  },
  {
    type = "recipe",
    name = "nullius-medium-miner-3",
    enabled = false,
    always_show_made_in = true,
    category = "large-fluid-assembly",
    energy_required = 30,
    ingredients = {
      {type="item", name="nullius-medium-miner-2", amount=2},
      {type="item", name="nullius-small-miner-3", amount=2},
      {type="item", name="nullius-box-belt-3", amount=3},
      {type="item", name="nullius-sensor-2", amount=1},
      {type="item", name="nullius-transformer", amount=1},
      {type="fluid", name="nullius-lubricant", amount=50}
    },
    result = "nullius-medium-miner-3"
  },

  {
    type = "recipe",
    name = "nullius-large-miner-1",
    enabled = false,
    category = "huge-crafting",
    always_show_made_in = true,
    energy_required = 20,
    ingredients = {
      {"nullius-medium-miner-2", 2},
      {"nullius-steel-cable", 6},
      {"nullius-steel-sheet", 4}
    },
    result = "nullius-large-miner-1"
  },
  {
    type = "recipe",
    name = "nullius-large-miner-2",
    enabled = false,
    category = "huge-crafting",
    always_show_made_in = true,
    energy_required = 40,
    ingredients = {
      {"nullius-large-miner-1", 1},
      {"nullius-medium-miner-3", 2},
      {"nullius-box-rail", 4},
      {"nullius-cargo-wagon-1", 1},
      {"nullius-locomotive-1", 1}
    },
    result = "nullius-large-miner-2"
  },

  {
    type = "recipe",
    name = "nullius-wind-turbine-1",
    enabled = false,
    category = "large-crafting",
    always_show_made_in = true,
    energy_required = 5,
    ingredients = {
      {"nullius-backup-turbine-1", 2},
      {"nullius-power-pole-1", 3}
    },
    result = "nullius-wind-turbine-1"
  },
  {
    type = "recipe",
    name = "nullius-boxed-wind-turbine-1",
    enabled = false,
    category = "huge-assembly",
    subgroup = "boxed-fluid-energy",
    always_show_made_in = true,
    energy_required = 25,
    ingredients = {
      {"nullius-box-backup-turbine-1", 2},
      {"nullius-box-power-pole-1", 3}
    },
    result = "nullius-box-wind-turbine-1"
  },
  {
    type = "recipe",
    name = "nullius-wind-turbine-2",
    enabled = false,
    category = "huge-crafting",
    always_show_made_in = true,
    energy_required = 15,
    ingredients = {
      {"nullius-wind-turbine-1", 1},
      {"nullius-standard-turbine-2", 1},
      {"big-electric-pole", 2},
      {"nullius-steel-cable", 5},
      {"concrete", 10}
    },
    result = "nullius-wind-turbine-2"
  },
  {
    type = "recipe",
    name = "nullius-boxed-wind-turbine-2",
    enabled = false,
    category = "huge-assembly",
    subgroup = "boxed-fluid-energy",
    always_show_made_in = true,
    energy_required = 75,
    ingredients = {
      {"nullius-box-wind-turbine-1", 1},
      {"nullius-box-standard-turbine-2", 1},
      {"nullius-box-pylon-1", 2},
      {"nullius-box-steel-cable", 5},
      {"nullius-box-concrete", 5}
    },
    result = "nullius-box-wind-turbine-2"
  },
  {
    type = "recipe",
    name = "nullius-wind-turbine-3",
    enabled = false,
    always_show_made_in = true,
    category = "huge-crafting",
    energy_required = 20,
    ingredients = {
      {"nullius-wind-turbine-2", 2},
      {"nullius-standard-turbine-3", 2},
      {"nullius-pylon-2", 2},
      {"nullius-carbon-composite", 10},
      {"refined-concrete", 16}
    },
    result = "nullius-wind-turbine-3"
  },
  {
    type = "recipe",
    name = "nullius-boxed-wind-turbine-3",
    enabled = false,
    always_show_made_in = true,
    category = "huge-assembly",
    subgroup = "boxed-fluid-energy",
    energy_required = 100,
    ingredients = {
      {"nullius-box-wind-turbine-2", 2},
      {"nullius-box-standard-turbine-3", 2},
      {"nullius-box-pylon-2", 2},
      {"nullius-box-carbon-composite", 10},
      {"nullius-box-reinforced-concrete", 8}
    },
    result = "nullius-box-wind-turbine-3"
  },

  {
    type = "recipe",
    name = "nullius-foundry-1",
    enabled = false,
    category = "large-crafting",
    always_show_made_in = true,
    energy_required = 8,
    ingredients = {
      {"nullius-small-furnace-1", 1},
      {"inserter", 2},
      {"nullius-iron-plate", 3}
    },
    result = "nullius-foundry-1"
  },
  {
    type = "recipe",
    name = "nullius-foundry-2",
    enabled = false,
    category = "large-crafting",
    always_show_made_in = true,
    energy_required = 12,
    ingredients = {
      {"nullius-foundry-1", 1},
      {"nullius-medium-furnace-1", 1},
      {"nullius-crucible", 3},
      {"turbo-filter-inserter", 5},
      {"fast-transport-belt", 4}
    },
    result = "nullius-foundry-2"
  },
  {
    type = "recipe",
    name = "nullius-foundry-3",
    enabled = false,
    always_show_made_in = true,
    category = "large-crafting",
    energy_required = 20,
    ingredients = {
      {"nullius-foundry-2", 2},
      {"nullius-medium-furnace-3", 1},
      {"nullius-medium-assembler-3", 1},
      {"nullius-thermal-tank-1", 1}
    },
    result = "nullius-foundry-3"
  },

  {
    type = "recipe",
    name = "nullius-crusher-1",
    enabled = false,
    category = "large-crafting",
    always_show_made_in = true,
    energy_required = 5,
    ingredients = {
      {"nullius-small-miner-1", 1},
      {"transport-belt", 2},
      {"nullius-iron-wire", 3},
      {"stone-brick", 8}
    },
    result = "nullius-crusher-1"
  },
  {
    type = "recipe",
    name = "nullius-crusher-2",
    enabled = false,
    category = "large-crafting",
    always_show_made_in = true,
    energy_required = 10,
    ingredients = {
      {"nullius-crusher-1", 1},
      {"nullius-medium-miner-2", 1},
      {"copper-cable", 6},
      {"fast-splitter", 1}
    },
    result = "nullius-crusher-2"
  },
  {
    type = "recipe",
    name = "nullius-crusher-3",
    enabled = false,
    category = "large-crafting",
    always_show_made_in = true,
    energy_required = 20,
    ingredients = {
      {"nullius-crusher-2", 2},
      {"nullius-medium-miner-3", 1},
      {"ultimate-splitter", 1},
      {"nullius-box-wall", 2}
    },
    result = "nullius-crusher-3"
  },


  {
    type = "recipe",
    name = "nullius-small-chest-1",
    enabled = false,
    category = "medium-crafting",
    always_show_made_in = true,
    energy_required = 2,
    ingredients = {
      {"nullius-iron-sheet", 2},
      {"nullius-iron-rod", 1}
    },
    result = "nullius-small-chest-1"
  },
  {
    type = "recipe",
    name = "nullius-small-chest-2",
    enabled = false,
    category = "medium-crafting",
    always_show_made_in = true,
    energy_required = 3,
    ingredients = {
      {"nullius-small-chest-1", 1},
      {"nullius-steel-sheet", 4},
      {"nullius-steel-rod", 2},
      {"nullius-rubber", 1}
    },
    result = "nullius-small-chest-2"
  },
  {
    type = "recipe",
    name = "nullius-small-chest-3",
    enabled = false,
    category = "large-fluid-assembly",
    always_show_made_in = true,
    energy_required = 4,
    ingredients = {
      {type="item", name="nullius-small-chest-2", amount=1},
      {type="item", name="nullius-titanium-sheet", amount=4},
      {type="item", name="nullius-titanium-rod", amount=2},
      {type="fluid", name="nullius-epoxy", amount=4, fluidbox_index=1}
    },
    result = "nullius-small-chest-3"
  },


  {
    type = "recipe",
    name = "nullius-large-chest-1",
    enabled = false,
    category = "medium-crafting",
    always_show_made_in = true,
    energy_required = 5,
    ingredients = {
      {"nullius-small-chest-2", 5},
      {"nullius-aluminum-plate", 4}
    },
    result = "nullius-large-chest-1"
  },
  {
    type = "recipe",
    name = "nullius-large-chest-2",
    enabled = false,
    category = "medium-crafting",
    always_show_made_in = true,
    energy_required = 6,
    ingredients = {
      {"nullius-large-chest-1", 1},
      {"nullius-small-chest-3", 4},
      {"nullius-titanium-plate", 4}
    },
    result = "nullius-large-chest-2"
  },

  {
    type = "recipe",
    name = "nullius-small-storage-chest-1",
    enabled = false,
    category = "medium-crafting",
    always_show_made_in = true,
    energy_required = 2,
    ingredients = {
      {"nullius-small-chest-2", 1},
      {"programmable-speaker", 1},
      {"arithmetic-combinator", 1}
    },
    result = "nullius-small-storage-chest-1"
  },
  {
    type = "recipe",
    name = "nullius-large-storage-chest-1",
    enabled = false,
    category = "medium-crafting",
    always_show_made_in = true,
    energy_required = 4,
    ingredients = {
      {"nullius-small-storage-chest-1", 1},
      {"nullius-large-chest-1", 1},
      {"nullius-sensor-1", 1},
      {"red-wire", 4}
    },
    result = "nullius-large-storage-chest-1"
  },
  {
    type = "recipe",
    name = "nullius-small-storage-chest-2",
    enabled = false,
    always_show_made_in = true,
    category = "medium-crafting",
    energy_required = 5,
    ingredients = {
      {"nullius-small-storage-chest-1", 1},
      {"nullius-small-chest-3", 1},
      {"nullius-relay-2", 1},
      {"nullius-processor-2", 1}
    },
    result = "nullius-small-storage-chest-2"
  },
  {
    type = "recipe",
    name = "nullius-large-storage-chest-2",
    enabled = false,
    always_show_made_in = true,
    category = "medium-crafting",
    energy_required = 8,
    ingredients = {
      {"nullius-large-storage-chest-1", 1},
      {"nullius-small-storage-chest-2", 1},
      {"nullius-large-chest-2", 1},
      {"express-stack-filter-inserter", 1}
    },
    result = "nullius-large-storage-chest-2"
  },
  {
    type = "recipe",
    name = "nullius-small-supply-chest-1",
    enabled = false,
    category = "medium-crafting",
    always_show_made_in = true,
    energy_required = 1,
    ingredients = {
      {"nullius-small-storage-chest-1", 1},
      {"red-wire", 1}
    },
    result = "nullius-small-supply-chest-1"
  },
  {
    type = "recipe",
    name = "nullius-large-supply-chest-1",
    enabled = false,
    category = "medium-crafting",
    always_show_made_in = true,
    energy_required = 1,
    ingredients = {
      {"nullius-large-storage-chest-1", 1},
      {"nullius-small-supply-chest-1", 1}
    },
    result = "nullius-large-supply-chest-1"
  },
  {
    type = "recipe",
    name = "nullius-small-supply-chest-2",
    enabled = false,
    always_show_made_in = true,
    category = "medium-crafting",
    energy_required = 2,
    ingredients = {
      {"nullius-small-supply-chest-1", 1},
      {"nullius-small-storage-chest-2", 1}
    },
    result = "nullius-small-supply-chest-2"
  },
  {
    type = "recipe",
    name = "nullius-large-supply-chest-2",
    enabled = false,
    always_show_made_in = true,
    category = "medium-crafting",
    energy_required = 3,
    ingredients = {
      {"nullius-large-supply-chest-1", 1},
      {"nullius-large-storage-chest-2", 1}
    },
    result = "nullius-large-supply-chest-2"
  },

  
  {
    type = "recipe",
    name = "nullius-small-demand-chest-1",
    enabled = false,
    category = "medium-crafting",
    always_show_made_in = true,
    energy_required = 1,
    ingredients = {
      {"nullius-small-storage-chest-1", 1},
      {"nullius-sensor-1", 1}
    },
    result = "nullius-small-demand-chest-1"
  },
  {
    type = "recipe",
    name = "nullius-large-demand-chest-1",
    enabled = false,
    category = "medium-crafting",
    always_show_made_in = true,
    energy_required = 1,
    ingredients = {
      {"nullius-large-storage-chest-1", 1},
      {"nullius-small-demand-chest-1", 1}
    },
    result = "nullius-large-demand-chest-1"
  },
  {
    type = "recipe",
    name = "nullius-small-demand-chest-2",
    enabled = false,
    always_show_made_in = true,
    category = "medium-crafting",
    energy_required = 2,
    ingredients = {
      {"nullius-small-demand-chest-1", 1},
      {"nullius-small-storage-chest-2", 1}
    },
    result = "nullius-small-demand-chest-2"
  },
  {
    type = "recipe",
    name = "nullius-large-demand-chest-2",
    enabled = false,
    always_show_made_in = true,
    category = "medium-crafting",
    energy_required = 3,
    ingredients = {
      {"nullius-large-demand-chest-1", 1},
      {"nullius-large-storage-chest-2", 1}
    },
    result = "nullius-large-demand-chest-2"
  },

  
  {
    type = "recipe",
    name = "nullius-small-buffer-chest-1",
    enabled = false,
    category = "medium-crafting",
    always_show_made_in = true,
    energy_required = 1,
    ingredients = {
      {"nullius-small-demand-chest-1", 1},
      {"green-wire", 2}
    },
    result = "nullius-small-buffer-chest-1"
  },
  {
    type = "recipe",
    name = "nullius-large-buffer-chest-1",
    enabled = false,
    category = "medium-crafting",
    always_show_made_in = true,
    energy_required = 1,
    ingredients = {
      {"nullius-large-storage-chest-1", 1},
      {"nullius-small-buffer-chest-1", 1}
    },
    result = "nullius-large-buffer-chest-1"
  },
  {
    type = "recipe",
    name = "nullius-small-buffer-chest-2",
    enabled = false,
    always_show_made_in = true,
    category = "medium-crafting",
    energy_required = 2,
    ingredients = {
      {"nullius-small-buffer-chest-1", 1},
      {"nullius-small-storage-chest-2", 1}
    },
    result = "nullius-small-buffer-chest-2"
  },
  {
    type = "recipe",
    name = "nullius-large-buffer-chest-2",
    enabled = false,
    always_show_made_in = true,
    category = "medium-crafting",
    energy_required = 3,
    ingredients = {
      {"nullius-large-buffer-chest-1", 1},
      {"nullius-large-storage-chest-2", 1}
    },
    result = "nullius-large-buffer-chest-2"
  },

  
  {
    type = "recipe",
    name = "nullius-small-dispatch-chest-1",
    enabled = false,
    category = "medium-crafting",
    always_show_made_in = true,
    energy_required = 1,
    ingredients = {
      {"nullius-small-supply-chest-1", 1},
      {"green-wire", 1}
    },
    result = "nullius-small-dispatch-chest-1"
  },
  {
    type = "recipe",
    name = "nullius-large-dispatch-chest-1",
    enabled = false,
    category = "medium-crafting",
    always_show_made_in = true,
    energy_required = 1,
    ingredients = {
      {"nullius-large-storage-chest-1", 1},
      {"nullius-small-dispatch-chest-1", 1}
    },
    result = "nullius-large-dispatch-chest-1"
  },
  {
    type = "recipe",
    name = "nullius-small-dispatch-chest-2",
    enabled = false,
    always_show_made_in = true,
    category = "medium-crafting",
    energy_required = 2,
    ingredients = {
      {"nullius-small-dispatch-chest-1", 1},
      {"nullius-small-storage-chest-2", 1}
    },
    result = "nullius-small-dispatch-chest-2"
  },
  {
    type = "recipe",
    name = "nullius-large-dispatch-chest-2",
    enabled = false,
    always_show_made_in = true,
    category = "medium-crafting",
    energy_required = 3,
    ingredients = {
      {"nullius-large-dispatch-chest-1", 1},
      {"nullius-large-storage-chest-2", 1}
    },
    result = "nullius-large-dispatch-chest-2"
  },

  {
    type = "recipe",
    name = "nullius-grid-battery-1",
    enabled = false,
    category = "large-crafting",
    always_show_made_in = true,
    energy_required = 4,
    ingredients = {
      {"nullius-steel-sheet", 2},
      {"nullius-battery-1", 3},
      {"power-switch", 1},
      {"nullius-sensor-1", 1},
      {"nullius-capacitor", 3},
      {"nullius-transformer", 1}
    },
    result = "nullius-grid-battery-1"
  },
  {
    type = "recipe",
    name = "nullius-boxed-grid-battery-1",
    enabled = false,
    category = "huge-assembly",
    subgroup = "boxed-renewable",
    always_show_made_in = true,
    energy_required = 20,
    ingredients = {
      {"nullius-box-steel-sheet", 2},
      {"nullius-box-battery-1", 3},
      {"nullius-box-power-switch", 1},
      {"nullius-box-sensor-1", 1},
      {"nullius-box-capacitor", 3},
      {"nullius-box-transformer", 1}
    },
    result = "nullius-box-grid-battery-1"
  },
  {
    type = "recipe",
    name = "nullius-grid-battery-2",
    enabled = false,
    always_show_made_in = true,
    category = "large-crafting",
    energy_required = 6,
    ingredients = {
      {"nullius-grid-battery-1", 3},
      {"nullius-fiberglass", 4},
      {"nullius-battery-2", 6},
      {"nullius-sensor-2", 1},
      {"nullius-power-pole-4", 1},
      {"nullius-heat-pipe-2", 2}
    },
    result = "nullius-grid-battery-2"
  },
  {
    type = "recipe",
    name = "nullius-boxed-grid-battery-2",
    enabled = false,
    always_show_made_in = true,
    category = "huge-assembly",
    subgroup = "boxed-renewable",
    energy_required = 30,
    ingredients = {
      {"nullius-box-grid-battery-1", 3},
      {"nullius-box-fiberglass", 4},
      {"nullius-box-battery-2", 6},
      {"nullius-box-sensor-2", 1},
      {"nullius-box-power-pole-4", 1},
      {"nullius-box-heat-pipe-2", 2}
    },
    result = "nullius-box-grid-battery-2"
  },
  {
    type = "recipe",
    name = "nullius-grid-battery-3",
    enabled = false,
    always_show_made_in = true,
    category = "large-crafting",
    energy_required = 20,
    ingredients = {
      {"nullius-box-grid-battery-2", 1},
      {"nullius-battery-3", 3}
    },
    result = "nullius-grid-battery-3"
  },

  {
    type = "recipe",
    name = "nullius-lab-1",
    enabled = false,
    category = "large-crafting",
    always_show_made_in = true,
    energy_required = 20,
    ingredients = {
      {"nullius-aluminum-sheet", 8},
      {"nullius-glass", 8},
      {"decider-combinator", 10},
      {"inserter", 4},
      {"small-lamp", 4}
    },
    result = "nullius-lab-1"
  },

  {
    type = "recipe",
    name = "nullius-lab-2",
    enabled = false,
    category = "large-crafting",
    always_show_made_in = true,
    energy_required = 30,
    ingredients = {
      {"nullius-chemical-plant-2", 1},
      {"nullius-sensor-node-1", 1},
      {"nullius-beacon-1", 1},
      {"nullius-processor-1", 8},
      {"stack-filter-inserter", 2},
      {"stone-wall", 6},
      {"gate", 2}
    },
    result = "nullius-lab-2"
  },

  {
    type = "recipe",
    name = "nullius-lab-3",
    enabled = false,
    category = "large-crafting",
    always_show_made_in = true,
    energy_required = 40,
    ingredients = {
      {"nullius-lab-2", 2},
      {"nullius-nanofabricator-2", 1},
      {"nullius-sensor-node-3", 1},
      {"nullius-box-processor-2", 2},
      {"nullius-logistic-bot-3", 2}
    },
    result = "nullius-lab-3"
  },

 
  {
    type = "recipe",
    name = "nullius-biology-lab",
    enabled = false,
    always_show_made_in = true,
    category = "huge-crafting",
    energy_required = 90,
    ingredients = {
      {"nullius-lab-3", 2},
      {"nullius-flotation-cell-3", 1},
      {"nullius-air-filter-3", 1},
      {"nullius-hydro-plant-3", 1},
      {"nullius-box-insulation-4", 10}
    },
    result = "nullius-biology-lab"
  },

  
  {
    type = "recipe",
    name = "nullius-beacon-1",
    enabled = false,
    category = "large-crafting",
    always_show_made_in = true,
    energy_required = 20,
    ingredients = {
      {"programmable-speaker", 1},
      {"constant-combinator", 2},
      {"nullius-power-pole-2", 1},
      {"nullius-iron-sheet", 2},
      {"nullius-capacitor", 1}
    },
    result = "nullius-beacon-1"
  },
  {
    type = "recipe",
    name = "nullius-boxed-beacon-1",
    localised_name = {"recipe-name.nullius-boxed", {"entity-name.nullius-beacon-1"}},
    icons = {
      {
        icon = ICONPATH .. "crate.png",
        icon_size = 64
      },
      {
        icon = ENTICONPATH .. "beacon1s.png",
        icon_size = 64,
        tint = {0.9, 1, 0.8},
        scale = 0.45
      }
    },
    enabled = false,
    always_show_made_in = true,
    show_amount_in_title = false,
    always_show_products = true,
    category = "huge-assembly",
    subgroup = "boxed-beacon",
    order = "nullius-bb",
    energy_required = 90,
    ingredients = {
      {"nullius-box-antenna", 1},
      {"nullius-box-memory-circuit", 2},
      {"nullius-box-power-pole-2", 1},
      {"nullius-box-iron-sheet", 2},
      {"nullius-box-capacitor", 1}
    },
    result = "nullius-beacon-1",
    result_count = 5
  },

  {
    type = "recipe",
    name = "nullius-beacon-2",
    enabled = false,
    category = "large-crafting",
    always_show_made_in = true,
    energy_required = 30,
    ingredients = {
      {"nullius-beacon-1", 1},
      {"nullius-sensor-2", 2},
      {"nullius-optical-cable", 4},
      {"nullius-relay-1", 1},
      {"nullius-substation-1", 1}
    },
    result = "nullius-beacon-2"
  },
  {
    type = "recipe",
    name = "nullius-boxed-beacon-2",
    localised_name = {"recipe-name.nullius-boxed", {"entity-name.nullius-beacon-2"}},
    icons = {
      {
        icon = ICONPATH .. "crate.png",
        icon_size = 64
      },
      {
        icon = ENTICONPATH .. "beacon2s.png",
        icon_size = 64,
        tint = {0.9, 0.8, 1},
        scale = 0.45
      }
    },
    enabled = false,
    always_show_made_in = true,
    show_amount_in_title = false,
    always_show_products = true,
    category = "huge-assembly",
    subgroup = "boxed-beacon",
    order = "nullius-bc",
    energy_required = 150,
    ingredients = {
      {"nullius-beacon-1", 5},
      {"nullius-box-sensor-2", 2},
      {"nullius-box-optical-cable", 4},
      {"nullius-box-relay-1", 1},
      {"nullius-substation-1", 5}
    },
    result = "nullius-beacon-2",
    result_count = 5
  },

  {
    type = "recipe",
    name = "nullius-beacon-3",
    enabled = false,
    always_show_made_in = true,
    category = "large-crafting",
    energy_required = 40,
    ingredients = {
      {"nullius-beacon-2", 1},
      {"nullius-processor-2", 3},
      {"nullius-relay-3", 1},
      {"nullius-substation-2", 1}
    },
    result = "nullius-beacon-3"
  },
  {
    type = "recipe",
    name = "nullius-boxed-beacon-3",
    localised_name = {"recipe-name.nullius-boxed", {"entity-name.nullius-beacon-3"}},
    icons = {
      {
        icon = ICONPATH .. "crate.png",
        icon_size = 64
      },
      {
        icon = ENTICONPATH .. "beacon3s.png",
        icon_size = 64,
        scale = 0.45
      }
    },
    enabled = false,
    always_show_made_in = true,
    show_amount_in_title = false,
    always_show_products = true,
    category = "huge-assembly",
    subgroup = "boxed-beacon",
    order = "nullius-bd",
    energy_required = 200,
    ingredients = {
      {"nullius-beacon-2", 5},
      {"nullius-box-processor-2", 3},
      {"nullius-box-relay-3", 1},
      {"nullius-substation-2", 5}
    },
    result = "nullius-beacon-3",
    result_count = 5
  },

  {
    type = "recipe",
    name = "nullius-large-beacon-1",
    enabled = false,
    always_show_made_in = true,
    category = "large-crafting",
    energy_required = 60,
    ingredients = {
      {"nullius-beacon-2", 3},
      {"nullius-sensor-node-2", 1},
      {"nullius-relay-2", 1},
      {"nullius-productivity-module-1", 1}
    },
    result = "nullius-large-beacon-1"
  },
  {
    type = "recipe",
    name = "nullius-large-beacon-2",
    enabled = false,
    always_show_made_in = true,
    category = "large-crafting",
    energy_required = 90,
    ingredients = {
      {"nullius-large-beacon-1", 1},
      {"nullius-beacon-3", 3},
      {"nullius-sensor-node-3", 1},
      {"nullius-productivity-module-2", 1}
    },
    result = "nullius-large-beacon-2"
  },

  {
    type = "recipe",
    name = "nullius-sensor-node-1",
    enabled = false,
    category = "large-crafting",
    always_show_made_in = true,
    energy_required = 10,
    ingredients = {
      {"nullius-sensor-1", 3},
      {"programmable-speaker", 2},
      {"nullius-glass", 4},
      {"nullius-iron-sheet", 3},
      {"nullius-motor-2", 1}
    },
    result = "nullius-sensor-node-1"
  },
  {
    type = "recipe",
    name = "nullius-boxed-sensor-node-1",
    localised_name = {"recipe-name.nullius-boxed", {"entity-name.nullius-sensor-node-1"}},
    icons = {
      {
        icon = ICONPATH .. "crate.png",
        icon_size = 64
      },
      {
        icon = "__base__/graphics/icons/radar.png",
        icon_size = 64,
        tint = {0.9, 0.9, 0.65},
        scale = 0.45
      }
    },
    enabled = false,
    always_show_made_in = true,
    show_amount_in_title = false,
    always_show_products = true,
    category = "huge-assembly",
    subgroup = "boxed-rail",
    order = "nullius-sb",
    energy_required = 45,
    ingredients = {
      {"nullius-box-sensor-1", 3},
      {"nullius-box-antenna", 2},
      {"nullius-box-glass", 4},
      {"nullius-box-iron-sheet", 3},
      {"nullius-box-motor-2", 1}
    },
    result = "nullius-sensor-node-1",
    result_count = 5
  },

  
  {
    type = "recipe",
    name = "nullius-sensor-node-2",
    enabled = false,
    category = "large-crafting",
    always_show_made_in = true,
    energy_required = 10,
    ingredients = {
      {"nullius-sensor-node-1", 1},
      {"nullius-sensor-2", 3},
      {"nullius-hard-glass", 4},
      {"nullius-fiberglass", 4},
      {"nullius-optical-cable", 6}
    },
    result = "nullius-sensor-node-2"
  },
  {
    type = "recipe",
    name = "nullius-boxed-sensor-node-2",
    localised_name = {"recipe-name.nullius-boxed", {"entity-name.nullius-sensor-node-2"}},
    icons = {
      {
        icon = ICONPATH .. "crate.png",
        icon_size = 64
      },
      {
        icon = "__base__/graphics/icons/radar.png",
        icon_size = 64,
        tint = {0.8, 0.8, 1},
        scale = 0.45
      }
    },
    enabled = false,
    always_show_made_in = true,
    show_amount_in_title = false,
    always_show_products = true,
    category = "huge-assembly",
    subgroup = "boxed-rail",
    order = "nullius-sc",
    energy_required = 45,
    ingredients = {
      {"nullius-sensor-node-1", 5},
      {"nullius-box-sensor-2", 3},
      {"nullius-box-hard-glass", 4},
      {"nullius-box-fiberglass", 4},
      {"nullius-box-optical-cable", 6}
    },
    result = "nullius-sensor-node-2",
    result_count = 5
  },

  {
    type = "recipe",
    name = "nullius-sensor-node-3",
    enabled = false,
    category = "large-crafting",
    always_show_made_in = true,
    energy_required = 12,
    ingredients = {
      {"nullius-sensor-node-2", 2},
      {"nullius-beacon-2", 1},
      {"nullius-bearing", 2},
      {"nullius-yield-module-3", 1},
      {"nullius-box-reinforced-concrete", 1}
    },
    result = "nullius-sensor-node-3"
  },

  {
    type = "recipe",
    name = "nullius-logic-circuit",
    enabled = false,
    show_amount_in_title = false,
    always_show_products = true,
    category = "tiny-assembly",
    energy_required = 5,
    ingredients = {
      {"nullius-plastic", 3},
      {"nullius-aluminum-wire", 4},
      {"nullius-polycrystalline-silicon", 2},
      {"nullius-graphite", 1}
    },
    result = "decider-combinator",
    result_count = 3
  },
  {
    type = "recipe",
    name = "nullius-boxed-logic-circuit",
    enabled = false,
    show_amount_in_title = false,
    always_show_products = true,
    category = "medium-only-assembly",
    subgroup = "boxed-circuit",
    order = "nullius-db",
    energy_required = 25,
    ingredients = {
      {"nullius-box-plastic", 3},
      {"nullius-box-aluminum-wire", 4},
      {"nullius-box-polycrystalline-silicon", 2},
      {"nullius-box-graphite", 1}
    },
    result = "nullius-box-logic-circuit",
    result_count = 3
  },
  {
    type = "recipe",
    name = "nullius-logic-circuit-2",
    localised_name = {"", {"item-name.nullius-box", {"entity-name.nullius-logic-circuit"}}, " ", 2},
    icons = {
      {
        icon = ICONPATH .. "crate.png",
        icon_size = 64
      },
      {
        icon = "__base__/graphics/icons/decider-combinator.png",
        icon_size = 64,
        scale = 0.33
      }
    },
    enabled = false,
    show_amount_in_title = false,
    always_show_products = true,
    category = "nanotechnology",
    subgroup = "boxed-circuit",
    order = "nullius-dc",
    energy_required = 25,
    ingredients = {
      {type="item", name="nullius-box-plastic", amount=2},
      {type="item", name="nullius-box-copper-wire", amount=1},
      {type="item", name="nullius-box-monocrystalline-silicon", amount=1},
      {type="item", name="nullius-box-graphite", amount=1},
      {type="fluid", name="nullius-argon", amount=2, fluidbox_index=1}
    },
    result = "nullius-box-logic-circuit",
    result_count = 5
  },
  {
    type = "recipe",
    name = "nullius-memory-circuit",
    enabled = false,
    category = "tiny-crafting",
    always_show_made_in = true,
    show_amount_in_title = false,
    always_show_products = true,
    energy_required = 6,
    ingredients = {
      {"decider-combinator", 2},
      {"nullius-capacitor", 3}
    },
    result = "constant-combinator",
    result_count = 4
  },
  {
    type = "recipe",
    name = "nullius-boxed-memory-circuit",
    enabled = false,
    category = "medium-only-assembly",
    subgroup = "boxed-circuit",
    order = "nullius-fb",
    always_show_made_in = true,
    show_amount_in_title = false,
    always_show_products = true,
    energy_required = 30,
    ingredients = {
      {"nullius-box-logic-circuit", 2},
      {"nullius-box-capacitor", 3}
    },
    result = "nullius-box-memory-circuit",
    result_count = 4
  },
  {
    type = "recipe",
    name = "nullius-memory-circuit-2",
    localised_name = {"", {"item-name.nullius-box", {"entity-name.nullius-memory-circuit"}}, " ", 2},
    icons = {
      {
        icon = ICONPATH .. "crate.png",
        icon_size = 64
      },
      {
        icon = "__base__/graphics/icons/constant-combinator.png",
        icon_size = 64,
        scale = 0.33
      }
    },
    enabled = false,
    category = "nanotechnology",
    subgroup = "boxed-circuit",
    order = "nullius-fc",
    always_show_made_in = true,
    show_amount_in_title = false,
    always_show_products = true,
    energy_required = 25,
    ingredients = {
      {type="item", name="nullius-box-logic-circuit", amount=2},
      {type="item", name="nullius-box-capacitor", amount=3},
      {type="fluid", name="nullius-argon", amount=1, fluidbox_index=1}
    },
    result = "nullius-box-memory-circuit",
    result_count = 5
  },
  {
    type = "recipe",
    name = "nullius-arithmetic-circuit",
    enabled = false,
    category = "tiny-crafting",
    always_show_made_in = true,
    energy_required = 2,
    ingredients = {
      {"decider-combinator", 1},
      {"constant-combinator", 1},
      {"nullius-aluminum-wire", 1}
    },
    result = "arithmetic-combinator"
  },
  {
    type = "recipe",
    name = "nullius-boxed-arithmetic-circuit",
    enabled = false,
    category = "medium-only-assembly",
    subgroup = "boxed-circuit",
    always_show_made_in = true,
    energy_required = 10,
    ingredients = {
      {"nullius-box-logic-circuit", 1},
      {"nullius-box-memory-circuit", 1},
      {"nullius-box-aluminum-wire", 1}
    },
    result = "nullius-box-arithmetic-circuit"
  },
  {
    type = "recipe",
    name = "nullius-antenna",
    enabled = false,
    category = "small-crafting",
    always_show_made_in = true,
    energy_required = 4,
    ingredients = {
      {"nullius-aluminum-rod", 2},
      {"red-wire", 1},
      {"nullius-rubber", 1},
      {"nullius-capacitor", 1}
    },
    result = "programmable-speaker"
  },
  {
    type = "recipe",
    name = "nullius-boxed-antenna",
    enabled = false,
    category = "medium-only-assembly",
    subgroup = "boxed-circuit",
    always_show_made_in = true,
    energy_required = 20,
    ingredients = {
      {"nullius-box-aluminum-rod", 2},
      {"nullius-box-red-wire", 1},
      {"nullius-box-rubber", 1},
      {"nullius-box-capacitor", 1}
    },
    result = "nullius-box-antenna"
  },

  {
    type = "recipe",
    name = "nullius-lamp-1a",
    enabled = false,
    always_show_made_in = true,
    show_amount_in_title = false,
    always_show_products = true,
    category = "small-crafting",
    energy_required = 2,
    ingredients = {
      {"nullius-graphite", 1},
      {"nullius-glass", 1},
      {"nullius-iron-sheet", 1}
    },
    result = "small-lamp"
  },
  {
    type = "recipe",
    name = "nullius-lamp-1b",
    localised_name = {"recipe-name.nullius-improved", {"entity-name.nullius-lamp-1"}},
    icons = {
      {
        icon = ENTICONPATH .. "lamp1.png",
        icon_size = 64
      },
      {
        icon = "__angelssmelting__/graphics/icons/wire-platinum.png",
        icon_size = 32,
        tint = { 0.1, 0.1, 0.15 },
        scale = 0.6,
        shift = {8, -8}
      }
    },
    enabled = false,
    always_show_made_in = true,
    show_amount_in_title = false,
    always_show_products = true,
    category = "medium-crafting",
    energy_required = 3,
    ingredients = {
      {"nullius-carbon-fiber", 1},
      {"nullius-glass", 1},
      {"nullius-aluminum-sheet", 1}
    },
    result = "small-lamp",
    result_count = 3
  },
  {
    type = "recipe",
    name = "nullius-boxed-lamp-1",
    enabled = false,
    always_show_made_in = true,
    show_amount_in_title = false,
    always_show_products = true,
    category = "large-assembly",
    subgroup = "boxed-rail",
    energy_required = 15,
    ingredients = {
      {"nullius-box-carbon-fiber", 1},
      {"nullius-box-glass", 1},
      {"nullius-box-aluminum-sheet", 1}
    },
    result = "nullius-box-lamp-1",
    result_count = 3
  },
  {
    type = "recipe",
    name = "nullius-lamp-2",
    enabled = false,
    show_amount_in_title = false,
    always_show_products = true,
    always_show_made_in = true,
    category = "small-fluid-assembly",
    energy_required = 6,
    ingredients = {
      {type="item", name="small-lamp", amount=2},
      {type="item", name="nullius-hard-glass", amount=2},
      {type="item", name="nullius-sodium", amount=1},
      {type="item", name="nullius-ceramic-powder", amount=1},
      {type="item", name="green-wire", amount=2},
      {type="fluid", name="nullius-compressed-argon", amount=10, fluidbox_index=1}
    },
    result = "nullius-lamp-2",
    result_count = 2
  },
  {
    type = "recipe",
    name = "nullius-boxed-lamp-2",
    enabled = false,
    show_amount_in_title = false,
    always_show_products = true,
    always_show_made_in = true,
    category = "large-assembly",
    subgroup = "boxed-rail",
    energy_required = 30,
    ingredients = {
      {type="item", name="nullius-box-lamp-1", amount=2},
      {type="item", name="nullius-box-hard-glass", amount=2},
      {type="item", name="nullius-box-sodium", amount=1},
      {type="item", name="nullius-box-ceramic-powder", amount=1},
      {type="item", name="nullius-box-green-wire", amount=2},
      {type="fluid", name="nullius-compressed-argon", amount=50, fluidbox_index=1}
    },
    result = "nullius-box-lamp-2",
    result_count = 2
  },

  {
    type = "recipe",
    name = "nullius-power-pole-1",
    enabled = false,
    always_show_made_in = true,
    category = "medium-crafting",
    energy_required = 2,
    ingredients = {
      {"nullius-iron-wire", 2},
      {"nullius-iron-rod", 1},
      {"nullius-plastic", 1}
    },
    result = "nullius-power-pole-1"
  },
  {
    type = "recipe",
    name = "nullius-boxed-power-pole-1",
    enabled = false,
    show_amount_in_title = false,
    always_show_products = true,
    always_show_made_in = true,
    category = "large-assembly",
    subgroup = "boxed-power-pole",
    energy_required = 5,
    ingredients = {
      {"nullius-box-insulated-wire", 2},
      {"nullius-box-steel-rod", 1}
    },
    result = "nullius-box-power-pole-1",
    result_count = 2
  },
  {
    type = "recipe",
    name = "nullius-power-pole-2",
    enabled = false,
    category = "medium-crafting",
    always_show_made_in = true,
    energy_required = 3,
    ingredients = {
      {"nullius-power-pole-1", 1},
      {"copper-cable", 2},
      {"nullius-aluminum-rod", 1}
    },
    result = "nullius-power-pole-2"
  },
  {
    type = "recipe",
    name = "nullius-boxed-power-pole-2",
    enabled = false,
    category = "large-assembly",
    subgroup = "boxed-power-pole",
    always_show_made_in = true,
    energy_required = 15,
    ingredients = {
      {"nullius-box-power-pole-1", 1},
      {"nullius-box-insulated-wire", 2},
      {"nullius-box-aluminum-rod", 1}
    },
    result = "nullius-box-power-pole-2"
  },
  {
    type = "recipe",
    name = "nullius-power-pole-3",
    enabled = false,
    category = "medium-crafting",
    always_show_made_in = true,
    energy_required = 4,
    ingredients = {
      {"nullius-power-pole-2", 1},
      {"red-wire", 3},
      {"nullius-fiberglass", 2},
      {"nullius-ceramic-powder", 1}
    },
    result = "nullius-power-pole-3"
  },
  {
    type = "recipe",
    name = "nullius-boxed-power-pole-3",
    enabled = false,
    category = "large-assembly",
    subgroup = "boxed-power-pole",
    always_show_made_in = true,
    energy_required = 20,
    ingredients = {
      {"nullius-box-power-pole-2", 1},
      {"nullius-box-red-wire", 3},
      {"nullius-box-fiberglass", 2},
      {"nullius-box-ceramic-powder", 1}
    },
    result = "nullius-box-power-pole-3"
  },
  {
    type = "recipe",
    name = "nullius-power-pole-4",
    enabled = false,
    always_show_made_in = true,
    category = "medium-crafting",
    energy_required = 5,
    ingredients = {
      {"nullius-power-pole-3", 1},
      {"nullius-optical-cable", 3},
      {"nullius-sensor-1", 1},
      {"nullius-transformer", 1},
      {"power-switch", 1},
      {"concrete", 2}
    },
    result = "nullius-power-pole-4"
  },
  {
    type = "recipe",
    name = "nullius-boxed-power-pole-4",
    enabled = false,
    always_show_made_in = true,
    category = "large-assembly",
    subgroup = "boxed-power-pole",
    energy_required = 25,
    ingredients = {
      {"nullius-box-power-pole-3", 1},
      {"nullius-box-optical-cable", 3},
      {"nullius-box-sensor-1", 1},
      {"nullius-box-transformer", 1},
      {"nullius-box-power-switch", 1},
      {"nullius-box-concrete", 1}
    },
    result = "nullius-box-power-pole-4"
  },

  {
    type = "recipe",
    name = "nullius-pylon-1",
    enabled = false,
    always_show_made_in = true,
    category = "large-crafting",
    energy_required = 4,
    ingredients = {
      {"nullius-power-pole-2", 1},
      {"copper-cable", 4},
      {"nullius-steel-beam", 3}
    },
    result = "big-electric-pole"
  },
  {
    type = "recipe",
    name = "nullius-boxed-pylon-1",
    enabled = false,
    always_show_made_in = true,
    category = "huge-assembly",
    subgroup = "boxed-power-pole",
    energy_required = 20,
    ingredients = {
      {"nullius-box-power-pole-2", 1},
      {"nullius-box-insulated-wire", 4},
      {"nullius-box-steel-beam", 3}
    },
    result = "nullius-box-pylon-1"
  },
  {
    type = "recipe",
    name = "nullius-pylon-2",
    enabled = false,
    always_show_made_in = true,
    category = "large-crafting",
    energy_required = 4,
    ingredients = {
      {"big-electric-pole", 1},
      {"nullius-power-pole-3", 1},
      {"nullius-aluminum-wire", 3},
      {"nullius-steel-cable", 2},
      {"nullius-transformer", 1},
      {"concrete", 4}
    },
    result = "nullius-pylon-2"
  },
  {
    type = "recipe",
    name = "nullius-boxed-pylon-2",
    enabled = false,
    always_show_made_in = true,
    category = "huge-assembly",
    subgroup = "boxed-power-pole",
    energy_required = 20,
    ingredients = {
      {"nullius-box-pylon-1", 1},
      {"nullius-box-power-pole-3", 1},
      {"nullius-box-aluminum-wire", 3},
      {"nullius-box-steel-cable", 2},
      {"nullius-box-transformer", 1},
      {"nullius-box-concrete", 2}
    },
    result = "nullius-box-pylon-2"
  },
  {
    type = "recipe",
    name = "nullius-pylon-3",
    enabled = false,
    always_show_made_in = true,
    category = "large-crafting",
    energy_required = 6,
    ingredients = {
      {"nullius-pylon-2", 1},
      {"nullius-power-pole-4", 1},
      {"nullius-calcium", 10},
      {"nullius-efficiency-module-1", 1},
      {"refined-concrete", 6}
    },
    result = "nullius-pylon-3"
  },
  {
    type = "recipe",
    name = "nullius-boxed-pylon-3",
    enabled = false,
    always_show_made_in = true,
    category = "huge-assembly",
    subgroup = "boxed-power-pole",
    energy_required = 30,
    ingredients = {
      {"nullius-box-pylon-2", 1},
      {"nullius-box-power-pole-4", 1},
      {"nullius-box-calcium", 10},
      {"nullius-box-efficiency-module-1", 1},
      {"nullius-box-reinforced-concrete", 3}
    },
    result = "nullius-box-pylon-3"
  },

  {
    type = "recipe",
    name = "nullius-substation-1",
    enabled = false,
    category = "large-crafting",
    always_show_made_in = true,
    energy_required = 10,
    ingredients = {
      {"big-electric-pole", 1},
      {"nullius-power-pole-2", 1},
      {"power-switch", 1},
      {"concrete", 6},
      {"nullius-transformer", 1}
    },
    result = "nullius-substation-1"
  },
  {
    type = "recipe",
    name = "nullius-boxed-substation-1",
    localised_name = {"recipe-name.nullius-boxed", {"entity-name.nullius-substation-1"}},
    icons = {
      {
        icon = ICONPATH .. "crate.png",
        icon_size = 64
      },
      {
        icon = ENTICONPATH .. "substation1.png",
        icon_size = 64,
        scale = 0.45
      }
    },
    enabled = false,
    category = "huge-assembly",
    subgroup = "boxed-power-pole",
    order = "nullius-fb",
    always_show_made_in = true,
    show_amount_in_title = false,
    always_show_products = true,
    energy_required = 45,
    ingredients = {
      {"nullius-box-pylon-1", 1},
      {"nullius-box-power-pole-2", 1},
      {"nullius-box-power-switch", 1},
      {"nullius-box-concrete", 3},
      {"nullius-box-transformer", 1}
    },
    result = "nullius-substation-1",
    result_count = 5
  },
  {
    type = "recipe",
    name = "nullius-substation-2",
    enabled = false,
    category = "large-crafting",
    always_show_made_in = true,
    energy_required = 10,
    ingredients = {
      {"nullius-substation-1", 1},
      {"nullius-pylon-2", 1},
      {"nullius-power-pole-3", 1},
      {"nullius-sensor-1", 2},
      {"nullius-battery-1", 2}
    },
    result = "nullius-substation-2"
  },
  {
    type = "recipe",
    name = "nullius-boxed-substation-2",
    localised_name = {"recipe-name.nullius-boxed", {"entity-name.nullius-substation-2"}},
    icons = {
      {
        icon = ICONPATH .. "crate.png",
        icon_size = 64
      },
      {
        icon = "__base__/graphics/icons/substation.png",
        icon_size = 64,
        scale = 0.45
      }
    },
    enabled = false,
    category = "huge-assembly",
    subgroup = "boxed-power-pole",
    order = "nullius-fc",
    always_show_made_in = true,
    show_amount_in_title = false,
    always_show_products = true,
    energy_required = 45,
    ingredients = {
      {"nullius-substation-1", 5},
      {"nullius-box-pylon-2", 1},
      {"nullius-box-power-pole-3", 1},
      {"nullius-box-sensor-1", 2},
      {"nullius-box-battery-1", 2}
    },
    result = "nullius-substation-2",
    result_count = 5
  },
  {
    type = "recipe",
    name = "nullius-substation-3",
    enabled = false,
    always_show_made_in = true,
    category = "large-crafting",
    energy_required = 20,
    ingredients = {
      {"nullius-substation-2", 2},
      {"nullius-pylon-3", 1},
      {"nullius-power-pole-4", 2},
      {"nullius-sensor-2", 2},
      {"nullius-grid-battery-1", 1},
      {"refined-concrete", 20}
    },
    result = "nullius-substation-3"
  },
  {
    type = "recipe",
    name = "nullius-boxed-substation-3",
    localised_name = {"recipe-name.nullius-boxed", {"entity-name.nullius-substation-3"}},
    icons = {
      {
        icon = ICONPATH .. "crate.png",
        icon_size = 64
      },
      {
        icon = ENTICONPATH .. "substation3.png",
        icon_size = 64,
        scale = 0.45
      }
    },
    enabled = false,
    always_show_made_in = true,
    show_amount_in_title = false,
    always_show_products = true,
    category = "huge-assembly",
    subgroup = "boxed-power-pole",
    order = "nullius-fd",
    energy_required = 100,
    ingredients = {
      {"nullius-substation-2", 10},
      {"nullius-box-pylon-3", 1},
      {"nullius-box-power-pole-4", 2},
      {"nullius-box-sensor-2", 2},
      {"nullius-box-grid-battery-1", 1},
      {"nullius-box-reinforced-concrete", 10}
    },
    result = "nullius-substation-3"
  },

  {
    type = "recipe",
    name = "nullius-reactor",
    enabled = false,
    category = "huge-crafting",
    energy_required = 60,
    ingredients = {
      {type="item", name="nullius-thermal-tank-2", amount=3},
      {type="item", name="nullius-box-heat-pipe-3", amount=2},
      {type="item", name="nullius-lab-2", amount=1},
      {type="item", name="nullius-box-hazard-concrete", amount=5},
      {type="item", name="nullius-large-furnace-2", amount=2},
      {type="item", name="nullius-box-processor-2", amount=1}
    },
    result = "nullius-reactor"
  },

  {
    type = "recipe",
    name = "nullius-silo",
    enabled = false,
    category = "huge-crafting",
    energy_required = 120,
    ingredients = {
      {type="item", name="nullius-drone-launcher-2", amount=8},
      {type="item", name="nullius-hangar-3", amount=4},
      {type="item", name="nullius-beacon-3", amount=6},
      {type="item", name="nullius-box-wall", amount=20},
      {type="item", name="nullius-box-heat-pipe-3", amount=4},
      {type="item", name="nullius-box-hazard-concrete", amount=30},
      {type="item", name="nullius-box-productivity-module-2", amount=2},
      {type="item", name="nullius-lab-3", amount=2}
    },
    result = "nullius-silo"
  },

  {
    type = "recipe",
    name = "nullius-solar-collector-1",
    enabled = false,
    always_show_made_in = true,
    category = "large-crafting",
    energy_required = 8,
    ingredients = {
      {"nullius-glass", 8},
      {"nullius-aluminum-sheet", 6},
      {"nullius-steel-rod", 4},
      {"nullius-heat-pipe-1", 5}
    },
    result = "nullius-solar-collector-1"
  },
  {
    type = "recipe",
    name = "nullius-boxed-solar-collector-1",
    enabled = false,
    always_show_made_in = true,
    category = "huge-assembly",
    subgroup = "boxed-heat-energy",
    energy_required = 40,
    ingredients = {
      {"nullius-box-glass", 8},
      {"nullius-box-aluminum-sheet", 6},
      {"nullius-box-steel-rod", 4},
      {"nullius-box-heat-pipe-1", 5}
    },
    result = "nullius-box-solar-collector-1"
  },
  {
    type = "recipe",
    name = "nullius-solar-collector-2",
    enabled = false,
    always_show_made_in = true,
    category = "large-crafting",
    energy_required = 8,
    ingredients = {
      {"nullius-solar-collector-1", 2},
      {"nullius-heat-pipe-2", 8},
      {"nullius-motor-2", 1},
      {"nullius-steel-cable", 4},
      {"nullius-titanium-sheet", 5}
    },
    result = "nullius-solar-collector-2"
  },
  {
    type = "recipe",
    name = "nullius-boxed-solar-collector-2",
    enabled = false,
    always_show_made_in = true,
    category = "huge-assembly",
    subgroup = "boxed-heat-energy",
    energy_required = 40,
    ingredients = {
      {"nullius-box-solar-collector-1", 2},
      {"nullius-box-heat-pipe-2", 8},
      {"nullius-box-motor-2", 1},
      {"nullius-box-steel-cable", 4},
      {"nullius-box-titanium-sheet", 5}
    },
    result = "nullius-box-solar-collector-2"
  },
  {
    type = "recipe",
    name = "nullius-solar-collector-3",
    enabled = false,
    always_show_made_in = true,
    category = "large-crafting",
    energy_required = 10,
    ingredients = {
      {"nullius-solar-collector-2", 3},
      {"nullius-hard-glass", 10},
      {"nullius-heat-pipe-3", 8},
      {"nullius-titanium-rod", 4},
      {"nullius-sensor-1", 1},
      {"nullius-monocrystalline-silicon", 12}
    },
    result = "nullius-solar-collector-3"
  },
  {
    type = "recipe",
    name = "nullius-boxed-solar-collector-3",
    enabled = false,
    always_show_made_in = true,
    category = "huge-assembly",
    subgroup = "boxed-heat-energy",
    energy_required = 50,
    ingredients = {
      {"nullius-box-solar-collector-2", 3},
      {"nullius-box-hard-glass", 10},
      {"nullius-box-heat-pipe-3", 8},
      {"nullius-box-titanium-rod", 4},
      {"nullius-box-sensor-1", 1},
      {"nullius-box-monocrystalline-silicon", 12}
    },
    result = "nullius-box-solar-collector-3"
  },

  ==========================
  {
    type = "recipe",
    name = "nullius-efficiency-module-1",
    enabled = false,
    show_amount_in_title = false,
    always_show_products = true,
    category = "tiny-assembly",
    energy_required = 12,
    ingredients = {
      {type="item", name="decider-combinator", amount=2},
      {type="item", name="constant-combinator", amount=2},
      {type="item", name="green-wire", amount=3}
    },
    result = "nullius-efficiency-module-1"
  },
  {
    type = "recipe",
    name = "nullius-boxed-efficiency-module-1",
    enabled = false,
    show_amount_in_title = false,
    always_show_products = true,
    category = "medium-only-assembly",
    subgroup = "boxed-module-2",
    energy_required = 60,
    ingredients = {
      {type="item", name="nullius-box-logic-circuit", amount=2},
      {type="item", name="nullius-box-memory-circuit", amount=2},
      {type="item", name="nullius-box-green-wire", amount=3}
    },
    result = "nullius-box-efficiency-module-1"
  },
  {
    type = "recipe",
    name = "nullius-haste-module-1",
    enabled = false,
    show_amount_in_title = false,
    always_show_products = true,
    category = "tiny-assembly",
    energy_required = 12,
    ingredients = {
      {type="item", name="arithmetic-combinator", amount=2},
      {type="item", name="decider-combinator", amount=1},
      {type="item", name="green-wire", amount=3}
    },
    result = "nullius-haste-module-1"
  },
  {
    type = "recipe",
    name = "nullius-boxed-haste-module-1",
    enabled = false,
    show_amount_in_title = false,
    always_show_products = true,
    category = "medium-only-assembly",
    subgroup = "boxed-module-1",
    energy_required = 60,
    ingredients = {
      {type="item", name="nullius-box-arithmetic-circuit", amount=2},
      {type="item", name="nullius-box-logic-circuit", amount=1},
      {type="item", name="nullius-box-green-wire", amount=3}
    },
    result = "nullius-box-haste-module-1"
  },
  {
    type = "recipe",
    name = "nullius-speed-module-1",
    enabled = false,
    show_amount_in_title = false,
    always_show_products = true,
    category = "tiny-assembly",
    energy_required = 8,
    ingredients = {
      {type="item", name="nullius-haste-module-1", amount=2},
      {type="item", name="nullius-efficiency-module-1", amount=1}
    },
    result = "nullius-speed-module-1",
    result_count = 2
  },
  {
    type = "recipe",
    name = "nullius-boxed-speed-module-1",
    enabled = false,
    show_amount_in_title = false,
    always_show_products = true,
    category = "medium-only-assembly",
    subgroup = "boxed-module-1",
    energy_required = 40,
    ingredients = {
      {type="item", name="nullius-box-haste-module-1", amount=2},
      {type="item", name="nullius-box-efficiency-module-1", amount=1}
    },
    result = "nullius-box-speed-module-1",
    result_count = 2
  },
  {
    type = "recipe",
    name = "nullius-yield-module-1",
    enabled = false,
    show_amount_in_title = false,
    always_show_products = true,
    category = "tiny-assembly",
    energy_required = 8,
    ingredients = {
      {type="item", name="nullius-efficiency-module-1", amount=2},
      {type="item", name="nullius-haste-module-1", amount=1}
    },
    result = "nullius-yield-module-1",
    result_count = 2
  },
  {
    type = "recipe",
    name = "nullius-boxed-yield-module-1",
    enabled = false,
    show_amount_in_title = false,
    always_show_products = true,
    category = "medium-only-assembly",
    subgroup = "boxed-module-2",
    energy_required = 40,
    ingredients = {
      {type="item", name="nullius-box-efficiency-module-1", amount=2},
      {type="item", name="nullius-box-haste-module-1", amount=1}
    },
    result = "nullius-box-yield-module-1",
    result_count = 2
  },

  {
    type = "recipe",
    name = "nullius-efficiency-module-2",
    enabled = false,
    category = "tiny-assembly",
    energy_required = 20,
    ingredients = {
      {type="item", name="nullius-efficiency-module-1", amount=3},
      {type="item", name="nullius-processor-1", amount=2},
      {type="item", name="nullius-sensor-1", amount=2},
      {type="item", name="nullius-battery-1", amount=1}
    },
    result = "nullius-efficiency-module-2"
  },
  {
    type = "recipe",
    name = "nullius-boxed-efficiency-module-2",
    enabled = false,
    show_amount_in_title = false,
    always_show_products = true,
    category = "medium-only-assembly",
    subgroup = "boxed-module-2",
    energy_required = 100,
    ingredients = {
      {type="item", name="nullius-box-efficiency-module-1", amount=3},
      {type="item", name="nullius-box-processor-1", amount=2},
      {type="item", name="nullius-box-sensor-1", amount=2},
      {type="item", name="nullius-box-battery-1", amount=1}
    },
    result = "nullius-box-efficiency-module-2"
  },
  {
    type = "recipe",
    name = "nullius-haste-module-2",
    enabled = false,
    show_amount_in_title = false,
    always_show_products = true,
    category = "tiny-assembly",
    energy_required = 20,
    ingredients = {
      {type="item", name="nullius-haste-module-1", amount=3},
      {type="item", name="nullius-processor-1", amount=3},
      {type="item", name="nullius-sensor-1", amount=1},
      {type="item", name="nullius-optical-cable", amount=1}
    },
    result = "nullius-haste-module-2"
  },
  {
    type = "recipe",
    name = "nullius-boxed-haste-module-2",
    enabled = false,
    show_amount_in_title = false,
    always_show_products = true,
    category = "medium-only-assembly",
    subgroup = "boxed-module-1",
    energy_required = 100,
    ingredients = {
      {type="item", name="nullius-box-haste-module-1", amount=3},
      {type="item", name="nullius-box-processor-1", amount=3},
      {type="item", name="nullius-box-sensor-1", amount=1},
      {type="item", name="nullius-box-optical-cable", amount=1}
    },
    result = "nullius-box-haste-module-2"
  },
  {
    type = "recipe",
    name = "nullius-yield-module-2",
    enabled = false,
    show_amount_in_title = false,
    always_show_products = true,
    category = "tiny-assembly",
    energy_required = 10,
    ingredients = {
      {type="item", name="nullius-yield-module-1", amount=2},
      {type="item", name="nullius-efficiency-module-2", amount=1}
    },
    result = "nullius-yield-module-2"
  },
  {
    type = "recipe",
    name = "nullius-boxed-yield-module-2",
    enabled = false,
    show_amount_in_title = false,
    always_show_products = true,
    category = "medium-only-assembly",
    subgroup = "boxed-module-2",
    energy_required = 50,
    ingredients = {
      {type="item", name="nullius-box-yield-module-1", amount=2},
      {type="item", name="nullius-box-efficiency-module-2", amount=1}
    },
    result = "nullius-box-yield-module-2"
  },
  {
    type = "recipe",
    name = "nullius-speed-module-2",
    enabled = false,
    show_amount_in_title = false,
    always_show_products = true,
    category = "tiny-assembly",
    energy_required = 10,
    ingredients = {
      {type="item", name="nullius-speed-module-1", amount=2},
      {type="item", name="nullius-haste-module-2", amount=1}
    },
    result = "nullius-speed-module-2"
  },
  {
    type = "recipe",
    name = "nullius-boxed-speed-module-2",
    enabled = false,
    show_amount_in_title = false,
    always_show_products = true,
    category = "medium-only-assembly",
    subgroup = "boxed-module-1",
    energy_required = 50,
    ingredients = {
      {type="item", name="nullius-box-speed-module-1", amount=2},
      {type="item", name="nullius-box-haste-module-2", amount=1}
    },
    result = "nullius-box-speed-module-2"
  },
  {
    type = "recipe",
    name = "nullius-productivity-module-1",
    enabled = false,
    show_amount_in_title = false,
    always_show_products = true,
    category = "tiny-assembly",
    energy_required = 16,
    ingredients = {
      {type="item", name="nullius-yield-module-2", amount=2},
      {type="item", name="nullius-speed-module-2", amount=1}
    },
    result = "nullius-productivity-module-1",
    result_count = 3
  },
  {
    type = "recipe",
    name = "nullius-boxed-productivity-module-1",
    enabled = false,
    show_amount_in_title = false,
    always_show_products = true,
    category = "medium-only-assembly",
    subgroup = "boxed-module-2",
    energy_required = 80,
    ingredients = {
      {type="item", name="nullius-box-yield-module-2", amount=2},
      {type="item", name="nullius-box-speed-module-2", amount=1}
    },
    result = "nullius-box-productivity-module-1",
    result_count = 3
  },

  {
    type = "recipe",
    name = "nullius-efficiency-module-3",
    enabled = false,
    category = "tiny-assembly",
    energy_required = 30,
    ingredients = {
      {type="item", name="nullius-efficiency-module-2", amount=2},
      {type="item", name="nullius-processor-2", amount=1},
      {type="item", name="nullius-sensor-2", amount=2},
      {type="item", name="nullius-battery-2", amount=1},
      {type="item", name="nullius-transformer", amount=1},
      {type="item", name="power-switch", amount=1}
    },
    result = "nullius-efficiency-module-3"
  },
  {
    type = "recipe",
    name = "nullius-boxed-efficiency-module-3",
    enabled = false,
    category = "medium-only-assembly",
    subgroup = "boxed-module-2",
    energy_required = 150,
    ingredients = {
      {type="item", name="nullius-box-efficiency-module-2", amount=2},
      {type="item", name="nullius-box-processor-2", amount=1},
      {type="item", name="nullius-box-sensor-2", amount=2},
      {type="item", name="nullius-box-battery-2", amount=1},
      {type="item", name="nullius-box-transformer", amount=1},
      {type="item", name="nullius-box-power-switch", amount=1}
    },
    result = "nullius-box-efficiency-module-3"
  },
  {
    type = "recipe",
    name = "nullius-haste-module-3",
    enabled = false,
    show_amount_in_title = false,
    always_show_products = true,
    category = "tiny-assembly",
    energy_required = 30,
    ingredients = {
      {type="item", name="nullius-haste-module-2", amount=2},
      {type="item", name="nullius-speed-module-2", amount=1},
      {type="item", name="nullius-processor-2", amount=2},
      {type="item", name="nullius-sensor-2", amount=1},
      {type="item", name="nullius-heat-pipe-3", amount=2}
    },
    result = "nullius-haste-module-3"
  },
  {
    type = "recipe",
    name = "nullius-boxed-haste-module-3",
    enabled = false,
    show_amount_in_title = false,
    always_show_products = true,
    category = "medium-only-assembly",
    subgroup = "boxed-module-1",
    energy_required = 150,
    ingredients = {
      {type="item", name="nullius-box-haste-module-2", amount=2},
      {type="item", name="nullius-box-speed-module-2", amount=1},
      {type="item", name="nullius-box-processor-2", amount=2},
      {type="item", name="nullius-box-sensor-2", amount=1},
      {type="item", name="nullius-box-heat-pipe-3", amount=2}
    },
    result = "nullius-box-haste-module-3"
  },
  {
    type = "recipe",
    name = "nullius-yield-module-3",
    enabled = false,
    show_amount_in_title = false,
    always_show_products = true,
    category = "tiny-assembly",
    energy_required = 15,
    ingredients = {
      {type="item", name="nullius-efficiency-module-3", amount=1},
      {type="item", name="nullius-yield-module-2", amount=1},
      {type="item", name="nullius-productivity-module-1", amount=1},
      {type="item", name="nullius-processor-2", amount=1}
    },
    result = "nullius-yield-module-3"
  },
  {
    type = "recipe",
    name = "nullius-boxed-yield-module-3",
    enabled = false,
    show_amount_in_title = false,
    always_show_products = true,
    category = "medium-only-assembly",
    subgroup = "boxed-module-2",
    energy_required = 75,
    ingredients = {
      {type="item", name="nullius-box-efficiency-module-3", amount=1},
      {type="item", name="nullius-box-yield-module-2", amount=1},
      {type="item", name="nullius-box-productivity-module-1", amount=1},
      {type="item", name="nullius-box-processor-2", amount=1}
    },
    result = "nullius-box-yield-module-3"
  },
  {
    type = "recipe",
    name = "nullius-speed-module-3",
    enabled = false,
    show_amount_in_title = false,
    always_show_products = true,
    category = "tiny-assembly",
    energy_required = 15,
    ingredients = {
      {type="item", name="nullius-haste-module-3", amount=1},
      {type="item", name="nullius-speed-module-2", amount=1},
      {type="item", name="nullius-efficiency-module-2", amount=1},
      {type="item", name="nullius-processor-2", amount=1}
    },
    result = "nullius-speed-module-3"
  },
  {
    type = "recipe",
    name = "nullius-boxed-speed-module-3",
    enabled = false,
    show_amount_in_title = false,
    always_show_products = true,
    category = "medium-only-assembly",
    subgroup = "boxed-module-1",
    energy_required = 75,
    ingredients = {
      {type="item", name="nullius-box-haste-module-3", amount=1},
      {type="item", name="nullius-box-speed-module-2", amount=1},
      {type="item", name="nullius-box-efficiency-module-2", amount=1},
      {type="item", name="nullius-box-processor-2", amount=1}
    },
    result = "nullius-box-speed-module-3"
  },
  {
    type = "recipe",
    name = "nullius-productivity-module-2",
    enabled = false,
    show_amount_in_title = false,
    always_show_products = true,
    category = "tiny-assembly",
    energy_required = 60,
    ingredients = {
      {type="item", name="nullius-productivity-module-1", amount=2},
      {type="item", name="nullius-yield-module-3", amount=2},
      {type="item", name="nullius-speed-module-3", amount=1}
    },
    result = "nullius-productivity-module-2",
    result_count = 4
  },
  {
    type = "recipe",
    name = "nullius-boxed-productivity-module-2",
    enabled = false,
    show_amount_in_title = false,
    always_show_products = true,
    category = "medium-only-assembly",
    subgroup = "boxed-module-2",
    energy_required = 300,
    ingredients = {
      {type="item", name="nullius-box-productivity-module-1", amount=2},
      {type="item", name="nullius-box-yield-module-3", amount=2},
      {type="item", name="nullius-box-speed-module-3", amount=1}
    },
    result = "nullius-box-productivity-module-2",
    result_count = 4
  },

  {
    type = "recipe",
    name = "nullius-haste-module-4",
    enabled = false,
    show_amount_in_title = false,
    always_show_products = true,
    category = "tiny-assembly",
    energy_required = 50,
    ingredients = {
      {type="item", name="nullius-haste-module-3", amount=1},
      {type="item", name="nullius-speed-module-3", amount=1},
      {type="item", name="nullius-processor-3", amount=2},
      {type="item", name="nullius-copper-wire", amount=8},
      {type="item", name="nullius-electrical-pack", amount=3}
    },
    result = "nullius-haste-module-4"
  },
  {
    type = "recipe",
    name = "nullius-boxed-haste-module-4",
    enabled = false,
    show_amount_in_title = false,
    always_show_products = true,
    category = "medium-only-assembly",
    subgroup = "boxed-module-1",
    energy_required = 250,
    ingredients = {
      {type="item", name="nullius-box-haste-module-3", amount=1},
      {type="item", name="nullius-box-speed-module-3", amount=1},
      {type="item", name="nullius-box-processor-3", amount=2},
      {type="item", name="nullius-box-copper-wire", amount=8},
      {type="item", name="nullius-box-electrical-pack", amount=3}
    },
    result = "nullius-box-haste-module-4"
  },
  {
    type = "recipe",
    name = "nullius-speed-module-4",
    enabled = false,
    show_amount_in_title = false,
    always_show_products = true,
    category = "tiny-assembly",
    energy_required = 40,
    ingredients = {
      {type="item", name="nullius-speed-module-3", amount=1},
      {type="item", name="nullius-haste-module-4", amount=1},
      {type="item", name="nullius-efficiency-module-3", amount=1}
    },
    result = "nullius-speed-module-4"
  },
  {
    type = "recipe",
    name = "nullius-boxed-speed-module-4",
    enabled = false,
    show_amount_in_title = false,
    always_show_products = true,
    category = "medium-only-assembly",
    subgroup = "boxed-module-1",
    energy_required = 200,
    ingredients = {
      {type="item", name="nullius-box-speed-module-3", amount=1},
      {type="item", name="nullius-box-haste-module-4", amount=1},
      {type="item", name="nullius-box-efficiency-module-3", amount=1}
    },
    result = "nullius-box-speed-module-4"
  },
  {
    type = "recipe",
    name = "nullius-productivity-module-3",
    enabled = false,
    show_amount_in_title = false,
    always_show_products = true,
    category = "tiny-assembly",
    energy_required = 30,
    ingredients = {
      {type="item", name="nullius-productivity-module-2", amount=1},
      {type="item", name="nullius-speed-module-4", amount=1},
      {type="item", name="nullius-yield-module-3", amount=1}
    },
    result = "nullius-productivity-module-3"
  },
  {
    type = "recipe",
    name = "nullius-boxed-productivity-module-3",
    enabled = false,
    show_amount_in_title = false,
    always_show_products = true,
    category = "medium-only-assembly",
    subgroup = "boxed-module-2",
    energy_required = 150,
    ingredients = {
      {type="item", name="nullius-box-productivity-module-2", amount=1},
      {type="item", name="nullius-box-speed-module-4", amount=1},
      {type="item", name="nullius-box-yield-module-3", amount=1}
    },
    result = "nullius-box-productivity-module-3"
  },
  {
    type = "recipe",
    name = "nullius-yield-module-4",
    enabled = false,
    show_amount_in_title = false,
    always_show_products = true,
    category = "tiny-assembly",
    energy_required = 40,
    ingredients = {
      {type="item", name="nullius-productivity-module-3", amount=2},
      {type="item", name="nullius-electrical-pack", amount=3}
    },
    result = "nullius-yield-module-4"
  },
  {
    type = "recipe",
    name = "nullius-boxed-yield-module-4",
    enabled = false,
    show_amount_in_title = false,
    always_show_products = true,
    category = "medium-only-assembly",
    subgroup = "boxed-module-2",
    energy_required = 200,
    ingredients = {
      {type="item", name="nullius-box-productivity-module-3", amount=2},
      {type="item", name="nullius-box-electrical-pack", amount=3}
    },
    result = "nullius-box-yield-module-4"
  },

  ================================
  
  {
    type = "recipe",
    name = "nullius-iron-pipe",
    localised_name = {"recipe-name.nullius-iron-pipe"},
    icons = {
      {
        icon = "__base__/graphics/icons/pipe.png",
        icon_size = 64,
        icon_mipmaps = 4
      },
      {
        icon = "__angelssmelting__/graphics/icons/ingot-iron.png",
        icon_size = 64,
        icon_mipmaps = 4,
        scale = 0.3,
        shift = {8, -9}
      }
    },
    show_amount_in_title = false,
    always_show_products = true,
    always_show_made_in = true,
    enabled = false,
    category = "hand-casting",
    subgroup = "pipes",
    order = "nullius-bc",
    allow_decomposition = false,
    allow_as_intermediate = false,
    energy_required = 2,
    ingredients = {
      {"nullius-iron-rod", 1}
    },
    result = "nullius-pipe-1",
    result_count = 3
  },
  {
    type = "recipe",
    name = "nullius-underground-pipe-1",
    enabled = false,
    always_show_made_in = true,
    always_show_products = true,
    show_amount_in_title = false,
    category = "small-crafting",
    subgroup = "pipes",
    energy_required = 5,
    ingredients = {
      {"nullius-pipe-1", 5},
      {"nullius-sand", 2}
    },
    result = "nullius-underground-pipe-1",
    result_count = 2
  },
  {
    type = "recipe",
    name = "nullius-boxed-underground-pipe-1",
    enabled = false,
    category = "large-assembly",
    always_show_made_in = true,
    show_amount_in_title = false,
    always_show_products = true,
    subgroup = "boxed-pipe",
    energy_required = 25,
    ingredients = {
      {"nullius-box-pipe-1", 5},
      {"nullius-box-sand", 2}
    },
    result = "nullius-box-underground-pipe-1",
    result_count = 2
  },
  {
    type = "recipe",
    name = "nullius-stone-pipe",
    localised_name = {"recipe-name.nullius-stone-pipe"},
    icons = {
      {
        icon = "__base__/graphics/icons/pipe.png",
        icon_size = 64,
        icon_mipmaps = 4
      },
      {
        icon = "__base__/graphics/icons/stone-brick.png",
        icon_size = 64,
        icon_mipmaps = 4,
        scale = 0.3,
        shift = {9, -10}
      }
    },
    show_amount_in_title = false,
    always_show_products = true,
    always_show_made_in = true,
    enabled = false,
    category = "small-crafting",
    subgroup = "pipes",
    order = "nullius-bb",
    allow_decomposition = false,
    energy_required = 6,
    ingredients = {
      {"stone-brick", 8}
    },
    results = {
      {type="item", name="nullius-pipe-1", amount=5},
      {type="item", name="nullius-gravel", amount=1}
    },
    main_product = "nullius-pipe-1"
  },
  {
    type = "recipe",
    name = "nullius-boxed-pipe-1",
    show_amount_in_title = false,
    always_show_products = true,
    always_show_made_in = true,
    enabled = false,
    category = "large-assembly",
    subgroup = "boxed-pipe",
    allow_decomposition = false,
    energy_required = 25,
    ingredients = {
      {"nullius-box-stone-brick", 6}
    },
    results = {
      {type="item", name="nullius-box-pipe-1", amount=3},
      {type="item", name="nullius-box-gravel", amount=1}
    },
    main_product = "nullius-box-pipe-1"
  },

  {
    type = "recipe",
    name = "nullius-steel-pipe",
    localised_name = {"recipe-name.nullius-steel-pipe"},
    icons = {
      {
        icon = "__boblogistics__/graphics/icons/pipe/copper-tungsten-pipe.png",
        icon_size = 32
      },
      {
        icon = "__angelssmelting__/graphics/icons/ingot-steel.png",
        icon_size = 64,
        icon_mipmaps = 4,
        scale = 0.3,
        shift = {8, -9}
      }
    },
    show_amount_in_title = false,
    always_show_products = true,
    always_show_made_in = true,
    enabled = false,
    category = "hand-casting",
    subgroup = "pipes",
    order = "nullius-dc",
    allow_decomposition = false,
    allow_as_intermediate = false,
    energy_required = 4,
    ingredients = {
      {"nullius-steel-rod", 2}
    },
    result = "nullius-pipe-2",
    result_count = 3
  },
  {
    type = "recipe",
    name = "nullius-underground-pipe-2",
    enabled = false,
    category = "small-crafting",
    always_show_made_in = true,
    show_amount_in_title = false,
    always_show_products = true,
    subgroup = "pipes",
    energy_required = 5,
    ingredients = {
      {"nullius-pipe-2", 10},
      {"nullius-gravel", 3}
    },
    result = "nullius-underground-pipe-2",
    result_count = 2
  },
  {
    type = "recipe",
    name = "nullius-boxed-underground-pipe-2",
    enabled = false,
    category = "large-assembly",
    always_show_made_in = true,
    show_amount_in_title = false,
    always_show_products = true,
    subgroup = "boxed-pipe",
    energy_required = 25,
    ingredients = {
      {"nullius-box-pipe-2", 10},
      {"nullius-box-gravel", 3}
    },
    result = "nullius-box-underground-pipe-2",
    result_count = 2
  },
  {
    type = "recipe",
    name = "nullius-plastic-pipe",
    localised_name = {"recipe-name.nullius-plastic-pipe"},
    icons = {
      {
        icon = "__boblogistics__/graphics/icons/pipe/copper-tungsten-pipe.png",
        icon_size = 32
      },
      {
        icon = "__base__/graphics/icons/plastic-bar.png",
        icon_size = 64,
        icon_mipmaps = 4,
        scale = 0.3,
        shift = {9, -10}
      }
    },
    show_amount_in_title = false,
    always_show_products = true,
    always_show_made_in = true,
    enabled = false,
    category = "small-crafting",
    subgroup = "pipes",
    order = "nullius-db",
    allow_decomposition = false,
    energy_required = 1,
    ingredients = {
      {"nullius-plastic", 1}
    },
    result = "nullius-pipe-2"
  },
  {
    type = "recipe",
    name = "nullius-boxed-pipe-2",
    show_amount_in_title = false,
    always_show_products = true,
    always_show_made_in = true,
    enabled = false,
    category = "large-assembly",
    subgroup = "boxed-pipe",
    allow_decomposition = false,
    energy_required = 5,
    ingredients = {
      {"nullius-box-plastic", 1}
    },
    result = "nullius-box-pipe-2"
  },

  {
    type = "recipe",
    name = "nullius-pipe-3",
    always_show_made_in = true,
    enabled = false,
    show_amount_in_title = false,
    always_show_products = true,
    category = "small-fluid-assembly",
    energy_required = 2,
    ingredients = {
      {type="item", name="nullius-fiberglass", amount=1},
      {type="fluid", name="nullius-epoxy", amount=1, fluidbox_index=1}
    },
    result = "nullius-pipe-3"
  },
  {
    type = "recipe",
    name = "nullius-boxed-pipe-3",
    always_show_made_in = true,
    enabled = false,
    show_amount_in_title = false,
    always_show_products = true,
    category = "large-assembly",
    subgroup = "boxed-pipe",
    energy_required = 10,
    ingredients = {
      {type="item", name="nullius-box-fiberglass", amount=1},
      {type="fluid", name="nullius-epoxy", amount=5, fluidbox_index=1}
    },
    result = "nullius-box-pipe-3"
  },
  {
    type = "recipe",
    name = "nullius-underground-pipe-3",
    enabled = false,
    category = "small-crafting",
    always_show_made_in = true,
    show_amount_in_title = false,
    always_show_products = true,
    subgroup = "pipes",
    energy_required = 10,
    ingredients = {
      {"nullius-pipe-3", 15},
      {"concrete", 4}
    },
    result = "nullius-underground-pipe-3",
    result_count = 2
  },
  {
    type = "recipe",
    name = "nullius-boxed-underground-pipe-3",
    enabled = false,
    category = "large-assembly",
    always_show_made_in = true,
    show_amount_in_title = false,
    always_show_products = true,
    subgroup = "boxed-pipe",
    energy_required = 50,
    ingredients = {
      {"nullius-box-pipe-3", 15},
      {"nullius-box-concrete", 2}
    },
    result = "nullius-box-underground-pipe-3",
    result_count = 2
  },

  {
    type = "recipe",
    name = "nullius-pipe-4",
    always_show_made_in = true,
    enabled = false,
    show_amount_in_title = false,
    always_show_products = true,
    category = "tiny-assembly",
    energy_required = 12,
    ingredients = {
      {type="item", name="nullius-pipe-1", amount=1},
      {type="item", name="nullius-pipe-2", amount=2},
      {type="item", name="nullius-pipe-3", amount=3},
      {type="item", name="nullius-carbon-composite", amount=3},
      {type="item", name="nullius-titanium-sheet", amount=4},
      {type="item", name="nullius-graphene", amount=1}
    },
    result = "nullius-pipe-4",
    result_count = 5
  },
  {
    type = "recipe",
    name = "nullius-boxed-pipe-4",
    always_show_made_in = true,
    enabled = false,
    show_amount_in_title = false,
    always_show_products = true,
    category = "medium-only-assembly",
    subgroup = "boxed-pipe",
    energy_required = 60,
    ingredients = {
      {type="item", name="nullius-box-pipe-1", amount=1},
      {type="item", name="nullius-box-pipe-2", amount=2},
      {type="item", name="nullius-box-pipe-3", amount=3},
      {type="item", name="nullius-box-carbon-composite", amount=3},
      {type="item", name="nullius-box-titanium-sheet", amount=4},
      {type="item", name="nullius-box-graphene", amount=1}
    },
    result = "nullius-box-pipe-4",
    result_count = 5
  },
  {
    type = "recipe",
    name = "nullius-underground-pipe-4",
    enabled = false,
    category = "tiny-assembly",
    always_show_made_in = true,
    show_amount_in_title = false,
    always_show_products = true,
    energy_required = 12,
    ingredients = {
      {"nullius-pipe-4", 20},
      {"refined-concrete", 6}
    },
    result = "nullius-underground-pipe-4",
    result_count = 2
  },
  {
    type = "recipe",
    name = "nullius-boxed-underground-pipe-4",
    enabled = false,
    category = "medium-only-assembly",
    subgroup = "boxed-pipe",
    always_show_made_in = true,
    show_amount_in_title = false,
    always_show_products = true,
    energy_required = 60,
    ingredients = {
      {"nullius-box-pipe-4", 20},
      {"nullius-box-reinforced-concrete", 3}
    },
    result = "nullius-box-underground-pipe-4",
    result_count = 2
  },

  {
    type = "recipe",
    name = "nullius-pump-1",
    enabled = false,
    category = "medium-crafting",
    always_show_made_in = true,
    energy_required = 2,
    ingredients = {
      {"nullius-motor-1", 1},
      {"nullius-one-way-valve", 2}
    },
    result = "nullius-pump-1"
  },
  {
    type = "recipe",
    name = "nullius-boxed-pump-1",
    enabled = false,
    category = "large-assembly",
    subgroup = "boxed-plumbing",
    always_show_made_in = true,
    energy_required = 10,
    ingredients = {
      {"nullius-box-motor-1", 1},
      {"nullius-box-one-way-valve", 2}
    },
    result = "nullius-box-pump-1"
  },
  {
    type = "recipe",
    name = "nullius-pump-2",
    enabled = false,
    category = "medium-crafting",
    always_show_made_in = true,
    energy_required = 5,
    ingredients = {
      {"nullius-pump-1", 1},
      {"nullius-motor-2", 1},
      {"nullius-pipe-2", 2},
      {"nullius-rubber", 1}
    },
    result = "nullius-pump-2"
  },
  {
    type = "recipe",
    name = "nullius-boxed-pump-2",
    enabled = false,
    category = "large-assembly",
    subgroup = "boxed-plumbing",
    always_show_made_in = true,
    energy_required = 25,
    ingredients = {
      {"nullius-box-pump-1", 1},
      {"nullius-box-motor-2", 1},
      {"nullius-box-pipe-2", 2},
      {"nullius-box-rubber", 1}
    },
    result = "nullius-box-pump-2"
  },
  {
    type = "recipe",
    name = "nullius-pump-3",
    enabled = false,
    category = "medium-crafting",
    always_show_made_in = true,
    energy_required = 8,
    ingredients = {
      {"nullius-pump-2", 2},
      {"nullius-motor-3", 1},
      {"nullius-pipe-4", 2},
      {"nullius-top-up-valve", 2},
      {"power-switch", 1}
    },
    result = "nullius-pump-3"
  },
  {
    type = "recipe",
    name = "nullius-boxed-pump-3",
    enabled = false,
    category = "large-assembly",
    subgroup = "boxed-plumbing",
    always_show_made_in = true,
    energy_required = 40,
    ingredients = {
      {"nullius-box-pump-2", 2},
      {"nullius-box-motor-3", 1},
      {"nullius-box-pipe-4", 2},
      {"nullius-box-top-up-valve", 2},
      {"nullius-box-power-switch", 1}
    },
    result = "nullius-box-pump-3"
  },

   {
    type = "recipe",
    name = "nullius-small-pump-1",
    enabled = false,
    category = "tiny-crafting",
    always_show_made_in = true,
    show_amount_in_title = false,
    always_show_products = true,
    energy_required = 1,
    ingredients = {
      {"nullius-pump-2", 1},
      {"nullius-one-way-valve", 2}
    },
    result = "nullius-small-pump-1",
    result_count = 2
  },
  {
    type = "recipe",
    name = "nullius-boxed-small-pump-1",
    enabled = false,
    category = "medium-only-assembly",
    subgroup = "boxed-plumbing",
    always_show_made_in = true,
    show_amount_in_title = false,
    always_show_products = true,
    energy_required = 5,
    ingredients = {
      {"nullius-box-pump-2", 1},
      {"nullius-box-one-way-valve", 2}
    },
    result = "nullius-box-small-pump-1",
    result_count = 2
  },
  {
    type = "recipe",
    name = "nullius-small-pump-2",
    enabled = false,
    always_show_made_in = true,
    show_amount_in_title = false,
    always_show_products = true,
    category = "tiny-crafting",
    energy_required = 2,
    ingredients = {
      {"nullius-small-pump-1", 2},
      {"nullius-pump-3", 1}
    },
    result = "nullius-small-pump-2",
    result_count = 2
  },
  {
    type = "recipe",
    name = "nullius-boxed-small-pump-2",
    enabled = false,
    always_show_made_in = true,
    show_amount_in_title = false,
    always_show_products = true,
    category = "medium-only-assembly",
    subgroup = "boxed-plumbing",
    energy_required = 10,
    ingredients = {
      {"nullius-box-small-pump-1", 2},
      {"nullius-box-pump-3", 1}
    },
    result = "nullius-box-small-pump-2",
    result_count = 2
  },

   {
    type = "recipe",
    name = "nullius-chimney-1",
    icons = {
      {
        icon = ICONPATH .. "shadow.png",
        icon_size = 64,
        scale = 0.5
      },
      {
        icon = "__angelspetrochem__/graphics/icons/flare-stack.png",
        icon_size = 32,
        scale = 0.8
      }
    },
    enabled = false,
    category = "large-crafting",
    always_show_made_in = true,
    energy_required = 4,
    ingredients = {
      {"stone-brick", 3},
      {"nullius-pipe-1", 3},
      {"nullius-iron-rod", 2},
      {"nullius-one-way-valve", 1}
    },
    result = "nullius-chimney-1"
  },
  {
    type = "recipe",
    name = "nullius-chimney-2",
    enabled = false,
    category = "large-crafting",
    always_show_made_in = true,
    energy_required = 4,
    ingredients = {
      {"nullius-chimney-1", 2},
      {"nullius-pipe-2", 10},
      {"nullius-steel-beam", 4},
      {"concrete", 10},
      {"nullius-pump-2", 1}
    },
    result = "nullius-chimney-2"
  },

   {
    type = "recipe",
    name = "nullius-one-way-valve-1",
    localised_name = {"", {"entity-name.nullius-one-way-valve"}, " ", 1},
    enabled = false,
    category = "tiny-crafting",
    always_show_made_in = true,
    show_amount_in_title = false,
    always_show_products = true,
    order = "nullius-dbb",
    energy_required = 4,
    ingredients = {
      {"nullius-pipe-1", 1},
      {"nullius-iron-sheet", 1}
    },
    result = "nullius-one-way-valve"
  },
  {
    type = "recipe",
    name = "nullius-one-way-valve-2",
    localised_name = {"", {"entity-name.nullius-one-way-valve"}, " ", 2},
    enabled = false,
    category = "small-assembly",
    always_show_made_in = true,
    show_amount_in_title = false,
    always_show_products = true,
    order = "nullius-dbc",
    energy_required = 6,
    ingredients = {
      {"nullius-pipe-2", 2},
      {"nullius-rubber", 1},
      {"nullius-steel-sheet", 1}
    },
    result = "nullius-one-way-valve",
    result_count = 5
  },
  {
    type = "recipe",
    name = "nullius-boxed-one-way-valve",
    enabled = false,
    category = "medium-only-assembly",
    subgroup = "boxed-plumbing",
    always_show_made_in = true,
    show_amount_in_title = false,
    always_show_products = true,
    energy_required = 30,
    ingredients = {
      {"nullius-box-pipe-2", 2},
      {"nullius-box-rubber", 1},
      {"nullius-box-steel-sheet", 1}
    },
    result = "nullius-box-one-way-valve",
    result_count = 5
  },
  {
    type = "recipe",
    name = "nullius-relief-valve",
    enabled = false,
    category = "tiny-crafting",
    always_show_made_in = true,
    show_amount_in_title = false,
    always_show_products = true,
    energy_required = 2,
    ingredients = {
      {"nullius-priority-valve", 1},
      {"nullius-iron-wire", 1}
    },
    result = "nullius-relief-valve"
  },
  {
    type = "recipe",
    name = "nullius-boxed-relief-valve",
    enabled = false,
    category = "medium-only-assembly",
    subgroup = "boxed-plumbing",
    always_show_made_in = true,
    show_amount_in_title = false,
    always_show_products = true,
    energy_required = 10,
    ingredients = {
      {"nullius-box-priority-valve", 2},
      {"nullius-box-steel-wire", 1}
    },
    result = "nullius-box-relief-valve",
    result_count = 2
  },
  {
    type = "recipe",
    name = "nullius-top-up-valve",
    enabled = false,
    category = "tiny-crafting",
    always_show_made_in = true,
    show_amount_in_title = false,
    always_show_products = true,
    energy_required = 2,
    ingredients = {
      {"nullius-priority-valve", 1},
      {"nullius-plastic", 1}
    },
    result = "nullius-top-up-valve"
  },
  {
    type = "recipe",
    name = "nullius-boxed-top-up-valve",
    enabled = false,
    category = "medium-only-assembly",
    subgroup = "boxed-plumbing",
    always_show_made_in = true,
    show_amount_in_title = false,
    always_show_products = true,
    energy_required = 10,
    ingredients = {
      {"nullius-box-priority-valve", 2},
      {"nullius-box-rubber", 1}
    },
    result = "nullius-box-top-up-valve",
    result_count = 2
  },
  {
    type = "recipe",
    name = "nullius-priority-valve",
    enabled = false,
    category = "tiny-crafting",
    always_show_made_in = true,
    show_amount_in_title = false,
    always_show_products = true,
    energy_required = 2,
    ingredients = {
      {"nullius-one-way-valve", 1},
      {"nullius-iron-wire", 1}
    },
    result = "nullius-priority-valve"
  },
  {
    type = "recipe",
    name = "nullius-boxed-priority-valve",
    enabled = false,
    category = "medium-only-assembly",
    subgroup = "boxed-plumbing",
    always_show_made_in = true,
    show_amount_in_title = false,
    always_show_products = true,
    energy_required = 10,
    ingredients = {
      {"nullius-box-one-way-valve", 2},
      {"nullius-box-steel-wire", 1}
    },
    result = "nullius-box-priority-valve",
    result_count = 2
  },

  {
    type = "recipe",
    name = "nullius-outfall-1",
    icons = {
      {
        icon = ICONPATH .. "shadow.png",
        icon_size = 64,
        scale = 0.5
      },
      {
        icon = "__angelsrefining__/graphics/icons/seafloor-pump-ico.png",
        icon_size = 32,
        scale = 0.8
      }
    },
    enabled = false,
    category = "large-crafting",
    always_show_made_in = true,
    energy_required = 4,
    ingredients = {
      {"nullius-underground-pipe-1", 1},
      {"nullius-one-way-valve", 1}
    },
    result = "nullius-outfall-1"
  },
  {
    type = "recipe",
    name = "nullius-outfall-2",
    enabled = false,
    category = "large-crafting",
    always_show_made_in = true,
    energy_required = 4,
    ingredients = {
      {"nullius-outfall-1", 2},
      {"nullius-underground-pipe-2", 4},
      {"concrete", 10},
      {"nullius-pump-2", 1}
    },
    result = "nullius-outfall-2"
  },

  {
    type = "recipe",
    name = "nullius-seawater-intake-1",
    enabled = false,
    category = "medium-crafting",
    always_show_made_in = true,
    energy_required = 4,
    ingredients = {
      {"nullius-pump-1", 1},
      {"nullius-outfall-1", 1},
      {"nullius-filter-1", 1}
    },
    result = "nullius-seawater-intake-1"
  },
  {
    type = "recipe",
    name = "nullius-seawater-intake-2",
    enabled = false,
    category = "medium-crafting",
    always_show_made_in = true,
    energy_required = 10,
    ingredients = {
      {"nullius-seawater-intake-1", 1},
      {"nullius-pump-2", 2},
      {"nullius-underground-pipe-2", 2},
      {"nullius-filter-1", 6}
    },
    result = "nullius-seawater-intake-2"
  },

  {
    type = "recipe",
    name = "nullius-air-filter-1",
    icons = {
      {
        icon = ICONPATH .. "shadow.png",
        icon_size = 64,
        scale = 0.5
      },
      {
        icon = "__angelspetrochem__/graphics/icons/air-filter.png",
        icon_size = 32,
        scale = 0.6
      }
    },
    enabled = false,
    category = "large-crafting",
    always_show_made_in = true,
    energy_required = 8,
    ingredients = {
      {"nullius-backup-turbine-1", 1},
      {"nullius-filter-1", 2},
      {"nullius-pump-1", 1}
    },
    result = "nullius-air-filter-1"
  },
  {
    type = "recipe",
    name = "nullius-air-filter-2",
    icons = {
      {
        icon = ICONPATH .. "shadow.png",
        icon_size = 64,
        scale = 0.5
      },
      {
        icon = "__angelspetrochem__/graphics/icons/air-filter.png",
        icon_size = 32,
        scale = 0.8
      }
    },
    enabled = false,
    show_amount_in_title = false,
    always_show_products = true,
    always_show_made_in = true,
    category = "large-crafting",
    energy_required = 12,
    ingredients = {
      {"nullius-air-filter-1", 2},
      {"nullius-standard-turbine-2", 1},
      {"nullius-filter-1", 10},
      {"nullius-pump-2", 2}
    },
    result = "nullius-air-filter-2",
    result_count = 2
  },
  {
    type = "recipe",
    name = "nullius-air-filter-3",
    enabled = false,
    always_show_made_in = true,
    show_amount_in_title = false,
    always_show_products = true,
    category = "large-crafting",
    energy_required = 30,
    ingredients = {
      {"nullius-air-filter-2", 3},
      {"nullius-surge-compressor-2", 1},
      {"nullius-filter-2", 4},
      {"nullius-pump-3", 2},
      {"nullius-chimney-2", 1},
      {"stone-wall", 8}
    },
    result = "nullius-air-filter-3",
    result_count = 2
  },

  {
    type = "recipe",
    name = "nullius-combustion-chamber-1",
    enabled = false,
    category = "medium-crafting",
    always_show_made_in = true,
    energy_required = 3,
    ingredients = {
      {"nullius-small-furnace-1", 1},
      {"nullius-medium-tank-1", 1}
    },
    result = "nullius-combustion-chamber-1"
  },
  {
    type = "recipe",
    name = "nullius-mirror-combustion-chamber-1",
    enabled = false,
    always_show_made_in = true,
    no_productivity = true,
    category = "medium-crafting",
    energy_required = 1,
    ingredients = {
      {"nullius-combustion-chamber-1", 1},
      {"nullius-pipe-1", 2}
    },
    result = "nullius-mirror-combustion-chamber-1"
  },
  {
    type = "recipe",
    name = "nullius-unmirror-combustion-chamber-1",
    localised_name = {"recipe-name.nullius-unmirrored",
      {"entity-name.nullius-combustion-chamber-1"}},
    icons = {
      {
        icon = "__base__/graphics/icons/boiler.png",
        icon_size = 64,
        icon_mipmaps = 4,
        tint = {0.77, 0.77, 0.66, 1}
      },
      {
        icon = ICONPATH .. "flip2.png",
        icon_size = 64
      }
    },
    enabled = false,
    always_show_made_in = true,
    no_productivity = true,
    allow_decomposition = false,
    allow_as_intermediate = false,
    always_show_products = true,
    category = "medium-crafting",
    subgroup = "unmirror-1",
    order = "nullius-hb",
    energy_required = 0.5,
    ingredients = {
      {"nullius-mirror-combustion-chamber-1", 1},
      {"nullius-pipe-1", 1}
    },
    result = "nullius-combustion-chamber-1"
  },
  {
    type = "recipe",
    name = "nullius-combustion-chamber-2",
    enabled = false,
    category = "medium-crafting",
    always_show_made_in = true,
    energy_required = 8,
    ingredients = {
      {"nullius-combustion-chamber-1", 1},
      {"nullius-small-furnace-2", 1},
      {"nullius-medium-tank-2", 1}
    },
    result = "nullius-combustion-chamber-2"
  },
  {
    type = "recipe",
    name = "nullius-mirror-combustion-chamber-2",
    enabled = false,
    category = "medium-crafting",
    always_show_made_in = true,
    no_productivity = true,
    energy_required = 1,
    ingredients = {
      {"nullius-combustion-chamber-2", 1},
      {"nullius-pipe-2", 2}
    },
    result = "nullius-mirror-combustion-chamber-2"
  },
  {
    type = "recipe",
    name = "nullius-unmirror-combustion-chamber-2",
    localised_name = {"recipe-name.nullius-unmirror-combustion-chamber-2"},
    icons = {
      {
        icon = "__base__/graphics/icons/boiler.png",
        icon_size = 64,
        icon_mipmaps = 4,
        tint = {0.8, 0.8, 1, 1}
      },
      {
        icon = ICONPATH .. "flip2.png",
        icon_size = 64
      }
    },
    enabled = false,
    category = "medium-crafting",
    subgroup = "unmirror-1",
    order = "nullius-hc",
    always_show_made_in = true,
    no_productivity = true,
    allow_decomposition = false,
    allow_as_intermediate = false,
    always_show_products = true,
    energy_required = 0.5,
    ingredients = {
      {"nullius-mirror-combustion-chamber-2", 1},
      {"nullius-pipe-2", 1}
    },
    result = "nullius-combustion-chamber-2"
  },
  {
    type = "recipe",
    name = "nullius-combustion-chamber-3",
    enabled = false,
    category = "medium-crafting",
    always_show_made_in = true,
    energy_required = 10,
    ingredients = {
      {"nullius-combustion-chamber-2", 1},
      {"nullius-medium-furnace-2", 1},
      {"nullius-medium-tank-3", 1},
      {"nullius-ceramic-powder", 8}
    },
    result = "nullius-combustion-chamber-3"
  },
  {
    type = "recipe",
    name = "nullius-mirror-combustion-chamber-3",
    enabled = false,
    category = "medium-crafting",
    always_show_made_in = true,
    no_productivity = true,
    energy_required = 1,
    ingredients = {
      {"nullius-combustion-chamber-3", 1},
      {"nullius-pipe-2", 3}
    },
    result = "nullius-mirror-combustion-chamber-3"
  },
  {
    type = "recipe",
    name = "nullius-unmirror-combustion-chamber-3",
    localised_name = {"recipe-name.nullius-unmirror-combustion-chamber-3"},
    icons = {
      {
        icon = "__base__/graphics/icons/boiler.png",
        icon_size = 64,
        icon_mipmaps = 4
      },
      {
        icon = ICONPATH .. "flip2.png",
        icon_size = 64
      }
    },
    enabled = false,
    category = "medium-crafting",
    subgroup = "unmirror-1",
    order = "nullius-hd",
    always_show_made_in = true,
    no_productivity = true,
    allow_decomposition = false,
    allow_as_intermediate = false,
    always_show_products = true,
    energy_required = 0.5,
    ingredients = {
      {"nullius-mirror-combustion-chamber-3", 1},
      {"nullius-pipe-2", 1}
    },
    result = "nullius-combustion-chamber-3"
  },

  {
    type = "recipe",
    name = "nullius-backup-turbine-1",
    enabled = false,
    category = "large-crafting",
    always_show_made_in = true,
    energy_required = 8,
    ingredients = {
      {"nullius-motor-1", 1},
      {"nullius-iron-sheet", 3},
      {"nullius-iron-gear", 1},
      {"nullius-pipe-1", 2}
    },
    result = "nullius-backup-turbine-1"
  },
  {
    type = "recipe",
    name = "nullius-boxed-backup-turbine-1",
    enabled = false,
    category = "huge-assembly",
    subgroup = "boxed-fluid-energy",
    always_show_made_in = true,
    energy_required = 40,
    ingredients = {
      {"nullius-box-motor-1", 1},
      {"nullius-box-iron-sheet", 3},
      {"nullius-box-iron-gear", 1},
      {"nullius-box-pipe-1", 2}
    },
    result = "nullius-box-backup-turbine-1"
  },
  {
    type = "recipe",
    name = "nullius-standard-turbine-1",
    enabled = false,
    always_show_made_in = true,
    no_productivity = true,
    category = "large-crafting",
    energy_required = 1,
    ingredients = {
      {"nullius-backup-turbine-1", 1},
      {"copper-cable", 1}
    },
    result = "nullius-standard-turbine-1"
  },
  {
    type = "recipe",
    name = "nullius-boxed-standard-turbine-1",
    enabled = false,
    always_show_made_in = true,
    no_productivity = true,
    category = "huge-assembly",
    subgroup = "boxed-fluid-energy",
    energy_required = 5,
    ingredients = {
      {"nullius-box-backup-turbine-1", 1},
      {"nullius-box-insulated-wire", 1}
    },
    result = "nullius-box-standard-turbine-1"
  },
  {
    type = "recipe",
    name = "nullius-turbine-2",
    enabled = false,
    always_show_made_in = true,
    category = "large-crafting",
    energy_required = 12,
    ingredients = {
      {"nullius-standard-turbine-1", 2},
      {"nullius-motor-2", 2},
      {"nullius-aluminum-sheet", 8},
      {"nullius-steel-gear", 4},
      {"nullius-pipe-2", 5},
      {"nullius-capacitor", 2}
    },
    result = "nullius-standard-turbine-2"
  },
  {
    type = "recipe",
    name = "nullius-boxed-standard-turbine-2",
    enabled = false,
    always_show_made_in = true,
    category = "huge-assembly",
    subgroup = "boxed-fluid-energy",
    energy_required = 60,
    ingredients = {
      {"nullius-box-standard-turbine-1", 2},
      {"nullius-box-motor-2", 2},
      {"nullius-box-aluminum-sheet", 8},
      {"nullius-box-steel-gear", 4},
      {"nullius-box-pipe-2", 5},
      {"nullius-box-capacitor", 2}
    },
    result = "nullius-box-standard-turbine-2"
  },
  {
    type = "recipe",
    name = "nullius-backup-turbine-2",
    enabled = false,
    always_show_made_in = true,
    no_productivity = true,
    category = "large-crafting",
    energy_required = 2,
    ingredients = {
      {"nullius-standard-turbine-2", 1},
      {"power-switch", 1}
    },
    result = "nullius-backup-turbine-2"
  },
  {
    type = "recipe",
    name = "nullius-boxed-backup-turbine-2",
    enabled = false,
    always_show_made_in = true,
    no_productivity = true,
    category = "large-crafting",
    subgroup = "boxed-fluid-energy",
    energy_required = 10,
    ingredients = {
      {"nullius-box-standard-turbine-2", 1},
      {"nullius-box-power-switch", 1}
    },
    result = "nullius-box-backup-turbine-2"
  },
  {
    type = "recipe",
    name = "nullius-turbine-3",
    enabled = false,
    always_show_made_in = true,
    category = "large-crafting",
    energy_required = 20,
    ingredients = {
      {"nullius-standard-turbine-2", 2},
      {"nullius-motor-3", 4},
      {"nullius-titanium-sheet", 12},
      {"nullius-bearing", 6},
      {"nullius-pipe-4", 8},
      {"nullius-transformer", 1},
      {"nullius-small-pump-2", 1}
    },
    result = "nullius-standard-turbine-3"
  },
  {
    type = "recipe",
    name = "nullius-boxed-standard-turbine-3",
    enabled = false,
    always_show_made_in = true,
    category = "huge-assembly",
    subgroup = "boxed-fluid-energy",
    energy_required = 100,
    ingredients = {
      {"nullius-box-standard-turbine-2", 2},
      {"nullius-box-motor-3", 4},
      {"nullius-box-titanium-sheet", 12},
      {"nullius-box-bearing", 6},
      {"nullius-box-pipe-4", 8},
      {"nullius-box-transformer", 1},
      {"nullius-box-small-pump-2", 1}
    },
    result = "nullius-box-standard-turbine-3"
  },
  {
    type = "recipe",
    name = "nullius-backup-turbine-3",
    enabled = false,
    always_show_made_in = true,
    no_productivity = true,
    category = "large-crafting",
    energy_required = 3,
    ingredients = {
      {"nullius-standard-turbine-3", 1},
      {"power-switch", 2}
    },
    result = "nullius-backup-turbine-3"
  },
  {
    type = "recipe",
    name = "nullius-boxed-backup-turbine-3",
    enabled = false,
    always_show_made_in = true,
    no_productivity = true,
    category = "large-crafting",
    subgroup = "boxed-fluid-energy",
    energy_required = 15,
    ingredients = {
      {"nullius-box-standard-turbine-3", 1},
      {"nullius-box-power-switch", 2}
    },
    result = "nullius-box-backup-turbine-3"
  },
  {
    type = "recipe",
    name = "nullius-priority-turbine-1",
    enabled = false,
    always_show_made_in = true,
    no_productivity = true,
    category = "large-crafting",
    energy_required = 5,
    ingredients = {
      {"nullius-standard-turbine-2", 1},
      {"power-switch", 2}
    },
    result = "nullius-priority-turbine-1"
  },
  {
    type = "recipe",
    name = "nullius-priority-turbine-2",
    enabled = false,
    always_show_made_in = true,
    no_productivity = true,
    category = "large-crafting",
    energy_required = 8,
    ingredients = {
      {"nullius-standard-turbine-3", 1},
      {"power-switch", 3}
    },
    result = "nullius-priority-turbine-2"
  },

  {
    type = "recipe",
    name = "nullius-turbine-reprioritization-2",
    localised_name = {"recipe-name.nullius-reprioritization", {"entity-name.nullius-backup-turbine-2"}},
    icons = {
      data.raw.item["nullius-backup-turbine-2"].icons[1],
      {
        icon = ICONPATH .. "up.png",
        icon_size = 64,
        scale = 0.3,
        shift = {8, -6}
      }
    },
    enabled = false,
    always_show_made_in = true,
    no_productivity = true,
    allow_decomposition = false,
    allow_as_intermediate = false,
    always_show_products = true,
    category = "large-crafting",
    subgroup = "prioritization",
    order = "nullius-db",
    energy_required = 1,
    ingredients = {
      {"nullius-backup-turbine-2", 1},
      {"copper-cable", 1}
    },
    result = "nullius-standard-turbine-2"
  },
  {
    type = "recipe",
    name = "nullius-turbine-deprioritization-2",
    localised_name = {"recipe-name.nullius-deprioritization", {"entity-name.nullius-priority-turbine-1"}},
    icons = {
      data.raw.item["nullius-priority-turbine-1"].icons[1],
      {
        icon = ICONPATH .. "down.png",
        icon_size = 64,
        scale = 0.3,
        shift = {-8, 6}
      }
    },
    enabled = false,
    always_show_made_in = true,
    no_productivity = true,
    allow_decomposition = false,
    allow_as_intermediate = false,
    always_show_products = true,
    category = "large-crafting",
    subgroup = "prioritization",
    order = "nullius-dc",
    energy_required = 1,
    ingredients = {
      {"nullius-priority-turbine-1", 1},
      {"copper-cable", 1}
    },
    result = "nullius-standard-turbine-2"
  },
  {
    type = "recipe",
    name = "nullius-turbine-reprioritization-3",
    localised_name = {"recipe-name.nullius-reprioritization", {"entity-name.nullius-backup-turbine-3"}},
    icons = {
      data.raw.item["nullius-backup-turbine-3"].icons[1],
      {
        icon = ICONPATH .. "up.png",
        icon_size = 64,
        scale = 0.3,
        shift = {8, -6}
      }
    },
    enabled = false,
    always_show_made_in = true,
    no_productivity = true,
    allow_decomposition = false,
    allow_as_intermediate = false,
    always_show_products = true,
    category = "large-crafting",
    subgroup = "prioritization",
    order = "nullius-dd",
    energy_required = 1,
    ingredients = {
      {"nullius-backup-turbine-3", 1},
      {"copper-cable", 1}
    },
    result = "nullius-standard-turbine-3"
  },
  {
    type = "recipe",
    name = "nullius-turbine-deprioritization-3",
    localised_name = {"recipe-name.nullius-deprioritization", {"entity-name.nullius-priority-turbine-2"}},
    icons = {
      data.raw.item["nullius-priority-turbine-2"].icons[1],
      {
        icon = ICONPATH .. "down.png",
        icon_size = 64,
        scale = 0.3,
        shift = {-8, 6}
      }
    },
    enabled = false,
    always_show_made_in = true,
    no_productivity = true,
    allow_decomposition = false,
    allow_as_intermediate = false,
    always_show_products = true,
    category = "large-crafting",
    subgroup = "prioritization",
    order = "nullius-de",
    energy_required = 1,
    ingredients = {
      {"nullius-priority-turbine-2", 1},
      {"copper-cable", 1}
    },
    result = "nullius-standard-turbine-3"
  },

  {
    type = "recipe",
    name = "nullius-hydro-plant-1",
    enabled = false,
    category = "large-crafting",
    always_show_made_in = true,
    energy_required = 4,
    ingredients = {
      {"nullius-distillery-1", 1},
      {"nullius-seawater-intake-1", 1}
    },
    result = "nullius-hydro-plant-1"
  },
  {
    type = "recipe",
    name = "nullius-hydro-plant-2",
    enabled = false,
    category = "huge-crafting",
    always_show_made_in = true,
    energy_required = 10,
    ingredients = {
      {"nullius-hydro-plant-1", 1},
      {"nullius-chemical-plant-1", 1},
      {"nullius-seawater-intake-2", 1},
      {"nullius-medium-tank-2", 2},
      {"red-wire", 6}
    },
    result = "nullius-hydro-plant-2"
  },
  {
    type = "recipe",
    name = "nullius-mirror-hydro-plant-2",
    enabled = false,
    category = "huge-crafting",
    always_show_made_in = true,
    no_productivity = true,
    energy_required = 1,
    ingredients = {
      {"nullius-hydro-plant-2", 1},
      {"nullius-pipe-2", 4}
    },
    result = "nullius-mirror-hydro-plant-2"
  },
  {
    type = "recipe",
    name = "nullius-unmirror-hydro-plant-2",
    localised_name = {"recipe-name.nullius-unmirror-hydro-plant-2"},
    icons = {
      {
        icon = "__angelsrefining__/graphics/icons/hydro-plant.png",
        icon_size = 32,
        tint = {0.8, 0.8, 0.9}
      },
      {
        icon = ICONPATH .. "flip2.png",
        icon_size = 64
      }
    },
    enabled = false,
    category = "huge-crafting",
    subgroup = "unmirror-1",
    order = "nullius-fb",
    always_show_made_in = true,
    no_productivity = true,
    allow_decomposition = false,
    allow_as_intermediate = false,
    always_show_products = true,
    energy_required = 0.5,
    ingredients = {
      {"nullius-mirror-hydro-plant-2", 1},
      {"nullius-pipe-2", 1}
    },
    result = "nullius-hydro-plant-2"
  },
  {
    type = "recipe",
    name = "nullius-hydro-plant-3",
    enabled = false,
    always_show_made_in = true,
    category = "huge-crafting",
    energy_required = 20,
    ingredients = {
      {"nullius-hydro-plant-2", 1},
      {"nullius-flotation-cell-2", 1},
      {"nullius-chemical-plant-2", 1},
      {"nullius-large-tank-3", 1},
      {"nullius-pump-3", 3},
      {"nullius-box-filter-2", 1},
      {"nullius-box-sensor-2", 1}
    },
    result = "nullius-hydro-plant-3"
  },
  {
    type = "recipe",
    name = "nullius-mirror-hydro-plant-3",
    enabled = false,
    always_show_made_in = true,
    no_productivity = true,
    category = "huge-crafting",
    energy_required = 1,
    ingredients = {
      {"nullius-hydro-plant-3", 1},
      {"nullius-pipe-3", 5}
    },
    result = "nullius-mirror-hydro-plant-3"
  },
  {
    type = "recipe",
    name = "nullius-unmirror-hydro-plant-3",
    localised_name = {"recipe-name.nullius-unmirror-hydro-plant-3"},
    icons = {
      {
        icon = "__angelsrefining__/graphics/icons/hydro-plant.png",
        icon_size = 32
      },
      {
        icon = ICONPATH .. "flip2.png",
        icon_size = 64
      }
    },
    enabled = false,
    category = "huge-crafting",
    subgroup = "unmirror-1",
    order = "nullius-fc",
    always_show_made_in = true,
    no_productivity = true,
    allow_decomposition = false,
    allow_as_intermediate = false,
    always_show_products = true,
    energy_required = 0.5,
    ingredients = {
      {"nullius-mirror-hydro-plant-3", 1},
      {"nullius-pipe-3", 1}
    },
    result = "nullius-hydro-plant-3"
  },

  {
    type = "recipe",
    name = "nullius-distillery-1",
    enabled = false,
    category = "large-crafting",
    always_show_made_in = true,
    energy_required = 4,
    ingredients = {
      {"nullius-small-furnace-1", 1},
      {"nullius-medium-tank-1", 1},
      {"nullius-priority-valve", 2},
      {"nullius-chimney-1", 1},
      {"nullius-filter-1", 2}
    },
    result = "nullius-distillery-1"
  },
  {
    type = "recipe",
    name = "nullius-distillery-2",
    enabled = false,
    category = "huge-crafting",
    always_show_made_in = true,
    energy_required = 8,
    ingredients = {
      {"nullius-distillery-1", 1},
      {"nullius-small-furnace-2", 1},
      {"nullius-small-tank-1", 3},
      {"nullius-heat-pipe-1", 8},
      {"nullius-filter-1", 4}
    },
    result = "nullius-distillery-2"
  },
  {
    type = "recipe",
    name = "nullius-mirror-distillery-2",
    enabled = false,
    category = "huge-crafting",
    always_show_made_in = true,
    no_productivity = true,
    energy_required = 1,
    ingredients = {
      {"nullius-distillery-2", 1},
      {"nullius-pipe-2", 5}
    },
    result = "nullius-mirror-distillery-2"
  },
  {
    type = "recipe",
    name = "nullius-unmirror-distillery-2",
    localised_name = {"recipe-name.nullius-unmirror-distillery-2"},
    icons = {
      {
        icon = "__base__/graphics/icons/oil-refinery.png",
        icon_size = 64,
        icon_mipmaps = 4,
        tint = {0.7, 0.7, 1, 1}
      },
      {
        icon = ICONPATH .. "flip2.png",
        icon_size = 64
      }
    },
    enabled = false,
    category = "huge-crafting",
    subgroup = "unmirror-2",
    order = "nullius-cb",
    always_show_made_in = true,
    no_productivity = true,
    allow_decomposition = false,
    allow_as_intermediate = false,
    always_show_products = true,
    energy_required = 0.5,
    ingredients = {
      {"nullius-mirror-distillery-2", 1},
      {"nullius-pipe-2", 1}
    },
    result = "nullius-distillery-2"
  },
  {
    type = "recipe",
    name = "nullius-distillery-3",
    enabled = false,
    always_show_made_in = true,
    category = "huge-crafting",
    energy_required = 15,
    ingredients = {
      {"nullius-distillery-2", 2},
      {"nullius-hydro-plant-2", 1},
      {"nullius-air-filter-2", 1},
      {"nullius-filter-2", 3},
      {"nullius-large-furnace-1", 1},
      {"nullius-thermal-tank-1", 2},
      {"nullius-barrel-pump-1", 1}
    },
    result = "nullius-distillery-3"
  },
  {
    type = "recipe",
    name = "nullius-mirror-distillery-3",
    enabled = false,
    always_show_made_in = true,
    no_productivity = true,
    category = "huge-crafting",
    energy_required = 1,
    ingredients = {
      {"nullius-distillery-3", 1},
      {"nullius-pipe-3", 6}
    },
    result = "nullius-mirror-distillery-3"
  },
  {
    type = "recipe",
    name = "nullius-unmirror-distillery-3",
    localised_name = {"recipe-name.nullius-unmirror-distillery-3"},
    icons = {
      {
        icon = "__base__/graphics/icons/oil-refinery.png",
        icon_size = 64,
        icon_mipmaps = 4
      },
      {
        icon = ICONPATH .. "flip2.png",
        icon_size = 64
      }
    },
    enabled = false,
    always_show_made_in = true,
    no_productivity = true,
    allow_decomposition = false,
    allow_as_intermediate = false,
    always_show_products = true,
    category = "huge-crafting",
    subgroup = "unmirror-2",
    order = "nullius-cc",
    energy_required = 0.5,
    ingredients = {
      {"nullius-mirror-distillery-3", 1},
      {"nullius-pipe-3", 1}
    },
    result = "nullius-distillery-3"
  },

  {
    type = "recipe",
    name = "nullius-flotation-cell-1",
    enabled = false,
    category = "large-crafting",
    always_show_made_in = true,
    energy_required = 12,
    ingredients = {
      {"nullius-hydro-plant-1", 1},
      {"nullius-crusher-1", 1}
    },
    result = "nullius-flotation-cell-1"
  },
  {
    type = "recipe",
    name = "nullius-flotation-cell-2",
    enabled = false,
    category = "huge-crafting",
    always_show_made_in = true,
    energy_required = 16,
    ingredients = {
      {"nullius-flotation-cell-1", 1},
      {"nullius-chemical-plant-1", 1},
      {"nullius-foundry-1", 1}
    },
    result = "nullius-flotation-cell-2"
  },
  {
    type = "recipe",
    name = "nullius-mirror-flotation-cell-2",
    enabled = false,
    category = "huge-crafting",
    always_show_made_in = true,
    no_productivity = true,
    energy_required = 1,
    ingredients = {
      {"nullius-flotation-cell-2", 1},
      {"nullius-pipe-2", 4}
    },
    result = "nullius-mirror-flotation-cell-2"
  },
  {
    type = "recipe",
    name = "nullius-unmirror-flotation-cell-2",
    localised_name = {"recipe-name.nullius-unmirror-flotation-cell-2"},
    icons = {
      {
        icon = "__angelsrefining__/graphics/icons/ore-floatation-cell.png",
        icon_size = 32,
        tint = {0.8, 0.8, 1, 1}
      },
      {
        icon = ICONPATH .. "flip2.png",
        icon_size = 64
      }
    },
    enabled = false,
    category = "huge-crafting",
    subgroup = "unmirror-2",
    order = "nullius-eb",
    always_show_made_in = true,
    no_productivity = true,
    allow_decomposition = false,
    allow_as_intermediate = false,
    always_show_products = true,
    energy_required = 0.5,
    ingredients = {
      {"nullius-mirror-flotation-cell-2", 1},
      {"nullius-pipe-2", 1}
    },
    result = "nullius-flotation-cell-2"
  },
  {
    type = "recipe",
    name = "nullius-flotation-cell-3",
    enabled = false,
    always_show_made_in = true,
    category = "huge-crafting",
    energy_required = 20,
    ingredients = {
      {"nullius-flotation-cell-2", 1},
      {"nullius-hydro-plant-2", 1},
      {"nullius-crusher-2", 1}
    },
    result = "nullius-flotation-cell-3"
  },
  {
    type = "recipe",
    name = "nullius-mirror-flotation-cell-3",
    enabled = false,
    always_show_made_in = true,
    no_productivity = true,
    category = "huge-crafting",
    energy_required = 1,
    ingredients = {
      {"nullius-flotation-cell-3", 1},
      {"nullius-pipe-3", 4}
    },
    result = "nullius-mirror-flotation-cell-3"
  },
  {
    type = "recipe",
    name = "nullius-unmirror-flotation-cell-3",
    localised_name = {"recipe-name.nullius-unmirror-flotation-cell-3"},
    icons = {
      {
        icon = "__angelsrefining__/graphics/icons/ore-floatation-cell.png",
        icon_size = 32
      },
      {
        icon = ICONPATH .. "flip2.png",
        icon_size = 64
      }
    },
    enabled = false,
    always_show_made_in = true,
    no_productivity = true,
    allow_decomposition = false,
    allow_as_intermediate = false,
    always_show_products = true,
    category = "huge-crafting",
    subgroup = "unmirror-2",
    order = "nullius-ec",
    energy_required = 0.5,
    ingredients = {
      {"nullius-mirror-flotation-cell-3", 1},
      {"nullius-pipe-3", 1}
    },
    result = "nullius-flotation-cell-3"
  },

  {
    type = "recipe",
    name = "nullius-chemical-plant-1",
    enabled = false,
    category = "large-crafting",
    always_show_made_in = true,
    energy_required = 15,
    ingredients = {
      {"nullius-small-assembler-1", 1},
      {"nullius-medium-tank-1", 2},
      {"nullius-filter-1", 2},
      {"nullius-priority-valve", 2},
      {"nullius-glass", 4}
    },
    result = "nullius-chemical-plant-1"
  },
  {
    type = "recipe",
    name = "nullius-chemical-plant-2",
    enabled = false,
    category = "large-crafting",
    always_show_made_in = true,
    energy_required = 20,
    ingredients = {
      {"nullius-chemical-plant-1", 1},
      {"nullius-lab-1", 1},
      {"nullius-distillery-2", 1},
      {"nullius-sensor-1", 4}
    },
    result = "nullius-chemical-plant-2"
  },
  {
    type = "recipe",
    name = "nullius-mirror-chemical-plant-2",
    enabled = false,
    category = "large-crafting",
    always_show_made_in = true,
    no_productivity = true,
    energy_required = 1,
    ingredients = {
      {"nullius-chemical-plant-2", 1},
      {"nullius-pipe-2", 3}
    },
    result = "nullius-mirror-chemical-plant-2"
  },
  {
    type = "recipe",
    name = "nullius-unmirror-chemical-plant-2",
    localised_name = {"recipe-name.nullius-unmirror-chemical-plant-2"},
    icons = {
      {
        icon = "__base__/graphics/icons/chemical-plant.png",
        icon_size = 64,
        icon_mipmaps = 4,
        tint = {0.8, 0.8, 1, 1}
      },
      {
        icon = ICONPATH .. "flip2.png",
        icon_size = 64
      }
    },
    enabled = false,
    category = "large-crafting",
    subgroup = "unmirror-2",
    order = "nullius-bb",
    always_show_made_in = true,
    no_productivity = true,
    allow_decomposition = false,
    allow_as_intermediate = false,
    always_show_products = true,
    energy_required = 0.5,
    ingredients = {
      {"nullius-mirror-chemical-plant-2", 1},
      {"nullius-pipe-2", 1}
    },
    result = "nullius-chemical-plant-2"
  },
  {
    type = "recipe",
    name = "nullius-chemical-plant-3",
    enabled = false,
    category = "large-crafting",
    always_show_made_in = true,
    energy_required = 30,
    ingredients = {
      {"nullius-chemical-plant-2", 2},
      {"nullius-lab-2", 1},
      {"nullius-flotation-cell-2", 1},
      {"nullius-box-hard-glass", 4}
    },
    result = "nullius-chemical-plant-3"
  },
  {
    type = "recipe",
    name = "nullius-mirror-chemical-plant-3",
    enabled = false,
    always_show_made_in = true,
    no_productivity = true,
    category = "large-crafting",
    energy_required = 1,
    ingredients = {
      {"nullius-chemical-plant-3", 1},
      {"nullius-pipe-3", 4}
    },
    result = "nullius-mirror-chemical-plant-3"
  },
  {
    type = "recipe",
    name = "nullius-unmirror-chemical-plant-3",
    localised_name = {"recipe-name.nullius-unmirror-chemical-plant-3"},
    icons = {
      {
        icon = "__base__/graphics/icons/chemical-plant.png",
        icon_size = 64,
        icon_mipmaps = 4
      },
      {
        icon = ICONPATH .. "flip2.png",
        icon_size = 64
      }
    },
    enabled = false,
    category = "large-crafting",
    subgroup = "unmirror-2",
    order = "nullius-bc",
    always_show_made_in = true,
    no_productivity = true,
    allow_decomposition = false,
    allow_as_intermediate = false,
    always_show_products = true,
    energy_required = 0.5,
    ingredients = {
      {"nullius-mirror-chemical-plant-3", 1},
      {"nullius-pipe-3", 1}
    },
    result = "nullius-chemical-plant-3"
  },

  {
    type = "recipe",
    name = "nullius-priority-electrolyzer-1",
    category = "large-crafting",
    enabled = false,
    always_show_made_in = true,
    energy_required = 10,
    ingredients = {
      {"nullius-power-pole-1", 8},
      {"nullius-medium-tank-1", 3},
      {"nullius-filter-1", 2},
      {"nullius-priority-valve", 4}
    },
    result = "nullius-priority-electrolyzer-1"
  },
  {
    type = "recipe",
    name = "nullius-surge-electrolyzer-1",
    enabled = false,
    always_show_made_in = true,
    no_productivity = true,
    category = "large-crafting",
    energy_required = 4,
    ingredients = {
      {"nullius-priority-electrolyzer-1", 1},
      {"nullius-power-pole-1", 1}
    },
    result = "nullius-surge-electrolyzer-1"
  },
  {
    type = "recipe",
    name = "nullius-priority-electrolyzer-2",
    enabled = false,
    always_show_made_in = true,
    category = "huge-crafting",
    energy_required = 20,
    ingredients = {
      {"nullius-surge-electrolyzer-1", 1},
      {"nullius-priority-electrolyzer-1", 1},
      {"big-electric-pole", 3},
      {"nullius-small-tank-1", 3},
      {"nullius-small-pump-1", 3}
    },
    result = "nullius-priority-electrolyzer-2"
  },
  {
    type = "recipe",
    name = "nullius-surge-electrolyzer-2",
    enabled = false,
    always_show_made_in = true,
    no_productivity = true,
    category = "huge-crafting",
    energy_required = 6,
    ingredients = {
      {"nullius-priority-electrolyzer-2", 1},
      {"power-switch", 1}
    },
    result = "nullius-surge-electrolyzer-2"
  },
  {
    type = "recipe",
    name = "nullius-mirror-priority-electrolyzer-2",
    enabled = false,
    always_show_made_in = true,
    no_productivity = true,
    category = "huge-crafting",
    energy_required = 1,
    ingredients = {
      {"nullius-priority-electrolyzer-2", 1},
      {"nullius-pipe-2", 4}
    },
    result = "nullius-mirror-priority-electrolyzer-2"
  },
  {
    type = "recipe",
    name = "nullius-unmirror-priority-electrolyzer-2",
    localised_name = {"recipe-name.nullius-unmirror-priority-electrolyzer-2"},
    icons = {
      {
        icon = "__angelspetrochem__/graphics/icons/electrolyser.png",
        icon_size = 32,
        tint = {0.8, 0.76, 0.85}
      },
      {
        icon = ICONPATH .. "flip2.png",
        icon_size = 64
      }
    },
    enabled = false,
    always_show_made_in = true,
    no_productivity = true,
    allow_decomposition = false,
    allow_as_intermediate = false,
    always_show_products = true,
    category = "huge-crafting",
    subgroup = "unmirror-1",
    order = "nullius-gbb",
    energy_required = 0.5,
    ingredients = {
      {"nullius-mirror-priority-electrolyzer-2", 1},
      {"nullius-pipe-2", 1}
    },
    result = "nullius-priority-electrolyzer-2"
  },
  {
    type = "recipe",
    name = "nullius-mirror-surge-electrolyzer-2",
    enabled = false,
    always_show_made_in = true,
    no_productivity = true,
    category = "huge-crafting",
    energy_required = 1,
    ingredients = {
      {"nullius-surge-electrolyzer-2", 1},
      {"nullius-pipe-2", 4}
    },
    result = "nullius-mirror-surge-electrolyzer-2"
  },
  {
    type = "recipe",
    name = "nullius-unmirror-surge-electrolyzer-2",
    localised_name = {"recipe-name.nullius-unmirror-surge-electrolyzer-2"},
    icons = {
      {
        icon = "__angelspetrochem__/graphics/icons/electrolyser.png",
        icon_size = 32,
        tint = {0.8, 0.9, 1}
      },
      {
        icon = ICONPATH .. "flip2.png",
        icon_size = 64
      }
    },
    enabled = false,
    always_show_made_in = true,
    no_productivity = true,
    allow_decomposition = false,
    allow_as_intermediate = false,
    always_show_products = true,
    category = "huge-crafting",
    subgroup = "unmirror-1",
    order = "nullius-gbc",
    energy_required = 0.5,
    ingredients = {
      {"nullius-mirror-surge-electrolyzer-2", 1},
      {"nullius-pipe-2", 1}
    },
    result = "nullius-surge-electrolyzer-2"
  },
  {
    type = "recipe",
    name = "nullius-priority-electrolyzer-3",
    enabled = false,
    always_show_made_in = true,
    category = "huge-crafting",
    energy_required = 25,
    ingredients = {
      {"nullius-priority-electrolyzer-2", 1},
      {"nullius-surge-electrolyzer-2", 1},
      {"nullius-distillery-2", 1},
      {"nullius-substation-2", 1},
      {"nullius-charger-2", 2},
      {"nullius-efficiency-module-2", 1}
    },
    result = "nullius-priority-electrolyzer-3"
  },
  {
    type = "recipe",
    name = "nullius-mirror-surge-electrolyzer-3",
    enabled = false,
    always_show_made_in = true,
    no_productivity = true,
    category = "huge-crafting",
    energy_required = 1,
    ingredients = {
      {"nullius-surge-electrolyzer-3", 1},
      {"nullius-pipe-3", 4}
    },
    result = "nullius-mirror-surge-electrolyzer-3"
  },
  {
    type = "recipe",
    name = "nullius-unmirror-surge-electrolyzer-3",
    localised_name = {"recipe-name.nullius-unmirror-surge-electrolyzer-3"},
    icons = {
      {
        icon = "__angelspetrochem__/graphics/icons/electrolyser.png",
        icon_size = 32
      },
      {
        icon = ICONPATH .. "flip2.png",
        icon_size = 64
      }
    },
    enabled = false,
    category = "huge-crafting",
    subgroup = "unmirror-1",
    order = "nullius-gcc",
    always_show_made_in = true,
    no_productivity = true,
    allow_decomposition = false,
    allow_as_intermediate = false,
    always_show_products = true,
    energy_required = 0.5,
    ingredients = {
      {"nullius-mirror-surge-electrolyzer-3", 1},
      {"nullius-pipe-3", 1}
    },
    result = "nullius-surge-electrolyzer-3"
  },
  {
    type = "recipe",
    name = "nullius-surge-electrolyzer-3",
    enabled = false,
    always_show_made_in = true,
    no_productivity = true,
    category = "huge-crafting",
    energy_required = 8,
    ingredients = {
      {"nullius-priority-electrolyzer-3", 1},
      {"nullius-sensor-1", 1}
    },
    result = "nullius-surge-electrolyzer-3"
  },
  {
    type = "recipe",
    name = "nullius-mirror-priority-electrolyzer-3",
    enabled = false,
    always_show_made_in = true,
    no_productivity = true,
    category = "huge-crafting",
    energy_required = 1,
    ingredients = {
      {"nullius-priority-electrolyzer-3", 1},
      {"nullius-pipe-3", 4}
    },
    result = "nullius-mirror-priority-electrolyzer-3"
  },
  {
    type = "recipe",
    name = "nullius-unmirror-priority-electrolyzer-3",
    localised_name = {"recipe-name.nullius-unmirror-priority-electrolyzer-3"},
    icons = {
      {
        icon = "__angelspetrochem__/graphics/icons/electrolyser.png",
        icon_size = 32,
        tint = {1, 0.85, 0.85}
      },
      {
        icon = ICONPATH .. "flip2.png",
        icon_size = 64
      }
    },
    enabled = false,
    category = "huge-crafting",
    subgroup = "unmirror-1",
    order = "nullius-gcb",
    always_show_made_in = true,
    no_productivity = true,
    allow_decomposition = false,
    allow_as_intermediate = false,
    always_show_products = true,
    energy_required = 0.5,
    ingredients = {
      {"nullius-mirror-priority-electrolyzer-3", 1},
      {"nullius-pipe-3", 1}
    },
    result = "nullius-priority-electrolyzer-3"
  },

   {
    type = "recipe",
    name = "nullius-electrolyzer-reprioritization-1",
    localised_name = {"recipe-name.nullius-reprioritization",
        {"entity-name.nullius-surge-electrolyzer-1"}},
    icons = {
      data.raw.item["nullius-surge-electrolyzer-1"].icons[1],
      {
        icon = ICONPATH .. "up.png",
        icon_size = 64,
        scale = 0.3,
        shift = {8, -6}
      }
    },
    enabled = false,
    always_show_made_in = true,
    no_productivity = true,
    allow_decomposition = false,
    allow_as_intermediate = false,
    always_show_products = true,
    category = "huge-crafting",
    subgroup = "prioritization",
    order = "nullius-bb",
    energy_required = 1,
    ingredients = {
      {"nullius-surge-electrolyzer-1", 1},
      {"copper-cable", 1}
    },
    result = "nullius-priority-electrolyzer-1"
  },
  {
    type = "recipe",
    name = "nullius-electrolyzer-reprioritization-2",
    localised_name = {"recipe-name.nullius-reprioritization",
        {"entity-name.nullius-surge-electrolyzer-2"}},
    icons = {
      data.raw.item["nullius-surge-electrolyzer-2"].icons[1],
      {
        icon = ICONPATH .. "up.png",
        icon_size = 64,
        scale = 0.3,
        shift = {8, -6}
      }
    },
    enabled = false,
    always_show_made_in = true,
    no_productivity = true,
    allow_decomposition = false,
    allow_as_intermediate = false,
    always_show_products = true,
    category = "huge-crafting",
    subgroup = "prioritization",
    order = "nullius-bc",
    energy_required = 1,
    ingredients = {
      {"nullius-surge-electrolyzer-2", 1},
      {"copper-cable", 1}
    },
    result = "nullius-priority-electrolyzer-2"
  },
  {
    type = "recipe",
    name = "nullius-electrolyzer-reprioritization-3",
    localised_name = {"recipe-name.nullius-reprioritization",
        {"entity-name.nullius-surge-electrolyzer-3"}},
    icons = {
      data.raw.item["nullius-surge-electrolyzer-3"].icons[1],
      {
        icon = ICONPATH .. "up.png",
        icon_size = 64,
        scale = 0.3,
        shift = {8, -6}
      }
    },
    enabled = false,
    always_show_made_in = true,
    no_productivity = true,
    allow_decomposition = false,
    allow_as_intermediate = false,
    always_show_products = true,
    category = "huge-crafting",
    subgroup = "prioritization",
    order = "nullius-bd",
    energy_required = 1,
    ingredients = {
      {"nullius-surge-electrolyzer-3", 1},
      {"copper-cable", 1}
    },
    result = "nullius-priority-electrolyzer-3"
  },

   {
    type = "recipe",
    name = "nullius-medium-tank-1",
    enabled = false,
    category = "large-crafting",
    always_show_made_in = true,
    energy_required = 6,
    ingredients = {
      {"nullius-iron-sheet", 2},
      {"nullius-iron-rod", 1},
      {"nullius-pipe-1", 3}
    },
    result = "nullius-medium-tank-1"
  },
  {
    type = "recipe",
    name = "nullius-boxed-medium-tank-1",
    enabled = false,
    category = "huge-assembly",
    subgroup = "boxed-tank",
    always_show_made_in = true,
    energy_required = 30,
    ingredients = {
      {"nullius-box-iron-sheet", 2},
      {"nullius-box-iron-rod", 1},
      {"nullius-box-pipe-1", 3}
    },
    result = "nullius-box-medium-tank-1"
  },

   {
    type = "recipe",
    name = "nullius-medium-tank-2",
    enabled = false,
    category = "large-crafting",
    always_show_made_in = true,
    energy_required = 8,
    ingredients = {
      {"nullius-medium-tank-1", 1},
      {"nullius-steel-sheet", 5},
      {"nullius-steel-rod", 2},
      {"nullius-plastic", 3},
      {"nullius-pipe-2", 6}
    },
    result = "nullius-medium-tank-2"
  },
  {
    type = "recipe",
    name = "nullius-boxed-medium-tank-2",
    enabled = false,
    category = "huge-assembly",
    subgroup = "boxed-tank",
    always_show_made_in = true,
    energy_required = 40,
    ingredients = {
      {"nullius-box-medium-tank-1", 1},
      {"nullius-box-steel-sheet", 5},
      {"nullius-box-steel-rod", 2},
      {"nullius-box-plastic", 3},
      {"nullius-box-pipe-2", 6}
    },
    result = "nullius-box-medium-tank-2"
  },

   {
    type = "recipe",
    name = "nullius-medium-tank-3",
    enabled = false,
    category = "large-crafting",
    always_show_made_in = true,
    energy_required = 12,
    ingredients = {
      {type="item", name="nullius-medium-tank-2", amount=1},
      {type="item", name="nullius-fiberglass", amount=4},
      {type="item", name="nullius-pipe-3", amount=3},
      {type="fluid", name="nullius-epoxy", amount=2, fluidbox_index=1}
    },
    result = "nullius-medium-tank-3"
  },
  {
    type = "recipe",
    name = "nullius-boxed-medium-tank-3",
    enabled = false,
    category = "huge-assembly",
    subgroup = "boxed-tank",
    always_show_made_in = true,
    energy_required = 60,
    ingredients = {
      {type="item", name="nullius-box-medium-tank-2", amount=1},
      {type="item", name="nullius-box-fiberglass", amount=8},
      {type="item", name="nullius-box-pipe-3", amount=6},
      {type="fluid", name="nullius-epoxy", amount=10, fluidbox_index=1}
    },
    result = "nullius-box-medium-tank-3"
  },

  {
    type = "recipe",
    name = "nullius-small-tank-1",
    enabled = false,
    always_show_made_in = true,
    show_amount_in_title = false,
    always_show_products = true,
    category = "medium-crafting",
    energy_required = 4,
    ingredients = {
      {"nullius-medium-tank-2", 1}
    },
    result = "nullius-small-tank-1",
    result_count = 2
  },
  {
    type = "recipe",
    name = "nullius-boxed-small-tank-1",
    enabled = false,
    always_show_made_in = true,
    show_amount_in_title = false,
    always_show_products = true,
    category = "large-assembly",
    subgroup = "boxed-tank",
    energy_required = 20,
    ingredients = {
      {"nullius-box-medium-tank-2", 1}
    },
    result = "nullius-box-small-tank-1",
    result_count = 2
  },

  {
    type = "recipe",
    name = "nullius-small-tank-2",
    enabled = false,
    always_show_made_in = true,
    show_amount_in_title = false,
    always_show_products = true,
    category = "medium-crafting",
    energy_required = 5,
    ingredients = {
      {"nullius-small-tank-1", 2},
      {"nullius-medium-tank-3", 1}
    },
    result = "nullius-small-tank-2",
    result_count = 3
  },
  {
    type = "recipe",
    name = "nullius-boxed-small-tank-2",
    enabled = false,
    always_show_made_in = true,
    show_amount_in_title = false,
    always_show_products = true,
    category = "large-assembly",
    subgroup = "boxed-tank",
    energy_required = 25,
    ingredients = {
      {"nullius-box-small-tank-1", 2},
      {"nullius-box-medium-tank-3", 1}
    },
    result = "nullius-box-small-tank-2",
    result_count = 3
  },

   {
    type = "recipe",
    name = "nullius-large-tank-1",
    enabled = false,
    always_show_made_in = true,
    category = "large-crafting",
    energy_required = 12,
    ingredients = {
      {type="item", name="nullius-medium-tank-2", amount=4},
      {type="item", name="nullius-steel-cable", amount=8},
      {type="item", name="concrete", amount=20},
      {type="item", name="nullius-relief-valve", amount=2}
    },
    result = "nullius-large-tank-1"
  },

  {
    type = "recipe",
    name = "nullius-large-tank-2",
    enabled = false,
    category = "large-crafting",
    always_show_made_in = true,
    energy_required = 15,
    ingredients = {
      {type="item", name="nullius-medium-tank-3", amount=3},
      {type="item", name="nullius-large-tank-1", amount=1},
      {type="item", name="nullius-steel-beam", amount=12},
      {type="item", name="refined-concrete", amount=20}
    },
    result = "nullius-large-tank-2"
  },

  {
    type = "recipe",
    name = "nullius-large-tank-3",
    enabled = false,
    category = "large-crafting",
    always_show_made_in = true,
    energy_required = 20,
    ingredients = {
      {type="item", name="nullius-large-tank-2", amount=2},
      {type="item", name="nullius-box-wall", amount=3},
      {type="item", name="nullius-box-underground-pipe-4", amount=2}
    },
    result = "nullius-large-tank-3"
  },

  {
    type = "recipe",
    name = "nullius-well-1",
    enabled = false,
    category = "medium-crafting",
    always_show_made_in = true,
    energy_required = 8,
    ingredients = {
      {"nullius-underground-pipe-2", 4},
      {"nullius-filter-1", 3},
      {"nullius-pump-2", 1},
      {"nullius-top-up-valve", 1},
      {"stone-brick", 12}
    },
    result = "nullius-well-1"
  },
  {
    type = "recipe",
    name = "nullius-well-2",
    enabled = false,
    always_show_made_in = true,
    category = "medium-crafting",
    energy_required = 12,
    ingredients = {
      {"nullius-well-1", 2},
      {"nullius-box-underground-pipe-4", 1},
      {"nullius-filter-2", 2},
      {"nullius-pump-3", 2},
      {"nullius-mortar", 8}
    },
    result = "nullius-well-2"
  },

  {
    type = "recipe",
    name = "nullius-extractor-1",
    enabled = false,
    category = "huge-crafting",
    always_show_made_in = true,
    energy_required = 20,
    ingredients = {
      {"nullius-well-1", 3},
      {"nullius-steel-sheet", 8},
      {"nullius-refractory-brick", 40},
      {"nullius-relief-valve", 1}
    },
    result = "nullius-extractor-1"
  },
  {
    type = "recipe",
    name = "nullius-extractor-2",
    enabled = false,
    always_show_made_in = true,
    category = "huge-crafting",
    energy_required = 30,
    ingredients = {
      {"nullius-extractor-1", 2},
      {"nullius-well-2", 2},
      {"nullius-box-heat-pipe-2", 3},
      {"nullius-barrel-pump-2", 1},
      {"nullius-medium-miner-3", 1},
      {"nullius-sensor-2", 1}
    },
    result = "nullius-extractor-2"
  },

   {
    type = "recipe",
    name = "nullius-priority-compressor-1",
    enabled = false,
    always_show_made_in = true,
    category = "huge-crafting",
    energy_required = 10,
    ingredients = {
      {"nullius-pump-2", 4},
      {"nullius-medium-tank-2", 2},
      {"nullius-top-up-valve", 2},
      {"red-wire", 1}
    },
    result = "nullius-priority-compressor-1"
  },
  {
    type = "recipe",
    name = "nullius-surge-compressor-1",
    enabled = false,
    always_show_made_in = true,
    no_productivity = true,
    category = "huge-crafting",
    energy_required = 4,
    ingredients = {
      {"nullius-priority-compressor-1", 1},
      {"power-switch", 1}
    },
    result = "nullius-surge-compressor-1"
  },

  {
    type = "recipe",
    name = "nullius-priority-compressor-2",
    enabled = false,
    always_show_made_in = true,
    category = "huge-crafting",
    energy_required = 15,
    ingredients = {
      {"nullius-priority-compressor-1", 1},
      {"nullius-surge-compressor-1", 1},
      {"nullius-air-filter-2", 1},
      {"nullius-large-tank-2", 1},
      {"nullius-relief-valve", 5}
    },
    result = "nullius-priority-compressor-2"
  },
  {
    type = "recipe",
    name = "nullius-surge-compressor-2",
    enabled = false,
    always_show_made_in = true,
    no_productivity = true,
    category = "huge-crafting",
    energy_required = 6,
    ingredients = {
      {"nullius-priority-compressor-2", 1},
      {"nullius-sensor-1", 1}
    },
    result = "nullius-surge-compressor-2"
  },

   {
    type = "recipe",
    name = "nullius-priority-compressor-3",
    enabled = false,
    always_show_made_in = true,
    category = "huge-crafting",
    energy_required = 20,
    ingredients = {
      {"nullius-surge-compressor-2", 1},
      {"nullius-priority-compressor-2", 1},
      {"nullius-air-filter-3", 1},
      {"nullius-large-tank-3", 1},
      {"nullius-standard-turbine-3", 1},
      {"nullius-box-pump-3", 1},
      {"nullius-pylon-2", 1}
    },
    result = "nullius-priority-compressor-3"
  },
  {
    type = "recipe",
    name = "nullius-surge-compressor-3",
    enabled = false,
    always_show_made_in = true,
    no_productivity = true,
    category = "huge-crafting",
    energy_required = 8,
    ingredients = {
      {"nullius-priority-compressor-3", 1},
      {"nullius-sensor-2", 1}
    },
    result = "nullius-surge-compressor-3"
  },

  {
    type = "recipe",
    name = "nullius-compressor-reprioritization-1",
    localised_name = {"recipe-name.nullius-reprioritization",
        {"entity-name.nullius-surge-compressor-1"}},
    icons = {
      data.raw.item["nullius-surge-compressor-1"].icons[1],
      {
        icon = ICONPATH .. "up.png",
        icon_size = 64,
        scale = 0.3,
        shift = {8, -6}
      }
    },
    enabled = false,
    always_show_made_in = true,
    no_productivity = true,
    allow_decomposition = false,
    allow_as_intermediate = false,
    always_show_products = true,
    category = "huge-crafting",
    subgroup = "prioritization",
    order = "nullius-cb",
    energy_required = 1,
    ingredients = {
      {"nullius-surge-compressor-1", 1},
      {"copper-cable", 1}
    },
    result = "nullius-priority-compressor-1"
  },
  {
    type = "recipe",
    name = "nullius-compressor-reprioritization-2",
    localised_name = {"recipe-name.nullius-reprioritization",
        {"entity-name.nullius-surge-compressor-2"}},
    icons = {
      data.raw.item["nullius-surge-compressor-2"].icons[1],
      {
        icon = ICONPATH .. "up.png",
        icon_size = 64,
        scale = 0.3,
        shift = {8, -6}
      }
    },
    enabled = false,
    always_show_made_in = true,
    no_productivity = true,
    allow_decomposition = false,
    allow_as_intermediate = false,
    always_show_products = true,
    category = "huge-crafting",
    subgroup = "prioritization",
    order = "nullius-cc",
    energy_required = 1,
    ingredients = {
      {"nullius-surge-compressor-2", 1},
      {"copper-cable", 1}
    },
    result = "nullius-priority-compressor-2"
  },
  {
    type = "recipe",
    name = "nullius-compressor-reprioritization-3",
    localised_name = {"recipe-name.nullius-reprioritization",
        {"entity-name.nullius-surge-compressor-3"}},
    icons = {
      data.raw.item["nullius-surge-compressor-3"].icons[1],
      {
        icon = ICONPATH .. "up.png",
        icon_size = 64,
        scale = 0.3,
        shift = {8, -6}
      }
    },
    enabled = false,
    always_show_made_in = true,
    no_productivity = true,
    allow_decomposition = false,
    allow_as_intermediate = false,
    always_show_products = true,
    category = "huge-crafting",
    subgroup = "prioritization",
    order = "nullius-cd",
    energy_required = 1,
    ingredients = {
      {"nullius-surge-compressor-3", 1},
      {"copper-cable", 1}
    },
    result = "nullius-priority-compressor-3"
  },

  {
    type = "recipe",
    name = "nullius-geothermal-plant-1",
    enabled = false,
    category = "huge-crafting",
    always_show_made_in = true,
    energy_required = 10,
    ingredients = {
      {"nullius-extractor-1", 3},
      {"nullius-heat-pipe-1", 30},
      {"nullius-aluminum-plate", 20},
      {"nullius-aluminum-rod", 10}
    },
    result = "nullius-geothermal-plant-1"
  },

  {
    type = "recipe",
    name = "nullius-geothermal-plant-2",
    enabled = false,
    category = "huge-crafting",
    always_show_made_in = true,
    energy_required = 10,
    ingredients = {
      {"nullius-geothermal-plant-1", 2},
      {"nullius-thermal-tank-1", 2},
      {"nullius-heat-pipe-2", 25},
      {"stone-wall", 20},
      {"gate", 5}
    },
    result = "nullius-geothermal-plant-2"
  },

  {
    type = "recipe",
    name = "nullius-geothermal-plant-3",
    enabled = false,
    always_show_made_in = true,
    category = "huge-crafting",
    energy_required = 15,
    ingredients = {
      {"nullius-geothermal-plant-2", 2},
      {"nullius-extractor-2", 3},
      {"nullius-thermal-tank-2", 3},
      {"nullius-stirling-engine-3", 2},
      {"nullius-large-miner-2", 1},
      {"nullius-efficiency-module-2", 2}
    },
    result = "nullius-geothermal-plant-3"
  },

  {
    type = "recipe",
    name = "nullius-heat-pipe-1",
    enabled = false,
    show_amount_in_title = false,
    always_show_products = true,
    category = "small-fluid-assembly",
    energy_required = 1,
    ingredients = {
      {type="item", name="nullius-pipe-2", amount=2},
      {type="item", name="nullius-aluminum-sheet", amount=2},
      {type="fluid", name="nullius-water", amount=100, fluidbox_index=1}
    },
    result = "nullius-heat-pipe-1"
  },
  {
    type = "recipe",
    name = "nullius-boxed-heat-pipe-1",
    enabled = false,
    show_amount_in_title = false,
    always_show_products = true,
    category = "large-fluid-assembly",
    subgroup = "boxed-heat-energy",
    energy_required = 5,
    ingredients = {
      {type="item", name="nullius-box-pipe-2", amount=2},
      {type="item", name="nullius-box-aluminum-sheet", amount=2},
      {type="fluid", name="nullius-water", amount=500, fluidbox_index=1}
    },
    result = "nullius-box-heat-pipe-1"
  },

  {
    type = "recipe",
    name = "nullius-heat-pipe-2",
	order = "nullius-bcb",
    enabled = false,
    show_amount_in_title = false,
    always_show_products = true,
    category = "machine-casting",
    energy_required = 3,
    ingredients = {
      {type="item", name="nullius-heat-pipe-1", amount=1},
      {type="item", name="nullius-pipe-3", amount=2},
      {type="item", name="nullius-ceramic-powder", amount=2},
      {type="item", name="nullius-insulation", amount=1},
      {type="item", name="nullius-eutectic-salt", amount=4}
    },
    result = "nullius-heat-pipe-2"
  },
  {
    type = "recipe",
    name = "nullius-boxed-heat-pipe-2",
	order = "nullius-ccb",
    enabled = false,
    show_amount_in_title = false,
    always_show_products = true,
    category = "machine-casting",
    subgroup = "boxed-heat-energy",
    energy_required = 15,
    ingredients = {
      {type="item", name="nullius-box-heat-pipe-1", amount=1},
      {type="item", name="nullius-box-pipe-3", amount=2},
      {type="item", name="nullius-box-ceramic-powder", amount=2},
      {type="item", name="nullius-box-insulation", amount=1},
      {type="item", name="nullius-box-eutectic-salt", amount=4}
    },
    result = "nullius-box-heat-pipe-2"
  },
  {
    type = "recipe",
    name = "nullius-copper-heat-pipe",
	localised_name = {"recipe-name.nullius-copper",
	    {"entity-name.nullius-heat-pipe-2"}},
    icons = {{
      icon = "__nullius__/graphics/icons/copper-heat-pipe.png",
	  icon_size = 64
    }},
	order = "nullius-bcc",
    enabled = false,
	show_amount_in_title = false,
	always_show_products = true,
    category = "machine-casting",
    energy_required = 2,
    ingredients = {
      {type="item", name="nullius-copper-sheet", amount=1},
      {type="item", name="nullius-pipe-3", amount=1},
      {type="item", name="nullius-ceramic-powder", amount=1},
      {type="item", name="nullius-insulation", amount=1},
      {type="item", name="nullius-eutectic-salt", amount=3}
    },
    result = "nullius-heat-pipe-2"
  },
  {
    type = "recipe",
    name = "nullius-boxed-copper-heat-pipe",
	localised_name = {"recipe-name.nullius-copper",
	    {"item-name.nullius-box", {"entity-name.nullius-heat-pipe-2"}}},
    icons = {
      {
	    icon = "__nullius__/graphics/icons/crate.png",
        icon_size = 64
	  },
      {
		icon = "__nullius__/graphics/icons/copper-heat-pipe.png",
		icon_size = 64,
		scale = 0.45
      }
    },
	subgroup = "boxed-heat-energy",
	order = "nullius-ccc",
    enabled = false,
	show_amount_in_title = false,
	always_show_products = true,
    category = "machine-casting",
    energy_required = 10,
    ingredients = {
      {type="item", name="nullius-box-copper-sheet", amount=1},
      {type="item", name="nullius-box-pipe-3", amount=1},
      {type="item", name="nullius-box-ceramic-powder", amount=1},
      {type="item", name="nullius-box-insulation", amount=1},
      {type="item", name="nullius-box-eutectic-salt", amount=3}
    },
    result = "nullius-box-heat-pipe-2"
  },

  {
    type = "recipe",
    name = "nullius-boxed-heat-pipe-3",
    enabled = false,
    show_amount_in_title = false,
    always_show_products = true,
    category = "machine-casting",
    subgroup = "boxed-heat-energy",
    energy_required = 60,
    ingredients = {
      {type="item", name="nullius-box-heat-pipe-2", amount=5},
      {type="item", name="nullius-box-pipe-4", amount=4},
      {type="item", name="nullius-box-small-pump-2", amount=1},
      {type="fluid", name="nullius-compressed-helium", amount=250}
    },
    result = "nullius-box-heat-pipe-3",
    result_count = 4
  },

  {
    type = "recipe",
    name = "nullius-thermal-tank-1",
    enabled = false,
    category = "large-crafting",
    energy_required = 6,
    ingredients = {
      {type="item", name="nullius-heat-pipe-2", amount=4},
      {type="item", name="nullius-box-eutectic-salt", amount=3},
      {type="item", name="nullius-medium-tank-3", amount=1},
      {type="item", name="nullius-insulation", amount=8},
      {type="item", name="nullius-crucible", amount=4},
      {type="item", name="nullius-transformer", amount=1}
    },
    result = "nullius-thermal-tank-1"
  },
  {
    type = "recipe",
    name = "nullius-thermal-tank-2",
    enabled = false,
    category = "large-crafting",
    energy_required = 10,
    ingredients = {
      {type="item", name="nullius-thermal-tank-1", amount=3},
      {type="item", name="nullius-box-heat-pipe-3", amount=2},
      {type="item", name="nullius-large-tank-3", amount=1},
      {type="item", name="nullius-barrel-pump-2", amount=1}
    },
    result = "nullius-thermal-tank-2"
  },

   {
    type = "recipe",
    name = "nullius-stirling-engine-1",
    enabled = false,
    show_amount_in_title = false,
    always_show_products = true,
    category = "large-fluid-assembly",
    energy_required = 15,
    ingredients = {
      {type="item", name="nullius-surge-compressor-1", amount=1},
      {type="item", name="nullius-standard-turbine-2", amount=2},
      {type="item", name="nullius-heat-pipe-1", amount=8},
      {type="fluid", name="nullius-compressed-nitrogen", amount=600},
      {type="fluid", name="nullius-lubricant", amount=30}
    },
    result = "nullius-stirling-engine-1",
    result_count = 2
  },
  {
    type = "recipe",
    name = "nullius-stirling-engine-2",
    enabled = false,
    show_amount_in_title = false,
    always_show_products = true,
    category = "large-fluid-assembly",
    energy_required = 20,
    ingredients = {
      {type="item", name="nullius-stirling-engine-1", amount=3},
      {type="item", name="nullius-surge-compressor-2", amount=1},
      {type="item", name="nullius-thermal-tank-1", amount=2},
      {type="item", name="nullius-transformer", amount=3},
      {type="fluid", name="nullius-compressed-argon", amount=500, fluidbox_index=1}
    },
    result = "nullius-stirling-engine-2",
    result_count = 2
  },
  {
    type = "recipe",
    name = "nullius-stirling-engine-3",
    enabled = false,
    show_amount_in_title = false,
    always_show_products = true,
    category = "large-fluid-assembly",
    energy_required = 30,
    ingredients = {
      {type="item", name="nullius-stirling-engine-2", amount=3},
      {type="item", name="nullius-surge-compressor-3", amount=1},
      {type="item", name="nullius-thermal-tank-2", amount=2},
      {type="item", name="nullius-standard-turbine-3", amount=4},
      {type="item", name="nullius-grid-battery-2", amount=3},
      {type="fluid", name="nullius-compressed-helium", amount=300, fluidbox_index=1}
    },
    result = "nullius-stirling-engine-3",
    result_count = 2
  },

  {
    type = "recipe",
    name = "nullius-barrel-pump-1",
    enabled = false,
    category = "medium-crafting",
    always_show_made_in = true,
    energy_required = 4,
    ingredients = {
      {"nullius-pump-1", 2},
      {"inserter", 1},
      {"nullius-iron-sheet", 3},
      {"nullius-pipe-2", 5},
      {"nullius-top-up-valve", 2}
    },
    result = "nullius-barrel-pump-1"
  },

  {
    type = "recipe",
    name = "nullius-heat-exchanger-1",
    enabled = false,
    always_show_made_in = true,
    category = "medium-crafting",
    energy_required = 3,
    ingredients = {
      {"nullius-combustion-chamber-1", 1},
      {"nullius-heat-pipe-1", 4}
    },
    result = "nullius-heat-exchanger-1"
  },
  {
    type = "recipe",
    name = "nullius-mirror-heat-exchanger-1",
    enabled = false,
    always_show_made_in = true,
    no_productivity = true,
    category = "medium-crafting",
    energy_required = 1,
    ingredients = {
      {"nullius-heat-exchanger-1", 1},
      {"nullius-pipe-2", 2}
    },
    result = "nullius-mirror-heat-exchanger-1"
  },
  {
    type = "recipe",
    name = "nullius-unmirror-heat-exchanger-1",
    localised_name = {"recipe-name.nullius-unmirrored",
        {"", {"entity-name.heat-exchanger"}, " ", 1}},
    icons = {
      {
        icon = ENTICONPATH .. "exchanger1.png",
        icon_size = 64
      },
      {
        icon = ICONPATH .. "flip2.png",
        icon_size = 64
      }
    },
    enabled = false,
    always_show_made_in = true,
    no_productivity = true,
    allow_decomposition = false,
    allow_as_intermediate = false,
    always_show_products = true,
    category = "medium-crafting",
    subgroup = "unmirror-2",
    order = "nullius-fb",
    energy_required = 0.5,
    ingredients = {
      {"nullius-mirror-heat-exchanger-1", 1},
      {"nullius-pipe-2", 1}
    },
    result = "nullius-heat-exchanger-1"
  },

   {
    type = "recipe",
    name = "nullius-heat-exchanger-2",
    enabled = false,
    always_show_made_in = true,
    category = "medium-crafting",
    energy_required = 5,
    ingredients = {
      {"nullius-heat-exchanger-1", 1},
      {"nullius-combustion-chamber-3", 1},
      {"nullius-heat-pipe-2", 8}
    },
    result = "nullius-heat-exchanger-2"
  },
  {
    type = "recipe",
    name = "nullius-mirror-heat-exchanger-2",
    enabled = false,
    always_show_made_in = true,
    no_productivity = true,
    category = "medium-crafting",
    energy_required = 1,
    ingredients = {
      {"nullius-heat-exchanger-2", 1},
      {"nullius-pipe-3", 2}
    },
    result = "nullius-mirror-heat-exchanger-2"
  },
  {
    type = "recipe",
    name = "nullius-unmirror-heat-exchanger-2",
    localised_name = {"recipe-name.nullius-unmirrored",
        {"", {"entity-name.heat-exchanger"}, " ", 2}},
    icons = {
      {
        icon = ENTICONPATH .. "exchanger2.png",
        icon_size = 64
      },
      {
        icon = ICONPATH .. "flip2.png",
        icon_size = 64
      }
    },
    enabled = false,
    always_show_made_in = true,
    no_productivity = true,
    allow_decomposition = false,
    allow_as_intermediate = false,
    always_show_products = true,
    category = "medium-crafting",
    subgroup = "unmirror-2",
    order = "nullius-fc",
    energy_required = 0.5,
    ingredients = {
      {"nullius-mirror-heat-exchanger-2", 1},
      {"nullius-pipe-3", 1}
    },
    result = "nullius-heat-exchanger-2"
  },

  {
    type = "recipe",
    name = "nullius-boiler",
    enabled = false,
    always_show_made_in = true,
    category = "medium-crafting",
    energy_required = 5,
    ingredients = {
      {"nullius-heat-exchanger-1", 1},
      {"nullius-medium-furnace-2", 1},
      {"nullius-ceramic-powder", 5},
      {"nullius-transformer", 1}
    },
    result = "nullius-boiler"
  },
  {
    type = "recipe",
    name = "nullius-mirror-boiler",
    enabled = false,
    always_show_made_in = true,
    no_productivity = true,
    category = "medium-crafting",
    energy_required = 1,
    ingredients = {
      {"nullius-boiler", 1},
      {"nullius-pipe-2", 2}
    },
    result = "nullius-mirror-boiler"
  },
  {
    type = "recipe",
    name = "nullius-unmirror-boiler",
    localised_name = {"recipe-name.nullius-unmirrored", {"entity-name.boiler"}},
    icons = {
      {
        icon = ENTICONPATH .. "boiler-blue.png",
        icon_size = 64
      },
      {
        icon = ICONPATH .. "flip2.png",
        icon_size = 64
      }
    },
    enabled = false,
    always_show_made_in = true,
    no_productivity = true,
    allow_decomposition = false,
    allow_as_intermediate = false,
    always_show_products = true,
    category = "medium-crafting",
    subgroup = "unmirror-2",
    order = "nullius-fd",
    energy_required = 0.5,
    ingredients = {
      {"nullius-mirror-boiler", 1},
      {"nullius-pipe-2", 1}
    },
    result = "nullius-boiler"
  },

   {
    type = "recipe",
    name = "nullius-nanofabricator-1",
    enabled = false,
    always_show_made_in = true,
    show_amount_in_title = false,
    always_show_products = true,
    category = "huge-crafting",
    energy_required = 30,
    ingredients = {
      {"nullius-chemical-plant-2", 1},
      {"nullius-surge-electrolyzer-2", 1},
      {"nullius-foundry-2", 1},
      {"nullius-flotation-cell-2", 1},
      {"nullius-air-filter-2", 1}
    },
    result = "nullius-nanofabricator-1",
    result_count = 2
  },
  {
    type = "recipe",
    name = "nullius-nanofabricator-2",
    enabled = false,
    always_show_made_in = true,
    show_amount_in_title = false,
    always_show_products = true,
    category = "huge-crafting",
    energy_required = 45,
    ingredients = {
      {"nullius-nanofabricator-1", 2},
      {"nullius-mirror-chemical-plant-3", 1},
      {"nullius-priority-electrolyzer-3", 1},
      {"nullius-large-furnace-2", 1},
      {"nullius-large-assembler-2", 1},
      {"nullius-large-dispatch-chest-2", 2}
    },
    result = "nullius-nanofabricator-2",
    result_count = 2
  },
  {
    type = "recipe",
    name = "nullius-mirror-nanofabricator-2",
    enabled = false,
    always_show_made_in = true,
    no_productivity = true,
    category = "huge-crafting",
    energy_required = 2,
    ingredients = {
      {"nullius-nanofabricator-2", 1},
      {"nullius-pipe-4", 5}
    },
    result = "nullius-mirror-nanofabricator-2"
  },
  {
    type = "recipe",
    name = "nullius-unmirror-nanofabricator-2",
    localised_name = {"recipe-name.nullius-unmirror-nanofabricator-2"},
    icons = {
      {
        icon = "__angelsrefining__/graphics/icons/crystallizer.png",
        icon_size = 32
      },
      {
        icon = ICONPATH .. "flip2.png",
        icon_size = 64
      }
    },
    enabled = false,
    category = "huge-crafting",
    subgroup = "unmirror-2",
    order = "nullius-e",
    always_show_made_in = true,
    no_productivity = true,
    allow_decomposition = false,
    allow_as_intermediate = false,
    always_show_products = true,
    energy_required = 1,
    ingredients = {
      {"nullius-mirror-nanofabricator-2", 1},
      {"nullius-pipe-4", 1}
    },
    result = "nullius-nanofabricator-2"
  },

  {
    type = "recipe",
    name = "nullius-car-1",
    enabled = false,
    category = "large-fluid-assembly",
    energy_required = 8,
    ingredients = {
      {type="item", name="nullius-locomotive-1", amount=1},
      {type="item", name="small-lamp", amount=2},
      {type="item", name="nullius-rubber", amount=4},
      {type="item", name="nullius-iron-wire", amount=4},
      {type="fluid", name="nullius-air", amount=15, fluidbox_index=1}
    },
    result = "nullius-car-1"
  },
  {
    type = "recipe",
    name = "nullius-car-2",
    enabled = false,
    always_show_made_in = true,
    category = "large-crafting",
    energy_required = 12,
    ingredients = {
      {type="item", name="nullius-car-1", amount=1},
      {type="item", name="nullius-locomotive-2", amount=1},
      {type="item", name="nullius-lamp-2", amount=2},
      {type="item", name="nullius-textile", amount=3},
      {type="item", name="nullius-battery-1", amount=4},
      {type="item", name="nullius-gun", amount=2}
    },
    result = "nullius-car-2"
  },
  {
    type = "recipe",
    name = "nullius-car-3",
    enabled = false,
    always_show_made_in = true,
    category = "large-crafting",
    energy_required = 20,
    ingredients = {
      {type="item", name="nullius-car-2", amount=1},
      {type="item", name="nullius-solar-locomotive", amount=1},
      {type="item", name="nullius-missile-launcher", amount=2}
    },
    result = "nullius-car-3"
  },
  {
    type = "recipe",
    name = "nullius-truck-1",
    enabled = false,
    category = "huge-fluid-assembly",
    energy_required = 15,
    ingredients = {
      {type="item", name="nullius-car-2", amount=2},
      {type="item", name="nullius-steel-beam", amount=12},
      {type="item", name="nullius-steel-plate", amount=25},
      {type="item", name="nullius-missile-launcher", amount=3},
      {type="item", name="nullius-rubber", amount=8},
      {type="fluid", name="nullius-compressed-air", amount=40, fluidbox_index=1}
    },
    result = "nullius-truck-1"
  },
  {
    type = "recipe",
    name = "nullius-truck-2",
    enabled = false,
    category = "huge-crafting",
    energy_required = 30,
    ingredients = {
      {type="item", name="nullius-truck-1", amount=1},
      {type="item", name="nullius-locomotive-3", amount=1},
      {type="item", name="nullius-reactor", amount=1}
    },
    result = "nullius-truck-2"
  },

  ------------------------------------------------
  {
    type = "recipe",
    name = "nullius-void-seawater",
    icon = data.raw.fluid["nullius-seawater"].icon,
    icon_size = data.raw.fluid["nullius-seawater"].icon_size,
    crafting_machine_tint = { primary = data.raw.fluid["nullius-seawater"].flow_color },
    category = "nullius-liquid-void",
    subgroup = "nullius-liquid-void",
    hide_from_player_crafting = true,
    energy_required = 1,
    ingredients = {
        {type="fluid", name="nullius-seawater", amount=100}
    },
    results = {
        {type="item", name="nullius-liquid-void", amount=1, probability=0}
    }
  },
  {
    type = "recipe",
    name = "nullius-void-freshwater",
    icon = data.raw.fluid["nullius-freshwater"].icon,
    icon_size = data.raw.fluid["nullius-freshwater"].icon_size,
    crafting_machine_tint = { primary = data.raw.fluid["nullius-freshwater"].flow_color },
    category = "nullius-liquid-void",
    subgroup = "nullius-liquid-void",
    hide_from_player_crafting = true,
    energy_required = 1,
    ingredients = {
        {type="fluid", name="nullius-freshwater", amount=100}
    },
    results = {
        {type="item", name="nullius-liquid-void", amount=1, probability=0}
    }
  },
  {
    type = "recipe",
    name = "nullius-void-wastewater",
    icon = data.raw.fluid["nullius-wastewater"].icon,
    icon_size = data.raw.fluid["nullius-wastewater"].icon_size,
    crafting_machine_tint = { primary = data.raw.fluid["nullius-wastewater"].flow_color },
    category = "nullius-liquid-void",
    subgroup = "nullius-liquid-void",
    hide_from_player_crafting = true,
    energy_required = 1,
    ingredients = {
        {type="fluid", name="nullius-wastewater", amount=100}
    },
    results = {
        {type="item", name="nullius-liquid-void", amount=1, probability=0}
    }
  },
  {
    type = "recipe",
    name = "nullius-void-brine",
    icon = data.raw.fluid["nullius-brine"].icon,
    icon_size = data.raw.fluid["nullius-brine"].icon_size,
    crafting_machine_tint = { primary = data.raw.fluid["nullius-brine"].flow_color },
    category = "nullius-liquid-void",
    subgroup = "nullius-liquid-void",
    hide_from_player_crafting = true,
    energy_required = 1,
    ingredients = {
        {type="fluid", name="nullius-brine", amount=100}
    },
    results = {
        {type="item", name="nullius-liquid-void", amount=1, probability=0}
    }
  },
  {
    type = "recipe",
    name = "nullius-void-caustic-solution",
    icons = data.raw.fluid["nullius-caustic-solution"].icons,
    crafting_machine_tint = { primary = data.raw.fluid["nullius-caustic-solution"].flow_color },
    category = "nullius-liquid-void",
    subgroup = "nullius-liquid-void",
    hide_from_player_crafting = true,
    energy_required = 1,
    ingredients = {
        {type="fluid", name="nullius-caustic-solution", amount=100}
    },
    results = {
        {type="item", name="nullius-liquid-void", amount=1, probability=0}
    }
  },
  {
    type = "recipe",
    name = "nullius-void-calcium-chloride-solution",
    icons = data.raw.fluid["nullius-calcium-chloride-solution"].icons,
    crafting_machine_tint = { primary = data.raw.fluid["nullius-calcium-chloride-solution"].flow_color },
    category = "nullius-liquid-void",
    subgroup = "nullius-liquid-void",
    hide_from_player_crafting = true,
    energy_required = 1,
    ingredients = {
        {type="fluid", name="nullius-calcium-chloride-solution", amount=100}
    },
    results = {
        {type="item", name="nullius-liquid-void", amount=1, probability=0}
    }
  },
  {
    type = "recipe",
    name = "nullius-void-water-saline",
    icon = data.raw.fluid["nullius-saline"].icon,
    icon_size = data.raw.fluid["nullius-saline"].icon_size,
    crafting_machine_tint = { primary = data.raw.fluid["water-saline"].flow_color },
    category = "nullius-liquid-void",
    subgroup = "nullius-liquid-void",
    hide_from_player_crafting = true,
    energy_required = 1,
    ingredients = {
        {type="fluid", name="nullius-saline", amount=100}
    },
    results = {
        {type="item", name="nullius-liquid-void", amount=1, probability=0}
    }
  },
  {
    type = "recipe",
    name = "nullius-void-water",
    icon = data.raw.fluid["nullius-water"].icon,
    icon_size = data.raw.fluid["nullius-water"].icon_size,
    crafting_machine_tint = { primary = data.raw.fluid["nullius-water"].flow_color },
    category = "nullius-liquid-void",
    subgroup = "nullius-liquid-void",
    hide_from_player_crafting = true,
    energy_required = 1,
    ingredients = {
        {type="fluid", name="nullius-water", amount=100}
    },
    results = {
        {type="item", name="nullius-liquid-void", amount=1, probability=0}
    }
  },
  {
    type = "recipe",
    name = "nullius-void-heavy-water",
    icons = data.raw.fluid["nullius-heavy-water"].icons,
    crafting_machine_tint = { primary = data.raw.fluid["nullius-heavy-water"].flow_color },
    category = "nullius-liquid-void",
    subgroup = "nullius-liquid-void",
    hide_from_player_crafting = true,
    energy_required = 1,
    ingredients = {
        {type="fluid", name="nullius-heavy-water", amount=100}
    },
    results = {
        {type="item", name="nullius-liquid-void", amount=1, probability=0}
    }
  },
  {
    type = "recipe",
    name = "nullius-void-methanol",
    icons = data.raw.fluid["nullius-methanol"].icons,
    crafting_machine_tint = { primary = data.raw.fluid["nullius-methanol"].flow_color },
    category = "nullius-liquid-void",
    subgroup = "nullius-liquid-void",
    hide_from_player_crafting = true,
    energy_required = 1,
    ingredients = {
        {type="fluid", name="nullius-methanol", amount=100}
    },
    results = {
        {type="item", name="nullius-liquid-void", amount=1, probability=0}
    }
  },
  {
    type = "recipe",
    name = "nullius-void-amino-acids",
    icons = data.raw.fluid["nullius-amino-acids"].icons,
    crafting_machine_tint = { primary = data.raw.fluid["nullius-amino-acids"].flow_color },
    category = "nullius-liquid-void",
    subgroup = "nullius-liquid-void",
    hide_from_player_crafting = true,
    energy_required = 1,
    ingredients = {
        {type="fluid", name="nullius-amino-acids", amount=100}
    },
    results = {
        {type="item", name="nullius-liquid-void", amount=1, probability=0}
    }
  },
  {
    type = "recipe",
    name = "nullius-void-nucleotides",
    icon = data.raw.fluid["nullius-nucleotides"].icon,
    icon_size = data.raw.fluid["nullius-nucleotides"].icon_size,
    crafting_machine_tint = { primary = data.raw.fluid["nullius-nucleotides"].flow_color },
    category = "nullius-liquid-void",
    subgroup = "nullius-liquid-void",
    hide_from_player_crafting = true,
    energy_required = 1,
    ingredients = {
        {type="fluid", name="nullius-nucleotides", amount=100}
    },
    results = {
        {type="item", name="nullius-liquid-void", amount=1, probability=0}
    }
  },
  {
    type = "recipe",
    name = "nullius-void-protocell",
    icon = data.raw.fluid["nullius-protocell"].icon,
    icon_size = data.raw.fluid["nullius-protocell"].icon_size,
    crafting_machine_tint = { primary = data.raw.fluid["nullius-protocell"].flow_color },
    category = "nullius-liquid-void",
    subgroup = "nullius-liquid-void",
    hide_from_player_crafting = true,
    energy_required = 1,
    ingredients = {
        {type="fluid", name="nullius-protocell", amount=100}
    },
    results = {
        {type="item", name="nullius-liquid-void", amount=1, probability=0}
    }
  },
  {
    type = "recipe",
    name = "nullius-void-bacteria",
    icon = data.raw.fluid["nullius-bacteria"].icon,
    icon_size = data.raw.fluid["nullius-bacteria"].icon_size,
    crafting_machine_tint = { primary = data.raw.fluid["nullius-bacteria"].flow_color },
    category = "nullius-liquid-void",
    subgroup = "nullius-liquid-void",
    hide_from_player_crafting = true,
    energy_required = 1,
    ingredients = {
        {type="fluid", name="nullius-bacteria", amount=100}
    },
    results = {
        {type="item", name="nullius-liquid-void", amount=1, probability=0}
    }
  },

  {
    type = "recipe",
    name = "nullius-void-air",
    icons = data.raw.fluid["nullius-air"].icons,
    crafting_machine_tint = { primary = data.raw.fluid["nullius-air"].flow_color },
    category = "nullius-gas-void",
    subgroup = "nullius-gas-void",
    hide_from_player_crafting = true,
    energy_required = 1,
    ingredients = {
        {type="fluid", name="nullius-air", amount=100}
    },
    results = {
        {type="item", name="nullius-gas-void", amount=1, probability=0}
    }
  },
  {
    type = "recipe",
    name = "nullius-void-compressed-air",
    icons = data.raw.fluid["nullius-compressed-air"].icons,
    crafting_machine_tint = { primary = data.raw.fluid["nullius-compressed-air"].flow_color },
    category = "nullius-gas-void",
    subgroup = "nullius-gas-void",
    hide_from_player_crafting = true,
    energy_required = 1,
    ingredients = {
        {type="fluid", name="nullius-compressed-air", amount=50}
    },
    results = {
        {type="item", name="nullius-gas-void", amount=1, probability=0}
    }
  },
  {
    type = "recipe",
    name = "nullius-void-nitrogen",
    icons = data.raw.fluid["nullius-nitrogen"].icons,
    crafting_machine_tint = { primary = data.raw.fluid["nullius-nitrogen"].flow_color },
    category = "nullius-gas-void",
    subgroup = "nullius-gas-void",
    hide_from_player_crafting = true,
    energy_required = 1,
    ingredients = {
        {type="fluid", name="nullius-nitrogen", amount=100}
    },
    results = {
        {type="item", name="nullius-gas-void", amount=1, probability=0}
    }
  },
  {
    type = "recipe",
    name = "nullius-void-compressed-nitrogen",
    icons = data.raw.fluid["nullius-compressed-nitrogen"].icons,
    crafting_machine_tint = { primary = data.raw.fluid["nullius-compressed-nitrogen"].flow_color },
    category = "nullius-gas-void",
    subgroup = "nullius-gas-void",
    hide_from_player_crafting = true,
    energy_required = 1,
    ingredients = {
        {type="fluid", name="nullius-compressed-nitrogen", amount=50}
    },
    results = {
        {type="item", name="nullius-gas-void", amount=1, probability=0}
    }
  },
  {
    type = "recipe",
    name = "nullius-void-hydrogen",
    icons = data.raw.fluid["nullius-hydrogen"].icons,
    crafting_machine_tint = { primary = data.raw.fluid["nullius-hydrogen"].flow_color },
    category = "nullius-gas-void",
    subgroup = "nullius-gas-void",
    hide_from_player_crafting = true,
    energy_required = 1,
    ingredients = {
        {type="fluid", name="nullius-hydrogen", amount=100}
    },
    results = {
        {type="item", name="nullius-gas-void", amount=1, probability=0}
    }
  },
  {
    type = "recipe",
    name = "nullius-void-deuterium",
    icons = data.raw.fluid["nullius-deuterium"].icons,
    crafting_machine_tint = { primary = data.raw.fluid["nullius-deuterium"].flow_color },
    category = "nullius-gas-void",
    subgroup = "nullius-gas-void",
    hide_from_player_crafting = true,
    energy_required = 1,
    ingredients = {
        {type="fluid", name="nullius-deuterium", amount=100}
    },
    results = {
        {type="item", name="nullius-gas-void", amount=1, probability=0}
    }
  },
  {
    type = "recipe",
    name = "nullius-void-tritium",
    icons = data.raw.fluid["nullius-tritium"].icons,
    crafting_machine_tint = { primary = data.raw.fluid["nullius-tritium"].flow_color },
    category = "nullius-gas-void",
    subgroup = "nullius-gas-void",
    hide_from_player_crafting = true,
    energy_required = 1,
    ingredients = {
        {type="fluid", name="nullius-tritium", amount=100}
    },
    results = {
        {type="item", name="nullius-gas-void", amount=1, probability=0}
    }
  },
  {
    type = "recipe",
    name = "nullius-void-compressed-hydrogen",
    icons = data.raw.fluid["nullius-compressed-hydrogen"].icons,
    crafting_machine_tint = { primary = data.raw.fluid["nullius-compressed-hydrogen"].flow_color },
    category = "nullius-gas-void",
    subgroup = "nullius-gas-void",
    hide_from_player_crafting = true,
    energy_required = 1,
    ingredients = {
        {type="fluid", name="nullius-compressed-hydrogen", amount=50}
    },
    results = {
        {type="item", name="nullius-gas-void", amount=1, probability=0}
    }
  },
  {
    type = "recipe",
    name = "nullius-void-volcanic",
    icons = data.raw.fluid["nullius-volcanic-gas"].icons,
    crafting_machine_tint = { primary = data.raw.fluid["nullius-volcanic-gas"].flow_color },
    category = "nullius-gas-void",
    subgroup = "nullius-gas-void",
    hide_from_player_crafting = true,
    energy_required = 1,
    ingredients = {
        {type="fluid", name="nullius-volcanic-gas", amount=100}
    },
    results = {
        {type="item", name="nullius-gas-void", amount=1, probability=0}
    }
  },
  {
    type = "recipe",
    name = "nullius-void-argon",
    icons = data.raw.fluid["nullius-argon"].icons,
    crafting_machine_tint = { primary = data.raw.fluid["nullius-argon"].flow_color },
    category = "nullius-gas-void",
    subgroup = "nullius-gas-void",
    hide_from_player_crafting = true,
    energy_required = 1,
    ingredients = {
        {type="fluid", name="nullius-argon", amount=100}
    },
    results = {
        {type="item", name="nullius-gas-void", amount=1, probability=0}
    }
  },
  {
    type = "recipe",
    name = "nullius-void-compressed-argon",
    icons = data.raw.fluid["nullius-compressed-argon"].icons,
    crafting_machine_tint = { primary = data.raw.fluid["nullius-compressed-argon"].flow_color },
    category = "nullius-gas-void",
    subgroup = "nullius-gas-void",
    hide_from_player_crafting = true,
    energy_required = 1,
    ingredients = {
        {type="fluid", name="nullius-compressed-argon", amount=50}
    },
    results = {
        {type="item", name="nullius-gas-void", amount=1, probability=0}
    }
  },
  {
    type = "recipe",
    name = "nullius-void-helium",
    icons = data.raw.fluid["nullius-helium"].icons,
    crafting_machine_tint = { primary = data.raw.fluid["nullius-helium"].flow_color },
    category = "nullius-gas-void",
    subgroup = "nullius-gas-void",
    hide_from_player_crafting = true,
    energy_required = 1,
    ingredients = {
        {type="fluid", name="nullius-helium", amount=100}
    },
    results = {
        {type="item", name="nullius-gas-void", amount=1, probability=0}
    }
  },
  {
    type = "recipe",
    name = "nullius-void-compressed-helium",
    icons = data.raw.fluid["nullius-compressed-helium"].icons,
    crafting_machine_tint = { primary = data.raw.fluid["nullius-compressed-helium"].flow_color },
    category = "nullius-gas-void",
    subgroup = "nullius-gas-void",
    hide_from_player_crafting = true,
    energy_required = 1,
    ingredients = {
        {type="fluid", name="nullius-compressed-helium", amount=50}
    },
    results = {
        {type="item", name="nullius-gas-void", amount=1, probability=0}
    }
  },
  {
    type = "recipe",
    name = "nullius-void-steam",
    icon = data.raw.fluid["nullius-steam"].icon,
    icon_size = data.raw.fluid["nullius-steam"].icon_size,
    crafting_machine_tint = { primary = data.raw.fluid["nullius-steam"].flow_color },
    category = "nullius-gas-void",
    subgroup = "nullius-gas-void",
    hide_from_player_crafting = true,
    energy_required = 1,
    ingredients = {
        {type="fluid", name="nullius-steam", amount=100}
    },
    results = {
        {type="item", name="nullius-gas-void", amount=1, probability=0}
    }
  },
  {
    type = "recipe",
    name = "nullius-void-residual-gas",
    icons = data.raw.fluid["nullius-residual-gas"].icons,
    crafting_machine_tint = { primary = data.raw.fluid["nullius-residual-gas"].flow_color },
    category = "nullius-gas-void",
    subgroup = "nullius-gas-void",
    hide_from_player_crafting = true,
    energy_required = 1,
    ingredients = {
        {type="fluid", name="nullius-residual-gas", amount=100}
    },
    results = {
        {type="item", name="nullius-gas-void", amount=1, probability=0}
    }
  },
  {
    type = "recipe",
    name = "nullius-void-compressed-residual-gas",
    icons = data.raw.fluid["nullius-compressed-residual-gas"].icons,
    crafting_machine_tint = { primary = data.raw.fluid["nullius-compressed-residual-gas"].flow_color },
    category = "nullius-gas-void",
    subgroup = "nullius-gas-void",
    hide_from_player_crafting = true,
    energy_required = 1,
    ingredients = {
        {type="fluid", name="nullius-compressed-residual-gas", amount=50}
    },
    results = {
        {type="item", name="nullius-gas-void", amount=1, probability=0}
    }
  },
  {
    type = "recipe",
    name = "nullius-void-trace-gas",
    icons = data.raw.fluid["nullius-trace-gas"].icons,
    crafting_machine_tint = { primary = data.raw.fluid["nullius-trace-gas"].flow_color },
    category = "nullius-gas-void",
    subgroup = "nullius-gas-void",
    hide_from_player_crafting = true,
    energy_required = 1,
    ingredients = {
        {type="fluid", name="nullius-trace-gas", amount=100}
    },
    results = {
        {type="item", name="nullius-gas-void", amount=1, probability=0}
    }
  },
  {
    type = "recipe",
    name = "nullius-void-compressed-trace-gas",
    icons = data.raw.fluid["nullius-compressed-trace-gas"].icons,
    crafting_machine_tint = { primary = data.raw.fluid["nullius-compressed-trace-gas"].flow_color },
    category = "nullius-gas-void",
    subgroup = "nullius-gas-void",
    hide_from_player_crafting = true,
    energy_required = 1,
    ingredients = {
        {type="fluid", name="nullius-compressed-trace-gas", amount=50}
    },
    results = {
        {type="item", name="nullius-gas-void", amount=1, probability=0}
    }
  },
  {
    type = "recipe",
    name = "nullius-void-oxygen",
    icons = data.raw.fluid["nullius-oxygen"].icons,
    crafting_machine_tint = { primary = data.raw.fluid["nullius-oxygen"].flow_color },
    category = "nullius-gas-void",
    subgroup = "nullius-gas-void",
    hide_from_player_crafting = true,
    energy_required = 1,
    ingredients = {
        {type="fluid", name="nullius-oxygen", amount=100}
    },
    results = {
        {type="item", name="nullius-gas-void", amount=1, probability=0}
    }
  },
  {
    type = "recipe",
    name = "nullius-void-compressed-oxygen",
    icons = data.raw.fluid["nullius-compressed-oxygen"].icons,
    crafting_machine_tint = { primary = data.raw.fluid["nullius-compressed-oxygen"].flow_color },
    category = "nullius-gas-void",
    subgroup = "nullius-gas-void",
    hide_from_player_crafting = true,
    energy_required = 1,
    ingredients = {
        {type="fluid", name="nullius-compressed-oxygen", amount=50}
    },
    results = {
        {type="item", name="nullius-gas-void", amount=1, probability=0}
    }
  },
  {
    type = "recipe",
    name = "nullius-void-carbon-dioxide",
    icons = data.raw.fluid["nullius-carbon-dioxide"].icons,
    crafting_machine_tint = { primary = data.raw.fluid["nullius-carbon-dioxide"].flow_color },
    category = "nullius-gas-void",
    subgroup = "nullius-gas-void",
    hide_from_player_crafting = true,
    energy_required = 1,
    ingredients = {
        {type="fluid", name="nullius-carbon-dioxide", amount=100}
    },
    results = {
        {type="item", name="nullius-gas-void", amount=1, probability=0}
    }
  },
  {
    type = "recipe",
    name = "nullius-void-compressed-carbon-dioxide",
    icons = data.raw.fluid["nullius-compressed-carbon-dioxide"].icons,
    crafting_machine_tint = { primary = data.raw.fluid["nullius-compressed-carbon-dioxide"].flow_color },
    category = "nullius-gas-void",
    subgroup = "nullius-gas-void",
    hide_from_player_crafting = true,
    energy_required = 1,
    ingredients = {
        {type="fluid", name="nullius-compressed-carbon-dioxide", amount=50}
    },
    results = {
        {type="item", name="nullius-gas-void", amount=1, probability=0}
    }
  },
  {
    type = "recipe",
    name = "nullius-void-carbon-monoxide",
    icons = data.raw.fluid["nullius-carbon-monoxide"].icons,
    crafting_machine_tint = { primary = data.raw.fluid["nullius-carbon-monoxide"].flow_color },
    category = "nullius-gas-void",
    subgroup = "nullius-gas-void",
    hide_from_player_crafting = true,
    energy_required = 1,
    ingredients = {
        {type="fluid", name="nullius-carbon-monoxide", amount=100}
    },
    results = {
        {type="item", name="nullius-gas-void", amount=1, probability=0}
    }
  },
  {
    type = "recipe",
    name = "nullius-void-compressed-carbon-monoxide",
    icons = data.raw.fluid["nullius-compressed-carbon-monoxide"].icons,
    crafting_machine_tint = { primary = data.raw.fluid["nullius-compressed-carbon-monoxide"].flow_color },
    category = "nullius-gas-void",
    subgroup = "nullius-gas-void",
    hide_from_player_crafting = true,
    energy_required = 1,
    ingredients = {
        {type="fluid", name="nullius-compressed-carbon-monoxide", amount=50}
    },
    results = {
        {type="item", name="nullius-gas-void", amount=1, probability=0}
    }
  },
  {
    type = "recipe",
    name = "nullius-void-sulfur-dioxide",
    icons = data.raw.fluid["nullius-sulfur-dioxide"].icons,
    crafting_machine_tint = { primary = data.raw.fluid["nullius-sulfur-dioxide"].flow_color },
    category = "nullius-gas-void",
    subgroup = "nullius-gas-void",
    hide_from_player_crafting = true,
    energy_required = 1,
    ingredients = {
        {type="fluid", name="nullius-sulfur-dioxide", amount=100}
    },
    results = {
        {type="item", name="nullius-gas-void", amount=1, probability=0}
    }
  },
  {
    type = "recipe",
    name = "nullius-void-methane",
    icons = data.raw.fluid["nullius-methane"].icons,
    crafting_machine_tint = { primary = data.raw.fluid["nullius-methane"].flow_color },
    category = "nullius-gas-void",
    subgroup = "nullius-gas-void",
    hide_from_player_crafting = true,
    energy_required = 1,
    ingredients = {
        {type="fluid", name="nullius-methane", amount=100}
    },
    results = {
        {type="item", name="nullius-gas-void", amount=1, probability=0}
    }
  },
  {
    type = "recipe",
    name = "nullius-void-compressed-methane",
    icons = data.raw.fluid["nullius-compressed-methane"].icons,
    crafting_machine_tint = { primary = data.raw.fluid["nullius-compressed-methane"].flow_color },
    category = "nullius-gas-void",
    subgroup = "nullius-gas-void",
    hide_from_player_crafting = true,
    energy_required = 1,
    ingredients = {
        {type="fluid", name="nullius-compressed-methane", amount=50}
    },
    results = {
        {type="item", name="nullius-gas-void", amount=1, probability=0}
    }
  },
  {
    type = "recipe",
    name = "nullius-void-ammonia",
    icons = data.raw.fluid["nullius-ammonia"].icons,
    crafting_machine_tint = { primary = data.raw.fluid["nullius-ammonia"].flow_color },
    category = "nullius-gas-void",
    subgroup = "nullius-gas-void",
    hide_from_player_crafting = true,
    energy_required = 1,
    ingredients = {
        {type="fluid", name="nullius-ammonia", amount=100}
    },
    results = {
        {type="item", name="nullius-gas-void", amount=1, probability=0}
    }
  },
  ---------------------------------------------------------------
  {
    type = "recipe",
    name = "nullius-solar-panel-1",
    enabled = false,
    category = "large-crafting",
    always_show_made_in = true,
    energy_required = 8,
    ingredients = {
      {"nullius-polycrystalline-silicon", 6},
      {"nullius-glass", 4},
      {"nullius-aluminum-sheet", 3},
      {"nullius-plastic", 2},
      {"nullius-aluminum-rod", 1}
    },
    result = "nullius-solar-panel-1"
  },
  {
    type = "recipe",
    name = "nullius-boxed-solar-panel-1",
    enabled = false,
    category = "huge-assembly",
    subgroup = "boxed-renewable",
    always_show_made_in = true,
    energy_required = 40,
    ingredients = {
      {"nullius-box-polycrystalline-silicon", 6},
      {"nullius-box-glass", 4},
      {"nullius-box-aluminum-sheet", 3},
      {"nullius-box-plastic", 2},
      {"nullius-box-aluminum-rod", 1}
    },
    result = "nullius-box-solar-panel-1"
  },
  {
    type = "recipe",
    name = "nullius-solar-panel-2",
    enabled = false,
    always_show_made_in = true,
    show_amount_in_title = false,
    always_show_products = true,
    category = "nanotechnology",
    energy_required = 25,
    ingredients = {
      {type="item", name="nullius-solar-panel-1", amount=3},
      {type="item", name="nullius-monocrystalline-silicon", amount=15},
      {type="item", name="nullius-boron", amount=1},
      {type="item", name="nullius-ceramic-powder", amount=5},
      {type="fluid", name="nullius-epoxy", amount=10, fluidbox_index=1}
    },
    result = "nullius-solar-panel-2",
    result_count = 2
  },
  {
    type = "recipe",
    name = "nullius-boxed-solar-panel-2",
    enabled = false,
    always_show_made_in = true,
    show_amount_in_title = false,
    always_show_products = true,
    category = "nanotechnology",
    subgroup = "boxed-renewable",
    energy_required = 125,
    ingredients = {
      {type="item", name="nullius-box-solar-panel-1", amount=3},
      {type="item", name="nullius-box-monocrystalline-silicon", amount=15},
      {type="item", name="nullius-box-boron", amount=1},
      {type="item", name="nullius-box-ceramic-powder", amount=5},
      {type="fluid", name="nullius-epoxy", amount=50, fluidbox_index=1}
    },
    result = "nullius-box-solar-panel-2",
    result_count = 2
  },
  {
    type = "recipe",
    name = "nullius-solar-panel-3",
    enabled = false,
    category = "nanotechnology",
    energy_required = 25,
    ingredients = {
      {type="item", name="nullius-solar-panel-2", amount=2},
      {type="item", name="nullius-lithium", amount=1},
      {type="item", name="nullius-graphene", amount=2},
      {type="item", name="nullius-copper-sheet", amount=4},
      {type="item", name="nullius-hard-glass", amount=6},
      {type="item", name="nullius-transformer", amount=1},
      {type="fluid", name="nullius-titanium-tetrachloride", amount=2, fluidbox_index=1},
      {type="fluid", name="nullius-oxygen", amount=8, fluidbox_index=2}
    },
    results = {
      {type="item", name="nullius-solar-panel-3", amount=1},
      {type="fluid", name="nullius-chlorine", amount=12}
    },
    main_product = "nullius-solar-panel-3"
  },
  {
    type = "recipe",
    name = "nullius-boxed-solar-panel-3",
    enabled = false,
    category = "nanotechnology",
    subgroup = "boxed-renewable",
    energy_required = 25,
    ingredients = {
      {type="item", name="nullius-box-solar-panel-2", amount=2},
      {type="item", name="nullius-box-lithium", amount=1},
      {type="item", name="nullius-box-graphene", amount=2},
      {type="item", name="nullius-box-copper-sheet", amount=4},
      {type="item", name="nullius-box-hard-glass", amount=6},
      {type="item", name="nullius-box-transformer", amount=1},
      {type="fluid", name="nullius-titanium-tetrachloride", amount=10, fluidbox_index=1},
      {type="fluid", name="nullius-oxygen", amount=40, fluidbox_index=2}
    },
    results = {
      {type="item", name="nullius-box-solar-panel-3", amount=1},
      {type="fluid", name="nullius-chlorine", amount=60}
    },
    main_product = "nullius-box-solar-panel-3"
  },
  {
    type = "recipe",
    name = "nullius-solar-panel-4",
    enabled = false,
    category = "nanotechnology",
    energy_required = 40,
    ingredients = {
      {type="item", name="nullius-solar-panel-3", amount=3},
      {type="item", name="nullius-solar-collector-3", amount=2},
      {type="item", name="nullius-productivity-module-3", amount=1},
      {type="item", name="nullius-antimatter", amount=1}
    },
    result = "nullius-solar-panel-4"
  },

  {
    type = "recipe",
    name = "nullius-capacitor",
    enabled = false,
    show_amount_in_title = false,
    always_show_products = true,
    category = "machine-casting",
    energy_required = 5,
    ingredients = {
      {type="item", name="nullius-aluminum-sheet", amount=2},
      {type="item", name="nullius-plastic", amount=3},
      {type="item", name="nullius-alumina", amount=1},
      {type="item", name="nullius-graphite", amount=1}
    },
    result = "nullius-capacitor",
    result_count = 2
  },
  {
    type = "recipe",
    name = "nullius-boxed-capacitor",
    enabled = false,
    show_amount_in_title = false,
    always_show_products = true,
    category = "machine-casting",
    subgroup = "boxed-electrical",
    order = "nullius-bb",
    energy_required = 25,
    ingredients = {
      {type="item", name="nullius-box-aluminum-sheet", amount=2},
      {type="item", name="nullius-box-plastic", amount=3},
      {type="item", name="nullius-box-alumina", amount=1},
      {type="item", name="nullius-box-graphite", amount=1}
    },
    result = "nullius-box-capacitor",
    result_count = 2
  },
  {
    type = "recipe",
    name = "nullius-capacitor-2",
    enabled = false,
    show_amount_in_title = false,
    always_show_products = true,
    category = "nanotechnology",
    subgroup = "boxed-electrical",
    order = "nullius-bc",
    energy_required = 20,
    ingredients = {
      {type="item", name="nullius-box-aluminum-sheet", amount=2},
      {type="item", name="nullius-box-plastic", amount=3},
      {type="item", name="nullius-box-alumina", amount=1},
      {type="item", name="nullius-box-graphite", amount=1},
      {type="fluid", name="nullius-argon", amount=3, fluidbox_index=1}
    },
    result = "nullius-box-capacitor",
    result_count = 3
  },

  {
    type = "recipe",
    name = "nullius-battery-1",
    enabled = false,
    category = "basic-chemistry",
    crafting_machine_tint = {
      primary = data.raw.fluid["nullius-solvent"].flow_color,
      secondary = data.raw.fluid["nullius-caustic-solution"].flow_color
    },
    always_show_made_in = true,
    always_show_products = true,
    energy_required = 10,
    ingredients = {
      {type="item", name="nullius-sodium", amount=2},
      {type="item", name="nullius-iron-oxide", amount=2},
      {type="item", name="nullius-carbon-fiber", amount=3},
      {type="fluid", name="nullius-solvent", amount=16, fluidbox_index=1},
      {type="item", name="nullius-aluminum-sheet", amount=3},
      {type="item", name="nullius-plastic", amount=4}
    },
    result = "nullius-battery-1"
  },
  {
    type = "recipe",
    name = "nullius-boxed-battery-1",
    enabled = false,
    category = "basic-chemistry",
    subgroup = "boxed-renewable",
    crafting_machine_tint = {
      primary = data.raw.fluid["nullius-solvent"].flow_color,
      secondary = data.raw.fluid["nullius-caustic-solution"].flow_color
    },
    always_show_made_in = true,
    always_show_products = true,
    energy_required = 50,
    ingredients = {
      {type="item", name="nullius-box-sodium", amount=2},
      {type="item", name="nullius-box-iron-oxide", amount=2},
      {type="item", name="nullius-box-carbon-fiber", amount=3},
      {type="fluid", name="nullius-solvent", amount=80, fluidbox_index=1},
      {type="item", name="nullius-box-aluminum-sheet", amount=3},
      {type="item", name="nullius-box-plastic", amount=4}
    },
    result = "nullius-box-battery-1"
  },
  {
    type = "recipe",
    name = "nullius-battery-recharging-1",
    localised_name = {"recipe-name.nullius-battery-recharging-1"},
    icon = ICONPATH .. "uncharged1.png",
    icon_size = 64,
    icon_mipmaps = 4,
    enabled = false,
    always_show_products = true,
    no_productivity = true,
    category = "nullius-electrolysis",
    order = "nullius-eb",
    energy_required = 2,
    ingredients = {
      {"nullius-uncharged-battery-1", 1}
    },
    result = "nullius-battery-1"
  },
  {
    type = "recipe",
    name = "nullius-boxed-battery-recharging-1",
    localised_name = {"recipe-name.nullius-boxed", {"recipe-name.nullius-battery-recharging-1"}},
    enabled = false,
    always_show_products = true,
    no_productivity = true,
    category = "nullius-electrolysis",
    subgroup = "boxed-renewable",
    order = "nullius-eb",
    energy_required = 10,
    ingredients = {
      {"nullius-uncharged-battery-1", 5}
    },
    result = "nullius-box-battery-1"
  },

  {
    type = "recipe",
    name = "nullius-battery-2",
    enabled = false,
    always_show_made_in = true,
    always_show_products = true,
    category = "nanotechnology",
    energy_required = 12,
    ingredients = {
      {type="item", name="nullius-battery-1", amount=2},
      {type="item", name="nullius-graphene", amount=2},
      {type="item", name="nullius-lithium", amount=3},
      {type="item", name="nullius-capacitor", amount=2}
    },
    result = "nullius-battery-2"
  },
  {
    type = "recipe",
    name = "nullius-boxed-battery-2",
    enabled = false,
    always_show_made_in = true,
    always_show_products = true,
    category = "nanotechnology",
    subgroup = "boxed-renewable",
    energy_required = 60,
    ingredients = {
      {type="item", name="nullius-box-battery-1", amount=2},
      {type="item", name="nullius-box-graphene", amount=2},
      {type="item", name="nullius-box-lithium", amount=3},
      {type="item", name="nullius-box-capacitor", amount=2}
    },
    result = "nullius-box-battery-2"
  },
  {
    type = "recipe",
    name = "nullius-battery-recharging-2",
    localised_name = {"recipe-name.nullius-battery-recharging-2"},
    icon = ICONPATH .. "uncharged2.png",
    icon_size = 64,
    icon_mipmaps = 4,
    enabled = false,
    always_show_products = true,
    no_productivity = true,
    category = "nullius-electrolysis",
    order = "nullius-ec",
    energy_required = 6,
    ingredients = {
      {"nullius-uncharged-battery-2", 1}
    },
    result = "nullius-battery-2"
  },
  {
    type = "recipe",
    name = "nullius-boxed-battery-recharging-2",
    localised_name = {"recipe-name.nullius-boxed", {"recipe-name.nullius-battery-recharging-2"}},
    enabled = false,
    always_show_products = true,
    no_productivity = true,
    category = "nullius-electrolysis",
    subgroup = "boxed-renewable",
    order = "nullius-ec",
    energy_required = 30,
    ingredients = {
      {"nullius-uncharged-battery-2", 5}
    },
    result = "nullius-box-battery-2"
  },

   {
    type = "recipe",
    name = "nullius-battery-3",
    enabled = false,
    always_show_made_in = true,
    always_show_products = true,
    category = "nanotechnology",
    energy_required = 30,
    ingredients = {
      {type="item", name="nullius-box-battery-2", amount=1},
      {type="item", name="nullius-box-copper-sheet", amount=2},
      {type="item", name="nullius-antimatter", amount=1},
      {type="item", name="nullius-efficiency-module-3", amount=1}
    },
    result = "nullius-battery-3"
  },
  {
    type = "recipe",
    name = "nullius-battery-recharging-3",
    localised_name = {"recipe-name.nullius-battery-recharging-3"},
    icon = ICONPATH .. "uncharged3.png",
    icon_size = 64,
    icon_mipmaps = 4,
    enabled = false,
    always_show_products = true,
    no_productivity = true,
    category = "nullius-electrolysis",
    order = "nullius-ed",
    energy_required = 12,
    ingredients = {
      {"nullius-uncharged-battery-3", 1}
    },
    result = "nullius-battery-3"
  },

   {
    type = "recipe",
    name = "nullius-hangar-1",
    enabled = false,
    always_show_made_in = true,
    category = "large-crafting",
    energy_required = 6,
    ingredients = {
      {name="nullius-small-storage-chest-1", amount=2},
      {name="nullius-relay-1", amount=1},
      {name="nullius-charger-1", amount=1},
      {name="fast-transport-belt", amount=4},
      {name="train-stop", amount=1}
    },
    result = "nullius-hangar-1"
  },
  {
    type = "recipe",
    name = "nullius-hangar-2",
    enabled = false,
    always_show_made_in = true,
    category = "large-crafting",
    energy_required = 6,
    ingredients = {
      {name="nullius-hangar-1", amount=1},
      {name="nullius-large-storage-chest-1", amount=1},
      {name="nullius-relay-2", amount=1},
      {name="nullius-charger-2", amount=1},
      {name="fast-splitter", amount=2}
    },
    result = "nullius-hangar-2"
  },
  {
    type = "recipe",
    name = "nullius-hangar-3",
    enabled = false,
    always_show_made_in = true,
    category = "large-crafting",
    energy_required = 10,
    ingredients = {
      {name="nullius-hangar-2", amount=1},
      {name="nullius-large-buffer-chest-2", amount=1},
      {name="nullius-relay-3", amount=1},
      {name="nullius-charger-3", amount=1},
      {name="express-stack-filter-inserter", amount=2},
      {name="gate", amount=3}
    },
    result = "nullius-hangar-3"
  },
  {
    type = "recipe",
    name = "nullius-hangar-4",
    enabled = false,
    always_show_made_in = true,
    category = "nanotechnology",
    energy_required = 10,
    ingredients = {
      {name="nullius-hangar-3", amount=1},
      {name="nullius-yield-module-4", amount=1},
      {name="nullius-charger-4", amount=1}
    },
    result = "nullius-hangar-4"
  },

  {
    type = "recipe",
    name = "nullius-charger-1",
    enabled = false,
    always_show_made_in = true,
    category = "medium-crafting",
    energy_required = 4,
    ingredients = {
      {"nullius-power-pole-2", 1},
      {"nullius-capacitor", 3},
      {"programmable-speaker", 1}
    },
    result = "nullius-charger-1"
  },
  {
    type = "recipe",
    name = "nullius-boxed-charger-1",
    enabled = false,
    always_show_made_in = true,
    category = "large-assembly",
    subgroup = "boxed-hangar",
    energy_required = 20,
    ingredients = {
      {"nullius-box-power-pole-2", 1},
      {"nullius-box-capacitor", 3},
      {"nullius-box-antenna", 1}
    },
    result = "nullius-box-charger-1"
  },
  {
    type = "recipe",
    name = "nullius-charger-2",
    enabled = false,
    always_show_made_in = true,
    category = "medium-crafting",
    energy_required = 5,
    ingredients = {
      {"nullius-charger-1", 1},
      {"nullius-grid-battery-1", 1},
      {"rail-signal", 3}
    },
    result = "nullius-charger-2"
  },
  {
    type = "recipe",
    name = "nullius-boxed-charger-2",
    enabled = false,
    always_show_made_in = true,
    category = "large-assembly",
    subgroup = "boxed-hangar",
    energy_required = 25,
    ingredients = {
      {"nullius-box-charger-1", 1},
      {"nullius-box-grid-battery-1", 1},
      {"nullius-box-rail-signal", 3}
    },
    result = "nullius-box-charger-2"
  },
  {
    type = "recipe",
    name = "nullius-charger-3",
    enabled = false,
    always_show_made_in = true,
    category = "medium-crafting",
    energy_required = 6,
    ingredients = {
      {"nullius-charger-2", 1},
      {"nullius-relay-2", 1},
      {"nullius-grid-battery-2", 1}
    },
    result = "nullius-charger-3"
  },
  {
    type = "recipe",
    name = "nullius-boxed-charger-3",
    enabled = false,
    always_show_made_in = true,
    category = "large-assembly",
    subgroup = "boxed-hangar",
    energy_required = 30,
    ingredients = {
      {"nullius-box-charger-2", 1},
      {"nullius-box-relay-2", 1},
      {"nullius-box-grid-battery-2", 1}
    },
    result = "nullius-box-charger-3"
  },
  {
    type = "recipe",
    name = "nullius-charger-4",
    enabled = false,
    always_show_made_in = true,
    category = "nanotechnology",
    energy_required = 6,
    ingredients = {
      {"nullius-charger-3", 1},
      {"nullius-substation-3", 1},
      {"nullius-copper-wire", 5},
      {"nullius-lithium", 2}
    },
    result = "nullius-charger-4"
  },
  {
    type = "recipe",
    name = "nullius-boxed-charger-4",
    enabled = false,
    always_show_made_in = true,
    category = "nanotechnology",
    subgroup = "boxed-hangar",
    energy_required = 30,
    ingredients = {
      {"nullius-box-charger-3", 1},
      {"nullius-substation-3", 5},
      {"nullius-box-copper-wire", 5},
      {"nullius-box-lithium", 2}
    },
    result = "nullius-box-charger-4"
  },

  {
    type = "recipe",
    name = "nullius-relay-1",
    enabled = false,
    always_show_made_in = true,
    category = "medium-crafting",
    energy_required = 4,
    ingredients = {
      {"programmable-speaker", 1},
      {"decider-combinator", 2},
      {"constant-combinator", 1},
      {"small-lamp", 1}
    },
    result = "nullius-relay-1"
  },
  {
    type = "recipe",
    name = "nullius-boxed-relay-1",
    enabled = false,
    always_show_made_in = true,
    category = "large-assembly",
    subgroup = "boxed-beacon",
    energy_required = 20,
    ingredients = {
      {"nullius-box-antenna", 1},
      {"nullius-box-logic-circuit", 2},
      {"nullius-box-memory-circuit", 1},
      {"nullius-box-lamp-1", 1}
    },
    result = "nullius-box-relay-1"
  },
  {
    type = "recipe",
    name = "nullius-relay-2",
    enabled = false,
    always_show_made_in = true,
    category = "medium-crafting",
    energy_required = 5,
    ingredients = {
      {"nullius-relay-1", 1},
      {"nullius-sensor-1", 2},
      {"nullius-transformer", 1},
      {"rail-chain-signal", 2}
    },
    result = "nullius-relay-2"
  },
  {
    type = "recipe",
    name = "nullius-boxed-relay-2",
    enabled = false,
    always_show_made_in = true,
    category = "large-assembly",
    subgroup = "boxed-beacon",
    energy_required = 25,
    ingredients = {
      {"nullius-box-relay-1", 1},
      {"nullius-box-sensor-1", 2},
      {"nullius-box-transformer", 1},
      {"nullius-box-chain-signal", 2}
    },
    result = "nullius-box-relay-2"
  },
  {
    type = "recipe",
    name = "nullius-relay-3",
    enabled = false,
    always_show_made_in = true,
    category = "medium-crafting",
    energy_required = 6,
    ingredients = {
      {"nullius-relay-2", 2},
      {"nullius-sensor-2", 2},
      {"nullius-power-pole-4", 1},
      {"nullius-lamp-2", 3},
      {"nullius-processor-2", 1}
    },
    result = "nullius-relay-3"
  },
  {
    type = "recipe",
    name = "nullius-boxed-relay-3",
    enabled = false,
    always_show_made_in = true,
    category = "large-assembly",
    subgroup = "boxed-beacon",
    energy_required = 30,
    ingredients = {
      {"nullius-box-relay-2", 2},
      {"nullius-box-sensor-2", 2},
      {"nullius-box-power-pole-4", 1},
      {"nullius-box-lamp-2", 3},
      {"nullius-box-processor-2", 1}
    },
    result = "nullius-box-relay-3"
  },
  {
    type = "recipe",
    name = "nullius-relay-4",
    enabled = false,
    category = "nanotechnology",
    energy_required = 8,
    ingredients = {
      {"nullius-box-relay-3", 1},
      {"nullius-box-copper-wire", 3},
      {"nullius-speed-module-4", 1}
    },
    result = "nullius-relay-4"
  },

   {
    type = "recipe",
    name = "nullius-repair-pack",
    enabled = false,
    category = "small-crafting",
    always_show_made_in = true,
    energy_required = 4,
    ingredients = {
      {"decider-combinator", 1},
      {"inserter", 1},
      {"nullius-steel-gear", 1},
      {"nullius-plastic", 1},
      {"nullius-aluminum-carbide", 1}
    },
    result = "repair-pack"
  },
  {
    type = "recipe",
    name = "nullius-boxed-repair-pack",
    enabled = false,
    category = "large-assembly",
    subgroup = "boxed-demolition",
    always_show_made_in = true,
    energy_required = 20,
    ingredients = {
      {"nullius-box-logic-circuit", 1},
      {"nullius-box-inserter-1", 1},
      {"nullius-box-steel-gear", 1},
      {"nullius-box-plastic", 1},
      {"nullius-box-aluminum-carbide", 1}
    },
    result = "nullius-box-repair-pack"
  },
  {
    type = "recipe",
    name = "nullius-self-repair-pack",
    enabled = false,
    category = "small-crafting",
    always_show_made_in = true,
    energy_required = 5,
    ingredients = {
      {"repair-pack", 2},
      {"nullius-steel-plate", 2},
      {"nullius-rubber", 2}
    },
    result = "nullius-self-repair-pack",
    reult_count = 10
  },

  {
    type = "recipe",
    name = "nullius-construction-bot-1",
    enabled = false,
    always_show_made_in = true,
    category = "tiny-crafting",
    energy_required = 5,
    ingredients = {
      {"nullius-robot-frame-1", 1},
      {"decider-combinator", 1},
      {"repair-pack", 1}
    },
    result = "nullius-construction-bot-1"
  },
  {
    type = "recipe",
    name = "nullius-boxed-construction-bot-1",
    enabled = false,
    always_show_made_in = true,
    category = "medium-only-assembly",
    subgroup = "boxed-robot",
    energy_required = 25,
    ingredients = {
      {"nullius-box-robot-frame-1", 1},
      {"nullius-box-logic-circuit", 1},
      {"nullius-box-repair-pack", 1}
    },
    result = "nullius-box-construction-bot-1"
  },
  {
    type = "recipe",
    name = "nullius-construction-bot-2",
    enabled = false,
    always_show_made_in = true,
    category = "tiny-crafting",
    energy_required = 6,
    ingredients = {
      {"nullius-construction-bot-1", 1},
      {"nullius-robot-frame-2", 1},
      {"nullius-yield-module-1", 1}
    },
    result = "nullius-construction-bot-2"
  },
  {
    type = "recipe",
    name = "nullius-boxed-construction-bot-2",
    enabled = false,
    always_show_made_in = true,
    category = "medium-only-assembly",
    subgroup = "boxed-robot",
    energy_required = 30,
    ingredients = {
      {"nullius-box-construction-bot-1", 1},
      {"nullius-box-robot-frame-2", 1},
      {"nullius-box-yield-module-1", 1}
    },
    result = "nullius-box-construction-bot-2"
  },
  {
    type = "recipe",
    name = "nullius-construction-bot-3",
    enabled = false,
    always_show_made_in = true,
    category = "tiny-crafting",
    energy_required = 8,
    ingredients = {
      {"nullius-construction-bot-2", 2},
      {"nullius-robot-frame-3", 1},
      {"nullius-productivity-module-1", 1},
      {"nullius-small-miner-3", 1}
    },
    result = "nullius-construction-bot-3"
  },
  {
    type = "recipe",
    name = "nullius-boxed-construction-bot-3",
    enabled = false,
    always_show_made_in = true,
    category = "medium-only-assembly",
    subgroup = "boxed-robot",
    energy_required = 40,
    ingredients = {
      {"nullius-box-construction-bot-2", 2},
      {"nullius-box-robot-frame-3", 1},
      {"nullius-box-productivity-module-1", 1},
      {"nullius-small-miner-3", 5}
    },
    result = "nullius-box-construction-bot-3"
  },
  {
    type = "recipe",
    name = "nullius-construction-bot-4",
    enabled = false,
    always_show_made_in = true,
    show_amount_in_title = false,
    always_show_products = true,
    category = "tiny-crafting",
    energy_required = 25,
    ingredients = {
      {"nullius-construction-bot-3", 3},
      {"nullius-robot-frame-4", 2},
      {"nullius-productivity-module-3", 1}
    },
    result = "nullius-construction-bot-4",
    result_count = 2
  },
  {
    type = "recipe",
    name = "nullius-boxed-construction-bot-4",
    enabled = false,
    always_show_made_in = true,
    show_amount_in_title = false,
    always_show_products = true,
    category = "medium-only-assembly",
    subgroup = "boxed-robot",
    energy_required = 125,
    ingredients = {
      {"nullius-box-construction-bot-3", 3},
      {"nullius-box-robot-frame-4", 2},
      {"nullius-box-productivity-module-3", 1}
    },
    result = "nullius-box-construction-bot-4",
    result_count = 2
  },

   {
    type = "recipe",
    name = "nullius-logistic-bot-1",
    enabled = false,
    always_show_made_in = true,
    category = "tiny-crafting",
    energy_required = 5,
    ingredients = {
      {"nullius-robot-frame-1", 1},
      {"arithmetic-combinator", 1},
      {"nullius-small-storage-chest-1", 1}
    },
    result = "nullius-logistic-bot-1"
  },
  {
    type = "recipe",
    name = "nullius-boxed-logistic-bot-1",
    enabled = false,
    always_show_made_in = true,
    category = "medium-only-assembly",
    subgroup = "boxed-robot",
    energy_required = 25,
    ingredients = {
      {"nullius-box-robot-frame-1", 1},
      {"nullius-box-arithmetic-circuit", 1},
      {"nullius-small-storage-chest-1", 5}
    },
    result = "nullius-box-logistic-bot-1"
  },
  {
    type = "recipe",
    name = "nullius-logistic-bot-2",
    enabled = false,
    always_show_made_in = true,
    category = "tiny-crafting",
    energy_required = 6,
    ingredients = {
      {"nullius-logistic-bot-1", 1},
      {"nullius-robot-frame-2", 1},
      {"nullius-efficiency-module-1", 1}
    },
    result = "nullius-logistic-bot-2"
  },
  {
    type = "recipe",
    name = "nullius-boxed-logistic-bot-2",
    enabled = false,
    always_show_made_in = true,
    category = "medium-only-assembly",
    subgroup = "boxed-robot",
    energy_required = 30,
    ingredients = {
      {"nullius-box-logistic-bot-1", 1},
      {"nullius-box-robot-frame-2", 1},
      {"nullius-box-efficiency-module-1", 1}
    },
    result = "nullius-box-logistic-bot-2"
  },
  {
    type = "recipe",
    name = "nullius-logistic-bot-3",
    enabled = false,
    always_show_made_in = true,
    category = "tiny-crafting",
    energy_required = 8,
    ingredients = {
      {"nullius-logistic-bot-2", 2},
      {"nullius-robot-frame-3", 1},
      {"nullius-speed-module-2", 1},
      {"nullius-small-buffer-chest-2", 1}
    },
    result = "nullius-logistic-bot-3"
  },
  {
    type = "recipe",
    name = "nullius-boxed-logistic-bot-3",
    enabled = false,
    always_show_made_in = true,
    category = "medium-only-assembly",
    subgroup = "boxed-robot",
    energy_required = 40,
    ingredients = {
      {"nullius-box-logistic-bot-2", 2},
      {"nullius-box-robot-frame-3", 1},
      {"nullius-box-speed-module-2", 1},
      {"nullius-small-buffer-chest-2", 5}
    },
    result = "nullius-box-logistic-bot-3"
  },
  {
    type = "recipe",
    name = "nullius-logistic-bot-4",
    enabled = false,
    always_show_made_in = true,
    show_amount_in_title = false,
    always_show_products = true,
    category = "tiny-crafting",
    energy_required = 25,
    ingredients = {
      {"nullius-logistic-bot-3", 3},
      {"nullius-robot-frame-4", 2},
      {"nullius-speed-module-4", 1}
    },
    result = "nullius-logistic-bot-4",
    result_count = 2
  },
  {
    type = "recipe",
    name = "nullius-boxed-logistic-bot-4",
    enabled = false,
    always_show_made_in = true,
    show_amount_in_title = false,
    always_show_products = true,
    category = "medium-only-assembly",
    subgroup = "boxed-robot",
    energy_required = 125,
    ingredients = {
      {"nullius-box-logistic-bot-3", 3},
      {"nullius-box-robot-frame-4", 2},
      {"nullius-box-speed-module-4", 1}
    },
    result = "nullius-box-logistic-bot-4",
    result_count = 2
  },

   {
    type = "recipe",
    name = "nullius-car-1",
    enabled = false,
    category = "large-fluid-assembly",
    energy_required = 8,
    ingredients = {
      {type="item", name="nullius-locomotive-1", amount=1},
      {type="item", name="small-lamp", amount=2},
      {type="item", name="nullius-rubber", amount=4},
      {type="item", name="nullius-iron-wire", amount=4},
      {type="fluid", name="nullius-air", amount=15, fluidbox_index=1}
    },
    result = "nullius-car-1"
  },
  {
    type = "recipe",
    name = "nullius-car-2",
    enabled = false,
    always_show_made_in = true,
    category = "large-crafting",
    energy_required = 12,
    ingredients = {
      {type="item", name="nullius-car-1", amount=1},
      {type="item", name="nullius-locomotive-2", amount=1},
      {type="item", name="nullius-lamp-2", amount=2},
      {type="item", name="nullius-textile", amount=3},
      {type="item", name="nullius-battery-1", amount=4},
      {type="item", name="nullius-gun", amount=2}
    },
    result = "nullius-car-2"
  },
  {
    type = "recipe",
    name = "nullius-car-3",
    enabled = false,
    always_show_made_in = true,
    category = "large-crafting",
    energy_required = 20,
    ingredients = {
      {type="item", name="nullius-car-2", amount=1},
      {type="item", name="nullius-solar-locomotive", amount=1},
      {type="item", name="nullius-missile-launcher", amount=2}
    },
    result = "nullius-car-3"
  },
  {
    type = "recipe",
    name = "nullius-truck-1",
    enabled = false,
    category = "huge-fluid-assembly",
    energy_required = 15,
    ingredients = {
      {type="item", name="nullius-car-2", amount=2},
      {type="item", name="nullius-steel-beam", amount=12},
      {type="item", name="nullius-steel-plate", amount=25},
      {type="item", name="nullius-missile-launcher", amount=3},
      {type="item", name="nullius-rubber", amount=8},
      {type="fluid", name="nullius-compressed-air", amount=40, fluidbox_index=1}
    },
    result = "nullius-truck-1"
  },
  {
    type = "recipe",
    name = "nullius-truck-2",
    enabled = false,
    category = "huge-crafting",
    energy_required = 30,
    ingredients = {
      {type="item", name="nullius-truck-1", amount=1},
      {type="item", name="nullius-locomotive-3", amount=1},
      {type="item", name="nullius-reactor", amount=1}
    },
    result = "nullius-truck-2"
  },

  {
    type = "recipe",
    name = "nullius-mecha",
    enabled = false,
    category = "huge-crafting",
    energy_required = 120,
    ingredients = {
      {type="item", name="nullius-car-3", amount=1},
      {type="item", name="nullius-drone-launcher-2", amount=2},
      {type="item", name="nullius-solar-panel-2", amount=32},
      {type="item", name="nullius-grid-battery-2", amount=8},
      {type="item", name="nullius-leg-augmentation-2", amount=8},
      {type="item", name="nullius-efficiency-module-3", amount=4}
    },
    result = "nullius-mecha"
  },
  {
    type = "recipe",
    name = "nullius-mecha-2",
    enabled = false,
    category = "huge-assembly",
    energy_required = 600,
    ingredients = {
      {type="item", name="nullius-mecha", amount=2},
      {type="item", name="nullius-leg-augmentation-4", amount=8},
      {type="item", name="nullius-solar-panel-4", amount=8},
      {type="item", name="nullius-grid-battery-3", amount=4}
    },
    result = "nullius-mecha-2"
  },

 {
    type = "recipe",
    name = "nullius-mecha-remote",
    enabled = false,
    always_show_made_in = true,
    no_productivity = true,
    category = "tiny-crafting",
    energy_required = 20,
    ingredients = {
      {"nullius-scout-remote", 1},
      {"nullius-processor-2", 1}
    },
    result = "nullius-mecha-remote"
  },

  {
    type = "recipe",
    name = "nullius-rocket",
    enabled = false,
    always_show_made_in = true,
    category = "rocketry",
    energy_required = 400,
    ingredients = {
      {"nullius-box-rocket-fuel", 50},
      {"nullius-box-carbon-composite", 40},
      {"nullius-box-titanium-sheet", 25},
      {"nullius-haste-module-3", 3},
      {"nullius-sensor-node-2", 4},
      {"nullius-box-steel-beam", 20},
      {"nullius-box-heat-pipe-3", 10},
      {"nullius-box-insulation", 12},
      {"nullius-box-ceramic-powder", 20},
      {"nullius-box-logistic-bot-2", 2},
      {"nullius-box-gate", 1}
    },
    result = "nullius-rocket"
  },

  {
    type = "recipe",
    name = "nullius-probe",
    enabled = false,
    always_show_made_in = true,
    category = "huge-crafting",
    energy_required = 400,
    ingredients = {
      {"nullius-asteroid-miner-1", 1},
      {"nullius-satellite", 2},
      {"nullius-antimatter", 25},
      {"nullius-box-copper-sheet", 10},
      {"nullius-android-2", 1},
      {"nullius-nanofabricator-2", 1},
      {"nullius-reactor", 1}
    },
    result = "nullius-probe"
  },
  {
    type = "recipe",
    name = "nullius-satellite",
    enabled = false,
    always_show_made_in = true,
    category = "huge-crafting",
    energy_required = 120,
    ingredients = {
      {"nullius-box-rocket-fuel", 10},
      {"nullius-box-carbon-composite", 8},
      {"nullius-box-aluminum-sheet", 5},
      {"nullius-efficiency-module-3", 3},
      {"nullius-lab-2", 4},
      {"nullius-beacon-3", 3},
      {"nullius-box-solar-panel-2", 3},
      {"nullius-box-grid-battery-2", 1}
    },
    result = "nullius-satellite"
  },

  ---------------------------------------------------------------
  {
    type = "recipe",
    name = "nullius-missile-1",
    enabled = false,
    show_amount_in_title = false,
    always_show_products = true,
    category = "small-crafting",
    always_show_made_in = true,
    energy_required = 2,
    ingredients = {
      {"cliff-explosives", 5},
      {"nullius-steel-sheet", 3},
      {"processed-fuel", 1},
      {"nullius-sensor-1", 1},
      {"nullius-battery-1", 1},
      {"nullius-motor-2", 1}
    },
    result = "nullius-missile-1",
    result_count = 6
  },
  {
    type = "recipe",
    name = "nullius-boxed-missile-1",
    enabled = false,
    show_amount_in_title = false,
    always_show_products = true,
    category = "large-assembly",
    subgroup = "boxed-demolition",
    always_show_made_in = true,
    energy_required = 10,
    ingredients = {
      {"nullius-box-explosive", 5},
      {"nullius-box-steel-sheet", 3},
      {"nullius-box-methanol-canister", 1},
      {"nullius-box-sensor-1", 1},
      {"nullius-box-battery-1", 1},
      {"nullius-box-motor-2", 1}
    },
    result = "nullius-box-missile-1",
    result_count = 6
  },

  {
    type = "recipe",
    name = "nullius-missile-2",
    enabled = false,
    show_amount_in_title = false,
    always_show_products = true,
    always_show_made_in = true,
    category = "small-crafting",
    energy_required = 10,
    ingredients = {
      {"nullius-missile-1", 3},
      {"nullius-titanium-sheet", 5},
      {"nullius-fusion-cell", 1},
      {"nullius-sensor-2", 1},
      {"nullius-yield-module-2", 1}
    },
    result = "nullius-missile-2"
  },
  {
    type = "recipe",
    name = "nullius-boxed-missile-2",
    enabled = false,
    show_amount_in_title = false,
    always_show_products = true,
    always_show_made_in = true,
    category = "medium-only-assembly",
    subgroup = "boxed-demolition",
    energy_required = 10,
    ingredients = {
      {"nullius-box-missile-1", 3},
      {"nullius-box-titanium-sheet", 5},
      {"nullius-fusion-cell", 5},
      {"nullius-box-sensor-2", 1},
      {"nullius-box-yield-module-2", 1}
    },
    result = "nullius-box-missile-2"
  },

   {
    type = "recipe",
    name = "nullius-magazine",
    enabled = false,
    always_show_made_in = true,
    show_amount_in_title = false,
    always_show_products = true,
    category = "hand-casting",
    energy_required = 5,
    ingredients = {
      {"cliff-explosives", 1},
      {"nullius-steel-rod", 6}
    },
    result = "nullius-magazine",
    result_count = 20
  },
  {
    type = "recipe",
    name = "nullius-boxed-magazine",
    enabled = false,
    always_show_made_in = true,
    show_amount_in_title = false,
    always_show_products = true,
    category = "machine-casting",
    subgroup = "boxed-demolition",
    energy_required = 25,
    ingredients = {
      {"nullius-box-explosive", 1},
      {"nullius-box-steel-rod", 6}
    },
    result = "nullius-box-magazine",
    result_count = 20
  },

  {
    type = "recipe",
    name = "nullius-improvised-explosive",
    localised_name = {"recipe-name.nullius-improvised-explosive"},
    order = "nullius-bb",
    enabled = false,
    always_show_made_in = true,
    category = "hand-crafting",
    energy_required = 30,
    ingredients = {
      {type="item", name="nullius-chlorine-barrel", amount=1},
      {type="item", name="processed-fuel", amount=5},
      {type="item", name="red-wire", amount=1},
      {type="item", name="green-wire", amount=1},
      {type="item", name="nullius-small-miner-1", amount=1}
    },
    result = "cliff-explosives"
  },
  {
    type = "recipe",
    name = "nullius-explosive",
    order = "nullius-bc",
    enabled = false,
    always_show_made_in = true,
    category = "basic-chemistry",
    crafting_machine_tint = {
      primary = data.raw.fluid["nullius-acid-nitric"].flow_color,
      secondary = data.raw.fluid["nullius-glycerol"].flow_color
    },
    energy_required = 4,
    ingredients = {
      {type="fluid", name="nullius-acid-nitric", amount=18},
      {type="fluid", name="nullius-acid-sulfuric", amount=18},
      {type="fluid", name="nullius-glycerol", amount=6},
      {type="item", name="nullius-sand", amount=2},
      {type="item", name="nullius-plastic", amount=1},
      {type="item", name="red-wire", amount=1}
    },
    results = {
      {type="item", name="cliff-explosives", amount=2},
      {type="fluid", name="nullius-wastewater", amount=20}
    },
  },
  {
    type = "recipe",
    name = "nullius-boxed-explosive",
    enabled = false,
    category = "basic-chemistry",
    subgroup = "boxed-demolition",
    crafting_machine_tint = {
      primary = data.raw.fluid["nullius-acid-nitric"].flow_color,
      secondary = data.raw.fluid["nullius-glycerol"].flow_color
    },
    always_show_made_in = true,
    energy_required = 20,
    ingredients = {
      {type="fluid", name="nullius-acid-nitric", amount=90},
      {type="fluid", name="nullius-acid-sulfuric", amount=90},
      {type="fluid", name="nullius-glycerol", amount=30},
      {type="item", name="nullius-box-sand", amount=2},
      {type="item", name="nullius-box-plastic", amount=1},
      {type="item", name="nullius-box-red-wire", amount=1}
    },
    results = {
      {type="item", name="nullius-box-explosive", amount=2},
      {type="fluid", name="nullius-wastewater", amount=100}
    },
  },
  {
    type = "recipe",
    name = "nullius-turret",
    enabled = false,
    category = "nanotechnology",
    energy_required = 30,
    ingredients = {
      {type="item", name="nullius-box-lamp-2", amount=2},
      {type="item", name="nullius-box-monocrystalline-silicon", amount=2},
      {type="item", name="nullius-box-hard-glass", amount=1},
      {type="item", name="nullius-night-vision-3", amount=1},
      {type="item", name="nullius-motor-3", amount=2},
      {type="item", name="nullius-box-steel-plate", amount=2},
      {type="item", name="nullius-box-copper-sheet", amount=1},
      {type="item", name="nullius-transformer", amount=2},
      {type="fluid", name="nullius-compressed-helium", amount=20, fluidbox_index=1}
    },
    result = "nullius-turret"
  },

   {
    type = "recipe",
    name = "nullius-chassis-2",
    enabled = false,
    category = "small-crafting",
    always_show_made_in = true,
    energy_required = 20,
    ingredients = {
      {"nullius-steel-plate", 12},
      {"nullius-rubber", 8},
      {"inserter", 4}
    },
    result = "nullius-chassis-2"
  },
  {
    type = "recipe",
    name = "nullius-chassis-3",
    enabled = false,
    category = "hand-casting",
    always_show_made_in = true,
    energy_required = 40,
    ingredients = {
      {"nullius-titanium-plate", 20},
      {"nullius-ceramic-powder", 15},
      {"nullius-textile", 10},
      {"nullius-robot-frame-1", 2},
      {"nullius-efficiency-module-1", 1},
      {"nullius-transformer", 1}
    },
    result = "nullius-chassis-3"
  },
  {
    type = "recipe",
    name = "nullius-chassis-4",
    enabled = false,
    always_show_made_in = true,
    category = "hand-casting",
    energy_required = 60,
    ingredients = {
      {"nullius-titanium-plate", 20},
      {"nullius-ceramic-powder", 20},
      {"nullius-carbon-composite", 20},
      {"nullius-textile", 20},
      {"nullius-robot-frame-3", 4},
      {"nullius-efficiency-module-2", 2},
      {"nullius-small-storage-chest-2", 1}
    },
    result = "nullius-chassis-4"
  },
  {
    type = "recipe",
    name = "nullius-chassis-5",
    enabled = false,
    always_show_made_in = true,
    category = "hand-casting",
    energy_required = 120,
    ingredients = {
      {"nullius-box-titanium-plate", 8},
      {"nullius-box-ceramic-powder", 6},
      {"nullius-box-carbon-composite", 8},
      {"nullius-box-textile", 6},
      {"nullius-box-robot-frame-4", 1},
      {"nullius-leg-augmentation-3", 4},
      {"nullius-box-productivity-module-3", 1},
      {"nullius-large-buffer-chest-2", 1}
    },
    result = "nullius-chassis-5"
  },
  {
    type = "recipe",
    name = "nullius-chassis-6",
    enabled = false,
    category = "nanotechnology",
    energy_required = 300,
    ingredients = {
      {"nullius-chassis-5", 1},
      {"nullius-solar-panel-4", 3},
      {"nullius-battery-3", 4},
      {"nullius-box-graphene", 6},
      {"nullius-leg-augmentation-4", 2},
      {"nullius-relay-4", 1}
    },
    result = "nullius-chassis-6"
  },

   {
    type = "recipe",
    name = "nullius-night-vision-1",
    enabled = false,
    category = "small-crafting",
    always_show_made_in = true,
    energy_required = 25,
    ingredients = {
      {"nullius-sensor-1", 2},
      {"nullius-glass", 2},
      {"nullius-aluminum-sheet", 2},
      {"nullius-capacitor", 2}
    },
    result = "nullius-night-vision-1"
  },
  {
    type = "recipe",
    name = "nullius-night-vision-2",
    enabled = false,
    category = "small-crafting",
    always_show_made_in = true,
    energy_required = 40,
    ingredients = {
      {"nullius-night-vision-1", 1},
      {"nullius-sensor-2", 2},
      {"nullius-hard-glass", 2}
    },
    result = "nullius-night-vision-2"
  },
  {
    type = "recipe",
    name = "nullius-night-vision-3",
    enabled = false,
    always_show_made_in = true,
    category = "small-crafting",
    energy_required = 60,
    ingredients = {
      {"nullius-night-vision-2", 2},
      {"nullius-yield-module-3", 1},
      {"nullius-graphene", 2},
      {"nullius-battery-2", 1}
    },
    result = "nullius-night-vision-3"
  },
  {
    type = "recipe",
    name = "nullius-leg-augmentation-1",
    enabled = false,
    category = "medium-crafting",
    always_show_made_in = true,
    energy_required = 15,
    ingredients = {
      {"stack-inserter", 4},
      {"nullius-sensor-2", 2},
      {"nullius-motor-2", 6},
      {"nullius-titanium-rod", 6},
      {"nullius-steel-gear", 4},
      {"nullius-battery-1", 2}
    },
    result = "nullius-leg-augmentation-1"
  },
  {
    type = "recipe",
    name = "nullius-leg-augmentation-2",
    enabled = false,
    always_show_made_in = true,
    category = "medium-crafting",
    energy_required = 30,
    ingredients = {
      {"nullius-leg-augmentation-1", 2},
      {"express-stack-filter-inserter", 4},
      {"nullius-motor-3", 5},
      {"nullius-carbon-composite", 6},
      {"nullius-levitation-field-1", 1},
      {"nullius-battery-2", 3},
      {"nullius-speed-module-3", 1}
    },
    result = "nullius-leg-augmentation-2"
  },
  {
    type = "recipe",
    name = "nullius-leg-augmentation-3",
    enabled = false,
    always_show_made_in = true,
    category = "small-fluid-assembly",
    energy_required = 60,
    ingredients = {
      {type="item", name="nullius-leg-augmentation-2", amount=2},
      {type="item", name="nullius-pipe-4", amount=4},
      {type="item", name="nullius-small-pump-2", amount=2},
      {type="item", name="nullius-rubber", amount=8},
      {type="item", name="nullius-speed-module-4", amount=1},
      {type="fluid", name="nullius-compressed-argon", amount=100},
      {type="fluid", name="nullius-lubricant", amount=40}
    },
    result = "nullius-leg-augmentation-3"
  },
  {
    type = "recipe",
    name = "nullius-leg-augmentation-4",
    enabled = false,
    always_show_made_in = true,
    category = "nanotechnology",
    energy_required = 60,
    ingredients = {
      {type="item", name="nullius-leg-augmentation-3", amount=2},
      {type="item", name="nullius-robot-frame-4", amount=1},
      {type="item", name="nullius-levitation-field-2", amount=1},
      {type="item", name="nullius-productivity-module-3", amount=1},
      {type="item", name="nullius-graphene", amount=4}
    },
    result = "nullius-leg-augmentation-4"
  },

  {
    type = "recipe",
    name = "nullius-locomotive-1",
    enabled = false,
    category = "huge-crafting",
    always_show_made_in = true,
    energy_required = 10,
    ingredients = {
      {"nullius-cargo-wagon-1", 1},
      {"nullius-combustion-chamber-1", 1},
      {"nullius-backup-turbine-1", 1},
      {"nullius-motor-1", 4},
      {"nullius-steel-gear", 10},
      {"nullius-glass", 3}
    },
    result = "nullius-locomotive-1"
  },
  {
    type = "recipe",
    name = "nullius-locomotive-2",
    enabled = false,
    category = "huge-crafting",
    always_show_made_in = true,
    energy_required = 10,
    ingredients = {
      {"nullius-locomotive-1", 1},
      {"nullius-cargo-wagon-2", 1},
      {"nullius-combustion-chamber-2", 1},
      {"nullius-standard-turbine-2", 1},
      {"nullius-motor-2", 4},
      {"nullius-sensor-1", 1}
    },
    result = "nullius-locomotive-2"
  },
  {
    type = "recipe",
    name = "nullius-locomotive-3",
    enabled = false,
    always_show_made_in = true,
    category = "huge-crafting",
    energy_required = 15,
    ingredients = {
      {"nullius-locomotive-2", 1},
      {"nullius-combustion-chamber-3", 1},
      {"nullius-standard-turbine-3", 1},
      {"nullius-motor-3", 4},
      {"nullius-speed-module-2", 1}
    },
    result = "nullius-locomotive-3"
  },
  {
    type = "recipe",
    name = "nullius-solar-locomotive",
    enabled = false,
    always_show_made_in = true,
    category = "huge-crafting",
    energy_required = 15,
    ingredients = {
      {"nullius-locomotive-2", 1},
      {"nullius-solar-panel-2", 8},
      {"nullius-grid-battery-2", 2},
      {"nullius-motor-3", 2},
      {"nullius-efficiency-module-2", 1}
    },
    result = "nullius-solar-locomotive"
  },
   {
    type = "recipe",
    name = "nullius-cargo-wagon-1",
    enabled = false,
    category = "large-crafting",
    always_show_made_in = true,
    energy_required = 5,
    ingredients = {
      {"nullius-small-chest-2", 3},
      {"nullius-steel-beam", 4},
      {"nullius-steel-plate", 5},
      {"nullius-steel-rod", 3},
      {"nullius-graphite", 2}
    },
    result = "nullius-cargo-wagon-1"
  },
  {
    type = "recipe",
    name = "nullius-cargo-wagon-2",
    enabled = false,
    category = "large-fluid-assembly",
    always_show_made_in = true,
    energy_required = 6,
    ingredients = {
      {type="item", name="nullius-cargo-wagon-1", amount=1},
      {type="item", name="nullius-large-chest-1", amount=3},
      {type="item", name="nullius-steel-cable", amount=2},
      {type="item", name="nullius-bearing", amount=8},
      {type="item", name="nullius-sensor-1", amount=1},
      {type="fluid", name="nullius-lubricant", amount=20, fluidbox_index=1}
    },
    result = "nullius-cargo-wagon-2"
  },
  {
    type = "recipe",
    name = "nullius-cargo-wagon-3",
    enabled = false,
    category = "large-crafting",
    always_show_made_in = true,
    energy_required = 8,
    ingredients = {
      {type="item", name="nullius-cargo-wagon-2", amount=2},
      {type="item", name="nullius-large-storage-chest-2", amount=2},
      {type="item", name="nullius-carbon-composite", amount=8},
      {type="item", name="nullius-logistic-bot-3", amount=1}
    },
    result = "nullius-cargo-wagon-3"
  },
  {
    type = "recipe",
    name = "nullius-fluid-wagon-1",
    enabled = false,
    category = "large-crafting",
    always_show_made_in = true,
    energy_required = 5,
    ingredients = {
      {"nullius-cargo-wagon-1", 1},
      {"nullius-small-tank-1", 3}
    },
    result = "nullius-fluid-wagon-1"
  },
  {
    type = "recipe",
    name = "nullius-fluid-wagon-2",
    enabled = false,
    category = "large-crafting",
    always_show_made_in = true,
    energy_required = 6,
    ingredients = {
      {"nullius-fluid-wagon-1", 1},
      {"nullius-cargo-wagon-2", 1},
      {"nullius-small-tank-2", 3}
    },
    result = "nullius-fluid-wagon-2"
  },
  {
    type = "recipe",
    name = "nullius-fluid-wagon-3",
    enabled = false,
    always_show_made_in = true,
    category = "large-crafting",
    energy_required = 8,
    ingredients = {
      {"nullius-fluid-wagon-2", 1},
      {"nullius-large-tank-2", 1},
      {"nullius-box-steel-cable", 1}
    },
    result = "nullius-fluid-wagon-3"
  },
  ------------------------------------------------
  {
    type = "recipe",
    name = "nullius-scout-drone-1",
    enabled = false,
    always_show_made_in = true,
    category = "small-crafting",
    energy_required = 4,
    ingredients = {
      {"nullius-robot-frame-2", 1},
      {"nullius-haste-module-1", 1},
      {"nullius-sensor-2", 1},
      {"nullius-missile-1", 1}
    },
    result = "nullius-scout-drone-1"
  },
  {
    type = "recipe",
    name = "nullius-scout-drone-2",
    enabled = false,
    always_show_made_in = true,
    category = "small-crafting",
    energy_required = 5,
    ingredients = {
      {"nullius-scout-drone-1", 2},
      {"nullius-robot-frame-3", 1},
      {"nullius-processor-2", 2}
    },
    result = "nullius-scout-drone-2"
  },
  {
    type = "recipe",
    name = "nullius-scout-remote",
    enabled = false,
    category = "small-crafting",
    always_show_made_in = true,
    no_productivity = true,
    energy_required = 10,
    ingredients = {
      {"nullius-sensor-2", 1},
      {"programmable-speaker", 1}
    },
    result = "nullius-scout-remote"
  },

  {
    type = "recipe",
    name = "nullius-demolition-drone",
    enabled = false,
    always_show_made_in = true,
    category = "small-crafting",
    energy_required = 10,
    ingredients = {
      {"nullius-scout-drone-2", 1},
      {"nullius-missile-launcher", 1},
      {"nullius-box-missile-1", 2}
    },
    result = "nullius-demolition-drone"
  },
  {
    type = "recipe",
    name = "nullius-demolition-remote",
    enabled = false,
    always_show_made_in = true,
    no_productivity = true,
    category = "small-crafting",
    energy_required = 10,
    ingredients = {
      {"nullius-scout-remote", 1},
      {"nullius-processor-1", 1}
    },
    result = "nullius-demolition-remote"
  },

  {
    type = "recipe",
    name = "nullius-excavation-drone",
    enabled = false,
    always_show_made_in = true,
    category = "small-crafting",
    energy_required = 10,
    ingredients = {
      {"nullius-demolition-drone", 1},
      {"nullius-box-missile-2", 1}
    },
    result = "nullius-excavation-drone"
  },
  {
    type = "recipe",
    name = "nullius-excavation-remote",
    enabled = false,
    always_show_made_in = true,
    no_productivity = true,
    category = "small-crafting",
    energy_required = 5,
    ingredients = {
      {"nullius-demolition-remote", 1},
      {"nullius-processor-2", 1}
    },
    result = "nullius-excavation-remote"
  },
  {
    type = "recipe",
    name = "nullius-drone-launcher-1",
    enabled = false,
    category = "huge-crafting",
    always_show_made_in = true,
    energy_required = 20,
    ingredients = {
      {"nullius-sensor-node-1", 1},
      {"nullius-beacon-1", 1},
      {"nullius-hangar-1", 1},
      {"nullius-missile-launcher", 4},
      {"nullius-motor-2", 2},
      {"nullius-bearing", 3}
    },
    result = "nullius-drone-launcher-1"
  },
  {
    type = "recipe",
    name = "nullius-drone-launcher-2",
    enabled = false,
    always_show_made_in = true,
    category = "huge-crafting",
    energy_required = 30,
    ingredients = {
      {"nullius-drone-launcher-1", 2},
      {"nullius-sensor-node-3", 1},
      {"nullius-hangar-2", 1},
      {"nullius-productivity-module-1", 1}
    },
    result = "nullius-drone-launcher-2"
  },
  {
    type = "recipe",
    name = "nullius-drone-carrier-1",
    enabled = false,
    category = "huge-crafting",
    always_show_made_in = true,
    energy_required = 8,
    ingredients = {
      {"nullius-cargo-wagon-2", 1},
      {"nullius-drone-launcher-1", 1}
    },
    result = "nullius-drone-carrier-1"
  },
  {
    type = "recipe",
    name = "nullius-drone-carrier-2",
    enabled = false,
    always_show_made_in = true,
    category = "huge-crafting",
    energy_required = 12,
    ingredients = {
      {"nullius-drone-carrier-1", 1},
      {"nullius-cargo-wagon-3", 1},
      {"nullius-drone-launcher-2", 1}
    },
    result = "nullius-drone-carrier-2"
  },
  {
    type = "recipe",
    name = "nullius-asteroid-miner-1",
    enabled = false,
    always_show_made_in = true,
    category = "huge-crafting",
    energy_required = 120,
    ingredients = {
      {"nullius-satellite", 1},
      {"nullius-box-rocket-fuel", 25},
      {"nullius-excavation-drone", 4},
      {"nullius-medium-miner-3", 6},
      {"nullius-drone-launcher-2", 1},
      {"nullius-box-construction-bot-3", 1},
      {"nullius-box-astronomy-pack", 10},
      {"nullius-large-buffer-chest-2", 8}
    },
    result = "nullius-asteroid-miner-1"
  },
  {
    type = "recipe",
    name = "nullius-asteroid-miner-2",
    enabled = false,
    always_show_made_in = true,
    category = "huge-crafting",
    energy_required = 240,
    ingredients = {
      {"nullius-asteroid-miner-1", 2},
      {"nullius-antimatter", 8},
      {"nullius-turret", 4},
      {"nullius-hangar-3", 1},
      {"nullius-sensor-node-3", 1},
      {"nullius-box-construction-bot-4", 1}
    },
    result = "nullius-asteroid-miner-2"
  },
  {
    type = "recipe",
    name = "nullius-android-1",
    enabled = false,
    always_show_made_in = true,
    category = "nanotechnology",
    energy_required = 200,
    ingredients = {
      {"nullius-chassis-3", 1},
      {"nullius-construction-bot-2", 3},
      {"nullius-leg-augmentation-1", 2},
      {"nullius-productivity-module-1", 4},
      {"nullius-battery-1", 4},
      {"nullius-solar-panel-2", 3},
      {"nullius-night-vision-2", 2},
      {"nullius-hangar-2", 1},
      {"express-stack-filter-inserter", 4}
    },
    result = "nullius-android-1"
  },
  {
    type = "recipe",
    name = "nullius-android-2",
    enabled = false,
    always_show_made_in = true,
    category = "nanotechnology",
    energy_required = 300,
    ingredients = {
      {"nullius-android-1", 1},
      {"nullius-chassis-5", 1},
      {"nullius-construction-bot-4", 2},
      {"nullius-leg-augmentation-3", 1},
      {"nullius-box-processor-3", 1},
      {"nullius-efficiency-module-3", 2},
      {"nullius-battery-2", 4},
      {"nullius-solar-panel-3", 3},
      {"nullius-heat-pipe-3", 2},
      {"nullius-hangar-3", 1}
    },
    result = "nullius-android-2"
  },
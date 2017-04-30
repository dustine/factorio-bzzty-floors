-- entity
require 'prototypes.entities.floor-components'

local tile = {
  type = "tile",
  name = "bzzty-floor-floor",
  needs_correction = false,
  minable = {hardness = 0.2, mining_time = 0.5, result = "bzzty-floor-floor"},
  mined_sound = {filename = "__base__/sound/deconstruct-bricks.ogg"},
  collision_mask = {"ground-tile"},
  walking_speed_modifier = 1.4,
  layer = 65,
  decorative_removal_probability = 0.25,
  variants = {
    main = {{
      picture = "__BzztyFloor__/graphics/entities/floor-tile/main-1.png",
      count = 1,
      size = 1
    },{
      picture = "__BzztyFloor__/graphics/entities/floor-tile/main-2.png",
      count = 1,
      size = 2,
      probability = 0.39,
    },{
      picture = "__BzztyFloor__/graphics/entities/floor-tile/main-4.png",
      count = 1,
      size = 4,
      probability = 1,
    }},
    inner_corner = {
      picture = "__BzztyFloor__/graphics/entities/floor-tile/inner-corner.png",
      count = 1
    },
    outer_corner = {
      picture = "__BzztyFloor__/graphics/entities/floor-tile/outer-corner.png",
      count = 1
    },
    side = {
      picture = "__BzztyFloor__/graphics/entities/floor-tile/side.png",
      count = 1
    },
    u_transition = {
      picture = "__BzztyFloor__/graphics/entities/floor-tile/u.png",
      count = 1
    },
    o_transition = {
      picture = "__BzztyFloor__/graphics/entities/floor-tile/o.png",
      count = 1
    }
  },
  walking_sound = {{
    filename = "__base__/sound/walking/concrete-01.ogg",
    volume = 1.2
  },{
    filename = "__base__/sound/walking/concrete-02.ogg",
    volume = 1.2
  },{
    filename = "__base__/sound/walking/concrete-03.ogg",
    volume = 1.2
  },{
    filename = "__base__/sound/walking/concrete-04.ogg",
    volume = 1.2
  }},
  map_color={r=50, g=50, b=50},
  ageing=0,
  vehicle_friction_modifier = 0.8
}

local item = {
  type = "item",
  name = "bzzty-floor-floor",
  icon = "__BzztyFloor__/graphics/entities/floor-icon.png",
  flags = {"goes-to-quickbar"},
  subgroup = "defensive-structure",
  order = "a[wall]-b[gate]",
  -- place_result = "bzzty-floor-floor-bolt",
  stack_size = 50,
  place_as_tile = {
    result = "bzzty-floor-floor",
    condition_size = 4,
    condition = {"water-tile"}
  }
}

local recipe = {
  type = "recipe",
  name = "bzzty-floor-floor",
  energy_required = 5,
  enabled = true,
  ingredients = {
    {"iron-stick", 4},
    {"copper-cable", 4},
    {"steel-plate", 2},
    {"coal", 5},
  },
  result = "bzzty-floor-floor"
}

local technology = {
  type = "technology",
  name = "bzzty-floor-floor",
  icon = "__base__/graphics/technology/concrete.png",
  prerequisites = {"concrete", "electric-energy-distribution-1"},
  unit = {
    count = 300,
    ingredients = {
      {"science-pack-1", 1},
      {"science-pack-2", 1},
    },
    time = 30
  },
  effects = {{
    type = "unlock-recipe",
    recipe = "bzzty-floor-floor"
  }},
  order = "c-c-c"
}

data:extend {tile, item, recipe, technology}
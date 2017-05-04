-- entity
require 'prototypes.entities.exposed-components'

local tile = {
  type = "tile",
  name = "bzzty-floors-exposed",
  needs_correction = false,
  minable = {hardness = 0.2, mining_time = 0.5, result = "bzzty-floors-exposed"},
  mined_sound = {filename = "__base__/sound/deconstruct-bricks.ogg"},
  collision_mask = {"ground-tile"},
  walking_speed_modifier = 1.4,
  layer = 65,
  decorative_removal_probability = 0.25,
  variants = {
    main = {{
      picture = "__BzztyFloors__/graphics/entities/exposed-tile/main-1.png",
      count = 1,
      size = 1
    },{
      picture = "__BzztyFloors__/graphics/entities/exposed-tile/main-2.png",
      count = 1,
      size = 2,
      probability = 0.39,
    },{
      picture = "__BzztyFloors__/graphics/entities/exposed-tile/main-4.png",
      count = 1,
      size = 4,
      probability = 1,
    }},
    inner_corner = {
      picture = "__BzztyFloors__/graphics/entities/exposed-tile/inner-corner.png",
      count = 1
    },
    outer_corner = {
      picture = "__BzztyFloors__/graphics/entities/exposed-tile/outer-corner.png",
      count = 1
    },
    side = {
      picture = "__BzztyFloors__/graphics/entities/exposed-tile/side.png",
      count = 1
    },
    u_transition = {
      picture = "__BzztyFloors__/graphics/entities/exposed-tile/u.png",
      count = 1
    },
    o_transition = {
      picture = "__BzztyFloors__/graphics/entities/exposed-tile/o.png",
      count = 1
    }
  },
  walking_sound = table.deepcopy(data.raw.tile["concrete"].walking_sound),
  map_color={r=50, g=50, b=50},
  ageing=0,
  vehicle_friction_modifier = 0.8
}

local item = {
  type = "item",
  name = "bzzty-floors-exposed",
  icon = "__BzztyFloors__/graphics/entities/exposed-icon.png",
  flags = {"goes-to-quickbar"},
  subgroup = "defensive-structure",
  order = "a[wall]-b[gate]",
  stack_size = 50,
  place_as_tile = {
    result = "bzzty-floors-exposed",
    condition_size = 4,
    condition = {"water-tile"}
  }
}

local recipe = {
  type = "recipe",
  name = "bzzty-floors-exposed",
  energy_required = 5,
  enabled = true,
  ingredients = {
    {"iron-stick", 4},
    {"copper-cable", 4},
    {"steel-plate", 2},
    {"coal", 5},
  },
  result = "bzzty-floors-exposed"
}

local technology = {
  type = "technology",
  name = "bzzty-floors-exposed",
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
    recipe = "bzzty-floors-exposed"
  }},
  order = "c-c-c"
}

data:extend {tile, item, recipe, technology}
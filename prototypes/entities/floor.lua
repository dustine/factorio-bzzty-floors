local entity = {
  type = "gate",
  name = "bzzty-floor-floor",
  icon = "__base__/graphics/icons/gate.png",
  flags = {"placeable-neutral", "placeable-player", "player-creation"},
  fast_replaceable_group = nil,
  minable = {hardness = 0.2, mining_time = 0.5, result = "bzzty-floor-floor"},
  max_health = 350,
  corpse = "small-remnants",
  collision_box = {{-0.1, -0.1}, {0.1, 0.1}},
  selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
  collision_mask = {},
  opening_speed = 0,
  activation_distance = 0,
  timeout_to_close = 0,
  resistances =
  {
    {
      type = "physical",
      decrease = 3,
      percent = 20
    },
    {
      type = "impact",
      decrease = 45,
      percent = 60
    },
    {
      type = "explosion",
      decrease = 10,
      percent = 30
    },
    {
      type = "fire",
      percent = 100
    },
    {
      type = "laser",
      percent = 70
    }
  },
  vertical_animation =
  {
    layers =
    {
      {
        filename = "__base__/graphics/entity/gate/gate-vertical.png",
        line_length = 8,
        width = 21,
        height = 60,
        frame_count = 16,
        shift = {0.015625, -0.40625}
      },
      {
        filename = "__base__/graphics/entity/gate/gate-vertical-shadow.png",
        line_length = 8,
        width = 41,
        height = 50,
        frame_count = 16,
        shift = {0.328125, 0.3},
        draw_as_shadow = true
      }
    }
  },
  horizontal_animation =
  {
    layers =
    {
      {
        filename = "__base__/graphics/entity/gate/gate-horizontal.png",
        line_length = 8,
        width = 32,
        height = 36,
        frame_count = 16,
        shift = {0, -0.21875}
      },
      {
        filename = "__base__/graphics/entity/gate/gate-horizontal-shadow.png",
        line_length = 8,
        width = 62,
        height = 28,
        frame_count = 16,
        shift = {0.4375, 0.46875},
        draw_as_shadow = true
      }
    }
  },
  vertical_base =
  {
    layers =
    {
      {
        filename = "__base__/graphics/entity/gate/gate-base-vertical.png",
        width = 32,
        height = 32
      },
      {
        filename = "__base__/graphics/entity/gate/gate-base-vertical-mask.png",
        width = 32,
        height = 32,
        apply_runtime_tint = true
      }
    }
  },
  horizontal_rail_animation_left =
  {
    layers =
    {
      {
        filename = "__base__/graphics/entity/gate/gate-rail-horizontal-left.png",
        line_length = 8,
        width = 32,
        height = 47,
        frame_count = 16,
        shift = {0, -0.140625 + 0.125}
      },
      {
        filename = "__base__/graphics/entity/gate/gate-rail-horizontal-shadow-left.png",
        line_length = 8,
        width = 73,
        height = 27,
        frame_count = 16,
        shift = {0.078125, 0.171875 + 0.125},
        draw_as_shadow = true
      }
    }
  },
  horizontal_rail_animation_right =
  {
    layers =
    {
      {
        filename = "__base__/graphics/entity/gate/gate-rail-horizontal-right.png",
        line_length = 8,
        width = 32,
        height = 43,
        frame_count = 16,
        shift = {0, -0.203125 + 0.125}
      },
      {
        filename = "__base__/graphics/entity/gate/gate-rail-horizontal-shadow-right.png",
        line_length = 8,
        width = 73,
        height = 28,
        frame_count = 16,
        shift = {0.60938, 0.2875 + 0.125},
        draw_as_shadow = true
      }
    }
  },
  vertical_rail_animation_left =
  {
    layers =
    {
      {
        filename = "__base__/graphics/entity/gate/gate-rail-vertical-left.png",
        line_length = 8,
        width = 22,
        height = 54,
        frame_count = 16,
        shift = {0, -0.46875}
      },
      {
        filename = "__base__/graphics/entity/gate/gate-rail-vertical-shadow-left.png",
        line_length = 8,
        width = 47,
        height = 48,
        frame_count = 16,
        shift = {0.27, -0.16125 + 0.5},
        draw_as_shadow = true
      }
    }
  },
  vertical_rail_animation_right =
  {
    layers =
    {
      {
        filename = "__base__/graphics/entity/gate/gate-rail-vertical-right.png",
        line_length = 8,
        width = 22,
        height = 55,
        frame_count = 16,
        shift = {0, -0.453125}
      },
      {
        filename = "__base__/graphics/entity/gate/gate-rail-vertical-shadow-right.png",
        line_length = 8,
        width = 47,
        height = 47,
        frame_count = 16,
        shift = {0.27, 0.803125 - 0.5},
        draw_as_shadow = true
      }
    }
  },
  vertical_rail_base =
  {
    filename = "__base__/graphics/entity/gate/gate-rail-base-vertical.png",
    line_length = 8,
    width = 64,
    height = 64,
    frame_count = 16,
    shift = {0, 0},
  },
  horizontal_rail_base =
  {
    filename = "__base__/graphics/entity/gate/gate-rail-base-horizontal.png",
    line_length = 8,
    width = 64,
    height = 45,
    frame_count = 16,
    shift = {0, -0.015625 + 0.125},
  },
  vertical_rail_base_mask =
  {
    filename = "__base__/graphics/entity/gate/gate-rail-base-mask-vertical.png",
    width = 63,
    height = 39,
    shift = {0.015625, -0.015625},
    apply_runtime_tint = true
  },
  horizontal_rail_base_mask =
  {
    filename = "__base__/graphics/entity/gate/gate-rail-base-mask-horizontal.png",
    width = 53,
    height = 45,
    shift = {0.015625, -0.015625 + 0.125},
    apply_runtime_tint = true
  },
  horizontal_base =
  {
    layers =
    {
      {
        filename = "__base__/graphics/entity/gate/gate-base-horizontal.png",
        width = 32,
        height = 23,
        shift = {0, 0.125}
      },
      {
        filename = "__base__/graphics/entity/gate/gate-base-horizontal-mask.png",
        width = 32,
        height = 23,
        apply_runtime_tint = true,
        shift = {0, 0.125}
      }
    }
  },
  wall_patch =
  {
    north =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/gate/wall-patch-north.png",
          width = 22,
          height = 35,
          shift = {0, -0.62 + 1}
        },
        {
          filename = "__base__/graphics/entity/gate/wall-patch-north-shadow.png",
          width = 46,
          height = 31,
          shift = {0.3, 0.20 + 1},
          draw_as_shadow = true
        }
      }
    },
    east =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/gate/wall-patch-east.png",
          width = 11,
          height = 40,
          shift = {0.328125 - 1, -0.109375}
        },
        {
          filename = "__base__/graphics/entity/gate/wall-patch-east-shadow.png",
          width = 38,
          height = 32,
          shift = {0.8125 - 1, 0.46875},
          draw_as_shadow = true
        }
      }
    },
    south =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/gate/wall-patch-south.png",
          width = 22,
          height = 40,
          shift = {0, -0.125}
        },
        {
          filename = "__base__/graphics/entity/gate/wall-patch-south-shadow.png",
          width = 48,
          height = 25,
          shift = {0.3, 0.95},
          draw_as_shadow = true
        }
      }
    },
    west =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/gate/wall-patch-west.png",
          width = 11,
          height = 40,
          shift = {-0.328125 + 1, -0.109375}
        },
        {
          filename = "__base__/graphics/entity/gate/wall-patch-west-shadow.png",
          width = 46,
          height = 32,
          shift = {0.1875 + 1, 0.46875},
          draw_as_shadow = true
        }
      }
    }
  },
  vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
  open_sound =
  {
    variations = { filename = "__base__/sound/gate1.ogg", volume = 0.5 },
    aggregation =
    {
      max_count = 1,
      remove = true
    }
  },
  close_sound =
  {
    variations = { filename = "__base__/sound/gate1.ogg", volume = 0.5 },
    aggregation =
    {
      max_count = 1,
      remove = true
    }
  }
}

local item = {
  type = "item",
  name = "bzzty-floor-floor",
  icon = "__base__/graphics/icons/gate.png",
  flags = {"goes-to-quickbar"},
  subgroup = "defensive-structure",
  order = "a[wall]-b[gate]",
  place_result = "bzzty-floor-floor",
  stack_size = 50
}

local recipe = {
  type = "recipe",
  name = "bzzty-floor-floor",
  energy_required = 5,
  category = "crafting-with-fluid",
  enabled = true,
  ingredients = {
    {"iron-stick", 4},
    {"copper-cable", 4},
    {"steel-plate", 2},
    {"stone", 5},
    {type="fluid", name="water", amount=10}
  },
  result = "bzzty-floor-floor"
}

local technology = {
}

data:extend {entity, item, recipe}
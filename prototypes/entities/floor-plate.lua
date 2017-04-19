local null = {
  layers = {{
      filename = "__base__/graphics/entity/gate/gate-vertical.png",
      line_length = 0,
      width = 0,
      height = 0,
      frame_count = 1,
      shift = {0, 0}
    },{
      filename = "__base__/graphics/entity/gate/gate-vertical-shadow.png",
      line_length = 0,
      width = 0,
      height = 0,
      frame_count = 1,
      shift = {0, 0}
    }
  }
}

local plate = {
  type = "gate",
  name = "bzzty-floor-floor-plate",
  icon = "__base__/graphics/icons/gate.png",
  flags = {"player-creation"},
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
  vertical_base = {
    layers = {{
        filename = "__base__/graphics/entity/gate/gate-base-vertical.png",
        width = 32,
        height = 32
      },{
        filename = "__base__/graphics/entity/gate/gate-base-vertical-mask.png",
        width = 32,
        height = 32,
        apply_runtime_tint = true
      }
    }
  },
  horizontal_base = {
    layers = {{
        filename = "__base__/graphics/entity/gate/gate-base-horizontal.png",
        width = 32,
        height = 23,
        shift = {0, 0.125}
      },{
        filename = "__base__/graphics/entity/gate/gate-base-horizontal-mask.png",
        width = 32,
        height = 23,
        apply_runtime_tint = true,
        shift = {0, 0.125}
      }
    }
  },
  vertical_animation = null,
  horizontal_animation = null,
  horizontal_rail_animation_left = null,
  horizontal_rail_animation_right = null,
  vertical_rail_animation_left = null,
  vertical_rail_animation_right = null,
  vertical_rail_base = null.layers[1],
  horizontal_rail_base = null.layers[1],
  vertical_rail_base_mask = null.layers[1],
  horizontal_rail_base_mask = null.layers[1],
  wall_patch = {
    north = null,
    east = null,
    south = null,
    west = null
  },
  vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
  open_sound = {
    variations = { filename = "__base__/sound/gate1.ogg", volume = 0.5 },
    aggregation = {
      max_count = 0,
      remove = true
    }
  },
  close_sound = {
    variations = { filename = "__base__/sound/gate1.ogg", volume = 0.5 },
    aggregation = {
      max_count = 0,
      remove = true
    }
  }
}

return plate
local function laser_turret_extension(inputs)
  return {
    filename = "__BzztyFloor__/graphics/entities/floor-bolt/gun-start.png",
    priority = "medium",
    width = 66,
    height = 67,
    frame_count = inputs.frame_count and inputs.frame_count or 15,
    line_length = inputs.line_length and inputs.line_length or 0,
    run_mode = inputs.run_mode and inputs.run_mode or "forward",
    axially_symmetrical = false,
    direction_count = 4,
    shift = {-0.03125, -0.984375}
  }
end

-- TODO: Make this a deepcopy from electric-beam
local beam = table.deepcopy(data.raw.beam["electric-beam"])
beam.name = "bzzty-floor-floor-bolt-beam"

local bolt = {
  type = "electric-turret",
  name = "bzzty-floor-floor-bolt",
  icons = {{
    icon = "__BzztyFloor__/graphics/entities/floor-icon.png"
  },{
    icon = "__BzztyFloor__/graphics/entities/floor-bolt/icon.png"
  }},
  flags = {"player-creation", "not-on-map"},
  minable = { mining_time = 10, result = "bzzty-floor-floor" },
  max_health = 1000,
  corpse = "medium-remnants",
  dying_explosion = "medium-explosion",
  collision_box = {{-0.5, -0.5}, {0.5, 0.5}},
  selection_box = {{-0.25, -0.25}, {0.25, 0.25}},
  collision_mask = {},
  rotation_speed = 1,
  preparing_speed = 0.01,
  folding_speed = 0.1,
  resistances = {{
    type = "physical",
    decrease = 3,
    percent = 20
  },{
    type = "impact",
    decrease = 45,
    percent = 60
  },{
    type = "explosion",
    decrease = 10,
    percent = 30
  },{
    type = "fire",
    percent = 80
  },{
    type = "laser",
    percent = 70
  }},
  energy_source = {
    type = "electric",
    buffer_capacity = "500kJ",
    input_flow_limit = "2MW",
    drain = "50kW",
    usage_priority = "primary-input"
  },
  folded_animation = {
    layers = {
      laser_turret_extension{frame_count=1, line_length = 1}
    }
  },
  preparing_animation = {
    layers = {
      laser_turret_extension{}
    }
  },
  prepared_animation = {
    layers = {{
      filename = "__BzztyFloor__/graphics/entities/floor-bolt/gun.png",
      line_length = 8,
      width = 68,
      height = 68,
      frame_count = 1,
      axially_symmetrical = false,
      direction_count = 64,
      shift = {-0.03125, -1}
    }}
  },
  folding_animation = {
    layers = {
      laser_turret_extension{run_mode = "backward"}
    }
  },
  base_picture =
  {
    layers = {{
      filename = "__BzztyFloor__/graphics/entities/floor-bolt/base.png",
      priority = "high",
      width = 98,
      height = 82,
      axially_symmetrical = false,
      direction_count = 1,
      frame_count = 1,
      shift = {0.015625, 0.03125}
    },{
      filename = "__BzztyFloor__/graphics/entities/floor-bolt/base-mask.png",
      flags = { "mask" },
      line_length = 1,
      width = 54,
      height = 46,
      axially_symmetrical = false,
      apply_runtime_tint = true,
      direction_count = 1,
      frame_count = 1,
      shift = {-0.046875, -0.109375},
    }}
  },
  attack_parameters = {
    type = "beam",
    ammo_category = "electric",
    cooldown = 60,
    range = 6,
    damage_modifier = 2, --added
    ammo_type = {
      energy_consumption = "200kJ", --added
      category = "combat-robot-beam",
      action = {
        type = "direct",
        action_delivery = {
          type = "beam",
          beam = "bzzty-floor-floor-bolt-beam",
          max_length = 30,
          duration = 60,
          source_offset = {0.15, -0.5},
        }
      }
    }
  },
  call_for_help_radius = 40
}

local wire = {
  type = "electric-pole",
  name = "bzzty-floor-floor-wire",
  icons = {{
    icon = "__BzztyFloor__/graphics/entities/floor-icon.png"
  },{
    icon = "__BzztyFloor__/graphics/entities/floor-wire-icon.png"
  }},
  flags = {"player-creation", "not-on-map"},
  collision_box = {{-0.5, -0.5}, {0.5, 0.5}},
  selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
  collision_mask = {},
  maximum_wire_distance = 1.5,
  supply_area_distance = 0.5,
  pictures = {
    filename = "__BzztyFloor__/graphics/entities/floor-wire-pole.png",
    priority = "high",
    width = 32,
    height = 32,
    direction_count = 1,
  },
  connection_points = {{
    shadow = {
      copper = {2.55, 0.4},
      green = {2.0, 0.4},
      red = {3.05, 0.4}
    },
    wire = {
      copper = {-0.03125, -2.46875},
      green = {-0.34375, -2.46875},
      red = {0.25, -2.46875}
    }
  }},
  radius_visualisation_picture = {
    filename = "__base__/graphics/entity/small-electric-pole/electric-pole-radius-visualization.png",
    width = 12,
    height = 12,
    priority = "extra-high-no-scale"
  }
}

data:extend {beam, bolt, wire}
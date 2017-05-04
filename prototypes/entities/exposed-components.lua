local function laser_turret_extension(inputs)
  return {
    filename = "__BzztyFloors__/graphics/entities/exposed-turret/gun-start.png",
    priority = "medium",
    width = 32,
    height = 32,
    frame_count = inputs.frame_count and inputs.frame_count or 15,
    line_length = inputs.line_length and inputs.line_length or 0,
    run_mode = inputs.run_mode and inputs.run_mode or "forward",
    axially_symmetrical = false,
    direction_count = 1,
    -- shift = {-0.03125, -0.984375}
  }
end

-- TODO: Make this a deepcopy from electric-beam
local beam = table.deepcopy(data.raw.beam["electric-beam"])
beam.name = "bzzty-floors-exposed-turret-beam"
beam.damage_interval = 20
beam.action = {
  type = "direct",
  action_delivery = {
    type = "instant",
    target_effects = {{
      type = "damage",
      damage = {amount = 10, type = "electric"}
    }}
  }
}

local turret = {
  type = "electric-turret",
  name = "bzzty-floors-exposed-turret",
  localised_name = {"entity-name.bzzty-floors-exposed"},
  localised_description = {"entity-description.bzzty-floors-exposed"},
  icons = {{
    icon = "__BzztyFloors__/graphics/entities/exposed-icon.png"
  },{
    icon = "__BzztyFloors__/graphics/entities/exposed-turret/icon.png"
  }},
  flags = {"player-creation", "not-on-map"},
  minable = { mining_time = 10, result = "bzzty-floors-exposed" },
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
    decrease = 8,
    percent = 80
  },{
    type = "impact",
    percent = 100
  },{
    type = "explosion",
    percent = 30
  },{
    type = "fire",
    percent = 30
  },{
    type = "laser",
    percent = 60
  }},
  energy_source = {
    type = "electric",
    buffer_capacity = "200kJ",
    input_flow_limit = "1MW",
    drain = "10kW",
    usage_priority = "primary-input"
  },
  folded_animation = {
    layers = {
      laser_turret_extension{frame_count=1, line_length=1}
    }
  },
  preparing_animation = {
    layers = {
      laser_turret_extension{}
    }
  },
  prepared_animation = {
    layers = {{
      filename = "__BzztyFloors__/graphics/entities/exposed-turret/gun.png",
      line_length = 16,
      width = 32,
      height = 32,
      frame_count = 1,
      axially_symmetrical = false,
      direction_count = 1,
    }}
  },
  folding_animation = {
    layers = {
      laser_turret_extension{run_mode="backward"}
    }
  },
  base_picture =
  {
    layers = {{
      filename = "__BzztyFloors__/graphics/entities/exposed-turret/base-mask.png",
      flags = { "mask" },
      line_length = 1,
      width = 32,
      height = 32,
      axially_symmetrical = false,
      apply_runtime_tint = true,
      direction_count = 1,
      frame_count = 1,
      -- shift = {-0.046875, -0.109375},
    },{
      filename = "__BzztyFloors__/graphics/entities/exposed-turret/base.png",
      priority = "high",
      width = 32,
      height = 32,
      axially_symmetrical = false,
      direction_count = 1,
      frame_count = 1,
      -- shift = {0.015625, 0.03125}
    }}
  },
  attack_parameters = {
    type = "beam",
    ammo_category = "electric",
    cooldown = 20,
    range = 5,
    damage_modifier = 2, --added
    ammo_type = {
      energy_consumption = "200kJ", --added
      category = "combat-robot-beam",
      action = {
        type = "direct",
        action_delivery = {
          type = "beam",
          beam = "bzzty-floors-exposed-turret-beam",
          max_length = 20,
          duration = 20,
          -- source_offset = {0.15, -0.5},
        }
      }
    }
  },
  call_for_help_radius = 20
}

local pole = {
  type = "electric-pole",
  name = "bzzty-floors-exposed-pole",
  localised_name = {"entity-name.bzzty-floors-exposed"},
  localised_description = {"entity-description.bzzty-floors-exposed"},
  icons = {{
    icon = "__BzztyFloors__/graphics/entities/exposed-icon.png"
  },{
    icon = "__BzztyFloors__/graphics/entities/exposed-pole-icon.png"
  }},
  flags = {"player-creation", "not-on-map"},
  collision_box = {{-0.5, -0.5}, {0.5, 0.5}},
  selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
  collision_mask = {},
  maximum_wire_distance = 1.5,
  supply_area_distance = 0.5,
  pictures = {
    filename = "__BzztyFloors__/graphics/entities/exposed-pole.png",
    priority = "high",
    width = 32,
    height = 32,
    direction_count = 1,
  },
  connection_points = {{
    shadow = {
      copper = {0, 0},
      green = {-0.4, -0.4},
      red = {0.4, 0.4}
    },
    wire = {
      copper = {0, 0},
      green = {-0.4, -0.4},
      red = {0.4, 0.4}
    }
  }},
  radius_visualisation_picture = table.deepcopy(data.raw["electric-pole"]["medium-electric-pole"].radius_visualisation_picture)
}

data:extend {beam, turret, pole}
local function laser_turret_extension(inputs)
  return {
    filename = "__base__/graphics/entity/laser-turret/laser-turret-gun-start.png",
    priority = "medium",
    width = 66,
    height = 67,
    frame_count = inputs.frame_count and inputs.frame_count or 15,
    line_length = inputs.line_length and inputs.line_length or 0,
    run_mode = inputs.run_mode and inputs.run_mode or "forward",
    axially_symmetrical = false,
    direction_count = 4,
    shift = {0.0625, -0.984375}
  }
end

local function laser_turret_extension_shadow(inputs)
  return {
    filename = "__base__/graphics/entity/laser-turret/laser-turret-gun-start-shadow.png",
    width = 92,
    height = 50,
    frame_count = inputs.frame_count and inputs.frame_count or 15,
    line_length = inputs.line_length and inputs.line_length or 0,
    run_mode = inputs.run_mode and inputs.run_mode or "forward",
    axially_symmetrical = false,
    direction_count = 4,
    draw_as_shadow = true,
    shift = {1.46875, 0},
  }
end

local function laser_turret_extension_mask(inputs)
  return {
    filename = "__base__/graphics/entity/laser-turret/laser-turret-gun-start-mask.png",
    flags = { "mask" },
    width = 51,
    height = 47,
    frame_count = inputs.frame_count and inputs.frame_count or 15,
    line_length = inputs.line_length and inputs.line_length or 0,
    run_mode = inputs.run_mode and inputs.run_mode or "forward",
    axially_symmetrical = false,
    apply_runtime_tint = true,
    direction_count = 4,
    shift = {0.078125, -1.26563},
  }
end

-- TODO: Make this a deepcopy from electric-beam
local beam = table.deepcopy(data.raw.beam["electric-beam"])
beam.name = "bzzty-floor-floor-electric-beam"

data:extend {beam}

local bolt = {
  type = "electric-turret",
  name = "bzzty-floor-floor-bolt",
  icon = "__base__/graphics/icons/laser-turret.png",
  flags = {"placeable-player", "placeable-enemy", "player-creation"},
  minable = { mining_time = 0.5, result = "bzzty-floor-floor" },
  max_health = 1000,
  corpse = "medium-remnants",
  dying_explosion = "medium-explosion",
  collision_box = {{-0.1, -0.1}, {0.1, 0.1}},
  selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
  collision_mask = {},
  rotation_speed = 1,
  preparing_speed = 0.03,
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
    }
  },
  energy_source = {
    type = "electric",
    buffer_capacity = "801kJ",
    input_flow_limit = "9600kW",
    drain = "24kW",
    usage_priority = "primary-input"
  },
  folded_animation = {
    layers = {
      laser_turret_extension{frame_count=1, line_length = 1},
      laser_turret_extension_shadow{frame_count=1, line_length=1},
      laser_turret_extension_mask{frame_count=1, line_length=1}
    }
  },
  preparing_animation = {
    layers = {
      laser_turret_extension{},
      laser_turret_extension_shadow{},
      laser_turret_extension_mask{}
    }
  },
  prepared_animation = {
    layers = {{
        filename = "__base__/graphics/entity/laser-turret/laser-turret-gun.png",
        line_length = 8,
        width = 68,
        height = 68,
        frame_count = 1,
        axially_symmetrical = false,
        direction_count = 64,
        shift = {0.0625, -1}
      },{
        filename = "__base__/graphics/entity/laser-turret/laser-turret-gun-mask.png",
        flags = { "mask" },
        line_length = 8,
        width = 54,
        height = 44,
        frame_count = 1,
        axially_symmetrical = false,
        apply_runtime_tint = true,
        direction_count = 64,
        shift = {0.0625, -1.3125},
      },{
        filename = "__base__/graphics/entity/laser-turret/laser-turret-gun-shadow.png",
        line_length = 8,
        width = 88,
        height = 52,
        frame_count = 1,
        axially_symmetrical = false,
        direction_count = 64,
        draw_as_shadow = true,
        shift = {1.59375, 0}
      }
    }
  },
  folding_animation = {
    layers = {
      laser_turret_extension{run_mode = "backward"},
      laser_turret_extension_shadow{run_mode = "backward"},
      laser_turret_extension_mask{run_mode = "backward"}
    }
  },
  base_picture =
  {
    layers =
    {
      {
        filename = "__base__/graphics/entity/laser-turret/laser-turret-base.png",
        priority = "high",
        width = 98,
        height = 82,
        axially_symmetrical = false,
        direction_count = 1,
        frame_count = 1,
        shift = { 0.109375, 0.03125 }
      },
      {
        filename = "__base__/graphics/entity/laser-turret/laser-turret-base-mask.png",
        flags = { "mask" },
        line_length = 1,
        width = 54,
        height = 46,
        axially_symmetrical = false,
        apply_runtime_tint = true,
        direction_count = 1,
        frame_count = 1,
        shift = {0.046875, -0.109375},
      },
    }
  },
  vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
  attack_parameters = {
    type = "beam",
    ammo_category = "electric",
    cooldown = 60,
    range = 2.5,
    -- damage_modifier = 4, --added
    ammo_type = {
      energy_consumption = "200kJ", --added
      category = "combat-robot-beam",
      action = {
        type = "direct",
        action_delivery = {
          type = "beam",
          beam = "bzzty-floor-floor-electric-beam",
          max_length = 15,
          duration = 120,
          source_offset = {0.15, -0.5},
        }
      }
    },
    sound = {{
        filename = "__base__/sound/fight/laser-1.ogg",
        volume = 1
      },{
        filename = "__base__/sound/fight/laser-2.ogg",
        volume = 1
      },{
        filename = "__base__/sound/fight/laser-3.ogg",
        volume = 1
      }
    }
  },
  call_for_help_radius = 40
}

return bolt
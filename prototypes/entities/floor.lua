local entityBolt = require 'prototypes.entities.floor-bolt'
local entityPlate = require 'prototypes.entities.floor-plate'
local entityWire = require 'prototypes.entities.floor-wire'

local item = {
  type = "item",
  name = "bzzty-floor-floor",
  icon = "__base__/graphics/icons/gate.png",
  flags = {"goes-to-quickbar"},
  subgroup = "defensive-structure",
  order = "a[wall]-b[gate]",
  place_result = "bzzty-floor-floor-bolt",
  stack_size = 50
}

local recipe = {
  type = "recipe",
  name = "bzzty-floor-floor",
  energy_required = 5,
  -- category = "crafting-with-fluid",
  enabled = true,
  ingredients = {
    {"iron-stick", 4},
    {"copper-cable", 4},
    {"steel-plate", 2},
    {"coal", 5},
    -- {type="fluid", name="water", amount=10}
  },
  result = "bzzty-floor-floor"
}

local technology = {
  type = "technology",
  name = "bzzty-floor-floor",
  icon = "__base__/graphics/technology/concrete.png",
  prerequisites = {"concrete", "electric-energy-distribution-1"},
  unit =
  {
    count = 300,
    ingredients =
    {
      {"science-pack-1", 1},
      {"science-pack-2", 1},
    },
    time = 30
  },
  effects =
  {
    {
      type = "unlock-recipe",
      recipe = "bzzty-floor-floor"
    }
  },
  order = "c-c-c"
}

data:extend {entityPlate, entityWire, entityBolt, item, recipe, technology}
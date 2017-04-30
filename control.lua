-- local Position = require 'stdlib/area/position'
-- local Entity = require 'stdlib/entity/entity'
-- local Area = require 'stdlib/area/area'
require 'stdlib/event/event'
-- require 'stdlib/table'
-- local table_filter = table.filter

local function placeComponents(surface, position, force)
  local wire = surface.create_entity{
    name = "bzzty-floor-floor-wire",
    position = position,
    force = force
  }
  if wire then wire.destructible = false end
  surface.create_entity{
    name = "bzzty-floor-floor-bolt",
    position = position,
    force = force
  }
end

local function finishBuildingTiles(entity, positions)
  for _, position in pairs(positions) do
    local tile = entity.surface.get_tile(position.x, position.y)
    if tile then
      -- short-circuit the event if we're not even dealing with our tile
      if not(tile.name:find("bzzty%-floor%-floor")) then return end
      if tile.valid then placeComponents(entity.surface, position, entity.force) end
    end
  end
end

local function removeComponents(surface, position)
  if not(surface) then return end
  local wire = surface.find_entity("bzzty-floor-floor-wire", position)
  if wire and wire.valid then wire.destroy() end
  local bolt = surface.find_entity("bzzty-floor-floor-bolt", position)
  if bolt and bolt.valid then bolt.destroy() end
end

local function finishRemovingTiles(entity, positions)
  for _, position in pairs(positions) do
    -- we can't be sure the removed tile was our own, so just clean it up
    removeComponents(entity.surface, position)
  end
end

Event.register(defines.events.on_player_built_tile, function(event)
  local player = game.players[event.player_index]
  finishBuildingTiles(player, event.positions)
end)
Event.register(defines.events.on_player_mined_tile, function(event)
  local player = game.players[event.player_index]
  finishRemovingTiles(player, event.positions)
end)
Event.register(defines.events.on_robot_built_tile, function(event)
  finishBuildingTiles(event.robot, event.positions)
end)
Event.register(defines.events.on_robot_mined_tile, function(event)
  finishRemovingTiles(event.robot, event.positions)
end)

Event.register(defines.events.on_entity_died, function(event)
  local entity = event.entity
  if entity.name:find("bzzty%-floor%-floor") then
    local surface = entity.surface
    local position = entity.position
    -- place ghost if required
    local cause_force = event.force or event.cause or nil
    if cause_force and not(cause_force == entity.force) then
      surface.create_entity{
        name="tile-ghost",
        position=position,
        force=entity.force,
        inner_name="bzzty-floor-floor"
      }
    end
    -- remove tile + components
    local hidden_tile = surface.get_hidden_tile(position)
    if hidden_tile then
      surface.set_tiles({{name=hidden_tile, position=position}})
    else
      log("Hidden tile nil, using concrete instead")
      surface.set_tiles({{name="concrete", position=position}})
    end
    removeComponents(surface, position)
  end
end)


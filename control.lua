local Position = require 'stdlib/area/position'
local Surface = require 'stdlib/surface'
local Area = require 'stdlib/area/area'
local Tile = require 'stdlib/area/tile'
require 'stdlib/event/event'
-- require 'stdlib/table'
-- local table_filter = table.filter

local function placeComponents(surface, position, force)
  local center = Position.offset(position, 0.5, 0.5)
  if surface.find_entity("bzzty-floors-exposed-pole", center) then return end
  local pole = surface.create_entity{
    name = "bzzty-floors-exposed-pole",
    position = position,
    force = force
  }
  if pole then pole.destructible = false end
  surface.create_entity{
    name = "bzzty-floors-exposed-turret",
    position = position,
    force = force
  }
end

local function finishBuildingTiles(surface, tiles, force)
  for _, position in pairs(tiles) do
    local tile = surface.get_tile(position.x, position.y)
    if tile then
      -- short-circuit the event if we're not even dealing with our tile
      if not(tile.name:find("bzzty%-floors")) then return end
      if tile.valid then placeComponents(surface, position, force, tile.name) end
    end
  end
end

local function removeAll(surface, area, name)
  for _, entity in pairs(Surface.find_all_entities{
      surface=surface.name,
      area=area,
      name=name
    }) do if entity and entity.valid then entity.destroy() end end
end

local function removeComponents(surface, tile)
  if not(surface) then return end
  removeAll(surface, Tile.to_area(tile), "bzzty-floors-exposed-pole")
  -- removeAll(surface, position, "bzzty-floors-insulated-pole")
  removeAll(surface, Tile.to_area(tile), "bzzty-floors-exposed-turret")
end

local function finishRemovingTiles(surface, tiles)
  for _, tile in pairs(tiles) do
    -- we can't be sure the removed tile was our own, so just clean it up
    removeComponents(surface, tile)
  end
end

local function removeTile(surface, position)
  -- remove tile + components
  local hidden_tile = surface.get_hidden_tile(position)
  if hidden_tile then
    surface.set_tiles({{name=hidden_tile, position=position}})
  else
    surface.set_tiles({{name="grass", position=position}})
  end
end


Event.register(defines.events.on_player_built_tile, function(event)
  local player = game.players[event.player_index]
  finishBuildingTiles(player.surface, event.positions, player.force)
end)
Event.register(defines.events.on_player_mined_tile, function(event)
  local player = game.players[event.player_index]
  finishRemovingTiles(player.surface, event.positions)
end)
Event.register(defines.events.on_robot_built_tile, function(event)
  finishBuildingTiles(event.robot.surface, event.positions, event.robot.force)
end)
Event.register(defines.events.on_robot_mined_tile, function(event)
  finishRemovingTiles(event.robot.surface, event.positions)
end)

Event.register(defines.events.on_player_mined_entity, function(event)
  if event.entity.name:find("bzzty%-floors") then
    local tile = Tile.from_position(event.entity.position)
    removeTile(event.entity.surface, tile)
    removeComponents(event.entity.surface, tile)
  end
end)

Event.register(defines.events.on_entity_died, function(event)
  if event.entity.name:find("bzzty%-floors") then
    if event.entity.name == "bzzty-floors-exposed-turret" then
      local surface = event.entity.surface
      local position = event.entity.position
      local force = event.entity.force
      -- place ghost if required
      local cause_force = event.force or event.cause or nil
      if cause_force and not(cause_force == force) then
        surface.create_entity{
          name="tile-ghost",
          position=position,
          force=force,
          inner_name="bzzty-floors-exposed"
        }
      end
      local tile = Tile.from_position(position)
      removeTile(event.entity.surface, tile)
      removeAll(surface, Tile.to_area(tile), "bzzty-floors-exposed-pole")
    else
      error("Unexpected component died: " .. event.entity.name)
      log("BzztyFloors".."Unexpected component died: " .. event.entity.name)
    end
  end
end)

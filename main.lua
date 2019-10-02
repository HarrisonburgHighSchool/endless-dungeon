local Map = require 'core/map'

function love.load()
  map = Map:new(5, 5) -- Create a 5 x 5 map object named "map"
end

function love.update(dt)
  -- Nothing to update
end

function love.draw()
  map:draw()
end

function love.load()
  x = 400
  y = 300
  playerImg = love.graphics.newImage('assets-1/player/base/octopode_1.png')

function love.update(dt)
  if love.keyboard.isDown('w') then   -- if the 'up' key is being pressed...
    y = y - 5
  end
  if love.keyboard.isDown('d') then   -- if the 'up' key is being pressed...
    x = x + 5
  end
  if love.keyboard.isDown('s') then   -- if the 'up' key is being pressed...
    y = y + 5
  end
  if love.keyboard.isDown('a') then   -- if the 'up' key is being pressed...
    x = x - 5
  end
  cobalt = love.graphics.newImage('assets-1/dungeon/floor/black_cobalt_1.png')
  mapTemplate = {
    {cobalt, cobalt, cobalt},
    {cobalt, cobalt, cobalt},
    {cobalt, cobalt, cobalt},
  }

  map = Map:new(mapTemplate)
end

function love.update(dt)
  -- Nothing to update yet
end


function love.draw()
  love.graphics.print('Hi how has your day!', 0, 0)
  love.graphics.print('Hello, world!', 0, 0)
  map:draw()
  love.graphics.draw(playerImg, x, y)
end

function love.load()

    floorTile = love.graphics.newImage('asset.png')
    altar     = love.graphics.newImage('altar-asset.png')
    template = { --a 3 x 3 map with the altar texture in the middle
                 {floorTile, floorTile, floorTile},
                 {floorTile, altar, floorTile},
                 {floorTile, floorTile, floorTile},
               }
    map = Map:new(template)
  end

  function love.update(dt)
    -- Nothing to update
  end
  
  function love.draw()
    map:draw()
  end







local Map = require 'core/map'
local gamera = require 'core/gamera'

function love.load()
  cam = gamera.new(0,0,2000,2000)
  x = 400
  y = 300
  playerImg = love.graphics.newImage('assets-1/player/base/octopode_1.png')
  floortile = love.graphics.newImage('assets-1/dungeon/floor/etched_5.png')
  altar     = love.graphics.newImage('assets-1/monster/demons/hellion.png')
  template = { --a 3 x 3 map with the altar texture in the middle
                {floorTile, floorTile, floorTile},
                {floorTile, altar, floorTile},
                {floorTile, floorTile, floorTile},
              }
map = Map:new(template)
end

function love.update(dt)
  -- Nothing update
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
cam:setPosition(x,y)
end

function love.draw()
  cam:draw(function(l, t, w, h)
    map:draw()
    love.graphics.print('Hi how has your day!', 0, 0)
    love.graphics.draw(playerImg, x, y)
end)
end

local Map = require 'core/map'
local gamera = require 'core/gamera'

function love.load()
  cam = gamera.new(0,0,2000,2000)
  map = Map:new(20,20) -- Create a 5 x 5 map object named "map"
  x = 400
  y = 300
  playerImg = love.graphics.newImage('assets-1/player/base/octopode_1.png')
end

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
cam:setPosition(x,y)
end

function love.draw()
  cam:draw(function(l, t, w, h)
    map:draw()
    love.graphics.print('Hi how has your day!', 0, 0)
    love.graphics.draw(playerImg, x, y)
end)
end
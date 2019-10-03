local Map = require 'core/map'
function love.load()
  x = 400
  y = 300
  playerImg = love.graphics.newImage('assets-1/player/base/octopode_1.png')
end
function love.update(dt)
  if love.keyboard.isDown('right')then -- if the 'up' key is being pressed
    x = x + 10
  end
  if love.keyboard.isDown('left')then -- if the 'up' key is being pressed
    x = x - 15
  end
  if love.keyboard.isDown('down')then -- if the 'up' key is being pressed
    y = y + 15
end
if love.keyboard.isDown('up')then -- if the 'up' key is being pressed
  y = y - 15
end
 end

function love.draw()
  love.graphics.print('Hello, world!', 10, 10)
  love.graphics.draw(playerImg, x, y)
  map:draw()
end
map = Map:new(10, 10) -- Create a 10 x 10 map object named "map"




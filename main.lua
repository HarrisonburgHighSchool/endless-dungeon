local Map = require 'core/map'
playerImg = love.graphics.newImage('assets-1/player/base/octopode_1.png')
function love.load()
  x = 400
  y = 300
end
function love.update(dt)
  if love.keyboard.isDown('right')then -- if the 'up' key is being pressed
    x = x + 15
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
  playerImg = love.graphics.draw('assets-1/dungeon/floor/black_cobalt_12.png')
  love.graphics.draw(playerImg, 0, 0)
  love.graphics.draw('assets-1/player/base/octopode_1.png')
  map:draw()
end
map = Map:new(10, 10) -- Create a 10 x 10 map object named "map"




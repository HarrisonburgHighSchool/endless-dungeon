local Map = require 'core/map'

function love.load()
  x = 400
  y = 300
  playerImg = love.graphics.newImage('assets-1/player/base/octopode_1.png')
  cobalt = love.graphics.newImage('assets')
x = 400
y = 100
fountain = love.graphics.newImage('assets-2/dc-dngn/dngn_blue_fountain.png')
end

function love.update(dt)
  if love.keyboard.isDown('right') then   -- if the 'right' key is being pressed...
    x = x + 15
  end
  if love.keyboard.isDown('left') then   -- if the 'left' key is being pressed...
    x = x - 15
  end
  if love.keyboard.isDown('up') then   -- if the 'up' key is being pressed...
    y = y - 15
  end
  if love.keyboard.isDown('down') then   -- if the 'down' key is being pressed...
    y = y + 15
  end
end

function love.update(dt)
  -- Nothing to update yet
end

function love.draw()
  love.graphics.print('Hello, world!', 0, 0)
  map:draw()
  love.graphics.draw(playerImg, x, y)
  love.graphics.draw(fountain, x, y)
end


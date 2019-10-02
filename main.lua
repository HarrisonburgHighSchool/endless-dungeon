
function love.load()
  x = 400
  y = 300
  playerImg = love.graphics.newImage('assets-1/player/base/gargoyle_male.png')
end

local Map = require 'core/map'

function love.load()
  map = Map:new(5, 5) -- Create a 5 x 5 map object named "map"
end

map = love.graphics.newImage('asset.png')







  map = Map:new(template)
end

function love.update(dt)
  if love.keyboard.isDown('up') and y > 0 then   -- if the 'up' key is being pressed...
    y = y - 10
  end
  if love.keyboard.isDown('down')then   -- if the 'down' key is being pressed...
    y = y + 10
  end
  if love.keyboard.isDown('left') then   -- if the 'left' key is being pressed...
    x = x - 10
  end
  if love.keyboard.isDown('right') then   -- if the 'right' key is being pressed...
    x = x + 10
  end
end


function love.draw()
  love.graphics.print('Hello, world!', 0, 0)
  love.graphics.draw(playerImg, x, y)
end


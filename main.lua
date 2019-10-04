local Map = require 'core/map'

function love.load()
  
  x = 400
  y = 300
  playerImg = love.graphics.newImage('assets-1/player/base/gargoyle_male.png')


Cobalt = love.graphics.newImage('assets-1/dungeon/floor/black_cobalt_4.png')
  Cobalt = love.graphics.newImage('assets-1/dungeon/floor/black_cobalt_4.png')
  template = { --a 3 x 3 map with the altar texture in the middle
            {Cobalt, Cobalt, Cobalt},
            {Cobalt, Cobalt, Cobalt},
            {Cobalt, Cobalt, Cobalt},
             }
  

map = Map:new(template)
            end

function love.update(dt)
  if love.keyboard.isDown('up') and y > 0 then   -- if the 'up' key is being pressed...
    y = y - 10
  end
  if love.keyboard.isDown('down') and y > 0 then   -- if the 'down' key is being pressed...
    y = y + 10
  end
  if love.keyboard.isDown('left') and x > 0 then   -- if the 'left' key is being pressed...
    x = x - 10
  end
  if love.keyboard.isDown('right') and x > 0 then   -- if the 'right' key is being pressed...
    x = x + 10
  end
end

function love.draw()
  map:draw()
  love.graphics.print('Hello, world!', 0, 0)
  love.graphics.draw(playerImg, x, y)
  --map = Map:new(50, 50) -- Create a 5 x 5 map object named "map"
end



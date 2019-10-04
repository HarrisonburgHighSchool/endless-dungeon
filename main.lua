local Map = require 'core/map'
function love.load()
  map = Map:new(10, 8) -- Create a 5 x 5 map object named "map"
  x = 400
  y = 300
  playerImg = love.graphics.newImage('assets-1/monster/dragons/quicksilver_dragon.png')
  cobalt = love.graphics.newImage('assets-1/dungeon/floor/black_cobalt_12.png')
  
  template = { --a 13 x 10 map with the altar texture in the middle
               {cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt},
               {cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt},
               {cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt},
               {cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt},
               {cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt},
               {cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt},
               {cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt},
               {cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt},
               {cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt},
               {cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt},
             }
  map = Map:new(template)
end

function love.update(dt)
  if love.keyboard.isDown('right') then   -- if the 'up' key is being pressed...
    x = x + 1
  end
  if love.keyboard.isDown('down') then   -- if the 'up' key is being pressed...
    y = y + 1
  end
  if love.keyboard.isDown('left') then   -- if the 'up' key is being pressed...
    x = x - 1
  end
  if love.keyboard.isDown('up') then   -- if the 'up' key is being pressed...
    y = y - 1
  end
end

function love.draw()
  map:draw()
  love.graphics.print('Hello, world!', 0, 0)
  love.graphics.draw(playerImg, x, y)
end

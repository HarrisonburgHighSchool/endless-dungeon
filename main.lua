local Map = require 'core/map'
local Util = require 'core/util'
function love.load()
  map = Map:new(40, 40) -- Create a 5 x 5 map object named "map"
  x = 400
  y = 300
  playerImg = love.graphics.newImage('assets-1/monster/dragons/quicksilver_dragon.png')
  cobalt = love.graphics.newImage('assets-1/dungeon/floor/black_cobalt_12.png')
  wall = love.graphics.newImage('assets-1/dungeon/wall/stone_2_dark0.png')
  w = 64
  h = 64
  hp = 100
  template = { --a 12 x 9 map with the altar texture in the middle
               {wall, wall, wall, wall, wall, wall, wall, wall, wall, wall},
               {wall, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, wall},
               {wall, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, wall},
               {wall, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, wall},
               {wall, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, wall},
               {wall, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, wall},
               {wall, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, wall},
               {wall, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, wall},
               {wall, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, wall},
               {wall, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, wall},
               {wall, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, wall},
               {wall, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, wall},
               {wall, wall, wall, wall, wall, wall, wall, wall, wall, wall},
              }
  map = Map:new(template)
end




function love.update(dt)
  if love.keyboard.isDown('right') and x < 730 then   -- if the 'up' key is being pressed...
    x = x + 1
  end
  if love.keyboard.isDown('down') y < 0 then   -- if the 'up' key is being pressed...
    y = y + 1
  end
  if love.keyboard.isDown('left') and x > 64 then   -- if the 'up' key is being pressed...
    x = x - 1
  end
  if love.keyboard.isDown('up') y > then   -- if the 'up' key is being pressed...
    y = y - 1
  end
  -- x, y, w, h all represent the player's rectangle. The other values are a rectangle in the upper corner
  if cc(x, y, w, h,   0, 0, 64, 64) then  
    -- if true, decrease HP:
    hp = hp + 1
  end
end





function love.draw()
  map:draw()
  love.graphics.print(hp, 0, 0)
  love.graphics.draw(playerImg, x, y)
  love.graphics.rectangle('line', 0, 0, 64, 64)
end

local Map = require 'core/map'

local Util = require 'core/util'

function love.load()
  
  x = 400
  y = 300
  playerImg = love.graphics.newImage('assets-1/player/base/gargoyle_male.png')
  w = 64   -- The player's width is 64
  h = 64   -- The player's height is 64
  hp = 100 -- Set the player's HP to 100 at the start of the game
end

Cobalt = love.graphics.newImage('assets-1/dungeon/floor/black_cobalt_4.png')
  Cobalt = love.graphics.newImage('assets-1/dungeon/floor/black_cobalt_4.png')
  template = { --a 3 x 3 map with the altar texture in the middle
            {Cobalt, Cobalt, Cobalt, Cobalt, Cobalt, Cobalt, Cobalt},
            {Cobalt, Cobalt, Cobalt, Cobalt, Cobalt, Cobalt, Cobalt},
            {Cobalt, Cobalt, Cobalt, Cobalt, Cobalt, Cobalt, Cobalt},
            {Cobalt, Cobalt, Cobalt, Cobalt, Cobalt, Cobalt, Cobalt},
            {Cobalt, Cobalt, Cobalt, Cobalt, Cobalt, Cobalt, Cobalt},
            {Cobalt, Cobalt, Cobalt, Cobalt, Cobalt, Cobalt, Cobalt},
            {Cobalt, Cobalt, Cobalt, Cobalt, Cobalt, Cobalt, Cobalt},
             }
  

map = Map:new(template)
            

function love.update(dt)
  if love.keyboard.isDown('up') and y > 0 then   -- if the 'up' key is being pressed...
    y = y - 10
  end
  if love.keyboard.isDown('down')  then   -- if the 'down' key is being pressed...
    y = y + 10
  end
  if love.keyboard.isDown('left') and x > 0 then   -- if the 'left' key is being pressed...
    x = x - 10
  end
  if love.keyboard.isDown('right')  then   -- if the 'right' key is being pressed...
    x = x + 10
  end
  
   if cc(x, y, w, h,   0, 0, 64, 64) then  
    -- if true, decrease HP:
    hp = hp - 1
  end
end

function love.draw()
  map:draw()
  
  
  love.graphics.draw(playerImg, x, y)
  
  love.graphics.rectangle('line', 50, 50, 64, 64)
  
  love.graphics.print(hp, 0, 0)
end



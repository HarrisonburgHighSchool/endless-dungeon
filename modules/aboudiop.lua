ocal Map = require 'core/map'

local Util = require 'core/util'

function love.load()
  
  x = 400
  y = 300
  playerImg = love.graphics.newImage('assets-1/player/base/gargoyle_male.png')

  ex = 100
  ey = 200
  eimg = love.graphics.newImage('assets-1/player/base/octopode_2.png')

  
  w = 67   -- The player's width is 67
  h = 67   -- The player's height is 67
  hp = 100 -- Set the player's HP to 100 at the start of the game

alive = true

end

Cobalt = love.graphics.newImage('assets-1/dungeon/floor/black_cobalt_4.png')
  Cobalt = love.graphics.newImage('assets-1/dungeon/floor/black_cobalt_4.png')
  template = { --a 3 x 3 map with the altar texture in the middle
            {Cobalt, Cobalt, Cobalt, Cobalt, Cobalt, Cobalt, Cobalt, Cobalt, Cobalt, Cobalt},
            {Cobalt, nil, nil, nil, nil, nil, nil, nil, nil, Cobalt},
            {Cobalt, Cpbalt, nil, nil, nil, nil, nil, nil, nil, Cobalt},
            {Cobalt, nil, nil, nil, nil, nil, nil, Cobalt, Cobalt, Cobalt},
            {Cobalt, nil, nil, nil, nil, nil, nil, nil, nil, Cobalt},
            {Cobalt, nil, nil, nil, nil, nil, nil, nil, nil, Cobalt},
            {Cobalt, nil, nil, nil, nil, nil, nil, nil, nil, Cobalt},
            {Cobalt, nil, nil, nil, nil, nil, nil, nil, nil, Cobalt},
            {Cobalt, nil, nil, Cobalt, Cobalt, nil, nil, nil, nil, Cobalt},
            {Cobalt, nil, nil, Cobalt, Cobalt, nil, nil, nil, nil, Cobalt},
            {Cobalt, nil, nil, nil, nil, nil, nil, nil, nil, Cobalt},
            {Cobalt, nil, nil, nil, nil, nil, nil, nil, nil, Cobalt},
            {Cobalt, Cobalt, Cobalt, Cobalt, Cobalt, Cobalt, Cobalt, Cobalt, Cobalt, Cobalt},
            
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

  ex = ex + 1
  
   if cc(x, y, w, h,   0, 0, 67, 67) then  
    -- if true, decrease HP:
    hp = hp - 1
  end
end

function love.draw()
  map:draw()
  
  if alive == true then
    love.graphics.draw(playerImg, x, y)
  end
  if hp <= 0 then
    alive = false
  end
  love.graphics.rectangle('line', 50, 50, 67, 67)
  
  love.graphics.print(hp, 0, 0) 

  love.graphics.draw(eimg, ex, ey)

  
  

  
  
end



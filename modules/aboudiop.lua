local Map = require 'core/map'

local Util = require 'core/util'

function love.load()
  
  x = 400
  y = 300
  playerImg = love.graphics.newImage('assets-1/player/base/gargoyle_male.png')

  ex = 100
  ey = 200
  eimg = love.graphics.newImage('assets-1/player/base/octopode_2.png')

  cx = 500
  cy = 400
  cimg = love.graphics.newImage('assets-1/item/gold/gold_pile_1.png')

  c2x = 100
  c2x = 700
  c2img = love.graphics.newImage('assets-1/item/gold/gold_pile_1.png')



  
  w = 67   -- The player's width is 67
  h = 67   -- The player's height is 67
  hp = 100 -- Set the player's HP to 100 at the start of the game

alive = true

endGame = false

end

Cobalt = love.graphics.newImage('assets-1/dungeon/floor/black_cobalt_4.png')
  Cobalt = love.graphics.newImage('assets-1/dungeon/floor/black_cobalt_4.png')
  Door = love.graphics.newImage('assets-1/dungeon/doors/runed_door.png')
  template = { --a 3 x 3 map with the altar texture in the middle
            {Cobalt, Cobalt, Cobalt, Cobalt, Door, Cobalt, Cobalt, Cobalt, Cobalt, Cobalt},
            {Cobalt, nil, nil, nil, nil, nil, nil, nil, nil, Cobalt},
            {Cobalt, nil, nil, nil, nil, nil, nil, nil, nil, Cobalt},
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
  if love.keyboard.isDown('up') or love.keyboard.isDown('w') and y > 0 then   -- if the 'up' key is being pressed...
    y = y - 4
  end
  if love.keyboard.isDown('down') or love.keyboard.isDown('s') then   -- if the 'down' key is being pressed...
    y = y + 4
  end
  if love.keyboard.isDown('left') or love.keyboard.isDown('a') and x > 0 then   -- if the 'left' key is being pressed...
    x = x - 4
  end
  if love.keyboard.isDown('right') or love.keyboard.isDown('d') then   -- if the 'right' key is being pressed...
    x = x + 4
  end
  

  ex = ex + 1
  
   if cc(x, y, w, h,   0, 0, 67, 67) then  
    -- if true, decrease HP:
    hp = hp - 1
  end

  if cc(x, y, w, h,   0, 0, 67, 67) then
  endGame = true
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

  love.graphics.draw(cimg, cx, cy)

  love.graphics.draw(c2img, c2x, c2y)





  
  

  
  
end



local Map = require 'core/map'

local Util = require 'core/util'

function love.load()
  
collision = true
collision2 = true
collision3 = true





  x = 400
  y = 300
  playerImg = love.graphics.newImage('assets-1/player/base/gargoyle_male.png')

  ex = 100
  ey = 200
  dir = 'left'
  eimg = love.graphics.newImage('assets-1/player/base/octopode_2.png')

  cx = 500
  cy = 400
  cimg = love.graphics.newImage('assets-1/item/gold/gold_pile_1.png')

  c2x = 100
  c2x = 400
  c2img = love.graphics.newImage('assets-1/item/gold/gold_pile_1.png')

  
 openDoor = love.graphics.newImage('assets-1/dungeon/doors/vgate_open_middle.png')
 

  
  w = 67   -- The player's width is 67
  h = 67   -- The player's height is 67
  hp = 100 -- Set the player's HP to 100 at the start of the game

alive = true

endGame = false


Cobalt = love.graphics.newImage('assets-1/dungeon/floor/black_cobalt_4.png')
  Cobalt = love.graphics.newImage('assets-1/dungeon/floor/black_cobalt_4.png')
  Door = love.graphics.newImage('assets-1/dungeon/doors/runed_door.png')
  collision= { 
            {Cobalt, Cobalt, Cobalt, Cobalt,'nil', Cobalt, Cobalt, Cobalt, Cobalt, Cobalt},
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
  

collision = Map:new(collision)


end

function love.update(dt)
  if love.keyboard.isDown('up') or love.keyboard.isDown('w') and y > 0 then   -- if the 'up' key is being pressed...
    if collision:cc(x, y - 1, 64, 64) == false then
      y = y - 4
    end
  end
  if love.keyboard.isDown('down') or love.keyboard.isDown('s') then   -- if the 'down' key is being pressed...
    if collision:cc(x, y + 1, 64, 64) == false then
      y = y + 4
    end
  end
  if love.keyboard.isDown('left') or love.keyboard.isDown('a') and x > 0 then   -- if the 'left' key is being pressed...
    if collision:cc(x - 1, y, 64, 64) == false then
      x = x - 4
    end
  end
  if love.keyboard.isDown('right') or love.keyboard.isDown('d') then   -- if the 'right' key is being pressed...
    if collision:cc(x + 1, y, 64, 64) == false then
      x = x + 4
    end
  end

  if dir == 'left'  then
    ex = ex + 2
  end

  if dir == 'right' then
    ex = ex - 2
  end

  if ex < 10 then
    dir = 'left'
  end

  if ex > 500 then
    dir = 'right'
  end


   
  
   if cc(x, y, 64, 64,   0, 0, 67, 67) then  
    -- if true, decrease HP:
    hp = hp - 1
  end

  
  
  
  if cc(x, y, 64, 64,   170, 170, 64, 64) == true then
    Door = openDoor
  end
 
  if cc(x, y, 64, 64,   170, 170, 64, 64) == true then
  love.exitModule{};
  end






end

function love.draw()
  collision:draw()
  
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


  love.graphics.draw(Door, 0, 256)


  
  

  
  
end



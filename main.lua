

local Map = require 'core/map'
local Util = require 'core/util'

function love.load()
  collide1 = false
  i = 1
  g = 0
 bossdefeated = 1
 x = 500
 y = 300
  x2 = 193
  y2 = 192
  w2 = 192
  h2 = 192
 w = 64
 h = 64
 HP = 100
  playerImg = love.graphics.newImage('assets-1/monster/aquatic/Sonic.png')
  playerImg2 = love.graphics.newImage('assets-1/monster/aquatic/sonic2.png')
  cobble = love.graphics.newImage('assets-1/dungeon/floor/cobble_blood_1.png')
  colbalt = love.graphics.newImage('assets-1/dungeon/floor/black_cobalt_12.png')
  colbalt1 = love.graphics.newImage('assets-1/dungeon/floor/black_cobalt_1.png')
  lava = love.graphics.newImage('assets-2/dc-dngn/floor/lava0.png')
  lava1 = love.graphics.newImage('assets-2/dc-dngn/floor/lava1.png')
  lava2 = love.graphics.newImage('assets-2/dc-dngn/floor/lava2.png')
  lava3 = love.graphics.newImage('assets-2/dc-dngn/floor/lava3.png')
  template = {
              {colbalt, colbalt, colbalt, colbalt, cobble, colbalt, colbalt, colbalt, colbalt,},
              {colbalt, cobble, cobble, cobble, cobble, cobble, cobble, cobble, colbalt},
              {colbalt, cobble, cobble, cobble, cobble, cobble, cobble, cobble, colbalt},
              {colbalt, cobble, cobble, lava2, lava1, lava2, cobble, cobble, colbalt},
              {colbalt, cobble, cobble, lava3, lava2, lava3, cobble, cobble, colbalt},
              {colbalt, cobble, cobble, lava2, lava1, lava2, cobble, cobble, colbalt},
              {colbalt, cobble, cobble, cobble, cobble, cobble, cobble, cobble, colbalt},
              {colbalt, cobble, cobble, cobble, cobble, cobble, cobble, cobble, colbalt},
              {colbalt, cobble, cobble, cobble, cobble, cobble, cobble, cobble, colbalt},
              {colbalt, cobble, cobble, cobble, cobble, cobble, cobble, cobble, colbalt},
              {colbalt, cobble, cobble, cobble, cobble, cobble, cobble, cobble, colbalt},
              
              
              {colbalt, colbalt, colbalt, colbalt, colbalt, colbalt, colbalt, colbalt, colbalt,},
            }

            map = Map:new(template)
  template2 = {
              {colbalt1, colbalt1, colbalt1, colbalt1, cobble, colbalt1, colbalt1, colbalt1, colbalt1,},
              {colbalt1, cobble, cobble, cobble, cobble, cobble, cobble, cobble, colbalt1},
              {colbalt1, cobble, cobble, cobble, cobble, cobble, cobble, cobble, colbalt1},
              {colbalt1, cobble, cobble, lava1, lava, lava1, cobble, cobble, colbalt1},
              {colbalt1, cobble, cobble, lava, lava3, lava2, cobble, cobble, colbalt1},
              {colbalt1, cobble, cobble, lava3, lava, lava3, cobble, cobble, colbalt1},
              {colbalt1, cobble, cobble, cobble, cobble, cobble, cobble, cobble, colbalt1},
              {colbalt1, cobble, cobble, cobble, cobble, cobble, cobble, cobble, colbalt1},
              {colbalt1, cobble, cobble, cobble, cobble, cobble, cobble, cobble, colbalt1},
              {colbalt1, cobble, cobble, cobble, cobble, cobble, cobble, cobble, colbalt1},
              {colbalt1, cobble, cobble, cobble, cobble, cobble, cobble, cobble, colbalt1},
              
              
              {colbalt1, colbalt1, colbalt1, colbalt1, colbalt1, colbalt1, colbalt1, colbalt1, colbalt1,},
            }

            map2 = Map:new(template2)
    
end


function love.update(dt)
 



if(x > 640) then
  x = x - 3
end
if (x < 50 and i == 1) then
x = x + 3
end
if(y > 448) then
  y = y - 3
end
if(y < 60) then
  y = y + 3
end

collide1 = false
  
if love.keyboard.isDown('right') then  
    x = x + 3
   
  end
    if love.keyboard.isDown('left') then  
      x = x - 3
  end
  if love.keyboard.isDown('down') then 
    y = y + 3
end
if love.keyboard.isDown('up') then
   if cc(x, y - 1, w2, h2, w, h) == false then
    y = y - 3
  end
end

if(collide1 == true) then
  HP = HP - 0.1
end
if(HP < 0) then
  HP = 0
end
if(y == 260 and x == 50) then
  x = x + 0
  i = 2
end
if(x > 50) then
i = 1
end
if(g < 20) then
g = g + 0.1
end
if(g > 20) then
  g = 0
end

end



function love.draw()
  if(g < 10) then
    map:draw()
  else
    map2:draw()
  end
  
  if(collide1 == true) then
    love.graphics.draw(playerImg2, x, y)
    
  else
  love.graphics.draw(playerImg, x, y)
  end
 
  love.graphics.print(x, 10, 20)
  love.graphics.print(g, 50, 50)
  love.graphics.print(y, 30 ,30)
  love.graphics.print(HP, 100, 100)
  love.graphics.print(tostring(collide1), 0, 0)

  
end








local Map = require 'core/map'
local Util = require 'core/util'
local gamera = require 'core/gamera'

function love.load()
  cam = gamera.new(0, 0, 2000, 2000)
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
  transp = love.graphics.newImage('assets-1/dungeon/floor/tans.png')
  playerImg = love.graphics.newImage('assets-1/monster/aquatic/Sonic.png')
  playerImg2 = love.graphics.newImage('assets-1/monster/aquatic/sonic2.png')
  cobble = love.graphics.newImage('assets-1/dungeon/floor/cobble_blood_1.png')
  cobble1 = love.graphics.newImage('assets-1/dungeon/floor/cobble_blood_12.png')
  colbalt = love.graphics.newImage('assets-1/dungeon/floor/black_cobalt_12.png')
  colbalt1 = love.graphics.newImage('assets-1/dungeon/floor/black_cobalt_1.png')
  lava = love.graphics.newImage('assets-2/dc-dngn/floor/lava0.png')
  lava1 = love.graphics.newImage('assets-2/dc-dngn/floor/lava1.png')
  lava2 = love.graphics.newImage('assets-2/dc-dngn/floor/lava2.png')
  lava3 = love.graphics.newImage('assets-2/dc-dngn/floor/lava3.png')
  template = {
              {colbalt, colbalt, colbalt, colbalt, cobble, colbalt, colbalt, colbalt, colbalt,},
              {colbalt, cobble, cobble, cobble, cobble, cobble, cobble, cobble, colbalt},
              {colbalt, cobble1, cobble, cobble, cobble, cobble, cobble, cobble, colbalt},
              {colbalt, cobble, cobble, lava2, lava1, lava2, cobble, cobble, colbalt},
              {colbalt, cobble, cobble, lava3, lava2, lava3, cobble, cobble, colbalt},
              {colbalt, cobble, cobble, lava2, lava1, lava2, cobble, cobble1, colbalt},
              {colbalt, cobble, cobble, cobble, cobble, cobble, cobble, cobble, colbalt},
              {colbalt, cobble, cobble, cobble, cobble, cobble, cobble, cobble, colbalt},
              {colbalt, cobble, cobble, cobble, cobble, cobble, cobble, cobble, colbalt},
              {colbalt, cobble, cobble, cobble, cobble, cobble, cobble1, cobble, colbalt},
              {colbalt, cobble, cobble, cobble, cobble, cobble, cobble, cobble, colbalt},
              
              
              {colbalt, colbalt, colbalt, colbalt, colbalt, colbalt, colbalt, colbalt, colbalt,},
            }

            map = Map:new(template)
  template2 = {
              {colbalt1, colbalt1, colbalt1, colbalt1, cobble, colbalt1, colbalt1, colbalt1, colbalt1,},
              {colbalt1, cobble, cobble, cobble, cobble, cobble, cobble, cobble, colbalt1},
              {colbalt1, cobble1, cobble, cobble, cobble, cobble, cobble, cobble, colbalt1},
              {colbalt1, cobble, cobble, lava1, lava, lava1, cobble, cobble, colbalt1},
              {colbalt1, cobble, cobble, lava, lava3, lava2, cobble, cobble, colbalt1},
              {colbalt1, cobble, cobble, lava3, lava, lava3, cobble, cobble1, colbalt1},
              {colbalt1, cobble, cobble, cobble, cobble, cobble, cobble, cobble, colbalt1},
              {colbalt1, cobble, cobble, cobble, cobble, cobble, cobble, cobble, colbalt1},
              {colbalt1, cobble, cobble, cobble, cobble, cobble, cobble, cobble, colbalt1},
              {colbalt1, cobble, cobble, cobble, cobble, cobble, cobble1, cobble, colbalt1},
              {colbalt1, cobble, cobble, cobble, cobble, cobble, cobble, cobble, colbalt1},
              
              
              {colbalt1, colbalt1, colbalt1, colbalt1, colbalt1, colbalt1, colbalt1, colbalt1, colbalt1,},
            }

            map2 = Map:new(template2)
  
template3 = {
            {transp, nil, nil, nil, nil, nil, nil, nil},
            {transp, nil, nil, nil, nil, nil, nil, nil},
            {transp, nil, nil, nil, nil, nil, nil, nil},
            {transp, nil, nil, nil, nil, nil, nil, nil},
            {transp, nil, nil, nil, nil, nil, nil, nil},
            {transp, nil, nil, nil, nil, nil, nil, nil},
            {transp, nil, nil, nil, nil, nil, nil, nil},
            {transp, nil, nil, nil, nil, nil, nil, nil},
            {transp, nil, colbalt, nil, nil, nil, nil, nil},
            {transp, colbalt1, nil, nil, nil, nil, nil, nil},

            }

            map3 = Map:new(template3)
    
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

if cc(x + 3, y, w, h, x2, y2, w2, h2) == false then
  if map3:cc(x + 3, y, w, h) == false then
if love.keyboard.isDown('right') then  
    x = x + 3
   
  end
end
end
if cc(x - 3, y, w, h, x2, y2, w2, h2) == false then
  if map3:cc(x - 3, y, w, h) == false then
    if love.keyboard.isDown('left') then  
      x = x - 3
  end
end
end
  if cc(x, y + 3, w, h, x2, y2, w2, h2) == false then
    if map3:cc(x, y + 3, w, h) == false then
  if love.keyboard.isDown('down') then 
    y = y + 3
end
end
end

   if cc(x, y - 3, w, h, x2, y2, w2, h2) == false then
    if map3:cc(x, y - 3, w, h) == false then
    if love.keyboard.isDown('up') then
    y = y - 3
  end
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
cam:setPosition(x,y)
end







function love.draw()
  cam:draw(function(l, t, w, h)
  
  if(g < 10) then
    map:draw()
  else
    map2:draw()
  end
  map3:draw()

  
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
  love.graphics.draw(playerImg, x, y)
end)
end

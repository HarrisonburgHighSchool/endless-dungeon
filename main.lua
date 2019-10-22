

local Map = require 'core/map'
local Util = require 'core/util'
local gamera = require 'core/gamera'

function love.load()
  cam = gamera.new(0, 0, 2000, 2000)
  collide1 = false
  i = 1
  g = 0
 bossdefeated = false
 x = 64
 y = 254
  x2 = 193
  y2 = 192
  w2 = 192
  h2 = 192
 w = 64
 h = 64
 HP = 100
 ex = 440
 ey = 260
 ew = 32
 eh = 32
 collide2 = false
 bx = 638
 by = 257
 bw = 64
 bh = 64
 attack = false
 bosshealth = 7
 summon = 0
 count = 0
  v = true
  e = love.graphics.newImage('assets-1/monster/demons/blue_devil.png')
  boss = love.graphics.newImage('assets-1/monster/demons/eye1.png')
  boss2 = love.graphics.newImage('assets-1/monster/demons/eye2.png')
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
              {colbalt, cobble, cobble, cobble, cobble, cobble, cobble, cobble, colbalt},
              {colbalt, cobble, cobble, cobble, cobble, cobble, cobble, cobble, colbalt},
              {colbalt, cobble, cobble, cobble, cobble, cobble, cobble, cobble1, colbalt},
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
              {colbalt1, cobble, cobble, cobble, cobble, cobble, cobble, cobble, colbalt1},
              {colbalt1, cobble, cobble, cobble, cobble, cobble, cobble, cobble, colbalt1},
              {colbalt1, cobble, cobble, cobble, cobble, cobble, cobble, cobble1, colbalt1},
              {colbalt1, cobble, cobble, cobble, cobble, cobble, cobble, cobble, colbalt1},
              {colbalt1, cobble, cobble, cobble, cobble, cobble, cobble, cobble, colbalt1},
              {colbalt1, cobble, cobble, cobble, cobble, cobble, cobble, cobble, colbalt1},
              {colbalt1, cobble, cobble, cobble, cobble, cobble, cobble1, cobble, colbalt1},
              {colbalt1, cobble, cobble, cobble, cobble, cobble, cobble, cobble, colbalt1},
              
              
              {colbalt1, colbalt1, colbalt1, colbalt1, colbalt1, colbalt1, colbalt1, colbalt1, colbalt1,},
            }

            map2 = Map:new(template2)
  
template3 = {
            {transp, transp, transp, transp, 'nil', transp, transp, transp},
            {transp, 'nil', 'nil','nil', 'nil', 'nil', 'nil','nil', transp},
            {transp, 'nil', 'nil','nil', 'nil', 'nil', 'nil','nil', transp},
            {transp, 'nil', 'nil','nil', 'nil', 'nil', 'nil','nil', transp},
            {transp, 'nil', 'nil', 'nil','nil', 'nil', 'nil','nil', transp},
            {transp, 'nil', 'nil', 'nil','nil', 'nil', 'nil','nil', transp},
            {transp, 'nil', 'nil', 'nil','nil', 'nil', 'nil','nil', transp},
            {transp, 'nil', 'nil', 'nil','nil', 'nil', 'nil','nil', transp},
            {transp, 'nil', 'nil', 'nil','nil', colbalt, 'nil','nil', transp},
            {transp, 'nil', 'nil', 'nil','nil', 'nil', 'nil','nil', transp},
            {transp, 'nil', 'nil', 'nil','nil', 'nil', 'nil','nil', transp},
            {transp, transp, transp, transp, transp, transp, transp, transp},

            }

            map3 = Map:new(template3)
template4 = {
              {transp, transp, transp, transp, 'nil', transp, transp, transp},
              {transp, 'nil', 'nil','nil', 'nil', 'nil', 'nil','nil', transp},
              {transp, 'nil', 'nil','nil', 'nil', 'nil', 'nil','nil', transp},
              {transp, 'nil', 'nil','nil', 'nil', 'nil', 'nil','nil', transp},
              {transp, 'nil', 'nil', 'nil','nil', 'nil', 'nil','nil', transp},
              {transp, 'nil', 'nil', 'nil','nil', 'nil', 'nil','nil', transp},
              {transp, 'nil', 'nil', 'nil','nil', 'nil', 'nil','nil', transp},
              {transp, 'nil', 'nil', 'nil','nil', 'nil', 'nil','nil', transp},
              {transp, 'nil', 'nil', 'nil', colbalt, colbalt, 'nil','nil', transp},
              {transp, 'nil', 'nil', 'nil','nil', 'nil', 'nil','nil', transp},
              {transp, 'nil', 'nil', 'nil','nil', 'nil', 'nil','nil', transp},
              {transp, transp, transp, transp, transp, transp, transp, transp},
  
              }
 template5 = {
                {transp, transp, transp, transp, 'nil', transp, transp, transp},
                {transp, 'nil', 'nil','nil', 'nil', 'nil', 'nil','nil', transp},
                {transp, 'nil', 'nil','nil', 'nil', 'nil', 'nil','nil', transp},
                {transp, 'nil', 'nil','nil', 'nil', 'nil', 'nil','nil', transp},
                {transp, 'nil', 'nil', 'nil','nil', 'nil', 'nil','nil', transp},
                {transp, 'nil', 'nil', 'nil','nil', 'nil', 'nil','nil', transp},
                {transp, 'nil', 'nil', 'nil','nil', 'nil', 'nil','nil', transp},
                {transp, 'nil', 'nil', 'nil','nil', 'nil', 'nil','nil', transp},
                {transp, 'nil', 'nil', colbalt, colbalt, colbalt, 'nil','nil', transp},
                {transp, 'nil', 'nil', 'nil','nil', 'nil', 'nil','nil', transp},
                {transp, 'nil', 'nil', 'nil','nil', 'nil', 'nil','nil', transp},
                {transp, transp, transp, transp, transp, transp, transp, transp},
    
                }
template6 = {
                  {transp, transp, transp, transp, 'nil', transp, transp, transp},
                  {transp, 'nil', 'nil','nil', 'nil', 'nil', 'nil','nil', transp},
                  {transp, 'nil', 'nil','nil', 'nil', 'nil', 'nil','nil', transp},
                  {transp, 'nil', 'nil','nil', 'nil', 'nil', 'nil','nil', transp},
                  {transp, 'nil', 'nil', 'nil','nil', 'nil', 'nil','nil', transp},
                  {transp, 'nil', 'nil', 'nil','nil', 'nil', 'nil','nil', transp},
                  {transp, 'nil', 'nil', 'nil','nil', colbalt, 'nil','nil', transp},
                  {transp, 'nil', 'nil', 'nil','nil', 'nil','nil','nil', transp},
                  {transp, 'nil', 'nil', colbalt,'nil', colbalt, 'nil','nil', transp},
                  {transp, 'nil', 'nil', 'nil','nil', 'nil', 'nil','nil', transp},
                  {transp, 'nil', 'nil', 'nil','nil', 'nil', 'nil','nil', transp},
                  {transp, transp, transp, transp, transp, transp, transp, transp},
      
                  }
      
                  map4 = Map:new(template4)
    
                map5 = Map:new(template5)
  
              map6 = Map:new(template6)
    
end


function love.update(dt)
 





  collide1 = false


  
    if map3:cc(x + 3, y, w, h) == false then
      if love.keyboard.isDown('right') then  
        x = x + 3
     
   
      end
    end
  
   
  
    
  

  if map3:cc(x - 3, y, w, h) == false then
    if love.keyboard.isDown('left') then  
      x = x - 3
  
    end
  end
  
  if map3:cc(x, y + 3, w, h) == false then
    if love.keyboard.isDown('down') then 
      y = y + 3

    end
  end

   
  if map3:cc(x, y - 3, w, h) == false then
    if love.keyboard.isDown('up') then
      y = y - 3
    end
  end
  if cc(x, y, w, h, ex, ey, ew, eh) == false then
    if x > ex then
      ex = ex + 1
    
    end
  end

if(summon == 1) then
  if cc(x, y, w, h, ex, ey, ew, eh) == false then
    if x < ex then
      ex = ex - 1
    end
  end
end
if(summon == 1) then
  if cc(x, y, w, h, ex, ey, ew, eh) == false then
    if y > ey then
      ey = ey + 1
    end
  end
end
if(summon == 1) then
  if cc(x, y, w, h, ex, ey, ew, eh) == false then
    if y < ey then
      ey = ey - 1
    end
  end
end
if(summon == 1) then
  if cc(x, y, w, h, ex, ey, ew, eh) == true then
    HP = HP - 10
    ex = 10000000
    
    
  end
end

  if(collide1 == true) then
    HP = HP - 0.1
  end
  if(HP < 0) then
    HP = 0
  end

  if(g < 20) then
  g = g + 0.1
  end
  if(g > 20) then
    g = 0
  end

  if love.keyboard.isDown('a') then
    attack = true
  else
    attack = false
  end
  
  if cc(x, y, w, h, bx, by, bw, bh) == true and attack == true then
    bosshealth = bosshealth - 1
    x = 70
    y = 257
  end
if(bosshealth == 0) then
love.exitModule();
end

if bosshealth == 6 and v == true then
  count = count + 0.1
end
if(count > 6) then
  summon = 1
  
end 
if(count > 20) then
v = false
end
  cam:setPosition(x,y)
end





--press a to attack


function love.draw()
  cam:draw(function(l, t, w, h)
  
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
 
  love.graphics.print(x, 400, 20)
  love.graphics.print(g, 50, 50)
  love.graphics.print(y, 400 ,30)
  love.graphics.print(HP, 100, 100)
  love.graphics.print(bosshealth, 400, 50)
  love.graphics.print(tostring(v), 0, 0)
  if(summon == 1) then
  love.graphics.draw(e, ex, ey)
  end
  if(count > 6) then
    map3:draw()
  end
  if(count > 10) then
    map4:draw()
  end
  if(count > 14) then
      map5:draw()
  end
  if(count > 3 and count < 6) then
    love.graphics.draw(boss2, bx, by)
  else
  love.graphics.draw(boss, bx, by)
  end
  love.graphics.draw(playerImg, x, y)
  love.graphics.print(count, 400, 60)
  
end)
end

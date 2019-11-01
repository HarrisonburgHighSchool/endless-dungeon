local Map = require 'core/map'
local gamera = require 'core/gamera'
local Util = require 'core/util'

function love.load()
  cam = gamera.new(0, 0, 2000, 800)
  x = 1
  y = 275
  playerImg = love.graphics.newImage('assets-1/player/base/lorc_male_6.png')
    oct=love.graphics.newImage('assets-1/player/base/octopode_2.png')
    oct2=love.graphics.newImage('assets-1/player/base/octopode_1.png')
    oct3=love.graphics.newImage('assets-1/player/base/octopode_3.png')
    oct4=love.graphics.newImage('assets-1/player/base/octopode_2.png')
    oct5=love.graphics.newImage('assets-1/player/base/octopode_1.png')
    gold=love.graphics.newImage('assets-1/item/gold/gold_pile_25.png')
    axe=love.graphics.newImage('assets-1/item/weapon/battle_axe_5.png')
    rod=love.graphics.newImage('assets-1/item/rod/rod_6.png')
  w=60
  h=60
  hp=100
floorTile = love.graphics.newImage('assets-1/dungeon/floor/sand_1.png')
path = love.graphics.newImage('assets-1/dungeon/floor/mud_0.png')
wall = love.graphics.newImage('assets-1/dungeon/wall/catacombs_1.png')
door = love.graphics.newImage('assets-1/dungeon/doors/vgate_closed_up.png')
openDoor = love.graphics.newImage('assets-1/dungeon/doors/vgate_open_up.png')
z=100
s=100
q=700
c=0
b=0
enemie=100
direction = 'down'
direction2= 'left'
direction3= 'right2'
doorStatus= 'closed'
floor = {
               {floorTile, floorTile, floorTile, floorTile, path, path, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile},
               {floorTile, path, path, floorTile, path, path, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile},
               {floorTile, path, path, floorTile, path, path, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile},
               {floorTile, path, path, floorTile, path, path, path, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile},
               {floorTile, path, path, floorTile, floorTile, path, path, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile},
               {floorTile, path, path, path, path, path, path, floorTile, floorTile, path, path, floorTile, floorTile},
               {floorTile, path, path, path, path, path, path, floorTile, floorTile, path, path, floorTile, floorTile},
               {floorTile, floorTile, floorTile, floorTile, floorTile, path, path, floorTile, floorTile, path, path, floorTile, floorTile},
               {floorTile, floorTile, floorTile, floorTile, floorTile, path, path, path, path, path, path, floorTile, floorTile},
               {floorTile, floorTile, floorTile, floorTile, floorTile, path, path, path, path, path, path, floorTile, floorTile},
               {floorTile, floorTile, floorTile, floorTile, path, path, path, floorTile, floorTile, path, path, floorTile, floorTile},
               {floorTile, floorTile, floorTile, floorTile, path, path, floorTile, floorTile, floorTile, path, path, floorTile, floorTile},
               {floorTile, floorTile, floorTile, floorTile, path, path, floorTile, floorTile, floorTile, path, path, floorTile, floorTile},
               {floorTile, floorTile, floorTile, floorTile, path, path, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile},
               {floorTile, floorTile, floorTile, floorTile, path, path, path, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile},
               {floorTile, floorTile, floorTile, floorTile, floorTile, path, path, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile},
               {floorTile, floorTile, floorTile, floorTile, floorTile, path, path, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile},
               {floorTile, floorTile, floorTile, floorTile, floorTile, path, path, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile},
               {floorTile, floorTile, floorTile, floorTile, floorTile, path, path, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile},
               {floorTile, floorTile, floorTile, floorTile, path, path, path, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile},
               {floorTile, floorTile, floorTile, floorTile, path, path, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile},
               {floorTile, floorTile, floorTile, floorTile, path, path, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile},
               {floorTile, floorTile, floorTile, floorTile, path, path, path, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile},
               {floorTile, floorTile, floorTile, floorTile, floorTile, path, path, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile},
               {floorTile, floorTile, floorTile, floorTile, floorTile, path, path, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile},
               {floorTile, floorTile, floorTile, floorTile, floorTile, path, path, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile},
               {floorTile, floorTile, floorTile, floorTile, floorTile, path, path, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile},
               {floorTile, floorTile, floorTile, floorTile, floorTile, path, path, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile},
               {floorTile, floorTile, floorTile, floorTile, floorTile, path, path, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile},
               {floorTile, floorTile, floorTile,floorTile, path, path, path, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile},
               {floorTile, floorTile, floorTile, floorTile, path, path, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile},
               {floorTile, floorTile, floorTile, floorTile, path, path, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile},
             }

  map = Map:new(floor)



floor2 = {
               {floorTile, floorTile, floorTile, floorTile, 'nil', 'nil', floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile},
               {floorTile, 'nil', 'nil', floorTile, 'nil', 'nil', floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile},
               {floorTile, 'nil', 'nil', floorTile, 'nil', 'nil', floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile},
               {floorTile, 'nil', 'nil', floorTile, 'nil', 'nil', 'nil', floorTile, floorTile, floorTile, floorTile, floorTile, floorTile},
               {floorTile, 'nil', 'nil', floorTile, floorTile, 'nil', 'nil', floorTile, floorTile, floorTile, floorTile, floorTile},
               {floorTile, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', floorTile, floorTile, 'nil', 'nil', floorTile, floorTile},
               {floorTile, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', floorTile, floorTile, 'nil', 'nil', floorTile, floorTile},
               {floorTile, floorTile, floorTile, floorTile, floorTile, 'nil', 'nil', floorTile, floorTile, 'nil', 'nil', floorTile, floorTile},
               {floorTile, floorTile, floorTile, floorTile, floorTile, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', floorTile, floorTile},
               {floorTile, floorTile, floorTile, floorTile, floorTile, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', floorTile, floorTile},
               {floorTile, floorTile, floorTile, floorTile, 'nil', 'nil', 'nil', floorTile, floorTile, 'nil', 'nil', floorTile, floorTile},
               {floorTile, floorTile, floorTile, floorTile, 'nil', 'nil', floorTile, floorTile, floorTile, 'nil', 'nil', floorTile, floorTile},
               {floorTile, floorTile, floorTile, floorTile, 'nil', 'nil', floorTile, floorTile, floorTile, 'nil', 'nil', floorTile, floorTile},
               {floorTile, floorTile, floorTile, floorTile, 'nil', 'nil', floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile},
               {floorTile, floorTile, floorTile, floorTile, 'nil', 'nil', 'nil', floorTile, floorTile, floorTile, floorTile, floorTile, floorTile},
               {floorTile, floorTile, floorTile, floorTile, floorTile, 'nil', 'nil', floorTile, floorTile, floorTile, floorTile, floorTile, floorTile},
               {floorTile, floorTile, floorTile, floorTile, floorTile, 'nil', 'nil', floorTile, floorTile, floorTile, floorTile, floorTile},
               {floorTile, floorTile, floorTile, floorTile, floorTile, 'nil', 'nil', floorTile, floorTile, floorTile, floorTile, floorTile},
               {floorTile, floorTile, floorTile, floorTile, floorTile, 'nil', 'nil', floorTile, floorTile, floorTile, floorTile, floorTile},
               {floorTile, floorTile, floorTile, floorTile, 'nil', 'nil', 'nil', floorTile, floorTile, floorTile, floorTile, floorTile},
               {wall, wall, wall, wall, wall, 'nil', wall, wall, wall, wall, wall, wall, wall},
               {floorTile, floorTile, floorTile, floorTile, 'nil', 'nil', floorTile, floorTile, floorTile, floorTile, floorTile, floorTile},
               {floorTile, floorTile, floorTile, floorTile, 'nil', 'nil', 'nil', floorTile, floorTile, floorTile, floorTile, floorTile},
               {floorTile, floorTile, floorTile, floorTile, floorTile, 'nil', 'nil', floorTile, floorTile, floorTile, floorTile, floorTile},
               {floorTile, floorTile, floorTile, floorTile, floorTile, 'nil', 'nil', floorTile, floorTile, floorTile, floorTile, floorTile},
               {floorTile, floorTile, floorTile, floorTile, floorTile, 'nil', 'nil', floorTile, floorTile, floorTile, floorTile, floorTile},
               {floorTile, floorTile, floorTile, floorTile, floorTile, 'nil', 'nil', floorTile, floorTile, floorTile, floorTile, floorTile},
               {floorTile, floorTile, floorTile, floorTile, floorTile, 'nil', 'nil', floorTile, floorTile, floorTile, floorTile, floorTile},
               {floorTile, floorTile, floorTile, floorTile, floorTile, 'nil', 'nil', floorTile, floorTile, floorTile, floorTile, floorTile},
               {floorTile, floorTile, floorTile,floorTile, 'nil', 'nil', 'nil', floorTile, floorTile, floorTile, floorTile, floorTile},
               {floorTile, floorTile, floorTile, floorTile, 'nil', 'nil', floorTile, floorTile, floorTile, floorTile, floorTile, floorTile},
               {floorTile, floorTile, floorTile, floorTile, 'nil', 'nil', floorTile, floorTile, floorTile, floorTile, floorTile, floorTile},
             }

  floor2 = Map:new(floor2)


end
function love.update(dt)

--Enemies
  if direction == 'down' then
    z = z + 5
  end
  if direction == 'up' then
    z = z - 5
  end

  if z==400 then
    direction = 'up'
  end
  if z==50 then
    direction = 'down'
  end
--
  if direction2 == 'left' then
    s = s + 5
  end
  if direction2 == 'right' then
    s = s - 5
  end
  if s==700 then
    direction2 = 'right'
  end
  if s==100 then
    direction2 = 'left'
  end
--
  if direction3 == 'left2' then
    q = q + 5
  end
  if direction3 == 'right2' then
    q = q - 5
  end
  if q==700 then
    direction3 = 'right2'
  end
  if q==100 then
    direction3 = 'left2'
  end
--
  if direction4 == 'diagonal' then
    c = c + 5
  end
  if direction4 == 'diagonal1' then
    c = c - 5
  end
  if c==200 then
    direction4 = 'diagonal1'
  end
  if c==0 then
    direction4 = 'diagonal'
  end

    if direction5 == 'diagonal2' then
      b = b + 5
    end
    if direction5 == 'diagonal3' then
      b = b - 5
    end
    if b==200 then
      direction5 = 'diagonal3'
    end
    if b==0 then
      direction5 = 'diagonal2'
    end
--
if direction == 'down2' then
  enemie = enemie + 5
end
if direction == 'up2' then
  enemie = enemie - 5
end

if enemie==400 then
  direction = 'up2'
end
if enemie==50 then
  direction = 'down2'
end

--Player Movement
  if love.keyboard.isDown('right')then
    if floor2:cc(x + 4, y, 60, 60)==false then
      if doorStatus == 'closed' then
        if cc(x+4, y, 64, 64   , 1280, 320, 64, 64) == false then
          x = x + 4
        end
      elseif doorStatus == 'open' then
        x = x + 4
      end
    end
  end
if x > 0 then
  if love.keyboard.isDown('left')then
    if floor2:cc(x - 4, y, 60, 60)==false then
    x = x - 4
  end
  end
  end
  if love.keyboard.isDown('up')then
    if floor2:cc(x, y - 4, 60, 60)==false then
    y = y - 4
  end
  end
  if love.keyboard.isDown('down')then
    if floor2:cc(x, y + 4, 60, 60)==false then
    y = y + 4
  end

  end
  --Player Damage
  cam:setPosition(x, y)
 if cc(x, y, w, h,   100, z, 60, 60) then

   hp = hp - 1
 end
 if cc(x, y, w, h,   s, 325, 60, 60) then

   hp = hp - 1
 end
 if cc(x, y, w, h,   q, 385, 60, 60) then

   hp = hp - 1
 end
if cc(x, y, w, h,   c, b, 60, 60) then

  hp = hp - 1
end
if cc(x, y, w, h,   100, enemie, 60, 60) then

  hp = hp - 1
end
if cc(x, y, w, h,   1650, 375, 60, 60) then

  love.exitModule()
end

if cc(x, y, w, h,   375, 625, 60, 60) == true then
door=openDoor
end
end



function love.draw()
  cam:draw(function(l, t, w, h)

if hp < 0 then
  love.exitModule()
end
    if hp > 0 then
  map:draw()
end
if hp > 0 then
    floor2:draw()
end
if hp > 0 then
    love.graphics.draw(rod, 375, 625)
    love.graphics.draw(axe, 115, 115)
    love.graphics.draw(gold, 1650, 375)
    love.graphics.draw(oct, 100, z)
    love.graphics.draw(oct2, s, 325)
    love.graphics.draw(oct3, q, 385)
    love.graphics.draw(oct4, c, b)
    love.graphics.draw(door, 1280, 320)
    love.graphics.draw(oct5, 100, enemie)
  end
    if hp > 0 then
    love.graphics.draw(playerImg, x, y)
  end
  if hp > 0 then
  love.graphics.print(hp, x, y)
end

  end)
end

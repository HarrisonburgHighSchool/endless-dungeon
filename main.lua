
local Map = require 'core/map'
local gamera = require 'core/gamera'
local Util = require 'core/util'

function love.load()
  cam = gamera.new(0, 0, 2000, 600) -- Create a camera that can move in a rectangle from 0, 0 to 2000, 2000
  x = 1
  y = 235
  playerImg = love.graphics.newImage('assets-1/player/base/lorc_male_6.png')
  oct=love.graphics.newImage('assets-1/player/base/octopode_2.png')
  oct2=love.graphics.newImage('assets-1/player/base/octopode_1.png')
    oct3=love.graphics.newImage('assets-1/player/base/octopode_3.png')
  w=64
  h=64
  hp=100
floorTile = love.graphics.newImage('assets-1/dungeon/floor/sand_1.png')
path = love.graphics.newImage('assets-1/dungeon/floor/mud_0.png')
z=100
s=100
t=100
direction = 'down'
direction2= 'left'
direction3= 'right'
floor = {
               {floorTile, floorTile, floorTile, path, path, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile},
               {floorTile, floorTile, floorTile, path, path, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile},
               {floorTile, floorTile, floorTile, path, path, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile},
               {floorTile, floorTile, floorTile, path, path, path, floorTile, floorTile, floorTile, floorTile, floorTile},
               {floorTile, floorTile, floorTile, floorTile, path, path, floorTile, floorTile, floorTile, floorTile, floorTile},
               {floorTile, floorTile, floorTile, floorTile, path, path, floorTile, floorTile, floorTile, floorTile, floorTile},
               {floorTile, floorTile, floorTile, floorTile, path, path, floorTile, floorTile, floorTile, floorTile, floorTile},
               {floorTile, floorTile, floorTile, floorTile, path, path, floorTile, floorTile, floorTile, floorTile, floorTile},
               {floorTile, floorTile, floorTile, floorTile, path, path, floorTile, floorTile, floorTile, floorTile, floorTile},
               {floorTile, floorTile, floorTile, floorTile, path, path, floorTile, floorTile, floorTile, floorTile, floorTile},
               {floorTile, floorTile, floorTile, path, path, path, floorTile, floorTile, floorTile, floorTile, floorTile},
               {floorTile, floorTile, floorTile, path, path, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile},
               {floorTile, floorTile, floorTile, path, path, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile},
               {floorTile, floorTile, floorTile, path, path, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile},
               {floorTile, floorTile, floorTile, path, path, path, floorTile, floorTile, floorTile, floorTile, floorTile},
               {floorTile, floorTile, floorTile, floorTile, path, path, floorTile, floorTile, floorTile, floorTile, floorTile},
               {floorTile, floorTile, floorTile, floorTile, path, path, floorTile, floorTile, floorTile, floorTile, floorTile},
               {floorTile, floorTile, floorTile, floorTile, path, path, floorTile, floorTile, floorTile, floorTile, floorTile},
               {floorTile, floorTile, floorTile, floorTile, path, path, floorTile, floorTile, floorTile, floorTile, floorTile},
               {floorTile, floorTile, floorTile, path, path, path, floorTile, floorTile, floorTile, floorTile, floorTile},
               {floorTile, floorTile, floorTile, path, path, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile},
               {floorTile, floorTile, floorTile, path, path, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile},
               {floorTile, floorTile, floorTile, path, path, path, floorTile, floorTile, floorTile, floorTile, floorTile},
               {floorTile, floorTile, floorTile, floorTile, path, path, floorTile, floorTile, floorTile, floorTile, floorTile},
               {floorTile, floorTile, floorTile, floorTile, path, path, floorTile, floorTile, floorTile, floorTile, floorTile},
               {floorTile, floorTile, floorTile, floorTile, path, path, floorTile, floorTile, floorTile, floorTile, floorTile},
               {floorTile, floorTile, floorTile, floorTile, path, path, floorTile, floorTile, floorTile, floorTile, floorTile},
               {floorTile, floorTile, floorTile, floorTile, path, path, floorTile, floorTile, floorTile, floorTile, floorTile},
               {floorTile, floorTile, floorTile, floorTile, path, path, floorTile, floorTile, floorTile, floorTile, floorTile},
               {floorTile, floorTile,floorTile, path, path, path, floorTile, floorTile, floorTile, floorTile, floorTile},
               {floorTile, floorTile, floorTile, path, path, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile},
               {floorTile, floorTile, floorTile, path, path, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile},
             }

  map = Map:new(floor)


end
function love.update(dt)

  if direction == 'down' then
    z = z + 5
  end
  if direction == 'up' then
    z = z -5
  end

  if z==500 then
    direction = 'up'
  end
  if z==50 then
    direction = 'down'
  end

  if direction2 == 'left' then
    s = s + 5
  end
  if direction2 == 'right' then
    s = s -5
  end
  if s==700 then
    direction2 = 'right'
  end
  if s==70 then
    direction2 = 'left'
  end

  if direction3 == 'left' then
    t = t + 5
  end
  if direction3 == 'right' then
    t = t -5
  end
  if t==700 then
    direction3 = 'right'
  end
  if t==70 then
    direction3 = 'left'
  end

  if love.keyboard.isDown('right')then
    if cc(x+3,y,64,64,  50,125,64,64)==false then
    x = x + 3
  end
end
  if love.keyboard.isDown('left')then
    if cc(x-3,y,64,64,  50,125,64,64)==false then
    x = x - 3
  end
  end
  if love.keyboard.isDown('up')then
    if cc(x,y-3,64,64,  50,125,64,64)==false then
    y = y - 3
  end
  end
  if love.keyboard.isDown('down')then
    if cc(x,y+3,64,64,  50,125,64,64)==false then
    y = y + 3
  end
  end
  cam:setPosition(x, y)
 if cc(x, y, w, h,   100, z, 20, 100) then

   hp = hp - 0.5
 end
 if cc(x, y, w, h,   s, 100, 20, 100) then

   hp = hp - 0.5
 end
 if cc(x, y, w, h,   t, 100, 20, 100) then

   hp = hp - 0.5
 end
end

function love.draw()
  cam:draw(function(l, t, w, h)

    map:draw()
    love.graphics.draw(oct, 100, z)
    love.graphics.draw(oct2, s, 325)
    love.graphics.draw(oct3, t, 260)
    if hp > 0 then
    love.graphics.draw(playerImg, x, y)
  end
    love.graphics.print(hp, 0, 0)
    love.graphics.print(hp, 600, 0)
    love.graphics.print(hp, 1200, 0)

  end)
end

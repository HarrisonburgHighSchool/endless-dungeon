
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
q=100
direction = 'down'
direction2= 'left'
direction3= 'left2'
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
    z = z - 5
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
    s = s - 5
  end
  if s==700 then
    direction2 = 'right'
  end
  if s==100 then
    direction2 = 'left'
  end

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

  function love.update(dt)
    if love.keyboard.isDown('up') then
      if collision:cc(x, y - 5, 64, 64) == false then
        y = y - 5
      end
    end
    if love.keyboard.isDown('down') then
      if collision:cc(x, y + 5, 64, 64) == false then
        y = y + 5
      end
    end
    if love.keyboard.isDown('right') then
      if collision:cc(x + 5, y, 64, 64) == false then
        x = x + 5
      end
    end
    if love.keyboard.isDown('left') then
      if collision:cc(x - 5, y, 64, 64) == false then
        x = x - 5
      end
    end
  end

  end
  cam:setPosition(x, y)
 if cc(x, y, w, h,   100, z, 20, 100) then

   hp = hp - 1
 end
 if cc(x, y, w, h,   s, 325, 20, 100) then

   hp = hp - 1
 end
 if cc(x, y, w, h,   q, 260, 20, 100) then

   hp = hp - 1
 end
end





function love.draw()
  cam:draw(function(l, t, w, h)

    map:draw()
    love.graphics.draw(oct, 100, z)
    love.graphics.draw(oct2, s, 325)
    love.graphics.draw(oct3, q, 260)
    if hp > 0 then
    love.graphics.draw(playerImg, x, y)
  end
    love.graphics.print(hp, 0, 0)
    love.graphics.print(hp, 600, 0)
    love.graphics.print(hp, 1200, 0)

  end)
end

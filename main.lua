
local Map = require 'core/map'
local gamera = require 'core/gamera'
local Util = require 'core/util'

function love.load()
  cam = gamera.new(0, 0, 2000, 600) -- Create a camera that can move in a rectangle from 0, 0 to 2000, 2000
  x = 1
  y = 235
  playerImg = love.graphics.newImage('assets-1/player/base/lorc_male_6.png')
  w=64
  h=64
  hp=100
floorTile = love.graphics.newImage('assets-1/dungeon/floor/sand_1.png')
path = love.graphics.newImage('assets-2/dc-dngn/floor/swamp0.png')
floor = {
               {floorTile, floorTile, floorTile, floorTile, path, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile},
               {floorTile, floorTile, floorTile, floorTile, path, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile},
               {floorTile, floorTile, floorTile, floorTile, path, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile},
               {floorTile, floorTile, floorTile, floorTile, path, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile},
               {floorTile, floorTile, floorTile, floorTile, path, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile},
               {floorTile, floorTile, floorTile, floorTile, path, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile},
               {floorTile, floorTile, floorTile, floorTile, path, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile},
               {floorTile, floorTile, floorTile, floorTile, path, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile},
               {floorTile, floorTile, floorTile, floorTile, path, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile},
               {floorTile, floorTile, floorTile, floorTile, path, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile},
               {floorTile, floorTile, floorTile, floorTile, path, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile},
               {floorTile, floorTile, floorTile, floorTile, path, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile},
               {floorTile, floorTile, floorTile, floorTile, path, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile},
               {floorTile, floorTile, floorTile, floorTile, path, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile},
               {floorTile, floorTile, floorTile, floorTile, path, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile},
               {floorTile, floorTile, floorTile, floorTile, path, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile},
               {floorTile, floorTile, floorTile, floorTile, path, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile},
               {floorTile, floorTile, floorTile, floorTile, path, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile},
               {floorTile, floorTile, floorTile, floorTile, path, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile},
               {floorTile, floorTile, floorTile, floorTile, path, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile},
               {floorTile, floorTile, floorTile, floorTile, path, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile},
               {floorTile, floorTile, floorTile, floorTile, path, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile},
               {floorTile, floorTile, floorTile, floorTile, path, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile},
               {floorTile, floorTile, floorTile, floorTile, path, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile},
               {floorTile, floorTile, floorTile, floorTile, path, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile},
               {floorTile, floorTile, floorTile, floorTile, path, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile},
               {floorTile, floorTile, floorTile, floorTile, path, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile},
               {floorTile, floorTile, floorTile, floorTile, path, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile},
               {floorTile, floorTile, floorTile, floorTile, path, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile},
               {floorTile, floorTile, floorTile, floorTile, path, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile},
               {floorTile, floorTile, floorTile, floorTile, path, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile},
               {floorTile, floorTile, floorTile, floorTile, path, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile},
             }

  map = Map:new(floor)

end

function love.update(dt)
  if love.keyboard.isDown('right')then
    x = x + 3
  end
  if love.keyboard.isDown('left')then
    x = x - 3
  end
  if love.keyboard.isDown('up')then
    y = y - 3
  end
  if love.keyboard.isDown('down')then
    y = y + 3
  end
  cam:setPosition(x, y)
  -- x, y, w, h all represent the player's rectangle. The other values are a rectangle in the upper corner
 if cc(x, y, w, h,   0, 0, 64, 64) then
   -- if true, decrease HP:
   hp = hp - 1
 end
end

function love.draw()
  cam:draw(function(l, t, w, h)

    map:draw()
    if hp>0 then
    love.graphics.draw(playerImg, x, y)
  end
    love.graphics.rectangle('line', 0, 0, 64, 64)
    love.graphics.print(hp, 0, 0)

  end)
end

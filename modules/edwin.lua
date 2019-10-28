local Map = require 'core/map'
local Util = require 'core/util'

function love.load()
  x = 80
  y = 270
playerImg = love.graphics.newImage('assets-1/player/base/lorc_male_5.png')

ex = 300
ey = 300
eimg = love.graphics.newImage('assets-1/monster/aquatic/lava_snake.png')

  floorTile = love.graphics.newImage('assets-1/dungeon/floor/cage_1.png')
  background = {
    {floorTile, floorTile, floorTile, floorTile},
    {floorTile, floorTile, floorTile, floorTile},
    {floorTile, floorTile, floorTile, floorTile},
    {floorTile, floorTile, floorTile, floorTile},
  }
  wallTile = love.graphics.newImage('assets-1/dungeon/wall/lab-metal_1.png')
  collision = {
    {wallTile, wallTile, wallTile, wallTile, wallTile, wallTile, wallTile, wallTile, wallTile, wallTile},
    {wallTile, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil',wallTile},
    {wallTile, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil',wallTile},
    {wallTile, 'nil', 'nil', wallTile, 'nil', 'nil', 'nil', 'nil', 'nil',wallTile},
    {wallTile, 'nil', 'nil', wallTile, 'nil', 'nil', wallTile, 'nil', 'nil',wallTile},
    {wallTile, 'nil', 'nil', wallTile, 'nil', 'nil', 'nil', 'nil', 'nil',wallTile},
    {wallTile, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil',wallTile},
    {wallTile, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil',wallTile},
    {wallTile, wallTile, wallTile, wallTile, 'nil', 'nil', wallTile, wallTile, wallTile, wallTile},
    {wallTile, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil',wallTile},
    {wallTile, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil',wallTile},
    {wallTile, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil',wallTile},
    {wallTile, wallTile, wallTile, wallTile, wallTile, wallTile, wallTile, wallTile, wallTile, wallTile},
    {wallTile},
    {wallTile},
  }
  collision = Map:new(collision)
  background = Map:new(background)

  --wall     = love.graphics.newImage('altar-asset.png')
  template = { --a 3 x 3 map with the altar texture in the middle
               {floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile},
               {floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile},
               {floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile},
               {floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile},
               {floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile},
               {floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile},
               {floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile},
               {floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile},
               {floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile},
               {floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile},
               {floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile},
               {floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile},
               {floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile},
             }
  map = Map:new(template)
end


function love.update(dt)

-- Sense collision moving right
if love.keyboard.isDown('right') then
  if collision:cc(x + 6, y, 64, 64) == false then
    x = x + 6
  end
end

 if love.keyboard.isDown('up') then
    if collision:cc(x, y - 6, 64, 64) == false then
      y = y - 6
    end
  end
  if love.keyboard.isDown('down') then
     if collision:cc(x, y + 6, 64, 64) == false then
       y = y + 6
     end
   end
   if love.keyboard.isDown('left') then
      if collision:cc(x - 6, y, 64, 64) == false then
        x = x - 6
      end
    end

    if ex < x then
       if collision:cc(ex + 5, ey, 64, 64) == false then
          ex = ex + 5
       end
     end
    if ex > x then
       if collision:cc(ex - 5 , ey, 64, 64) == false then
         ex = ex - 5
       end
     end
    if ey > y then
        if collision:cc(ey - 5 , ex, 64, 64) == false then
          ey = ey - 5
        end
      end
      if ey < y then
        if collision:cc(ey + 5 , ex, 64, 64) == false then
          ey = ey + 5
        end
      end
    end
function love.draw()
  map:draw()
  background:draw()
  collision:draw()
  love.graphics.print('Yo!', 0, 0)
  love.graphics.draw(playerImg, x, y)
  love.graphics.draw(eimg, ex, ey)
end

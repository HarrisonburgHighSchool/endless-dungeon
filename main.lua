local Map = require 'core/map'
local Util = require 'core/util'

function love.load()
  x = 370
  y = 270
playerImg = love.graphics.newImage('assets-1/player/base/lorc_male_5.png')

  floorTile = love.graphics.newImage('assets-1/dungeon/floor/black_cobalt_9.png')
  background = {
    {floor, floor, floor, floor},
    {floor, floor, floor, floor},
    {floor, floor, floor, floor},
    {floor, floor, floor, floor},
  }
  wallTile = love.graphics.newImage('assets-1/dungeon/wall/crystal_wall_lightblue.png')
  collision = {
    {wall, wall, wall, wall},
    {wall, 'nil', 'nil', wall},
    {wall, 'nil', 'nil', wall},
    {wall, 'nil', 'nil', wall},
  }
  collision = Map:new(collision)
  background = Map:new(background)

  --wall     = love.graphics.newImage('altar-asset.png')
  template = { --a 3 x 3 map with the altar texture in the middle
               {floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile},
               {floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile},
               {floorTile, floorTile, wallTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile},
               {floorTile, floorTile, wallTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile},
               {floorTile, floorTile, wallTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile},
               {floorTile, floorTile, floorTile, floorTile, floorTile, wallTile, floorTile, floorTile, floorTile, floorTile},
               {floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, wallTile, floorTile, floorTile, floorTile},
               {floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, wallTile, floorTile, floorTile},
               {floorTile, floorTile, floorTile, wallTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile},
               {floorTile, floorTile, floorTile, wallTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile},
               {floorTile, floorTile, floorTile, wallTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile},
               {floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile},
               {floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile},
             }
  map = Map:new(template)
end


function love.update(dt)

if love.keyboard.isDown('right') then
  if core/map.cc(x + 1, y, 370, 270) == false then
    x = x + 1
  end


end
 if love.keyboard.isDown('up') then
    y = y + -5
  end
  if love.keyboard.isDown('down') then
     y = y + 5
   end
   if love.keyboard.isDown('left') then
      x = x + -5
    end
    if love.keyboard.isDown('right') then
       x = x + 5
     end
end





function love.draw()
  map:draw()
  background:draw()
  collision:draw()
  love.graphics.print('Yo!', 0, 0)
  love.graphics.draw(playerImg, x, y)
end

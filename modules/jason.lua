love.graphics.setDefaultFilter('nearest', 'nearest')
local Map = require 'core/map'
local Entity = require 'core/entity'
local Util = require 'core/util'
local gamera = require 'core/gamera'
function love.load()



  ex = 100
    ey = 100
    eimg = love.graphics.newImage('assets-1/player/base/octopode_2.png')

time = 1000 -- store a big number in time

  x = 250
  y = 100
cam = gamera.new(10, 10, 2000, 2000)
  tile = love.graphics.newImage('assets-1/dungeon/floor/black_cobalt_4.png')
  tile2 = love.graphics.newImage('assets-1/dungeon/wall/cobalt_stone_9.png')
  tile3 = love.graphics.newImage('assets-1/dungeon/wall/bars_red_1.png')
  playerImg = love.graphics.newImage('assets-1/player/base/naga_red_female.png')

wall = love.graphics.newImage('assets-1/dungeon/wall/bars_red_2.png')
  map = {
    {tile, tile, tile, tile2, tile2, tile2, tile, tile, tile, tile},
    {tile, tile, tile ,tile2, tile2, tile2, tile, tile, tile, tile},
    {tile, tile, tile, tile2, tile2, tile2, tile, tile, tile, tile},
    {tile, tile2, tile2, tile2, tile2, tile2, tile2, tile2, tile, tile},
    {tile, tile2, tile2, tile2, tile2, tile2, tile2, tile2, tile, tile},
    {tile2, tile2, tile2, tile2, tile2, tile2, tile2, tile2, tile2, tile3},
    {tile2, tile2, tile2, tile2, tile2, tile2, tile2, tile2, tile2, tile3},
    {tile2, tile2, tile2, tile2, tile2, tile2, tile2, tile2, tile2, tile3},
    {tile, tile2, tile2, tile2, tile2, tile2, tile2, tile2, tile, tile},
    {tile, tile2, tile2, tile2, tile2, tile2, tile2, tile2, tile, tile},
    {tile, tile, tile, tile2, tile2, tile, tile, tile, tile, tile},
    {tile, tile, tile, tile2, tile2, tile2, tile, tile, tile, tile},
    {tile, tile, tile, tile2, tile3, tile3, tile, tile, tile, tile}
}
collision = {
    {wall, wall, wall, wall,wall,wall,wall,wall,wall},
    {wall, 'nil', 'nil', wall,'nil','nil','nil',wall},
    {wall, 'nil', 'nil', wall,'nil','nil','nil',wall},
    {wall, 'nil', 'nil', wall,'nil','nil','nil','nil'},
    {wall, 'nil', 'nil', wall,'nil',wall,'nil','nil'},
    {wall, 'nil', 'nil', wall,'nil',wall,'nil',wall},
    {wall, 'nil', 'nil', wall,'nil',wall,'nil',wall},
    {wall, 'nil', 'nil', wall,'nil',wall,'nil',wall},
    {wall, 'nil', 'nil', wall,'nil',wall,'nil',wall},
    {wall, 'nil', 'nil', 'nil','nil',wall,'nil','nil','nil'},
    {wall, 'nil', 'nil', 'nil','nil',wall,'nil','nil','nil'},
    {wall, wall, wall, wall,wall,wall,wall,wall,wall},
  }
cam:setPosition(400, 400)
  bkgrnd = Map:new(map)
  collision = Map:new(collision)

  --background = Map:new(background)
end



function love.update(dt)
  if love.keyboard.isDown('up') then
    if collision:cc(x, y - 10, 60, 60) == false then
      y = y - 10
    end
  end
  if love.keyboard.isDown('down') then
    if collision:cc(x, y + 10 , 60, 60)  == false then
      y = y + 10
    end
  end
  if love.keyboard.isDown('right') then
    if collision:cc(x + 10, y, 60, 60)  == false then

      x = x + 10
    end
  end
  if love.keyboard.isDown('left') then
    if collision:cc(x - 10, y, 60, 60)  == false then
      x = x - 10
    end
  end

time = time - 1
if time < 0 then
love.exitModule()
end


  if ex > x then
  ex = ex - 4
  end
  if ex < x then
  ex = ex + 4
  end
  if ey > y then
  ey = ey - 4
  end
  if ey < y then
  ey = ey + 4
  end
if love.keyboard.isDown('escape')then
love.exitModule()
  end
end

function love.draw()
  cam:draw(function(l, t, w, h)

  --Draw everything here. For example:
  love.graphics.draw(playerImg, x, y)

  end)
end


function love.draw()
  bkgrnd:draw()
  collision:draw()
  love.graphics.print(time, 0, 0)
  love.graphics.draw(playerImg, x, y)
    love.graphics.draw(eimg, ex, ey)
end

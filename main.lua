local Map = require 'core/map'
local gamera = require 'core/gamera'
local Util = require 'core/util'
function love.load()

  cam = gamera.new(0, 0, 1250, 1000)
  x = 400
  y = 325
  playerImg = love.graphics.newImage('assets-1/monster/knight.png')
  w = 64
  h = 64
  hp = 100
  a = 470
  b = 400
  --Img2 = love.graphics.newImage('assets-1/monster/statues/chilling_statue.png')
  c = 340
  d = 400
  Img3 = love.graphics.newImage('assets-1/monster/statues/chilling_statue.png')

  crypt = love.graphics.newImage('assets-1/dungeon/floor/crypt_domino_5a.png')
  floorTile = love.graphics.newImage('assets-1/dungeon/floor/rect_gray_0.png')
  altar     = love.graphics.newImage('assets-1/dungeon/floor/mesh_3.png')
  template = { --a 3 x 3 map with the altar texture in the middle
       {floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile},
       {floorTile, altar, floorTile, altar, floorTile, altar, floorTile, altar, floorTile, altar, floorTile, altar, floorTile, altar, floorTile, altar, floorTile, altar, floorTile, altar, floorTile, altar, floorTile},
       {floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile},
       {floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile},
       {floorTile, altar, floorTile, altar, floorTile, altar, floorTile, altar, floorTile, altar, floorTile, altar, floorTile, altar, floorTile, altar, floorTile, altar, floorTile, altar, floorTile},
       {floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, crypt, floorTile, floorTile, floorTile, crypt, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile,},
       {floorTile, floorTile, floorTile, floorTile, floorTile, crypt, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile},
       {floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, crypt, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile},
       {floorTile, altar, floorTile, altar, floorTile, altar, floorTile, altar, floorTile, altar, floorTile, altar, floorTile, altar, floorTile, altar, floorTile, altar, floorTile, altar, floorTile},
       {floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile},
       {floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile,},
       {floorTile, altar, floorTile, altar, floorTile, altar, floorTile, altar, floorTile, altar, floorTile, altar, floorTile, altar, floorTile, altar, floorTile, altar, floorTile, altar, floorTile, altar, floorTile, altar, floorTile, altar},
       {floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile},
       {floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile},
       {floorTile, altar, floorTile, altar, floorTile, altar, floorTile, altar, floorTile, altar, floorTile, altar, floorTile, altar, floorTile, altar, floorTile, altar, floorTile, altar, floorTile, altar, floorTile, altar, floorTile, altar, floorTile, altar, floorTile, altar},
       {floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile},
       {floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile},
       {floorTile, altar, floorTile, altar, floorTile, altar, floorTile, altar, floorTile, altar, floorTile, altar, floorTile, altar, floorTile, altar, floorTile, altar, floorTile, altar, floorTile, altar, floorTile, altar, floorTile, altar, floorTile, altar, floorTile, altar},
       {floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile},
       {floorTile, altar, floorTile, altar, floorTile, altar, floorTile, altar, floorTile, altar, floorTile, altar, floorTile, altar, floorTile, altar, floorTile, altar, floorTile, altar, floorTile, altar, floorTile, altar, floorTile, altar, floorTile, altar, floorTile, altar},
       {floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile},
       {floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile},
       {floorTile, altar, floorTile, altar, floorTile, altar, floorTile, altar, floorTile, altar, floorTile, altar, floorTile, altar, floorTile, altar, floorTile, altar, floorTile, altar, floorTile, altar, floorTile, altar, floorTile, altar, floorTile, altar, floorTile, altar},
       {floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile},
       {floorTile, altar, floorTile, altar, floorTile, altar, floorTile, altar, floorTile, altar, floorTile, altar, floorTile, altar, floorTile, altar, floorTile, altar, floorTile, altar, floorTile, altar, floorTile, altar, floorTile, altar, floorTile, alar, floorTile},
       {floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile. floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile},
       {floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile},
       {floorTile, altar, floorTile, altar, floorTile, altar, floorTile, altar, floorTile, altar, floorTile, altar, floorTile, altar, floorTile, altar, floorTile, altar, floorTile, altar, floorTile, altar, floorTile, altar, floorTile, altar, floorTile, alar, floorTile, altar},
       {floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile}

             }
  map = Map:new(template)

end


function love.update(dt)
  if x < 0 then
    x = 0
  end
  if y < 0 then
    y = 0
  end
  if x > 1200 then
    x = 1200
  end
  if y > 950 then
    y = 950
  end
  if love.keyboard.isDown('right') then
    x = x + 1
if cc(x + 1, y, 64, 64, c, d, 64, 64) == false then
  x = x + 1
  end
end
    if love.keyboard.isDown('down') then

  if cc(x +1, y, 64, 64, c, d, 64, 64)== false then
    y = y + 1
  end
  end
    if love.keyboard.isDown('up') then
      y = y - 1
      if cc(x + 1, y, 64, 64, c, d, 64, 64)== false then
        y = y - 1
      end
    end
  if love.keyboard.isDown('left') then
    x = x - 1
    if cc(x + 1, y, 64, 64, c, d, 64, 64)== false then
      x = x - 1
    end
 end
if cc(x, y, w, h,  0, 0, 64, 64) then
  hp = hp - 1
end

  cam:setPosition(x, y)
end

function love.draw()
  cam:draw(function(l, t, w, h)
  map:draw()
  love.graphics.print('Hello, world!', 0, 0)
  love.graphics.draw(playerImg, x, y)
  love.graphics.rectangle('line', 0, 0, 64, 64)
  love.graphics.print(hp, x, y+ -18)
  --love.graphics.draw(Img2, a, b)
  love.graphics.draw(Img3, c, d)
 end)
end

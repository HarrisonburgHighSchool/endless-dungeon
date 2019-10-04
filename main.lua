local Map = require 'core/map'

function love.load()
  x = 400
  y = 325
  playerImg = love.graphics.newImage('assets-1/monster/ironheart_preserver.png')
  a = 470
  b = 400
  Img2 = love.graphics.newImage('assets-1/monster/statues/chilling_statue.png')
  c = 340
  d = 400
  Img3 = love.graphics.newImage('assets-1/monster/statues/chilling_statue.png')

  crypt = love.graphics.newImage('assets-1/dungeon/floor/crypt_domino_5a.png')
  floorTile = love.graphics.newImage('assets-1/dungeon/floor/rect_gray_0.png')
  altar     = love.graphics.newImage('assets-1/dungeon/floor/mesh_3.png')
  template = { --a 3 x 3 map with the altar texture in the middle
       {floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile},
       {floorTile, altar, floorTile, altar, floorTile, altar, floorTile, altar, floorTile, altar},
       {floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile},
       {floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile},
       {floorTile, altar, floorTile, altar, floorTile, altar, floorTile, altar, floorTile, altar},
       {floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, crypt, floorTile, floorTile, floorTile},
       {floorTile, floorTile, floorTile, floorTile, floorTile, crypt, floorTile, floorTile, floorTile, floorTile},
       {floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, crypt, floorTile, floorTile, floorTile},
       {floorTile, altar, floorTile, altar, floorTile, altar, floorTile, altar, floorTile, altar},
       {floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile},
       {floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile},
       {floorTile, altar, floorTile, altar, floorTile, altar, floorTile, altar, floorTile, altar},
       {floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile},
             }
  map = Map:new(template)

end


function love.update(dt)
  if love.keyboard.isDown('right') then
    x = x + 1
  end
    if love.keyboard.isDown('down') then
      y = y + 1
  end
    if love.keyboard.isDown('up') then
      y = y - 1
    end
  if love.keyboard.isDown('left') then
    x = x - 1
  end
end

function love.draw()
  map:draw()
  love.graphics.print('Hello, world!', 0, 0)
  love.graphics.draw(playerImg, x, y)
  love.graphics.draw(Img2, a, b)
  love.graphics.draw(Img3, c, d)
end

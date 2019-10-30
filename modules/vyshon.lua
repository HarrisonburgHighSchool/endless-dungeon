local Map = require 'core/map'

function love.load()
  x = 400
  y = 300
  playerImg = love.graphics.newImage('assets-1/player/base/octopode_1.png')

  floorTile = love.graphics.newImage('assets-1/dungeon/floor/bog_green_3.png')
   altar     = love.graphics.newImage('assets-1/dungeon/floor/bog_green_3.png')
   template = { --a 3 x 3 map with the altar texture in the middle
                {floorTile, floorTile, floorTile,floorTile, floorTile, floorTile},
                {floorTile, floorTile, floorTile,floorTile, floorTile, floorTile},
                {floorTile, floorTile, floorTile,floorTile, floorTile, floorTile},
                {floorTile, altar, floorTile ,floorTile, floorTile, floorTile},
                {floorTile, floorTile, floorTile,floorTile, floorTile, floorTile},
                {floorTile, floorTile, floorTile,floorTile, floorTile, floorTile},
                {floorTile, altar, floorTile,floorTile, floorTile, floorTile},
                {floorTile, floorTile, floorTile,floorTile, floorTile, floorTile},
                {floorTile, altar, floorTile,floorTile, floorTile, floorTile},
                {floorTile, floorTile, floorTile,floorTile, floorTile, floorTile},
                {floorTile, floorTile, floorTile,floorTile, floorTile, floorTile},
                {floorTile, altar, floorTile,floorTile, floorTile, floorTile},
                {floorTile, floorTile, floorTile,floorTile, floorTile, floorTile},
                {floorTile, floorTile, floorTile,floorTile, floorTile, floorTile},
                {floorTile, altar, floorTile,floorTile, floorTile, floorTile},
                {floorTile, floorTile, floorTile,floorTile, floorTile, floorTile},
                {floorTile, floorTile, floorTile,floorTile, floorTile, floorTile},
                {floorTile, altar, floorTile,floorTile, floorTile, floorTile},
                {floorTile, floorTile, floorTile,floorTile, floorTile, floorTile},
                {floorTile, altar, floorTile,floorTile, floorTile, floorTile},
                {floorTile, floorTile, floorTile,floorTile, floorTile, floorTile},
                {floorTile, floorTile, floorTile,floorTile, floorTile, floorTile},
                {floorTile, altar, floorTile,floorTile, floorTile, floorTile},
                {floorTile, floorTile, floorTile,floorTile, floorTile, floorTile},
                {floorTile, floorTile, floorTile,floorTile, floorTile, floorTile},
                {floorTile, floorTile, floorTile,floorTile, floorTile, floorTile},
                {floorTile, floorTile, floorTile,floorTile, floorTile, floorTile},
                {floorTile, altar, floorTile ,floorTile, floorTile, floorTile},
                {floorTile, floorTile, floorTile,floorTile, floorTile, floorTile},
                {floorTile, floorTile, floorTile,floorTile, floorTile, floorTile},
                {floorTile, altar, floorTile,floorTile, floorTile, floorTile},
                {floorTile, floorTile, floorTile,floorTile, floorTile, floorTile},
                {floorTile, altar, floorTile,floorTile, floorTile, floorTile},
                {floorTile, floorTile, floorTile,floorTile, floorTile, floorTile},
                {floorTile, floorTile, floorTile,floorTile, floorTile, floorTile},
                {floorTile, altar, floorTile,floorTile, floorTile, floorTile},
                {floorTile, floorTile, floorTile,floorTile, floorTile, floorTile},
                {floorTile, floorTile, floorTile,floorTile, floorTile, floorTile},
                {floorTile, altar, floorTile,floorTile, floorTile, floorTile},
                {floorTile, floorTile, floorTile,floorTile, floorTile, floorTile},
                {floorTile, floorTile, floorTile,floorTile, floorTile, floorTile},
                {floorTile, altar, floorTile,floorTile, floorTile, floorTile},
                {floorTile, floorTile, floorTile,floorTile, floorTile, floorTile},
                {floorTile, altar, floorTile,floorTile, floorTile, floorTile},
                {floorTile, floorTile, floorTile,floorTile, floorTile, floorTile},
                {floorTile, floorTile, floorTile,floorTile, floorTile, floorTile},
                {floorTile, altar, floorTile,floorTile, floorTile, floorTile},
                {floorTile, floorTile, floorTile,floorTile, floorTile, floorTile}
           }
   map = Map:new(template)
end

function love.update(dt)
  if love.keyboard.isDown('right') then
    x = x + 1
  end
  if love.keyboard.isDown('left') then
    x = x - 1
  end
  if love.keyboard.isDown('down') then
    y = y + 1
  end
  if love.keyboard.isDown('up') then
    y = y - 1
  end
end
function love.draw()
  map:draw()
  love.graphics.print('Hello, world!', 0, 0)
  love.graphics.draw(playerImg, x, y)
end

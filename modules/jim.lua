love.graphics.setDefaultFilter('nearest', 'nearest')
local Map = require 'core/map'

function love.load()
  x = 400
  y = 300
  playerImg = love.graphics.newImage('assets-1/player/base/octopode_1.png')

  floorTile = love.graphics.newImage('assets-1/dungeon/floor/black_cobalt_12.png')
  altar     = love.graphics.newImage('assets-1/dungeon/altars/ru.png')
  doors     = love.graphics.newImage('assets-1/dungeon/doors/runed_door.png')
  gold1     = love.graphics.newImage('assets-1/item/gold/gold_pile_1.png')

  template = { --a 3 x 3 map with the altar texture in the middle
               {floorTile, floorTile, floorTile, 'nil',     'nil'},
               {floorTile, altar,     floorTile, 'nil',     'nil'},
               {floorTile, floorTile, floorTile, floorTile, floorTile, floorTile},
               {floorTile, floorTile, floorTile, floorTile, floorTile, floorTile},
               {floorTile, floorTile, altar,     'nil',     'nil', floorTile, floorTile},
               {floorTile, floorTile, floorTile, 'nil',     'nil', floorTile},
               {floorTile, doors,     floorTile, 'nil',     'nil', floorTile, floorTile},
             }
  map = Map:new(template)
end


function love.update(dt)
  if love.keyboard.isDown('right') then
    x = x + 8
  end
  if love.keyboard.isDown('left') then
    x = x + -8
  end
  if love.keyboard.isDown('up') then
    y = y + -8
  end
  if love.keyboard.isDown('down') then
    y = y + 8
  end
end


function love.draw()
  map:draw()
  love.graphics.print('Hello, world!', 0, 0)
  love.graphics.draw(playerImg, x, y)
  love.graphics.draw(gold1, 400, 420)
end

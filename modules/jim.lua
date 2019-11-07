love.graphics.setDefaultFilter('nearest', 'nearest')
local Map = require 'core/map'

function love.load()
  x = 450
  y = 320
  playerImg = love.graphics.newImage('assets-1/monster/animals/hell_hound.png')

  floorTile = love.graphics.newImage('assets-1/dungeon/floor/black_cobalt_12.png')
  altar     = love.graphics.newImage('assets-1/dungeon/altars/ru.png')
  doors     = love.graphics.newImage('assets-1/dungeon/doors/runed_door.png')
  gold1     = love.graphics.newImage('assets-1/item/gold/gold_pile_1.png')
  transp = love.graphics.newImage('assets-1/transparent.png')
  template = { --a 3 x 3 map with the altar texture in the middle
                {transp, transp, transp, transp,     },
               {floorTile, floorTile, floorTile, transp,     transp},
               {floorTile, altar,     floorTile, transp,     transp,  transp, transp},
               {floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, transp, transp},
               {floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, transp, transp},
               {floorTile, floorTile, altar,     transp,     transp, floorTile, floorTile,transp},
               {floorTile, floorTile, floorTile, transp,     transp, floorTile, transp, transp},
               {floorTile, doors,     floorTile, transp,     transp, floorTile, floorTile, transp},
                                                                     {transp,     transp, transp, transp, transp, transp, transp, transp}
             }
collision = { --a 3 x 3 map with the altar texture in the middle
             {transp, transp, transp, transp,     },
            {'nil', 'nil', 'nil', transp,     transp},
            {'nil', 'nil',     'nil', transp,     transp,  transp, transp},
            {'nil', 'nil', 'nil', 'nil', 'nil', 'nil', transp, transp},
            {'nil', 'nil', 'nil', 'nil', 'nil', 'nil', transp, transp},
            {'nil', 'nil', altar,     transp,     transp, 'nil', 'nil',transp},
            {'nil', 'nil', 'nil', transp,     transp, 'nil', transp, transp},
            {'nil', 'nil',     'nil', transp,     transp, 'nil', 'nil', transp},
                                                                  {transp,     transp, transp, transp, transp, transp, transp, transp}
          }
  background = Map:new(template)
  idontknow = Map:new(collision)
end


function love.update(dt)
  if love.keyboard.isDown('right') then
    if idontknow:cc(x + 8, y, 32, 32) == false then
      x = x + 8
    end
  end
  if love.keyboard.isDown('left') then
    if idontknow:cc(x - 8, y, 32, 32) == false then
      x = x - 8
    end
  end
  if love.keyboard.isDown('up') then
    if idontknow:cc(x, y - 8, 32, 32) == false then
      y = y - 8
    end
  end
  if love.keyboard.isDown('down') then
    if idontknow:cc(x, y + 8, 32, 32) == false then
      y = y + 8
    end


  end
end


function love.draw()
  background:draw()
  idontknow:draw()
  love.graphics.print('Hello, world!', 0, 0)
  love.graphics.draw(playerImg, x, y)
  love.graphics.draw(gold1, 450, 420)
end

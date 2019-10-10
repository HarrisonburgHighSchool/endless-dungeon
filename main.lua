local Map = require 'core/map'

function love.load()
  --cam = gamera.new(0, 0, 2000, 2000)
  x = 400
  y = 300
  playerImg = love.graphics.newImage('assets-2/player/transform/dragon_form.png')
  --playerImg = love.graphics.newImage('assets-1/player/base/octopode_1.png')
floorTile = love.graphics.newImage('assets-1/dungeon/floor/cage_0.png')
wall  = love.graphics.newImage('assets-1/dungeon/wall/orc_6.png')
wall2  = love.graphics.newImage('assets-1/dungeon/wall/cobalt_stone_2.png')
template = {--a 3 x 3 map with the altar texture in the middle
{wall2, wall2, wall2, wall2, wall2, wall2},
           {wall, floorTile, floorTile, floorTile, wall, wall, wall},
               {wall, floorTile, floorTile, floorTile, wall, wall, wall},
               {wall, floorTile, floorTile, wall, wall, wall2},
               {wall, floorTile, floorTile, wall, wall, wall},
               {wall, floorTile, floorTile, wall, wall, wall},
               {wall, wall, wall, floorTile, wall, wall, wall},
              {wall, floorTile, floorTile, wall, wall, wall},
               {wall, floorTile, floorTile, wall, wall, wall},
              {wall, floorTile, floorTile, wall, wall, wall},
              {wall, floorTile, floorTile, wall, wall, wall},


    }
  floorm = Map:new(template)
end

function love.update(dt)
  if love.keyboard.isDown('right') then
    if cc(x + 1, y, 64, 64, 50, 50, 64, 64) == false then
    x = x + 1
  end
end
  if love.keyboard.isDown('down') then
    y = y + 10
  end
  if love.keyboard.isDown('up') then
    y = y - 10
  end
  if love.keyboard.isDown('left') then
    x = x - 10
  end
  -- Nothing to update yet
end

function love.draw()
  map:draw()
  love.graphics.print('Hello, world!', 0, 0)
  floorm:draw()
  love.graphics.draw(playerImg, x, y)
end

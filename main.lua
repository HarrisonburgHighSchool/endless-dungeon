local Map = require 'core/map'

function love.load()
  --cam = gamera.new(0, 0, 2000, 2000)
  x = 400
  y = 300
  playerImg = love.graphics.newImage('assets-1/player/base/octopode_1.png')
floortile = love.graphics.newImage('assets-1/dungeon/floor/black_cobalt_1.png')
wall   = love.graphics.newImage('assets-1/dungeon/wall/cobalt_rock_1.png')
template = {--a 3 x 3 map with the altar texture in the middle
               {wall, wall, wall, wall},
               {wall, floorTile, floorTile, floorTile},
               {wall, floorTile, floorTile},
               {wall, floorTile, floorTile},
               {wall, floorTile, floorTile},
               {wall, wall, wall},
             }
  floorm = Map:new(template)
end

function love.update(dt)
  if love.keyboard.isDown('right') then
    x = x + 1
  end
  -- Nothing to update yet
end

function love.draw()
  love.graphics.print('Hello, world!', 0, 0)
  love.graphics.draw(playerImg, x, y)
  floorm:draw()
end

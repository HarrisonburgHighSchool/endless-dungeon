  local Map = require 'core/map'
  local Util = require 'core/util'
  local gamera = require 'core/gamera'
love.graphics.setDefaultFilter( 'nearest', 'nearest')
function love.load()
  x = 400
  y = 300
  playerImg = love.graphics.newImage('assets-1/player/base/octopode_1.png')
  w = 64   -- The player's width is 64
  h = 64   -- The player's height is 64
  hp = 100 -- Set the player's HP to 100 at the start of the game
  cam = gamera.new(-500, -500, 2000, 2000)
  playerImg = love.graphics.newImage('assets-1/player/base/lorc_male_6.png')
floorTile = love.graphics.newImage('assets-1/dungeon/floor/grass/grass_2.png')
wall= love.graphics.newImage('assets-1/dungeon/floor/dirt_0.png')
template = { --a 3 x 3 map with the altar texture in the middle
             {wall, wall, wall, wall, wall, wall, wall, wall, wall, wall, wall, wall, wall, wall, wall, wall},
             {wall, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, wall},
             {wall, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, wall, wall},
             {wall, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, wall},
             {wall, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, wall},
             {wall, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, wall, wall, wall, wall},
             {wall, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, wall},
             {wall, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, wall},
             {wall, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, wall},
             {wall, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, wall},
             {wall, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, wall},
             {wall, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, wall},
             {wall, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, wall},
             {wall, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, wall},
             {wall, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, wall, wall, wall, wall},
             {wall, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, wall},
             {wall, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, wall},
              {wall, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, wall, wall},
             {wall, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, wall},
             {wall, wall, wall, wall, wall, wall, wall, wall, wall, wall, wall, wall, wall, wall, wall, wall},
           }

map = Map:new(template)
map:changeScale(1)
end
function love.update(dt)
  cam:setPosition(x, y)
if love.keyboard.isDown('right') then
x = x + 2
end
if love.keyboard.isDown('left') then
x = x - 2
end
if love.keyboard.isDown('down') then
y = y + 2
end
if love.keyboard.isDown('up') then
y = y - 2
end
if cc(x, y, w, h,   0, 0, 64, 64) then
  -- if true, decrease HP:
  hp = hp - 1
end
end

function love.draw()
  love.graphics.draw(playerImg, x, y)

  -- Draw the rectangle in the upper left corner
  love.graphics.rectangle('line', 0, 0, 64, 64)

  -- Print the player's HP in the top left corner
  love.graphics.print(hp, 0, 0)
cam:draw(function(l, t, w, h)
  map:draw()
  --Draw everything here. For example:
  love.graphics.draw(playerImg, x, y)

end)
end

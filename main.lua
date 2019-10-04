  local Map = require 'core/map'
  local gamera = require 'core/gamera'
love.graphics.setDefaultFilter( 'nearest', 'nearest')
function love.load()
  x= 200
  y= 300
  a=200
  b=400
  cam = gamera.new(-500, -500, 2000, 2000)
  playerImg = love.graphics.newImage('assets-1/player/base/lorc_male_6.png')
floorTile = love.graphics.newImage('assets-1/dungeon/floor/grass/grass_2.png')
altar     = love.graphics.newImage('assets-1/dungeon/floor/dirt_0.png')
template = { --a 3 x 3 map with the altar texture in the middle
             {floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile},
             {floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile},
             {floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile},
             {floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile},
             {floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile},
             {floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile},
             {floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile},
             {floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile},
             {floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile},
             {floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile},
             {floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile},
             {floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile},
             {floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile},

           }
map = Map:new(template)
map:changeScale(2)
end
function love.update(dt)
  cam:setPosition(x, y)
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

if love.keyboard.isDown('d') then
a = a + 1
end
if love.keyboard.isDown('a') then
a = a - 1
end
if love.keyboard.isDown('s') then
b = b + 1
end
if love.keyboard.isDown('w') then
b = b - 1
end
end

function love.draw()

cam:draw(function(l, t, w, h)
  map:draw()
  --Draw everything here. For example:
  love.graphics.draw(playerImg, x, y)

end)
end

  local Map = require 'core/map'
  love.graphics.setDefaultFliter('nearest', 'nearest')
function love.load()

floorTile = love.graphics.newImage('assets-1/dungeon/floor/grass/grass_2.png')
altar     = love.graphics.newImage('assets-1/dungeon/floor/dirt_0.png')
template = { --a 3 x 3 map with the altar texture in the middle
             {floorTile, floorTile,,
             {floorTile, altar, },
             {floorTile, floorTile, },
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
map:draw()
  love.graphics.print('Hello, world!', 0, 0)
  love.graphics.draw(playerImg, x, y)
  love.graphics.draw(playerImg1, a, b)
end

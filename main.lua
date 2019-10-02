local Map = require 'core/map'

function love.load()
  a=500
  b=400
  playerImg1 = love.graphics.newImage('assets-1/player/base/lorc_male_2.png')
  x = 400
  y = 300
  playerImg = love.graphics.newImage('assets-1/player/base/octopode_1.png')

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
  love.graphics.print('Hello, world!', 0, 0)
  love.graphics.draw(playerImg, x, y)
  love.graphics.draw(playerImg1, a, b)
end

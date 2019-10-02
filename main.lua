local Map = require 'core/map'

function love.load()
  x = 400
  y = 300
  playerImg = love.graphics.newImage('assets-1/player/base/octopode_1.png')
  a = 500
  b = 400
  playerImg2 = love.graphics.newImage('assets-1/monster/human.png')

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
  love.graphics.print('AD 117, the peak of the Roman Empires might.', 0, 0)
  love.graphics.draw(playerImg, x, y)
  love.graphics.draw(playerImg2, a, b)
end

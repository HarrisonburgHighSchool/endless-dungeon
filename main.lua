local Map = require 'core/map'

function love.load()
  x = 400
  y = 300
  playerImg = love.graphics.newImage('assets-1/monster/ironheart_preserver.png')
  a = 500
  b = 400
  Img2 = love.graphics.newImage('assets-1/monster/statues/chilling_statue.png')
  c = 300
  d = 400
  Img3 = love.graphics.newImage('assets-1/monster/statues/chilling_statue.png')
end




function love.update(dt)
  if love.keyboard.isDown('right') then
    x = x + 1
  end
    if love.keyboard.isDown('down') then
      y = y + 1
  end
    if love.keyboard.isDown('up') then
      y = y - 1
    end
  if love.keyboard.isDown('left') then
    x = x - 1
  end
end

function love.draw()
  love.graphics.print('Hello, world!', 0, 0)
  love.graphics.draw(playerImg, x, y)
  love.graphics.draw(Img2, a, b)
  love.graphics.draw(Img3, c, d)
end

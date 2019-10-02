local Map = require 'core/map'

function love.load()

  x = 400
  y = 300
  a = 400
  b = 300
  playerImg = love.graphics.newImage('assets-1/player/base/octopode_1.png')
end
  playerImg2 = love.graphics.newImage('blue_devil.png')
end

function love.update(dt)
  if love.keyboard.isDown('right') then
    x=x+1
  end
  if love.keyboard.isDown('left') then
    x=x-1
  end
  if love.keyboard.isDown('up') then
    y=y-1
  end
  if love.keyboard.isDown('down') then
    y=y+1
  end
  if love.keyboard.isDown('right') then
    a=a+1
  end
  if love.keyboard.isDown('left') then
    a=a-1
  end
  if love.keyboard.isDown('up') then
    b=b-1
  end
  if love.keyboard.isDown('down') then
    b=b+1
  end
end




function love.draw()
  love.graphics.print('Hello, world!', 0, 0)
  love.graphics.draw(playerImg, x, y)
end

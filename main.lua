local Map = require 'core/map'

function love.load()
  x = 400
  y = 300
  A = 400
  B = 300
  playerImg = love.graphics.newImage('assets-1/player/base/octopode_1.png')
  img = love.graphics.newImage('assets-1/item/book/plaid.png')
end
 
function love.update(dt)
  if love.keyboard.isDown('up')then
    y=y-1
  end
  if love.keyboard.isDown('down')then
    y=y+1
  end
  if love.keyboard.isDown('left')then
    x=x-1
  end
  if love.keyboard.isDown('right')then
    x=x+1
  end
  if love.keyboard.isDown('w')then
    B=B-1
  end
  if love.keyboard.isDown('s')then
    B=B+1
  end
  if love.keyboard.isDown('a')then
    A=A-1
  end
  if love.keyboard.isDown('d')then
    A=A+1
  end
end
function love.draw()
  love.graphics.print('Hello, world!', 0, 0)
  love.graphics.draw(playerImg, x, y)
  love.graphics.draw(img, A, B, 0, 2)
end

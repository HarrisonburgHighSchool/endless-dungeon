function love.load()
  x = 370
  y = 270
  playerImg = love.graphics.newImage('assets-1/player/base/octopode_1.png')
end

function love.update(dt)
  -- Nothing to update yet
end

function love.draw()
  love.graphics.print('Yo!', 0, 0)
  love.graphics.draw(playerImg, x, y)
end

iflove.keyboard.isdown('right')then
  x = x + 1
end

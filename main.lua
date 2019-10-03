function love.load()
  x = 370
  y = 270
  playerImg = love.graphics.newImage('assets-1/player/base/octopode_1.png')
end

function love.update(dt)
 if love.keyboard.isDown('up') then
    y = y + -1
  end
  if love.keyboard.isDown('down') then
     y = y + 1
   end
   if love.keyboard.isDown('left') then
      x = x + -1
    end
    if love.keyboard.isDown('right') then
       x = x + 1
     end
end

function love.draw()
  love.graphics.print('Yo!', 0, 0)
  love.graphics.draw(playerImg, x, y)
end

function love.load()
  x = 400
  y = 300
  playerImg = love.graphics.newImage('assets-1/player/base/octopode_1.png')
end

function love.update(dt)
end

function love.draw()
  love.graphics.print('mike hawk!', 0, 0)
  love.graphics.draw(playerImg, 30, 50)
end

 iflove.keybored.isdown('right')then
   x = x + 1
  end

  iflove.keybored.isdown('left')then
    x = x - 1
   end

   iflove.keybored.isdown('up')then
     x = x + 1


   iflove.keybored.isdown('down')then
       x = x - 1
      end

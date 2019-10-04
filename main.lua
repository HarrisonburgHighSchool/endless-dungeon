function love.load()
  x = 400
  y = 300
  playerImg = love.graphics.newImage('assets-1/player/base/octopode_1.png')
end

function love.update(dt)
  if love.keyboard.isDown("left") then
        x = x - 4
   end

   if love.keyboard.isDown("right") then
        x = x + 4
    end

    if love.keyboard.isDown("up") then
        y = y - 4
    end
    if love.keyboard.isDown("down") then
        y = y + 4
       end
end
function love.draw()
  love.graphics.print('mike hawk!', 0, 0)
  love.graphics.draw(playerImg, x, y)
end

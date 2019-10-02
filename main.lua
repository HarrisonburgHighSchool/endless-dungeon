
function love.load()
  x = 400
  y = 300
  playerImg = love.graphics.newImage('assets-1/player/base/octopode_5.png')
end


function love.update(dt)
  if love.keyboard.isDown('right') then   -- if the 'up' key is being pressed...
    x = x + 3
   
  end
    if love.keyboard.isDown('left') then   -- if the 'up' key is being pressed...
      x = x - 3
  end
  if love.keyboard.isDown('down') then   -- if the 'up' key is being pressed...
    y = y + 3
end
if love.keyboard.isDown('up') then   -- if the 'up' key is being pressed...
  y = y - 3
end
if(x > 700) then
  x = x - 4
end
if (x < 50) then
x = x + 4
end
if(y > 500) then
  y = y - 4
end
if(y < 50) then
  y = y + 4
end
end


function love.draw()
  love.graphics.print('Hello, world!', 0, 0)
  love.graphics.draw(playerImg, x, y)
end


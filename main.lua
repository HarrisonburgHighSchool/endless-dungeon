
function love.load()
  x = 400
  y = 300
  playerImg = love.graphics.newImage('assets-1/player/base/formicid.png')
end


function love.update(dt)
  if love.keyboard.isDown('up') then   -- if the 'up' key is being pressed...
    y = y - 5
  end
  if love.keyboard.isDown('down') then   -- if the 'up' key is being pressed...
    y = y + 5
  end
  if love.keyboard.isDown('left') then   -- if the 'up' key is being pressed...
    x = x - 5
  end
  if love.keyboard.isDown('right') then   -- if the 'up' key is being pressed...
    x = x + 5
  end
end


function love.draw()
  love.graphics.print('Hello, world!', 0, 0)
  love.graphics.draw(playerImg, x, y)
end




function love.load()
  x = 400
  y = 300
  playerImg = love.graphics.newImage('assets-1/player/base/octopode_2.png')
end


function love.update(dt)
 if love.keyboard.isDown('right') then  
x = x + 9
end
if love.keyboard.isDown('down') then  
y = y + 9
end
if love.keyboard.isDown('left') then  
x = x - 9
end
if love.keyboard.isDown('up') then 
  y = y - 9
end


end


function love.draw()
  love.graphics.print('Hello, world!', 0, 0)
  love.graphics.draw(playerImg, x, y)
end


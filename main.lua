
function love.load()
  x = 400
  y = 300
  
  playerImg = love.graphics.newImage('assets-1/misc/blood/wall_old_blood_0.png')
end


function love.update(dt)
if love.keyboard.isDown('up') then
y=y-1
end
if love.keyboard.isDown('down') then
  y=y+1
  end
  if love.keyboard.isDown('right') then
  x=x+1
  end
  if love.keyboard.isDown('left') then
  x=x-1
  end

  
end


function love.draw()
  love.graphics.print('There is no escape', 0, 0)
  love.graphics.draw(playerImg, x, y, 0, 4)
end


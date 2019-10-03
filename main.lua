local Map = require 'core/map'

function love.load()
 
  --player = Entity:new() -- Create the Entity object named player

 
  x = 400
  y = 300
  playerImg = love.graphics.newImage('assets-1/player/base/octopode_2.png')

  map = Map:new(14, 14) -- Create a 14 x 14 map object named "map"
end


function love.update(dt)
 if love.keyboard.isDown('right') then  
x = x + 21
end
if love.keyboard.isDown('down') then  
y = y + 21
end
if love.keyboard.isDown('left') then  
x = x - 21
end
if love.keyboard.isDown('up') then 
  y = y - 21
end


end


function love.draw()
  map:draw()
  love.graphics.print('Octopod-cast!', 0, 0)
  love.graphics.draw(playerImg, x, y)
  --player:draw() -- Draw the entity object named player
  

end

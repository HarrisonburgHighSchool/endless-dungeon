local Map = require 'core/map'

function love.load()
  x = 400
  y = 300
  playerImg = love.graphics.newImage('assets-1/monster/aquatic/Sonic.png')
  cobble = love.graphics.newImage('assets-1/dungeon/floor/cobble_blood_1.png')
  template = {
              {cobble, cobble, cobble},
              {cobble, cobble, cobble},
              {cobble, cobble, cobble},
            }

            map = Map:new(5, 5)
end


function love.update(dt)
  if love.keyboard.isDown('right') then   -- if the 'up' key is being pressed...
    x = x + 10
   
  end
    if love.keyboard.isDown('left') then   -- if the 'up' key is being pressed...
      x = x - 10
  end
  if love.keyboard.isDown('down') then   -- if the 'up' key is being pressed...
    y = y + 10
end
if love.keyboard.isDown('up') then   -- if the 'up' key is being pressed...
  y = y - 10
end
if(x > 700) then
  x = x - 3
end
if (x < 50) then
x = x + 3
end
if(y > 500) then
  y = y - 3
end
if(y < 50) then
  y = y + 3
end
end


function love.draw()
  map:draw()
  love.graphics.print('Hello, world!', 0, 0)
  love.graphics.draw(playerImg, x, y)
  
end


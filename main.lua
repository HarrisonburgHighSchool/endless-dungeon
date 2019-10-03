

local Map = require 'core/map'

function love.load()
  i = 1
 bossdefeated = 1
  x = 400
  y = 300
  playerImg = love.graphics.newImage('assets-1/monster/aquatic/Sonic.png')
  cobble = love.graphics.newImage('assets-1/dungeon/floor/cobble_blood_1.png')
  colbalt = love.graphics.newImage('assets-1/dungeon/floor/black_cobalt_12.png')
  template = {
              {colbalt, colbalt, colbalt, colbalt, cobble, colbalt, colbalt, colbalt, colbalt,},
              {colbalt, cobble, cobble, cobble, cobble, cobble, cobble, cobble, colbalt},
              {colbalt, cobble, cobble, cobble, cobble, cobble, cobble, cobble, colbalt},
              {colbalt, cobble, cobble, colbalt, colbalt, colbalt, cobble, cobble, colbalt},
              {colbalt, cobble, cobble, colbalt, cobble, colbalt, cobble, cobble, colbalt},
              {colbalt, cobble, cobble, colbalt, colbalt, colbalt, cobble, cobble, colbalt},
              {colbalt, cobble, cobble, cobble, cobble, cobble, cobble, cobble, colbalt},
              {colbalt, cobble, cobble, cobble, cobble, cobble, cobble, cobble, colbalt},
              {colbalt, cobble, cobble, cobble, cobble, cobble, cobble, cobble, colbalt},
              {colbalt, cobble, cobble, cobble, cobble, cobble, cobble, cobble, colbalt},
              {colbalt, cobble, cobble, cobble, cobble, cobble, cobble, cobble, colbalt},
              
              
              {colbalt, colbalt, colbalt, colbalt, colbalt, colbalt, colbalt, colbalt, colbalt,},
            }

            map = Map:new(template)
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
  x = x - 10
end
if (x < 50 and i == 1) then
x = x + 10
end
if(y > 448) then
  y = y - 10
end
if(y < 50) then
  y = y + 10
end
if(y == 130 and 160 < x and x < 360) then
  y = y - 10
end
if(y == 380 and 160 < x and x < 360) then
  y = y + 10
end
if(x == 380) then
  x = x + 10
end
if(y == 260 and x == 50) then
  x = x + 0
  i = 2
end
if(x > 50) then
i = 1
end
end



function love.draw()
  map:draw()
  love.graphics.print('Level Boss', 0, 0)
  love.graphics.draw(playerImg, x, y)
  love.graphics.print(x, 10, 20)
  love.graphics.print(y, 30 ,30)
  
end

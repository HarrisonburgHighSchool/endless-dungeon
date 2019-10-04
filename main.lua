

local Map = require 'core/map'

function love.load()
  collide1 = false
  collide2 = false
  i = 1
 bossdefeated = 1
  x = 400
  y = 300
  px = 100
  py = 100
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

if love.keyboard.isDown('d') then   -- if the 'up' key is being pressed...
  px = px + 3
 
end
  if love.keyboard.isDown('a') then   -- if the 'up' key is being pressed...
    px = px - 3
end
if love.keyboard.isDown('s') then   -- if the 'up' key is being pressed...
  py = py + 3
end
if love.keyboard.isDown('w') then   -- if the 'up' key is being pressed...
py = py - 3
end
if(x > 640) then
  x = x - 3
end
if (x < 50 and i == 1) then
x = x + 3
end
if(y > 448) then
  y = y - 3
end
if(y < 60) then
  y = y + 3
end

collide1 = collision(x, y, 190, 190, 328-190, 320-190)
collide2 = collision(px, py, 190, 190, 328-190, 320-190)

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
  love.graphics.print(tostring(collide1)..", "..tostring(collide2), 100, 0)
  love.graphics.draw(playerImg, x, y)
  love.graphics.draw(playerImg, px, py)
  love.graphics.print(x, 10, 20)
  love.graphics.print(y, 30 ,30)

  love.graphics.print(x..", "..y)
  
end

function collision(x1, y1, x2, y2, w2, h2)
if(y2 < y1 and y1 < y2 + h2 and x1 < x2 + w2 and x2 < x1 ) then
  return true
else
  return false
end
end



local Map = require 'core/map'

function love.load()
  collide1 = false
  i = 1
 bossdefeated = 1
 x = 300
 y = 400
  x2 = 193
  y2 = 192
  w2 = 192
  h2 = 192
 w = 64
 h = 64
 HP = 100
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
  if love.keyboard.isDown('right') then  
    x = x + 3
   
  end
    if love.keyboard.isDown('left') then  
      x = x - 3
  end
  if love.keyboard.isDown('down') then 
    y = y + 3
end
if love.keyboard.isDown('up') then
  y = y - 3
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

if(x + w > x2 and y + h > y2 and y2 + h2 > y and x2 + w2 > x) then
  collide1 = true

else

  collide1 = false
end
if(collide1 == true) then
  HP = HP - 0.1
end
if(HP < 0) then
  HP = 0
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
  if(collide = true) then
    love.graphics.draw(playerImg, x, y)

  love.graphics.draw(playerImg, x, y)
  love.graphics.print(x, 10, 20)
  love.graphics.print(y, 30 ,30)
  love.graphics.print(HP, 100, 100)
  love.graphics.print(tostring(collide1), 0, 0)

  
end






local Map = require 'core/map'

function love.load()

  x = 400
  y = 300
  playerImg = love.graphics.newImage('assets-1/monster/raven.png')

  floor = love.graphics.newImage('assets-1/dungeon/floor/etched_1.png')
  template = { 
               {floor, floor, floor},
               {floor, floor, floor},
               {floor, floor, floor},
               {floor, floor, floor},
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
if love.keyboard.isDown('up') then 
  y = y - 3
end
  if love.keyboard.isDown('down') then 
    y = y + 3
end
if(x < 1)then 
    x = x + 4
end
if(x > 730)then 
  x = x - 4
end
if(y < 1)then 
  y = y + 4
end
if(y > 550)then 
  y = y - 4
end
end

function love.draw()
  map:draw()
  love.graphics.draw(playerImg, x, y)
end

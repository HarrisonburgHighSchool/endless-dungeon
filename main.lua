local Map = require 'core/map'

function love.load()
enter = 1
  x = 400
  y = 300
  playerImg = love.graphics.newImage('assets-1/monster/download.png')

  floor = love.graphics.newImage('assets-1/dungeon/floor/cobble_blood_2.png')
  floor1 = love.graphics.newImage('assets-1/dungeon/floor/black_cobalt_1.png')
  floor2 = love.graphics.newImage('assets-1/dungeon/floor/cobble_blood_12.png')
  template = { 
               {floor1, floor1, floor1, floor1, floor, floor1, floor1, floor1, floor1},
               {floor1, floor2, floor2, floor, floor, floor, floor2, floor2, floor1},
               {floor1, floor2, floor, floor, floor, floor, floor, floor2, floor1},
               {floor1, floor, floor2, floor, floor, floor, floor2, floor, floor1},
               {floor1, floor, floor, floor, floor, floor, floor, floor, floor1},
               {floor1, floor, floor, floor2, floor, floor2, floor, floor, floor1},
               {floor1, floor, floor, floor, floor, floor2, floor, floor, floor1},
               {floor1, floor, floor2, floor, floor, floor, floor2, floor, floor1},
               {floor1, floor, floor, floor, floor2, floor, floor, floor, floor1},
               {floor1, floor, floor, floor, floor, floor, floor, floor, floor1},
               {floor1, floor2, floor, floor, floor, floor, floor, floor2, floor1},
               {floor1, floor2, floor2, floor, floor, floor, floor2, floor2, floor1},
               {floor1, floor1, floor1, floor1, floor1, floor1, floor1, floor1, floor1},
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
if(x < 62)then 
    x = x + 4
end
if(x > 730)then 
  x = x - 4
end
if(y < 62)then 
  y = y + 4
end
if(y > 480)then 
  y = y - 4
end
end

function love.draw()
  map:draw()
  love.graphics.draw(playerImg, x, y)

end

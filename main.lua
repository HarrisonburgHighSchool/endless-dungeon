local Map = require 'core/map'

function love.load()
enter = 1
  x = 400
  y = 300
  playerImg = love.graphics.newImage('assets-1/player/base/gargoyle_male.png')

  floor = love.graphics.newImage('assets-1/dungeon/floor/cobble_blood_2.png')
  floor1 = love.graphics.newImage('assets-1/dungeon/floor/cobble_blood_12.png')
  floor2 = love.graphics.newImage('assets-1/dungeon/floor/cobble_blood_6.png')
  wall = love.graphics.newImage('assets-1/dungeon/wall/catacombs_0.png')
  wall1 = love.graphics.newImage('assets-1/dungeon/wall/catacombs_3.png')
  wall2 = love.graphics.newImage('assets-1/dungeon/wall/catacombs_7.png')
  wall3 = love.graphics.newImage('assets-1/dungeon/wall/catacombs_5.png')
  wall_enter = love.graphics.newImage('assets-1/dungeon/wall/catacombs_12.png')
 
  template = { 
               {wall, wall1, wall3, wall1, wall3, wall2, wall3, wall, wall},
               {wall1, floor1, floor1, floor, floor, floor, floor1, floor1, wall},
               {wall, floor1, floor, floor, floor, floor, floor, floor1, wall},
               {wall3, floor, floor1, floor, floor, floor, floor1, floor, wall1},
               {wall1, floor, floor, floor, floor, floor, floor, floor, wall},
               {wall3, floor, floor, floor1, floor, floor1, floor, floor, wall3},
               {wall_enter, floor, floor, floor, floor, floor1, floor, floor, wall1},
               {wall2, floor, floor1, floor, floor, floor, floor1, floor, wall},
               {wall, floor, floor, floor, floor1, floor, floor, floor, wall1},
               {wall1, floor, floor, floor, floor, floor, floor, floor, wall2},
               {wall3, floor1, floor, floor, floor, floor, floor, floor1, wall1},
               {wall, floor1, floor1, floor, floor, floor, floor1, floor2, wall3},
               {wall3, wall1, wall1, wall3, wall1, wall, wall, wall, wall},
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
if(x < 60)then 
    x = x + 3
end
if(x > 707)then 
  x = x - 3
end
if(y < 62)then 
  y = y + 3
end
if(y > 450)then 
  y = y - 3
end
end

function love.draw()
  map:draw()
  love.graphics.draw(playerImg, x, y)

end

local Map = require 'core/map'

function love.load()
enter = 1
collide = false
  x = 385
  y = 60
  x2 = 715
  y2 = 450
  w2 = 20
  h2 = 10
  w = 20
  h = 10
  hp = 100
  playerImg = love.graphics.newImage('assets-1/player/base/gargoyle_male.png')

  floor = love.graphics.newImage('assets-1/dungeon/floor/cobble_blood_2.png')
  floor1 = love.graphics.newImage('assets-1/dungeon/floor/cobble_blood_12.png')
  floor2 = love.graphics.newImage('assets-2/dc-dngn/floor/lava0.png')
  wall = love.graphics.newImage('assets-1/dungeon/wall/catacombs_0.png')
  banner = love.graphics.newImage('assets-1/dungeon/wall/catacombs_1.png')
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
               {banner, floor2, floor, floor, floor, floor, floor, floor, wall3},
               {wall_enter, floor1, floor2, floor, floor, floor, floor, floor, wall1},
               {banner, floor2, floor1, floor, floor, floor, floor1, floor, wall},
               {wall, floor, floor, floor, floor1, floor, floor, floor, wall1},
               {wall1, floor, floor, floor, floor, floor, floor, floor, wall2},
               {wall3, floor1, floor, floor, floor, floor, floor, floor1, wall1},
               {wall, floor1, floor1, floor, floor, floor, floor1, floor, wall3},
               {wall3, wall1, wall1, wall3, wall1, wall, wall, wall, wall},
             }
    map = Map:new(template)
end




function love.update(dt)
if love.keyboard.isDown('right') then 
  x = x + 2
end
  if love.keyboard.isDown('left') then 
    x = x - 2
end
if love.keyboard.isDown('up') then 
  y = y - 2
end
  if love.keyboard.isDown('down') then 
    y = y + 2
end
if(x < 51)then 
    x = x + 2
end
if(x > 715)then 
  x = x - 2
end
if(y < 60)then 
  y = y + 2
end
if(y > 450)then 
  y = y - 2
end
if(x + w > x2 and y + h > y2 and y2 + h2 > y and x2 + w2 > x) then 
  collide = true
else
  collide = false
end
if (collide == true) then  
  hp = hp - 0.1
end
end





function love.draw()
  map:draw()
  love.graphics.draw(playerImg, x, y)
  love.graphics.print(x, 1, 12)
  love.graphics.print(y, 1, 24)
  love.graphics.print(tostring(collide), 0, 0)
  love.graphics.print(hp, 30, 30)

end

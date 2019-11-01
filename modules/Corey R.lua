local Map = require 'core/map'
function love.load()
collide = false
collide2 = false
collide3 = false
collide8 = false
game_end = false
game_end2 = false
col = 1
  x = 385
  y = 60
  w = 38
  h = 56
  x2 = 750
  y2 = 68
  w2 = 64
  h2 = 64
  x3 = 267
  y3 = 322
  w3 = 64
  h3 = 30
  hp = 100
  playerImg = love.graphics.newImage('assets-1/player/base/gargoyle_male.png')
  floor = love.graphics.newImage('assets-1/dungeon/floor/cobble_blood_2.png')
  floor1 = love.graphics.newImage('assets-1/dungeon/floor/cobble_blood_12.png')
  door = love.graphics.newImage('assets-2/dc-dngn/dngn_closed_door.png')
  lava = love.graphics.newImage('assets-2/dc-dngn/floor/lava0.png')
  wall = love.graphics.newImage('assets-1/dungeon/wall/catacombs_0.png')
  banner = love.graphics.newImage('assets-1/dungeon/wall/catacombs_1.png')
  wall1 = love.graphics.newImage('assets-1/dungeon/wall/catacombs_3.png')
  wall2 = love.graphics.newImage('assets-1/dungeon/wall/catacombs_7.png')
  wall3 = love.graphics.newImage('assets-1/dungeon/wall/catacombs_5.png')
  wall_enter = love.graphics.newImage('assets-1/dungeon/wall/catacombs_12.png')
  wall_end = love.graphics.newImage('assets-1/dungeon/floor/white_marble_0.png')
  wall_end2 = love.graphics.newImage('assets-1/dungeon/floor/limestone_2.png')

    template = { 
      {wall, wall1, wall3, wall1, wall3, wall2, wall3, wall, wall},
      {wall1, floor1, floor1, floor, floor, floor, floor1, floor1, wall},
      {wall, floor1, floor, floor, floor, floor, floor, floor1, wall},
      {wall3, floor, floor, floor, floor, floor, floor1, floor, wall1},
      {wall1, floor, floor, floor, floor, floor, floor, floor, wall},
      {banner, floor, floor, floor, floor, floor, floor, floor, wall3},
      {wall_enter, floor1, floor, floor, floor, floor, floor, floor, wall1},
      {banner, floor, floor, floor, floor, floor, floor, floor, wall},
      {wall, floor, floor, floor, floor1, floor, floor, floor, wall1},
      {wall1, floor, floor, floor, floor, floor, floor, floor, wall2},
      {wall3, floor1, floor, floor, floor, floor, floor, floor1, wall1},
      {wall_enter, floor1, floor, floor, floor, floor, floor1, floor, wall3},
      {wall3, wall, wall1, wall3, wall1, wall, wall, wall, wall},
    }
    map = Map:new(template)

    template12 = { 
      {wall, wall1, wall3, wall1, wall3, wall2, wall3, wall, wall},
      {wall1, floor1, floor1, floor, floor, floor, floor1, floor1, wall},
      {wall, floor1, floor, floor, floor, floor, floor, floor1, wall},
      {wall3, floor, floor, floor, floor, floor, floor1, floor, wall1},
      {wall1, floor, floor, floor, floor, wall_enter, floor, floor, wall},
      {banner, floor, floor, floor, floor, floor, floor, floor, wall3},
      {wall, floor1, floor, floor, floor, floor, floor, floor, wall1},
      {banner, floor, floor, floor, floor, floor, floor, floor, wall},
      {wall, floor, floor, floor, floor, floor1, floor, floor, wall1},
      {wall1, floor, floor, floor, floor, floor, floor, floor, wall2},
      {wall3, floor1, floor, floor, floor, floor, floor, floor1, wall1},
      {wall, floor1, floor, floor, floor, floor, floor1, floor, wall3},
      {wall3, wall1, wall1, wall3, wall1, wall, wall, wall, wall},
    }
    map12 = Map:new(template12)
    
    template2 = { 
      {wall , 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil'},
      {'nil', 'nil', 'nil', 'nil', lava , 'nil', 'nil', 'nil', 'nil'},
      {'nil', 'nil', lava , 'nil', 'nil', 'nil', lava , 'nil', 'nil'},
      {'nil', 'nil', lava , lava , lava , lava , 'nil', 'nil', 'nil'},
      {'nil', 'nil', 'nil', lava , lava , 'nil', 'nil', lava , 'nil'},
      {'nil', lava , 'nil', lava , 'nil', 'nil', lava , lava , 'nil'},
      {'nil', 'nil', 'nil', lava , 'nil', lava , lava , lava , 'nil'},
      {'nil', lava , lava , lava , 'nil', lava , lava , lava , 'nil'},
      {'nil', lava , lava , lava , 'nil', 'nil', 'nil', 'nil', 'nil'},
      {'nil', lava , lava , lava , lava , lava , lava , 'nil', 'nil'},
      {'nil', 'nil', 'nil', 'nil', lava , lava , lava , 'nil', 'nil'},
      {'nil', 'nil', lava , 'nil', 'nil', 'nil', 'nil', 'nil', 'nil'},
      {'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil'},
    }
    map2 = Map:new(template2)

    template3 = { 
      {wall1 , 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil'},
      {'nil' , 'nil', 'nil', 'nil', lava , 'nil', 'nil', 'nil', 'nil'},
      {'nil' , 'nil', lava , 'nil', 'nil', 'nil', lava , 'nil', 'nil'},
      {'nil' , 'nil', lava , lava , lava , lava , 'nil', 'nil', 'nil'},
      {'nil' , 'nil', 'nil', lava , lava , 'nil', 'nil', lava , 'nil'},
      {'nil' , lava , 'nil', lava , lava , lava , lava , lava , 'nil'},
      {'nil' , 'nil', 'nil', lava , 'nil', 'nil', 'nil', lava , 'nil'},
      {'nil' , 'nil', lava , lava , 'nil', lava , 'nil', 'nil', 'nil'},
      {'nil' , 'nil', 'nil', 'nil', 'nil', lava , lava , 'nil', 'nil'},
      {'nil' , lava , lava , lava , lava , lava , 'nil', 'nil', 'nil'},
      {'nil' , lava , 'nil', 'nil', 'nil', lava , 'nil', lava , 'nil'},
      {'nil' , 'nil', 'nil', lava , 'nil', 'nil', 'nil', lava , 'nil'},
      {'nil' , 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil'},
    }
    map3 = Map:new(template3)

    

    template4 = { 
      {wall, floor, wall_end, wall_end, wall_end, wall_end, wall_end, floor1, wall},
      {wall3, floor, wall_end, floor, floor, floor, wall_end, floor, wall1},
      {wall3, floor, floor, wall_end, wall_end, wall_end, floor1, floor, wall1},
      {wall1, floor, wall_end2, wall_end2, wall_end2, wall_end2, wall_end2, floor, wall},
      {banner, floor, wall_end2, floor, wall_end2, floor, wall_end2, floor, wall3},
      {wall, floor1, wall_end2, floor, floor, floor, wall_end2, floor, wall1},
      {banner, floor, wall_end, wall_end, wall_end, wall_end, wall_end, floor, wall},
      {wall, floor, wall_end, floor, wall_end, floor, floor, floor, wall1},
      {wall1, floor, wall_end, wall_end, wall_end, wall_end, wall_end, floor, wall2},
      {wall3, floor1, wall_end2, wall_end2, wall_end2, wall_end2, wall_end2, floor1, wall1},
      {wall3, floor1, wall_end2, floor, floor, floor, wall_end2, floor1, wall1},
      {wall, floor1, floor, wall_end2, wall_end2, wall_end2, floor1, floor, wall3},
      {wall3, wall1, wall1, wall3, wall1, wall, wall, wall, wall},
    }
    map4 = Map:new(template4)
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
if(x < 67)then 
    x = x + 2
end
if(x > 720)then 
  x = x - 2
end
if(y < 60)then 
  y = y + 2
end
if(y > 450)then 
  y = y - 2
end
if cc(x, y, w, h, x2, y2, w2, h2) == true then
 collide2 = true
 game_end = true
 col = 2
end
if cc(x, y, w, h, x3, y3, w2, h2) == true and game_end == true then
  game_end2 = true
 end
if (collide == true and col == 1) then  
  hp = hp - 0.8
end
if (collide3 == true and col == 2) then  
  hp = hp - 0.8
end
if(hp < 0)then
  hp = 0
end
if map2:cc(x , y , w , h) == true then
  collide = true
else
  collide = false
end
if map3:cc(x , y , w , h) == true then
  collide3 = true
else
  collide3 = false
end
if(collide3 == true and collide == true)then
  collide8 = true
else
  collide8 = false
end
end






function love.draw()
  map:draw()
  map2:draw()
  if(collide2 == true)then 
    map12:draw()
    map3:draw()
  end
  if(hp > 0)then
    love.graphics.draw(playerImg, x, y)
  end
  if(game_end2 == true)then
   love.exitModule();
 end
  love.graphics.print(hp, 10, 10)
  love.graphics.print(x, 10, 30)
  love.graphics.print(y, 10, 40)
  if(hp > 0)then
    love.graphics.draw(playerImg, x, y)
  end
  if(hp == 0)then
    love.exitModule();
  end
  if(collide8 == true)then
    love.graphics.setColor(1, 0, 0, 1)
  else
  love.graphics.setColor(1, 1, 1, 1)
  end  
end
local Map = require 'core/map'
function love.load()
 playerImg = love.graphics.newImage('assets-1/monster/animals/fire_bat.png')
  cobalt = love.graphics.newImage('assets-1/dungeon/floor/black_cobalt_1.png')
  stone = love.graphics.newImage('assets-1/dungeon/wall/cobalt_stone_8.png')
  openDoor = love.graphics.newImage('assets-1/dungeon/doors/vgate_open_down.png')
  closedDoor = love.graphics.newImage('assets-1/dungeon/doors/vgate_open_down.png')
  switch = love.graphics.newImage('assets-1/dungeon/doors/vgate_open_down.png')
  endDoor = love.graphics.newImage('assets-1/dungeon/doors/fleshy_orifice_closed.png')
  
  currentDoor = closedDoor
 x = 400
 y = 400

 floor = {
           {cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt},
           {cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt},
           {cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt},
           {cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt},
           {cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt},
           {cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt},
           {cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt},
           {cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt},
           {cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt},
           {cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt},
           {cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt},
           {cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt},
           {cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt},
           {cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt},
 
 }

 map = Map:new(floor)


 wall = {
       {stone, stone, stone, stone},
       {stone, 'nil', 'nil', stone},
       {stone, 'nil', 'nil', stone},
       {stone, 'nil', 'nil', 'nil'},
       {stone, 'nil', 'nil', stone},                                  
       {stone, stone, stone, stone},

}
wall = Map:new(wall)
end
 


function love.update(dt)
  if love.keyboard.isDown('right')then -- if the 'up' key is being pressed
    x = x + 5
  end
  if love.keyboard.isDown('left')then -- if the 'up' key is being pressed
    x = x - 5
  end
  if love.keyboard.isDown('down')then -- if the 'up' key is being pressed
    y = y + 5
  end
  if love.keyboard.isDown('up')then -- if the 'up' key is being pressed
  y = y - 5
  end
  if love.keyboard.isDown('escape')then -- if the 'up' key is being pressed
    love.exitModule() 
  end
  if cc(x, y, 64, 64,   70, 60, 55, 55) == true then
  love.exitModule() -- end the level when the two rectangles collide
 end
end






function love.draw()
  love.graphics.print('Hello, world!', 10, 10)
  map:draw()
  wall:draw()
  love.graphics.draw(playerImg,x,y)
  love.graphics.draw(currentDoor, 192, 190)
  love.graphics.draw(switch, 513, 190)
  love.graphics.draw(endDoor, 90, 80)
end

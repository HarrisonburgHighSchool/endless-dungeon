local Map = require 'core/map'
function love.load()
 playerImg = love.graphics.newImage('assets-1/monster/animals/fire_bat.png')
  cobalt = love.graphics.newImage('assets-1/dungeon/floor/black_cobalt_1.png')
  cobalt = love.graphics.newImage('assets-1/dungeon/wall/cobalt_stone_8.png')
  openDoor = love.graphics.newImage('asset-1/dungeon/doors/vgate_open_down.png')
  closedDoor = love.graphics.newImage('asset-1/dungeon/doors/vgate_open_down.png')
  switch = love.graphics.newImage('asset-1/dungeon/doors/vgate_open_down.png')
  
  currentDoor = closedDoor
 x = 400
 y = 400

 floor = {
           {cobalt, cobalt, cobalt, cobalt, cobalt, cobalt},
           {cobalt, cobalt, cobalt, cobalt, cobalt, cobalt},
           {cobalt, cobalt, cobalt, cobalt, cobalt, cobalt},
           {cobalt, cobalt, cobalt, cobalt, cobalt, cobalt},
           {cobalt, 'nil', 'nil', 'nil', 'nil', cobalt},
           {cobalt, 'nil', 'nil', 'nil', 'nil', cobalt},
           {cobalt, 'nil', 'nil', 'nil', 'nil', cobalt},
           {cobalt, 'nil', 'nil', 'nil', 'nil', cobalt},
           {cobalt, 'nil', 'nil', 'nil', 'nil', cobalt},
           {cobalt, 'nil', 'nil', 'nil', 'nil', cobalt},
           {cobalt, 'nil', 'nil', 'nil', 'nil', cobalt},
           {cobalt, cobalt, cobalt, cobalt, cobalt, cobalt},
           {cobalt, cobalt, cobalt, cobalt, cobalt, cobalt},
           {cobalt, cobalt, cobalt, cobalt, cobalt, cobalt},
           {cobalt, cobalt, cobalt, cobalt, cobalt, cobalt},
 
 }

 map = Map:new(floor)


 wall = {
       {stone, stone, stone, stone},
       {stone, 'nil', 'nil', stone},
       {stone, 'nil', 'nil', stone},
       {stone, 'nil', 'nil', stone},
       {stone, 'nil', 'nil', stone},                                  
       {stone, stone, stone, stone},

}
wall = Map:new(wall)
end
 


function love.update(dt)
  if love.keyboard.isPressed('right')then -- if the 'up' key is being pressed
    x = x + 15
  end
  if love.keyboard.isPressed('left')then -- if the 'up' key is being pressed
    x = x - 15
  end
  if love.keyboard.isPressed('down')then -- if the 'up' key is being pressed
    y = y + 15
  end
  if love.keyboard.isPressed('up')then -- if the 'up' key is being pressed
  y = y - 15
  end
  if cc(x, y, 64, 64,   200, 200, 64, 64) == true then
  --if true then open
 end

end






function love.draw()
  love.graphics.print('Hello, world!', 10, 10)
  map:draw()
  wall:draw()
  love.graphics.draw(playerImg, x, y)
  love.graphics.draw(currentDoor, 500, 500)
love.graphics.draw(switch, 200, 200)
end

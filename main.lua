local Map = require 'core/map'

function love.load()
 
  --player = Entity:new() -- Create the Entity object named player

 

  wall = love.graphics.newImage('assets-1/dungeon/wall/zot_blue_0.png')
  floor = love.graphics.newImage('assets-1/dungeon/floor/white_marble_0.png')
  template = {-- a 3 x 3 map with the floor texture in the middle
  {wall, wall, wall, wall, wall, wall, wall, wall, wall},
    {wall, floor, floor, floor, wall, floor, wall, wall},
    {wall, floor, floor, floor, wall, floor, wall, wall},
    {wall, floor, floor, floor, wall, floor, wall, wall},
    {wall, floor, floor, floor, wall, floor, wall, wall},
    {wall, floor, floor, floor, wall, floor, wall, wall},
    {wall, floor, floor, floor, wall, floor, wall, wall},
    {wall, floor, floor, floor, wall, floor, wall, wall},
    {wall, floor, floor, floor, wall, floor, wall, wall},
    {wall, floor, floor, floor, wall, floor, wall, wall},
    {wall, floor, floor, floor, wall, floor, wall, wall},
    {wall, floor, floor, floor, wall, floor, wall, wall},
    {wall, floor, floor, floor, wall, floor, wall, wall},
    {wall, floor, floor, floor, wall, floor, wall, wall},
    {wall, floor, floor, floor, wall, floor, wall, wall},
    {wall, floor, floor, floor, wall, floor, wall, wall},
    {wall, floor, floor, floor, wall, floor, wall, wall},
    {wall, floor, floor, floor, wall, floor, wall, wall},
    {wall, wall, wall, wall, wall, wall, wall, wall, wall},
    {wall, wall, wall, wall, wall, wall, wall, wall, wall, wall, wall},}


  
  map = Map:new(template)
x = 400
y = 300
playerImg = love.graphics.newImage('assets-1/player/base/octopode_2.png')
end

function love.update(dt)
 if love.keyboard.isDown('right') then  
x = x + 9
end
if love.keyboard.isDown('down') then  
y = y + 9
end
if love.keyboard.isDown('left') then  
x = x - 9
end
if love.keyboard.isDown('up') then 
  y = y - 9
end
-- nothing to update
end

function love.draw()
  map:draw()
  love.graphics.print('Octopod-cast!', 0, 0)
  love.graphics.draw(playerImg, x, y)
   -- Create a 14 x 14 floor object named "Floor"
  --- Create a
  --player:draw() -- Draw the entity object named player
  

end

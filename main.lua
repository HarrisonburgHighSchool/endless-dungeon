local Map = require 'core/map'
--local Entity = require 'core/entity'
function cc(x1, y1, w1, h1, x2, y2, w2, h2)
end

  function love.load()
 
  --player = Entity:new() -- Create the Entity object named player

 

  wall = love.graphics.newImage('assets-1/dungeon/wall/zot_blue_0.png')
  floor = love.graphics.newImage('assets-1/dungeon/floor/white_marble_0.png')
  template = {-- a 10 x 10 map with the floor texture in the middle
  {wall, wall, wall, wall, wall, wall, wall, wall, wall, wall, wall},
    {wall, floor, floor, floor, floor, floor, floor, wall, wall, wall},
    {wall, floor, floor, floor, floor, floor, floor, wall, wall, wall},
    {wall, floor, floor, floor, floor, floor, floor, wall, wall, wall},
    {wall, floor, floor, floor, floor, floor, floor, wall, wall, wall},
    {wall, floor, floor, floor, floor, floor, floor, wall, wall, wall},
    {wall, floor, floor, floor, floor, floor, floor, wall, wall, wall},
    {wall, floor, floor, floor, floor, floor, floor, wall, wall, wall},
    {wall, floor, floor, floor, floor, floor, floor, wall, wall, wall},
    {wall, floor, floor, floor, floor, floor, floor, wall, wall, wall},
    {wall, floor, floor, floor, floor, floor, floor, wall, wall, wall},
    {wall, floor, floor, floor, floor, floor, floor, wall, wall, wall},
    {wall, wall, wall, floor, floor, wall, wall, wall, wall, wall},
    {wall, floor, floor, floor, floor, floor, wall, wall, wall, wall},
    {wall, floor, floor, floor, floor, floor, wall, wall, wall, wall},
    {wall, floor, floor, floor, floor, floor, wall, wall, wall, wall},
    {wall, floor, floor, floor, floor, floor, wall, wall, wall, wall},
    {wall, wall, wall, floor, wall, wall, wall, wall, wall, wall},
    {wall, wall, wall, wall, wall, wall, wall, wall, wall, wall, wall},
    {wall, wall, wall, wall, wall, wall, wall, wall, wall, wall, wall},}


  
  map = Map:new(template)
x = 400
y = 300
playerImg = love.graphics.newImage('assets-1/player/base/octopode_2.png')
w = 64   -- The player's width is 64
h = 64   -- The player's height is 64
hp = 100 -- Set the player's HP to 100 at the start of the game

--img = love.graphics.newImage('assets')
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
-- x, y, w, h all represent the player's rectangle. The other values are a rectangle in the upper corner
 if cc(x1, y1, w1, h1,   x2, y2, w2, h2) then
  -- if true, decrease HP:
   love.graphics.draw(img, x1,y2)
 end


function love.draw()
  map:draw()
  love.graphics.print('Octopod-cast!', 0, 0)
 
  -- Draw the player
  love.graphics.draw(playerImg, x, y)
 
  -- Draw the rectangle in the upper left corner
  love.graphics.rectangle('line', 0, 0, 64, 64)

 -- Print the player's HP in the top left corner
 love.graphics.print(hp, 0, 0)
end
  --player:draw() -- Draw the entity object named player
  




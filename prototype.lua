local Map = require 'core/map'
local Util = require 'core/util'
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

playerImg = love.graphics.newImage('assets-1/monster/gnome.png')
x = 400
y = 300
w = 200   -- The player's width is 50
h = 200   -- The player's height is 50
hp = 100 -- Set the player's HP to 100 at the start of the game
enemyImg = love.graphics.newImage('assets-1/player/base/octopode_2.png')
z = 100 -- The enemy's width is 50
g = 150 -- The enemy's height is 50
--img = love.graphics.newImage('assets')
end

function love.update(dt)
 if love.keyboard.isDown('right') then
  if cc(x, y, 128, 128, 300, 400, 128, 128) == false then
 x = x + 9 
end
end
if love.keyboard.isDown('down') then
  if cc(x, y, 128, 128, 300, 400, 128, 128) == false then
  y = y + 9
end
end
if love.keyboard.isDown('left') then
  if cc(x, y, 128, 128, 300, 400, 128, 128) == false then
 x = x - 9
end
end
if love.keyboard.isDown('up') then 
  if cc(x, y, 128, 128, 300, 400, 128, 128) == false then
  y = y - 9
end
end
-- nothing to update
end
-- x, y, w, h all represent the player's rectangle. The other values are a rectangle in the upper corner

  -- if true, decrease HP:
  if love.keyboard.isDown('right') then  
   
    if love.keyboard.isDown('down') then  
    h = h + 200
    end
    if love.keyboard.isDown('left') then  
    w = w - 200
    end
    if love.keyboard.isDown('up') then 
      h = h - 200
    end 
  
    love.graphics.draw(img, x1,y2)
    
    if love.keyboard.isDown ('w') then
    if cc(x1, y1, -1, w1, h1,    100, 200, 64, 64) ==  false then
      y = y - 1
    end
  end
end 


function love.draw()
  map:draw()
  love.graphics.print('Octopod-cast!', 0, 0)
 
  -- Draw the enemy
  love.graphics.draw(enemyImg, z, g)

  -- Draw the player
  love.graphics.draw(playerImg, x, y)
 
  -- Draw the rectangle in the upper left corner
  love.graphics.rectangle('line', 0, 0, 64, 64)

 -- Print the player's HP in the top left corner
 love.graphics.print(hp, 0, 0)
end
  --player:draw() -- Draw the entity object named player
  




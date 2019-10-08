local Map = require 'core/map'
local gamera = require 'core/gamera'

function cc(x1, y1, w1, h1, x2, y2, w2, h2)
end

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
w = 64   -- The player's width is 64
h = 64   -- The player's height is 64
hp = 100 -- Set the player's HP to 100 at the start of the game

cam = gamera.new(0, 0, 2000, 2000) -- Create a camera that can move in a rectangle from 0, 0 to 2000, 2000

cam:setPosition(400, 400)
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
 if cc(x, y, w, h,   0,0, 64, 64) then
  -- if true, decrease HP:
   hp = hp - 1
 end


function love.draw()
  map:draw()
  love.graphics.print('Octopod-cast!', 0, 0)
 
 
  cam:draw(function(x, y, w, h)
  
  -- Draw everything here. For example:
  love.graphics.draw(playerImg, x, y)
  
  end)

  -- Draw the player
  love.graphics.draw(playerImg, x, y)
 
  -- Draw the rectangle in the upper left corner
  love.graphics.rectangle('line', 0, 0, 64, 64)

 -- Print the player's HP in the top left corner
 love.graphics.print(hp, 0, 0)
end
  --player:draw() -- Draw the entity object named player
  




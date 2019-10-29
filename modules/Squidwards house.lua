local Map = require 'core/map'
local Util = require 'core/util'
--local Entity = require 'core/entity'


  function love.load()
 
  --player = Entity:new() -- Create the Entity object named player

  openDoor = love.graphics.newImage('assets-1/dungeon/doors/vgate_open_middle.png')
  closedDoor = love.graphics.newImage('assets-1/dungeon/doors/vgate_closed_middle.png')
  switch = love.graphics.newImage('assets-1/dungeon/vaults/disco_ball.png')
  deathTrap = love.graphics.newImage('assets-2/item/misc/runes/rune_gloorx_vloq.png')
  currentDoor = closedDoor


  -- Create the collision map, with walls around the edge of the map
  wall = love.graphics.newImage('assets-1/dungeon/wall/catacombs_4.png')
  collision = {
    {wall, wall, wall, wall, wall, wall, wall, wall, wall, wall},
    {wall, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', wall, wall, wall},
    {wall, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', wall, wall, wall},
    {wall, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', wall, wall, wall},
    {wall, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', wall, wall, wall},
    {wall, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', wall, wall, wall},
    {wall, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', wall, wall, wall},
    {wall, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', wall, wall, wall},
    {wall, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', wall, wall, wall},
    {wall, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', wall, wall, wall},
    {wall, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', wall, wall, wall},
    {wall, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', wall, wall, wall},
    {wall, wall, wall, 'nil', 'nil', wall, wall, wall, wall, wall},
    {wall, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', wall, wall, wall},
    {wall, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', wall, wall, wall},
    {wall, wall, wall, 'nil', 'nil', wall, wall, wall, wall, wall, wall},
    {wall, wall, wall, wall, wall, wall, wall, wall, wall, wall, wall},
    {wall, wall, wall, wall, wall, wall, wall, wall, wall, wall, wall},}
  -- Create the background map
  floor = love.graphics.newImage('assets-1/dungeon/floor/floor_vines_0.png')
  background = {
    {floor, floor, floor, floor, floor, floor},
    {floor, floor, floor, floor, floor, floor},
    {floor, floor, floor, floor, floor, floor},
    {floor, floor, floor, floor, floor, floor},
    {floor, floor, floor, floor, floor, floor},
    {floor, floor, floor, floor, floor, floor},
    {floor, floor, floor, floor, floor, floor},
    {floor, floor, floor, floor, floor, floor},
    {floor, floor, floor, floor, floor, floor},
    {floor, floor},
    {floor, floor, floor, floor, floor, floor},
    {floor, floor, floor, floor, floor, floor},
    {floor, floor, floor, floor, floor, floor},
    {floor, floor, floor, floor, floor, floor},
  }
    --Finally create your maps
    collision = Map:new (collision)
    --background = Map:new (background)
    
    
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

 

playerImg = love.graphics.newImage('assets-1/player/base/formicid.png')
x = 400
y = 300
w = 200   -- The player's width is 50
h = 200   -- The player's height is 50
hp = 100 -- Set the player's HP to 100 at the start of the game
PNG = love.graphics.newImage('assets-1/player/base/octopode_2.png')
z = 100 -- The enemy's width is 50
g = 250 -- The enemy's height is 50
--img = love.graphics.newImage('assets')
end

function love.update(dt)
  if cc(x, y, 64, 64,   200, 200, 64, 64) == true then
    currentDoor = openDoor
  end
  if love.keyboard.isDown('right') then
    if collision:cc(x + 4, y, 64, 64) == false then
      x = x + 4
    end
  end
  if love.keyboard.isDown('down') then
    if collision:cc(x, y + 4, 64, 64) == false then
      y = y + 4
    end
  end
  if love.keyboard.isDown('left') then
    if collision:cc(x - 4, y, 64, 64) == false then
      x = x - 4
    end
  end
  if love.keyboard.isDown('up') then 
    if collision:cc(x, y - 4, 64, 64) == false then
      y = y - 4
    end
  end
  if love.keyboard.isDown ('escape') then 
    love.exitModule();
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
    
    if love.keyboard.isDown ('B') then
      if cc(x1, y1, -1, w1, h1,    100, 200, 64, 64) ==  false then
        y = y - 1
      end
    end
end 


function love.draw()
  map:draw()
  collision:draw()
  love.graphics.print('', 0, 0)
  
  love.graphics.draw(currentDoor, 764, 92)
  love.graphics.draw(switch, 200, 200)
  love.graphics.draw(deathTrap, 200, 400)
  -- Draw the enemy
  love.graphics.draw(PNG, z, g)

  -- Draw the player
  love.graphics.draw(playerImg, x, y)
 
  -- Draw the rectangle in the upper left corner
  love.graphics.rectangle('line', 0, 0, 64, 64)

 -- Print the player's HP in the top left corner
 love.graphics.print(hp, 0, 0)

 love.graphics.print("So you must be Bob the shape-shifting alien? You have to solve all the puzzles in order to get out of here.",  100, 100)
if cc(x, y, 64, 64,   100, 100, 40, 40) == true then
 -- What should go here?
end
love.graphics.print("Don't pick up this rune, it will actually kill you.",  100, 150)
if cc(x, y, 64, 64,   100, 100, 40, 40) == true then
 -- What should go here?
end
end
 --player:draw() -- Draw the entity object named player 
 
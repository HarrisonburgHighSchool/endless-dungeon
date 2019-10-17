local Map = require 'core/map'
local Util = require 'core/util'
local anim8 = require 'core/anim8'
love.graphics.setDefaultFilter('nearest', 'nearest')

function love.load()
  love.window.setMode(768, 576)

  x = 368
  y = 280
  w = 32   -- The player's width is 64
  h = 32   -- The player's height is 64
  hp = 100 -- Set the player's HP to 100 at the start of the game
  spritesheet = love.graphics.newImage('hero/Old hero.png')
  grid = anim8.newGrid(16, 16, spritesheet:getWidth(), spritesheet:getHeight())
  walk = anim8.newAnimation(grid('1-6', 2), 0.2)

  rectFloor = love.graphics.newImage('assets-1/dungeon/floor/rect_gray_0.png')
  rect1Floor = love.graphics.newImage('assets-1/dungeon/floor/rect_gray_1.png')
  rect2Floor = love.graphics.newImage('assets-1/dungeon/floor/rect_gray_2.png')
  rect3Floor = love.graphics.newImage('assets-1/dungeon/floor/rect_gray_3.png')
  wall = love.graphics.newImage('assets-1/dungeon/wall/stone_2_dark0.png')
  doorway = love.graphics.newImage('assets-2/dc-dngn/gateways/dngn_enter_dis.png')
  trap1 = love.graphics.newImage('assets-2/dc-dngn/dngn_trap_axe.png')

  template = {
 
  {wall, wall, wall, wall, wall, wall, wall, wall, wall, wall},
  {doorway, rect1Floor, rect2Floor, rect3Floor, rectFloor, rect1Floor, rect2Floor, rect3Floor, wall},
  {doorway, rect1Floor, rect2Floor, rect3Floor, rectFloor, rect1Floor, rect2Floor, rect3Floor, wall},
  {doorway, rect1Floor, rect2Floor, rect3Floor, rectFloor, rect1Floor, rect2Floor, rect3Floor, wall},
  {doorway, rect1Floor, rect2Floor, rect3Floor, rectFloor, rect1Floor, rect2Floor, rect3Floor, wall},
  {doorway, rect1Floor, rect2Floor, rect3Floor, rectFloor, rect1Floor, rect2Floor, rect3Floor, wall},
  {doorway, rect1Floor, rect2Floor, rect3Floor, rectFloor, rect1Floor, rect2Floor, rect3Floor, wall},
  {doorway, rect1Floor, rect2Floor, rect3Floor, rectFloor, rect1Floor, rect2Floor, rect3Floor, wall},
  {doorway, rect1Floor, rect2Floor, rect3Floor, rectFloor, rect1Floor, rect2Floor, rect3Floor, wall},
  {doorway, rect1Floor, rect2Floor, rect3Floor, rectFloor, rect1Floor, rect2Floor, rect3Floor, wall},
  {doorway, rect1Floor, rect2Floor, rect3Floor, rectFloor, rect1Floor, rect2Floor, rect3Floor, wall},
  {wall, wall, wall, wall, wall, wall, wall, wall, wall, wall},
}

 -- Create the collision map, with walls around the edge of the map
  collision = {
    {wall, wall, wall, wall, wall, wall, wall, wall, wall, wall},
  {nil, nil, nil, nil, nil, nil, nil, nil, wall},
  {nil, nil, nil, nil, nil, nil, nil, nil, wall},
  {nil, nil, nil, nil, nil, nil, nil, nil, wall},
  {nil, nil, nil, nil, nil, nil, nil, nil, wall},
  {nil, nil, nil, nil, nil, nil, nil, nil, wall},
  {nil, nil, nil, nil, nil, nil, nil, nil, wall},
  {nil, nil, nil, nil, nil, nil, nil, nil, wall},
  {nil, nil, nil, nil, nil, nil, nil, nil, wall},
  {nil, nil, nil, nil, nil, nil, nil, nil, wall},
  {nil, nil, nil, nil, nil, nil, nil, nil, wall},
  {wall, wall, wall, wall, wall, wall, wall, wall, wall, wall},
}

  map = Map:new(template)
  collision = Map:new(collision)
end

function love.update(dt)
 
  walk:update(dt)

--x, y, w, h all represent the player's rectangle.
--If the statement is true it will run the code, but if it is false it will skip it.
if love.keyboard.isDown('w') and y > 18 then -- up
  if collision:cc(x, y - 2 , 28, 32) == false then
    y = y - 2 -- speed
  end
end 
if love.keyboard.isDown('a') then -- left
  if collision:cc(x - 2 , y, 28, 32) == false then  
    x = x - 2 -- speed
  end
end
if love.keyboard.isDown('s') then -- down
  if collision:cc(x, y + 2 , 28, 32) == false then  
    y = y + 2 -- speed
  end
end
if love.keyboard.isDown('d') then -- right
  if collision:cc(x + 2  , y , 28, 32) == false then  
    x = x + 2 -- speed
  end
 end
end

function love.draw()
  map:draw()
  collision:draw()
  walk:draw(spritesheet, x, y, 0, 2)

end
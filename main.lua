local Map = require 'core/map'
local Util = require 'core/util'
love.graphics.setDefaultFilter('nearest', 'nearest')

function love.load()
  love.window.setMode(768, 576)
  x = 368
  y = 280
  w = 32   -- The player's width is 64
  h = 32   -- The player's height is 64
  hp = 100 -- Set the player's HP to 100 at the start of the game
  playerImg = love.graphics.newImage('assets-1/monster/deep_elf_fighter.png')

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
  {nil, nil, nil, nil, trap1, nil, nil, nil, wall},
  {nil, nil, nil, nil, trap1, nil, nil, nil, wall},
  {nil, nil, nil, nil, trap1, nil, nil, nil, wall},
  {nil, nil, nil, nil, trap1, nil, nil, nil, wall},
  {nil, nil, nil, nil, trap1, nil, nil, nil, wall},
  {nil, nil, nil, nil, trap1, nil, nil, nil, wall},
  {nil, nil, nil, nil, trap1, nil, nil, nil, wall},
  {nil, nil, nil, nil, trap1, nil, nil, nil, wall},
  {nil, nil, nil, nil, trap1, nil, nil, nil, wall},
  {nil, nil, nil, nil, trap1, nil, nil, nil, wall},
  {wall, wall, wall, wall, wall, wall, wall, wall, wall, wall},
}

  map = Map:new(template)
  collision = Map:new(collision)

end


function love.update(dt)
 
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


-- local dx = 0
-- local dy = 0
-- if love.keyboard.isDown('w') and y > 18 then
--   dy = - 2
-- end
-- if love.keyboard.isDown('a') and  x > 61 then
--   dx = - 2
-- end
-- if love.keyboard.isDown('s') and y < 482 then
--   dy = 2
-- end
-- if love.keyboard.isDown('d') and x < 677 then
--   dx = 2
-- end

-- if cc(x + dx, y + dy, 64, 64, 230, 227, 21, 30) == false then
--   x = x + dx
--   y = y + dy
-- end
-- end






function love.draw()
  map:draw()
  collision:draw()
  love.graphics.draw(playerImg, x, y)
  
end

local Map = require 'core/map'
local Util = require 'core/util'

love.graphics.setDefaultFilter('nearest', 'nearest')
function love.load()
  love.window.setMode(768, 576)
  x = 368
  y = 280
  playerImg = love.graphics.newImage('assets-1/monster/deep_elf_fighter.png')
  w = 64   -- The player's width is 64
  h = 64   -- The player's height is 64
  hp = 100 -- Set the player's HP to 100 at the start of the game

  rectFloor = love.graphics.newImage('assets-1/dungeon/floor/rect_gray_0.png')
  rect1Floor = love.graphics.newImage('assets-1/dungeon/floor/rect_gray_1.png')
  rect2Floor = love.graphics.newImage('assets-1/dungeon/floor/rect_gray_2.png')
  rect3Floor = love.graphics.newImage('assets-1/dungeon/floor/rect_gray_3.png')
  wall = love.graphics.newImage('assets-1/dungeon/wall/stone_2_dark0.png')
  doorway = love.graphics.newImage('assets-2/dc-dngn/gateways/dngn_enter_dis.png')
  

  template = { --a 3 x 3 map with the altar texture in the middle
 
  {wall, wall, wall, wall, wall, wall, wall, wall, wall, wall},
  {doorway, rect1Floor, rect2Floor, rect3Floor, rectFloor, rect1Floor, rect2Floor, rect3Floor, wall, wall},
  {doorway, rect1Floor, rect2Floor, rect3Floor, rectFloor, rect1Floor, rect2Floor, rect3Floor, wall, wall},
  {doorway, rect1Floor, rect2Floor, rect3Floor, rectFloor, rect1Floor, rect2Floor, rect3Floor, wall, wall},
  {doorway, rect1Floor, rect2Floor, rect3Floor, rectFloor, rect1Floor, rect2Floor, rect3Floor, wall, wall},
  {doorway, rect1Floor, rect2Floor, rect3Floor, rectFloor, rect1Floor, rect2Floor, rect3Floor, wall, wall},
  {doorway, rect1Floor, rect2Floor, rect3Floor, rectFloor, rect1Floor, rect2Floor, rect3Floor, wall, wall},
  {doorway, rect1Floor, rect2Floor, rect3Floor, rectFloor, rect1Floor, rect2Floor, rect3Floor, wall, wall},
  {doorway, rect1Floor, rect2Floor, rect3Floor, rectFloor, rect1Floor, rect2Floor, rect3Floor, wall, wall},
  {doorway, rect1Floor, rect2Floor, rect3Floor, rectFloor, rect1Floor, rect2Floor, rect3Floor, wall, wall},
  {doorway, rect1Floor, rect2Floor, rect3Floor, rectFloor, rect1Floor, rect2Floor, rect3Floor, wall, wall},
  {wall, wall, wall, wall, wall, wall, wall, wall, wall, wall},
  {wall, wall, wall, wall, wall, wall, wall, wall, wall, wall},
}
  map = Map:new(template)
  end
function love.update(dt)
  if love.keyboard.isDown('w') and y > 0 then   -- if the 'w' key is being pressed
    y = y - 2
  end
  if love.keyboard.isDown('a') and x > 0 then   -- if the 'a' key is being pressed
    x = x - 2
  end
  if love.keyboard.isDown('s') and y < 569 then   -- if the 's' key is being pressed
    y = y + 2
  end
  if love.keyboard.isDown('d') and x < 769 then   -- if the 'd' key is being pressed
    x = x + 2
  end
  -- x, y, w, h all represent the player's rectangle. The other values are a rectangle in the upper corner (LEFT WALL)
 if cc(x, y, w, h,   0, 0, 64, 640) then  
  -- if true, decrease HP:
  x = x + 2
 end
 -- x, y, w, h all represent the player's rectangle. The other values are a rectangle in the upper corner (RIGHT WALL)
 if cc(x, y, w, h,   738, 0, 128, 640) then  
  -- if true, decrease HP:
  x = x - 2 
 end
-- x, y, w, h all represent the player's rectangle. The other values are a rectangle in the upper corner (BOTTOM WALL)
if cc(x, y, w, h,   0, 546, 801, 64) then  
  -- if true, decrease HP:
  y = y - 2
 end
end


function love.draw()
  map:draw()
  love.graphics.draw(playerImg, x, y)

  love.graphics.print(hp, 0, 0)
end

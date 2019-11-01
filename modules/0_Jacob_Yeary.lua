local Map = require 'core/map'
local Util = require 'core/util'
local anim8 = require 'core/anim8'
love.graphics.setDefaultFilter('nearest', 'nearest')

function love.load()
  love.window.setMode(768, 576)
player = {
  x = 388,
  y = 468,
  w = 64,   -- The player's width is 64
  h = 64,   -- The player's height is 64
  hp = 100, -- Set the player's HP to 100 at the start of the game
  moving = false,
  flip = 2,
  img = love.graphics.newImage('hero/sliced/idle-1.png'),
  spritesheet = love.graphics.newImage('hero/Old hero.png'),
}
  grid = anim8.newGrid(16, 16, player.spritesheet:getWidth(), player.spritesheet:getHeight())
  player.walk = anim8.newAnimation(grid('1-6', 2), 0.2)

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
 
  player.walk:update(dt)
  moving = false
--x, y, w, h all represent the player's rectangle.
--If the statement is true it will run the code, but if it is false it will skip it.

if love.keyboard.isDown('w') and player.y > 18 or love.keyboard.isDown('up') and player.y > 18 then -- up
  if collision:cc(player.x, player.y - 4 , 10, 32) == false then
    player.y = player.y - 4 -- speed
  end
end 
if love.keyboard.isDown('a') or love.keyboard.isDown('left') then -- left
  moving = true
  flip = -2
  if collision:cc(player.x - 4 , player.y, 10, 32) == false then  
    player.x = player.x - 4 -- speed
  end
end
if love.keyboard.isDown('s') or love.keyboard.isDown('down') then -- down
  if collision:cc(player.x, player.y + 4 , 10, 32) == false then  
    player.y = player.y + 4 -- speed
  end
end
if love.keyboard.isDown('d') or love.keyboard.isDown('right') then -- right
  moving = true
  flip = 2
  if collision:cc(player.x + 4  , player.y , 10, 32) == false then  
    player.x = player.x + 4 -- speed
  end
 end
end

function love.draw()
  map:draw()
  collision:draw()
  if moving == true then
    player.walk:draw(player.spritesheet, player.x, player.y, 0, flip, 2, 9)
  else
    love.graphics.draw(player.img, player.x, player.y, 0, 2, 2, 9)
  end
end
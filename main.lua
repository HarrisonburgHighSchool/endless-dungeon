local Map = require 'core/map'

love.graphics.setDefaultFilter('nearest', 'nearest')
function love.load()
  x = 50
  y = 285
  rectFloor = love.graphics.newImage('assets-1/dungeon/floor/rect_gray_0.png')
  rect1Floor = love.graphics.newImage('assets-1/dungeon/floor/rect_gray_1.png')
  rect2Floor = love.graphics.newImage('assets-1/dungeon/floor/rect_gray_2.png')
  rect3Floor = love.graphics.newImage('assets-1/dungeon/floor/rect_gray_3.png')
  doorway = love.graphics.newImage('assets-2/dc-dngn/gateways/dngn_enter_dis.png')
  cobaltWall = love.graphics.newImage('assets-1/dungeon/wall/cobalt_stone_1.png')
  axeTrap = love.graphics.newImage('assets-2/dc-dngn/dngn_trap_axe.png')
  shaftTrap = love.graphics.newImage('assets-2/dc-dngn/dngn_trap_shaft.png')
  playerImg = love.graphics.newImage('assets-1/monster/juggernaut.png')

  template = { --a 3 x 3 map with the altar texture in the middle
 
  {doorway, rect1Floor, rect2Floor, rect3Floor, rectFloor, rect1Floor, rect2Floor, rect3Floor, rectFloor, rect1Floor},
  {doorway, rect1Floor, rect2Floor, rect3Floor, rectFloor, rect1Floor, rect2Floor, rect3Floor, rectFloor, rect1Floor},
  {doorway, rect1Floor, rect2Floor, rect3Floor, rectFloor, rect1Floor, rect2Floor, rect3Floor, rectFloor, rect1Floor},
  {doorway, rect1Floor, rect2Floor, rect3Floor, rectFloor, rect1Floor, rect2Floor, rect3Floor, rectFloor, rect1Floor},
  {doorway, rect1Floor, rect2Floor, rect3Floor, rectFloor, rect1Floor, rect2Floor, rect3Floor, rectFloor, rect1Floor},
  {doorway, rect1Floor, rect2Floor, rect3Floor, rectFloor, rect1Floor, rect2Floor, rect3Floor, rectFloor, rect1Floor},
  {doorway, rect1Floor, rect2Floor, rect3Floor, rectFloor, rect1Floor, rect2Floor, rect3Floor, rectFloor, rect1Floor},
  {doorway, rect1Floor, rect2Floor, rect3Floor, rectFloor, rect1Floor, rect2Floor, rect3Floor, rectFloor, rect1Floor},
  {doorway, rect1Floor, rect2Floor, rect3Floor, rectFloor, rect1Floor, rect2Floor, rect3Floor, rectFloor, rect1Floor},
  {doorway, rect1Floor, rect2Floor, rect3Floor, rectFloor, rect1Floor, rect2Floor, rect3Floor, rectFloor, rect1Floor},
  {doorway, rect1Floor, rect2Floor, rect3Floor, rectFloor, rect1Floor, rect2Floor, rect3Floor, rectFloor, rect1Floor},
  {doorway, rect1Floor, rect2Floor, rect3Floor, rectFloor, rect1Floor, rect2Floor, rect3Floor, rectFloor, rect1Floor},
  {doorway, rect1Floor, rect2Floor, rect3Floor, rectFloor, rect1Floor, rect2Floor, rect3Floor, rectFloor, rect1Floor},
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
end


function love.draw()
  map:draw()
  love.graphics.draw(playerImg, x, y)
end

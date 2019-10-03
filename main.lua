local Map = require 'core/map'

function love.load()
  x = 50
  y = 285
  crystalFloor = love.graphics.newImage('assets-2/dc-dngn/floor/cobble_blood4.png')
  doorway = love.graphics.newImage('assets-2/dc-dngn/gateways/dngn_enter_dis.png')
  altar1 = love.graphics.newImage('assets-2/dc-dngn/altars/dngn_altar_xom3.png')
  altar2 = love.graphics.newImage('assets-2/dc-dngn/altars/dngn_altar_xom1.png')
  altar3 = love.graphics.newImage('assets-2/dc-dngn/altars/dngn_altar_xom2.png')
  altar4 = love.graphics.newImage('assets-2/dc-dngn/altars/dngn_altar_xom4.png')
  axeTrap = love.graphics.newImage('assets-2/dc-dngn/dngn_trap_axe.png')
  shaftTrap = love.graphics.newImage('assets-2/dc-dngn/dngn_trap_shaft.png')
  playerImg = love.graphics.newImage('assets-1/monster/juggernaut.png')

  template = { --a 3 x 3 map with the altar texture in the middle
  {altar1, doorway, doorway, doorway, doorway, doorway, doorway, doorway, doorway, doorway, doorway, doorway, doorway, doorway, doorway, doorway, doorway, doorway, altar4},
  {doorway, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, doorway},
  {doorway, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, doorway},
  {doorway, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, doorway},
  {doorway, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, doorway},
  {doorway, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, doorway},
  {doorway, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, doorway},
  {doorway, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, doorway},
  {doorway, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, doorway},
  {doorway, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, doorway},
  {doorway, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, doorway},
  {doorway, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, doorway},
  {doorway, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, doorway},
  {doorway, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, doorway},
  {doorway, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, doorway},
  {doorway, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, doorway},
  {doorway, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, doorway},
  {doorway, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, doorway},
  {axeTrap, axeTrap, axeTrap, axeTrap, axeTrap, axeTrap, axeTrap, axeTrap, axeTrap, axeTrap, axeTrap, axeTrap, axeTrap, axeTrap, axeTrap, axeTrap, axeTrap, axeTrap, axeTrap},
  {doorway, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, doorway},
  {doorway, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, doorway},
  {doorway, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, doorway},
  {doorway, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, doorway},
  {doorway, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, doorway},
  {altar2, doorway, doorway, doorway, doorway, doorway, doorway, doorway, doorway, doorway, doorway, doorway, doorway, doorway, doorway, doorway, doorway, doorway, altar3},
}
  map = Map:new(template)
end
-- DELETE THIS

function love.update(dt)
  if love.keyboard.isDown('w') and y > 0 then   -- if the 'up' key is being pressed
    y = y - 2
  end
  if love.keyboard.isDown('s') and y < 569 then   -- if the 'up' key is being pressed
    y = y + 2
  end
  if love.keyboard.isDown('a') and x > 0 then   -- if the 'up' key is being pressed
    x = x - 2
  end
  if love.keyboard.isDown('d') and x < 769 then   -- if the 'up' key is being pressed
    x = x + 2
  end
end


function love.draw()
  map:draw()
  love.graphics.draw(playerImg, x, y)
end

local Map = require 'core/map'

function love.load()
  x = 400
  y = 300
  crystalFloor = love.graphics.newImage('assets-2/dc-dngn/floor/crystal_floor1.png')
  doorway = love.graphics.newImage('assets-2/dc-dngn/gateways/dngn_enter_dis.png')
  playerImg = love.graphics.newImage('assets-1/monster/juggernaut.png')

  template = { --a 3 x 3 map with the altar texture in the middle
  {doorway, doorway, doorway, doorway, doorway, doorway, doorway, doorway, doorway, doorway, doorway, doorway, doorway, doorway, doorway, doorway, doorway, doorway, doorway},
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
  {doorway, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, doorway},
  {doorway, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, doorway},
  {doorway, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, doorway},
  {doorway, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, doorway},
  {doorway, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, doorway},
  {doorway, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, crystalFloor, doorway},
  {doorway, doorway, doorway, doorway, doorway, doorway, doorway, doorway, doorway, doorway, doorway, doorway, doorway, doorway, doorway, doorway, doorway, doorway, doorway},
}
  map = Map:new(template)
end
-- DELETE THIS

function love.update(dt)
  if love.keyboard.isDown('w') and y > 0 then   -- if the 'up' key is being pressed
    y = y - 5
  end
  if love.keyboard.isDown('s') and y < 569 then   -- if the 'up' key is being pressed
    y = y + 5
  end
  if love.keyboard.isDown('a') and x > 0 then   -- if the 'up' key is being pressed
    x = x - 5
  end
  if love.keyboard.isDown('d') and x < 769 then   -- if the 'up' key is being pressed
    x = x + 5
  end
end


function love.draw()
  love.graphics.print('Hello, world!', 0, 0)
  map:draw()
  love.graphics.draw(playerImg, x, y)
end

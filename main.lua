local Map = require 'core/map'
function love.load()
 
 
  fountain = love.graphics.newImage('assets-2/dc-dngn/dngn_blue_fountain2.png')
  fountain2 = love.graphics.newImage('assets-2/dc-dngn/dngn_blood_fountain.png')
  dragon = love.graphics.newImage('assets-1/dungeon/statues/statue_dragon.png')
  x = 400
  y = 300
  playerImg = love.graphics.newImage('assets-1/player/base/octopode_1.png')
  floor = love.graphics.newImage('assets-1/dungeon/floor/crypt_domino_2a.png')
  wall = love.graphics.newImage('assets-2/dc-dngn/wall/brick_dark3.png')
  door = love.graphics.newImage('assets-2/dc-dngn/dngn_open_door.png')
  doorc = love.graphics.newImage('assets-2/dc-dngn/dngn_closed_door.png')

  template = {
    {wall, wall, wall, wall, wall, wall, wall, wall, doorc, wall},
    {door, floor, floor, floor, floor, floor, floor, floor, floor, wall},
    {wall, floor, floor, floor, floor, floor, floor, floor, floor, wall},
    {wall, floor, floor, floor, floor, floor, floor, floor, floor, wall},
    {wall, floor, floor, floor, floor, floor, floor, floor, floor, wall},
    {wall, floor, floor, floor, floor, floor, floor, floor, floor, wall},
    {wall, floor, floor, floor, floor, floor, floor, floor, floor, wall},
    {wall, floor, floor, floor, floor, floor, floor, floor, floor, wall},
    {wall, floor, floor, floor, floor, floor, floor, floor, floor, wall},
    {wall, floor, floor, floor, floor, floor, floor, floor, floor, wall},
    {wall, floor, floor, floor, floor, floor, floor, floor, floor, wall},
    {wall, floor, floor, floor, floor, floor, floor, floor, floor, wall},
    {wall, wall, wall, wall, wall, wall, wall, wall, wall, wall},

  }
map = Map:new(template)
end

function love.update(dt)
  if love.keyboard.isDown('right') then   -- if the 'right' key is being pressed...
    x = x + 15
  end
  if love.keyboard.isDown('left') then   -- if the 'left' key is being pressed...
    x = x - 15
  end
  if love.keyboard.isDown('up') then   -- if the 'up' key is being pressed...
    y = y - 15
  end
  if love.keyboard.isDown('down') then   -- if the 'down' key is being pressed...
    y = y + 15
  end
end



function love.draw()
  map:draw()
  --love.graphics.print('Hello, world!', 0, 0)
  love.graphics.draw(fountain, 675, 100)
  love.graphics.draw(fountain2, 675, 500)
  love.graphics.draw(dragon, 400, 200)
  love.graphics.draw(playerImg, x, y)
end

local Map = require 'core/map'
function love.load()
local Util = require 'core/util'

 
  fountain = love.graphics.newImage('assets-2/dc-dngn/dngn_blue_fountain2.png')
  fountain2 = love.graphics.newImage('assets-2/dc-dngn/dngn_blood_fountain.png')
  dragon = love.graphics.newImage('assets-1/dungeon/statues/statue_dragon.png')
  playerImg = love.graphics.newImage('assets-1/player/base/octopode_1.png')
  floor = love.graphics.newImage('assets-1/dungeon/floor/crypt_domino_2a.png')
  wall = love.graphics.newImage('assets-2/dc-dngn/wall/brick_dark3.png')
  door = love.graphics.newImage('assets-2/dc-dngn/dngn_open_door.png')
  doorc = love.graphics.newImage('assets-2/dc-dngn/dngn_closed_door.png')
  x = 65
  y = 70
  w = 64   -- The player's width is 64
  h = 64   -- The player's height is 64
  hp = 100 -- Set the player's HP to 100 at the start of the game
  template = {
    {wall, wall, wall, wall, wall, wall, wall, wall, doorc, wall},
    {door, floor, floor, floor, wall, floor, floor, floor, floor, wall},
    {wall, wall, wall, floor, wall, wall, floor, wall, wall, wall},
    {wall, floor, wall, floor, floor, floor, floor, floor, floor, wall},
    {wall, floor, wall, wall, floor, wall, floor, wall, floor, wall},
    {wall, floor, floor, floor, floor, wall, wall, wall, wall, wall},
    {wall, floor, wall, floor, floor, floor, floor, floor, floor, wall},
    {wall, wall, wall, floor, wall, floor, wall, wall, wall, wall},
    {wall, floor, floor, floor, wall, floor, floor, floor, floor, wall},
    {wall, floor, wall, wall, wall, floor, wall, wall, floor, wall},
    {wall, floor, floor, wall, floor, floor, wall, floor, floor, wall},
    {wall, floor, floor, wall, floor, floor, wall, floor, floor, wall},
    {wall, wall, wall, wall, wall, wall, wall, wall, wall, wall},

  }
map = Map:new(template)
end

function love.update(dt)
  if not cc(x, y, w, h,  0, 0, 64, 64) then
    if love.keyboard.isDown('right') then   -- if the 'right' key is being pressed...
      x = x + 2
    end
    if love.keyboard.isDown('left') then   -- if the 'left' key is being pressed...
      x = x - 2
    end
    if love.keyboard.isDown('up') then   -- if the 'up' key is being pressed...
      y = y - 2
    end
    if love.keyboard.isDown('down') then   -- if the 'down' key is being pressed...
      y = y + 2
    end
  end

  if cc(x, y, w, h,   0, 0, 64, 64) then  
    -- if true, decrease HP:
    hp = hp - 1
  end
end



function love.draw()
  map:draw()
  --love.graphics.print('Hello, world!', 0, 0)
  love.graphics.draw(fountain, 675, 100)
  love.graphics.draw(fountain2, 675, 500)
  love.graphics.draw(dragon, 400, 200)
  love.graphics.draw(playerImg, x, y)
  love.graphics.rectangle('line', 0, 0, 64, 64)
  love.graphics.print(hp, 0, 0)
end
love.graphics.setDefaultFilter('nearest', 'nearest')
local Map = require 'core/map'
local Util = require 'core/util'

function love.load()


  -- Create the player variables
  img = love.graphics.newImage('assets-1/player/base/octopode_1.png')
  x = 200
  y = 0

  -- Create the background map
  floor = love.graphics.newImage('assets-1/dungeon/floor/black_cobalt_1.png')
  background = {
    {floor, floor, floor, floor},
    {floor, floor, floor, floor},
    {floor, floor, floor, floor},
    {floor, floor, floor, floor},
  }

  -- Create the collision map, with walls around the edge of the map
  wall = love.graphics.newImage('assets-1/dungeon/wall/catacombs_1.png')
  collision = {
    {wall, wall, wall, wall, wall, wall, wall},
    {'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil'},
    {'nil', 'nil', 'nil', 'nil', wall, wall, 'nil'},
    {'nil', wall, 'nil', 'nil', 'nil', wall, 'nil'},
    {'nil', wall, wall, 'nil', 'nil', 'nil', 'nil'},
    {'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil'},
    {wall, wall, wall, wall, wall, wall, wall},
  }

  collision = Map:new(collision)
  --background = Map:new(background)
end




function love.update(dt)

  function love.update(dt)
    if love.keyboard.isDown('up') then
      if collision:cc(x, y - 5, 64, 64) == false then
        y = y - 5
      end
    end
    if love.keyboard.isDown('down') then
      if collision:cc(x, y + 5, 64, 64) == false then
        y = y + 5
      end
    end
    if love.keyboard.isDown('right') then
      if collision:cc(x + 5, y, 64, 64) == false then
        x = x + 5
      end
    end
    if love.keyboard.isDown('left') then
      if collision:cc(x - 5, y, 64, 64) == false then
        x = x - 5
      end
    end
  end


end





function love.draw()
  --background:draw()
  collision:draw()
  love.graphics.draw(img, x, y)
end

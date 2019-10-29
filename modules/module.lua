love.graphics.setDefaultFilter('nearest', 'nearest')
local Map = require 'core/map'
local Util = require 'core/util'

function love.load()


  -- Create the player variables
  img = love.graphics.newImage('assets-1/player/base/octopode_1.png')
  x = 400
  y = 300

  -- Create the background map
  floor = love.graphics.newImage('assets-1/dungeon/floor/black_cobalt_1.png')
  background = {
    {floor, floor, floor, floor},
    {floor, floor, floor, floor},
    {floor, floor, floor, floor},
    {floor, floor, floor, floor},
  }

  wall = love.graphics.newImage('assets-1/dungeon/wall/catacombs_0.png')
  walls = {
    {wall, wall, wall, wall},
    {wall, 'nil', 'nil', wall},
    {wall, 'nil', 'nil', wall},
    {wall, 'nil', 'nil', wall},
  }

  background = Map:new(background)
  collide = Map:new(walls)
end




function love.update(dt)

  function love.update(dt)
    if love.keyboard.isDown('up') then
      if collide:cc(x, y - 5, 64, 64) == false then
        y = y - 5
      end
    end
    if love.keyboard.isDown('down') then
      if collide:cc(x, y + 5, 64, 64) == false then
        y = y + 5
      end
    end
    if love.keyboard.isDown('right') then
      if collide:cc(x + 5, y, 64, 64) == false then
        x = x + 5
      end
    end
    if love.keyboard.isDown('left') then
      if collide:cc(x - 5, y , 64, 64) == false then
        x = x - 5
      end
    end
  end


end





function love.draw()
  background:draw()
  collide:draw()
  love.graphics.draw(img, x, y)
end

function love.keypressed(key)
  if key == 'escape' then
    love.exitModule()
  end
end

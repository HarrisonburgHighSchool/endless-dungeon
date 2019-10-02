
local Map = require 'core/map'

function love.load()
  x = 400
  y = 400
  playerImg = love.graphics.newImage('assets-1/player/base/lorc_male_6.png')
oct = love.graphics.newImage('assets-1/dungeon/floor/sand_1.png')
  map = Map:new(15, 15)
end

function love.update(dt)
  if love.keyboard.isDown('right')then
    x = x + 3
  end
  if love.keyboard.isDown('left')then
    x = x - 3
  end
  if love.keyboard.isDown('up')then
    y = y - 3
  end
  if love.keyboard.isDown('down')then
    y = y + 3
  end
end

function love.draw()
  map:draw()
  love.graphics.print('Hello, world!', 0, 0)
  love.graphics.draw(oct, 200, 200)
  love.graphics.draw(playerImg, x, y)

end

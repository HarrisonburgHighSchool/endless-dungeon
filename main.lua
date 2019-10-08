local Map = require 'core/map'
function love.load()
 playerImg = love.graphics.newImage('assets-1/player/base/octopode-1.png')
end

function love.update(dt)
  if love.keyboard.isDown('right')then -- if the 'up' key is being pressed
    x = x + 15
  end
  if love.keyboard.isDown('left')then -- if the 'up' key is being pressed
    x = x - 15
  end
  if love.keyboard.isDown('down')then -- if the 'up' key is being pressed
    y = y + 15
end
if love.keyboard.isDown('up')then -- if the 'up' key is being pressed
  y = y - 15
end
  -- Nothing to update
end

function love.draw()
  love.graphics.print('Hello, world!', 10, 10)
  playerImg = love.graphics.draw('assets-1/dungeon/floor/black_cobalt_12.png')
  love.graphics.draw(playerImg, 0, 0)
  map:draw()
  love.graphics.draw(img, 400, 300)
end
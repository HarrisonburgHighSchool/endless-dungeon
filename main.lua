local Entity = require 'core/entity'

function love.load()
  x = 400
  y = 300
  player = Entity:new()
end

function love.update(dt)
  if love.keyboard.isDown('up') then   -- if the 'up' key is being pressed...
    player.x = player.x + 1
  end
end

function love.draw()
  love.graphics.print('Hello, world!', 0, 0)
  player:draw()
end


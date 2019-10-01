local Entity = require 'core/entity'
local Map = require 'core/map'

function love.load()
  x = 400
  y = 300
  player = Entity:new()
  map = Map:new(5, 5)
end

function love.update(dt)
  if love.keyboard.isDown('up') then   -- if the 'up' key is being pressed...
    player.x = player.x + 1
  end
end

function love.draw()
  map:draw()
  love.graphics.print('Hello, world!', 0, 0)
  player:draw()
end


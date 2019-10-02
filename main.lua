local Map = require 'core/map'

function love.load()
  x = 400
  y = 300
  playerImg = love.graphics.newImage('assets-1/player/base/octopode_1.png')
end

function love.update(dt)
  -- Nothing to update yet
end

function love.draw()
  love.graphics.print('AD 117, the peak of the Roman Empires might.', 0, 0)
  love.graphics.draw(playerImg, x, y)
end

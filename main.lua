local Map = require 'core/map'

function love.load()
  x = 400
  y = 300
  playerImg = love.graphics.newImage('assets-1/player/base/octopode_1.png')

  cobalt = love.graphics.newImage('assets-1/dungeon/floor/black_cobalt_1.png')
  mapTemplate = {
    {cobalt, cobalt, cobalt},
    {cobalt, cobalt, cobalt},
    {cobalt, cobalt, cobalt},
  }

  map = Map:new(mapTemplate)
end

function love.update(dt)
  -- Nothing to update yet
end

function love.draw()
  love.graphics.print('Hello, world!', 0, 0)
  map:draw()
  love.graphics.draw(playerImg, x, y)
end


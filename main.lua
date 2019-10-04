local Map = require 'core/map'

function love.load()
  x = 0
  y = 300
  playerImg = love.graphics.newImage('assets-1/player/base/octopode_1.png')

function love.update(dt)
  if love.keyboard.isDown('right') then   -- if the 'right' key is being pressed...
    x = x + 6
  end
  if love.keyboard.isDown('up') then   -- if the 'up' key is being pressed...
    y = y - 6
  end
  if love.keyboard.isDown('down') then   -- if the 'down' key is being pressed...
    y = y + 6
  end
  if love.keyboard.isDown('left') then   -- if the 'left' key is being pressed...
    x = x - 6
  end
end

  cobalt = love.graphics.newImage('assets-1/dungeon/floor/black_cobalt_1.png')
  cage = love.graphics.newImage('assets/dungeon/floor/cage')
  mapTemplate = {
    {cobalt, cobalt, cobalt, cobalt,cobalt,cobalt,cobalt,cobalt,cobalt,cobalt,cobalt,cobalt,cobalt},     
    {cobalt, cobalt, cobalt, cobalt,cobalt,cobalt,cobalt,cobalt,cobalt,cobalt,cobalt,cobalt,cobalt},
    {cobalt, cobalt, cobalt, cobalt,cobalt,cobalt,cobalt,cobalt,cobalt,cobalt,cobalt,cobalt,cobalt},
    {cobalt, cobalt, cobalt, cobalt,cobalt,cobalt,cobalt,cobalt,cobalt,cobalt,cobalt,cobalt,cobalt},
    {cobalt, cobalt, cobalt, cobalt,cobalt,cobalt,cobalt,cobalt,cobalt,cobalt,cobalt,cobalt,cobalt},
    {cobalt, cobalt, cobalt, cobalt,cobalt,cobalt,cobalt,cobalt,cobalt,cobalt,cobalt,cobalt,cobalt},
    {cobalt, cobalt, cobalt, cobalt,cobalt,cobalt,cobalt,cobalt,cobalt,cobalt,cobalt,cobalt,cobalt},
    {cobalt, cobalt, cobalt, cobalt,cobalt,cobalt,cobalt,cobalt,cobalt,cobalt,cobalt,cobalt,cobalt},
    {cobalt, cobalt, cobalt, cobalt,cobalt,cobalt,cobalt,cobalt,cobalt,cobalt,cobalt,cobalt,cobalt},
    {cobalt, cobalt, cobalt, cobalt,cobalt,cobalt,cobalt,cobalt,cobalt,cobalt,cobalt,cobalt,cobalt},
    {cobalt, cobalt, cobalt, cobalt,cobalt,cobalt,cobalt,cobalt,cobalt,cobalt,cobalt,cobalt,cobalt},
    {cobalt, cobalt, cobalt, cobalt,cobalt,cobalt,cobalt,cobalt,cobalt,cobalt,cobalt,cobalt,cobalt},
    {cobalt, cobalt, cobalt, cobalt,cobalt,cobalt,cobalt,cobalt,cobalt,cobalt,cobalt,cobalt,cobalt},
    {cobalt, cobalt, cobalt, cobalt,cobalt,cobalt,cobalt,cobalt,cobalt,cobalt,cobalt,cobalt,cobalt},
    {cobalt, cobalt, cobalt, cobalt,cobalt,cobalt,cobalt,cobalt,cobalt,cobalt,cobalt,cobalt,cobalt},
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
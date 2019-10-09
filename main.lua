love.graphics.setDefaultFilter('nearest', 'nearest')
local Map = require 'core/map'

function love.load()
  x = 0
  y = 320
  playerImg = love.graphics.newImage('assets-1/player/base/octopode_1.png')
  cobalt = love.graphics.newImage('assets-1/dungeon/floor/black_cobalt_1.png')
  cage = love.graphics.newImage('assets-1/dungeon/floor/cage_0.png')
  mapTemplate = {
    {cage, cage, cage, cage, cage,scage,cage,cage,cage,cage,cage,cage,cage,cage,cage,},     
    {cage, cobalt, cobalt, cobalt,cobalt,cobalt,cobalt,cobalt,cobalt,cage,cage,cage,},
    {cage, cobalt, cobalt, cobalt,cobalt,cobalt,cobalt,cobalt,cobalt,cage,cage,cage,},
    {cage, cobalt, cobalt, cobalt,cobalt,cobalt,cobalt,cobalt,cobalt,cage,cage,cage,},
    {cage, cobalt, cobalt, cobalt,cobalt,cobalt,cobalt,cobalt,cobalt,cage,cage,cage,},
    {cage, cobalt, cobalt, cobalt,cobalt,cobalt,cobalt,cobalt,cobalt,cage,cage,cage,},
    {cage, cobalt, cobalt, cobalt,cobalt,cobalt,cobalt,cobalt,cobalt,cage,cage,cage,},
    {cage, cobalt, cobalt, cobalt,cobalt,cobalt,cobalt,cobalt,cobalt,cage,cage,cage,},
    {cage, cobalt, cobalt, cobalt,cobalt,cobalt,cobalt,cobalt,cobalt,cage,cage,cage,},
    {cage, cobalt, cobalt, cobalt,cobalt,cobalt,cobalt,cobalt,cobalt,cage,cage,cage,},
    {cage, cobalt, cobalt, cobalt,cobalt,cobalt,cobalt,cobalt,cobalt,cage,cage,cage,},
    {cage, cobalt, cobalt, cobalt,cobalt,cobalt,cobalt,cobalt,cobalt,cage,cage,cage,},
    {cage, cobalt, cobalt, cobalt,cobalt,cobalt,cobalt,cobalt,cobalt,cage,cage,cage,},
  }

  map = Map:new(mapTemplate)
end

function love.update(dt)
  if love.keyboard.isDown('right') then
    x = x + 6
  end
    if love.keyboard.isDown('up') then   
      y = y - 6
    end
    if love.keyboard.isDown('down') then   
      y = y  + 6
    end
    if love.keyboard.isDown('left') then   
      x = x - 6
    end
  end

function love.draw()
  map:draw()
  love.graphics.print('', 0, 0)
  love.graphics.draw(playerImg, x, y)
end
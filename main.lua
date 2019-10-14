--love.graphics.setDefaultFilter('nearest', 'nearest')
local Map = require 'core/map'
local Util = require 'core/util'
local gamera = require 'core/gamera'

function love.load()
  x = 0
  y = 320
  cam = gamera.new(0, 0, 2000, 2000) -- Create a camera that can move in a rectangle from 0, 0 to 2000, 2000
  playerImg = love.graphics.newImage('assets-1/player/base/octopode_1.png')
  cobalt = love.graphics.newImage('assets-1/dungeon/floor/black_cobalt_1.png')
  cage = love.graphics.newImage('assets-1/dungeon/floor/cage_0.png')
  w = 64
  h = 64
  hp = 100

  mapTemplate = {
    {cage, cage, cage, cage, cage,scage,cage,cage,cage,cage,},     
    {cage, cobalt, cobalt, cobalt,cobalt,cobalt,cobalt,cobalt,cobalt,cage},
    {cage, cobalt, cobalt, cobalt,cobalt,cobalt,cobalt,cobalt,cobalt,cage,},
    {cage, cobalt, cobalt, cobalt,cobalt,cobalt,cobalt,cobalt,cobalt,cage,},
    {cage, cobalt, cobalt, cobalt,cobalt,cobalt,cobalt,cobalt,cobalt,cage,},
    {cage, cobalt, cobalt, cobalt,cobalt,cobalt,cobalt,cobalt,cobalt,cage,},
    {cage, cobalt, cobalt, cobalt,cobalt,cobalt,cobalt,cobalt,cobalt,cage,},
    {cage, cobalt, cobalt, cobalt,cobalt,cobalt,cobalt,cobalt,cobalt,cage,},
    {cage, cobalt, cobalt, cobalt,cobalt,cobalt,cobalt,cobalt,cobalt,cage,},
    {cage, cobalt, cobalt, cobalt,cobalt,cobalt,cobalt,cobalt,cobalt,cage,},
    {cage, cobalt, cobalt, cobalt,cobalt,cobalt,cobalt,cobalt,cobalt,cage,},
    {cage, cobalt, cobalt, cobalt,cobalt,cobalt,cobalt,cobalt,cobalt,cage,},
    {cage, cobalt, cobalt, cobalt,cobalt,cobalt,cobalt,cobalt,cobalt,cage,},
  }
  map = Map:new(mapTemplate)
end




function love.update(dt)
  cam:setPosition(400, 400)
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
  cam:draw (function(x, y, w, h)
      love.graphics.draw(playerImg, x, y)
    
  map:draw()
  love.graphics.print('', 0, 0)
end)
end
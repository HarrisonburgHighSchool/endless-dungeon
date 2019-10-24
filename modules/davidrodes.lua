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
    {cage, cage, cage, cage,cage,cage,cage,cage,cage,cage,},
  }

  walls = {
    {cage, cage, cage, cage, cage,scage,cage,cage,cage,cage,},     
     {cage,'nil', 'nil', 'nil', 'nil','nil', 'nil','nil', 'nil',cage,},
     {cage,'nil', 'nil', 'nil', 'nil','nil', 'nil','nil', 'nil',cage,},
     {cage,'nil', 'nil', 'nil', 'nil','nil', 'nil','nil', 'nil',cage,},
     {cage,'nil', 'nil', 'nil', 'nil','nil', 'nil','nil', 'nil',cage,},
     {cage,'nil', 'nil', 'nil', 'nil','nil', 'nil','nil', 'nil',cage,},
     {cage,'nil', 'nil', 'nil', 'nil','nil', 'nil','nil', 'nil',cage,},
     {cage,'nil', 'nil', 'nil', 'nil','nil', 'nil','nil', 'nil',cage,},
     {cage,'nil', 'nil', 'nil', 'nil','nil', 'nil','nil', 'nil',cage,},
     {cage,'nil', 'nil', 'nil', 'nil','nil', 'nil','nil', 'nil',cage,},
     {cage,'nil', 'nil', 'nil', 'nil','nil', 'nil','nil', 'nil',cage,},
     {cage,'nil', 'nil', 'nil', 'nil','nil', 'nil','nil', 'nil',cage,},
     {cage,cage, cage, cage, cage,cage, cage,cage, cage,},
  }
  map = Map:new(mapTemplate)
  collisionMap = Map:new(walls)
end


function love.update(dt)
  cam:setPosition(400, 320)
  if love.keyboard.isDown('escape') then
    love.exitModule();
  end
  if love.keyboard.isDown('right') or love.keyboard.isDown('d') then
    if collisionMap:cc(x + 4, y, 64, 64) == false then
    x = x + 4
    end
  end
  if love.keyboard.isDown('up') or love.keyboard.isDown('w') then   
    if collisionMap:cc(x, y - 4, 64, 64) == false then
    y = y - 4
  end
end
  if love.keyboard.isDown('down') or love.keyboard.isDown('s') then   
    if collisionMap:cc(x, y + 4, 64, 64) == false then
    y = y  + 4
  end
end
  if love.keyboard.isDown('left') or love.keyboard.isDown('a')then   
    if collisionMap:cc(x - 4, y, 64, 64) == false then
    x = x - 4
  end
end
cam:setPosition (x,y)
end
function love.draw()
  
  cam:draw (function(l, t, w, h)
     
     
  map:draw()
  collisionMap:draw()
  love.graphics.print('', 0, 0)
  love.graphics.draw(playerImg,x,y)
  end)
end
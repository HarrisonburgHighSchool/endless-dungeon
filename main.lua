local Map = require 'core/map'
local Util = require 'core/util'
local gamera = require 'core/gamera'
--love.graphics.setDefaultFilter('nearest', 'nearest')
function love.load()
  map = Map:new(20,20)
  x = 400
  y = 300
  --playerImg = love.graphics.newImage('a/images.png')
  playerImg = love.graphics.newImage('assets-1/player/transform/dragon_form_red.png')
  cam = gamera.new(0, 0, 2000, 2000)
  w = 64
  h = 64
  hp = 100
  cobalt = love.graphics.newImage('assets-1/dungeon/floor/mesh_3.png')
  vgate = love.graphics.newImage('assets-1/dungeon/doors/vgate_runed_middle.png')
  vgate1 = love.graphics.newImage('assets-1/dungeon/doors/vgate_runed_up.png')
  vgate2 = love.graphics.newImage('assets-1/dungeon/doors/vgate_runed_down.png')
  wall = love.graphics.newImage('assets-1/dungeon/wall/lab-metal_0.png') 
  template = {
    {wall, wall, wall,vgate1, vgate, vgate2, wall, wall, wall, wall},
    {wall, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt,cobalt, cobalt, wall},
    {wall, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt,cobalt, cobalt, wall},
    {wall, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt,cobalt, cobalt, wall},
    {wall, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt,cobalt, cobalt, wall},
    {wall, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt,cobalt, cobalt, wall},
    {wall, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt,cobalt, cobalt, wall},
    {wall, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt,cobalt, cobalt, wall},
    {wall, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt,cobalt, cobalt, wall},
    {wall, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt,cobalt, cobalt, wall},
    {wall, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt,cobalt, cobalt, wall},
    {wall, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt,cobalt, cobalt, wall},
    {wall, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt,cobalt, cobalt, wall},
    {wall, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt,cobalt, cobalt, wall},
    {wall, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt,cobalt, cobalt, wall},
    {wall, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt,cobalt, cobalt, wall},
    {wall, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt,cobalt, cobalt, wall},
    {wall, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt,cobalt, cobalt, wall},
    {wall, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt,cobalt, cobalt, wall},
    {wall, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt,cobalt, cobalt, wall},
    {wall,wall, wall, wall, wall, wall, wall,wall, wall, wall},
  }

  map = Map:new(template)
end


function love.update(dt)
  if love.keyboard.isDown('d') then   -- if the 'up' key is being pressed...
    x = x + 4
  end
  if love.keyboard.isDown('s') then   -- if the 'up' key is being pressed...
    y = y + 4
  end
  if love.keyboard.isDown('a') then   -- if the 'up' key is being pressed...
    x = x - 4
  end
  if love.keyboard.isDown('w') then   -- if the 'up' key is being pressed...
    y = y - 4
  end
if cc(x, y, w, h,   0, 0, 801, 63) then  
  hp = hp - 1
  end
cam:setPosition(x,y)
end

function love.draw()
  cam:draw(function(l, t, w, h)
  map:draw()
  love.graphics.draw(playerImg, x, y)
  --love.graphics.rectangle('line', 0, 0, 64, 64)
  love.graphics.print(hp, 0, 0)
  end)
end

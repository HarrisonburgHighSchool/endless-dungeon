local Map = require 'core/map'
local Util = require 'core/util'
--love.graphics.setDefaultFilter('nearest', 'nearest')
function love.load()
  map = Map:new(20,20)
  x = 400
  y = 300
  --playerImg = love.graphics.newImage('a/images.png')
  playerImg = love.graphics.newImage('assets-1/player/transform/dragon_form_red.png')
  w = 64
  h = 64
  hp = 100
  cobalt = love.graphics.newImage('assets-1/dungeon/floor/black_cobalt_1.png')
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
    {wall,wall, wall, wall, wall, wall, wall,wall, wall, wall},
  }

  map = Map:new(template)
end


function love.update(dt)
  if love.keyboard.isDown('d') then   -- if the 'up' key is being pressed...
    x = x + 6
  end
  if love.keyboard.isDown('s') then   -- if the 'up' key is being pressed...
    y = y + 6
  end
  if love.keyboard.isDown('a') then   -- if the 'up' key is being pressed...
    x = x - 6
  end
  if love.keyboard.isDown('w') then   -- if the 'up' key is being pressed...
    y = y - 6
  end
if cc(x, y, w, h,   0, 0, 4000, 3000) then  
  hp = hp - 1
  end
end
--function love.update(dt)
  -- Nothing to update yet
--end

function love.draw()
  map:draw()
  love.graphics.draw(playerImg, x, y)
  love.graphics.rectangle('line', 0, 0, 64, 64)
  love.graphics.print(hp, 0, 0)
end

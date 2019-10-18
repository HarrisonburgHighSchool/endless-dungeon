local Map = require 'core/map'
local Util = require 'core/util'
local gamera = require 'core/gamera'
--love.graphics.setDefaultFilter('nearest', 'nearest')


function love.load()
  map = Map:new(20,20)
  x = 400
  y = 300
  --playerImg = love.graphics.newImage('a/images.png')
  sound = love.audio.newSource('Sound Effects/boing_jack_01.wav', 'static')
  playerImg = love.graphics.newImage('assets-1/player/transform/dragon_form_red.png')
  x2 = 400
  y2 = 100
  cam = gamera.new(0, 0, 2000, 2000)
  w = 64
  h = 64
  hp = 100
  cobalt = love.graphics.newImage('assets-1/dungeon/floor/mesh_3.png')
  cobalt2 = love.graphics.newImage('a/mesh&coin.png')
  prtl = love.graphics.newImage('assets-1/dungeon/gateways/zig_portal90CCW.png')
  wall = love.graphics.newImage('assets-1/dungeon/wall/lab-metal_0.png') 
  
  template = {
    {wall, wall, wall, wall, prtl, wall, wall, wall, wall, wall},
    {wall, cobalt2, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, wall},
    {wall, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, wall},
    {wall, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, wall},
    {wall, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, wall},
    {wall, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, wall},
    {wall, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, wall},
    {wall, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, wall},
    {wall, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, wall},
    {wall, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, wall},
    {wall, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, wall},
    {wall, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, wall},
    {wall, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, wall},
    {wall, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, wall},
    {wall, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, wall},
    {wall, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, wall},
    {wall, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, wall},
    {wall, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, wall},
    {wall, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, wall},
    {wall, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, wall},
    {wall,wall, wall, wall, wall, wall, wall, wall, wall, wall},
  }

  

  map = Map:new(template)
  
  collision = {
    {wall, wall, wall, wall, 'nil', wall, wall, wall, wall, wall},
    {wall, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil','nil', 'nil', wall},
    {wall, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil','nil', 'nil', wall},
    {wall, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil','nil', 'nil', wall},
    {wall, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil','nil', 'nil', wall},
    {wall, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil','nil', 'nil', wall},
    {wall, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil','nil', 'nil', wall},
    {wall, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil','nil', 'nil', wall},
    {wall, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil','nil', 'nil', wall},
    {wall, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil','nil', 'nil', wall},
    {wall, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil','nil', 'nil', wall},
    {wall, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil','nil', 'nil', wall},
    {wall, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil','nil', 'nil', wall},
    {wall, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil','nil', 'nil', wall},
    {wall, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil','nil', 'nil', wall},
    {wall, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil','nil', 'nil', wall},
    {wall, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil','nil', 'nil', wall},
    {wall, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil','nil', 'nil', wall},
    {wall, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil','nil', 'nil', wall},
    {wall, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil','nil', 'nil', wall},
    {wall, wall, wall, wall, wall, wall, wall ,wall, wall, wall},
  }  


  collision = Map:new(collision)

  

end


function love.update(dt)
  
  if not collision:cc(x2 + 4, y2, w, h) then
  if love.keyboard.isDown('d') then   -- if the 'up' key is being pressed...
    x2 = x2 + 4
  end
end
if not collision:cc(x2, y2 - 4, w, h) then  
  if love.keyboard.isDown('w') then   -- if the 'up' key is being pressed...
    y2 = y2 - 4
  end
end
  if not collision:cc(x2 - 4, y2, w, h) then
    if love.keyboard.isDown('a') then   -- if the 'up' key is being pressed...
    x2 = x2 - 4
  end
 end
 if not collision:cc(x2, y2 + 4, w, h) then
  if love.keyboard.isDown('s') then 
    y2 = y2 + 4
  end
end
function love.keypressed(key)
  if key == 'space' then
    sound:play()
  end
end
cam:setPosition(x2,y2)
end





function love.draw()
  cam:draw(function(l, t, w, h)
  map:draw()
 collision:draw()
  love.graphics.draw(playerImg, x2, y2)
  --love.graphics.rectangle('line', 0, 0, 64, 64)
  --love.graphics.print(hp, 0, 0)
  --end)
--love.graphics.print(tostring(mapc), 0, 0)
  end)
end

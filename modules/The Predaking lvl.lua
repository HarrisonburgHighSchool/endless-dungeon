local Map = require 'core/map'
local Util = require 'core/util'
local gamera = require 'core/gamera'
love.graphics.setDefaultFilter('nearest', 'nearest')


function love.load()
  map = Map:new(20,20)
  x = 400
  y = 300
  --playerImg = love.graphics.newImage('a/images.png')
  sound = love.audio.newSource('Sound Effects/boing_jack_01.wav', 'static')
  playerImg = love.graphics.newImage('assets-1/player/transform/dragon_form_red.png')
  x2 = 79
  y2 = 270
  cam = gamera.new(0, 0, 2000, 2000)
  w = 32
  h = 32
  hp = 100
  cobalt = love.graphics.newImage('assets-1/dungeon/floor/mesh_3.png')
  coin = love.graphics.newImage('a/coin.png')
  gotCoin = true
  prtl = love.graphics.newImage('assets-1/dungeon/gateways/zig_portal90CCW.png')
  wall = love.graphics.newImage('assets-1/dungeon/wall/lab-metal_0.png') 
  
  template = {
    {wall, wall, wall, wall, prtl, wall, wall, wall, wall, wall},
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
    {wall, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, wall},
    {wall,wall, wall, wall, wall, wall, wall, wall, wall, wall},
  }

  map = Map:new(template)
  
  collision = {
    {wall, wall, wall, wall, prtl, wall, wall, wall, wall, wall},
    {wall, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', wall},
    {wall, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', wall},
    {wall, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', wall},
    {wall, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', wall},
    {wall, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', wall},
    {wall, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', wall},
    {wall, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', wall},
    {wall, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', wall},
    {wall, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', wall},
    {wall, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', wall},
    {wall, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', wall},
    {wall, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', wall},
    {wall, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', wall},
    {wall, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', wall},
    {wall, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', wall},
    {wall, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', wall},
    {wall, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', wall},
    {wall, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', wall},
    {wall, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', wall},
    {wall, wall, wall, wall, wall, wall, wall ,wall, wall, wall},
  }  

  collision = Map:new(collision)
  

end


function love.update(dt)
  
  if not collision:cc(x2 + 5, y2, w, h) then
  if love.keyboard.isDown('d') then   
    x2 = x2 + 5
  end
end
if not collision:cc(x2, y2 - 5, w, h) then  
  if love.keyboard.isDown('w') then   
    y2 = y2 - 5
  end
end
  if not collision:cc(x2 - 5, y2, w, h) then
    if love.keyboard.isDown('a') then   
    x2 = x2 - 5
  end
 end
 if not collision:cc(x2, y2 + 5, w, h) then
  if love.keyboard.isDown('s') then 
    y2 = y2 + 5
  end
end

if cc(x2, y2, 64, 64, 769, 65, 64, 64) == true then
  gotCoin = false
end

function love.keypressed(key)
  if key == 'space' then
    sound:play()
  end
end
cam:setPosition(x2,y)
end





function love.draw()
  cam:draw(function(l, t, w, h)
  map:draw()
 collision:draw()
  love.graphics.draw(playerImg, x2, y2)
  if gotCoin == false then
    love.graphics.draw(coin, 769, 65, 0, 2)
  end
  --love.graphics.print(hp, 0, 0)
  --end)
--love.graphics.print(tostring(mapc), 0, 0)
    love.graphics.rectangle('line', x2, y2, 32, 32)
  end)
end

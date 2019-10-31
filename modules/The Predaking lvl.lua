local Map = require 'core/map'
local Util = require 'core/util'
local gamera = require 'core/gamera'
love.graphics.setDefaultFilter('nearest', 'nearest')


function love.load()
  map = Map:new(20,20)
  x = 400
  y = 300
 -- cobalt = love.graphics.newImage('Daniel V. Personal Assets/Images/images.png')
  sound = love.audio.newSource('Daniel V. Personal Assets/Sound Effects/coincollected.wav', 'static')
  prtlsnd = love.audio.newSource('Daniel V. Personal Assets/Sci-Fi Sound Library/Wav/WarpDrive_00.wav', 'static')
  playerImg = love.graphics.newImage('assets-1/player/transform/dragon_form_red.png')
  x2 = 79
  y2 = 270
  cam = gamera.new(0, 0, 2000, 2000)
  w = 32
  h = 32
  hp = 100
  cobalt = love.graphics.newImage('assets-1/dungeon/floor/mesh_3.png')
  coin = love.graphics.newImage('Daniel V. Personal Assets/Images/coin.png')
  gotcoin = false
  foundcoin = false
  prtl = love.graphics.newImage('assets-1/dungeon/gateways/zig_used.png')
  wall = love.graphics.newImage('assets-1/dungeon/wall/lab-metal_0.png') 
  prtl2 = love.graphics.newImage('assets-1/dungeon/gateways/zig_portal.png')
  time = 120
  timestart = false

  template = {
    {wall, wall, wall, wall, wall, wall, wall, wall, wall, wall},
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
    {wall, wall, wall, wall, 'nil', wall, wall ,wall, wall, wall},
  }  

  collision = Map:new(collision)
  

end


function love.update(dt)
if timestart == false then
  if not collision:cc(x2 + 4, y2, w, h) then
  if love.keyboard.isDown('d') or love.keyboard.isDown('right')  then   
    x2 = x2 + 4
  end
end
if not collision:cc(x2, y2 - 4, w, h) then  
  if love.keyboard.isDown('w') or love.keyboard.isDown('up') then   
    y2 = y2 - 4
  end
end
  if not collision:cc(x2 - 4, y2, w, h) then
    if love.keyboard.isDown('a') or love.keyboard.isDown('left') then   
    x2 = x2 - 4
  end
 end
 if not collision:cc(x2, y2 + 4, w, h) then
  if love.keyboard.isDown('s') or love.keyboard.isDown('down') then 
    y2 = y2 + 4
  end
end
end

if cc(x2, y2, 64, 64, 769, 65, 64, 64) == true then
 foundcoin = true
end
if cc(x2, y2, 64, 64, 1295, 255, 65, 64, 64) == true then
  time = time - 1
  timestart = true
end
if cc(x2, y2, 64, 64, 1295, 255, 65, 64, 64) == true then
prtlsnd:play()
end
if time < 0 then
  love.exitModule();
end    

if love.keyboard.isDown('escape') then
  love.exitModule();
end

cam:setPosition(x2,y)
end


function love.draw()
  cam:draw(function(l, t, w, h)
  map:draw()
 collision:draw()
  love.graphics.draw(playerImg, x2, y2)
  if foundcoin == true then
    if gotcoin == false then
   love.graphics.draw(coin, 769, 65, 0, 2)
  end
end
if gotcoin == true then
  love.graphics.draw(prtl2, 1280, 255, 0, 2)
end
  --love.graphics.print(hp, 0, 0)
  --end)
love.graphics.rectangle('line', 64, 64, 1295, 255, 65, 64, 64)
   
love.graphics.rectangle('line', x2, y2, 32, 32)
end)
love.graphics.print(tostring(foundcoin), 0, 10)
love.graphics.print(x2..", "..y2, 0, 0)
end

function love.keypressed(key)
  if key == 'space' then
   if gotcoin == false then
    gotcoin = true
    sound:play()
  end
 end
end
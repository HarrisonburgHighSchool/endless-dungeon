local Map = require 'core/map'
local Util = require 'core/util'
function love.load()
  key = love.graphics.newImage('jackson-assets/key.png')
  --wall2 = love.graphics.newImage('assets-1/dungeon/wall/orc_11.png')
  torch = love.graphics.newImage('jackson-assets/torch2.png')
  fountain = love.graphics.newImage('assets-2/dc-dngn/dngn_blue_fountain2.png')
  fountain2 = love.graphics.newImage('assets-2/dc-dngn/dngn_blood_fountain.png')
  sound = love.audio.newSource('jackson-assets/Cave 02.ogg', 'static')
  playerImg = love.graphics.newImage('assets-1/player/base/ghoul_2_male.png')
  floor = love.graphics.newImage('assets-1/dungeon/floor/crypt_domino_2a.png')
  wall = love.graphics.newImage('assets-2/dc-dngn/wall/brick_dark3.png')
  door = love.graphics.newImage('assets-2/dc-dngn/dngn_open_door.png')
  doorc = love.graphics.newImage('assets-2/dc-dngn/dngn_closed_door.png')
  furnace = love.graphics.newImage('assets-2/dc-dngn/wall/stone_gray0.png')
  x = 65
  y = 70
  w = 64   -- The player's width is 64
  h = 64   -- The player's height is 64
  keytouch = (false) 
  doortouch = (false)
  sound:setVolume(0.35)
  sound:setLooping(true)
  love.audio.play( sound )
  --template = {
    --{wall, wall, wall, wall, wall, wall, wall, wall, doorc, wall},
    --{door, floor, floor, floor, wall, floor, floor, floor, floor, wall},
    --{wall, wall, wall, floor, wall, wall, floor, wall, wall, wall},
    --{wall, floor, wall, floor, floor, floor, floor, floor, floor, wall},
    --{wall, floor, wall, wall, floor, wall, floor, wall, floor, wall},
    --{wall, floor, floor, floor, floor, wall, wall, wall, wall, wall},
    --{wall, floor, wall, floor, floor, floor, floor, floor, floor, wall},
    --{wall, wall, wall, floor, wall, floor, wall, wall, wall, wall},
    --{wall, floor, floor, floor, wall, floor, floor, floor, floor, wall},
    --{wall, floor, wall, wall, wall, floor, wall, wall, floor, wall},
    --{wall, floor, floor, wall, floor, floor, wall, floor, floor, wall},
    --{wall, floor, floor, wall, floor, floor, wall, floor, floor, wall},
    --{wall, wall, wall, wall, wall, wall, wall, wall, wall, wall},

  --}

back = {
  {floor, floor, floor, floor, floor, floor, floor, floor, floor, floor},
  {floor, floor, floor, floor, floor, floor, floor, floor, floor, floor},
  {floor, floor, floor, floor, floor, floor, floor, floor, floor, floor},
  {floor, floor, floor, floor, floor, floor, floor, floor, floor, floor},
  {floor, floor, floor, floor, floor, floor, floor, floor, floor, floor},
  {floor, floor, floor, floor, floor, floor, floor, floor, floor, floor},
  {floor, floor, floor, floor, floor, floor, floor, floor, floor, floor},
  {floor, floor, floor, floor, floor, floor, floor, floor, floor, floor},
  {floor, floor, floor, floor, floor, floor, floor, floor, floor, floor},
  {floor, floor, floor, floor, floor, floor, floor, floor, floor, floor},
  {floor, floor, floor, floor, floor, floor, floor, floor, floor, floor},
  {floor, floor, floor, floor, floor, floor, floor, floor, floor, floor},
  {floor, floor, floor, floor, floor, floor, floor, floor, floor, floor},
}
collision = {
    {wall, wall, wall, wall, wall, wall, wall, wall, doorc, wall},
    {door, nil, nil, nil, wall, nil, nil, nil, nil, wall},
    {wall, wall, wall, nil, wall, wall, nil, wall, wall, wall},
    {wall, nil, wall, nil, nil, nil, nil, nil, nil, wall},
    {wall, nil, wall, wall, nil, wall, nil, wall, nil, wall},
    {wall, nil, nil, nil, nil, wall, wall, wall, wall, wall},
    {wall, nil, wall, nil, nil, nil, nil, nil, furnace, wall},
    {wall, wall, wall, nil, wall, nil, wall, wall, wall, wall},
    {wall, nil, nil, nil, wall, nil, nil, nil, nil, wall},
    {wall, nil, wall, wall, wall, nil, wall, wall, nil, wall},
    {wall, nil, nil, wall, nil, nil, wall, nil, nil, wall},
    {wall, nil, nil, wall, nil, nil, wall, nil, nil, wall},
    {wall, wall, wall, wall, wall, wall, wall, wall, wall, wall},

}



  map = Map:new(back)
  map2 = Map:new(collision)
  
end


function love.update(dt)
    if love.keyboard.isDown('up') then   -- if the 'right' key is being pressed...
      if map2:cc(x, y - 1, w, h) == false then
      
      y = y - 1
    end
  end  
  if love.keyboard.isDown('down') then   -- if the 'right' key is being pressed...
    if map2:cc(x, y + 1, w, h) == false then
    
    y = y + 1
  end
end  
if love.keyboard.isDown('right') then   -- if the 'right' key is being pressed...
  if map2:cc(x + 1, y, w, h) == false then
  
  x = x + 1
  end
end  
if love.keyboard.isDown('left') then   -- if the 'right' key is being pressed...
  if map2:cc(x - 1, y, w, h) == false then
  
  x = x - 1
 end
end  

if keytouch == (true) then
  
end
if doortouch == (true) and keytouch == (true) then
  love.exitmodule()
end


end
function love.draw()
  map:draw()
map2:draw()
  love.graphics.draw(fountain, 675, 100)
  love.graphics.draw(fountain2, 675, 500)
  love.graphics.draw(torch, 208, 75)
  love.graphics.draw(playerImg, x, y)
  if keytouch == (false) then
  love.graphics.draw(key, 400, 480)
  
  end
end

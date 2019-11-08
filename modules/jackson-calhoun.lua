local Map = require 'core/map'
local Util = require 'core/util'
function love.load()
  key = love.graphics.newImage('jackson-assets/key.png')
  torch = love.graphics.newImage('jackson-assets/torch2.png')
  fountain = love.graphics.newImage('assets-2/dc-dngn/dngn_blue_fountain2.png')
  fountain2 = love.graphics.newImage('assets-2/dc-dngn/dngn_blood_fountain.png')
  sound = love.audio.newSource('jackson-assets/Cave 02.ogg', 'static')
  playerImg = love.graphics.newImage('assets-1/player/base/ghoul_2_male.png')
  floor = love.graphics.newImage('assets-1/dungeon/floor/crypt_domino_2a.png')
  wall = love.graphics.newImage('assets-2/dc-dngn/wall/brick_dark3.png')
  door = love.graphics.newImage('assets-2/dc-dngn/dngn_open_door.png')
  doorc = love.graphics.newImage('assets-2/dc-dngn/dngn_closed_door.png')
  keyTouched = false

  x = 65
  y = 70
  w = 60   
  h = 60   
  sound:setVolume(0.35)
  sound:setLooping(true)
  love.audio.play( sound )
 
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
    {wall, wall, wall, wall, wall, wall, wall, wall, nil, wall},
    {door, nil, nil, nil, wall, nil, nil, nil, nil, wall},
    {wall, wall, wall, nil, wall, wall, nil, wall, wall, wall},
    {wall, nil, wall, nil, nil, nil, nil, nil, nil, wall},
    {wall, nil, wall, wall, nil, wall, nil, wall, nil, wall},
    {wall, nil, nil, nil, nil, wall, wall, wall, wall, wall},
    {wall, nil, wall, nil, nil, nil, nil, nil, nil, wall},
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
    if love.keyboard.isDown('up') then   
      if map2:cc(x, y - 4, w, h) == false then
        if cc(0, 516, 64, 64,      x, y - 4, 60, 60) == false then
      
          y = y - 4
        end
    end
  end  
  if love.keyboard.isDown('down') then  
    if map2:cc(x, y + 4, w, h) == false then
      if cc(0, 516, 64, 64,      x, y + 4, 60, 60) == false then

         y = y + 4
      end
  end
end  
if love.keyboard.isDown('right') then   
  if map2:cc(x + 4, y, w, h) == false then
    if cc(0, 516, 64, 64,      x + 4, y, 60, 60) == false then

         x = x + 4
    end
  end
end  
if love.keyboard.isDown('left') then  
  if map2:cc(x - 4, y, w, h) == false then
    if cc(0, 516, 64, 64,      x - 4, y, 60, 60) == false or keyTouched == true then

         x = x - 4
    end 
  end
end
if keyTouched == false then

end

if cc(650, 275, 64, 64,      x, y, 60, 60) == true then

  
end





  

 if (x < 28) then
  love.exitModule();
end
function love.draw()
  map:draw()
  map2:draw()
  love.graphics.draw(fountain, 675, 100)
  love.graphics.draw(fountain2, 675, 500)
  love.graphics.draw(torch, 208, 75)
  love.graphics.draw(key, 650, 275)
  love.graphics.draw(doorc, 3, 512)
  love.graphics.setColor(0, 0, 0, 1)
  love.graphics.rectangle('fill', x + 120, y - 150, 1000000000, 1000000000)
  love.graphics.rectangle('fill', x - 90 , y + 120, 1000000000, 1000000000)
  love.graphics.rectangle('fill', x - 1000, y - 150, 950, 1000000000)
  love.graphics.rectangle('fill', x - 1000, y - 1000, 1000000000, 950)
  love.graphics.setColor(1, 1, 1, 1)
  
  love.graphics.draw(playerImg, x, y)
  end
end
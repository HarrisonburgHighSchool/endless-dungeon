local Map = require 'core/map'
function love.load()
 playerImg = love.graphics.newImage('assets-1/monster/animals/fire_bat.png')
  cobalt = love.graphics.newImage('assets-1/dungeon/floor/black_cobalt_1.png')


 x = 400
 y = 400

 floor = {
   {cobalt, cobalt, cobalt},{cobalt, cobalt, cobalt},
   {cobalt, cobalt, cobalt},{cobalt, cobalt, cobalt},
   {cobalt, cobalt, cobalt},{cobalt, cobalt, cobalt},
   {cobalt, cobalt, cobalt},{cobalt, cobalt, cobalt},
   {cobalt, cobalt, cobalt},{cobalt, cobalt, cobalt},
   {cobalt, cobalt, cobalt},{cobalt, cobalt, cobalt},
   {cobalt, cobalt, cobalt},{cobalt, cobalt, cobalt},
   {cobalt, cobalt, cobalt},{cobalt, cobalt, cobalt},
   {cobalt, cobalt, cobalt},{cobalt, cobalt, cobalt},
   {cobalt, cobalt, cobalt},{cobalt, cobalt, cobalt},
   {cobalt, cobalt, cobalt},{cobalt, cobalt, cobalt},
   {cobalt, cobalt, cobalt},{cobalt, cobalt, cobalt},
   {cobalt, cobalt, cobalt},{cobalt, cobalt, cobalt},
   {cobalt, cobalt, cobalt},{cobalt, cobalt, cobalt},
 
 }

 map = Map:new(floor)
end

function love.update(dt)
  if love.keyboard.isDown('right')then -- if the 'up' key is being pressed
    x = x + 15
  end
  if love.keyboard.isDown('left')then -- if the 'up' key is being pressed
    x = x - 15
  end
  if love.keyboard.isDown('down')then -- if the 'up' key is being pressed
    y = y + 15
end
if love.keyboard.isDown('up')then -- if the 'up' key is being pressed
  y = y - 15
end
  -- Nothing to update
  if keyboard.isDown ('w') then
    if cc(x,y-1,e,h, 100,200,64,64) == flase than
    y=y-1
  end
end

function love.draw()
  love.graphics.print('Hello, world!', 10, 10)
  map:draw()
  love.graphics.draw(playerImg, x, y)
end
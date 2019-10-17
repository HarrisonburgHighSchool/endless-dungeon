local Map = require 'core/map'
function love.load()
 playerImg = love.graphics.newImage('assets-1/monster/animals/fire_bat.png')
  cobalt = love.graphics.newImage('assets-1/dungeon/floor/black_cobalt_1.png')
  cobalt = love.graphics.newImage('assets-1/dungeon/wall/cobalt_stone_8.png')
  sound = love.audio.newSource('pathtoasset', 'static')


 x = 400
 y = 400

 floor = {
           {cobalt, cobalt, cobalt, cobalt, cobalt, cobalt},
           {cobalt, cobalt, cobalt, cobalt, cobalt, cobalt},
           {cobalt, cobalt, cobalt, cobalt, cobalt, cobalt},
           {cobalt, cobalt, cobalt, cobalt, cobalt, cobalt},
           {cobalt, cobalt, cobalt, cobalt, cobalt, cobalt},
           {cobalt, 'nil', 'nil', 'nil', 'nil', cobalt},
           {cobalt, 'nil', 'nil', 'nil', 'nil', cobalt},
           {cobalt, 'nil', 'nil', 'nil', 'nil', cobalt},
           {cobalt, 'nil', 'nil', 'nil', 'nil', cobalt},
           {cobalt, 'nil', 'nil', 'nil', 'nil', cobalt},
           {cobalt, cobalt, cobalt, cobalt, cobalt, cobalt},
           {cobalt, cobalt, cobalt, cobalt, cobalt, cobalt},
           {cobalt, cobalt, cobalt, cobalt, cobalt, cobalt},
           {cobalt, cobalt, cobalt, cobalt, cobalt, cobalt},
 
 }

 map = Map:new(floor)


 wall = {
       {stone, stone, stone, stone},
       {stone, 'nil', 'nil', stone},
       {stone, 'nil', 'nil', stone},
       {stone, 'nil', 'nil', stone},
       {stone, stone, stone, stone},

}
wall = Map:new(wall)
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
if key == 'space' then
  sound:play()
end
 end








function love.draw()
  love.graphics.print('Hello, world!', 10, 10)
  map:draw()
  wall:draw()
  love.graphics.draw(playerImg, x, y)
end

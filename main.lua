local Map = require 'core/map'
local gamera = require 'core/gamera'
local Util = require 'core/util'
--local Entity = require 'core/entity'

function love.load()
 -- -img = love.graphics.newImage(,player.png)
  --player = Entity:new(img, 200, 200)
  cam = gamera.new(0,0,2000,2000)
  x = 100
  y = 100
  x2 = 400
  y2 = 333
  x3 = 64
  y3 = 863

end
  
  playerImg = love.graphics.newImage('assets-1/monster/demons/hellion.png')
 w = 64   -- The player's width is 64
 h = 64   -- The player's height is 64
  w2 = 320   -- The player's width is 64
  h2 = 256
  w3 = 1088
  h3 = 64
  hp = 100 -- Set the player's HP to 100 at the start of the game
  floorTile = love.graphics.newImage('assets-1/dungeon/floor/etched_5.png')
  floorTile2 = love.graphics.newImage('assets-1/dungeon/wall/pebble_red_0.png')
  altar     = love.graphics.newImage('assets-1/dungeon/floor/black_cobalt_3.png')
  template = { --a 20 x 20 map with the altar texture in the middle
                {floorTile2, floorTile2, floorTile2,floorTile2, floorTile2, floorTile2,floorTile2, floorTile2, floorTile2,floorTile2, floorTile2, floorTile2,floorTile2, floorTile2},
                {floorTile2, floorTile, floorTile,floorTile, floorTile, floorTile,floorTile, floorTile, floorTile,floorTile, floorTile, floorTile,floorTile, floorTile2},
                {floorTile2, floorTile, floorTile,floorTile, floorTile, floorTile,floorTile, floorTile, floorTile,floorTile, floorTile, floorTile,floorTile, floorTile2},
                {floorTile2, floorTile, floorTile,floorTile, floorTile, floorTile,floorTile, floorTile, floorTile,floorTile, floorTile, floorTile,floorTile, floorTile2},
                {floorTile2, floorTile, floorTile,floorTile, floorTile, floorTile,floorTile, floorTile, floorTile,floorTile, floorTile, floorTile,floorTile, floorTile2},
                {floorTile2, floorTile, floorTile,floorTile, floorTile, floorTile,floorTile, floorTile, floorTile,floorTile, floorTile, floorTile,floorTile, floorTile2},
                {floorTile2, floorTile, floorTile,floorTile, floorTile, altar,altar,altar,altar,floorTile, floorTile, floorTile,floorTile, floorTile2},
                {floorTile2, floorTile, floorTile,floorTile, floorTile, altar,altar,altar,altar,floorTile, floorTile, floorTile,floorTile, floorTile2},
                {floorTile2, floorTile, floorTile,floorTile, floorTile, altar,altar,altar,altar,floorTile, floorTile, floorTile,floorTile, floorTile2},
                {floorTile2, floorTile, floorTile,floorTile, floorTile, altar,altar,altar,altar,floorTile, floorTile, floorTile,floorTile, floorTile2},
                {floorTile2, floorTile, floorTile,floorTile, floorTile, altar,altar,altar,altar,floorTile, floorTile, floorTile,floorTile, floorTile2},
                {floorTile2, floorTile, floorTile,floorTile, floorTile, floorTile,floorTile, floorTile, floorTile,floorTile, floorTile, floorTile,floorTile, floorTile2},
                {floorTile2, floorTile, floorTile,floorTile, floorTile, floorTile,floorTile, floorTile, floorTile,floorTile, floorTile, floorTile,floorTile, floorTile2},
                {floorTile2, floorTile, floorTile,floorTile, floorTile, floorTile,floorTile, floorTile, floorTile,floorTile, floorTile, floorTile,floorTile, floorTile2},
                {floorTile2, floorTile, floorTile,floorTile, floorTile, floorTile,floorTile, floorTile, floorTile,floorTile, floorTile, floorTile,floorTile, floorTile2},
                {floorTile2, floorTile, floorTile,floorTile, floorTile, floorTile,floorTile, floorTile, floorTile,floorTile, floorTile, floorTile,floorTile, floorTile2},
                {floorTile2, floorTile2, floorTile2,floorTile2, floorTile2, floorTile2,floorTile2, floorTile2, floorTile2,floorTile2, floorTile2, floorTile2,floorTile2, floorTile2},
                




              }





map2 = { --a 20 x 20 map with the altar texture in the middle
               {floorTile2, floorTile2, floorTile2,floorTile2, floorTile2, floorTile2,floorTile2, floorTile2, floorTile2,floorTile2, floorTile2, floorTile2,floorTile2, floorTile2},
               {floorTile2, 'nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil', floorTile2},
               {floorTile2, 'nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil', floorTile2},
               {floorTile2, 'nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil', floorTile2},
               {floorTile2, 'nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil', floorTile2},
               {floorTile2, 'nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil', floorTile2},
               {floorTile2, 'nil','nil','nil', altar,altar,altar,altar,'nil','nil','nil','nil', floorTile2},
               {floorTile2, 'nil','nil','nil', altar,altar,altar,altar,'nil','nil','nil','nil', floorTile2},
               {floorTile2, 'nil','nil','nil', altar,altar,altar,altar,'nil','nil','nil','nil', floorTile2},
               {floorTile2, 'nil','nil','nil', altar,altar,altar,altar,'nil','nil','nil','nil', floorTile2},
               {floorTile2, 'nil','nil','nil', altar,altar,altar,altar,'nil','nil','nil','nil', floorTile2},
               {floorTile2, 'nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil', floorTile2},
               {floorTile2, 'nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil', floorTile2},
               {floorTile2, 'nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil', floorTile2},
               {floorTile2, 'nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil', floorTile2},
               {floorTile2, floorTile2, floorTile2,floorTile2, floorTile2, floorTile2,floorTile2, floorTile2, floorTile2,floorTile2, floorTile2, floorTile2,floorTile2, floorTile2},







              }
 map = Map:new(template)
 map2 = Map:new(map2)           
w = 64
h = 64 
hp

if love.keyboard.isDown('w') then
  if map2:cc(x,y-5,64,64)== false then
    y = y - 5
  end
end
function love.update(dt)
   --Nothing update
 -- Set up player movement
 if cc(x, y - 3, w, h, x3, y3, w3, h3) == false then
 if love.keyboard.isDown('w') then
  y = y - 3
  end
end
end
if cc(x, y + 3, w, h, x2, y2, w2, h2) == false then
  if love.keyboard.isDown('s') then
    y = y + 3
  end
end
if cc(x - 3, y, w, h, x2, y2, w2, h2) == false then 
  if love.keyboard.isDown('a') then
    x = x - 3
 end  
end
if cc(x + 3, y, w, h, x2, y2, w2, h2) == false then 
 if love.keyboard.isDown('d') then
  x = x + 3
  end
end

  cam:setPosition(x,y)

function love.draw()
 -- player:draw()
  cam:draw(function(l, t, w, h)
    map:draw()
    love.graphics.print(x, 50, 50)
    love.graphics.print(y, 60, 60)
    love.graphics.print('', 0, 0)
    love.graphics.draw(playerImg, x, y)
    if map:cc(x, y+1, 64, 64) == false then
    end
  --  love.graphics.rectangle('line', 0, 0, 64, 899)
    love.graphics.print(hp, 0, 0)
end)
end

local Map = require 'core/map'
local gamera = require 'core/gamera'
--local Entity = require 'core/entity'

function love.load()
 -- -img = love.graphics.newImage(,player.png)
  --player = Entity:new(img, 200, 200)
  cam = gamera.new(0,0,2000,2000)
  x = 100
  y = 100
  ex = 100
  ey = 100
  dir = 'd'
  eimg = love.graphics.newImage('assets-1/monster/demons/chaos_spawn_1.png')
  playerImg = love.graphics.newImage('assets-1/monster/demons/hellion.png')
 w = 32   -- The player's width is 64
 h = 32   -- The player's height is 64
  hp = 100 -- Set the player's HP to 100 at the start of the game
  floorTile = love.graphics.newImage('assets-1/dungeon/floor/etched_5.png')
  floorTile2 = love.graphics.newImage('assets-1/dungeon/wall/pebble_red_0.png')
  altar     = love.graphics.newImage('assets-1/dungeon/floor/black_cobalt_3.png')
  template = { --a 20 x 20 map with the altar texture in the middle
                
                 floorTile, floorTile,floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile,floorTile,
                 floorTile, floorTile,floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile,floorTile,
                 floorTile, floorTile,floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile,floorTile,
                 floorTile, floorTile,floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile,floorTile,
                 floorTile, floorTile,floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile,floorTile,
                 floorTile, floorTile,floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile,floorTile,
                 floorTile, floorTile,floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile,floorTile,
                 floorTile, floorTile,floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile,floorTile,
                 floorTile, floorTile,floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile,floorTile,
                 floorTile, floorTile,floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile,floorTile,
                 floorTile, floorTile,floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile,floorTile,
                 floorTile, floorTile,floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile,floorTile,
                 floorTile, floorTile,floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile,floorTile,
                 floorTile, floorTile,floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile,floorTile,
                
                




              }





map2 = { --a 20 x 20 map with the altar texture in the middle
               {floorTile2, floorTile2, floorTile2,floorTile2, floorTile2, floorTile2,floorTile2, floorTile2, floorTile2,floorTile2, floorTile2, floorTile2,floorTile2, floorTile2},
               {floorTile2, 'nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil', floorTile2},
               {floorTile2, 'nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil', floorTile2},
               {floorTile2, 'nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil', floorTile2},
               {floorTile2, 'nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil', floorTile2},
               {floorTile2, 'nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil', floorTile2},
               {floorTile2, 'nil','nil','nil', altar,altar,altar,altar,'nil','nil','nil','nil','nil', floorTile2},
               {floorTile2, 'nil','nil','nil', altar,altar,altar,altar,'nil','nil','nil','nil','nil', floorTile2},
               {floorTile2, 'nil','nil','nil', altar,altar,altar,altar,'nil','nil','nil','nil','nil',floorTile2},
               {floorTile2, 'nil','nil','nil', altar,altar,altar,altar,'nil','nil','nil','nil','nil', floorTile2},
               {floorTile2, 'nil','nil','nil', altar,altar,altar,altar,'nil','nil','nil','nil','nil', floorTile2},
               {floorTile2, 'nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil', floorTile2},
               {floorTile2, 'nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil', floorTile2},
               {floorTile2, 'nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil', floorTile2},
               {floorTile2, 'nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil', floorTile2},
               {floorTile2, 'nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil','nil', floorTile2},
               {floorTile2, floorTile2, floorTile2,floorTile2, floorTile2, floorTile2,floorTile2, floorTile2, floorTile2,floorTile2, floorTile2, floorTile2,floorTile2, floorTile2},







              }
 map = Map:new(template) 
 map2 = Map:new(map2)          
end



function love.update(dt)
if ex < 10 then
end
if ex >200 then
end
if dir =='d' then
ex = ex + 3
end
if dir == 'a' then
ex = ex - 3 
end
   --Nothing update
 -- Set up player movement
 if love.keyboard.isDown('w') then
    if map2:cc(x, y - 5, w, h) == false then
    y = y - 5
  end
end
  if love.keyboard.isDown('s') then
    if map2:cc(x, y + 5, w, h) == false then
    y = y + 5
  end
end
  if love.keyboard.isDown('a') then
    if map2:cc(x - 5 ,y, w, h) == false then 
    x = x - 3
  end  
end
 if love.keyboard.isDown('d') then
   if map2:cc(x + 5, y, w, h) == false then 
   x = x + 3
  end
end

  cam:setPosition(x,y)

end
function love.draw()
 --player:draw()
  cam:draw(function(l, t, w, h)
    map:draw()
    map2:draw()
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
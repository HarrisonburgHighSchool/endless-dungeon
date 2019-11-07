local Map = require 'core/map'
local gamera = require 'core/gamera'
--local Entity = require 'core/entity'

function love.load()
  hp = 100
  bosshp = 100
  --player = Entity:new(img, 200, 200) 
  cam = gamera.new(0,0,5000,5000)
  x = 500
  y = 100
  boss = love.graphics.newImage('assets-1/monster/animals/black_bear.png')
  by = 150
  bx = 200
  boss2 = love.graphics.newImage('assets-1/monster/animals/black_bear.png')
  dir = 'd'
  playerImg = love.graphics.newImage('assets-1/monster/demons/hellion.png')
 w = 32   -- The player's width is 64
 h = 32   -- The player's height is 64
 bossw = 100
 bossy = 100
  hp = 100 -- Set the player's HP to 100 at the start of the game
  floorTile = love.graphics.newImage('assets-1/dungeon/floor/etched_5.png')
  floorTile2 = love.graphics.newImage('assets-1/dungeon/wall/pebble_red_0.png')
  altar = love.graphics.newImage('assets-1/dungeon/floor/black_cobalt_3.png')
  map = { --a 20 x 20 map with the altar texture in the middle  
                {floorTile2, floorTile2, floorTile2, floorTile2, floorTile2, floorTile2, floorTile2, floorTile2, floorTile2, floorTile2, floorTile2, floorTile2, floorTile2},
                {floorTile2, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile2},
                {floorTile2, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile2},
                {floorTile2, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile2},
                {floorTile2, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile2},
                {floorTile2, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile2},
                {floorTile2, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile2},
                {floorTile2, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile2},
                {floorTile2, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile2},
                {floorTile2, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile2},
                {floorTile2, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile2},
                {floorTile2, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile2},
                {floorTile2, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile2},
                {floorTile2, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile2},
                {floorTile2, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile2},
                {floorTile2, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile2},
                {floorTile2, floorTile2, floorTile2,floorTile, floorTile, floorTile2, floorTile2, floorTile2, floorTile2,floorTile, floorTile, floorTile2, floorTile2},
                {floorTile2, floorTile2, floorTile2,floorTile, floorTile, floorTile2, floorTile2, floorTile2, floorTile2,floorTile, floorTile, floorTile2, floorTile2},
                {floorTile2, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile2},
                {floorTile2, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile2},
                {floorTile2, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile2},
                {floorTile2, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile2},
                {floorTile2, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile2},
                {floorTile2, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile2},
                {floorTile2, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile2},
                {floorTile2, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile2},
                {floorTile2, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile2},
                {floorTile2, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile2},
                {floorTile2, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile2},
                {floorTile2, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile2},
                {floorTile2, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile2},
                {floorTile2, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile2},
                {floorTile2, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile2},
                {floorTile2, floorTile2, floorTile2 ,floorTile2, floorTile2, floorTile2, floorTile2, floorTile2, floorTile2, floorTile2, floorTile2, floorTile2, floorTile2},
                




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
               {floorTile2, floorTile2, floorTile2,'nil','nil', floorTile2,floorTile2, floorTile2, floorTile2,'nil', 'nil', floorTile2,floorTile2, floorTile2},
               {floorTile2, floorTile2, floorTile2,'nil','nil', floorTile2,floorTile2, floorTile2, floorTile2,'nil', 'nil', floorTile2,floorTile2, floorTile2},
               {floorTile2, 'nil','nil','nil','nil','nil', 'nil','nil','nil','nil','nil','nil','nil', floorTile2},
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
 map = Map:new(map) 
 map2 = Map:new(map2)          
end



function love.update(dt)
  if bosshp < 1 then
    love.exitModule();
  end
   --Nothing update
 -- Set up player movement
 if love.keyboard.isDown('w')  or love.keyboard.isDown('up') then
    if map2:cc(x, y - 3, w, h) == false then
    y = y - 3
  end
end
  if love.keyboard.isDown('s') or love.keyboard.isDown('down') then
    if map2:cc(x, y + 3, w, h) == false then
    y = y + 3
  end
end
  if love.keyboard.isDown('a') or  love.keyboard.isDown('left')then
    if map2:cc(x - 3 ,y, w, h) == false then 
    x = x - 3
  end 
end

 if love.keyboard.isDown('d') or love.keyboard.isDown('right')then
   if map2:cc(x + 3, y, w, h) == false then 
   x = x + 3
  end
end
if x > bx then
      if map2:cc(bx + 2, by,  100, 100) == false then
    bx = bx + 2
  end
end
if x < bx then
      if map2:cc(bx -2, by , 100 , 100) == false then 
    bx = bx - 2
  end
end
if y <  by then
     if map2:cc(bx , by - 2,  100, 100) == false then 
    by =  by - 2
  end
end
if y >  by then
      if map2:cc(bx , by + 2, 100, 100) == false then 
    by = by + 2
  end
end
  cam:setPosition(x,y)

end


function love.draw()
  love.graphics.draw(boss2, x, y)
  cam:draw(function(l, t, w, h)
    map:draw()
    map2:draw()
    love.graphics.print(x, 50, 50)
    love.graphics.print(y, 60, 60)
    love.graphics.draw(playerImg, x, y)
    if map:cc(x, y + 1, 64, 64) == false then
    end
   love.graphics.rectangle('line', 0, 0, 64, 899)
    love.graphics.print(hp)
    love.graphics.print(bosshp,bx,by)
    love.graphics.draw(boss, bx, by, 0, 3)
end)
end

function love.keypressed(key)
  if key == 'q' then
  bosshp = bosshp - 5
  end
end
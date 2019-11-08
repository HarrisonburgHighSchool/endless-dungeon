local Util = require 'core/util'
local Map = require 'core/map'
local gamera = require 'core/gamera'
function love.load()
  ex = 100
  ey = 100
  dir = 'right'
  eimg = love.graphics.newImage('assets-1/monster/demons/chaos_spawn_1.png')


  
  cam = gamera.new(0, 0, 2000, 2000) 
  cam:setPosition(400, 400)
  x = 400
  y = 300
  playerImg = love.graphics.newImage('assets-1/player/base/octopode_1.png')
  floorTile = love.graphics.newImage('assets-1/dungeon/floor/etched_5.png')
  walls = love.graphics.newImage('assets-1/dungeon/wall/catacombs_1.png')
  altar     = love.graphics.newImage('assets-1/dungeon/floor/bog_green_1.png')
  template = { --a 3 x 3 map with the altar texture in the middle
                 {walls, walls, walls, walls, walls, walls, walls, walls,walls, walls, walls, walls,  walls, walls, walls, walls,walls, walls, walls, walls, walls, walls},
                 {walls, floorTile, floorTile, altar, floorTile, floorTile, floorTile, altar,floorTile, floorTile, floorTile, altar,  floorTile, floorTile, floorTile, walls},
                 {walls, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile,  floorTile, floorTile, floorTile, walls},
                 {walls, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile,  floorTile, floorTile, floorTile, walls},
                 {walls, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile,  floorTile, floorTile, floorTile, walls},
                 {walls, floorTile, floorTile, floorTile, floorTile, floorTile,floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile,  floorTile, floorTile, floorTile, walls},
                 {walls, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile,  floorTile, floorTile, floorTile, walls},
                 {walls, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile,  floorTile, floorTile, floorTile, walls},
                 {walls, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile,  floorTile, floorTile, floorTile, walls},
                 {walls, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile,  floorTile, floorTile, floorTile, walls},
                 {walls, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile,  floorTile, floorTile, floorTile, walls},
                 {walls, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile,  floorTile, floorTile, floorTile, walls},
                 {walls, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile,  floorTile, floorTile, floorTile, walls},
                 {walls, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile,  floorTile, floorTile, floorTile, walls},
                 {walls, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile,  floorTile, floorTile, floorTile, walls},
                 {walls, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile,  floorTile, floorTile, floorTile, walls},
                 {walls, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile,  floorTile, floorTile, floorTile, walls},
                 {walls, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile,  floorTile, floorTile, floorTile, walls},
                 {walls, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile,  floorTile, floorTile, floorTile, walls},
                 {walls, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile,  floorTile, floorTile, floorTile, walls},
                 {walls, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile,  floorTile, floorTile, floorTile, walls},
                 {walls, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile,  floorTile, floorTile, floorTile, walls},
                 {walls, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile,  floorTile, floorTile, floorTile, walls},
                 {walls, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile,  floorTile, floorTile, floorTile, walls},
                 {walls, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile,  floorTile, floorTile, floorTile, walls},
                 {walls, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile,  floorTile, floorTile, floorTile, walls},
                 {walls, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile,  floorTile, floorTile, floorTile, walls},
                 {walls, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile,  floorTile, floorTile, floorTile, walls},
                 {walls, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile,  floorTile, floorTile, floorTile, walls},
                 {walls, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile,  floorTile, floorTile, floorTile, walls},
                 {walls, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile,  floorTile, floorTile, floorTile, walls},
                 {walls, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile,  floorTile, floorTile, floorTile, walls},
                 {walls, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile,  floorTile, floorTile, floorTile, walls},
                 {walls, floorTile, floorTile, floorTile,  floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile,  floorTile, floorTile, floorTile, walls},
                 {walls, floorTile, floorTile, floorTile,  floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile,  floorTile, floorTile, floorTile, walls},
                 {walls, walls, walls, walls,  walls, walls, walls, walls, walls, walls, walls, walls, walls, walls,  walls,  walls, walls, walls, walls, walls, walls, walls}, 
  
  
  
                } 
                
map2 = { --a 3 x 3 map with the altar texture in the middle
{walls, walls, walls, walls, walls, walls, walls, walls,walls, walls, walls, walls,  walls, walls, walls, walls},
{walls, 'nil', 'nil', altar, 'nil', 'nil', 'nil', altar,'nil', 'nil', 'nil', altar,  'nil', 'nil', 'nil', walls},
{walls, 'nil', 'nil', altar, 'nil', 'nil', 'nil', altar,'nil', 'nil', 'nil', altar,  'nil', 'nil', 'nil', walls},
{walls, 'nil', 'nil', altar, 'nil', 'nil', 'nil', altar,'nil', 'nil', 'nil', altar,  'nil', 'nil', 'nil', walls},
{walls, 'nil', 'nil', altar, 'nil', 'nil', 'nil', altar,'nil', 'nil', 'nil', altar,  'nil', 'nil', 'nil', walls},
{walls, 'nil', 'nil', altar, 'nil', 'nil', 'nil', altar,'nil', 'nil', 'nil', altar,  'nil', 'nil', 'nil', walls},
{walls, 'nil', 'nil', altar, 'nil', 'nil', 'nil', altar,'nil', 'nil', 'nil', altar,  'nil', 'nil', 'nil', walls},
{walls, 'nil', 'nil', altar, 'nil', 'nil', 'nil', altar,'nil', 'nil', 'nil', altar,  'nil', 'nil', 'nil', walls},
{walls, 'nil', 'nil', altar, 'nil', 'nil', 'nil', altar,'nil', 'nil', 'nil', altar,  'nil', 'nil', 'nil', walls},
{walls, 'nil', 'nil', altar, 'nil', 'nil', 'nil', altar,'nil', 'nil', 'nil', altar,  'nil', 'nil', 'nil', walls},
{walls, 'nil', 'nil', altar, 'nil', 'nil', 'nil', altar,'nil', 'nil', 'nil', altar,  'nil', 'nil', 'nil', walls},
{walls, 'nil', 'nil', altar, 'nil', 'nil', 'nil', altar,'nil', 'nil', 'nil', altar,  'nil', 'nil', 'nil', walls},
{walls, 'nil', 'nil', altar, 'nil', 'nil', 'nil', altar,'nil', 'nil', 'nil', altar,  'nil', 'nil', 'nil', walls},
{walls, 'nil', 'nil', altar, 'nil', 'nil', 'nil', altar,'nil', 'nil', 'nil', altar,  'nil', 'nil', 'nil', walls},
{walls, 'nil', 'nil', altar, 'nil', 'nil', 'nil', altar,'nil', 'nil', 'nil', altar,  'nil', 'nil', 'nil', walls},
{walls, 'nil', 'nil', altar, 'nil', 'nil', 'nil', altar,'nil', 'nil', 'nil', altar,  'nil', 'nil', 'nil', walls},
{walls, 'nil', 'nil', altar, 'nil', 'nil', 'nil', altar,'nil', 'nil', 'nil', altar,  'nil', 'nil', 'nil', walls},
{walls, 'nil', 'nil', altar, 'nil', 'nil', 'nil', altar,'nil', 'nil', 'nil', altar,  'nil', 'nil', 'nil', walls},
{walls, 'nil', 'nil', altar, 'nil', 'nil', 'nil', altar,'nil', 'nil', 'nil', altar,  'nil', 'nil', 'nil', walls},
{walls, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil','nil', 'nil', 'nil', 'nil',  'nil', 'nil', 'nil', walls},
{walls, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil','nil', 'nil', 'nil', 'nil',  'nil', 'nil', 'nil', walls},
{walls, 'nil', 'nil', altar,'nil','nil',  'nil', altar,'nil', 'nil', 'nil', altar,  'nil', 'nil', 'nil', walls},
{walls, 'nil', 'nil', altar, 'nil', 'nil', 'nil', altar,'nil', 'nil', 'nil', altar,  'nil', 'nil', 'nil', walls},
{walls, 'nil', 'nil', altar, 'nil', 'nil', 'nil', altar,'nil', 'nil', 'nil', altar,  'nil', 'nil', 'nil', walls},
{walls, 'nil', 'nil', altar, 'nil', 'nil', 'nil', altar,'nil', 'nil', 'nil', altar,  'nil', 'nil', 'nil', walls},
{walls, 'nil', 'nil', altar, 'nil', 'nil', 'nil', altar,'nil', 'nil', 'nil', altar,  'nil', 'nil', 'nil', walls},
{walls, 'nil', 'nil', altar, 'nil', 'nil', 'nil', altar,'nil', 'nil', 'nil', altar,  'nil', 'nil', 'nil', walls},
{walls, 'nil', 'nil', altar, 'nil', 'nil', 'nil', altar,'nil', 'nil', 'nil', altar,  'nil', 'nil', 'nil', walls},
{walls, 'nil', 'nil', altar, 'nil', 'nil', 'nil', altar,'nil', 'nil', 'nil', altar,  'nil', 'nil', 'nil', walls},
{walls, 'nil', 'nil', altar, 'nil', 'nil', 'nil', altar,'nil', 'nil', 'nil', altar,  'nil', 'nil', 'nil', walls},
{walls, 'nil', 'nil', altar, 'nil', 'nil', 'nil', altar,'nil', 'nil', 'nil', altar,  'nil', 'nil', 'nil', walls},
{walls, 'nil', 'nil', altar, 'nil', 'nil', 'nil', altar,'nil', 'nil', 'nil', altar,  'nil', 'nil', 'nil', walls},
{walls, 'nil', 'nil', altar, 'nil', 'nil', 'nil', altar,'nil', 'nil', 'nil', altar,  'nil', 'nil', 'nil', walls},
{walls, 'nil', 'nil', altar,  'nil', 'nil', 'nil', altar,'nil', 'nil', 'nil', altar,  'nil', 'nil', 'nil', walls},
{walls, 'nil', 'nil', altar,  'nil', 'nil', 'nil', altar,'nil', 'nil', 'nil', altar,  'nil', 'nil', 'nil', walls},
{walls, walls, walls, walls,  walls, walls, walls, walls, walls, walls, walls, walls, walls, walls,  walls,  walls}, 


} 
map = Map:new(template)
map2 = Map:new(map2)
w = 64   -- The player's width is 64
h = 64   -- The player's height is 64
hp = 100 -- Set the player's HP to 100 at the sstart of the game

end


function love.update(dt)
  if ex < 10 then
end
  if ex > 200 then
end
  if dir == 'right' then
  ex = ex + 3
  end
  if dir == 'left' then 
    ex = ex - 3
  end
  -- if ex < 1950 then
  --   ex = ex + 3
  -- end
  if love.keyboard.isDown('up') then  
    if map2:cc(x, y - 5, 64, 64) == false then
      y = y - 5
    end
  end
  if love.keyboard.isDown('right') then  
    if map2:cc(x + 5,y, 64, 64)==false then
    x = x + 5
    end
  end
  if love.keyboard.isDown('left') then  
    if map2:cc(x - 5, y, 64, 64) == false then
    x = x - 5
    end
  end
if love.keyboard.isDown('down') then  
  if map2:cc(x, y + 5, 64, 64) == false then
  y = y + 5
  end
end
cam:setPosition(x,y)
 -- x, y, w, h all represent the player's rectangle. The other values are a rectangle in the upper corner
 if cc(x, y, w, h,   0, 0, 64, 64) then  
  -- if true, decrease HP:
  hp = hp - 1
end
end

function love.draw()
  
  cam:draw(function(l,t,w,h)
    map:draw()
    map2:draw()
    love.graphics.draw(eimg, ex, ey) 
    love.graphics.print('', 0, 0)
    love.graphics.draw(playerImg, x, y)
    love.graphics.rectangle('line', 0 , 0, 64, 899) 
    love.graphics.rectangle('line', 0, 0, 64, 899)
    love.graphics.print(hp, 0, 0)
  end)
end






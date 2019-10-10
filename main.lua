local Map = require 'core/map'
local gamera = require 'core/gamera'
local Util = require 'core/util'
--local Entity = require 'core/entity'

function love.load()
 -- -img = love.graphics.newImage(,player.png)
  --player = Entity:new(img, 200, 200)
  cam = gamera.new(0,0,2000,2000)
  x = 400
  y = 300
  playerImg = love.graphics.newImage('assets-1/monster/demons/hellion.png')
 -- w = 64   -- The player's width is 64
 -- h = 899   -- The player's height is 64
  w2 = 64   -- The player's width is 64
  h2 = 899
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
map = Map:new(template)
end

function love.update(dt)
  -- Nothing update
 -- Set up player movement
 if love.keyboard.isDown('up') then
  y = y - 3
  end
  if love.keyboard.isDown('down') then
    y = y + 3
  end
  
  if love.keyboard.isDown('right') then
    x = x + 3
  end  
 if love.keyboard.isDown('right') then
  x = x + 3
  end
  cam:setPosition(x,y)

 -- if not cc(x, y, w, h,  0, 0, 64, 899) then  
    -- if true, decrease HP:
  --  if love.keyboard.isDown('left') then
  --    x = x - 3
   -- end
end
if love.keyboard.isDown('up') then 
  if cc(x,y,64,64,100,200,64,64)==false then
      y=y-1
  end
end
--end

function love.draw()
 -- player:draw()
  cam:draw(function(l, t, w, h)
    map:draw()
    love.graphics.print('', 0, 0)
    love.graphics.draw(playerImg, x, y)
  --  love.graphics.rectangle('line', 0, 0, 64, 899)
    love.graphics.print(hp, 0, 0)
end)
end
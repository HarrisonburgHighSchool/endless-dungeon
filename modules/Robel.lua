local Util = require 'core/util'
local Map = require 'core/map'
local gamera = require 'core/gamera'

function love.load()
  x = 400
  y = 300

  ex = 150
  ey = 100
  eimg = love.graphics.newImage('assets-1/player/base/octopode_2.png')


  playerImg = love.graphics.newImage('assets-1/player/base/octopode_1.png')
  wall =love.graphics.newImage('assets-1/dungeon/wall/zot_blue_1.png')
  floorTile = love.graphics.newImage('assets-1/dungeon/wall/crystal_wall_blue.png')
      altar = love.graphics.newImage('assets-1/dungeon/wall/bars_red_4.png')
     ground = love.graphics.newImage('assets-1/dungeon/wall/emerald_8.png')
      flooor= love.graphics.newImage('assets-1/dungeon/altars/gozag_1.png')
template = {


  {floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile},
            {floorTile, altar, altar, altar, altar, altar, altar, altar, altar, floorTile},
            {floorTile, altar, ground, ground, ground, ground, ground, ground, altar, floorTile,},
            {floorTile, altar, ground, ground, ground, ground, ground, ground, altar, floorTile},
            {floorTile, altar, ground, ground, ground, ground, ground, ground,  altar, floorTile},
            {floorTile, altar, ground, ground, ground, ground, ground, ground, altar, floorTile},
            {floorTile, altar, ground, ground, ground, ground, ground, ground, altar, floorTile},
            {floorTile, altar, ground, ground, ground, ground, ground, ground, altar, floorTile},
            {floorTile, altar, ground, ground, ground, ground, ground, ground, altar, floorTile},
            {floorTile, altar, ground, ground, ground, ground, ground, ground, altar, floorTile},
            {floorTile, altar, ground, ground, ground, ground, ground, ground, altar, floorTile},
            {floorTile, altar, ground, ground, ground, ground, ground, ground, altar, floorTile},
            {floorTile, altar, altar, altar, altar, altar, altar, altar, altar, floorTile},
            {floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile},

}
wall={
  {wall,wall,wall,wall,wall,wall,wall,wall,wall,wall},
{wall,'nil','nil','nil', 'nil', 'nil' ,'nil','nil', 'nil', 'nil',wall},
{wall,'nil','nil','nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil',wall},
{wall,'nil','nil','nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil',wall},
{wall,'nil','nil','nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil',wall},
{wall,'nil','nil','nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil',wall},
{wall,'nil','nil','nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil',wall},
{wall,'nil','nil','nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil',wall},
{wall,'nil','nil','nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil',wall},
{wall,'nil','nil','nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil',wall},
{wall,'nil','nil','nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil',wall},
{wall,'nil','nil','nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil',wall},
{wall,'nil','nil','nil', 'nil', 'nil','nil', 'nil', 'nil', 'nil',wall},
{wall,wall,wall,wall,wall,wall,wall,wall,wall,wall,wall}

            }

w = 64   -- The player's width is 64
h = 64   -- The player's height is 64
hp = 100

  collision = Map:new(wall)
  map = Map:new(template)
  cam = gamera.new(-100, -100, 2000, 2000)
end


function love.update(dt)
--Player movement
if collision:cc(x,y-5,w,h, 0,0,64,64) == false then
  if love.keyboard.isDown('up')then
      y=y-5
      cam:setPosition(x, y)
  end
 end
if collision:cc(x,y+5,w,h, 0,0,64,64) == false then

   if love.keyboard.isDown('down')then
    y=y+5
    cam:setPosition(x, y)
  end
end

if collision:cc(x-5,y,w,h, 0,0,64,64) == false then

  if love.keyboard.isDown('left')then
    x=x-5
    cam:setPosition(x, y)
  end
else
  hp = hp - 1
end

 if collision:cc(x+5,y,w,h, 0,0,64,64) == false then
 if love.keyboard.isDown('right')then
    x=x+5
    cam:setPosition(x, y)
  end
 end

 if x < 950 and x > 750 and y > 450 and y < 550 then
   y = y - 200
   x = x + 400
end

if x < 120 and x > 30 and y > 30 and y < 120 then
  y = y + 200
  x = x + 300


end

  if x < 150 and x > 50 and y > 350 and y < 450 then
    y = y + 200
    x = x + 300
end
 if ex < x then
  if collision:cc(ex + 5, ey,64,64) == false then
   ex = ex + 3
  end
 end
 if ex > x then
   if collision:cc(ex - 5, ey,64,64) == false then
    ex = ex - 3
   end
 end
  if ey > y then
    if collision:cc(ex, ey - 5,64,64)== false then
     ey = ey - 3
    end
  end
   if ey < y then
     if collision:cc(ex, ey + 5,64,64)== false then
      ey = ey + 3
    end
  end
 if cc(x, y, 32, 32, ex, ey,32,32)then
  love.exitModule()
 end
 if hp == 0 then
   love.exitModule()
 end
end

function love.draw()

cam:draw(function(l, t, w, h)
  map:draw()

  collision:draw()
  love.graphics.print('Hello, world!', 0, 0)

  love.graphics.draw(playerImg, x, y)
  love.graphics.draw(eimg, ex, ey)

--box color
  love.graphics.setColor(0, 0,1)
  love.graphics.rectangle('line', 67, 67, 64, 64)
  love.graphics.rectangle('line', 100, 400, 64, 64)
  love.graphics.rectangle('line', 800, 500, 64, 64)
  love.graphics.setColor(1, 1, 1, 1)






 end)


--player hp
love.graphics.print(hp, 0, 0)
end

local Util = require 'core/util'
local Map = require 'core/map'
local gamera = require 'core/gamera'

function love.load()
  x = 400
  y = 300
  A = 400
  B = 300
playerImg = love.graphics.newImage('assets-1/player/base/kobold_male.png')
img = love.graphics.newImage('assets-1/player/base/ghoul_2_male.png')

  floorTile = love.graphics.newImage('assets-1/dungeon/floor/black_cobalt_7.png')
  altar     = love.graphics.newImage('assets-1/dungeon/floor/bog_green_2.png')
template = {

             {floorTile, floorTile, floorTile, floorTile, floorTile,floorTile, floorTile, floorTile,floorTile, floorTile,floorTile, floorTile, floorTile, floorTile, floorTile,floorTile, floorTile, floorTile,floorTile, floorTile},
             {floorTile, altar, floorTile,floorTile, altar, floorTile, floorTile, altar, floorTile,floorTile, altar, floorTile,floorTile, floorTile, floorTile, floorTile, floorTile,floorTile, floorTile, floorTile,floorTile, floorTile},
             {floorTile, floorTile, floorTile,floorTile, floorTile,floorTile, floorTile, floorTile,floorTile, floorTile,floorTile, floorTile, floorTile, floorTile, floorTile,floorTile, floorTile, floorTile,floorTile, floorTile},
             {floorTile, floorTile, floorTile, floorTile, floorTile,floorTile, floorTile, floorTile,floorTile, floorTile,floorTile, floorTile, floorTile, floorTile, floorTile,floorTile, floorTile, floorTile,floorTile, floorTile},
             {floorTile, altar, floorTile,floorTile, altar, floorTile, floorTile, altar, floorTile,floorTile, altar, floorTile,floorTile, floorTile, floorTile, floorTile, floorTile,floorTile, floorTile, floorTile,floorTile, floorTile},
             {floorTile, floorTile, floorTile,floorTile, floorTile,floorTile, floorTile, floorTile,floorTile, floorTile,floorTile, floorTile, floorTile, floorTile, floorTile,floorTile, floorTile, floorTile,floorTile, floorTile},
             {floorTile, floorTile, floorTile, floorTile, floorTile,floorTile, floorTile, floorTile,floorTile, floorTile,floorTile, floorTile, floorTile, floorTile, floorTile,floorTile, floorTile, floorTile,floorTile, floorTile},
             {floorTile, altar, floorTile,floorTile, altar, floorTile,floorTile, altar, floorTile,floorTile, altar, floorTile,floorTile, floorTile, floorTile, floorTile, floorTile,floorTile, floorTile, floorTile,floorTile, floorTile},
             {floorTile, floorTile, floorTile,floorTile, floorTile,floorTile, floorTile, floorTile,floorTile, floorTile,floorTile, floorTile, floorTile, floorTile, floorTile,floorTile, floorTile, floorTile,floorTile, floorTile},
             {floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile,floorTile, floorTile,floorTile, floorTile, floorTile, floorTile, floorTile,floorTile, floorTile, floorTile,floorTile, floorTile},
             {floorTile, altar, floorTile,floorTile, altar, floorTile,floorTile, altar, floorTile,floorTile, altar, floorTile,floorTile, floorTile, floorTile, floorTile, floorTile,floorTile, floorTile, floorTile,floorTile, floorTile},
             {floorTile, floorTile, floorTile,floorTile, floorTile,floorTile, floorTile, floorTile,floorTile, floorTile,floorTile, floorTile, floorTile, floorTile, floorTile,floorTile, floorTile, floorTile,floorTile, floorTile},
             {floorTile, floorTile, floorTile, floorTile, floorTile,floorTile, floorTile, floorTile,floorTile, floorTile,floorTile, floorTile, floorTile, floorTile, floorTile,floorTile, floorTile, floorTile,floorTile, floorTile},
             {floorTile, altar, floorTile,floorTile, altar, floorTile, floorTile, altar, floorTile,floorTile, altar, floorTile,floorTile, floorTile, floorTile, floorTile, floorTile,floorTile, floorTile, floorTile,floorTile, floorTile},
             {floorTile, floorTile, floorTile,floorTile, floorTile,floorTile, floorTile, floorTile,floorTile, floorTile,floorTile, floorTile, floorTile, floorTile, floorTile,floorTile, floorTile, floorTile,floorTile, floorTile},
             {floorTile, floorTile, floorTile, floorTile, floorTile,floorTile, floorTile, floorTile,floorTile, floorTile,floorTile, floorTile, floorTile, floorTile, floorTile,floorTile, floorTile, floorTile,floorTile, floorTile},
             {floorTile, altar, floorTile,floorTile, altar, floorTile, floorTile, altar, floorTile,floorTile, altar, floorTile,floorTile, floorTile, floorTile, floorTile, floorTile,floorTile, floorTile, floorTile,floorTile, floorTile},
             {floorTile, floorTile, floorTile,floorTile, floorTile,floorTile, floorTile, floorTile,floorTile, floorTile,floorTile, floorTile, floorTile, floorTile, floorTile,floorTile, floorTile, floorTile,floorTile, floorTile},
             {floorTile, floorTile, floorTile, floorTile, floorTile,floorTile, floorTile, floorTile,floorTile, floorTile,floorTile, floorTile, floorTile, floorTile, floorTile,floorTile, floorTile, floorTile,floorTile, floorTile},
             {floorTile, altar, floorTile,floorTile, altar, floorTile,floorTile, altar, floorTile,floorTile, altar, floorTile,floorTile, floorTile, floorTile, floorTile, floorTile,floorTile, floorTile, floorTile,floorTile, floorTile},
             {floorTile, floorTile, floorTile,floorTile, floorTile,floorTile, floorTile, floorTile,floorTile, floorTile,floorTile, floorTile, floorTile, floorTile, floorTile,floorTile, floorTile, floorTile,floorTile, floorTile},
             {floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile,floorTile, floorTile,floorTile, floorTile, floorTile, floorTile, floorTile,floorTile, floorTile, floorTile,floorTile, floorTile},
             {floorTile, altar, floorTile,floorTile, altar, floorTile,floorTile, altar, floorTile,floorTile, altar, floorTile,floorTile, floorTile, floorTile, floorTile, floorTile,floorTile, floorTile, floorTile,floorTile, floorTile},
             {floorTile, floorTile, floorTile,floorTile, floorTile,floorTile, floorTile, floorTile,floorTile, floorTile,floorTile, floorTile, floorTile, floorTile, floorTile,floorTile, floorTile, floorTile,floorTile, floorTile},
             {floorTile, floorTile, floorTile, floorTile, floorTile,floorTile, floorTile, floorTile,floorTile, floorTile,floorTile, floorTile, floorTile, floorTile, floorTile,floorTile, floorTile, floorTile,floorTile, floorTile},
             {floorTile, altar, floorTile,floorTile, altar, floorTile, floorTile, altar, floorTile,floorTile, altar, floorTile,floorTile, floorTile, floorTile, floorTile, floorTile,floorTile, floorTile, floorTile,floorTile, floorTile},
             {floorTile, floorTile, floorTile,floorTile, floorTile,floorTile, floorTile, floorTile,floorTile, floorTile,floorTile, floorTile, floorTile, floorTile, floorTile,floorTile, floorTile, floorTile,floorTile, floorTile},
             {floorTile, floorTile, floorTile, floorTile, floorTile,floorTile, floorTile, floorTile,floorTile, floorTile,floorTile, floorTile, floorTile, floorTile, floorTile,floorTile, floorTile, floorTile,floorTile, floorTile},
             {floorTile, altar, floorTile,floorTile, altar, floorTile, floorTile, altar, floorTile,floorTile, altar, floorTile,floorTile, floorTile, floorTile, floorTile, floorTile,floorTile, floorTile, floorTile,floorTile, floorTile},
             {floorTile, floorTile, floorTile,floorTile, floorTile,floorTile, floorTile, floorTile,floorTile, floorTile,floorTile, floorTile, floorTile, floorTile, floorTile,floorTile, floorTile, floorTile,floorTile, floorTile},
             {floorTile, floorTile, floorTile, floorTile, floorTile,floorTile, floorTile, floorTile,floorTile, floorTile,floorTile, floorTile, floorTile, floorTile, floorTile,floorTile, floorTile, floorTile,floorTile, floorTile},
             {floorTile, altar, floorTile,floorTile, altar, floorTile,floorTile, altar, floorTile,floorTile, altar, floorTile,floorTile, floorTile, floorTile, floorTile, floorTile,floorTile, floorTile, floorTile,floorTile, floorTile},
             {floorTile, floorTile, floorTile,floorTile, floorTile,floorTile, floorTile, floorTile,floorTile, floorTile,floorTile, floorTile, floorTile, floorTile, floorTile,floorTile, floorTile, floorTile,floorTile, floorTile},
             {floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile,floorTile, floorTile,floorTile, floorTile, floorTile, floorTile, floorTile,floorTile, floorTile, floorTile,floorTile, floorTile},
             {floorTile, altar, floorTile,floorTile, altar, floorTile,floorTile, altar, floorTile,floorTile, altar, floorTile,floorTile, floorTile, floorTile, floorTile, floorTile,floorTile, floorTile, floorTile,floorTile, floorTile},
             {floorTile, floorTile, floorTile,floorTile, floorTile,floorTile, floorTile, floorTile,floorTile, floorTile,floorTile, floorTile, floorTile, floorTile, floorTile,floorTile, floorTile, floorTile,floorTile, floorTile},
             {floorTile, floorTile, floorTile, floorTile, floorTile,floorTile, floorTile, floorTile,floorTile, floorTile,floorTile, floorTile, floorTile, floorTile, floorTile,floorTile, floorTile, floorTile,floorTile, floorTile},
             {floorTile, altar, floorTile,floorTile, altar, floorTile, floorTile, altar, floorTile,floorTile, altar, floorTile,floorTile, floorTile, floorTile, floorTile, floorTile,floorTile, floorTile, floorTile,floorTile, floorTile},
             {floorTile, floorTile, floorTile,floorTile, floorTile,floorTile, floorTile, floorTile,floorTile, floorTile,floorTile, floorTile, floorTile, floorTile, floorTile,floorTile, floorTile, floorTile,floorTile, floorTile},
             {floorTile, floorTile, floorTile, floorTile, floorTile,floorTile, floorTile, floorTile,floorTile, floorTile,floorTile, floorTile, floorTile, floorTile, floorTile,floorTile, floorTile, floorTile,floorTile, floorTile},
             {floorTile, altar, floorTile,floorTile, altar, floorTile, floorTile, altar, floorTile,floorTile, altar, floorTile,floorTile, floorTile, floorTile, floorTile, floorTile,floorTile, floorTile, floorTile,floorTile, floorTile},
             {floorTile, floorTile, floorTile,floorTile, floorTile,floorTile, floorTile, floorTile,floorTile, floorTile,floorTile, floorTile, floorTile, floorTile, floorTile,floorTile, floorTile, floorTile,floorTile, floorTile},
             {floorTile, floorTile, floorTile, floorTile, floorTile,floorTile, floorTile, floorTile,floorTile, floorTile,floorTile, floorTile, floorTile, floorTile, floorTile,floorTile, floorTile, floorTile,floorTile, floorTile},
             {floorTile, altar, floorTile,floorTile, altar, floorTile,floorTile, altar, floorTile,floorTile, altar, floorTile,floorTile, floorTile, floorTile, floorTile, floorTile,floorTile, floorTile, floorTile,floorTile, floorTile},
             {floorTile, floorTile, floorTile,floorTile, floorTile,floorTile, floorTile, floorTile,floorTile, floorTile,floorTile, floorTile, floorTile, floorTile, floorTile,floorTile, floorTile, floorTile,floorTile, floorTile},
             {floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile,floorTile, floorTile,floorTile, floorTile, floorTile, floorTile, floorTile,floorTile, floorTile, floorTile,floorTile, floorTile},
             {floorTile, altar, floorTile,floorTile, altar, floorTile,floorTile, altar, floorTile,floorTile, altar, floorTile,floorTile, floorTile, floorTile, floorTile, floorTile,floorTile, floorTile, floorTile,floorTile, floorTile},
             {floorTile, floorTile, floorTile,floorTile, floorTile,floorTile, floorTile, floorTile,floorTile, floorTile,floorTile, floorTile, floorTile, floorTile, floorTile,floorTile, floorTile, floorTile,floorTile, floorTile},

             }
w = 64   -- The player's width is 64
h = 64   -- The player's height is 64
hp = 100
  map = Map:new(template)
  cam = gamera.new(-100, -100, 2000, 2000)
end


function love.update(dt)
if cc(x,y-3,w,h, 0,0,64,64) == false then

    if love.keyboard.isDown('up')then
      y=y-3
      cam:setPosition(x, y)
  end
 end
if cc(x,y+3,w,h, 0,0,64,64) == false then
   if love.keyboard.isDown('down')then
    y=y+3
    cam:setPosition(x, y)
  end
end
if cc(x-3,y,w,h, 0,0,64,64) == false then
  if love.keyboard.isDown('left')then
    x=x-3
    cam:setPosition(x, y)
  end
end
if cc(x+3,y,w,h, 0,0,64,64) == false then
  if love.keyboard.isDown('right')then
    x=x+3
    cam:setPosition(x, y)
  end
end
if cc(A,B-5,w,h, 0,0,64,64) == false then
  if love.keyboard.isDown('w')then
    B=B-5
    cam:setPosition(A, B)
  end
end
if cc(A,B+5,w,h, 0,0,64,64) == false then
  if love.keyboard.isDown('s')then
    B=B+5
    cam:setPosition(A, B)
  end
end
if cc(A-5,B,w,h, 0,0,64,64) == false then
  if love.keyboard.isDown('a')then
    A=A-5
    cam:setPosition(A, B)
 end
end
if cc(A+5,B,w,h, 0,0,64,64) == false then
  if love.keyboard.isDown('d')then
    A=A+5
    cam:setPosition(A, B)
 end
end
  if cc(x+1, y, w, h,   0, 0, 64, 64) then
    -- if true, decrease HP:
    hp = hp - 1
  end
  if cc(x+1,y,w,h, 0,0,64,64) == false then

    if love.keyboard.isDown('up')then
      y=y-3
  end
 end
end

function love.draw()
  cam:draw(function(l, t, w, h)
  map:draw()
  love.graphics.print('Hello, world!', 0, 0)
  love.graphics.draw(playerImg, x, y)
  love.graphics.draw(img, A, B, 0, 2)
 end)
 love.graphics.rectangle('line', 0, 0, 64, 64)


love.graphics.print(hp, 0, 0)
end

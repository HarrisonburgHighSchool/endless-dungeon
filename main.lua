local Util = require 'core/util'
local Map = require 'core/map'
local gamera = require 'core/gamera'

function love.load()
  x = 400
  y = 300

 ex = 100
 ey = 100

 eimg = love.graphics.newImage('assets-1/player/base/octopode_2.png')
  fire = love.graphics.newImage('assets-1/dungeon/wall/hell_1.png')

playerImg = love.graphics.newImage('assets-1/player/base/kobold_male.png')
wall =love.graphics.newImage('assets-1/dungeon/wall/catacombs_0.png')
  floorTile = love.graphics.newImage('assets-1/dungeon/floor/black_cobalt_7.png')
  altar     = love.graphics.newImage('assets-1/dungeon/floor/bog_green_2.png')
template = {

             {floorTile, floorTile, floorTile, floorTile, floorTile,floorTile,floorTile,floorTile,floorTile,floorTile},
             {floorTile, altar, floorTile,floorTile, altar, floorTile, floorTile,floorTile,floorTile,floorTile},
             {floorTile, floorTile, floorTile, floorTile, floorTile,floorTile,floorTile,floorTile,floorTile,floorTile},
             {floorTile, altar, floorTile,floorTile, altar, floorTile, floorTile,floorTile,floorTile,floorTile},
             {floorTile, floorTile, floorTile, floorTile, floorTile,floorTile,floorTile,floorTile,floorTile,floorTile},
             {floorTile, altar, floorTile,floorTile, altar, floorTile, floorTile,floorTile,floorTile,floorTile},
             {floorTile, floorTile, floorTile, floorTile, floorTile,floorTile,floorTile,floorTile,floorTile,floorTile},
             {floorTile, altar, floorTile,floorTile, altar, floorTile, floorTile,floorTile,floorTile,floorTile},
             {floorTile, floorTile, floorTile, floorTile, floorTile,floorTile,floorTile,floorTile,floorTile,floorTile},
             {floorTile, altar, floorTile,floorTile, altar, floorTile, floorTile,floorTile,floorTile,floorTile},
             {floorTile, floorTile, floorTile, floorTile, floorTile,floorTile,floorTile,floorTile,floorTile,floorTile},
             {floorTile, altar, floorTile,floorTile, altar, floorTile, floorTile,floorTile,floorTile,floorTile},
             {floorTile, floorTile, floorTile, floorTile, floorTile,floorTile,floorTile,floorTile,floorTile,floorTile},
           }
wall={
             {wall,wall,wall,wall,wall,wall,wall,wall,wall,wall},
             {wall,'nil','nil',wall},
             {wall,'nil','nil',wall},
             {wall,'nil','nil',wall},
             {wall,'nil','nil',wall},
             {wall,'nil','nil',wall},
             {wall,'nil','nil',wall},
             {wall,'nil','nil',wall},
             {wall,'nil','nil',wall},
             {wall},
             {wall},
             {wall,wall,wall,wall,wall,wall,wall,wall,wall,wall},

            }

firemap  = {
  {fire, fire, fire, fire, fire},
  {fire, fire, fire, fire, fire},

}

w = 64   -- The player's width is 64
h = 64   -- The player's height is 64
hp = 100
  collision = Map:new(wall)
  map = Map:new(template)
  cam = gamera.new(-100, -100, 2000, 2000)
  firemap = Map:new(firemap)
  firemap:move(704, 64)
end


function love.update(dt)
if collision:cc(x,y-3,w,h, 0,0,64,64) == false then
  if love.keyboard.isDown('up')then
      y=y-3
      cam:setPosition(x, y)
  end
 end
if collision:cc(x,y+3,w,h, 0,0,64,64) == false then
   if love.keyboard.isDown('down')then
    y=y+3
    cam:setPosition(x, y)
  end
end
if collision:cc(x-3,y,w,h, 0,0,64,64) == false then
  if love.keyboard.isDown('left')then
    x=x-3
    cam:setPosition(x, y)
  end
end
 if collision:cc(x+3,y,w,h, 0,0,64,64) == false then
 if love.keyboard.isDown('right')then
    x=x+3
    cam:setPosition(x, y)

  end
 end

  if ex < x then
   ex = ex + 2
  end
  if ex > x then
 ex = ex - 2
  end
  if ey > y then
 ey = ey - 2
  end
  if ey < y then
 ey = ey + 2
  end
end

function love.draw()

cam:draw(function(l, t, w, h)
  map:draw()
  collision:draw()
  love.graphics.draw(eimg, ex, ey)
  love.graphics.print('Hello, world!', 0, 0)
  love.graphics.draw(playerImg, x, y)

  --love.graphics.draw(firesheet, fireslice, 400, 300)
  firemap:draw()
 end)
 love.graphics.rectangle('line', 0, 0, 64, 64)


love.graphics.print(hp, 0, 0)
end

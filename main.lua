<<<<<<< HEAD
local Map = require 'core/map'
local gamera = require 'core/gamera'

=======
love.graphics.setDefaultFilter('nearest', 'nearest')
>>>>>>> upstream/master
function love.load()
  x = 400
  y = 300
  A = 400
  B = 300
  playerImg = love.graphics.newImage('assets-1/player/base/octopode_1.png')
  img = love.graphics.newImage('assets-1/item/book/plaid.png')
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
  map = Map:new(template)
  cam = gamera.new(-100, -100, 2000, 2000)
end


function love.update(dt)



  if love.keyboard.isDown('up')then
    y=y-3
    cam:setPosition(x, y)
  end
  if love.keyboard.isDown('down')then
    y=y+3
    cam:setPosition(x, y)
  end
  if love.keyboard.isDown('left')then
    x=x-3
    cam:setPosition(x, y)
  end
  if love.keyboard.isDown('right')then
    x=x+3
    cam:setPosition(x, y)
  end
  if love.keyboard.isDown('w')then
    B=B-5
    cam:setPosition(A, B)
  end
  if love.keyboard.isDown('s')then
    B=B+5
    cam:setPosition(A, B)
  end
  if love.keyboard.isDown('a')then
    A=A-5
    cam:setPosition(A, B)
  end
  if love.keyboard.isDown('d')then
    A=A+5
    cam:setPosition(A, B)
  end
end

function love.draw()
  cam:draw(function(l, t, w, h)
  map:draw()
  love.graphics.print('Hello, world!', 0, 0)
  love.graphics.draw(playerImg, x, y)
  love.graphics.draw(img, A, B, 0, 2)
 end)
end

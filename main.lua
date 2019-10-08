local Map = require 'core/map'
local gamera = require 'core/gamera'
function love.load()
  x = 400
  y = 300
  a = 400
  b = 300
  playerImg = love.graphics.newImage('assets-1/player/base/octopode_1.png')
  playerImg1 = love.graphics.newImage('assets-1/player/base/gargoyle_female.png')

    floorTile = love.graphics.newImage('assets-1/dungeon/floor/black_cobalt_1.png')
    altar     = love.graphics.newImage('assets-1/dungeon/floor/cage_5.png')
    ground    = love.graphics.newImage('assets-1/dungeon/floor/cobble_blood_12.png')
    template = {
                  {floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, flooorTile, floorTile, floorTile, floorTile, floorTile},
                  {floorTile, altar, altar, altar, altar, altar, altar, altar, altar, floorTile},
                  {floorTile, altar, ground, ground, ground, ground, ground, ground, altar, floorTile, floorTile},
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
                  {floorTile, altar, floorTile, floorTile, altar, floorTile},
                  {floorTile, altar, floorTile, floorTile, altar, floorTile},
                  {floorTile, altar, floorTile, floorTile, floorTile, floorTile},
                  {floorTile, altar, floorTile, floorTile, floorTile, floorTile},
                  {floorTile, altar, floorTile, floorTile, floorTile},
                  {floorTile, altar, floorTile, floorTile, floorTile},
                  {floorTile, altar, floorTile, floorTile, floorTile},

                }
    map = Map:new(template)
    cam = gamera.new(0, 0, 2000, 2000)


end

function love.update(dt)
  player2()
  if love.keyboard.isDown('up')then
   y = y - 10
   cam:setPosition(x, y)
  end
  if love.keyboard.isDown('down')then
   y = y + 10
   cam:setPosition(x, y)
  end
  if love.keyboard.isDown('right')then
   x = x + 10
   cam:setPosition(x, y)
  end
  if love.keyboard.isDown('left')then
   x = x - 10
   cam:setPosition(x, y)
  end


function player2()
  if love.keyboard.isDown('w')then
   b = b - 10
   cam:setPosition(a, b)
  end
  if love.keyboard.isDown('s')then
   b = b + 10
   cam:setPosition(a, b)
  end
  if love.keyboard.isDown('d')then
   a = a + 10
   cam:setPosition(a, b)
  end
  if love.keyboard.isDown('a')then
   a = a - 10
   cam:setPosition(a, b)
  end
end
function love.draw()
   map:draw()
  cam:draw(function(l, t, w, h)
  love.graphics.print('Hello, world!', 0, 0)
  love.graphics.draw(playerImg, x, y)
  love.graphics.draw(playerImg1, a, b)
end)
end

local Map = require 'core/map'
local Util = require 'core/util'
local gamera = require 'core/gamera'

function love.load()
  cam = gamera.new(0, 0, 2000, 2000)
  x = 400
  y = 300
  l = 0
  t = 0
  w = 1000
  h = 1000
  hp = 100
  x = 400
  y = 300
time = 6000 -- store a big numer in time

  img = love.graphics.newImage('assets-1/player/base/octopode_1.png')
ex = 100
ey = 100
elimg = love.graphics.newImage('assets-1/player/base/octopode_2.png')

  playerImg = love.graphics.newImage('assets-1/player/transform/dragon_form.png')
  --playerImg = love.graphics.newImage('assets-1/player/base/octopode_1.png')
floorTile = love.graphics.newImage('assets-1/dungeon/floor/white_marble_1.png')
background = {
  {floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile},
  {floorTile, floorTile, floorTile, floorTile,floorTile, floorTile, floorTile, floorTile, floorTile},
  {floorTile, floorTile, floorTile, floorTile,floorTile, floorTile, floorTile, floorTile, floorTile},
  {floorTile, floorTile, floorTile, floorTile, floorTile, floorTile,floorTile, floorTile, floorTile},
  {floorTile, floorTile, floorTile, floorTile, floorTile, floorTile,floorTile, floorTile, floorTile},
  {floorTile, floorTile, floorTile, floorTile, floorTile, floorTile,floorTile, floorTile, floorTile},
  {floorTile, floorTile, floorTile, floorTile, floorTile, floorTile,floorTile, floorTile, floorTile},
  {floorTile, floorTile, floorTile, floorTile, floorTile, floorTile,floorTile, floorTile, floorTile},
  {floorTile, floorTile, floorTile, floorTile, floorTile, floorTile,floorTile, floorTile, floorTile},
  {floorTile, floorTile, floorTile, floorTile, floorTile, floorTile,floorTile, floorTile, floorTile},
  {floorTile, floorTile, floorTile, floorTile, floorTile, floorTile,floorTile, floorTile, floorTile},
}
wall  = love.graphics.newImage('assets-1/dungeon/wall/snake_6.png')
collision = {
  {wall, wall, wall, wall, wall, wall, wall, wall, wall, wall},
  {wall, wall, wall, wall, wall, wall, wall, wall, wall, wall, 'nil'},
  {wall, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil','nil', 'nil', wall, wall},
  {wall, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', wall, wall},
  {wall, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', wall, wall, wall, wall, wall, wall},
  {wall, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', wall, wall, wall, wall},
  {wall, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', wall, wall, wall, wall},
  {wall, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', wall, wall, wall, wall},
  {wall, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', wall, wall, wall, wall},
  {wall, wall, wall, wall, wall, wall,'nil', 'nil', 'nil', 'nil', 'nil', wall, wall, wall, wall, wall},
  {wall, wall, wall, wall, wall, wall,'nil', 'nil', 'nil', 'nil', 'nil', wall, wall, wall},
  {wall, wall, wall, wall, wall, wall,'nil', 'nil', 'nil', 'nil', 'nil', wall, wall, wall},
  {wall, wall, wall, wall, wall, wall,'nil', 'nil', 'nil', 'nil', 'nil', wall, wall, wall},
  {wall, wall, wall, wall, wall, wall,'nil', 'nil', 'nil', 'nil', 'nil', wall, wall, wall},
  {wall, wall, wall, wall, wall, wall,'nil', 'nil', 'nil', 'nil', 'nil', wall, wall, wall},
  {wall, wall, wall, wall, wall, wall,'nil', 'nil', 'nil', 'nil', 'nil', wall, wall, wall},
  {wall, wall, wall, wall, wall, wall,'nil', 'nil', 'nil', 'nil', 'nil', wall, wall, wall, wall, wall},
  {wall, wall, wall, wall, wall, wall,'nil', 'nil', 'nil', 'nil', 'nil', wall, wall, wall, wall, wall},
  {wall, wall, wall, wall, 'nil', 'nil','nil', 'nil', 'nil', 'nil', 'nil', wall, wall, wall, wall, wall},
  {wall, wall, wall, wall, 'nil', 'nil','nil', 'nil', 'nil', 'nil', 'nil', wall, wall, wall, wall, wall},
}
wall2  = love.graphics.newImage('assets-1/dungeon/wall/cobalt_stone_2.png')
template = {--a 3 x 3 map with the altar texture in the middle
{wall2, wall2, wall2, wall2, wall2, wall2, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile},
           {wall, floorTile, floorTile, floorTile, wall, wall, wall, floorTile, floorTile, floorTile, floorTile},
               {wall, floorTile, floorTile, floorTile, wall, wall, wall, floorTile, floorTile, floorTile, floorTile},
               {wall, floorTile, floorTile, wall, wall, wall2, floorTile, floorTile, floorTile, floorTile},
               {wall, floorTile, floorTile, wall, wall, wall, floorTile, floorTile, floorTile, floorTile},
               {wall, floorTile, floorTile, wall, wall, wall, floorTile, floorTile, floorTile, floorTile},
               {wall, floorTile, floorTile, wall, wall, wall, floorTile, floorTile, floorTile, floorTile},
               {wall, wall, wall, floorTile, wall, wall, wall, floorTile, floorTile, floorTile, floorTile},
              {wall, floorTile, floorTile, wall, wall, wall, floorTile, floorTile, floorTile, floorTile},
              {wall, floorTile, floorTile, wall, wall, wall, floorTile, floorTile, floorTile, floorTile},
               {wall, floorTile, floorTile, wall, wall, wall, floorTile, floorTile, floorTile, floorTile},
              {wall, floorTile, floorTile, wall, wall, wall, floorTile, floorTile, floorTile, floorTile},
              {wall, floorTile, floorTile, wall, wall, wall, wall, floorTile, floorTile, floorTile},
              {wall, floorTile, floorTile, wall, wall, wall, wall, floorTile, floorTile, floorTile},
              {wall, floorTile, floorTile, wall, wall, wall, wall, floorTile, floorTile, floorTile},

    }
  floorm = Map:new(template)
  background = Map:new(background)
  collision = Map:new(collision)
end




function love.update(dt)
  if love.keyboard.isDown('right') then
    if collision:cc(x + 10, y, 64, 64) == false then
      x = x + 10
    end
end
  if love.keyboard.isDown('down') then
    if collision:cc(x, y + 10, 64, 64) == false then
    y = y + 10
  end
end
  if love.keyboard.isDown('up') then
    if collision:cc(x, y - 10, 64, 64) == false then
    y = y - 10
  end


end
  if love.keyboard.isDown('left') then
      if collision:cc(x - 10, y, 64, 64) == false then
    x = x - 10
  end
end
cam:setPosition(x, y)

time = time - 1
if time < 0 then
  love.load()
end
  -- Nothing to update yet
end




function love.draw()
 cam:draw(function(l, t, w, h)
  --floorm:draw()
  background:draw()
  collision:draw()
  love.graphics.print('Hello, world!', 0, 0)
  love.graphics.draw(playerImg, x, y)
  love.graphics.rectangle('line' ,50, 50, 64, 64)
  if x > 600 and y > 600 then
    love.exitModule();
end
 end)
end

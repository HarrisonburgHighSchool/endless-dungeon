
  local Map = require 'core/map'
  local Util = require 'core/util'
  local gamera = require 'core/gamera'
love.graphics.setDefaultFilter( 'nearest', 'nearest')
function love.load()
cam = gamera.new(0, 0, 2000, 2000)

  -- Create the player variables
  img4 = love.graphics.newImage('assets-1/misc/numbers/minus_3.png')
  img2 = love.graphics.newImage('assets-1/item/book/light_brown.png')
  img = love.graphics.newImage('assets-1/monster/draconic/draconic_base-red.png')
  img1 =love.graphics.newImage('assets-1/monster/animals/emperor_scorpion.png')
  img3 =love.graphics.newImage('assets-1/monster/animals/emperor_scorpion.png')
  x = 100
  y = 100
  x5 = 100
  y5 = 100
  x6 = 75
  y6 = 100
  ex = 150
  ey = 350
  ex1 = 150
  ey1 = 50
  x2 = 75
  y2 = 100
  x3 = 350
  y3 = 400
  w = 30
  h = 30
hp = 100
min1= -1
  -- Create the background map
  floor = love.graphics.newImage('assets-1/dungeon/floor/dirt_full.png')
  background = {
    {floor, floor, floor, floor, floor, floor, floor, floor, floor},
    {floor, floor, floor, floor, floor, floor, floor, floor, floor},
    {floor, floor, floor, floor, floor, floor, floor, floor, floor},
    {floor, floor, floor, floor, floor, floor, floor, floor, floor},
    {floor, floor, floor, floor, floor, floor, floor, floor, floor},
    {floor, floor, floor, floor, floor, floor, floor, floor, floor},
    {floor, floor, floor, floor, floor, floor, floor, floor, floor},
    {floor, floor, floor, floor, floor, floor, floor, floor, floor},
    {floor, floor, floor, floor, floor, floor, floor, floor, floor},
    {floor, floor, floor, floor, floor, floor, floor, floor, floor},
    {floor, floor, floor, floor, floor, floor, floor, floor, floor},
    {floor, floor, floor, floor, floor, floor, floor, floor, floor},
    {floor, floor, floor, floor, floor, floor, floor, floor, floor},
  }

  wall = love.graphics.newImage('assets-1/dungeon/wall/lab-rock_2.png')
  walls = {
    {wall, wall, wall, wall, wall, wall, wall, wall, wall},
    {wall, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', wall},
    {wall, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', wall},
    {wall, 'nil', 'nil', 'nil', 'nil', wall, 'nil', wall, wall},
    {wall, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', wall},
    {wall, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', wall},
    {wall, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', wall},
    {wall, 'nil', 'nil', 'nil', 'nil', 'nil', wall, wall, wall},
    {wall, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', wall},
    {wall, 'nil', 'nil', 'nil', 'nil', 'nil', wall, 'nil', wall},
    {wall, 'nil', 'nil', 'nil', 'nil', 'nil', wall, wall, wall},
    {wall, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', wall},
{wall, wall, wall, wall, wall, wall, wall, wall, wall},


  }
map = Map:new(background)
  background = Map:new(background)
  collide = Map:new(walls)
end

  function love.update(dt)
  cam:setPosition(x, y)
    if love.keyboard.isDown('up') then
      if collide:cc(x, y - 1, 60, 20) == false then
        y = y - 2
      end
    end
    if love.keyboard.isDown('down') then
      if collide:cc(x, y + 1, 60, 20) == false then
        y = y + 2
      end
    end
    if love.keyboard.isDown('right') then
      if collide:cc(x + 1, y, 15, 50) == false then
        x = x + 2
      end
    end
    if love.keyboard.isDown('left') then
      if collide:cc(x - 1, y , 45, 50) == false then
        x = x - 2
      end
    end
  if x > 2400 then
    x = 2400
  end
if love.keyboard.isDown('right') then
x = x + 2
end
if love.keyboard.isDown('left') then
x = x - 2
end
if love.keyboard.isDown('down') then
y = y + 2
end
if love.keyboard.isDown('up') then
y = y - 2
end
if love.keyboard.isDown('right') then
x2 = x2 + 4
end
if love.keyboard.isDown('left') then
x2 = x2 - 4
end
if love.keyboard.isDown('down') then
y2 = y2 + 4
end
if love.keyboard.isDown('up') then
y2 = y2 - 4
end
if cc(x, y, w, h,   ex, ey, 30, 30 ) then
  hp = hp - 1
end
if cc(x, y, w, h,   ex1, ey1, 30, 30 ) then
  hp = hp - 1
end
if hp==0 then
x = 1000000000
y = 1000000000
end
if hp==0 then
x2 = 1000
y2 = 500
end

if ex < 450 then
  direction = 'right'
end
if ex > 700 then
  direction = 'left'
end

if direction == 'right' then
  ex = ex + 3
end
if direction == 'left' then
  ex = ex - 3
end
if ey1 < 2 then
  direction = 'right'
end
if ey1 >500 then
  direction = 'left'
end

if direction == 'right' then
  ey1 = ey1 + 3
end
if direction == 'left' then
  ey1 = ey1 - 3
end
if hp == 0 then
x = x5
y = y5
end
if hp == 0 then
x2 = x6
y2 = y6
end
if hp == 0 then
hp = 100
end
if cc(x, y, w, h,   x3, y3, 36, 36 ) then
  love.exitModule()
end
end




function love.draw()

cam:draw(function(l, t, w, h)
  map:draw()
  background:draw()
  collide:draw()
    love.graphics.print(hp, x2, y2)
  if hp==0 then
  love.graphics.print('GAME OVER', x3, y3)
  end
  love.graphics.print('Hello, world!', 0, 0)
  --Draw everything here. For example:
  love.graphics.draw(img, x, y)
  love.graphics.draw(img1, ex, ey)
  love.graphics.draw(img2, x3, y3)
  love.graphics.draw(img3, ex1, ey1)
  if cc(x, y, w, h,   ex1, ey1, 30, 30 ) == true then
  love.graphics.draw(img4, ex1, ey1)
    end
end)
end

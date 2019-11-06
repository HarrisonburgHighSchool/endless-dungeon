love.graphics.setDefaultFilter('nearest', 'nearest')
local Map = require 'core/map'
local gamera = require 'core/gamera'
function love.load()
  cam = gamera.new(0, 0, 2000, 2000)
  l = 0
  t = 0
  w = 1000
  h = 1000
  hp = 1000
  enemyhp = 100
  eenemyhp = 100
  x = 400
  y = 300
  img = love.graphics.newImage('assets-1/player/base/naga_red_female.png')
  ex = 140
  ey = 100
  eimg = love.graphics.newImage('assets-1/player/base/octopode_2.png')
  xx = 700
  yy = 200
  eeimg = love.graphics.newImage('assets-1/player/base/gargoyle_male.png')
  tile = love.graphics.newImage('assets-1/dungeon/floor/etched_1.png')
  floor = love.graphics.newImage('assets-1/dungeon/wall/crystal_wall_blue.png')
  wall = love.graphics.newImage('assets-1/dungeon/wall/bars_red_1.png')
  wall2 = love.graphics.newImage('assets-1/dungeon/wall/catacombs_1.png')
  wall3 = love.graphics.newImage('assets-1/dungeon/wall/bars_red_6.png')
  wall4 = love.graphics.newImage('assets-1/dungeon/wall/bars_red_8.png')
  tile4 = love.graphics.newImage('assets-1/dungeon/floor/acidic_floor_0.png')
  tile5 = love.graphics.newImage('assets-1/dungeon/floor/acidic_floor_1.png')
  tile6 = love.graphics.newImage('assets-1/dungeon/floor/acidic_floor_2.png')
  tile7 = love.graphics.newImage('assets-1/dungeon/floor/acidic_floor_3.png')
  tile8 = love.graphics.newImage('assets-1/dungeon/doors/gate_runed_left.png')
  tile9 = love.graphics.newImage('assets-1/dungeon/doors/gate_runed_middle.png')
  tile10 = love.graphics.newImage('assets-1/dungeon/doors/gate_runed_right.png')
  door = love.graphics.newImage('assets-1/dungeon/doors/vgate_open_up.png')


  background = {
    {tile4, tile5, wall2, floor, floor, floor, wall2, tile5, tile6, tile7, tile5, tile6, tile7, tile5, tile4, tile7, tile5, tile6, tile7, tile4, tile5, tile6, tile7, tile4, tile5},
    {tile7, wall2, wall2, floor, floor, floor, wall2, wall2, wall2, tile6, tile5, tile6, tile7, tile5, tile4, tile7, tile5, tile6, tile7, floor, floor, floor, floor, floor, floor},
    {tile6, wall2, floor, floor, floor, floor, floor, floor, wall2, tile5, tile5, tile6, tile7, tile5, tile4, tile7, tile5, tile6, tile7, floor, floor, floor, floor, floor, floor},
    {tile5, wall2, floor, floor, floor, floor, floor, floor, wall2, tile4, tile5, tile6, tile7, tile5, tile4, tile7, tile5, tile6, tile7, floor, floor, tile6, tile7, floor, floor},
    {wall2, wall2, floor, floor, floor, floor, floor, floor, wall2, wall2, tile5, tile6, tile7, tile5, tile4, tile7, tile5, tile6, tile7, floor, floor, tile6, tile7, floor, floor},
    {floor, floor, floor, floor, floor, floor, floor, floor, floor, wall3, floor, floor, floor, floor, floor, floor, tile7, tile5, tile6, floor, floor, tile5, tile6, floor, floor},
    {floor, floor, floor, floor, floor, floor, floor, floor, floor, floor, floor, floor, floor, floor, floor, floor, tile7, tile5, tile6, floor, floor, tile5, tile6, floor, floor},
    {floor, floor, floor, floor, floor, floor, floor, floor, floor, floor, floor, floor, floor, floor, floor, floor, tile7, tile5, tile6, floor, floor, tile5, tile6, floor, floor},
    {wall2, wall2, floor, floor, floor, floor, floor, floor, wall2, wall2, wall2, wall2, wall2, tile5, floor, floor, tile5, tile6, tile7, floor, floor, tile6, tile7, floor, floor},
    {tile6, wall2, floor, floor, floor, floor, floor, floor, wall2, tile4, tile5, tile6, tile7, tile5, floor, floor, tile5, tile6, tile7, floor, floor, tile6, tile7, floor, floor},
    {tile7, wall2, floor, floor, floor, floor, floor, floor, wall2, tile5, tile5, tile6, tile7, tile5, floor, floor, floor, floor, floor, floor, floor, tile6, tile7, floor, floor},
    {tile4, wall2, wall2, floor, floor, floor, wall2, wall2, wall2, tile6, tile5, tile6, tile7, tile5, floor, floor, floor, floor, floor, floor, floor, tile6, tile7, floor, floor},
    {tile5, tile6, wall2, wall, floor, wall, wall2, tile5, tile6, tile7, tile4, tile5, tile6, tile7, tile4, tile5, tile6, tile7, tile4, tile5, tile6, tile7, tile4, floor, floor},
    {tile5, tile6, wall2, wall2, floor, wall2, wall2, tile4, tile5, tile6, tile7, tile4, tile5, tile6, tile7, tile4, tile5, tile6, tile7, tile4, tile5, tile6, tile7, floor, floor},
    {tile5, tile6, tile7, wall2, floor, wall2, tile7, tile4, tile5, tile6, tile7, tile4, tile5, tile6, tile7, tile4, tile5, tile6, tile7, tile4, tile5, tile6, tile8, tile9, tile9},
    {tile5, tile6, tile7, wall2, floor, wall2, tile7, tile4, tile5, tile6, tile7, tile4, tile5, tile6, tile7, tile4, tile5, tile6, tile7, tile4, tile5, tile6, tile9, tile9, tile9},
    {tile5, tile6, tile7, wall2, floor, wall2, tile7, tile4, tile5, tile6, tile7, tile4, tile5, tile6, tile7, tile4, tile5, tile6, tile7, tile4, tile5, tile6, tile10, tile9, tile9}
  }

  poison = {
    {tile4, tile5, 'nil', 'nil', 'nil', 'nil', 'nil', tile5, tile6, tile7, tile5, tile6, tile7, tile5, tile4, tile7, tile5, tile6, tile7, tile4, tile5, tile6, tile7, tile4, tile5},
    {tile7, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', tile6, tile5, tile6, tile7, tile5, tile4, tile7, tile5, tile6, tile7, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil'},
    {tile6, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', tile5, tile5, tile6, tile7, tile5, tile4, tile7, tile5, tile6, tile7, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil'},
    {tile5, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', tile4, tile5, tile6, tile7, tile5, tile4, tile7, tile5, tile6, tile7, 'nil', 'nil', tile6, tile7, 'nil', 'nil'},
    {'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', tile5, tile6, tile7, tile5, tile4, tile7, tile5, tile6, tile7, 'nil', 'nil', tile6, tile7, 'nil', 'nil'},
    {'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', tile7, tile5, tile6, 'nil', 'nil', tile5, tile6, 'nil', 'nil'},
    {'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', tile7, tile5, tile6, 'nil', 'nil', tile5, tile6, 'nil', 'nil'},
    {'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', tile7, tile5, tile6, 'nil', 'nil', tile5, tile6, 'nil', 'nil'},
    {'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', tile5, 'nil', 'nil', tile5, tile6, tile7, 'nil', 'nil', tile6, tile7, 'nil', 'nil'},
    {tile6, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', tile4, tile5, tile6, tile7, tile5, 'nil', 'nil', tile5, tile6, tile7, 'nil', 'nil', tile6, tile7, 'nil', 'nil'},
    {tile7, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', tile5, tile5, tile6, tile7, tile5, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', tile6, tile7, 'nil', 'nil'},
    {tile4, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', tile6, tile5, tile6, tile7, tile5, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', tile6, tile7, 'nil', 'nil'},
    {tile5, tile6, 'nil', 'nil', 'nil', 'nil', 'nil', tile5, tile6, tile7, tile4, tile5, tile6, tile7, tile4, tile5, tile6, tile7, tile4, tile5, tile6, tile7, tile4, 'nil', 'nil'},
    {tile5, tile6, wall2, wall2, 'nil', wall2, wall2, tile4, tile5, tile6, tile7, tile4, tile5, tile6, tile7, tile4, tile5, tile6, tile7, tile4, tile5, tile6, tile7, 'nil', 'nil'},
    {tile5, tile6, tile7, wall2, 'nil', wall2, tile7, tile4, tile5, tile6, tile7, tile4, tile5, tile6, tile7, tile4, tile5, tile6, tile7, tile4, tile5, tile6, 'nil', 'nil', 'nil'},
    {tile5, tile6, tile7, wall2, 'nil', wall2, tile7, tile4, tile5, tile6, tile7, tile4, tile5, tile6, tile7, tile4, tile5, tile6, tile7, tile4, tile5, tile6, 'nil', 'nil', 'nil'},
    {tile5, tile6, tile7, wall2, 'nil', wall2, tile7, tile4, tile5, tile6, tile7, tile4, tile5, tile6, tile7, tile4, tile5, tile6, tile7, tile4, tile5, tile6, 'nil', 'nil', 'nil'},
    {tile5, tile6, tile7, wall2, door, wall2, tile7, tile4, tile5, tile6}
  }


  collision = {
    {wall2, 'nil', wall2, 'nil', 'nil', 'nil', wall2, 'nil', 'nil', 'nil'},
    {'nil', wall2, wall2, 'nil', 'nil', 'nil', wall2, wall2, wall2, 'nil'},
    {'nil', wall2, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', wall2, 'nil'},
    {'nil', wall2, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', wall2, 'nil'},
    {wall2, wall2, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', wall2, wall2},
    {'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', wall, 'nil', 'nil', 'nil', 'nil'},
    {'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil'},
    {'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil'},
    {wall2, wall2, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', wall2, wall2, wall2, wall2, wall2},
    {'nil', wall2, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', wall2, 'nil'},
    {'nil', wall2, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', wall2, 'nil'},
    {'nil', wall2, wall2, 'nil', 'nil', 'nil', wall2, wall2, wall2, 'nil'},
    {'nil', 'nil', wall2, 'nil', 'nil', wall, wall2, 'nil', 'nil', 'nil'},
    {'nil', 'nil', wall2, 'nil', 'nil', wall2, 'nil', 'nil', 'nil', 'nil'},
    {'nil', 'nil', wall2, 'nil', 'nil', wall2, 'nil', 'nil', 'nil', 'nil'},
    {'nil', 'nil', wall2, 'nil', 'nil', wall2, 'nil', 'nil', 'nil', 'nil'},
    {'nil', 'nil', wall2, 'nil', 'nil', wall2, 'nil', 'nil', 'nil', 'nil'},
    {'nil', 'nil', wall2, door, 'nil', wall2, 'nil', 'nil', 'nil', 'nil'}

  }



      background = Map:new(background)
      collision = Map:new(collision)
      poison = Map:new(poison)

end





function love.update(dt)
  if love.keyboard.isDown('up') then
    if collision:cc(x, y - 7, 64, 64) == false then
      y = y - 7
    end
  end
  if love.keyboard.isDown('down') then
    if collision:cc(x, y + 7, 64, 64) == false then
      y = y + 7
    end
  end
  if love.keyboard.isDown('right') then
    if collision:cc(x + 7, y, 64, 64) == false then
      x = x + 7
    end
  end
  if love.keyboard.isDown('left') then
    if collision:cc(x - 7, y, 64, 64) == false then
      x = x - 7
    end
  end

if dir == 'left' then
  ex = ex - 1
end
if dir == 'right' then
  ey = ey + 1
end
if ex < 10 then
  ex = ex + 2
end
if ex > 200 then
  ex = ex - 2
end
if edir == 'left' then
  xx = xx - 1
end
if edir == 'right' then
  yy = yy + 1
end
if xx < 30 then
  xx = xx + 2
end
if xx > 700 then
  xx = xx - 2
end


  if cc(x, y, w, h, ex, ey, 5, 5) then
    hp = hp - .5
  end
  if cc(x, y, w, h, xx, yy, 5, 5) then
    hp = hp - .5
  end



  if hp == 0 then
    love.exitModule()
  end



  cam:setPosition(x, y)

  if x > xx then
    xx = xx + 2
  end
  if x < xx then
    xx = xx - 2
  end
  if y > yy then
    yy = yy + 2
  end
  if y < yy then
    yy = yy - 2
  end
  if x > ex then
    ex = ex + 2
  end
  if x < ex then
    ex = ex - 2
  end
  if y > ey then
    ey = ey + 2
  end
  if y < ey then
    ey = ey - 2
  end
end

function love.keypressed(key)
  if key == 'z' then
    enemyhp = enemyhp - 1
  end
end
function love.keypressed(key)
  if key == 'x' then
    eenemyhp = eenemyhp - 1
  end
end


function love.draw()
  cam:draw(function(l, t, w, h)
  collision:draw()
  background:draw()
  poison:draw()
  love.graphics.print(enemyhp, xx, yy+ -18)
  love.graphics.print(eenemyhp, ex, ey+ -18)
  love.graphics.print(hp, x, y+ -18)
  love.graphics.draw(img, x, y)
  love.graphics.draw(eimg, ex, ey)
  love.graphics.draw(eeimg, xx, yy)
end)
end

function love.keypressed(key)
  if key == 'escape' then
    love.exitModule()
  end
end

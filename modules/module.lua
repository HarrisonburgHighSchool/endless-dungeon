love.graphics.setDefaultFilter('nearest', 'nearest')
local Map = require 'core/map'
localUtil = require 'core/util'
function love.load()



local Entity = require 'core/entity'

function love.load()
  img = love.graphics.newImage('player.png')
  player = Entity:new(img, 200, 200)
end

function love.update(dt)
end

function love.draw()
  player:draw()
end

function love.load()
  x = 400
  y = 300
  playerImg = love.graphics.newImage('assets-1/player/base/naga_red_female.png')
  ex = 100
  ey = 100
  enemyImg = love.graphics.newImage('assets-1/player/base/lorc_female_6.png')
  w = 64
  h = 64
  hp = 100
end



function love.update(dt)
  if x > ex then
    ex = ex + 3
  end
  if y > ey then
    ey = ey + 3
  end
  if ex > x then
    ex = ex - 3
  end
  if ey > y then
    ey = ey - 3
  end
end



function love.load()

  tile = love.graphics.newImage('assets-1/dungeon/floor/etched_1.png')
  floor = love.graphics.newImage('assets-1/dungeon/wall/crystal_wall_blue.png')
  wall = love.graphics.newImage('assets-1/dungeon/wall/bars_red_1.png')
  wall2 = love.graphics.newImage('assets-1/dungeon/wall/catacombs_1.png')
  tile4 = love.graphics.newImage('assets-1/dungeon/floor/acidic_floor_0.png')
  tile5 = love.graphics.newImage('assets-1/dungeon/floor/acidic_floor_1.png')
  tile6 = love.graphics.newImage('assets-1/dungeon/floor/acidic_floor_2.png')
  tile7 = love.graphics.newImage('assets-1/dungeon/floor/acidic_floor_3.png')

  background = {
    {tile4, tile5, tile6, floor, floor, floor, tile4, tile5, tile6, tile7},
    {tile7, tile4, tile5, floor, floor, floor, tile7, tile4, tile5, tile6},
    {tile6, tile7, tile4, floor, floor, floor, tile6, tile7, tile4, tile5},
    {tile5, tile6, tile7, floor, floor, floor, tile5, tile6, tile7, tile4},
    {tile4, tile5, tile6, floor, floor, floor, tile4, tile5, tile6, tile7},
    {floor, floor, floor, floor, floor, floor, floor, floor, floor, floor},
    {floor, floor, floor, floor, floor, floor, floor, floor, floor, floor},
    {floor, floor, floor, floor, floor, floor, floor, floor, floor, floor},
    {tile5, tile6, tile7, floor, floor, floor, tile4, tile5, tile6, tile7},
    {tile6, tile7, tile4, floor, floor, floor, tile5, tile6, tile7, tile4},
    {tile7, tile4, tile5, floor, floor, floor, tile6, tile7, tile4, tile5},
    {tile4, tile5, tile6, floor, floor, floor, tile7, tile4, tile5, tile6},
    {tile5, tile6, tile7, floor, floor, floor, tile4, tile5, tile6, tile7}
  }

  collision= {
      {'nil', 'nil', wall2, 'nil', 'nil', 'nil', wall2, 'nil', 'nil', 'nil'},
      {'nil', 'nil', wall2, 'nil', 'nil', 'nil', wall2, 'nil', 'nil', 'nil'},
      {'nil', 'nil', wall2, 'nil', 'nil', 'nil', wall2, 'nil', 'nil', 'nil'},
      {'nil', 'nil', wall2, 'nil', 'nil', 'nil', wall2, 'nil', 'nil', 'nil'},
      {wall2, wall2, wall2, 'nil', 'nil', 'nil', wall2, wall2, wall2, wall2},
      {'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', wall},
      {'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', wall},
      {'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', wall},
      {wall2, wall2, wall2, 'nil', 'nil', 'nil', wall2, wall2, wall2, wall2},
      {'nil', 'nil', wall2, 'nil', 'nil', 'nil', wall2, 'nil', 'nil', 'nil'},
      {'nil', 'nil', wall2, 'nil', 'nil', 'nil', wall2, 'nil', 'nil', 'nil'},
      {'nil', 'nil', wall2, 'nil', 'nil', 'nil', wall2, 'nil', 'nil', 'nil'},
      {'nil', 'nil', wall2, wall, wall, wall, wall2, 'nil', 'nil', 'nil'}
  }
    collision = Map:new(collision)
    background = Map:new(background)
  end

  function love.update(dt)
    if love.keyboard.isDown('right') then
      if collision:cc(x + 5, y, 64, 64) == false then
         x = x + 5
      end
    end
    if love.keyboard.isDown('left') then
      if collision:cc(x - 5, y, 64, 64) == false then
         x = x - 5
      end
    end
    if love.keyboard.isDown('up') then
      if collision:cc(x, y - 5, 64, 64) == false then
         y = y - 5
      end
    end
    if love.keyboard.isDown('down') then
      if collision:cc(x , y + 5, 64, 64) == false then
         y = y + 5
      end
    end
  end

  function love.draw()
    background:draw()
    collision:draw()
    love.graphics.draw(playerImg,x,y)
  end

    background = Map:new(template)
  end

  debug = false


  background = map:cc(x, y, 64, 64)
  debug = tostring(mapc)

  local Map = require 'core/map'
  localUtil = require 'core/util'









function love.update(dt)

  if love.keyboard.isDown('up') then
    y = y - 1
  end
  if love.keyboard.isDown('down') then
    y = y + 1
  end
  if love.keyboard.isDown('left') then
    x = x - 1
  end
  if love.keyboard.isDown('right') then
    x = x + 1
  end

  ex = ex + 1

  if cc(x, y, w, h, 0, 0, 64, 64)
    hp = hp - 1
  end
end

function love.draw()
  background:draw()
  collision:draw()
  love.graphics.draw(playerImg, x, y)
  love.graphics.draw(enemyImg, ex, ey)
  love.graphics.rectangle('line', 0, 0, 64, 64)
  love.graphics.print(hp, 0, 0)
end








local gamera = require 'core/gamera'
cam = gamera.new(0, 0, 2000, 2000)
cam:setPosition(400, 400)

function love.draw()
  cam:draw(function(l, t, w, h)
  love.graphics.draw(playerImg, x, y)
  end)
end



function love.draw()
  bkgrnd:draw()
  love.graphics.print(tostring(map), 0, 0)
  love.graphics.print('Hello, world!', 0, 0)
end
end

function love.keypressed(key)
  if key == 'escape' then
    love.exitModule()
  end
end

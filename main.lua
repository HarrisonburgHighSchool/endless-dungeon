love.graphics.setDefaultFilter('nearest', 'nearest')
local Entity = require 'core/entity'

function love.load()
  playerImg = love.graphics.newImage('assets-1/player/base/naga_red_female.png')
  x = 200
  y = 0

end



  tile = love.graphics.newImage('assets-1/dungeon/floor/etched_1.png')
  floor = love.graphics.newImage('assets-1/dungeon/wall/crystal_wall_blue.png')
  background = {


  }
  wall = love.graphics.newImage('assets-1/dungeon/wall/bars_red_1.png')
  tile4 = love.graphics.newImage('assets-1/dungeon/floor/acidic_floor_0.png')
  tile5 = love.graphics.newImage('assets-1/dungeon/floor/acidic_floor_1.png')
  tile6 = love.graphics.newImage('assets-1/dungeon/floor/acidic_floor_2.png')
  tile7 = love.graphics.newImage('assets-1/dungeon/floor/acidic_floor_3.png')

  map = {
    {tile4, tile5, tile6, floor, floor, floor, tile4, tile5, tile6, tile7},
    {tile7, tile4, tile5, floor, floor, floor, tile7, tile4, tile5, tile6},
    {tile6, tile7, tile4, floor, floor, floor, tile6, tile7, tile4, tile5},
    {tile5, tile6, tile7, floor, floor, floor, tile5, tile6, tile7, tile4},
    {tile4, tile5, tile6, floor, floor, floor, tile4, tile5, tile6, tile7},
    {floor, floor, floor, floor, floor, floor, floor, floor, wall, wall},
    {floor, floor, floor, floor, floor, floor, floor, floor, wall, 'nil'},
    {floor, floor, floor, floor, floor, floor, floor, floor, wall, wall},
    {tile5, tile6, tile7, floor, floor, floor, tile4, tile5, tile6, tile7},
    {tile6, tile7, tile4, floor, floor, floor, tile5, tile6, tile7, tile4},
    {tile7, tile4, tile5, floor, floor, floor, tile6, tile7, tile4, tile5},
    {tile4, tile5, tile6, wall, wall, wall, tile7, tile4, tile5, tile6},
    {tile5, tile6, tile7, wall, 'nil', wall, tile4, tile5, tile6, tile7}
  }

  collision = Map:new(collision)
  bkgrnd = Map:new(background)
  map = Map:new(template)
  debug = false


  map = map:cc(x, y, 64, 64)
  debug = tostring(mapc)
  function love.update(dt)
    if love.keyboard.isDown('right') then
      if map:cc(x + 5, y, 64, 64, 100, 200, 64, 64) then
        x = x + 5
      end
    end
    if love.keyboard.isDown('left') then
      if map:cc(x - 5, y, 64, 64, 100, 200, 64, 64) then
        x = x - 5
      end
    end
    if love.keyboard.isDown('up') then
      if map:cc(x, y-5, 64, 64, 100, 200, 64, 64) then
        y = y - 5
      end
    end
  if love.keyboard.isDown('down') then
    if map:cc(x, y+5, 64, 64, 100, 200, 64, 64) then
      y = y + 5
    end
  end
end


  if love.keyboard.isDown('down') then
    if map:cc(x, y+5, 64, 64, 100, 200, 64, 64) then
      y = y + 5
    end
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
  love.graphics.draw(img, x, y)
end


function love.draw()
  love.graphics.draw(img,x, y)
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
  love.graphics.print(tostring(mapc), 0, 0)
  love.graphics.print('Hello, world!', 0, 0)
end
end

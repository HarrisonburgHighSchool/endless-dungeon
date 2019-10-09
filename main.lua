love.graphics.setDefaultFilter('nearest', 'nearest')
local Entity = require 'core/entity'

function love.load()
  playerImg = love.graphics.newImage('assets-1/player/base/naga_red_female.png')
  player = Entity:new(playerImg, 200, 200)
end

function love.update(dt)
end

function love.draw()
  player:draw()
end





local Util = require 'core/util'
function love.load()
  x = 400
  y = 300
  w1 = 5
  h1 = 5
  hp = 100
end
local Map = require 'core/map'

hp = var 0

  x1 = 10
  y1 = 10
  x2 = 8
  y2 = 8
  w2 = 5
  h2 = 5

  tile = love.graphics.newImage('assets-1/dungeon/floor/etched_1.png')
  tile2 = love.graphics.newImage('assets-1/dungeon/wall/crystal_wall_blue.png')
  tile3 = love.graphics.newImage('assets-1/dungeon/wall/bars_red_1.png')
  tile4 = love.graphics.newImage('assets-1/dungeon/floor/acidic_floor_0.png')
  tile5 = love.graphics.newImage('assets-1/dungeon/floor/acidic_floor_1.png')
  tile6 = love.graphics.newImage('assets-1/dungeon/floor/acidic_floor_2.png')
  tile7 = love.graphics.newImage('assets-1/dungeon/floor/acidic_floor_3.png')

  map = {
    {tile4, tile5, tile6, tile2, tile2, tile2, tile4, tile5, tile6, tile7},
    {tile7, tile4, tile5, tile2, tile2, tile2, tile7, tile4, tile5, tile6},
    {tile6, tile7, tile4, tile2, tile2, tile2, tile6, tile7, tile4, tile5},
    {tile5, tile6, tile7, tile2, tile2, tile2, tile5, tile6, tile7, tile4},
    {tile4, tile5, tile6, tile2, tile2, tile2, tile4, tile5, tile6, tile7},
    {tile2, tile2, tile2, tile2, tile2, tile2, tile2, tile2, tile2, tile3},
    {tile2, tile2, tile2, tile2, tile2, tile2, tile2, tile2, tile2, tile3},
    {tile2, tile2, tile2, tile2, tile2, tile2, tile2, tile2, tile2, tile3},
    {tile5, tile6, tile7, tile2, tile2, tile2, tile4, tile5, tile6, tile7},
    {tile6, tile7, tile4, tile2, tile2, tile2, tile5, tile6, tile7, tile4},
    {tile7, tile4, tile5, tile2, tile2, tile2, tile6, tile7, tile4, tile5},
    {tile4, tile5, tile6, tile2, tile2, tile2, tile7, tile4, tile5, tile6},
    {tile5, tile6, tile7, tile3, tile3, tile3, tile4, tile5, tile6, tile7}
  }
  bkgrnd = Map:new(map)

end



function love.update(dt)
end

function love.draw()
  map:draw()
end

  if love.keyboard.isDown('right') then
    x=x+7
  end
  if love.keyboard.isDown('left') then
    x=x-7
  end
  if love.keyboard.isDown('up') then
    y=y-7
  end
  if love.keyboard.isDown('down') then
    y=y+7
  end
end

  if cc(x1, y1, w1, h1, x2, y2, w2, h2) then
    hp = hp - 1
  end
end

if hp > 0 then
  love.graphics.draw(img,x1, y1)
end



function love.draw()
  bkgrnd:draw()
  map:draw()
  love.graphics.print('Hello, world!', 0, 0)
  love.graphics.draw(playerImg, x, y)
  love.graphics.rectangle('line', x2, y2, w2, h2)
  love.graphics.print(hp, 0, 0)
end

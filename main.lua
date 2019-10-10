local Map = require 'core/map'
local Util = require 'core/util'

function love.load()
  
  w0 = love.graphics.newImage('assets-1/dungeon/wall/catacombs_0.png')
  w1 = love.graphics.newImage('assets-1/dungeon/wall/catacombs_1.png')
  w2 = love.graphics.newImage('assets-1/dungeon/wall/catacombs_2.png')
  f1 = love.graphics.newImage('assets-1/dungeon/floor/cobble_blood_1.png')
  

  template = {
    {w1, w1, w1, w1, w1, w1, w1, w1, w1},
    {w1, f1, f1, f1, f1, f1, f1, f1, w1},
    {w1, f1, w2, w2, w2, w2, w2, f1, w1},
    {w1, f1, w2, f1, f1, f1, w2, f1, w1},
    {w1, f1, w2, f1, f1, f1, w2, f1, w1},
    {w1, f1, w2, f1, w0, f1, w2, f1, w1},
    {w1, f1, w2, f1, w0, f1, w2, f1, w1},
    {w1, f1, w2, f1, w0, f1, w2, f1, w1},
    {w1, f1, w2, f1, w0, f1, w2, f1, w1},
    {w1, f1, f1, f1, f1, f1, f1, f1, w1},
    {w1, f1, f1, f1, f1, f1, f1, f1, w1},
    {w1, w1, w1, w1, w1, w1, w1, f1, w1}}
  map = Map:new(template)
  x = 704
  y = 448
  w = 64
  h = 64
  hp = 100
  playerImg = love.graphics.newImage('assets-1/player/base/octopode_3.png')
end


function love.update(dt)
  if love.keyboard.isDown('up') then
  y=y-4
  end
  if love.keyboard.isDown('down') then
  y=y+4
  end
  if love.keyboard.isDown('right') then
  x=x+4
  end
  if love.keyboard.isDown('left') then
  x=x-4
  end

  if cc(x, y, w, h, 320, 256, 256, 64) then  
    if love.keyboard.isDown('up') then
    y=y+4
    if love.keyboard.isDown('left') then
      x=x-4
      end
    if love.keyboard.isDown('right') then
      x=x+4
      end
    end
    if love.keyboard.isDown('down') then
    y=y-4
    if love.keyboard.isDown('left') then
      x=x-4
      end
    if love.keyboard.isDown('right') then
      x=x+4
      end
    end
    if love.keyboard.isDown('left') then
    x=x+4
    if love.keyboard.isDown('up') then
      y=y+4
      end
    if love.keyboard.isDown('down') then
      y=y-4
      end
    end
    if love.keyboard.isDown('right') then
    x=x-4
    if love.keyboard.isDown('down') then
      y=y-4
      end
    if love.keyboard.isDown('up') then
      y=y+4
      end
    end
  end

end


function love.draw()
  map:draw()
  love.graphics.draw(playerImg, x, y)

  love.graphics.print(hp, 0, 0)
end

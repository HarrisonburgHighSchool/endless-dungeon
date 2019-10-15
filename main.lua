local Map = require 'core/map'
local Util = require 'core/util'

function love.load()
  
  w0 = love.graphics.newImage('assets-1/dungeon/wall/catacombs_0.png')
  w1 = love.graphics.newImage('assets-1/dungeon/wall/catacombs_1.png')
  w2 = love.graphics.newImage('assets-1/dungeon/wall/catacombs_2.png')
  f = love.graphics.newImage('assets-1/dungeon/floor/floor_vines_0.png')
  

  background = {
    {f, f, f, f, f, f, f, f, f, f},
    {f, f, f, f, f, f, f, f, f, f},
    {f, f, f, f, f, f, f, f, f, f},
    {f, f, f, f, f, f, f, f, f, f},
    {f, f, f, f, f, f, f, f, f, f},
    {f, f, f, f, f, f, f, f, f, f},
    {f, f, f, f, f, f, f, f, f, f},
    {f, f, f, f, f, f, f, f, f, f},
    {f, f, f, f, f, f, f, f, f, f},
    {f, f, f, f, f, f, f, f, f, f},
    {f, f, f, f, f, f, f, f, f, f},
    {f, f, f, f, f, f, f, f, f, f},
    {f, f, f, f, f, f, f, f, f, f}
  }
  layer1 = {
    {w1, w1, w1, w1, w1, w1, w1, w1, w1},
    {w1, "nil", "nil", "nil", "nil", "nil", "nil", "nil", w1},
    {w1, "nil", w0, w0, "nil", w0, w0,"nil", w1},
    {w1, "nil", w0, "nil", "nil", "nil", w0, "nil", w1},
    {w1, "nil", w0, "nil", "nil", "nil", w0, "nil", w1},
    {"nil", "nil", w0, "nil", w2, "nil", w0, "nil", w1},
    {"nil", "nil", w0, "nil", w2, "nil", w0, "nil", w1},
    {w1, "nil", w0, "nil", "nil", "nil", w0, "nil", w1},
    {w1, "nil", w0, "nil", "nil", "nil", w0, "nil", w1},
    {w1, "nil", w0, w0, "nil", w0, w0, "nil", w1},
    {w1, "nil", "nil", "nil", "nil", "nil", "nil", "nil", w1},
    {w1, w1, w1, w1, w1, w1, w1, w1, w1}
  }


  
map = Map:new(background)
mapc = Map:new(layer1)

  x = 64
  y = 64
  w = 32
  h = 32
  hp = 100
  playerImg = love.graphics.newImage('assets-1/monster/aberration/unseen_horror.png')
end


function love.update(dt)
  
  
    if love.keyboard.isDown('up') then
      if mapc:cc(x, y - 4, w, h) == false then
        y = y - 4
      end
    end
    if love.keyboard.isDown('down') then
      if mapc:cc(x, y + 4, w, h) == false then
        y = y + 4
      end
    end
    if love.keyboard.isDown('right') then
      if mapc:cc(x + 4, y, w, h) == false then
        x = x + 4
      end
    end
    if love.keyboard.isDown('left') then
      if mapc:cc(x - 4, y, w, h) == false then
        x = x - 4
      end
    end
  
  
  

end


function love.draw()
 
  map:draw()
  mapc:draw()

  love.graphics.draw(playerImg, x, y)
end

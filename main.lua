local Map = require 'core/map'
local Util = require 'core/util'

function love.load()
  
  w0 = love.graphics.newImage('assets-1/dungeon/wall/catacombs_0.png')
  w1 = love.graphics.newImage('assets-1/dungeon/wall/catacombs_1.png')
  w2 = love.graphics.newImage('assets-1/dungeon/wall/catacombs_2.png')
  f1 = love.graphics.newImage('assets-1/dungeon/floor/cobble_blood_1.png')
  

  background = {
    {f1, f1, f1, f1, f1, f1, f1, f1, f1},
    {f1, f1, f1, f1, f1, f1, f1, f1, f1},
    {f1, f1, f1, f1, f1, f1, f1, f1, f1},
    {f1, f1, f1, f1, f1, f1, f1, f1, f1},
    {f1, f1, f1, f1, f1, f1, f1, f1, f1},
    {f1, f1, f1, f1, f1, f1, f1, f1, f1},
    {f1, f1, f1, f1, f1, f1, f1, f1, f1},
    {f1, f1, f1, f1, f1, f1, f1, f1, f1},
    {f1, f1, f1, f1, f1, f1, f1, f1, f1},
    {f1, f1, f1, f1, f1, f1, f1, f1, f1},
    {f1, f1, f1, f1, f1, f1, f1, f1, f1},
    {f1, f1, f1, f1, f1, f1, f1, f1, f1}}
  layer1 = {
    {w1, w1, w1, w1, w1, w1, w1, w1, w1},
    {w1, nil, nil, nil, nil, nil, nil, nil, w1},
    {w1, nil, w0, w0, nil, w0, w0,nil, w1},
    {w1, nil, w0, nil, nil, nil, w0, nil, w1},
    {w1, nil, w0, nil, nil, nil, w0, nil, w1},
    {nil, nil, w0, nil, w2, nil, w0, nil, w1},
    {nil, nil, w0, nil, w2, nil, w0, nil, w1},
    {w1, nil, w0, nil, nil, nil, w0, nil, w1},
    {w1, nil, w0, nil, nil, nil, w0, nil, w1},
    {w1, nil, w0, w0, nil, w0, w0, nil, w1},
    {w1, nil, nil, nil, nil, nil, nil, nil, w1},
    {w1, w1, w1, w1, w1, w1, w1, w1, w1}}
  
map = Map:new(background)
mapc = Map:new(layer1)

  x = 64
  y = 64
  w = 64
  h = 64
  hp = 100
  playerImg = love.graphics.newImage('assets-1/player/base/octopode_3.png')
end


function love.update(dt)
  
  
    if love.keyboard.isDown('up') then
      if mapc:cc(x, y - 1, 64, 64) then
        y = y - 1
      end
    end
    if love.keyboard.isDown('down') then
      if mapc:cc(x, y + 1, 64, 64) then
        y = y + 1
      end
    end
    if love.keyboard.isDown('right') then
      if mapc:cc(x + 1, y, 64, 64) then
        x = x + 1
      end
    end
    if love.keyboard.isDown('left') then
      if mapc:cc(x - 1, y, 64, 64) then
        x = x - 1
      end
    end
  
  
  

end


function love.draw()
 
  map:draw()
  mapc:draw()
  love.graphics.draw(playerImg, x, y)
end

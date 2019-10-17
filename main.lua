local Map = require 'core/map'
local Util = require 'core/util'
local anim8 = require 'core/anim8'

function love.load()
  
  w0 = love.graphics.newImage('assets-1/dungeon/wall/catacombs_0.png')
  w1 = love.graphics.newImage('assets-1/dungeon/wall/catacombs_1.png')
  w2 = love.graphics.newImage('assets-1/dungeon/wall/catacombs_2.png')
  f = love.graphics.newImage('assets-1/dungeon/floor/floor_vines_0.png')
  
  spritesheet = love.graphics.newImage('hero/Old hero.png')
  grid = anim8.newGrid(16, 16, spritesheet:getWidth(), spritesheet:getHeight())
  walk = anim8.newAnimation(grid('1-6', 2), 0.2)

  background = {
    {f, f, f, f, f, f, f, f, f, f, f, f, f},
    {f, f, f, f, f, f, f, f, f, f, f, f, f},
    {f, f, f, f, f, f, f, f, f, f, f, f, f},
    {f, f, f, f, f, f, f, f, f, f, f, f, f},
    {f, f, f, f, f, f, f, f, f, f, f, f, f},
    {f, f, f, f, f, f, f, f, f, f, f, f, f},
    {f, f, f, f, f, f, f, f, f, f, f, f, f},
    {f, f, f, f, f, f, f, f, f, f, f, f, f},
    {f, f, f, f, f, f, f, f, f, f, f, f, f},
    {f, f, f, f, f, f, f, f, f, f, f, f, f},
    {f, f, f, f, f, f, f, f, f, f, f, f, f},
    {f, f, f, f, f, f, f, f, f, f, f, f, f},
  }
  layer1 = {
    {w1, w1, w1, w1, w1, w1, w1, w1, w1, w1},
    {w1, "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil," w1},
    {w1, "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil," w1},
    {w1, "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil," w1},
    {w1, "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil," w1},
    {w1, "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil," w1},
    {w1, "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil," w1},
    {w1, "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil," w1},
    {w1, "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil," w1},
    {w1, "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil," w1},
    {w1, "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil," w1},
    {w1, w1, w1, w1, w1, w1, w1, w1, w1, w1},
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

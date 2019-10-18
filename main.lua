love.graphics.setDefaultFilter('nearest', 'nearest')
local Map = require 'core/map'
local gamera = require 'core/gamera'
local Util = require 'core/util'

function love.load()
  x = 64
  camx = 96
  mirrorx = 768
  y = 320
  camy = 256
  mirrory = 320
  s = 1
  hp = 20
  cam = gamera.new(48, 52, 800, 600)
  
  playerImg = love.graphics.newImage('assets-1/player/base/octopode_3.png')
  w = 64   -- The player's width is 64
  h = 64   -- The player's height is 64

  mirrorPlayerImg = love.graphics.newImage('assets-1/player/base/Octopode_2.png')
  w2 = 64  -- The mirror player's width is 64
  h2 = 64  -- The mirror player's height is 64
  
  cobalt = love.graphics.newImage('assets-1/dungeon/floor/limestone_6.png')
  cobaltM = love.graphics.newImage('assets-1/dungeon/floor/limestone_6_flip.png')
  MirrorL = love.graphics.newImage('assets-1/dungeon/floor/limestone_6_mirror_left.png')
  MirrorR = love.graphics.newImage('assets-1/dungeon/floor/limestone_6_mirror_right.png')
  hole = love.graphics.newImage('assets-1/dungeon/floor/hole.png')
  wall = love.graphics.newImage('assets-1/dungeon/wall/catacombs_0.png')
  --Hp = love.graphics.newImage('assets-1/player/hp_bar/full.png')

  floor = {
    {cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt,},
    {cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, 'nil', 'nil',},
    {cobalt, cobalt, cobalt, 'nil', cobalt, cobalt, cobalt, cobalt, 'nil', 'nil',},
    {cobalt, cobalt, cobalt, 'nil', cobalt, cobalt, cobalt, cobalt, cobalt, cobalt,},
    {cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, 'nil', cobalt, cobalt, cobalt,},
    {cobalt, cobalt, 'nil', 'nil', cobalt, cobalt, cobalt, cobalt, cobalt, cobalt,},
    {cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt,},
    {cobaltM, cobaltM, cobaltM, cobaltM, cobaltM, cobaltM, cobaltM, cobaltM, cobaltM, cobaltM,},
    {cobaltM, cobaltM, cobaltM, cobaltM, cobaltM, cobaltM, cobaltM, cobaltM, cobaltM, cobaltM,},
    {cobaltM, cobaltM, cobaltM, cobaltM, cobaltM, cobaltM, cobaltM, cobaltM, cobaltM, cobaltM,},
    {cobaltM, cobaltM, cobaltM, cobaltM, cobaltM, cobaltM, cobaltM, cobaltM, cobaltM, cobaltM,},
    {cobaltM, cobaltM, cobaltM, cobaltM, cobaltM, cobaltM, cobaltM, cobaltM, cobaltM, cobaltM,}, 
    {cobaltM, cobaltM, cobaltM, cobaltM, cobaltM, cobaltM, cobaltM, cobaltM, cobaltM, cobaltM,},
    {cobaltM, cobaltM, cobaltM, cobaltM, cobaltM, cobaltM, cobaltM, cobaltM, cobaltM, cobaltM,},
  }
  wall = {
    {wall, wall, wall, wall, wall, wall, wall, wall, wall, wall, wall,},
    {wall, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', wall,},
    {wall, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', wall,},
    {wall, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', wall,},
    {wall, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', wall,},
    {wall, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', wall,},
    {wall, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', wall,},
    {wall, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', wall,},
    {wall, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', wall,},
    {wall, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', wall,},
    {wall, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', wall,},
    {wall, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', wall,}, 
    {wall, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', wall,},
    {wall, wall, wall, wall, wall, wall, wall, wall, wall, wall, wall,},
  }
  floor = Map:new(floor)
  wall = Map:new(wall)
end
  
function love.update(dt)
  if wall:cc(x + 3, y, 64, 64) == false then
    if love.keyboard.isDown('right') then   -- if the 'right' key is being pressed...
      x = x + 3
      mirrorx = mirrorx - 3
    end
  end
  if wall:cc(x, y + 3, 64, 64) == false then
    if love.keyboard.isDown('down') then   -- if the 'down' key is being pressed...
      y = y + 3
      mirrory = mirrory + 3
    end
  end
  if wall:cc(x - 3, y, 64, 64) == false then
    if love.keyboard.isDown('left') then   -- if the 'left' key is being pressed...
      x = x - 3
      mirrorx = mirrorx + 3
    end
  end
  if wall:cc(x, y - 3, 64, 64) == false then
    if love.keyboard.isDown('up') then   -- if the 'up' key is being pressed...
      y = y - 3
      mirrory = mirrory - 3
    end
  end
  if cc(x, y, w, h, 158, 216, 80, 16) then  
    hp = hp - 1
  end
  if cc(x, y, w, h, 344, 410, 16, 16) then  
    hp = hp - 1
  end
  if cc(x, y, w, h, 60, 542, 99, 84) then
    hp = hp - 1
  end
  if cc(x, y, w, h, 348, 152, 12, 72) then  
    hp = hp - 1
  end
  cam:setPosition(x, y)
end

function love.draw()
  cam:draw(function(camx, camy)
  floor:draw()
  wall:draw()
  love.graphics.draw(playerImg, x, y)
  love.graphics.draw(mirrorPlayerImg, mirrorx, mirrory)
  love.graphics.print(hp, x, y)
  end)
end

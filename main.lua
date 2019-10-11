love.graphics.setDefaultFilter('nearest', 'nearest')
local Map = require 'core/map'
local gamera = require 'core/gamera'
local Util = require 'core/util'

function love.load()
  x = 128
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
  cobaltMirrorLeft = love.graphics.newImage('assets-1/dungeon/floor/limestone_6_mirror_left.png')
  cobaltMirrorLeftT = love.graphics.newImage('assets-1/dungeon/floor/limestone_6_mirror_left_top.png')
  cobaltMirrorRight = love.graphics.newImage('assets-1/dungeon/floor/limestone_6_mirror_right.png')
  cobaltMirrorRightT = love.graphics.newImage('assets-1/dungeon/floor/limestone_6_mirror_right_top.png')
  hole = love.graphics.newImage('assets-1/dungeon/floor/hole.png')
  wall = love.graphics.newImage('assets-1/dungeon/wall/catacombs_0.png')
  --Hp = love.graphics.newImage('assets-1/player/hp_bar/template4.png')

  mapTemplate = {
    {wall, wall, wall, wall, wall, wall, wall, wall, wall, wall, wall,},
    {wall, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, hole, hole, wall,},
    {wall, cobalt, cobalt, hole, cobalt, cobalt, cobalt, cobalt, hole, hole, wall,},
    {wall, cobalt, cobalt, hole, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, wall,},
    {wall, cobalt, cobalt, cobalt, cobalt, cobalt, hole, cobalt, cobalt, cobalt, wall,},
    {wall, cobalt, hole, hole, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, wall,},
    {wall, cobaltMirrorRightT, cobaltMirrorRight, cobaltMirrorRight, cobaltMirrorRight, cobaltMirrorRight, cobaltMirrorRight, cobaltMirrorRight, cobaltMirrorRight, cobaltMirrorRight, wall,},
    {wall, cobaltMirrorLeftT, cobaltMirrorLeft, cobaltMirrorLeft, cobaltMirrorLeft, cobaltMirrorLeft, cobaltMirrorLeft, cobaltMirrorLeft, cobaltMirrorLeft, cobaltMirrorLeft, wall,},
    {wall, cobaltM, cobaltM, cobaltM, cobaltM, cobaltM, cobaltM, cobaltM, cobaltM, cobaltM, wall,},
    {wall, cobaltM, cobaltM, cobaltM, cobaltM, cobaltM, cobaltM, cobaltM, cobaltM, cobaltM, wall,},
    {wall, cobaltM, cobaltM, cobaltM, cobaltM, cobaltM, cobaltM, cobaltM, cobaltM, cobaltM, wall,},
    {wall, cobaltM, cobaltM, cobaltM, cobaltM, cobaltM, cobaltM, cobaltM, cobaltM, cobaltM, wall,}, 
    {wall, cobaltM, cobaltM, cobaltM, cobaltM, cobaltM, cobaltM, cobaltM, cobaltM, cobaltM, wall,},
    {wall, wall, wall, wall, wall, wall, wall, wall, wall, wall, wall,},
  }
  map = Map:new(mapTemplate)
end
  
function love.update(dt)
  if love.keyboard.isDown('right') then   -- if the 'right' key is being pressed...
    x = x + 3
    mirrorx = mirrorx - 3
  end
  if love.keyboard.isDown('down') then   -- if the 'down' key is being pressed...
    y = y + 3
    mirrory = mirrory + 3
  end
  if love.keyboard.isDown('left') then   -- if the 'left' key is being pressed...
    x = x - 3
    mirrorx = mirrorx + 3
  end
  if love.keyboard.isDown('up') then   -- if the 'up' key is being pressed...
    y = y - 3
    mirrory = mirrory - 3
  end
  if cc(x, y, w, h, 216, 216, 84, 16) then  
    hp = hp - 1
  end
  if cc(x, y, w, h, 344, 410, 16, 16) then  
    hp = hp - 1
  end
  if cc(x, y, w, h, 64, 542, 166, 84) then
    hp = hp - 1
  end
  if cc(x, y, w, h, 412, 152, 12, 72) then  
    hp = hp - 1
  end
  if cc(x, y, w, h, 64, 0, 768, 64) then  
    if love.keyboard.isDown('up') then   -- if the 'up' key is being pressed...
      y = y + 3
      mirrory = mirrory + 3
    end
  end
  if cc(x, y, w, h, 502, 64, 84, 576) then  
    if love.keyboard.isDown('right') then   -- if the 'right' key is being pressed...
      x = x - 3
      mirrorx = mirrorx + 3
    end
  end
  if cc(x, y, w, h, 64, 64, 64, 576) then  
    if love.keyboard.isDown('left') then   -- if the 'left' key is being pressed...
      x = x + 3
      mirrorx = mirrorx - 3
    end
  end
  if cc(x, y, w, h, 64, 644, 832, 64) then  
    if love.keyboard.isDown('down') then   -- if the 'down' key is being pressed...
      y = y - 3
      mirrory = mirrory - 3
    end
  end
  cam:setPosition(x, y)
end

function love.draw()
  cam:draw(function(camx, camy)
  map:draw()
  love.graphics.draw(playerImg, x, y, rotation, -1, 1)
  love.graphics.draw(mirrorPlayerImg, mirrorx, mirrory)
  love.graphics.print(hp, x, y)
  end)
end

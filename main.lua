local Map = require 'core/map'

function love.load()
  x = 0
  mirrorx = 704
  y = 256
  mirrory = 512
  playerImg = love.graphics.newImage('assets-1/player/base/Octopode_1.png')
  mirrorPlayerImg = love.graphics.newImage('assets-1/player/base/Octopode_2.png')
  cobalt = love.graphics.newImage('assets-1/dungeon/floor/limestone_6.png')
  cobaltMirrorLeft = love.graphics.newImage('assets-1/dungeon/floor/limestone_6_mirror_left.png')
  cobaltMirrorRight = love.graphics.newImage('assets-1/dungeon/floor/limestone_6_mirror_right.png')
  hole = love.graphics.newImage('assets-1/dungeon/floor/hole.png')
  mapTemplate = {
    {cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, hole, hole,},
    {cobalt, cobalt, hole, cobalt, cobalt, cobalt, cobalt, hole, hole,},
    {cobalt, cobalt, hole, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt,},
    {cobalt, cobalt, cobalt, cobalt, cobalt, hole, cobalt, cobalt, cobalt,},
    {cobalt, hole, hole, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt,},
    {cobaltMirrorRight, cobaltMirrorRight, cobaltMirrorRight, cobaltMirrorRight, cobaltMirrorRight, cobaltMirrorRight, cobaltMirrorRight, cobaltMirrorRight, cobaltMirrorRight,},
    {cobaltMirrorLeft, cobaltMirrorLeft, cobaltMirrorLeft, cobaltMirrorLeft, cobaltMirrorLeft, cobaltMirrorLeft, cobaltMirrorLeft, cobaltMirrorLeft, cobaltMirrorLeft,},
    {cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt,},
    {cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt,},
    {cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt,},
    {cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt,}, 
    {cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt,},
  }
  map = Map:new(mapTemplate)
end
  
function love.update(dt)
  if love.keyboard.isDown('right') then   -- if the 'right' key is being pressed...
    x = x + 4
    mirrorx = mirrorx - 4
  end
  if love.keyboard.isDown('down') then   -- if the 'down' key is being pressed...
    y = y + 4
    mirrory = mirrory + 4
  end
  if love.keyboard.isDown('left') then   -- if the 'left' key is being pressed...
    x = x - 4
    mirrorx = mirrorx + 4
  end
  if love.keyboard.isDown('up') then   -- if the 'up' key is being pressed...
    y = y - 4
    mirrory = mirrory - 4
  end
end

function love.draw()
  love.graphics.print('Hello, world!', 0, 0)
  map:draw()
  love.graphics.draw(playerImg, x, y)
  love.graphics.draw(mirrorPlayerImg, mirrorx, mirrory)
end


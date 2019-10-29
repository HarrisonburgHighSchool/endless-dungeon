love.graphics.setDefaultFilter('nearest', 'nearest')
local Map = require 'core/map'
local gamera = require 'core/gamera'
local Util = require 'core/util'
local anim8 = require 'core/anim8'

function love.load()
  mirrorshatttered = false
  facingR = true
  facingL = false
  varL = true
  x = 64
  camx = 96
  mirrorx = 768
  y = 320
  camy = 256
  mirrory = 320
  hp = 20
  cam = gamera.new(48, 52, 800, 600)
  
  playerImg = love.graphics.newImage('assets-1/player/base/octopode_3.png')
  w = 64   -- The player's width is 64
  h = 64   -- The player's height is 64

  mirrorPlayerImg = love.graphics.newImage('assets-1/player/base/Octopode_2.png')
  w2 = 64  -- The mirror player's width is 64
  h2 = 64  -- The mirror player's height is 64
  
  spritesheet = love.graphics.newImage('hero/Old hero.png')
  grid = anim8.newGrid(64, 64, spritesheet:getWidth(), spritesheet:getHeight())
  walk = anim8.newAnimation(grid('1-6', 2), 0.2)
  idle = anim8.newAnimation(grid('1-4', 1), 0.2)

  spritesheetM = love.graphics.newImage('hero/Old hero M.png')
  grid = anim8.newGrid(64, 64, spritesheet:getWidth(), spritesheet:getHeight())
  walk = anim8.newAnimation(grid('1-6', 2), 0.2)
  idle = anim8.newAnimation(grid('1-4', 1), 0.2)

  cobalt = love.graphics.newImage('assets-1/dungeon/floor/limestone_6.png')
  cobaltM = love.graphics.newImage('assets-1/dungeon/floor/limestone_6_flip.png')
  MirrorL = love.graphics.newImage('assets-1/dungeon/floor/limestone_6_mirror_left.png')
  MirrorR = love.graphics.newImage('assets-1/dungeon/floor/limestone_6_mirror_right.png')
  hole = love.graphics.newImage('assets-1/dungeon/floor/hole.png')
  wall = love.graphics.newImage('assets-1/dungeon/wall/catacombs_0.png')
  Hp = love.graphics.newImage('assets-1/player/hp_bar/full.png')

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
    walls = {
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
    mirror = {
      {wall, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil',},
      {'nil','nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil',},
      {'nil','nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil',},
      {'nil','nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil',},
      {'nil','nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil',},
      {'nil','nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil',},
      {'nil', MirrorR, MirrorR, MirrorR, MirrorR, MirrorR, MirrorR, MirrorR, MirrorR, MirrorR, 'nil',},
      {'nil', MirrorL, MirrorL, MirrorL, MirrorL, MirrorL, MirrorL, MirrorL, MirrorL, MirrorL, 'nil',},
      {'nil','nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil',},
      {'nil','nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil',},
      {'nil','nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil',},
      {'nil','nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil',},
      {'nil','nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil',},
      {'nil','nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil',},
    }
    floorm = {
      {cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt,},
      {cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, 'nil', 'nil',},
      {cobalt, cobalt, cobalt, 'nil', cobalt, cobalt, cobalt, cobalt, 'nil', 'nil',},
      {cobalt, cobalt, cobalt, 'nil', cobalt, cobalt, cobalt, cobalt, cobalt, cobalt,},
      {cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, 'nil', cobalt, cobalt, cobalt,},
      {cobalt, cobalt, 'nil', 'nil', cobalt, cobalt, cobalt, cobalt, cobalt, cobalt,},
      {cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt,},
      {cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt,},
      {cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt,},
      {cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt,},
      {cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt,},
      {cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt,},
      {cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt,},
      {cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt,},
    }
    wallsm = {
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
      {wall, wall, wall, wall, wall, 'nil', wall, wall, wall, wall, wall,},
    }
    mirrorm = {
      {wall, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil',},
      {'nil','nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil',},
      {'nil','nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil',},
      {'nil','nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil',},
      {'nil','nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil',},
      {'nil','nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil',},
      {'nil','nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil',},
      {'nil','nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil',},
      {'nil','nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil',},
      {'nil','nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil',},
      {'nil','nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil',},
      {'nil','nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil',},
      {'nil','nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil',},
      {'nil','nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil',},
    }
  floor = Map:new(floor)
  walls = Map:new(walls)
  mirror = Map:new(mirror)
  floorm = Map:new(floorm)
  wallsm = Map:new(wallsm)
  mirrorm = Map:new(mirrorm)
end
  
function love.update(dt)
  if love.keyboard.isDown('right') then --if the 'right' key is being pressed...
    walk:update(dt)
    facingR = true
    facingL = false
    if mirrorshatttered == false then
      if walls:cc(x + 4, y, 64, 64) == false then
        if mirror:cc(x - 54, y, 64, 64) == false then 
          x = x + 4
          mirrorx = mirrorx - 4
        end
      end
    end
      if mirrorshatttered == true then
        if wallsm:cc(x + 4, y, 64, 64) == false then
          x = x + 4
          mirrorx = mirrorx - 4
      end
    end
  end
  if love.keyboard.isDown('down') then   -- if the 'down' key is being pressed...
      walk:update(dt)  
      if mirrorshatttered == false then
        if walls:cc(x, y + 4, 64, 64) == false then
          y = y + 4
          mirrory = mirrory + 4
        end
      end
      if mirrorshatttered == true then
        if wallsm:cc(x, y + 4, 64, 64) == false then
          y = y + 4
          mirrory = mirrory - 4
        end
      end
    end
  if love.keyboard.isDown('left') then   -- if the 'left' key is being pressed...
    walk:update(dt)
    facingR = false
    facingL = true  
    if mirrorshatttered == false then
      if walls:cc(x - 4, y, 64, 64) == false then
        if mirror:cc(x - 64, y, 64, 64) == false then
          x = x - 4
          mirrorx = mirrorx + 4
        end
      end
    end
    if mirrorshatttered == true then
      if wallsm:cc(x - 4, y, 64, 64) == false then
        x = x - 4
        mirrorx = mirrorx + 4
      end
    end
  end
    if love.keyboard.isDown('up') then   -- if the 'up' key is being pressed...
    walk:update(dt)
    if mirrorshatttered == false then
      if walls:cc(x, y - 4, 64, 64) == false then
        y = y - 4
        mirrory = mirrory - 4
      end
    end
    if mirrorshatttered == true then
      if wallsm:cc(x, y - 4, 64, 64) == false then
        y = y - 4
        mirrory = mirrory - 4
    end
  end
end
  if cc(x, y, w, h, 158, 216, 80, 16) then  
    hp = hp - 1
  end
  if cc(x, y, w, h, 280, 410, 16, 16) then  
    hp = hp - 1
  end
  if cc(x, y, w, h, 344, 510, 64, 64) then
    if mirrorshatttered == false then
        mirrorshatttered = true
    end
  end
  if cc(x, y, w, h, 60, 542, 99, 84) then
    hp = hp - 1
  end
  if cc(x, y, w, h, 348, 152, 12, 72) then  
    hp = hp - 1
  end
  idle:update(dt)
  cam:setPosition(x, y)
end

function love.draw()
  cam:draw(function(camx, camy)
  
  if mirrorshatttered == false then
    floor:draw()
    walls:draw()
    mirror:draw()
  end
  if mirrorshatttered == true then
    floorm:draw()
    wallsm:draw()
    mirrorm:draw()
  end
  
  love.graphics.print(hp, x, y)
  if mirrorshatttered == true then
    if facingR == true then
      walk:draw(spritesheet, x, y)
    end
  end
  if mirrorshatttered == false then
    if facingR == true then
      walk:draw(spritesheet, x, y)
      walk:draw(spritesheetM, mirrorx, mirrory)
    end
  end
  if mirrorshatttered == true then
    if facingL == true then
      walk:draw(spritesheet, x, y, rotation, -1, 1, 64, 0)
    end
  end
  if mirrorshatttered == false then
    if facingL == true then
      walk:draw(spritesheet, x, y, rotation, -1, 1, 64, 0)
      walk:draw(spritesheetM, mirrorx, mirrory, rotation, -1, 1, 64, 0)
    end
  end
end)
end

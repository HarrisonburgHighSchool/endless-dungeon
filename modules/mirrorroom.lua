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
  w = 64
  h = 64

  spritesheet = love.graphics.newImage('hero/Old heroT.png')
  grid = anim8.newGrid(64, 64, spritesheet:getWidth(), spritesheet:getHeight())
  walk = anim8.newAnimation(grid('1-6', 2), 0.2)
  idle = anim8.newAnimation(grid('1-4', 1), 0.3)

  anim = idle

  spritesheetM = love.graphics.newImage('hero/Old hero M.png')
  grid = anim8.newGrid(64, 64, spritesheet:getWidth(), spritesheet:getHeight())
  walkm = anim8.newAnimation(grid('1-6', 2), 0.2)
  idlem = anim8.newAnimation(grid('1-4', 1), 0.3)

  anim = idlem

  cobalt = love.graphics.newImage('assets-1/dungeon/floor/limestone_6.png')
  cobaltM = love.graphics.newImage('assets-1/dungeon/floor/limestone_6_flip.png')
  MirrorL = love.graphics.newImage('assets-1/dungeon/floor/limestone_6_mirror_left.png')
  MirrorR = love.graphics.newImage('assets-1/dungeon/floor/limestone_6_mirror_right.png')
  hole = love.graphics.newImage('assets-1/dungeon/floor/hole.png')
  wall = love.graphics.newImage('assets-1/dungeon/wall/catacombs_0.png')
  door = love.graphics.newImage('assets-1/dungeon/doors/vgate_open_up.png')
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
    doors = {
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
      {'nil','nil', 'nil', 'nil', 'nil', door, 'nil', 'nil', 'nil', 'nil', 'nil',},
    }
  floor = Map:new(floor)
  walls = Map:new(walls)
  mirror = Map:new(mirror)
  floorm = Map:new(floorm)
  wallsm = Map:new(wallsm)
  mirrorm = Map:new(mirrorm)
  doors = Map:new(doors)
end
  
function love.update(dt)
  if love.keyboard.isDown('right') then --if the 'right' key is being pressed...
    anim = walk
    walk:update(dt)
    walkm:update(dt)
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
      anim = walk
      walk:update(dt) 
      walkm:update(dt) 
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
    anim = walk
    walk:update(dt)
    walkm:update(dt)
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
    anim = walk
    walk:update(dt)
    walkm:update(dt)
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
  if x > 864 then
    love.exitModule()
  end
  anim = idle
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
    doors:draw()
  end

  love.graphics.print(hp, x, y)
  if love.keyboard.isDown('down') == false then
    if love.keyboard.isDown('up') == false then
      if love.keyboard.isDown('left') == false then
        if love.keyboard.isDown('right') == false then
          if mirrorshatttered == false then
            idle:draw(spritesheet, x, y)
            idle:draw(spritesheetM, mirrorx, mirrory)
          end
          if mirrorshatttered == true then
            idle:draw(spritesheet, x, y)
          end
        end
      end
    end
  end
  if mirrorshatttered == true then
    if facingR == true then
      if love.keyboard.isDown('up') then
        walk:draw(spritesheet, x, y)
        end
        if love.keyboard.isDown('down') then
          walk:draw(spritesheet, x, y)
        end
        if love.keyboard.isDown('right') then
          walk:draw(spritesheet, x, y)
      end
    end
  end
  if mirrorshatttered == false then
    if facingR == true then
      if love.keyboard.isDown('up') then
        walk:draw(spritesheet, x, y)
        walkm:draw(spritesheetM, mirrorx, mirrory)
        end
        if love.keyboard.isDown('down') then
          walk:draw(spritesheet, x, y)
          walkm:draw(spritesheetM, mirrorx, mirrory)
        end
        if love.keyboard.isDown('right') then
          walk:draw(spritesheet, x, y)
          walkm:draw(spritesheetM, mirrorx, mirrory)
        end
    end
  end
  if mirrorshatttered == true then
    if facingL == true then
      if love.keyboard.isDown('up') then
        walk:draw(spritesheet, x, y, rotation, -1, 1, 64, 0)
      end
      if love.keyboard.isDown('down') then
        walk:draw(spritesheet, x, y, rotation, -1, 1, 64, 0)        
      end
      if love.keyboard.isDown('left') then
        walk:draw(spritesheet, x, y, rotation, -1, 1, 64, 0) 
      end
    end
  end
    if mirrorshatttered == false then
      if facingL == true then
        if love.keyboard.isDown('up') then
          walk:draw(spritesheet, x, y, rotation, -1, 1, 64, 0)
          walkm:draw(spritesheetM, mirrorx, mirrory, rotation, -1, 1, 64, 0)
        end
        if love.keyboard.isDown('down') then
          walk:draw(spritesheet, x, y, rotation, -1, 1, 64, 0)
          walkm:draw(spritesheetM, mirrorx, mirrory, rotation, -1, 1, 64, 0)
        end
        if love.keyboard.isDown('left') then
          walk:draw(spritesheet, x, y, rotation, -1, 1, 64, 0)
          walkm:draw(spritesheetM, mirrorx, mirrory, rotation, -1, 1, 64, 0)
        end
      end
    end
  end)
end

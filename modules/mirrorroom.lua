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
  hpnum = 10
  cam = gamera.new(48, 52, 800, 600)
  w = 64
  h = 64
  timerIFrames = 0
  Iframes = 0

  spritesheet = love.graphics.newImage('hero/Old heroT.png')
  grid = anim8.newGrid(64, 64, spritesheet:getWidth(), spritesheet:getHeight())
  walk = anim8.newAnimation(grid('1-6', 2), 0.2)
  idle = anim8.newAnimation(grid('1-4', 1), 0.4)

  anim = idle

  spritesheetM = love.graphics.newImage('hero/Old hero M.png')
  grid = anim8.newGrid(64, 64, spritesheet:getWidth(), spritesheet:getHeight())
  walkm = anim8.newAnimation(grid('1-6', 2), 0.2)
  idlem = anim8.newAnimation(grid('1-4', 1), 0.4)

  anim = idlem

  cobalt = love.graphics.newImage('assets-1/dungeon/floor/limestone_6.png')
  cobaltM = love.graphics.newImage('assets-1/dungeon/floor/limestone_6_flip.png')
  MirrorL = love.graphics.newImage('assets-1/dungeon/floor/limestone_6_mirror_left.png')
  MirrorR = love.graphics.newImage('assets-1/dungeon/floor/limestone_6_mirror_right.png')
  hole = love.graphics.newImage('assets-1/dungeon/floor/hole.png')
  wall = love.graphics.newImage('assets-1/dungeon/wall/catacombs_0.png')
  door = love.graphics.newImage('assets-1/dungeon/doors/vgate_open_up.png')
  Hpfull = love.graphics.newImage('assets-1/player/hp_bar/full.png')
  --Hp9 = love.graphics.newImage('assets-1/player/hp_bar/9.png')
  --Hp8 = love.graphics.newImage('assets-1/player/hp_bar/8.png')
  --Hp7 = love.graphics.newImage('assets-1/player/hp_bar/7.png')
  --Hp6 = love.graphics.newImage('assets-1/player/hp_bar/6.png')
  --Hp5 = love.graphics.newImage('assets-1/player/hp_bar/5.png')
  --Hp4 = love.graphics.newImage('assets-1/player/hp_bar/4.png')
  --Hp3 = love.graphics.newImage('assets-1/player/hp_bar/3.png')
  --Hp2 = love.graphics.newImage('assets-1/player/hp_bar/2.png')
  --Hp1 = love.graphics.newImage('assets-1/player/hp_bar/critical.png')
  --Hpempty = love.graphics.newImage('assets-1/player/hp_bar/empty.png')
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
      if wallsm:cc(x, y - 4, 64, 64) == 0 then
        y = y - 4
        mirrory = mirrory - 4
    end
  end
end
  if cc(x, y, w, h, 158, 216, 80, 16) then  
    if Iframes == 0 then
      hpnum = hpnum - 1
      if Iframes == 0 then
        Iframes = 1
      end
    end
  end
  if cc(x, y, w, h, 280, 410, 16, 16) then  
    if Iframes == 0 then
      hpnum = hpnum - 1
      if Iframes == 0 then
        Iframes = 1
      end
    end
  end
  if cc(x, y, w, h, 344, 510, 64, 64) then
    if mirrorshatttered == false then
        mirrorshatttered = true
    end
  end
  if cc(x, y, w, h, 60, 542, 99, 84) then
    if Iframes == 0 then
      hpnum = hpnum - 1
      if Iframes == 0 then
        Iframes = 1
      end
    end
  end
  if cc(x, y, w, h, 348, 152, 12, 72) then  
    if Iframes == 0 then
      hpnum = hpnum - 1
      if Iframes == 0 then
        Iframes = 1
      end
    end
  end

  if Iframes == 1 then
    timerIFrames = 0.5
  end
  if timerIFrames > 0 then
   timerIFrames = timerIFrames - 0.0033
   Iframes = 2
  end
  if timerIFrames < 0 then
    timerIFrames = 0
    Iframes = 0
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
  if hpnum == 10 then
    love.graphics.draw(Hpfull, x, y - 20)
  end
  if hpnum == 9 then
    love.graphics.draw(Hp9, x, y - 20)
    end
  if hpnum == 8 then
    love.graphics.draw(Hp8, x, y - 20)
  end
  if hpnum == 7 then
    love.graphics.draw(Hp7, x, y - 20)
  end
  if hpnum == 6 then
    love.graphics.draw(Hp6, x, y - 20)
  end
  if hpnum == 5 then
    love.graphics.draw(Hp5, x, y - 20)
  end
  if hpnum == 4 then
    love.graphics.draw(Hp4, x, y - 20)
  end
  if hpnum == 3 then
    love.graphics.draw(Hp3, x, y - 20)
  end
  if hpnum == 2 then
    love.graphics.draw(Hp2, x, y - 20)
  end
  if hpnum == 1 then
    love.graphics.draw(Hp1, x, y - 20)
  end
  if hpnum == 0 then
    love.graphics.draw(Hpempty, x, y - 20)
  end
  if love.keyboard.isDown('down') == false then
    if love.keyboard.isDown('up') == false then
      if love.keyboard.isDown('left') == false then
        if love.keyboard.isDown('right') == false then
          if mirrorshatttered == false then
            if facingR == true then
              idle:draw(spritesheet, x, y)
              idle:draw(spritesheetM, mirrorx, mirrory)
            end
            if facingL == true then
              idle:draw(spritesheet, x, y, rotation, -1, 1, 64, 0)
              idle:draw(spritesheetM, mirrorx, mirrory, rotation, -1, 1, 64, 0)
            end
          end
          if mirrorshatttered == true then
            if facingR == true then
              idle:draw(spritesheet, x, y)
            end
            if facingL == true then
              idle:draw(spritesheet, x, y, rotation, -1, 1, 64, 0)
            end
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

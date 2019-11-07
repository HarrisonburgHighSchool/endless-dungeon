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
  lifelost = 0
  lives = 3
  bx = 600
  by = 128
  hitbox = 0
  hitboxtimer = 0
  cooldown = 0
  animtimer = 0
  bhp = 1

  spritesheet = love.graphics.newImage('hero/Old heroT.png')
  grid = anim8.newGrid(64, 64, spritesheet:getWidth(), spritesheet:getHeight())
  walk = anim8.newAnimation(grid('1-6', 2), 0.1)
  idle = anim8.newAnimation(grid('1-4', 1), 0.4)
  kick = anim8.newAnimation(grid('4-4', 3), 0.4)

  anim = idle

  spritesheetM = love.graphics.newImage('hero/Old hero M.png')
  grid = anim8.newGrid(64, 64, spritesheet:getWidth(), spritesheet:getHeight())
  walkm = anim8.newAnimation(grid('1-6', 2), 0.1)
  idlem = anim8.newAnimation(grid('1-4', 1), 0.4)
  kickm = anim8.newAnimation(grid('3-3', 3), 0.4)

  anim = idlem

  bannanaspritesheet = love.graphics.newImage('assets-1/enemies/bannana.png')
  grid = anim8.newGrid(64, 64, spritesheet:getWidth(), spritesheet:getHeight())
  idle1 = anim8.newAnimation(grid('1-4', 1), 0.4)

  rollinspritesheet = love.graphics.newImage('assets-1/enemies/rollin.png')
  grid = anim8.newGrid(88, 140, 1408, 1172)
  idle2 = anim8.newAnimation(grid('1-16', 1), 0.1)

  cobalt = love.graphics.newImage('assets-1/dungeon/floor/limestone_6.png')
  cobaltM = love.graphics.newImage('assets-1/dungeon/floor/limestone_6_flip.png')
  MirrorL = love.graphics.newImage('assets-1/dungeon/floor/limestone_6_mirror_left.png')
  MirrorR = love.graphics.newImage('assets-1/dungeon/floor/limestone_6_mirror_right.png')
  hole = love.graphics.newImage('assets-1/dungeon/floor/hole.png')
  wall = love.graphics.newImage('assets-1/dungeon/wall/catacombs_0.png')
  door = love.graphics.newImage('assets-1/dungeon/doors/vgate_open_right.png')
  Hpfull = love.graphics.newImage('assets-1/player/hp_bar/full.png')
  Hp9 = love.graphics.newImage('assets-1/player/hp_bar/9.png')
  Hp8 = love.graphics.newImage('assets-1/player/hp_bar/8.png')
  Hp7 = love.graphics.newImage('assets-1/player/hp_bar/7.png')
  Hp6 = love.graphics.newImage('assets-1/player/hp_bar/6.png')
  Hp5 = love.graphics.newImage('assets-1/player/hp_bar/5.png')
  Hp4 = love.graphics.newImage('assets-1/player/hp_bar/4.png')
  Hp3 = love.graphics.newImage('assets-1/player/hp_bar/3.png')
  Hp2 = love.graphics.newImage('assets-1/player/hp_bar/2.png')
  Hp1 = love.graphics.newImage('assets-1/player/hp_bar/critical.png')
  Hpempty = love.graphics.newImage('assets-1/player/hp_bar/empty.png')

  Lifecount3 = love.graphics.newImage('hero/life sheet 3.png')
  Lifecount2 = love.graphics.newImage('hero/life sheet 2.png')
  Lifecount1 = love.graphics.newImage('hero/life sheet 1.png')
  gameover = love.graphics.newImage('assets-1/player/hp_bar/game over.jfif')

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
  if love.keyboard.isDown('x') then   -- if the 'x' key is being pressed...
      if cooldown == 0 then
        kick:update(dt)
        if hitbox == 0 then
        hitbox = 1
      end
    end
  end 

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

  if hitbox == 1 or hitbox == 2 then
    if cc(mirrorx, y + 34, 16, 20, bx, by, w, h) then
      bhp = bhp - 1
    end
  end

  if bhp == 1 then
    if cc(mirrorx, mirrory, w, h, bx, by, w, h) then  
      if Iframes == 0 then
        hpnum = hpnum - 1
        if Iframes == 0 then
          Iframes = 1
        end
      end
    end
  end


  if Iframes == 1 then
    timerIFrames = 60
  end
  if timerIFrames > 0 then
   timerIFrames = timerIFrames - 1
   Iframes = 2
  end
  if timerIFrames < 1 then
    timerIFrames = 0
    Iframes = 0
  end
  if hpnum == 0 then
    lifelost = 1
  end

  if hitbox == 1 then
    hitboxtimer = 20
    animtimer = 20
  end
  if hitboxtimer > 0 then
    hitboxtimer = hitboxtimer - 1
    hitbox = 2
    anim = kick
  end
  if animtimer > 0 then
    animtimer = animtimer - 1
  end
  if hitboxtimer == 0 then
    hitbox = 0
  end
  if hitboxtimer == 1 then
    cooldown = 21
  end
  if cooldown > 0 then
    cooldown = cooldown - 1
  end
  if lifelost == 1 then
    lives = lives - 1
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
    w = 64
    h = 64
    timerIFrames = 0
    Iframes = 0
    lifelost = 0
  end
  if x > 864 then
    love.exitModule()
  end
  if animtimer == 1 or animtimer == 0 then
    if love.keyboard.isDown('up') == false then
      if love.keyboard.isDown('right') == false then
        if love.keyboard.isDown('left') == false then
          if love.keyboard.isDown('down') == false then
            anim = idle
          end
        end
      end
    end
  end
  idle:update(dt)
  idle1:update(dt)
  idle2:update(dt)
  if mirrorx > bx then
  bx = bx + 2
  end
  if mirrorx < bx then
    bx = bx - 2
    end
  if y > by then
  by = by + 2
  end
  if y < by then
    by = by - 2
  end
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
    love.graphics.draw(Hpfull, 415, 52)
  end
  if hpnum == 9 then
    love.graphics.draw(Hp9, 415, 52)
  end
  if hpnum == 8 then
    love.graphics.draw(Hp8, 415, 52)
  end
  if hpnum == 7 then
    love.graphics.draw(Hp7, 415, 52)
  end
  if hpnum == 6 then
    love.graphics.draw(Hp6, 415, 52)
  end
  if hpnum == 5 then
    love.graphics.draw(Hp5, 415, 52)
  end
  if hpnum == 4 then
    love.graphics.draw(Hp4, 415, 52)
  end
  if hpnum == 3 then
    love.graphics.draw(Hp3, 415, 52)
  end
  if hpnum == 2 then
    love.graphics.draw(Hp2, 415, 52)
  end
  if hpnum == 1 then
    love.graphics.draw(Hp1, 415, 52)
  end
  if hpnum == 0 then
    love.graphics.draw(Hpempty, 415, 52)
  end

  love.graphics.print(hitboxtimer, x - 20, y)
  love.graphics.print(animtimer, x - 20, y - 10)
if bhp == 1 then
  idle1:draw(bannanaspritesheet, bx, by)
end
  idle2:draw(rollinspritesheet, x + 90, y + 90)

if timerIFrames == 1 or timerIFrames == 2 or timerIFrames == 3 or timerIFrames == 4 or timerIFrames == 5 or timerIFrames == 6 or timerIFrames == 7 or timerIFrames == 8 or timerIFrames == 9 or timerIFrames == 10 or timerIFrames == 11 or timerIFrames == 12 or timerIFrames == 13 or timerIFrames == 14 or timerIFrames == 15 or timerIFrames == 16 or timerIFrames == 17 or timerIFrames == 21 or timerIFrames == 22 or timerIFrames == 23 or timerIFrames == 24 or timerIFrames == 25 or timerIFrames == 26 or timerIFrames == 27 or timerIFrames == 28 or timerIFrames == 29 or timerIFrames == 30 or timerIFrames == 31 or timerIFrames == 32 or timerIFrames == 33 or timerIFrames == 34 or timerIFrames == 35 or timerIFrames == 36 or timerIFrames == 37 or timerIFrames == 40 or timerIFrames == 41 or timerIFrames == 42 or timerIFrames == 43 or timerIFrames == 44 or timerIFrames == 45 or timerIFrames == 46 or timerIFrames == 47 or timerIFrames == 48 or timerIFrames == 49 or timerIFrames == 50 or timerIFrames == 51 or timerIFrames == 52 or timerIFrames == 53 or timerIFrames == 54 or timerIFrames == 55 or timerIFrames == 56 or timerIFrames == 57 or timerIFrames == 0 then
  if anim == idle then
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

if timerIFrames == 1 or timerIFrames == 2 or timerIFrames == 3 or timerIFrames == 4 or timerIFrames == 5 or timerIFrames == 6 or timerIFrames == 7 or timerIFrames == 8 or timerIFrames == 9 or timerIFrames == 10 or timerIFrames == 11 or timerIFrames == 12 or timerIFrames == 13 or timerIFrames == 14 or timerIFrames == 15 or timerIFrames == 16 or timerIFrames == 17 or timerIFrames == 21 or timerIFrames == 22 or timerIFrames == 23 or timerIFrames == 24 or timerIFrames == 25 or timerIFrames == 26 or timerIFrames == 27 or timerIFrames == 28 or timerIFrames == 29 or timerIFrames == 30 or timerIFrames == 31 or timerIFrames == 32 or timerIFrames == 33 or timerIFrames == 34 or timerIFrames == 35 or timerIFrames == 36 or timerIFrames == 37 or timerIFrames == 40 or timerIFrames == 41 or timerIFrames == 42 or timerIFrames == 43 or timerIFrames == 44 or timerIFrames == 45 or timerIFrames == 46 or timerIFrames == 47 or timerIFrames == 48 or timerIFrames == 49 or timerIFrames == 50 or timerIFrames == 51 or timerIFrames == 52 or timerIFrames == 53 or timerIFrames == 54 or timerIFrames == 55 or timerIFrames == 56 or timerIFrames == 57 or timerIFrames == 0 then
  if anim == walk then
    if mirrorshatttered == true then
      if facingR == true then
        walk:draw(spritesheet, x, y)
      end
      if facingL == true then
        walk:draw(spritesheet, x, y, rotation, -1, 1, 64, 0)
      end
    end
    if mirrorshatttered == false then
      if facingR == true then
          walk:draw(spritesheet, x, y)
          walkm:draw(spritesheetM, mirrorx, mirrory)
      end
      if mirrorshatttered == false then
        if facingL == true then
          walk:draw(spritesheet, x, y, rotation, -1, 1, 64, 0) 
          walkm:draw(spritesheetM, mirrorx, mirrory, rotation, -1, 1, 64, 0)  
        end
      end
    end
  end
end

if timerIFrames == 1 or timerIFrames == 2 or timerIFrames == 3 or timerIFrames == 4 or timerIFrames == 5 or timerIFrames == 6 or timerIFrames == 7 or timerIFrames == 8 or timerIFrames == 9 or timerIFrames == 10 or timerIFrames == 11 or timerIFrames == 12 or timerIFrames == 13 or timerIFrames == 14 or timerIFrames == 15 or timerIFrames == 16 or timerIFrames == 17 or timerIFrames == 21 or timerIFrames == 22 or timerIFrames == 23 or timerIFrames == 24 or timerIFrames == 25 or timerIFrames == 26 or timerIFrames == 27 or timerIFrames == 28 or timerIFrames == 29 or timerIFrames == 30 or timerIFrames == 31 or timerIFrames == 32 or timerIFrames == 33 or timerIFrames == 34 or timerIFrames == 35 or timerIFrames == 36 or timerIFrames == 37 or timerIFrames == 40 or timerIFrames == 41 or timerIFrames == 42 or timerIFrames == 43 or timerIFrames == 44 or timerIFrames == 45 or timerIFrames == 46 or timerIFrames == 47 or timerIFrames == 48 or timerIFrames == 49 or timerIFrames == 50 or timerIFrames == 51 or timerIFrames == 52 or timerIFrames == 53 or timerIFrames == 54 or timerIFrames == 55 or timerIFrames == 56 or timerIFrames == 57 or timerIFrames == 0 then
  if anim == kick then
    if mirrorshatttered == false then
      if facingR == true then
        kick:draw(spritesheet, x, y)
        kickm:draw(spritesheetM, mirrorx, mirrory)
      end
      if facingL == true then
        kick:draw(spritesheet, x, y, rotation, -1, 1, 64, 0)
        kickm:draw(spritesheetM, mirrorx, mirrory, rotation, -1, 1, 64, 0)
      end
    end
    if mirrorshatttered == true then
      if facingR == true then
        kick:draw(spritesheet, x, y)
      end
      if facingL == true then
        kick:draw(spritesheet, x, y, rotation, -1, 1, 64, 0)
      end
    end
  end
end

  if lives == 3 then
    love.graphics.draw(Lifecount3, 50, 52)
  end
  if lives == 2 then
    love.graphics.draw(Lifecount2, 50, 52)
  end
  if lives == 1 then
    love.graphics.draw(Lifecount1, 50, 52)
  end
  if lives == 0 then
    love.graphics.draw(gameover, 48, 52)
  end
  end)
end

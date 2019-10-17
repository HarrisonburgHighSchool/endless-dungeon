local Map = require 'core/map'
local Entity = require 'core/entity'
local gamera = require 'core/gamera'
local Util = require 'core/util'
local anim8 = require 'core/anim8'

function love.load()
  G = love.math.random(-3, 4);
  H = love.math.random(-3, 4);
  x = 400
  y = 300
  l = 0
  t = 0
  w = 0
  h = 0
  X1 = 400
  Y1 = 300
  X2 = 415
  Y2 = 280
  playerImg = love.graphics.newImage('assets-1/player/base/octopode_1.png')
  w = 64
  h = 64
  hp = 100





  ex = 100
  ey = 100
  dir = 'left'
  eimg = love.graphics.newImage('assets-1/player/base/octopode_2.png')


  spritesheet = love.graphics.newImage('hero/Old hero.png')
  grid = anim8.newGrid(16, 16, spritesheet:getWidth(), spritesheet:getHeight())
  swim = anim8.newAnimation(grid('1-6', 4), 0.065)


  M = love.sound.newSoundData('assets-1/Music1.mp3')
  gate = love.graphics.newImage('assets-1/dungeon/gateways/enter_depths.png')
  c = love.graphics.newImage('assets-1/dungeon/floor/black_cobalt_9.png')
  c2 = love.graphics.newImage('assets-1/dungeon/floor/cage_3.png')
  c3 = love.graphics.newImage('assets-1/dungeon/floor/green_bones_12.png')
  ent = love.graphics.newImage('assets-1/monster/boggart.png')
  love.graphics.setDefaultFilter('linear', 'nearest')

  cam = gamera.new(0, 0, 1000, 1000)

  mapTemplate = {
    {c, c2, c, c2, c3, c3, c2, c, c2, c, c, c2, c, c2, c2, c, c2},
    {c2, c, c2, c2, c, c, c2, c2, c, c2, c2, c, c2, c2, c, c, c2},
    {c, c2, c, c2, c3, c3, c2, c, c2, c, c, c2, c, c2, c2, c, c2},
    {c2, c, c2, c2, c, c, c2, c2, c, c2, c2, c, c2, c2, c, c, c2},
    {c, c2, c, c2, c3, c3, c2, c, c2, c, c, c2, c, c2, c2, c, c2},
    {c2, c, c2, c2, c, c, c2, c2, c, c2, c2, c, c2, c2, c, c, c2},
    {c, c2, c, c2, c3, c3, c2, c, c2, c, c, c2, c, c2, c2, c, c2},
    {c2, c, c2, c2, c, c, c2, c2, c, c2, c2, c, c2, c2, c, c, c2},
    {c, c2, c, c2, c3, c3, c2, c, c2, c, c, c2, c, c2, c2, c, c2},
    {c2, c, c2, c2, c, c, c2, c2, c, c2, c2, c, c2, c2, c, c, c2},
    {c, c2, c, c2, c3, c3, c2, c, c2, c, c, c2, c, c2, c2, c, c2},
    {c2, c, c2, c2, c, c, c2, c2, c, c2, c2, c, c2, c2, c, c, c2},
    {c, c2, c, c2, c3, c3, c2, c, c2, c, c, c2, c, c2, c2, c, c2},
    {c, c2, c, c2, c3, c3, c2, c, c2, c, c, c2, c, c2, c2, c, c2},
    {c2, c, c2, c2, c, c, c2, c2, c, c2, c2, c, c2, c2, c, c, c2},
    {c, c2, c, c2, c3, c3, c2, c, c2, c, c, c2, c, c2, c2, c, c2},
  }

  entity = Entity:new(ent, 100, 200)
  map = Map:new(mapTemplate)


  --background = Map:new(background)
end




function love.update(dt)


  cam:setPosition(x, y)




  swim:update(dt)

  if love.keyboard.isDown('right') and x < 940 then
    if cc(x+5, y, 64, 64, 400, 570, 64, 64) == false then
  x = x + 5
  X1 = X1 + 5
  X2 = X2 + 5
  end
end

  if love.keyboard.isDown('left') and x > 0 then
    if cc(x-5, y, 64, 64, 400, 570, 64, 64) == false then
  x = x - 5
  X1 = X1 - 5
  X2 = X2 - 5
  end


end











  if love.keyboard.isDown('up') and y > -5 then
    if cc(x, y-5, 64, 64, 400, 570, 64, 64) == false then
  y = y - 5
  Y1 = Y1 - 5
  Y2 = Y2 - 5
  end
end


  if love.keyboard.isDown('down') and y < 945 then
    if cc(x, y+5, 64, 64, 400, 570, 64, 64) == false then
  y = y + 5
  Y1 = Y1 + 5
  Y2 = Y2 + 5
  end
end

  if cc(x, y, w, h,   385, 190, 64, 64) then
      x = x - 3000
    end

  if cc(x, y, w, h,   321, 190, 64, 64) then
      hp = hp - 1
    end
  if cc(x, y, w, h,   449, 190, 64, 64) then
        hp = hp - 1
    end


   if x > ex then
    ex = ex + 3
    end

    if x < ex then
     ex = ex - 3
   end

    if y > ey then
      ey = ey + 3
    end

    if y < ey then
      ey = ey - 3
    end

    if ex > x - 3 and ex < x + 3 and ey > y - 3 and ex < y + 3 then
      hp = hp - 1
    end

  --  if cc(x, y, 64, 64,   300, 400, 40, 40) == true then


    --end



  --  if ey < 200 then
  --    dir = 'up'
  --  end

    --if ey > 800 then
  ---    dir = 'down'
    --end

    --if dir == 'up'  then
  --    ey = ey + 3
  --  end

  ---  if dir == 'down'  then
  --    ey = ey - 3
    --end



  --  if ex < 200 then
    --  dir = 'left'
  --  end

  --  if ex > 800 then
    --  dir = 'right'
  --  end

  --  if dir == 'left'  then
    --  ex = ex + 3
  --  end

  ----  if dir == 'right'  then
    --  ex = ex - 3
  --  end

  entity.x = entity.x +- G
  entity.y = entity.y +- H

  if x < 250 and x > 150 and y < 240 and y > 140 then
    y = y + 200
    x = x + 400
end

if x < 650 and x > 550 and y < 650 and y > 550 then
  y = y - 600
  x = x - 600
end

if x < 850 and x > 750 and y < 50 and y > 0 then
  y = 550
  x = 380
end

end

function love.draw()


  if (hp > 0) then
  cam:draw(function(l, t, w, h)

  map:draw()

  entity:draw();

  swim:draw(spritesheet, 500, 300, 12 ,12)
  love.graphics.print('Level 1, Practice Level!', 0, 0)
  love.graphics.draw(ent, 400, 130)
--  if (hp > 0) then   -- kill the player
  love.graphics.draw(playerImg, x, y)

  love.graphics.print(hp, x + 18, y - 15)
--end



  love.graphics.draw(eimg, ex, ey)
  love.graphics.draw(gate, 400, 570)
  love.graphics.rectangle('line', 200, 190, 63, 63)
  love.graphics.rectangle('line', 600, 600, 63, 63)
  love.graphics.rectangle('line', 800, 0, 63, 63)

  love.graphics.print('I will Eat You!!!', ex - 10, ey - 10)

  love.graphics.print('True Road Is At          /!', 450, 250, 6, 3)

  love.graphics.rectangle('line', 385, 190, 64, 64)
  love.graphics.rectangle('line', 321, 190, 64, 64)
  love.graphics.rectangle('line', 449, 190, 64, 64)

  end)

end

end

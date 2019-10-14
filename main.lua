local Map = require 'core/map'
local Entity = require 'core/entity'
local gamera = require 'core/gamera'
local Util = require 'core/util'


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


  cam:setPosition(X1, Y1)


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
      hp = hp - 1
    end

  if cc(x, y, w, h,   321, 190, 64, 64) then
      hp = hp - 1
    end
  if cc(x, y, w, h,   449, 190, 64, 64) then
        hp = hp - 1
    end






  entity.x = entity.x +- G
  entity.y = entity.y +- H



end

function love.draw()



  cam:draw(function(l, t, w, h)

  map:draw()

  entity:draw();

  love.graphics.print('Level 1, Practice Level!', 0, 0)
  love.graphics.draw(ent, 400, 130)
  if (hp > 0) then
  love.graphics.draw(playerImg, x, y)
  love.graphics.print(hp, X2, Y2)
end
  love.graphics.draw(gate, 400, 570)

  love.graphics.rectangle('line', 385, 190, 64, 64)
  love.graphics.rectangle('line', 321, 190, 64, 64)
  love.graphics.rectangle('line', 449, 190, 64, 64)

  end)

end

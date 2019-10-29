           local Map = require 'core/map'
local gamera = require 'core/gamera'
function love.load()

  cam = gamera.new(0, 0, 2000, 2000) --


  ex = 100
  ey = 100
  eimg = love.graphics.newImage('assets-1/player/base/octopode_4.png')


  x = 400
  y = 300
  w = 64
  h = 64

  playerImg = love.graphics.newImage('assets-1/player/base/octopode_1.png')

  floorTile = love.graphics.newImage('assets-1/dungeon/floor/floor_nerves_1.png')
    altar     = love.graphics.newImage('assets-1/dungeon/floor/infernal_10.png')
    template = { --a 3 x 3 map with the altar texture in the middle


          {floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile},
          {floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile},
          {floorTile, floorTile, floorTile , floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile},
          {floorTile, floorTile, floorTile , floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile},
          {floorTile, floorTile, floorTile , floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile},
          {floorTile, floorTile, floorTile , floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile},
          {floorTile, floorTile, floorTile , floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile},
          {floorTile, floorTile, floorTile , floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile},
          {floorTile, floorTile, floorTile , floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile},
          {floorTile, floorTile, floorTile , floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile},
          {floorTile, floorTile, floorTile , floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile},
          {floorTile, floorTile, floorTile , floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile},
          {floorTile, floorTile, floorTile , floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile},
          {floorTile, floorTile, floorTile , floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile},
          {floorTile, floorTile, floorTile , floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile},
          {floorTile, floorTile, floorTile , floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile},
          {floorTile, floorTile, floorTile , floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile},
          {floorTile, floorTile, floorTile , floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile},
          {floorTile, floorTile, floorTile , floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile},
          {floorTile, floorTile, floorTile , floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile},
          {floorTile, floorTile, floorTile , floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile},
          {floorTile, floorTile, floorTile , floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile},
          {floorTile, floorTile, floorTile , floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile},
          {floorTile, floorTile, floorTile , floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile},
          {floorTile, floorTile, floorTile , floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile},
          {floorTile, floorTile, floorTile , floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile},
          {floorTile, floorTile, floorTile , floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile},
          {floorTile, floorTile, floorTile , floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile},
          {floorTile, floorTile, floorTile , floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile},
          {floorTile, floorTile, floorTile , floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile},
          {floorTile, floorTile, floorTile , floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile},
          {floorTile, floorTile, floorTile , floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile},
          {floorTile, floorTile, floorTile , floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile},
          {floorTile, floorTile, floorTile , floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile},
          
}

wall = {
  {altar, altar, altar, altar, altar, altar, altar, altar, altar},
  {altar, 'nil', 'nil', altar, 'nil', 'nil', 'nil', 'nil'},
  {altar, 'nil', 'nil', altar, 'nil', 'nil', 'nil', 'nil'}
}



  collision = Map:new(wall)
    map = Map:new(template)
    cam = gamera.new(-100, -100, 2000, 2000)
  end


  function love.update(dt)

  if collision:cc(x,y-5,w,h, 0,0,64,64) == false then
    if love.keyboard.isDown('up')then
        y=y-5
        cam:setPosition(x, y)
    end
   end
  if collision:cc(x,y+5,w,h) == false then

     if love.keyboard.isDown('down')then
      y=y+5
      cam:setPosition(x, y)
    end
  end

  if collision:cc(x-5,y,w,h) == false then

    if love.keyboard.isDown('left')then
      x=x-5
      cam:setPosition(x, y)
    end
  end

   if collision:cc(x+5,y,w,h, 0,0,64,64) == false then
   if love.keyboard.isDown('right')then
      x=x+5
      cam:setPosition(x, y)
    end
   end


if x > ex then
  ex = ex + 3
end

if x < ex then
  ex = ex - 3
end


if y < ey then
  ey = ey - 3
end

if y > ey then
  ey = ey + 3
end


end

function love.draw()

  cam:draw(function(l, t, w, h)

    map:draw()
    collision:draw()
    love.graphics.print('Hello, Mustafa!', 0, 0)
    love.graphics.draw(playerImg, x, y)
    love.graphics.draw(eimg, ex, ey)



love.graphics.rectangle('line', 100, 300, 64, 64)
love.graphics.rectangle('line', 200, 300, 64, 64)
love.graphics.rectangle('line', 300, 300, 64, 64)



  end)






end

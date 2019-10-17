local Map = require 'core/map'
local gamera = require 'core/gamera'
local Util = require 'core/util'

function love.load()
  cam = gamera.new(0, 0, 2000, 2000)
  a = 100
  b = 100
  x = 400
  y = 300
  ex = 100
  ey = 100
  playerImg1 = love.graphics.newImage('assets-1/dungeon/trees/mangrove_1.png')
  w = 64   -- The player's width is 64
  h = 64   -- The player's height is 64
  hp = 100 -- Set the player's HP to 100 at the start of the game
  playerImg2 = love.graphics.newImage('assets-1/player/base/octopode_1.png')
  eimg = love.graphics.newImage('assets-1/player/base/octopode_2.png')
  floorTile = love.graphics.newImage('assets-1/dungeon/floor/bog_green_1.png')
  wall     = love.graphics.newImage('assets-1/dungeon/wall/hell_5.png')
 template = { --a 3 x 3 map with the altar texture in the middle
              {wall, wall, wall, wall, wall, wall, wall, wall, wall, wall},
              {wall, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, wall},
              {wall, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, wall},
              {wall, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, wall},
              {wall, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, wall},
              {wall, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, wall},
              {wall, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, wall},
              {wall, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, wall},
              {wall, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, wall},
              {wall, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, wall},
              {wall, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, wall},
              {wall, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, wall},
              {wall, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, wall},
              {wall, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, wall},
              {wall, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, wall},
              {wall, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, wall},
              {wall, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, wall},
              {wall, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, wall},
              {wall, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, wall},
              {wall, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, wall},
              {wall, wall, wall, wall, wall, wall, wall, wall, wall, wall},

            }
 map = Map:new(template)
end



function love.update(dt)

  if x < 0 then
    x = 0
  end
  if y < 0 then
    y = 0
  end
  if y > 540 then
    y = 540
  end
  if x > 1250 then
    x = 1250
  end
  if a < 0 then
    a = 0
  end
  if b < 0 then
    b = 0
  end
  if b > 540 then
    b = 540
  end
  if a > 1250 then
    a = 1250
  end
  if ex < 0 then
    ex = 0
  end
  if ey < 0 then
    ey = 0
  end
  if ey > 540 then
    ey = 540
  end
  if ex > 1250 then
    ex = 1250
  end

  cam:setPosition(x, y)

  if love.keyboard.isDown('right') then
    x = x + 8
  end
  if love.keyboard.isDown('left') then
      x = x - 8
    end
    if love.keyboard.isDown('down') then
        y = y + 8
      end
    if love.keyboard.isDown('up') then
          y = y - 8
        end

        if love.keyboard.isDown('d') then
          a = a + 8
        end
        if love.keyboard.isDown('a') then
            a = a - 8
          end
          if love.keyboard.isDown('s') then
              b = b + 8
            end
          if love.keyboard.isDown('w') then
                b = b - 8
              end
          if love.keyboard.isDown('right') then
                ex = ex + 8
              end
         if love.keyboard.isDown('left') then
           ex = ex - 8
         end
         if love.keyboard.isDown('down') then
           ey = ey + 8
         end
         if love.keyboard.isDown('up') then
           ey = ey - 8
         end
       end
  if cc(x, y, w, h,   0, 0, 64, 64) then
    hp = hp - 1
  end


function love.draw()

    cam:draw(function(l, t, w, h)
      map:draw()
      love.graphics.draw(playerImg1, x, y)
      love.graphics.rectangle('line', 0, 0, 64, 64)
      love.graphics.print(hp, 0, 0)
      -- Draw the enemy
      love.graphics.draw(eimg, ex, ey)

      love.graphics.print('Hello, world!', 0, 0)
      love.graphics.draw(playerImg2, a, b)
  end)
end

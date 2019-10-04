local Map = require 'core/map'
local gamera = require 'core/gamera'

function love.load()
  cam = gamera.new(0, 0, 2000, 2000)
  a = 100
  b = 100
  x = 400
  y = 300
  playerImg = love.graphics.newImage('assets-1/dungeon/trees/mangrove_1.png')
  playerImg2 = love.graphics.newImage('assets-1/player/base/octopode_1.png')
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
  if love.keyboard.isDown('right') then
    x = x + 1
  end
  if love.keyboard.isDown('left') then
      x = x - 1
    end
    if love.keyboard.isDown('down') then
        y = y + 1
      end
    if love.keyboard.isDown('up') then
          y = y - 1
        end

        if love.keyboard.isDown('d') then
          a = a + 1
        end
        if love.keyboard.isDown('a') then
            a = a - 1
          end
          if love.keyboard.isDown('s') then
              b = b + 1
            end
          if love.keyboard.isDown('w') then
                b = b - 1
              end
cam:setPosition(x, y)
end

function love.draw()
  cam:draw(function(l, t, w, h)
     map:draw()
    love.graphics.print('Hello, world!', 0, 0)
    love.graphics.draw(playerImg, x, y)
    love.graphics.draw(playerImg2, a, b)
  end)
end

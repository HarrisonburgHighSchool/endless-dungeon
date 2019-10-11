local Map = require 'core/map'
local gamera = require 'core/gamera'
local Util = require 'core/util'
function love.load()
  x = 400
  y = 300
  a = 400
  b = 300
  playerImg = love.graphics.newImage('assets-1/player/base/octopode_1.png')
  w = 64   -- The player's width is 64
  h = 64   -- The player's height is 64
  hp = 100 -- Set the player's HP to 100 at the start of the game
  playerImg1 = love.graphics.newImage('assets-1/player/base/tengu_wingless_brown_male.png')

    floorTile = love.graphics.newImage('assets-1/dungeon/floor/black_cobalt_5.png')
    altar     = love.graphics.newImage('assets-1/dungeon/floor/cage_3.png')
    template = { --a 3 x 3 map with the altar texture in the middle
                 {floorTile, floorTile, floorTile,floorTile, floorTile, floorTile,floorTile, floorTile, floorTile,floorTile,},
                 {floorTile, altar, altar,altar, altar, altar,altar, altar, altar,floorTile, altar,},
                 {floorTile, altar, floorTile,floorTile, floorTile, floorTile,floorTile, floorTile, altar,floorTile, },
                 {floorTile, altar, floorTile,floorTile, floorTile, floorTile,floorTile, floorTile, altar,floorTile, },
                 {floorTile,  altar, floorTile,floorTile,  floorTile, floorTile,floorTile, floorTile, altar,floorTile, },
                 {floorTile, altar, floorTile,floorTile, floorTile, floorTile, floorTile, floorTile, altar,floorTile, },
                 {floorTile, altar, floorTile,floorTile, floorTile, floorTile,floorTile, floorTile, altar,floorTile, },
                 {floorTile, altar, floorTile,floorTile, floorTile, floorTile,floorTile, floorTile, altar,floorTile, },
                 {floorTile, altar, floorTile,floorTile, floorTile, floorTile,floorTile, floorTile, altar,floorTile, },
                 {floorTile, altar, floorTile,floorTile, floorTile, floorTile,floorTile, floorTile, altar,floorTile, },
                 {floorTile, altar, floorTile,floorTile, floorTile, floorTile,floorTile, floorTile, altar,floorTile, },
                 {floorTile, altar, floorTile,floorTile, floorTile, floorTile,floorTile, floorTile, altar,floorTile, },
                 {floorTile, altar, altar,altar, altar, altar,altar, altar, altar,floorTile, },
                 {floorTile, floorTile, floorTile,floorTile, floorTile, floorTile,floorTile, floorTile, floorTile,floorTile,}
               }
    map = Map:new(template)
cam = gamera.new(-100, -100, 2000, 2000)

end




function love.update(dt)

  mapc = map:cc(x, y, 64, 64)
  debug = tostring(mapc)
  if love.keyboard.isDown('right') then
    if map:cc(x + 1, y, 64, 64) == false then
      x = x + 1
    end
  end
  if love.keyboard.isDown('left') then
    if map:cc(x - 1, y, 64, 64) == false then
      x = x - 1
    end
  end
  if love.keyboard.isDown('up') then
    if map:cc(x, y-1, 64, 64) == false then
      y = y - 1
    end
  end
  if love.keyboard.isDown('down') then
    if map:cc(x, y+1, 64, 64) == false then
      y = y + 1
    end
  end


end
 if love.keyboard.isDown('a')then
 a = a - 5
 cam:setPosition(a,b)
 end





function love.draw()
  map:draw()
  love.graphics.draw(playerImg, x, y)
  love.graphics.print(tostring(mapc), 0, 0)
end

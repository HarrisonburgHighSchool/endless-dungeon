local Map = require 'core/map'
local gamera = require 'core/gamera'
local Util = require 'core/util'
function love.load()
  x = 400
  y = 300
  a = 400
  b = 300
  playerImg = love.graphics.newImage('assets-1/player/base/octopode_1.png')
  playerImg1 = love.graphics.newImage('assets-1/player/base/gargoyle_female.png')
  ex = 200
  ey = 200
  enemyimg = love.graphics.newImage('assets-1/player/base/octopode_2.png')
  w = 64   -- The player's width is 64
  h = 64   -- The player's height is 64
  hp = 100 -- Set the player's HP to 100 at the start of the game

    floorTile = love.graphics.newImage('assets-1/dungeon/floor/black_cobalt_1.png')
    altar     = love.graphics.newImage('assets-1/dungeon/floor/cage_5.png')
    ground    = love.graphics.newImage('assets-1/dungeon/floor/sand_1.png')
    obstacle  = love.graphics.newImage('assets-1/dungeon/altars/ashenzari.png')
    obstacle1 = love.graphics.newImage('assets-1/dungeon/traps/shadow.png')
    Item      = love.graphics.newImage('assets-1/item/misc/runes/rune_spider.png')
    template = {
                  {floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile},
                  {floorTile, altar, altar, altar, altar, altar, altar, altar, altar, floorTile},
                  {floorTile, altar, ground, ground, ground, ground, ground, ground, altar, floorTile},
                  {floorTile, altar, ground, ground, ground, ground, ground, ground, altar, floorTile},
                  {floorTile, altar, ground, ground, ground, ground, ground, ground,  altar, floorTile},
                  {floorTile, altar, ground, ground, ground, ground, ground, ground, altar, floorTile},
                  {floorTile, altar, ground, ground, ground, ground, ground, ground, altar, floorTile},
                  {floorTile, altar, ground, ground, ground, ground, ground, ground, altar, floorTile},
                  {floorTile, altar, ground, ground, ground, ground, ground, ground, altar, floorTile},
                  {floorTile, altar, ground, ground, ground, ground, ground, ground, altar, floorTile},
                  {floorTile, altar, ground, ground, ground, ground, ground, ground, altar, floorTile},
                  {floorTile, altar, ground, ground, ground, ground, ground, ground, altar, floorTile},
                  {floorTile, altar, altar, altar, altar, altar, altar, altar, altar, floorTile},
                  {floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile},
                }
                -- Create the background map
                floor = love.graphics.newImage('assets-1/dungeon/floor/black_cobalt_1.png')
                background = {
                  {floor, floor, floor, floor},
                  {floor, floor, floor, floor},
                  {floor, floor, floor, floor},
                  {floor, floor, floor, floor},
                }
                -- Create the collision map, with walls around the edge of the map
                wall = love.graphics.newImage('assets-1/dungeon/wall/catacombs_1.png')
                collision = {
                  {wall, 'nil', 'nil', 'nil', Item, Item, 'nil', 'nil', 'nil', wall},
                  {wall, wall, wall, wall, 'nil', 'nil', wall, wall, wall, wall},
                  {wall, obstacle, 'nil', obstacle1, 'nil', 'nil', obstacle1, 'nil', obstacle, wall},
                  {wall, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', wall},
                  {wall, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', wall},
                  {wall, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', wall},
                  {wall, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', wall},
                  {wall, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', wall},
                  {wall, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', wall},
                  {wall, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', wall},
                  {wall, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', wall},
                  {wall, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', wall},
                  {wall, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', wall},
                  {wall, obstacle, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', obstacle, wall},
                  {wall, wall, wall, wall, 'nil', 'nil', wall, wall, wall, wall},
                  {'nil', 'nil', 'nil', wall, obstacle1, obstacle1, wall, 'nil', 'nil', 'nil'},
                  {'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil'}
                  }
                background = Map:new(background)
                collision = Map:new(collision)
                map = Map:new(template)
                cam = gamera.new(-100, -100, 2000, 2000)
                img = love.graphics.newImage('assets-1/player/base/octopode_1.png')
                x = 400
                y = 300
end

function love.update(dt)
  if cc(x, y, 50, 50, 64, 64, 64,64) then
    love.exitModule()
  end
  player2()
  if love.keyboard.isDown('up')then
    if collision:cc(x, y - 10, 50, 50) == false then
     y = y - 10
     cam:setPosition(x, y)
    end
  end
  if love.keyboard.isDown('down')then
    if collision:cc(x, y + 10, 50, 50) == false then
     y = y + 10
     cam:setPosition(x, y)
    end
  end
  if love.keyboard.isDown('right')then
    if collision:cc(x + 10, y, 50, 50) == false then
     x = x + 10
     cam:setPosition(x, y)
    end
  end
  if love.keyboard.isDown('left')then
    if collision:cc(x - 10 , y, 50, 50) == false then
     x = x - 10
     cam:setPosition(x, y)
    end
  end
   if cc(x, y, 64, 64, ex, ey, 64, 64) then
      hp = hp - 0.5
  end
  if ex < x then
   if collision:cc(ex + 1, ey, 64, 64) == false then
      ex = ex + 1
   end
 end
if ex > x then
   if collision:cc(ex - 1 , ey, 64, 64) == false then
     ex = ex - 1
   end
 end
if ey > y then
    if collision:cc(ex, ey - 1, 64, 64) == false then
      ey = ey - 1
    end
  end
  if ey < y then
    if collision:cc(ex, ey + 1, 64, 64) == false then
      ey = ey + 1
    end
  end
  if hp == 0 then
    love.exitModule()
  end
  if love.keyboard.isDown('escape') then
    love.exitModule()
  end
end
function player2()
    if b < y then
     if collision:cc(a, b + 4, 64, 64) == false then
        b = b + 4
      end
    end
    if b > y then
       if collision:cc(a, b - 4, 64, 64) == false then
          b = b - 4
      end
    end
    if a < x then
       if collision:cc(a + 4, b, 64, 64) == false then
          a = a + 4
      end
    end
    if a > x then
       if collision:cc(a - 4, b, 64, 64) == false then
          a = a - 4
      end
    end
    if cc(a, b, 64, 64, ex, ey, 64, 64) then
      hp = hp - 0.5
    end

end


function love.draw()
  cam:draw(function(l, t, w, h)
    map:draw()
    love.graphics.draw(playerImg, x, y)
    love.graphics.draw(playerImg1, a, b)
    love.graphics.print(hp, x, y)
    love.graphics.rectangle('line', 0, 0, 64, 64)
    love.graphics.print(hp, 0, 0)
    love.graphics.draw(playerImg1, a, b)
    love.graphics.rectangle('line', 0, 0, 64, 64)
    love.graphics.print(hp, 0, 0)
    --background:draw()
    collision:draw()
    love.graphics.draw(enemyimg, ex, ey)
    love.graphics.rectangle('line', 0, 0, 64, 64)
    love.graphics.print(hp, 0, 0)
    love.graphics.draw(Item, 64, 64)
  end)
end

function love.keypressed(key)
  if key == 'escape' then
    love.exitModule()
  end
end

local Map = require 'core/map'
local gamera = require 'core/gamera'
local Util = require 'core/util'
local Entity = require 'core/entity'


function love.load()

  speed = 1.6


  cam = gamera.new(0, 0, 1250, 1000)
  x = 100
  y = 100
  open = false
  playerImg = love.graphics.newImage('assets-1/monster/knight.png')
  w = 63
  h = 60
  hp = 100
  --a = 470
  --b = 400
  Img3 = love.graphics.newImage('assets-1/monster/juggernaut.png')
  ex = 520
  ey = 550
  dir = 'right'
  e = 64
  d = 64
  Img4 = love.graphics.newImage('assets-1/monster/EvilKnight.png')
  ax = 320
  ay = 895
  dir2 = 'right'
  Img5 = love.graphics.newImage('assets-1/monster/hello.png')
  rx = 500
  ry = 820
  dir3 = 'right'
  f = 64
  g = 64

  Food = love.graphics.newImage('assets-1/item/food/apricot.png')
foodx = 750
foody = 550



BossImg = love.graphics.newImage('assets-1/monster/Boss.png')
bx = 700
by = 160
  portal = love.graphics.newImage('assets-1/effect/cloud_neg_2.png')

  openDoor = love.graphics.newImage('assets-1/dungeon/doors/vgate_open_up.png')
closedDoor = love.graphics.newImage('assets-1/dungeon/doors/runed_door.png')
switch = love.graphics.newImage('assets-1/dungeon/altars/cheibriados.png')
dx = 1080
dy = 500
currentDoor = closedDoor




  crypt = love.graphics.newImage('assets-1/dungeon/floor/crypt_domino_5a.png')
  floorTile = love.graphics.newImage('assets-1/dungeon/floor/rect_gray_0.png')
  altar     = love.graphics.newImage('assets-1/dungeon/floor/mesh_3.png')
  template = { --a 3 x 3 map with the altar texture in the middle
       {floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile},
       {floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile},
       {floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile},
       {floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile},
       {floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile},
       {floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile},
       {floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile},
       {floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile},
       {floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile},
       {floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile},
       {floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile,},
       {floorTile, altar, floorTile, altar, floorTile, altar, floorTile, altar, floorTile, altar, floorTile, altar, floorTile, altar, floorTile, altar, floorTile, altar, floorTile, altar, floorTile, altar, floorTile, altar, floorTile, altar},
       {floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile},
       {floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile},
       {floorTile, altar, floorTile, altar, floorTile, altar, floorTile, altar, floorTile, altar, floorTile, altar, floorTile, altar, floorTile, altar, floorTile, altar, floorTile, altar, floorTile, altar, floorTile, altar, floorTile, altar, floorTile, altar, floorTile, altar},
       {floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile},
       {floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile},
       {floorTile, altar, floorTile, altar, floorTile, altar, floorTile, altar, floorTile, altar, floorTile, altar, floorTile, altar, floorTile, altar, floorTile, altar, floorTile, altar, floorTile, altar, floorTile, altar, floorTile, altar, floorTile, altar, floorTile, altar},
       {floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile},
       {floorTile, altar, floorTile, altar, floorTile, altar, floorTile, altar, floorTile, altar, floorTile, altar, floorTile, altar, floorTile, altar, floorTile, altar, floorTile, altar, floorTile, altar, floorTile, altar, floorTile, altar, floorTile, altar, floorTile, altar},

             }
  map = Map:new(template)

wall = love.graphics.newImage('assets-1/dungeon/wall/catacombs_2.png')
walls = {
  {wall, wall, wall, wall, wall, wall, wall, wall, wall, wall, wall, wall, wall, wall, wall, wall, wall, wall},
  {wall, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', wall},
  {wall, 'nil' ,'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', wall},
  {wall, wall, wall, wall, wall, wall, wall, wall, wall, wall, wall, wall, wall, 'nil', 'nil' ,wall, wall, wall},
  {wall, wall, wall, wall, wall, wall, wall, wall, wall, wall, wall, wall, wall, 'nil', 'nil', wall, wall, wall},
  {wall, wall, wall, wall, wall, wall, wall, wall, wall, wall, wall, wall, wall, 'nil', 'nil', wall, wall, wall},
  {wall, wall, wall, wall, wall, wall, wall, wall, wall, wall, wall, wall, wall, 'nil', 'nil', wall, wall, wall},
  {wall, 'nil', 'nil', 'nil', 'nil', wall, wall, wall, 'nil', 'nil','nil', wall, wall, 'nil', 'nil', wall, wall, wall},
  {wall, 'nil', 'nil', 'nil', 'nil', wall, wall, wall, 'nil', 'nil', 'nil', wall, wall, 'nil', 'nil', wall, wall, wall},
  {wall, 'nil', 'nil', 'nil', 'nil', wall, wall, wall, 'nil', 'nil', 'nil', wall, wall, 'nil', 'nil', wall, wall, wall},
  {wall, 'nil', 'nil', 'nil', 'nil', wall, wall, wall, 'nil', 'nil', 'nil', wall, wall, 'nil', 'nil', wall, wall, wall},
  {wall, 'nil', 'nil', 'nil', 'nil', wall, wall, wall, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', wall, wall, wall},
  {wall, 'nil', 'nil', 'nil', 'nil', wall, wall, wall, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', wall, wall, wall},
  {wall, 'nil', 'nil', 'nil', 'nil', wall, wall, wall, wall, wall, wall, wall, wall, 'nil', 'nil', wall, wall, wall},
  {wall, 'nil', 'nil', 'nil', 'nil', wall, wall, wall, wall, wall, wall, wall, wall, 'nil', 'nil', wall, wall, wall},
  {wall, 'nil', 'nil', wall, wall, wall, wall, wall, wall, wall, wall, wall, wall, 'nil', 'nil', wall, wall, wall},
  {wall, 'nil', 'nil', wall, wall, wall, wall, wall, wall, wall, wall, wall, wall, 'nil', 'nil', wall, wall, wall},
  {wall, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', wall, wall, wall},
  {wall, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', wall, wall, wall},
  {wall, wall, wall, wall, wall, wall, wall, wall, wall, wall, wall, wall, wall, wall, wall, wall, wall, wall},
  {wall, wall, wall, wall, wall, wall, wall, wall, wall, wall, wall, wall, wall, wall, wall, wall, wall, wall},

}
collide = Map:new(walls)
end
function love.update(dt)




--if cc(x, y, 64, 64,  1080, 500, 200, 200) == true then
  --(currentDoor 0, 0, 0)
--end
if x==-300 then
  hp = 100
  x = 100
  y = 100
end

  local fbx = bx
  local fby = by
  if x > bx then
     fbx = fbx + 3
   end
   if x < bx then
     fbx = fbx - 3
   end
   if y > by then
     fby = fby + 3
   end
   if y < by then
     fby = fby - 3
   end
if collide:cc(fbx, fby, 64, 64) == false then
    bx = fbx
    by = fby
end
if hp < 300 then
if cc(x, y, w, h, foodx, foody, 64, 64) then
  hp = hp + 1
end
end
if hp == 300 then
  foodx = 40000
end

if dir3 == 'left' then
  ry = ry + 1
end
if dir3 == 'right' then
  ry = ry - 1
end

if ry < 800 then
  dir3 = 'left'
end
if ry > 910 then
  dir3 = 'right'
end


if dir2 == 'left' then
  ay = ay + 1
end
if dir2 == 'right' then
  ay = ay - 1
end
if ay < 800 then
  dir2 = 'left'
end
if ay > 910 then
  dir2 = 'right'
end

if dir == 'left'  then
  ey = ey + 3
end

  if dir == 'right'  then
    ey = ey - 3
end

if ey < 500 then
  dir = 'left'
end
if ey > 635 then
  dir = 'right'
end
  if x < 0 then
    x = 0
  end
  if y < 0 then
    y = 0
  end
  if x > 1200 then
    x = 1200
  end
  if y > 950 then
    y = 950
  end

    local tx = x
    local ty = y
    if love.keyboard.isDown('up') then

          ty = ty - speed
          playerImg = love.graphics.newImage('assets-1/monster/knight.png')
      end
      if love.keyboard.isDown('down') then
          ty = ty + speed
          playerImg = love.graphics.newImage('assets-1/monster/knight.png')
      end
      if love.keyboard.isDown('right') then
          tx = tx + speed
          playerImg = love.graphics.newImage('assets-1/monster/knightRIGHT.png')
          then 
          playerImg = love.graphics.newImage('assets-1/monster/run1.png')
          then
          playerImg = love.graphics.newImage('assets-1/monster/run2.png')
          then
          playerImg = love.graphics.newImage('assets-1/monster/run3.png')
          then
          playerImg = love.graphics.newImage('assets-1/monster/run4.png')
      end
      if love.keyboard.isDown('left') then
  

          tx = tx - speed
          playerImg = love.graphics.newImage('assets-1/monster/knightLEFT.png')

      end


      if collide:cc(tx, ty, 64, 64) == false then
        if open == true then
          x = tx
          y = ty
        else
          if cc(tx, ty, 64, 64,  dx, dy, 128, 128) == false then
            x = tx
            y = ty
          end
        end
      end

if hp == 0 then
  x = -300
  if love.keyboard.isDown('escape') then
    love.load()
  end

end

if cc(x, y, w, h, 450, 600, 64, 64)
then
  currentDoor = openDoor
  open = true
end

if cc(x, y, w, h, 450, 160, 64, 64)
then love.exitModule()
end

if cc(x, y, w, h, ax, ay, 64, 64)
then
  hp = hp - 1
end
if cc(x, y, w, h, rx, ry, 64, 64)
then
  hp = hp - 1
end
if cc(x, y, w, h, ex, ey, 64, 64)
then
  hp = hp - 1
end

if cc(x, y, w, h, bx, by, 64, 64)
then hp = hp - 1
end

  cam:setPosition(x, y)
end

function love.draw()
  cam:draw(function(l, t, w, h)
  map:draw()
  collide:draw()
  love.graphics.print('Hello, world!', 0, 0)
  love.graphics.draw(playerImg, x, y)
  love.graphics.rectangle('line', 0, 0, 64, 64)
  love.graphics.print(hp, x, y+ - 18)
  love.graphics.draw(Img4, ax, ay)
  love.graphics.draw(Img3, ex, ey)
  love.graphics.draw(Img5, rx, ry)
  love.graphics.draw(currentDoor, dx, dy)
  love.graphics.draw(portal, 450, 160)
  love.graphics.draw(switch, 450, 600)
  love.graphics.draw(BossImg, bx, by)
  love.graphics.draw(Food, foodx, foody)
 end)
end

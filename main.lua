
local Map = require 'core/map'
love.graphics.setDefaultFilter('nearest', 'nearest')
local Map = require 'core/map'
local gamera = require 'core/gamera'
local Util = require 'core/util'

function love.load()
  x = 100
  y = 100
  w = 64   -- The player's width is 64
  h = 64   -- The player's height is 64
  hp = 100 -- Set the player's HP to 100 at the start of the game






  cam = gamera.new(0, 0, 2000, 2000)
  floorTile = love.graphics.newImage('assets-1/dungeon/floor/grass/grass_flowers_red_1.png')
  tree = love.graphics.newImage('assets-1/dungeon/trees/mangrove_3.png')
  gate = love.graphics.newImage('assets-1/dungeon/gateways/bazaar_gone.png')
  template = { --a 3 x 3 map with the altar texture in the middle
               {floorTile, floorTile, floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile},
               {floorTile, floorTile, floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile},
               {floorTile, floorTile, floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile},
               {floorTile, floorTile, floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile},
               {floorTile, floorTile, floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile},
               {floorTile, floorTile, floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile},
               {floorTile, floorTile, floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile},
               {floorTile, floorTile, floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile},
               {floorTile, floorTile, floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile},
               {floorTile, floorTile, floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile},
               {floorTile, floorTile, floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile},
               {floorTile, floorTile, floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile},
               {floorTile, floorTile, floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile},
               {floorTile, floorTile, floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile},
               {floorTile, floorTile, floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile},
               {floorTile, floorTile, floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile},
               {floorTile, floorTile, floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile},
               {floorTile, floorTile, floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile},
               {floorTile, floorTile, floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile},
               {floorTile, floorTile, floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile},
               {floorTile, floorTile, floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile},
               {floorTile, floorTile, floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile},
               {floorTile, floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile},
               {floorTile, floorTile, floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile},
               {floorTile, floorTile, floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile},
               {floorTile, floorTile, floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile},
               {floorTile, floorTile, floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile},
               {floorTile, floorTile, floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile},
               {floorTile, floorTile, floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile},
               {floorTile, floorTile, floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile},
               {floorTile, floorTile, floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile},
               {floorTile, floorTile, floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile},
               {floorTile, floorTile, floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile},
               {floorTile, floorTile, floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile},




             }






  map = Map:new(template)

x = 400
  y = 300
  playerImg = love.graphics.newImage('assets-1/player/base/naga_blue_male.png')

  x2 = 500
  y2 = 300
playerImg2 = love.graphics.newImage('assets-1/dungeon/trees/mangrove_3.png')

x3 = 200
y3 = 100
playerImg3 = love.graphics.newImage('assets-1/dungeon/trees/mangrove_3.png')

x4 = 600
y4 = 100
playerImg4 = love.graphics.newImage('assets-1/dungeon/trees/mangrove_3.png')

x5 = 250
y5 = 350
playerImg5 = love.graphics.newImage('assets-1/dungeon/trees/mangrove_3.png')

x6 = 550
y6 = 650
playerImg6 = love.graphics.newImage('assets-1/dungeon/trees/mangrove_3.png')

x7 = 700
y7 = 400
playerImg7 = love.graphics.newImage('assets-1/dungeon/trees/mangrove_3.png')

x8 = 360
y8 = 400
playerImg8 = love.graphics.newImage('assets-1/dungeon/trees/mangrove_3.png')

x9 = 360
y9 = 400
playerImg9 = love.graphics.newImage('assets-1/dungeon/trees/mangrove_3.png')

x10 = 368
y10= 444
playerImg10 = love.graphics.newImage('assets-1/dungeon/trees/mangrove_3.png')

x11 = 200
y11 = 555
playerImg11 = love.graphics.newImage('assets-1/dungeon/trees/mangrove_3.png')

x12 = 320
y12 = 700
playerImg12 = love.graphics.newImage('assets-1/dungeon/trees/mangrove_3.png')

x13 = 100
y13 = 240
playerImg13 = love.graphics.newImage('assets-1/dungeon/trees/mangrove_3.png')

x14 = 400
y14 = 400
playerImg14 = love.graphics.newImage('assets-1/dungeon/trees/mangrove_3.png')

x15 = 600
y15 = 700
playerImg15 = love.graphics.newImage('assets-1/dungeon/trees/mangrove_3.png')

x16 = 550
y16 = 400
playerImg16 = love.graphics.newImage('assets-1/dungeon/trees/mangrove_3.png')

x17 = 367
y17 = 490
playerImg17 = love.graphics.newImage('assets-1/dungeon/trees/mangrove_3.png')

x18 = 360
y18 = 320
playerImg18 = love.graphics.newImage('assets-1/dungeon/trees/mangrove_3.png')

x19 = 420
y19 = 173
playerImg19 = love.graphics.newImage('assets-1/dungeon/trees/mangrove_3.png')


x20 = 500
y20 = 300
playerImg20 = love.graphics.newImage('assets-2/dc-mon/fungi_plants/oklob_plant.png')

x21 = 500
y21 = 300
playerImg20 = love.graphics.newImage('assets-2/dc-mon/fungi_plants/oklob_plant.png')

x22 = 500
y22 = 300
playerImg20 = love.graphics.newImage('assets-2/dc-mon/fungi_plants/oklob_plant.png')

x23 = 500
y23 = 300
playerImg20 = love.graphics.newImage('assets-2/dc-mon/fungi_plants/oklob_plant.png')

x24 = 500
y24 = 300
playerImg20 = love.graphics.newImage('assets-2/dc-mon/fungi_plants/oklob_plant.png')

x25 = 500
y25 = 300
playerImg20 = love.graphics.newImage('assets-2/dc-mon/fungi_plants/oklob_plant.png')


x25 = 500
y25 = 300
playerImg20 = love.graphics.newImage('assets-2/dc-mon/fungi_plants/oklob_plant.png')




cam:setPosition(400, 400)


end






function love.update(dt)
  -- Nothing to update yet
  if love.keyboard.isDown('right') then
    if cc(x + 1, y, 64, 64, 50, 50, 64, 64)==false then
    x = x + 1
    end
  end

  if love.keyboard.isDown('left') then
    if cc(x + 1, y, 64, 64, 50, 50, 64, 64)==false then
    x = x - 1
    end
  end

  if love.keyboard.isDown('down') then
    if cc(y + 1, y, 64, 64, 50, 50, 64, 64)==false then
    y = y + 1
    end
  end

  if love.keyboard.isDown('up') then
    if cc(y - 1, y, 64, 64, 50, 50, 64, 64)==false then
    y = y - 1
    end
  end

cam:setPosition(x, y)

if cc(x, y, w, h,   100, 100, 64, 64) then
    -- if true, decrease HP:
    hp = hp - 1
  end


end

function love.draw()
  cam:draw(function(l, t, w, h)
  map:draw()
  love.graphics.draw(playerImg, x, y)
  love.graphics.draw(playerImg2, x2, y2)
  love.graphics.draw(playerImg3, x3, y3)
  love.graphics.draw(playerImg4, x4, y4)
  love.graphics.draw(playerImg5, x5, y5)
  love.graphics.draw(playerImg6, x6, y6)
  love.graphics.draw(playerImg7, x7, y7)
  love.graphics.draw(playerImg8, x8, y8)
  love.graphics.draw(playerImg9, x9, y9)
  love.graphics.draw(playerImg10, x10, y10)
  love.graphics.draw(playerImg11, x11, y11)
  love.graphics.draw(playerImg12, x12, y12)
  love.graphics.draw(playerImg13, x13, y13)
  love.graphics.draw(playerImg14, x14, y14)
  love.graphics.draw(playerImg15, x15, y15)
  love.graphics.draw(playerImg16, x16, y16)
  love.graphics.draw(playerImg17, x17, y17)
  love.graphics.draw(playerImg18, x18, y18)
  love.graphics.draw(playerImg19, x19, y19)
  love.graphics.draw(playerImg20, x20, y20)






  end)



end


local Map = require 'core/map'
love.graphics.setDefaultFilter('nearest', 'nearest')
function love.load()
  floorTile = love.graphics.newImage('assets-1/dungeon/floor/grass/grass_flowers_red_1.png')
  tree = love.graphics.newImage('assets-1/dungeon/trees/mangrove_3.png')
  
  template = { --a 3 x 3 map with the altar texture in the middle
               {floorTile, floorTile, floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile},
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




             }






  map = Map:new(template)

x = 400
  y = 300
  playerImg = love.graphics.newImage('assets-1/player/base/octopode_1.png')

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









end






function love.update(dt)
  -- Nothing to update yet
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





end

function love.draw()
  map:draw()
  love.graphics.draw(playerImg, x, y)
  love.graphics.draw(playerImg2, x2, y2)
  love.graphics.draw(playerIm3, x3, y3)
  love.graphics.draw(playerImg4, x4, y4)
  love.graphics.draw(playerImg5, x5, y5)
  love.graphics.draw(playerImg6, x6, y6)
  love.graphics.draw(playerImg7, x7, y7)
  love.graphics.draw(playerImg8, x8, y8)




end


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

map = Map:new(5, 5) -- Create a 5 x 5 map object named "map"




  cam = gamera.new(0, 0, 2000, 2000)
  floorTile = love.graphics.newImage('assets-1/dungeon/floor/grass/grass_flowers_red_1.png')
  tree = love.graphics.newImage('assets-1/dungeon/trees/mangrove_3.png')
  --gate = love.graphics.newImage('assets-1/dungeon/gateways/bazaar_gone.png')
  --floor = love.graphics.newImage('assets-1/dungeon/floor/black_cobalt_1.png')


  tree = love.graphics.newImage('assets-1/dungeon/trees/mangrove_3.png')
    tree = {
      {tree, tree, tree, tree, },
      {tree, tree, tree, tree, tree,},
      {tree,  tree, tree, tree, tree, tree, tree, tree, tree,},
      {tree, tree, tree, tree, tree, tree, tree, tree, tree, tree, tree, tree, },
      {tree, tree, tree, tree, tree, tree, tree, tree, tree, },
      {tree, tree, tree, tree, tree, tree, tree, tree, tree, tree, tree, tree, tree, tree, tree, tree,},
      {tree, tree, tree, tree, tree, tree, tree, tree, tree, },
      {tree, tree, tree, tree, tree, tree, tree, tree, tree,},
      {tree, tree, tree, tree, tree, },
      {tree, tree, tree, tree, tree, tree, tree, tree, tree, tree, tree, tree, tree, tree, tree, tree,},
      {tree, tree, tree, tree, },
      {tree, tree, tree, tree, tree, tree, tree, },
      {tree, tree, tree, tree, tree, },
      {tree, tree, tree, tree, },
      {tree, tree, tree, tree, tree, },





    }






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
  collide = Map:new(tree)
x = 400
  y = 300
  playerImg = love.graphics.newImage('assets-1/player/base/naga_blue_male.png')






cam:setPosition(400, 400)


end




function love.update(dt)

  mapc = map:cc(x, y, 64, 64)
  debug = tostring(mapc)
  if love.keyboard.isDown('right') then
    if collide:cc(x + 3, y, 64, 64, 100, 200, 64, 64) == false then
      x = x + 3
    end
  end
  if love.keyboard.isDown('left') then
    if collide:cc(x - 3, y, 64, 64, 100, 200, 64, 64) == false then
      x = x - 3
   end
  end
  if love.keyboard.isDown('up') then
    if collide:cc(x, y - 3, 64, 64, 100, 200, 64, 64) == false then
      y = y - 3
  end
    if love.keyboard.isDown('down') then
      if collide:cc(x, y + 3, 64, 64, 100, 200, 64, 64) == false then
        y = y + 3
      end
    end
  end



  end



function love.draw()
  cam:draw(function(l, t, w, h)
  map:draw()
collide:draw()
  love.graphics.draw(playerImg, x, y)





  end)



end

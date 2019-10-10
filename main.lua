local Map = require 'core/map'
local gamera = require 'core/gamera'
function love.load()

  enemy_draw = false
  butterfly_alive = true

  local Util = require 'core/util'

  x = 400
  y = 300

  butterfly_x = 450
  butterfly_y = 100

  

  w = 64   -- The player's width is 64
  h = 64   -- The player's height is 64
  hp = 100 -- Set the player's HP to 100 at the start of the game

  enemy_x = 100
  enemy_y = 400

  cam = gamera.new(-80, -80, 2000, 2000) -- Create a camera that can move in a rectangle from 0, 0 to 2000, 2000
  
  playerImg = love.graphics.newImage('assets-1/player/base/formicid.png')
  enemyImg = love.graphics.newImage('assets-2/dc-mon/demons/chaos_spawn.png')
  map = Map:new(30,30) -- Create a 5 x 5 map object named "map"
 

  floorTile = love.graphics.newImage('assets-1/dungeon/floor/grass/grass_full.png')
  left_edge_tile = love.graphics.newImage('assets-1/dungeon/floor/grass/grass_west.png')
  right_edge_tile = love.graphics.newImage('assets-1/dungeon/floor/grass/grass_east.png')
  top_edge_tile = love.graphics.newImage('assets-1/dungeon/floor/grass/grass_north.png')
  bottom_edge_tile = love.graphics.newImage('assets-1/dungeon/floor/grass/grass_south.png')
  northeast_tile = love.graphics.newImage('assets-1/dungeon/floor/grass/grass_northeast.png')
  southwest_tile = love.graphics.newImage('assets-1/dungeon/floor/grass/grass_southwest.png')
  southeast_tile = love.graphics.newImage('assets-1/dungeon/floor/grass/grass_southeast.png')
  northwest_tile = love.graphics.newImage('assets-1/dungeon/floor/grass/grass_northwest.png')
  butterfly = love.graphics.newImage('assets-2/dc-mon/animals/butterfly6.png')
  fountain = love.graphics.newImage('assets-2/dc-dngn/dngn_sparkling_fountain.png')
  template = { --a 3 x 3 map with the altar texture in the middle

  {northwest_tile, left_edge_tile,left_edge_tile, left_edge_tile,left_edge_tile, left_edge_tile,southwest_tile, }, 
  {top_edge_tile, floorTile,floorTile, floorTile,floorTile, floorTile,  bottom_edge_tile, }, 
  {top_edge_tile, floorTile,floorTile, floorTile,floorTile, floorTile,  bottom_edge_tile, }, 
  {top_edge_tile, floorTile,floorTile, floorTile,floorTile, floorTile,  bottom_edge_tile, }, 
  {top_edge_tile, floorTile,floorTile, floorTile,floorTile, floorTile,  bottom_edge_tile, }, 
  {top_edge_tile, floorTile,floorTile, floorTile,floorTile, floorTile,  bottom_edge_tile, }, 
  {top_edge_tile, floorTile,floorTile, floorTile,floorTile, floorTile,  bottom_edge_tile, }, 
  {top_edge_tile, floorTile,floorTile, floorTile,floorTile, floorTile,  bottom_edge_tile, }, 
  {top_edge_tile, floorTile,floorTile, floorTile,floorTile, floorTile,  bottom_edge_tile, }, 
  {top_edge_tile, floorTile,floorTile, floorTile,floorTile, floorTile,  bottom_edge_tile, }, 
  {top_edge_tile, floorTile,floorTile, floorTile,floorTile, floorTile,  bottom_edge_tile, }, 
  {top_edge_tile, floorTile,floorTile, floorTile,floorTile, floorTile,  bottom_edge_tile, },
  {top_edge_tile, floorTile,floorTile, floorTile,floorTile, floorTile,  bottom_edge_tile, }, 
  {northeast_tile, right_edge_tile,right_edge_tile, right_edge_tile,right_edge_tile, right_edge_tile, southeast_tile, }, 
 

}
  map = Map:new(template, 64)
  
            
  
  
end


function love.update(dt)

  x_y = love.math.random(1,4)

  if x_y == 1 then
    butterfly_x = butterfly_x + 2

  end

    if x_y == 2 then
      butterfly_x = butterfly_x -2
    end

    if x_y == 3 then
      butterfly_y = butterfly_y +2
    end

    if x_y == 4 then
      butterfly_y = butterfly_y -2
    end 

  if love.keyboard.isDown('up') then   -- if the 'up' key is being pressed...
    if cc(x, y - 5, w, h, butterfly_x, butterfly_y, 8, 8)== false then
      y = y - 5
    else y = y + 15
    end
  end
  
  if love.keyboard.isDown('down') then   -- if the 'up' key is being pressed...
    if cc(x, y + 5, w, h, butterfly_x, butterfly_y, 8, 8)== false then
      y = y + 5
    else y = y - 15
    end
  end
  
  if love.keyboard.isDown('left') then   -- if the 'up' key is being pressed...
    if cc(x - 5, y, w, h, butterfly_x, butterfly_y, 8, 8)== false then
      x = x -5
    else x = x + 15
    end
  end
  
  if love.keyboard.isDown('right') then   -- if the 'up' key is being pressed...
    if cc(x + 5, y, w, h, butterfly_x, butterfly_y, 8, 8)== false then
      x = x + 5
    else x = x - 15
    end
  end
  
  if enemy_draw == true then
  
   if cc(x, y, w, h,   enemy_x, enemy_y, 32, 32) then  
  
    hp = hp - .2
  end
  


end

   -- x, y, w, h all represent the player's rectangle. The other values are a rectangle in the upper corner
   if cc(x, y, w, h,   1, -50, 880, 1) then  
    -- if true, decrease HP:
    y = y + 5
  end
  -- x, y, w, h all represent the player's rectangle. The other values are a rectangle in the upper corner
  if cc(x, y, w, h,   -15, 1, 1, 880) then  
    -- if true, decrease HP:
    x = x + 5
  end
  -- x, y, w, h all represent the player's rectangle. The other values are a rectangle in the upper corner
  if cc(x, y, w, h,   1, 445, 880, 1) then  
    -- if true, decrease HP:
    y = y - 5
  end
  -- x, y, w, h all represent the player's rectangle. The other values are a rectangle in the upper corner
  if cc(x, y, w, h,   900, 1, 1, 850) then  
    -- if true, decrease HP:
    x = x - 5
  end

  

 c = dist(enemy_x, enemy_y, x, y)
 a = y - enemy_y
 b = x - enemy_x
 speed = 3
 cRatio = speed/c
 dy = a * cRatio
 dx = b * cRatio
 enemy_x = enemy_x + dx
 enemy_y = enemy_y + dy
 cam:setPosition(x, y)
end











function love.draw()
  cam:draw(function(l, t, w, h)
  map:draw()
  if butterfly_alive == true then
  love.graphics.print('KILL THE BUTTERFLY!', 410, 85)
  end
  love.graphics.print(hp, 0, 0)
  love.graphics.draw(playerImg, x, y) 

  if butterfly_alive == true then
  love.graphics.draw(butterfly, butterfly_x, butterfly_y)
  end
  if enemy_draw == true then
  love.graphics.draw(enemyImg, enemy_x, enemy_y) 
  end
  end)
end


function dist ( x1, y1, x2, y2 )
  local dx = x1 - x2
  local dy = y1 - y2
  return math.sqrt ( dx * dx + dy * dy )
end

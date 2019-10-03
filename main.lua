local Map = require 'core/map'
local gamera = require 'core/gamera'
function love.load()

  x = 400
  y = 300

  enemy_x = 100
  enemy_y = 400

  cam = gamera.new(0, 0, 2000, 2000) -- Create a camera that can move in a rectangle from 0, 0 to 2000, 2000
  
  playerImg = love.graphics.newImage('assets-1/player/base/formicid.png')
  enemyImg = love.graphics.newImage('assets-2/dc-mon/demons/chaos_spawn.png')
  map = Map:new(30,30) -- Create a 5 x 5 map object named "map"
 

  floorTile = love.graphics.newImage('assets-1/dungeon/floor/grass/grass_full.png')
  
  

  template = { --a 3 x 3 map with the altar texture in the middle

  {floorTile, floorTile, floorTile,floorTile, floorTile,floorTile, floorTile, floorTile,floorTile, floorTile, floorTile }, 
  {floorTile, floorTile, floorTile,floorTile, floorTile,floorTile, floorTile, floorTile,floorTile, floorTile, floorTile }, 
  {floorTile, floorTile, floorTile,floorTile, floorTile,floorTile, floorTile, floorTile,floorTile, floorTile, floorTile }, 
  {floorTile, floorTile, floorTile,floorTile, floorTile,floorTile, floorTile, floorTile,floorTile, floorTile, floorTile }, 
  {floorTile, floorTile, floorTile,floorTile, floorTile,floorTile, floorTile, floorTile,floorTile, floorTile, floorTile}, 
  {floorTile, floorTile, floorTile,floorTile, floorTile,floorTile, floorTile, floorTile,floorTile, floorTile, floorTile}, 
  {floorTile, floorTile, floorTile,floorTile, floorTile,floorTile, floorTile, floorTile,floorTile, floorTile, floorTile}, 
  {floorTile, floorTile, floorTile,floorTile, floorTile,floorTile, floorTile, floorTile,floorTile, floorTile, floorTile}, 
  {floorTile, floorTile, floorTile,floorTile, floorTile,floorTile, floorTile, floorTile,floorTile, floorTile, floorTile}, 
  {floorTile, floorTile, floorTile,floorTile, floorTile,floorTile, floorTile, floorTile,floorTile, floorTile, floorTile}, 
  {floorTile, floorTile, floorTile,floorTile, floorTile,floorTile, floorTile, floorTile,floorTile, floorTile, floorTile}, 
  {floorTile, floorTile, floorTile,floorTile, floorTile,floorTile, floorTile, floorTile,floorTile, floorTile, floorTile},
  {floorTile, floorTile, floorTile,floorTile, floorTile,floorTile, floorTile, floorTile,floorTile, floorTile, floorTile}, 
  {floorTile, floorTile, floorTile,floorTile, floorTile,floorTile, floorTile, floorTile,floorTile, floorTile, floorTile}, 
 

}
  map = Map:new(template)
  
            
  
  
end


function love.update(dt)


  if love.keyboard.isDown('up') then   -- if the 'up' key is being pressed...
    y = y - 5
  end
  if love.keyboard.isDown('down') then   -- if the 'up' key is being pressed...
    y = y + 5
  end
  if love.keyboard.isDown('left') then   -- if the 'up' key is being pressed...
    x = x - 5
  end
  if love.keyboard.isDown('right') then   -- if the 'up' key is being pressed...
    x = x + 5
  end
 c = dist(enemy_x, enemy_y, x, y)
 a = y - enemy_y
 b = x - enemy_x
 speed = 5
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
  love.graphics.print('Hello, world!', 0, 0)
  love.graphics.draw(playerImg, x, y) 
  love.graphics.draw(enemyImg, enemy_x, enemy_y) 
  end)
end


function dist ( x1, y1, x2, y2 )
  local dx = x1 - x2
  local dy = y1 - y2
  return math.sqrt ( dx * dx + dy * dy )
end

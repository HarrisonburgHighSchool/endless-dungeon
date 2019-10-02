local Entity = require 'core/entity'



local Map = require 'core/map'


  


function love.load()
 
  player = Entity:new() -- Create the Entity object named player
end
 
  x = 400
  y = 300
  playerImg = love.graphics.newImage('assets-1/player/base/octopode_2.png')

  map = Map:new(5, 5) -- Create a 5 x 5 map object named "map"


  floorTile = love.graphics.newImage(asset.png)
  alter     = love.graphics.newImage('acidic_floor.png')
  template  = { -- a 3 x 3 map with the alter texture in the middle
                 {floorTile, floorTile, floorTile},
                 {floorTile, floorTile, floorTile},
                 {floorTile, floorTile, floorTile},

              }
map = Map:new(tempalte)


end


function love.update(dt)
 if love.keyboard.isDown('right') then  
x = x + 1
end
if love.keyboard.isDown('down') then  
y = y + 1
end
if love.keyboard.isDown('left') then  
x = x - 1
end
if love.keyboard.isDown('up') then 
  y = y - 1
end


end


function love.draw()
  
  love.graphics.print('Octopod-cast!', 0, 0)
  love.graphics.draw(playerImg, x, y)
  player:draw() -- Draw the entity object named player
  map:draw()

end



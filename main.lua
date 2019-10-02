local Map = require 'core/map'
function love.load()
  x = 400
  y = 300

  playerImg = love.graphics.newImage('assets-1/player/base/formicid.png')
 
  map = Map:new(30,30) -- Create a 5 x 5 map object named "map"
 

  floorTile = love.graphics.newImage('assets-1/dungeon/floor/floor_vines_4.png')
  
  

  template = { --a 3 x 3 map with the altar texture in the middle

  {floorTile, floorTile, floorTile,floorTile, floorTile,floorTile, floorTile, floorTile,floorTile, floorTile, }, 
  {floorTile, floorTile, floorTile,floorTile, floorTile,floorTile, floorTile, floorTile,floorTile, floorTile, }, 
  {floorTile, floorTile, floorTile,floorTile, floorTile,floorTile, floorTile, floorTile,floorTile, floorTile, }, 
  {floorTile, floorTile, floorTile,floorTile, floorTile,floorTile, floorTile, floorTile,floorTile, floorTile, }, 
  {floorTile, floorTile, floorTile,floorTile, floorTile,floorTile, floorTile, floorTile,floorTile, floorTile, }, 
  {floorTile, floorTile, floorTile,floorTile, floorTile,floorTile, floorTile, floorTile,floorTile, floorTile, }, 
  {floorTile, floorTile, floorTile,floorTile, floorTile,floorTile, floorTile, floorTile,floorTile, floorTile, }, 
  {floorTile, floorTile, floorTile,floorTile, floorTile,floorTile, floorTile, floorTile,floorTile, floorTile, }, 
  {floorTile, floorTile, floorTile,floorTile, floorTile,floorTile, floorTile, floorTile,floorTile, floorTile, }, 
  {floorTile, floorTile, floorTile,floorTile, floorTile,floorTile, floorTile, floorTile,floorTile, floorTile, }, 
  {floorTile, floorTile, floorTile,floorTile, floorTile,floorTile, floorTile, floorTile,floorTile, floorTile, }, 
  {floorTile, floorTile, floorTile,floorTile, floorTile,floorTile, floorTile, floorTile,floorTile, floorTile, },
  {floorTile, floorTile, floorTile,floorTile, floorTile,floorTile, floorTile, floorTile,floorTile, floorTile, }, 
  {floorTile, floorTile, floorTile,floorTile, floorTile,floorTile, floorTile, floorTile,floorTile, floorTile, }, 
 

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

end










function love.draw()
  map:draw()
  love.graphics.print('Hello, world!', 0, 0)
  love.graphics.draw(playerImg, x, y) 
  
end



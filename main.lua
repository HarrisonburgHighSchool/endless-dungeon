local Map = require 'core/map'

function love.load()
  x = 400
  y = 300
  playerImg = love.graphics.newImage('assets-2/dc-mon/glowing_shapeshifter.png')
  statue = love.graphics.newImage('assets-1/dungeon/statues/statue_angel.png')
  limestone = love.graphics.newImage('assets-1/dungeon/floor/limestone_1.png')
  
  mapTemplate = {
    {limestone,limestone,limestone,limestone,limestone,limestone,limestone,limestone,limestone,limestone},
    {limestone,limestone,limestone,limestone,limestone,limestone,limestone,limestone,limestone,limestone},
    {limestone,limestone,limestone,limestone,limestone,limestone,limestone,limestone,limestone,limestone},
    {limestone,limestone,limestone,limestone,limestone,limestone,limestone,limestone,limestone,limestone},
    {limestone,limestone,limestone,limestone,limestone,limestone,limestone,limestone,limestone,limestone},
    {limestone,limestone,limestone,limestone,limestone,limestone,limestone,limestone,limestone,limestone},
    {limestone,limestone,limestone,limestone,limestone,limestone,limestone,limestone,limestone,limestone},
    {limestone,limestone,limestone,limestone,limestone,limestone,limestone,limestone,limestone,limestone},
    {limestone,limestone,limestone,limestone,limestone,limestone,limestone,limestone,limestone,limestone},
    {limestone,limestone,limestone,limestone,limestone,limestone,limestone,limestone,limestone,limestone},
    {limestone,limestone,limestone,limestone,limestone,limestone,limestone,limestone,limestone,limestone},
    {limestone,limestone,limestone,limestone,limestone,limestone,limestone,limestone,limestone,limestone},
    {limestone,limestone,limestone,limestone,limestone,limestone,limestone,limestone,limestone,limestone},
    
  }

  map = Map:new(mapTemplate)
end



function love.update(dt)
  if love.keyboard.isDown('down') then   -- if the 'up' key is being pressed...
    y = y + 1
  end
  if love.keyboard.isDown('up') then   -- if the 'up' key is being pressed...
    y = y - 1
  end
  if love.keyboard.isDown('right') then   -- if the 'up' key is being pressed...
    x = x + 1
end
if love.keyboard.isDown('left') then   -- if the 'up' key is being pressed...
  x = x - 1
end
end

function love.draw()
  love.graphics.print('Hello, world!', 0, 0)
  map:draw()
  love.graphics.draw(statue, 400, 270)
  love.graphics.draw(playerImg, x, y)
 
  
  

end


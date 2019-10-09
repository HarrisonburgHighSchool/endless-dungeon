local Map = require 'core/map'

function love.load()
  x = 400
  y = 100
  playerImg = love.graphics.newImage('assets-1/monster/demons/balrug.png')
  floorTile = love.graphics.newImage('assets-2/dc-dngn/floor/lava2.png')
  altar     = love.graphics.newImage('assets-2/dc-dngn/floor/lava2.png')
  template = { --a 6 x 6 map with the altar texture in the middle
               {floorTile, floorTile, floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,},
               {floorTile,floorTile, floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile},
               {floorTile, floorTile, floorTile, floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,},
               {floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,},
               {floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,},
               {floorTile,floorTile,floorTile,floorTile,floorTile,foolTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,},
               {floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,},
               {floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floor,Tile,floorTile,floorTile,floorTile,},
               {floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floortile,},
             }

  map = Map:new(template)
map: changeScale(3)
end
  function love.update(dt)
  if love.keyboard.isDown("left") then
        x = x - 4
   end

   if love.keyboard.isDown("right") then
        x = x + 4
    end

    if love.keyboard.isDown("up") then
        y = y - 4
    end
    if love.keyboard.isDown("down") then
        y = y + 4
       end


end


function love.draw()
  map:draw()
  love.graphics.print('play here !', 0, 0)
  love.graphics.draw(playerImg, x, y)
end
if love.keyboard.isDown('up') then   -- if the 'up' key is being pressed...
  x = x + 1
end

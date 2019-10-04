function love.load()
  x = 400
  y = 300
  playerImg = love.graphics.newImage('assets-1/player/base/octopode_1.png')
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
       function love.load()

  floorTile = love.graphics.newImage('dirt_east.png')
  altar     = love.graphics.newImage('dirt_east.png')
  template = { --a 3 x 3 map with the altar texture in the middle
               {floorTile, floorTile, floorTile},
               {floorTile, altar, floorTile},
               {floorTile, floorTile, floorTile},
             }
  map = Map:new(template)
end
function love.draw()
  love.graphics.print('play here !', 0, 0)
  love.graphics.draw(playerImg, x, y)
end

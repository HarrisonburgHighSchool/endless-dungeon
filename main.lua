
function love.load()
  x = 400
  y = 300
  playerImg = love.graphics.newImage('a/images.png')
end


function love.update(dt)
  if love.keyboard.isDown('d') then   -- if the 'up' key is being pressed...
    x = x + 6
  end
  if love.keyboard.isDown('s') then   -- if the 'up' key is being pressed...
    y = y + 6
  end
  if love.keyboard.isDown('a') then   -- if the 'up' key is being pressed...
    x = x - 6
  end
  if love.keyboard.isDown('w') then   -- if the 'up' key is being pressed...
    y = y - 6
  end
  cobalt = love.graphics.newImage('assets-1/dungeon/floor/black_cobalt_1.png')
  mapTemplate = {
    {cobalt, cobalt, cobalt},
    {cobalt, cobalt, cobalt},
    {cobalt, cobalt, cobalt},
  }

  map = Map:new(mapTemplate)
end

--function love.update(dt)
  -- Nothing to update yet
--end

function love.draw()
  love.graphics.draw(cobalt)
  love.graphics.draw(playerImg, x, y)
end

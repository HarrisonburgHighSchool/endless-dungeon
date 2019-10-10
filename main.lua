love.graphics.setDefaultFilter('nearest', 'nearest')
local Map = require 'core/map'

function love.load()
  x = 400
  y = 300
  playerImg = love.graphics.newImage('assets-1/player/base/octopode_1.png')
  template = {
    {playerImg, playerImg, nil},
    {playerImg, nil, nil},
    {playerImg, nil, nil},
  }

  map = Map:new(template)
  debug = false
end




function love.update(dt)

  mapc = map:cc(x, y, 64, 64)
  debug = tostring(mapc)
  if love.keyboard.isDown('right') then
    if map:cc(x + 1, y, 64, 64) == false then
      x = x + 1
    end
  end
  if love.keyboard.isDown('left') then
    if map:cc(x - 1, y, 64, 64) == false then
      x = x - 1
    end
  end
  if love.keyboard.isDown('up') then
    if map:cc(x, y-1, 64, 64) == false then
      y = y - 1
    end
  end
  if love.keyboard.isDown('down') then
    if map:cc(x, y+1, 64, 64) == false then
      y = y + 1
    end
  end


end





function love.draw()
  map:draw()
  love.graphics.draw(playerImg, x, y)
  love.graphics.print(tostring(mapc), 0, 0)
end

local Util = require 'core/util'



function love.load()
  x = 400
  y = 300
  playerImg = love.graphics.newImage('assets-1/player/base/octopode_1.png')
  w = 64   -- The player's width is 64
  h = 64   -- The player's height is 64
  hp = 100 -- Set the player's HP to 100 at the start of the game
end

function love.update(dt)
  -- Set up player movement
  if love.keyboard.isDown('up') then
    y = y - 
  end
  if love.keyboard.isDown('down') then
    y = y + 1
  end
  if love.keyboard.isDown('left') then
    x = x - 1
  end
  if love.keyboard.isDown('right') then
    x = x + 1
  end

  -- x, y, w, h all represent the player's rectangle. The other values are a rectangle in the upper corner
  if cc(x, y, w, h,   0, 0, 64, 64) then  
    -- if true, decrease HP:
    hp = hp - 1
  end
end

function love.draw()
  -- Draw the player
  love.graphics.draw(playerImg, x, y)

  -- Draw the rectangle in the upper left corner
  love.graphics.rectangle('line', 0, 0, 64, 64)

  -- Print the player's HP in the top left corner
  love.graphics.print(hp, 0, 0)
end

x, + w, > x
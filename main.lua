local Map = require 'core/map'
function love.load()
  map = Map:new(20,20)
  x = 400
  y = 300
  playerImg = love.graphics.newImage('assets-1/player/transform/dragon_form_red.png')
  cobalt = love.graphics.newImage('assets-1/dungeon/floor/black_cobalt_1.png')
  template = {
    {cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt,cobalt, cobalt, cobalt},
    {cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt,cobalt, cobalt, cobalt},
    {cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt,cobalt, cobalt, cobalt},
    {cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt,cobalt, cobalt, cobalt},
    {cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt,cobalt, cobalt, cobalt},
    {cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt,cobalt, cobalt, cobalt},
    {cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt,cobalt, cobalt, cobalt},
    {cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt,cobalt, cobalt, cobalt},
    {cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt,cobalt, cobalt, cobalt},
    {cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt,cobalt, cobalt, cobalt},
    {cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt,cobalt, cobalt, cobalt},
    {cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt,cobalt, cobalt, cobalt},
    {cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt,cobalt, cobalt, cobalt},
  }

  map = Map:new(template)
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
end

--function love.update(dt)
  -- Nothing to update yet
--end

function love.draw()
  map:draw()
  love.graphics.draw(playerImg, x, y)
end

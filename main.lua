local Map = require 'core/map'

function love.load()
  x = 400
  y = 300
  playerImg = love.graphics.newImage('assets-1/monster/aberration/unseen_horror.png')

  cage = love.graphics.newImage('assets-1/dungeon/floor/green_bones_9.png')
  cage1 = love.graphics.newImage('assets-1/dungeon/floor/green_bones_10.png')
  cage2 = love.graphics.newImage('assets-1/dungeon/floor/green_bones_11.png')
  cage3 = love.graphics.newImage('assets-1/dungeon/floor/green_bones_12.png')
  statue = love.graphics.newImage('assets-1/dungeon/statues/statue_hydra.png')
  mapTemplate = {

    {cage1, cage2, cage3, cage, cage, cage, cage, cage, cage, cage},
    {cage1, cage2, cage3, cage, cage, cage, cage, cage, cage, cage},
    {cage1, cage2, cage3, cage, cage, cage, cage, cage, cage, cage},
    {cage1, cage2, cage3, cage, cage, cage, cage, cage, cage, cage},
    {cage1, cage2, cage3, cage, cage, cage, cage, cage, cage, cage},
    {cage1, cage2, cage3, cage, cage, cage, cage, cage, cage, cage},
    {cage1, cage2, cage3, cage, cage, cage, cage, cage, cage, cage},
    {cage1, cage2, cage3, cage, cage, cage, cage, cage, cage, cage},
    {cage1, cage2, cage3, cage, cage, cage, cage, cage, cage, cage},
    {cage1, cage2, cage3, cage, cage, cage, cage, cage, cage, cage},
    {cage1, cage2, cage3, cage, cage, cage, cage, cage, cage, cage},
    {cage1, cage2, cage3, cage, cage, cage, cage, cage, cage, cage},
    {cage1, cage2, cage3, cage, cage, cage, cage, cage, cage, cage},
    {cage1, cage2, cage3, cage, cage, cage, cage, cage, cage, cage},
    {cage1, cage2, cage3, cage, cage, cage, cage, cage, cage, cage},
    {cage1, cage2, cage3, cage, cage, cage, cage, cage, cage, cage},
    {cage1, cage2, cage3, cage, cage, cage, cage, cage, cage, cage},
    {cage1, cage2, cage3, cage, cage, cage, cage, cage, cage, cage},
    {cage1, cage2, cage3, cage, cage, cage, cage, cage, cage, cage},
    {cage1, cage2, cage3, cage, cage, cage, cage, cage, cage, cage},

    
  }
end
  function love.update(dt)
  if love.keyboard.isDown('w') then   
    y = y - 1
  end
    if love.keyboard.isDown('s') then   
      y = y + 1
    end
      if love.keyboard.isDown('a') then  
        x = x - 1
      end
        if love.keyboard.isDown('d') then   
          x = x + 1
  end
 

  map = Map:new(mapTemplate)
end


function love.draw()
  love.graphics.print('Hello, world!', 0, 0)
  map:draw()
  love.graphics.draw(playerImg, x, y)

  
end


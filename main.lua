local Map = require 'core/map'

love.graphics.setDefaultFilter('nearest', 'nearest')
function love.load()
  x = 400
  y = 300
  playerImg = love.graphics.newImage('assets-1/player/base/gargoyle_male.png')

  cage = love.graphics.newImage('assets-1/dungeon/floor/floor_vines_3.png')
  cage1 = love.graphics.newImage('assets-1/dungeon/floor/floor_vines_4.png')
  cage2 = love.graphics.newImage('assets-1/dungeon/floor/floor_vines_5.png')
  cage3 = love.graphics.newImage('assets-1/dungeon/floor/floor_vines_6.png')
  wall = love.graphics.newImage ('assets-1/dungeon/wall/catacombs_0.png')
  door = love.graphics.newImage ('assets-1/dungeon/doors/runed_door.png')
  statue1 = love.graphics.newImage ('assets-1/dungeon/statues/statue_sigmund.png')
  butterfly = love.graphics.newImage('assets-1/monster/animals/butterfly_1.png')
  jackal = love.graphics.newImage('assets-1/monster/animals/jackal.png')
  bat = love.graphics.newImage('assets-1/monster/animals/bat.png')
  hog = love.graphics.newImage('assets-1/monster/animals/hog.png')
  hat = love.graphics.newImage('assets-1/item/armor/headgear/cap_jester.png')

  mapTemplate = {
    {cage, cage1, cage2, cage3, cage, cage1, cage2, cage3, cage, cage1},
    {cage, cage1, cage2, cage3, cage, cage1, cage2, cage3, cage, cage2},
    {cage, cage1, cage2, cage3, cage, cage1, cage2, cage3, cage, cage3},
    {cage, cage1, cage2, cage3, cage, cage1, cage2, cage3, cage, cage},
    {cage, cage1, cage2, cage3, cage, cage1, cage2, cage3, cage, cage1},
    {cage, cage1, cage2, cage3, cage, cage1, cage2, cage3, cage, cage2},
    {cage, cage1, cage2, cage3, cage, cage1, cage2, cage3, cage, cage3},
    {cage, cage1, cage2, cage3, cage, cage1, cage2, cage3, cage, cage},
    {cage, cage1, cage2, cage3, cage, cage1, cage2, cage3, cage, cage1},
    {cage, cage1, cage2, cage3, cage, cage1, cage2, cage3, cage, cage2},
    {cage, cage1, cage2, cage3, cage, cage1, cage2, cage3, cage, cage3},
    {cage, cage1, cage2, cage3, cage, cage1, cage2, cage3, cage, cage},
    {cage, cage1, cage2, cage3, cage, cage1, cage2, cage3, cage, cage},

  }
end
  function love.update(dt)
  if love.keyboard.isDown('w') then   
    y = y - 5
  end
    if love.keyboard.isDown('s') then   
      y = y + 5
    end
      if love.keyboard.isDown('a') then  
        x = x - 5
      end
        if love.keyboard.isDown('d') then   
          x = x + 5
  end
 

  map = Map:new(mapTemplate)
end


function love.draw()
  map:draw()

  love.graphics.draw(wall, 0, 0)
  love.graphics.draw(wall, 0, 65)
  love.graphics.draw(wall, 0, 130)
  love.graphics.draw(wall, 0, 195)
  love.graphics.draw(wall, 0, 260)
  love.graphics.draw(wall, 0, 390)
  love.graphics.draw(wall, 0, 455)
  love.graphics.draw(wall, 0, 510)
  love.graphics.draw(wall, 0, 575)
  love.graphics.draw(wall, 740, 0)
  love.graphics.draw(wall, 740, 65)
  love.graphics.draw(wall, 740, 130)
  love.graphics.draw(wall, 740, 195)
  love.graphics.draw(wall, 740, 260)
  love.graphics.draw(wall, 740, 390)
  love.graphics.draw(wall, 740, 455)
  love.graphics.draw(wall, 740, 510)
  love.graphics.draw(wall, 740, 575)
  love.graphics.draw(wall, 65, 0)
  love.graphics.draw(wall, 130, 0)
  love.graphics.draw(wall, 195, 0)
  love.graphics.draw(wall, 260, 0)
  love.graphics.draw(wall, 325, 0)
  love.graphics.draw(wall, 455, 0)
  love.graphics.draw(wall, 510, 0)
  love.graphics.draw(wall, 575, 0)
  love.graphics.draw(wall, 640, 0)
  love.graphics.draw(wall, 705, 0)
  
  love.graphics.draw(wall, 65, 575)
  love.graphics.draw(wall, 130, 575)
  love.graphics.draw(wall, 195, 575)
  love.graphics.draw(wall, 260, 575)
  love.graphics.draw(wall, 325, 575)
  love.graphics.draw(wall, 455, 575)
  love.graphics.draw(wall, 510, 575)
  love.graphics.draw(wall, 575, 575)
  love.graphics.draw(wall, 640, 575)
  love.graphics.draw(wall, 705, 575)

  love.graphics.draw(door, 390, 0, 0, 2)
  love.graphics.draw(door, 390, 575, 0, 2)
  love.graphics.draw(door, 740, 325, 0, 2)
  love.graphics.draw(door, 0, 325, 0, 2)
  
  love.graphics.draw(statue1, 65, 65, 0, 2)

  love.graphics.draw(butterfly, 65, 325, 0, 2)
  love.graphics.draw(bat, 675, 325, 0, 2)
  love.graphics.draw(hog, 385, 65, 0, 2)



  love.graphics.draw(playerImg, x, y)
end


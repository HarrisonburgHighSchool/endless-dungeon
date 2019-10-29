local Map = require 'core/map'
local Util = require 'core/util'

love.graphics.setDefaultFilter('nearest', 'nearest')

function love.load()
  -- Create the player variables
  img = love.graphics.newImage('assets-1/player/base/octopode_1.png')
  x = 400
  y = 300
  playerImg = love.graphics.newImage('assets-2/player/base/merfolk_m.png')
  w = 16   -- The player's width is 16
  h = 16   -- The player's height is 16
  hp = 100 -- Set the player's HP to 100 at the start of the game
  cage = love.graphics.newImage('assets-1/dungeon/floor/floor_vines_3.png')
  cage1 = love.graphics.newImage('assets-1/dungeon/floor/floor_vines_4.png')
  cage2 = love.graphics.newImage('assets-1/dungeon/floor/floor_vines_5.png')
  cage3 = love.graphics.newImage('assets-1/dungeon/floor/floor_vines_6.png')
  wall = love.graphics.newImage ('assets-1/dungeon/wall/catacombs_0.png')
  door = love.graphics.newImage ('assets-1/dungeon/doors/runed_door.png')
  openDoor = love.graphics.newImage ('assets-1/dungeon/doors/vgate_open_up.png')
  closedDoor = love.graphics.newImage ('assets-1/dungeon/doors/sealed_door.png')

  statue1 = love.graphics.newImage ('assets-1/dungeon/statues/statue_sigmund.png')
  camo_hog = love.graphics.newImage('assets-1/monster/animals/camo_hog-1.png.png')
  jackal = love.graphics.newImage('assets-1/monster/animals/jackal.png')
  bat = love.graphics.newImage('assets-1/monster/animals/bat.png')
  raiju = love.graphics.newImage('assets-1/monster/animals/raiju.png')
  trap = love.graphics.newImage ('assets-1/dungeon/traps/shaft.png')
  pressure = love.graphics.newImage ('assets-1/dungeon/traps/pressure_plate.png')

  currentDoor = closedDoor

  background = {
    {wall, wall, wall, wall, wall, nil, wall, wall, wall, wall},
    {wall, cage1, cage2, cage3, cage, cage1, cage2, cage3, cage, wall},
    {wall, cage1, cage2, cage3, cage, cage1, cage2, cage3, cage, wall},
    {wall, cage1, cage2, cage3, cage, cage1, cage2, cage3, cage, wall},
    {wall, cage1, cage2, cage3, cage, cage1, cage2, cage3, cage, wall},
    {wall, cage1, cage2, cage3, cage, cage1, cage2, cage3, cage, wall},
    {wall, cage1, cage2, cage3, cage, cage1, cage2, cage3, cage, wall},
    {wall, cage1, cage2, cage3, cage, cage1, cage2, cage3, cage, wall},
    {wall, cage1, cage2, cage3, cage, cage1, cage2, cage3, cage, wall},
    {wall, cage1, cage2, cage3, cage, cage1, cage2, cage3, cage, wall},
    {wall, cage1, cage2, cage3, cage, cage1, cage2, cage3, cage, wall},
    {wall, cage1, cage2, cage3, cage, cage1, cage2, cage3, cage, wall},
    {wall, wall, wall, wall, wall, door, wall, wall, wall, wall},

  }

collision = {
  {wall, wall, wall, wall, wall, nil, wall, wall, wall, wall},
    {wall, cage1, cage2, cage3, cage, cage1, cage2, cage3, cage, wall},
    {wall, cage1, cage2, cage3, cage, cage1, cage2, cage3, cage, wall},
    {wall, cage1, cage2, cage3, cage, cage1, cage2, cage3, cage, wall},
    {wall, cage1, cage2, cage3, cage, cage1, cage2, cage3, cage, wall},
    {wall, cage1, cage2, cage3, cage, cage1, cage2, cage3, cage, wall},
    {wall, cage1, cage2, cage3, cage, cage1, cage2, cage3, cage, wall},
    {wall, cage1, cage2, cage3, cage, cage1, cage2, cage3, cage, wall},
    {wall, cage1, cage2, cage3, cage, cage1, cage2, cage3, cage, wall},
    {wall, cage1, cage2, cage3, cage, cage1, cage2, cage3, cage, wall},
    {wall, cage1, cage2, cage3, cage, cage1, cage2, cage3, cage, wall},
    {wall, cage1, cage2, cage3, cage, cage1, cage2, cage3, cage, wall},
    {wall, wall, wall, wall, wall, door, wall, wall, wall, wall},

}
   

  map = Map:new(background)
  collision = Map:new(collision)
end
function love.update(dt)
  if love.keyboard.isDown('w') then
    if collision:cc(x, y-4, 16, 16) then
      y = y - 5
    end
    if cc(x, y, 64, 64,   200, 200, 64, 64) == true then
      currentDoor = openDoor
    end
  end
  if love.keyboard.isDown('s') then
    if collision:cc(x, y+4, 16, 16) then
      y = y + 5
    end
    if cc(x, y, 64, 64,   200, 200, 64, 64) == true then
      currentDoor = openDoor
    end
  end
  if love.keyboard.isDown('d') then
    if collision:cc(x+4, y, 16, 16) then
      x = x + 5
    end
    if cc(x, y, 64, 64,   200, 200, 64, 64) == true then
      currentDoor = openDoor
    end
  end
  if love.keyboard.isDown('a') then
    if collision:cc(x-4, y, 16, 16) then
      x = x - 5
    end
    if cc(x, y, 64, 64,   200, 200, 64, 64) == true then
      currentDoor = openDoor
    end
  end
  if cc(x, y, 64, 64,   0, 319, 64, 64) == true then
    love.exitModule{};
  end
end
   





function love.draw()
  map:draw()
  collision:draw()
 

  love.graphics.draw(trap, 385, 130, 0, 2) -- Bottom Middle Pit
  love.graphics.draw(trap, 320, 130, 0, 2)
  love.graphics.draw(trap, 450, 130, 0, 2)
  love.graphics.draw(trap, 450, 65, 0, 2)
  love.graphics.draw(trap, 320, 65, 0, 2)


  love.graphics.draw(door, 390, 0, 0, 2) -- Top Door
  love.graphics.draw(door, 390, 575, 0, 2) -- Bottom Door
  love.graphics.draw(currentDoor, 0, 319, 0, 2) -- Left Door
  
  love.graphics.draw(statue1, 65, 65, 0, 2)


  love.graphics.draw(pressure, 190, 190,0,2)

  love.graphics.draw(playerImg, x, y, 0, 2)
  love.graphics.rectangle('line', 0, 0, 64, 64)

  love.graphics.print(hp, 0, 0)
end


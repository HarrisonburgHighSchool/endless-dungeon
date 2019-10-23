local Map = require 'core/map'
love.graphics.setDefaultFilter('nearest', 'nearest')
local Util = require 'core/util'
function love.load()

  -- Create the player variables
  img = love.graphics.newImage('assets-1/player/base/octopode_1.png')
  x = 385
  y = 65
  playerImg = love.graphics.newImage('assets-2/dc-mon/glowing_shapeshifter.png')
  w = 64   -- The player's width is 64
  h = 64   -- The player's height is 64
  hp = 100 -- Set the player's HP to 100 at the start of the game
  secretpath = love.graphics.newImage('assets-2/dc-dngn/gateways/stone_stairs_down.png')
  statue = love.graphics.newImage('assets-1/dungeon/statues/statue_angel.png')
  grass = love.graphics.newImage('assets-2/dc-dngn/floor/grass/grass_flowers_yellow1.png')
  jelly = love.graphics.newImage('assets-2/dc-mon/unique/dissolution.png')
  jelly2 = love.graphics.newImage('assets-2/dc-mon/jelly.png')
  water = love.graphics.newImage('assets-1/dungeon/water/shoals_shallow_water_7.png')
  marble = love.graphics.newImage('assets-1/dungeon/floor/white_marble_4.png')
  wall = love.graphics.newImage('assets-1/dungeon/wall/catacombs_1.png')
  grey = love.graphics.newImage('assets-2/dc-dngn/floor/rect_gray1.png')
  mud = love.graphics.newImage('assets-1/dungeon/floor/mud_1.png')
  lair = love.graphics.newImage('assets-1/dungeon/floor/lair3b.png')
  openDoor = love.graphics.newImage('assets-1/dungeon/doors/vgate_open_down.png')
closedDoor = love.graphics.newImage('assets-1/dungeon/doors/vgate_closed_up.png')
switch = love.graphics.newImage('assets-1/dungeon/traps/pressure_plate.png')
currentDoor = openDoor


  mapTemplate = {
    {mud,mud,mud,mud,mud,mud,mud,mud,mud,mud},
    {mud,grass,grass,grass,marble,marble,grass,grass,grass,grass},
    {mud,grass,grass,grass,marble,marble,grass,grass,grass,grass},
    {mud,grass,marble,marble,marble,marble,marble,marble,grass},
    {mud,marble,marble,grass,marble,marble,grass,marble,grass,grass},
    {mud,marble,grass,marble,water,water,marble,marble,grass,grass,grass},
    {marble,marble,grass,marble,marble,marble,marble,marble,grass,grass,grass},
    {mud,marble,grass,marble,water,water,marble,marble,grass,grass,grass},
    {mud,marble,marble,grass,marble,marble,grass,marble,grass,grass},
    {mud,grass,marble,marble,marble,marble,marble,marble,grass,grass},
    {mud,grass,grass,grass,marble,marble,grass,grass,grass},
    {mud,grass,grass,grass,marble,marble,grass,grass,grass,grass},
    {mud,grass,grass,grass,grass,grass,grass,grass,grass,grass},
    
  }

  wall = love.graphics.newImage('assets-1/dungeon/wall/catacombs_1.png')
  collision = {
    {wall, wall, wall, wall, wall, wall, wall, wall, wall, wall},
    {wall,'nil','nil','nil','nil','nil','nil','nil','nil', wall},
    {wall,'nil','nil','nil','nil','nil','nil','nil','nil', wall},
    {wall,'nil','nil','nil','nil','nil','nil','nil','nil', wall},
    {wall,'nil','nil','nil','nil','nil','nil','nil','nil', wall},
    {wall,'nil','nil','nil','nil','nil','nil','nil','nil', wall},
    {'nil','nil','nil','nil','nil','nil','nil','nil','nil', wall},
    {wall,'nil','nil','nil','nil','nil','nil','nil','nil', wall},
    {wall,'nil','nil','nil','nil','nil','nil','nil','nil', wall},
    {wall,grass,'nil','nil','nil','nil','nil','nil','nil', wall},
    {wall,'nil','nil','nil','nil','nil','nil','nil','nil', wall},
    {wall,'nil','nil','nil','nil','nil','nil','nil','nil', wall},
    {wall, wall, wall, wall, wall, wall, wall, wall, wall, wall},
    
  }

   map = Map:new(mapTemplate)
  collision = Map:new(collision)
end


function love.update(dt)
  if love.keyboard.isDown('down') then   -- if the 'up' key is being pressed...
    if collision:cc(x, y+2, 64, 64) == false then
    y = y + 2
    end
  end
  if love.keyboard.isDown('up') then   -- if the 'up' key is being pressed...
    if collision:cc(x, y-2, 64, 64) == false then
    y = y - 2
  end
end
  if love.keyboard.isDown('right') then   -- if the 'up' key is being pressed...
    if collision:cc(x + 2, y, 64, 64) == false then
    x = x + 2
  end
end
if love.keyboard.isDown('left') then   -- if the 'up' key is being pressed...
  if collision:cc(x-2, y, 64, 64) == false then
  x = x - 2
  end
end
 -- x, y, w, h all represent the player's rectangle. The other values are a rectangle in the upper corner
 if cc(x, y, w, h,   0, 0, 64, 64) then  
  -- if true, decrease HP:
  hp = hp - 1
 end
  if cc(x, y, 64, 64,   200, 200, 64, 64) == true then
  currentDoor = closedDoor
  end
end


function love.draw()
  map:draw()
  collision:draw()
  love.graphics.print('Hello, world!', 0, 0)
  --map:draw()

  --love.graphics.draw(secretpath, 400, 270)
  love.graphics.draw(statue, 385, 175, 0, 2)
  love.graphics.draw(jelly, 529, 210)
  love.graphics.draw(jelly2, 270, 210)
  love.graphics.draw(currentDoor, 385, 1 ,0,2)
love.graphics.draw(switch, 200, 200,0,2)
  love.graphics.draw(playerImg, x, y,0,2)
  
 
   -- Draw the rectangle in the upper left corner
   love.graphics.rectangle('line', 0, 0, 64, 64)

   -- Print the player's HP in the top left corner
   love.graphics.print(hp, 0, 0)

  end

local Map = require 'core/map'
love.graphics.setDefaultFilter('nearest', 'nearest')
local Util = require 'core/util'
function love.load()

  -- Create the player variables
  img = love.graphics.newImage('assets-1/player/base/octopode_1.png')
  x = 40
  y = 65
  playerImg = love.graphics.newImage('assets-2/dc-mon/glowing_shapeshifter.png')
  w = 64   -- The player's width is 64
  h = 64   -- The player's height is 64
  hp = 100 -- Set the player's HP to 100 at the start of the game
  ex = 529
  ey = 210
  eimg = love.graphics.newImage('assets-2/dc-mon/unique/dissolution.png')
  ex = 529
  ey = 460
  eimg2 = love.graphics.newImage('assets-2/dc-mon/jelly.png')
  ex = 270
  ey = 460
  finalBoss= love.graphics.newImage('assets-1/monster/dragons/golden_dragon.png')
  x=400
  y=300
  hp=100

  level = 1


  secretpath = love.graphics.newImage('assets-2/dc-dngn/gateways/stone_stairs_down.png')
  statue = love.graphics.newImage('assets-1/dungeon/statues/statue_angel.png')
  dgrass = love.graphics.newImage('assets-1/dungeon/floor/dirt_south.png')
  grass = love.graphics.newImage('assets-2/dc-dngn/floor/grass/grass_flowers_yellow1.png')
  waterwave = love.graphics.newImage('assets-1/dungeon/water/deep_water_wave_south_1.png')
  darkwater = love.graphics.newImage('assets-1/dungeon/water/shoals_deep_water_11.png')
  water = love.graphics.newImage('assets-1/dungeon/water/shoals_shallow_water_7.png')
  marble = love.graphics.newImage('assets-1/dungeon/floor/white_marble_4.png')
  wall = love.graphics.newImage('assets-1/dungeon/wall/catacombs_1.png')
  cobble = love.graphics.newImage('assets-1/dungeon/floor/cobble_blood_1.png')
  mud = love.graphics.newImage('assets-1/dungeon/floor/mud_1.png')
  openDoor = love.graphics.newImage('assets-1/dungeon/doors/vgate_open_middle.png')
closedDoor = love.graphics.newImage('assets-1/dungeon/doors/runed_door.png')
switch = love.graphics.newImage('assets-1/dungeon/traps/pressure_plate.png')
currentDoor = openDoor

mapTemplate2 = {
 {cobble,cobble,cobble,cobble,cobble,cobble,cobble,cobble,cobble,cobble},
 {cobble,cobble,cobble,cobble,cobble,cobble,cobble,cobble,cobble,cobble},
 {cobble,cobble,cobble,cobble,cobble,cobble,cobble,cobble,cobble,cobble},
 {cobble,cobble,cobble,cobble,cobble,cobble,cobble,cobble,cobble,cobble},
 {cobble,cobble,cobble,cobble,cobble,cobble,cobble,cobble,cobble,cobble},
 {cobble,cobble,cobble,cobble,cobble,cobble,cobble,cobble,cobble,cobble},
 {cobble,cobble,cobble,cobble,cobble,cobble,cobble,cobble,cobble,cobble},
 {cobble,cobble,cobble,cobble,cobble,cobble,cobble,cobble,cobble,cobble},
 {cobble,cobble,cobble,cobble,cobble,cobble,cobble,cobble,cobble,cobble},
 {cobble,cobble,cobble,cobble,cobble,cobble,cobble,cobble,cobble,cobble},
 {cobble,cobble,cobble,cobble,cobble,cobble,cobble,cobble,cobble,cobble},
 {cobble,cobble,cobble,cobble,cobble,cobble,cobble,cobble,cobble,cobble},
 {cobble,cobble,cobble,cobble,cobble,cobble,cobble,cobble,cobble,cobble},
  
}

mapTemplate = {
    {mud,dgrass,mud,mud,mud,mud,mud,mud,mud,mud},
    {mud,dgrass,darkwater,darkwater,darkwater,darkwater,darkwater,darkwater,darkwater,darkwater},
    {mud,dgrass,darkwater,darkwater,darkwater,darkwater,darkwater,darkwater,darkwater,darkwater},
    {mud,marble,marble,marble,marble,marble,marble,marble,darkwater},
    {mud,marble,darkwater,darkwater,darkwater,darkwater,darkwater,marble,darkwater,darkwater},
    {mud,marble,darkwater,marble,darkwater,darkwater,marble,marble,darkwater,darkwater,d},
    {marble,marble,darkwater,marble,marble,marble,marble,marble,darkwater,darkwater,darkwater},
    {mud,marble,darkwater,marble,darkwater,darkwater,marble,marble,darkwater,darkwater,darkwater},
    {mud,marble,darkwater,darkwater,darkwater,darkwater,darkwater,marble,darkwater,darkwater},
    {mud,marble,marble,marble,marble,marble,marble,marble,darkwater,darkwater},
    {mud,dgrass,darkwater,darkwater,darkwater,darkwater,darkwater,darkwater,darkwater},
    {mud,dgrass,darkwater,darkwater,darkwater,darkwater,darkwater,darkwater,darkwater,darkwater},
    {mud,dgrass,darkwater,darkwater,darkwater,darkwater,darkwater,darkwater,darkwater,darkwater},
    
  }

  wall = love.graphics.newImage('assets-1/dungeon/wall/catacombs_1.png')
  darkwater = love.graphics.newImage('assets-1/dungeon/water/shoals_deep_water_11.png')
  collision = {
    {wall, 'nil',darkwater,darkwater,darkwater,darkwater,darkwater,darkwater, darkwater,darkwater},
    {wall,'nil',darkwater,darkwater,darkwater,darkwater,darkwater,darkwater,darkwater, darkwater},
    {wall,'nil',darkwater,darkwater,darkwater,darkwater,darkwater,darkwater,darkwater, darkwater},
    {wall,'nil','nil','nil','nil','nil','nil','nil',darkwater, darkwater},
    {wall,'nil',darkwater,darkwater,darkwater,darkwater,darkwater,'nil',darkwater, darkwater},
    {wall,'nil',darkwater,'nil',darkwater,darkwater,'nil','nil',darkwater,darkwater},
    {marble,'nil',darkwater,'nil','nil','nil','nil','nil',darkwater,darkwater},
    {wall,'nil',darkwater,'nil',darkwater,darkwater,'nil','nil',darkwater, darkwater},
    {wall,'nil',darkwater,darkwater,darkwater,darkwater,darkwater,'nil',darkwater,darkwater},
    {wall,'nil','nil','nil','nil','nil','nil','nil',darkwater, darkwater},
    {wall,'nil',darkwater,darkwater,darkwater,darkwater,darkwater,darkwater,darkwater, darkwater},
    {wall,'nil',darkwater,darkwater,darkwater,darkwater,darkwater,darkwater,darkwater, darkwater},
    {wall,'nil',darkwater,darkwater,darkwater,darkwater,darkwater,darkwater, darkwater,darkwater},
    
  }
   map2 = Map:new(mapTemplate2)
   map = Map:new(mapTemplate)
  collision = Map:new(collision)
end


function love.update(dt)
  if love.keyboard.isDown('down') then   -- if the 'up' key is being pressed...
    if collision:cc(x+12, y+3, 40, 64) == false then
    y = y + 3
    end
  end
  if love.keyboard.isDown('up') then   -- if the 'up' key is being pressed...
    if collision:cc(x+12, y-3, 40, 64) == false then
    y = y - 3
  end
end
  if love.keyboard.isDown('right') then   -- if the 'up' key is being pressed...
    if collision:cc(x + 3, y, 40, 64) == false then
    x = x + 3
  end
end
if love.keyboard.isDown('left') then   -- if the 'up' key is being pressed...
  if collision:cc(x-3, y, 40, 64) == false then
  x = x - 3
  end
end
 -- x, y, w, h all represent the player's rectangle. The other values are a rectangle in the upper corner
 if cc(x, y, w, h,   0, 0, 40, 64) then  
  -- if true, decrease HP:
  hp = hp - 1
 end
 if ex < 500 then
  ex = ex + 1
 end
  if cc(x, y, 64, 64,   200, 200, 64, 64) == true then
  currentDoor = closedDoor

 

  --if finalBoss hp < 0 then
    --love.exitModule();

  if love.keyboard.isDown('escape') then
    love.exitModule();
  end
  end
end


function love.draw()
  if level == 1 then
   -- map:draw()
    collision:draw()
  end
  if level == 2 then
    map2:draw()-- what goes here1?
  end
  love.graphics.print('Hello, world!', 0, 0)
  --map:draw()

  love.graphics.draw(secretpath, 450, 192,0,2)
  --love.graphics.draw(statue, 385, 175, 0, 2)
  love.graphics.draw(currentDoor, 385,1)
love.graphics.draw(switch, 193, 200,0,2)
  love.graphics.draw(playerImg, x, y,0,2)

  love.graphics.draw(eimg, ex, ey)
  love.graphics.draw(eimg2, ex, ey)
   -- Draw the rectangle in the upper left corner
   love.graphics.rectangle('line', x + 12, y, 40, 64)

   -- Print the player's HP in the top left corner
   love.graphics.print(hp, 0, 0)

  end

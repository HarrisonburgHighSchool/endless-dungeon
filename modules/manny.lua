 local Map = require 'core/map'
 local Util = require 'core/util'

function love.load()
  x = 500
  y = 100
  playerImg = love.graphics.newImage('assets-1/monster/demons/balrug.png')
  floorTile = love.graphics.newImage('assets-1/dungeon/floor/cobble_blood_1.png')
  altar     = love.graphics.newImage('assets-1/dungeon/floor/cobble_blood_1.png')
  wall = love.graphics.newImage('assets-1/dungeon/floor/black_cobalt_1.png')
  -- template = { --a 6 x 6 map with the altar texture in the middle
  --              {floorTile, floorTile, floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile},
  --              {floorTile,floorTile, floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,},
  --              {floorTile, floorTile, floorTile, floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,},
  --              {floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,},
  --              {floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,},
  --              {floorTile,floorTile,floorTile,floorTile,floorTile,foolTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,},
  --              {floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,},
  --              {floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floor,Tile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,},
  --              {floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,},
  --              {floorTile,floorTile,floorTile,floorTile,floorTilefloorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,},
  --              {floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,},
  --              {floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,},
  --              {floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floor,floorTile,floorTile,floorTile,floorTile,floorTile,},
  --            }

  template = {
    {floorTile, floorTile, floorTile},
    {floorTile, floorTile, floorTile},
    {floorTile, floorTile, floorTile},
  }
  map = Map:new(template)


  walls = {
    {wall, wall, wall,wall,wall,wall,wall,wall,wall,wall,wall,},
    {wall, 'nil', 'nil',},
    {wall,},
    {wall,wall,wall,wall,wall,wall,'nil',wall,wall,wall,},
    {wall,wall,wall,wall,wall,'nil','nil','nil',wall,wall,},
    {wall,},
    {wall,wall,wall,wall,wall,wall,wall,wall,wall,wall,'nil'},
    {wall,},
    {wall,},
    {wall,wall,wall,wall,wall,wall,wall,wall,wall,},
    {wall,wall,},
    {wall,wall,},
    {wall,wall,wall,wall,wall,wall,wall,wall,wall,wall,wall,},
  }

  collision = Map:new(walls, 64)

end
function love.update(dt)
  if love.keyboard.isDown('up') then
    if collision:cc(x, y - 4, 32, 32) == false then
      y = y - 4
    end
  end
  if love.keyboard.isDown('down') then
    if collision:cc(x, y + 4, 32, 32) == false then
      y = y + 4
    end
  end
  if love.keyboard.isDown('left') then
    if collision:cc(x - 4, y,32, 32) == false then
         x = x - 4
    end
  end
  if love.keyboard.isDown('right') then
    if collision:cc(x + 4, y,32, 32) == false then
      x = x + 4
    end
  end
end

function love.draw()
  map:draw()
  collision:draw()
  love.graphics.print('play here !', 0, 0)
  love.graphics.draw(playerImg, x, y)
  --love.exitModule();
end

local Map = require 'core/map'
local Util = require 'core/util'

function love.load()
  
  wall = love.graphics.newImage('assets-1/dungeon/wall/catacombs_1.png')
  floor = love.graphics.newImage('assets-1/dungeon/floor/crypt_10.png')
  
  template = {
    {wall, wall, wall, wall, wall, wall, wall, wall, wall},
    {wall, floor, floor, floor, floor, floor, floor, floor, wall},
    {wall, floor, wall, wall, wall, wall, wall, floor, wall},
    {wall, floor, wall, floor, floor, floor, wall, floor, wall},
    {wall, floor, wall, floor, wall, floor, wall, floor, wall},
    {wall, floor, wall, floor, wall, floor, wall, floor, wall},
    {wall, floor, wall, floor, wall, floor, wall, floor, wall},
    {wall, floor, wall, floor, wall, floor, wall, floor, wall},
    {wall, floor, wall, floor, wall, floor, wall, floor, wall},
    {wall, floor, floor, floor, wall, floor, wall, floor, wall},
    {wall, floor, floor, floor, floor, floor, wall, floor, wall},
    {wall, wall, wall, wall, wall, wall, wall, floor, wall}}
  map = Map:new(template)
  x = 400
  y = 300
  w = 64
  h = 64
  hp = 100
  playerImg = love.graphics.newImage('assets-1/player/base/octopode_3.png')
end


function love.update(dt)
  if love.keyboard.isDown('up') then
  y=y-5
  end
  if love.keyboard.isDown('down') then
  y=y+5
  end
  if love.keyboard.isDown('right') then
  x=x+5
  end
  if love.keyboard.isDown('left') then
  x=x-5
  end

  if cc(x, y, w, h,   0, 0, 64, 64) then  
    hp = hp - 1
  end

end


function love.draw()
  map:draw()

  love.graphics.rectangle('line', 0, 0, 64, 64)

  love.graphics.draw(playerImg, x, y)

  love.graphics.print(hp, 0, 0)
end

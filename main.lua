local Map = require 'core/map'

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
    {wall, floor, wall, wall, wall, floor, wall, floor, wall},
    {wall, floor, floor, floor, floor, floor, wall, floor, wall},
    {wall, wall, wall, wall, wall, wall, wall, floor, wall}}
  map = Map:new(template)
  x = 400
  y = 300
  playerImg = love.graphics.newImage('assets-1/player/base/octopode_3.png')
end


function love.update(dt)
  if love.keyboard.isDown('up') then
  y=y-100
  end
  if love.keyboard.isDown('down') then
  y=y+100
  end
  if love.keyboard.isDown('right') then
  x=x+100
  end
  if love.keyboard.isDown('left') then
  x=x-100
  end

  
end


function love.draw()
  map:draw()

  love.graphics.draw(playerImg, x, y)
end

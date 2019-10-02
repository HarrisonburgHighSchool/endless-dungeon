local Map = require 'core/map'

function love.load()
  
  wall = love.graphics.newImage('assets-1/dungeon/wall/crystal_wall_yellow.png')
  floor = love.graphics.newImage('assets-1/dungeon/floor/white_marble_0.png')
  template = {
    {floor, floor, floor, floor, floor, floor},
    {floor, floor, wall, floor, floor, floor},
    {floor, wall, wall, wall, wall, floor},
    {floor, floor, wall, floor, floor, floor},
    {floor, floor, floor, floor, floor, floor}}
  map = Map:new(template)
end


function love.update(dt)
  --if love.keyboard.isDown('up') then
  --y=y-1
  --end
  --if love.keyboard.isDown('down') then
  --y=y+1
  --end
  --if love.keyboard.isDown('right') then
  --x=x+1
  --end
  --if love.keyboard.isDown('left') then
  --x=x-1
  --end

  
end

function love.update(dt)
  -- Nothing to update yet
end

function love.draw()
  
  map:draw()

end


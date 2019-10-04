
function love.load()
  
  wall = love.graphics.newImage('assets-1/dungeon/wall/catacombs_1.png')
  floor = love.graphics.newImage('assets-1/dungeon/floor/crypt_10.png')
  door = love.graphics.newImage('assets-1/dungeon/doors/runed_door.png')
  template = {
    {wall, wall, wall, wall, wall, wall, wall, wall, wall},
    {wall, floor, floor, floor, floor, floor, floor, floor, wall},
    {wall, floor, floor, floor, floor, floor, floor, floor, wall},
    {wall, floor, floor, floor, floor, floor, floor, floor, wall},
    {wall, floor, floor, floor, floor, floor, floor, floor, wall},
    {wall, floor, floor, floor, floor, floor, floor, floor, wall},
    {wall, floor, floor, floor, floor, floor, floor, floor, wall},
    {wall, floor, floor, floor, floor, floor, floor, floor, wall},
    {wall, floor, floor, floor, floor, floor, floor, floor, wall},
    {wall, floor, floor, floor, floor, floor, floor, floor, wall},
    {wall, floor, floor, floor, floor, floor, floor, floor, wall},
    {wall, wall, wall, wall, wall, wall, wall, wall, wall},}
  map = Map:new(template)
  x = 400
  y = 300
  playerImg = love.graphics.newImage('assets-1/player/base/octopode_3.png')
end


function love.update(dt)
  if love.keyboard.isDown('up') thens
  y=y-1
  end
  if love.keyboard.isDown('down') then
  y=y+1
  end
  if love.keyboard.isDown('right') then
  x=x+1
  end
  if love.keyboard.isDown('left') then
  x=x-1
  end

  
end


function love.draw()
  
  map:draw()

  love.graphics.draw(playerImg, x, y)
end

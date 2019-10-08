love.graphics.setDefaultFilter('nearest', 'nearest')
local Map = require 'core/map'
function love.load()


  x = 400
  y = 300

  tile = love.graphics.newImage('assets-1/dungeon/floor/etched_1.png')
  tile2 = love.graphics.newImage('assets-1/dungeon/floor/cage_1.png')
  tile3 = love.graphics.newImage('assets-1/dungeon/doors/vgate_sealed_up.png')
  tile4 = love.graphics.newImage('assets-1/dungeon/traps/shadow.png')
  playerImg = love.graphics.newImage('assets-1/player/base/lorc_female_5.png')

  map = {
    {tile, tile, tile, tile2, tile2, tile2, tile, tile, tile, tile},
    {tile, tile, tile ,tile2, tile2, tile2, tile, tile, tile, tile},
    {tile, tile, tile, tile2, tile2, tile2, tile, tile, tile, tile},
    {tile, tile2, tile2, tile2, tile2, tile2, tile2, tile2, tile, tile},
    {tile, tile2, tile2, tile2, tile2, tile2, tile2, tile2, tile, tile},
    {tile2, tile2, tile2, tile2, tile2, tile2, tile2, tile2, tile2, tile3},
    {tile2, tile2, tile2, tile2, tile2, tile2, tile2, tile2, tile2, tile3},
    {tile2, tile2, tile2, tile2, tile2, tile2, tile2, tile2, tile2, tile3},
    {tile4, tile2, tile2, tile2, tile2, tile2, tile2, tile2, tile, tile},
    {tile4, tile2, tile2, tile2, tile2, tile2, tile2, tile2, tile, tile},
    {tile, tile4, tile4, tile2, tile2, tile2, tile, tile, tile, tile},
    {tile4, tile4, tile, tile2, tile2, tile2, tile, tile, tile, tile},
    {tile4, tile, tile, tile3, tile3, tile3, tile, tile, tile, tile}
  }
  bkgrnd = Map:new(map)

end



function love.update(dt)
  if love.keyboard.isDown('right') then
    x=x+10
  end
  if love.keyboard.isDown('left') then
    x=x-10
  end
  if love.keyboard.isDown('up') then
    y=y-10
  end
  if love.keyboard.isDown('down') then
    y=y+10
  end
end




function love.draw()
  bkgrnd:draw()
  love.graphics.print('Hello, world!', 0, 0)
  love.graphics.draw(playerImg, x, y)
end

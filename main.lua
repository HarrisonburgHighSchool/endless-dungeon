love.graphics.setDefaultFilter('nearest', 'nearest')
function love.load()


  x = 400
  y = 300

  tile = love.graphics.newImage('assets-1/dungeon/floor/black_cobalt_4.png')
  tile2 = love.graphics.newImage('assets-1/dungeon/wall/cobalt_stone_9.png')
  tile3 = love.graphics.newImage('assets-1/dungeon/wall/bars_red_1.png')
  playerImg = love.graphics.newImage('assets-1/player/base/naga_red_female.png')

  map = {
    {tile, tile, tile, tile2, tile2, tile2, tile, tile, tile, tile},
    {tile, tile, tile ,tile2, tile2, tile2, tile, tile, tile, tile},
    {tile, tile, tile, tile2, tile2, tile2, tile, tile, tile, tile},
    {tile, tile2, tile2, tile2, tile2, tile2, tile2, tile2, tile, tile},
    {tile, tile2, tile2, tile2, tile2, tile2, tile2, tile2, tile, tile},
    {tile2, tile2, tile2, tile2, tile2, tile2, tile2, tile2, tile2, tile3},
    {tile2, tile2, tile2, tile2, tile2, tile2, tile2, tile2, tile2, tile3},
    {tile2, tile2, tile2, tile2, tile2, tile2, tile2, tile2, tile2, tile3},
    {tile, tile2, tile2, tile2, tile2, tile2, tile2, tile2, tile, tile},
    {tile, tile2, tile2, tile2, tile2, tile2, tile2, tile2, tile, tile},
    {tile, tile, tile, tile2, tile2, tile, tile, tile, tile, tile},
    {tile, tile, tile, tile2, tile2, tile2, tile, tile, tile, tile},
    {tile, tile, tile, tile2, tile3, tile3, tile, tile, tile, tile}
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

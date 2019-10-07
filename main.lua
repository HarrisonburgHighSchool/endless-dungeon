love.graphics.setDefaultFilter('nearest', 'nearest')
function love.load()


  x = 400
  y = 300

  tile = love.graphics.newImage('assets-1/dungeon/floor/etched_1.png')
  tile2 = love.graphics.newImage('assets-1/dungeon/wall/crystal_wall_blue.png')
  tile3 = love.graphics.newImage('assets-1/dungeon/wall/bars_red_1.png')
  tile4 = love.graphics.newImage('assets-1/dungeon/floor/acidic_floor_0.png')
  tile5 = love.graphics.newImage('assets-1/dungeon/floor/acidic_floor_1.png')
  tile6 = love.graphics.newImage('assets-1/dungeon/floor/acidic_floor_2.png')
  tile7 = love.graphics.newImage('assets-1/dungeon/floor/acidic_floor_3.png')
  playerImg = love.graphics.newImage('assets-1/player/base/naga_red_female.png')

  map = {
    {tile4, tile5, tile6, tile2, tile2, tile2, tile4, tile5, tile6, tile7},
    {tile7, tile4, tile5, tile2, tile2, tile2, tile7, tile4, tile5, tile6},
    {tile6, tile7, tile4, tile2, tile2, tile2, tile6, tile7, tile4, tile5},
    {tile5, tile6, tile7, tile2, tile2, tile2, tile5, tile6, tile7, tile4},
    {tile4, tile5, tile6, tile2, tile2, tile2, tile4, tile5, tile6, tile7},
    {tile2, tile2, tile2, tile2, tile2, tile2, tile2, tile2, tile2, tile3},
    {tile2, tile2, tile2, tile2, tile2, tile2, tile2, tile2, tile2, tile3},
    {tile2, tile2, tile2, tile2, tile2, tile2, tile2, tile2, tile2, tile3},
    {tile5, tile6, tile7, tile2, tile2, tile2, tile, tile, tile, tile},
    {tile6, tile7, tile4, tile2, tile2, tile2, tile, tile, tile, tile},
    {tile7, tile4, tile5, tile2, tile2, tile2, tile, tile, tile, tile},
    {tile4, tile5, tile6, tile2, tile2, tile2, tile, tile, tile, tile},
    {tile5, tile6, tile7, tile3, tile3, tile3, tile, tile, tile, tile}
  }
  bkgrnd = Map:new(map)

end



function love.update(dt)
  if love.keyboard.isDown('right') then
    x=x+7
  end
  if love.keyboard.isDown('left') then
    x=x-7
  end
  if love.keyboard.isDown('up') then
    y=y-7
  end
  if love.keyboard.isDown('down') then
    y=y+7
  end
end




function love.draw()
  bkgrnd:draw()
  love.graphics.print('Hello, world!', 0, 0)
  love.graphics.draw(playerImg, x, y)
end

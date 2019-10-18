love.graphics.setDefaultFilter('nearest', 'nearest')
local Map = require 'core/map'
function love.load()


  x = 400
  y = 300
img = love.graphics.newImage('assets-1/player/base/octopode_1.png')
  tile = love.graphics.newImage('assets-1/dungeon/floor/etched_1.png')
  tile2 = love.graphics.newImage('assets-1/dungeon/floor/cage_1.png')
  tile3 = love.graphics.newImage('assets-1/dungeon/doors/vgate_sealed_up.png')
  tile4 = love.graphics.newImage('assets-1/dungeon/traps/shadow.png')
  playerImg = love.graphics.newImage('assets-1/player/base/lorc_female_5.png')

  background = {
    {tile, tile, tile, tile2, tile2, tile2, tile, tile, tile, tile},
    {tile, tile, tile ,tile2, tile2, tile2, tile, tile, tile, tile},
    {tile, tile, tile, tile2, tile2, tile2, tile, tile, tile, tile},
    {tile, tile2, tile2, tile2, tile2, tile2, tile2, tile2, tile, tile},
    {tile, tile2, tile2, tile2, tile2, tile2, tile2, tile2, tile, tile},
`    {tile2, tile2, tile2, tile2, tile2, tile2, tile2, tile2, tile2, tile3},
`    {tile2, tile2, tile2, tile2, tile2, tile2, tile2, tile2, tile2, tile3},
    {tile2, tile2, tile2, tile2, tile2, tile2, tile2, tile2, tile2, tile3},
    {tile4, tile2, tile2, tile2, tile2, tile2, tile2, tile2, tile, tile},
    {tile4, tile2, tile2, tile2, tile2, tile2, tile2, tile2, tile, tile},
    {tile, tile4, tile4, tile2, tile2, tile2, tile, tile, tile, tile},
    {tile4, tile4, tile, tile2, tile2, tile2, tile, tile, tile, tile},
    {tile4, tile, tile, tile3, tile3, tile3, tile, tile, tile, tile}
  }

  collision = {
    {tile, tile, tile, 'nil', 'nil', 'nil', tile, tile, tile, tile},
    {tile, tile, tile ,'nil', 'nil', 'nil', tile, tile, tile, tile},
    {tile, tile, tile, 'nil', 'nil', 'nil', tile, tile, tile, tile},
    {tile, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', tile, tile},
    {tile, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', tile, tile},
    {'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', tile3},
    {'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', tile3},
    {'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', tile3},
    {tile4, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', tile, tile},
    {tile4, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', tile, tile},
    {tile, tile4, tile4, 'nil', 'nil', 'nil', tile, tile, tile, tile},
    {tile4, tile4, tile, 'nil', 'nil', 'nil', tile, tile, tile, tile},
    {tile4, tile, tile, tile3, tile3, tile3, tile, tile, tile, tile}
  }
  bkgrnd = Map:new(map)
  -- floor = love.graphics.newImage('assets-1/dungeon/floor/black_cobalt_1.png')
  --   background = {
  --     {tile2, tile2, tile2, tile2},
  --     {tile2, tile2, tile2, tile2},
  --     {tile2, tile2, tile2, tile2},
  --     {tile2, tile2, tile2, tile2},
  --   }
  --   wall = love.graphics.newImage('assets-1/dungeon/wall/catacombs_1.png')
  --     collision = {
  --       {tile, tile, tile, tile},
  --       {tile, 'nil', 'nil', tile},
  --       {tile, 'nil', 'nil', tile},
  --       {tile, 'nil', 'nil', tile},
  --     }
      background = Map:new(background)
        collision = Map:new(collision)

end




function love.update(dt)
  if love.keyboard.isDown('up') then
    if collision:cc(x, y - 1, 64, 64) == false then
      y = y - 1
    end
  end
  if love.keyboard.isDown('down') then
    if collision:cc(x, y + 1, 64, 64) == false then
      y = y + 1
    end
  end
  if love.keyboard.isDown('right') then
    if collision:cc(x + 1, y, 64, 64) == false then
      x = x + 1
    end
  end
  if love.keyboard.isDown('left') then
    if collision:cc(x - 1, y, 64, 64) == false then
      x = x - 1
    end
  end


end



function love.draw()
  --bkgrnd:draw()
  background:draw()
  collision:draw()
  love.graphics.print('Hello, world!', 0, 0)
  love.graphics.draw(playerImg, x, y)
end

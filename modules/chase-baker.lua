local Map = require 'core/map'
local Util = require 'core/util'
local gamera = require 'core/gamera'
love.graphics.setDefaultFilter('nearest', 'nearest')

function love.load()
  cam = gamera.new(0, 0, 960, 625)
  weapon = love.graphics.newImage('assets-1/player/hand_right/long_sword_slant.png')
  shield = love.graphics.newImage('assets-1/player/hand_left/shield_goblin.png')
  playerImg = love.graphics.newImage('assets-1/monster/human.png')
  x = 100
  y = 250
  enemy = {
   x2 = 460,
   y2 = 250,
   img = love.graphics.newImage('assets-1/monster/ironheart_preserver.png'),
 }
  knight1 = {
   x2 = 600,
   y2 = 350,
   img = love.graphics.newImage('assets-1/monster/ironbrand_convoker.png'),
 }
  knight2 = {
   x2 = 700,
   y2 = 100,
   img = love.graphics.newImage('assets-1/monster/ironbrand_convoker.png'),
 }
  questItem = love.graphics.newImage('assets-1/item/amulet/artefact/urand_vitality.png')
  g = 775
  b = 270
  tile = love.graphics.newImage('assets-1/dungeon/floor/sand_6.png')
  path = love.graphics.newImage('assets-1/dungeon/wall/lab-stone_0.png')
  w = 36   -- The player's width is 64
  h = 36   -- The player's height is 64
  hp = 100
  ehp1 = 100
  ehp2 = 100
  ehp3 = 100 -- Set the player's HP to 100 at the start of the game


  template = { --a 3 x 3 map with the altar texture in the middle
                 {tile, tile, tile, tile, path, tile, tile, tile, tile},
                 {tile, tile, tile, tile, path, tile, tile, tile, tile},
                 {tile, tile, tile, tile, path, tile, tile, tile, tile},
                 {tile, tile, tile, tile, path, tile, tile, tile, tile},
                 {tile, tile, tile, tile, path, tile, tile, tile, tile},
                 {tile, tile, tile, tile, path, tile, tile, tile, tile},
                 {tile, tile, tile, tile, path, tile, tile, tile, tile},
                 {tile, tile, tile, tile, path, tile, tile, tile, tile},
                 {tile, tile, tile, tile, path, tile, tile, tile, tile},
                 {tile, tile, tile, tile, path, tile, tile, tile, tile},
                 {tile, tile, tile, tile, path, tile, tile, tile, tile},
                 {tile, tile, tile, tile, path, tile, tile, tile, tile},
                 {tile, tile, tile, tile, path, tile, tile, tile, tile},
                 {tile, tile, tile, tile, path, tile, tile, tile, tile},
                 {tile, tile, tile, tile, path, tile, tile, tile, tile},
               }
  map = Map:new(template)


  wall = love.graphics.newImage('assets-1/dungeon/wall/shoals_wall_1.png')
  walls = {
                  {wall, tile, tile, tile, path, tile, tile, tile, tile, wall},
                  {wall, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', wall},
                  {wall, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', wall},
                  {wall, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', wall},
                  {wall, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', wall},
                  {wall, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', wall},
                  {wall, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', wall},
                  {wall, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', wall},
                  {wall, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', wall},
                  {wall, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', wall},
                  {wall, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', wall},
                  {wall, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', wall},
                  {wall, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', wall},
                  {wall, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', wall},
                  {wall, tile, tile, tile, path, tile, tile, tile, tile, wall},
                }
    collision = Map:new(walls)


end




function love.update(dt)
  enemy.x2 = enemy.x2
  enemy.y2 = enemy.y2
  knight1.x2 = knight1.x2
  knight1.y2 = knight1.y2
  knight2.x2 = knight2.x2
  knight2.y2 = knight2.y2

  if x < 0 then
    x = 0
  end
  if y < 0 then
    y = 0
  end
  if x > 960 then
    x = 960
  end
  if y > 960 then
    y = 960
  end
  if enemy.x2 < 60 then
    enemy.x2 = 60
  end
  if enemy.y2 < 60 then
    enemy.y2 = 60
  end
  if enemy.x2 > 900 then
    enemy.x2 = 900
  end
  if enemy.y2 > 800 then
    enemy.y2 = 800
  end
  if love.keyboard.isDown('right') then
    if collision:cc(x + 1, y, 36, 36) == false then
     x = x + 2
   end
  end
  if love.keyboard.isDown('left') then
    if collision:cc(x - 1, y, 36, 36) == false then
     x = x - 2
   end
  end
  if love.keyboard.isDown('down') then
    if collision:cc(x, y + 1, 36, 36) == false then
     y = y + 2
   end
  end
  if love.keyboard.isDown('up') then
    if collision:cc(x, y - 1, 36, 36) == false then
     y = y - 2
   end
  end
  if love.keyboard.isDown('w') then
   if cc(x - 25, y - 25, 86, 86,   enemy.x2, enemy.y2, 36, 36) then
     ehp1 = ehp1 - 10
   end
  end
  if love.keyboard.isDown('w') then
   if cc(x - 25, y - 25, 86, 86,   knight1.x2, knight1.y2, 36, 36) then
     ehp2 = ehp2 - 10
   end
  end
  if love.keyboard.isDown('w') then
   if cc(x - 25, y - 25, 86, 86,   knight2.x2, knight2.y2, 36, 36) then
     ehp3 = ehp3 - 10
   end
  end
  -- Enemy movement stuff

  if x > enemy.x2 then
    enemy.x2 = enemy.x2 + 1
  end
  if x < enemy.x2 then
    enemy.x2 = enemy.x2 - 1
  end
  if y > enemy.y2 then
    enemy.y2 = enemy.y2 + 1
  end
  if y < enemy.y2 then
    enemy.y2 = enemy.y2 - 1
  end
  if x > knight1.x2 then
    knight1.x2 = knight1.x2 + 1
  end
  if x < knight1.x2 then
    knight1.x2 = knight1.x2 - 1
  end
  if y > knight1.y2 then
    knight1.y2 = knight1.y2 + 1
  end
  if y < knight1.y2 then
    knight1.y2 = knight1.y2 - 1
  end
  if x > knight2.x2 then
    knight2.x2 = knight2.x2 + 1
  end
  if x < knight2.x2 then
    knight2.x2 = knight2.x2 - 1
  end
  if y > knight2.y2 then
    knight2.y2 = knight2.y2 + 1
  end
  if y < knight2.y2 then
    knight2.y2 = knight2.y2 - 1
  end

  cam:setPosition(x, y)
  -- x, y, w, h all represent the player's rectangle. The other values are a rectangle in the upper corner
  if cc(x, y, w, h,   enemy.x2, enemy.y2, 36, 36) then
    -- if true, decrease HP:
    hp = hp - 10
  end
  if cc(x, y, w, h,   knight1.x2, knight1.y2, 36, 36) then
    -- if true, decrease HP:
    hp = hp - 10
  end
  if cc(x, y, w, h,   knight2.x2, knight2.y2, 36, 36) then
    -- if true, decrease HP:
    hp = hp - 10
  end
  if cc(x, y, w, h,   g, b, 36, 36) then
   love.exitModule()
  end
 end






function love.draw()
  cam:draw(function(l, t, w, h)
  map:draw()
  collision:draw()
  love.graphics.draw(weapon, x, y)
  love.graphics.draw(playerImg, x, y)
  love.graphics.draw(shield, x + 2, y)
  love.graphics.draw(enemy.img, enemy.x2, enemy.y2)
  love.graphics.draw(knight1.img, knight1.x2, knight1.y2)
  love.graphics.draw(knight2.img, knight2.x2, knight2.y2)
  love.graphics.draw(questItem, g, b)
  if hp < 1 then
    x = 500
    y = 270
    love.graphics.print('GAME OVER', x, y + -36)
    hp = 0
  end
  if ehp1 < 1 then
    ehp1 = 0
    enemy.x2 = 10000000
    enemy.y2 = 10000000
  end
  if ehp2 < 1 then
    ehp2 = 0
    knight1.x2 = 10000000
    knight1.y2 = 10000000
  end
  if ehp3 < 1 then
    ehp3 = 0
    knight2.x2 = 10000000
    knight2.y2 = 10000000
  end
  -- Print the player's HP in the top left corner
  love.graphics.print(hp, x, y + -18)
  love.graphics.print(ehp1, enemy.x2, enemy.y2 + -18)
  love.graphics.print(ehp2, knight1.x2, knight1.y2 + -18)
  love.graphics.print(ehp3, knight2.x2, knight2.y2 + -18)
    --Draw everything here. For example:
  end)
end

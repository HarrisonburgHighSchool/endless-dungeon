local Map = require 'core/map'
local Util = require 'core/util'
local anim8 = require 'core/anim8'
love.graphics.setDefaultFilter('nearest', 'nearest')

function love.load()
  love.window.setMode(768, 576)

message = ""
timer = 200

buttonPressed = false

player = {
  x = 373,
  y = 468,
  w = 64,   -- The player's width is 64
  h = 64,   -- The player's height is 64
  hp = 100, -- Set the player's HP to 100 at the start of the game
  moving = false,
  flip = 2,
  img = love.graphics.newImage('hero/sliced/idle-1.png'),
  spritesheet = love.graphics.newImage('hero/Old hero.png'),
}

enemy = {
  x = 375,
  y = 100,
  w = 64,
  h = 64,
  hp = 100,
  img = love.graphics.newImage('assets-1/monster/demons/chaos_spawn_2_large.png'),
}


  grid = anim8.newGrid(16, 16, player.spritesheet:getWidth(), player.spritesheet:getHeight())
  player.walk = anim8.newAnimation(grid('1-6', 2), 0.2)

  rectFloor = love.graphics.newImage('assets-1/dungeon/floor/rect_gray_0.png')
  rect1Floor = love.graphics.newImage('assets-1/dungeon/floor/rect_gray_1.png')
  rect2Floor = love.graphics.newImage('assets-1/dungeon/floor/rect_gray_2.png')
  rect3Floor = love.graphics.newImage('assets-1/dungeon/floor/rect_gray_3.png')
  wall = love.graphics.newImage('assets-1/dungeon/wall/stone_2_dark0.png')
  gateway = love.graphics.newImage('assets-2/dc-dngn/gateways/dngn_enter_dis.png')
  trap1 = love.graphics.newImage('assets-2/dc-dngn/dngn_trap_axe.png')
  transp = love.graphics.newImage('assets-1/dungeon/floor/tans.png')

  template = {
 
  {wall, wall, wall, wall, wall, wall, wall, wall, wall, wall},
  {gateway, rect1Floor, rect2Floor, rect3Floor, rectFloor, rect1Floor, rect2Floor, rect3Floor, wall},
  {gateway, rect1Floor, rect2Floor, rect3Floor, rectFloor, rect1Floor, rect2Floor, rect3Floor, wall},
  {gateway, rect1Floor, rect2Floor, rect3Floor, rectFloor, rect1Floor, rect2Floor, rect3Floor, wall},
  {gateway, rect1Floor, rect2Floor, rect3Floor, rectFloor, rect1Floor, rect2Floor, rect3Floor, wall},
  {gateway, rect1Floor, rect2Floor, rect3Floor, rectFloor, rect1Floor, rect2Floor, rect3Floor, wall},
  {gateway, rect1Floor, rect2Floor, rect3Floor, rectFloor, rect1Floor, rect2Floor, rect3Floor, wall},
  {gateway, rect1Floor, rect2Floor, rect3Floor, rectFloor, rect1Floor, rect2Floor, rect3Floor, wall},
  {gateway, rect1Floor, rect2Floor, rect3Floor, rectFloor, rect1Floor, rect2Floor, rect3Floor, wall},
  {gateway, rect1Floor, rect2Floor, rect3Floor, rectFloor, rect1Floor, rect2Floor, rect3Floor, wall},
  {gateway, rect1Floor, rect2Floor, rect3Floor, rectFloor, rect1Floor, rect2Floor, rect3Floor, wall},
  {wall, wall, wall, wall, wall, wall, wall, wall, wall, wall},
}
 
  collision = {
    {wall, wall, wall, wall, wall, wall, wall, wall, wall, wall},
  {nil, nil, nil, nil, nil, nil, nil, nil, wall},
  {nil, nil, nil, nil, nil, nil, nil, nil, wall},
  {nil, nil, nil, nil, nil, nil, nil, nil, wall},
  {nil, nil, nil, nil, nil, nil, nil, nil, wall},
  {nil, nil, nil, nil, nil, nil, nil, nil, wall},
  {nil, nil, nil, nil, nil, nil, nil, nil, wall},
  {nil, nil, nil, nil, nil, nil, nil, nil, wall},
  {nil, nil, nil, nil, nil, nil, nil, nil, wall},
  {nil, nil, nil, nil, nil, nil, nil, nil, wall},
  {nil, nil, nil, nil, nil, nil, nil, nil, wall},
  {wall, wall, wall, wall, wall, wall, wall, wall, wall, wall},
}

  map = Map:new(template)
  collision = Map:new(collision)
end




function love.update(dt)
 
  player.walk:update(dt)
  moving = false
  
if love.keyboard.isDown('w') and player.y > 18 or love.keyboard.isDown('up') and player.y > 18 then -- up
  buttonPressed = true
  if collision:cc(player.x, player.y - 4, 24, 32) == false then
    player.y = player.y - 4 -- speed
  end
end 
if love.keyboard.isDown('a') or love.keyboard.isDown('left') then -- left
  moving = true
  flip = -2
  buttonPressed = true
  if collision:cc(player.x - 4, player.y, 24, 32) == false then  
    player.x = player.x - 4 -- speed
  end
end
if love.keyboard.isDown('s') or love.keyboard.isDown('down') then -- down
  buttonPressed = true
  if collision:cc(player.x, player.y + 4, 24, 32) == false then  
    player.y = player.y + 4 -- speed
  end
end
if love.keyboard.isDown('d') or love.keyboard.isDown('right') then -- right
  moving = true
  flip = 2
  buttonPressed = true
  if collision:cc(player.x + 4, player.y, 24, 32) == false then  
    player.x = player.x + 4 -- speed
  end
end

if buttonPressed == true then
  if player.y < enemy.y then -- up
    if collision:cc(enemy.x, enemy.y - 3.5, 24, 32) == false then
      enemy.y = enemy.y - 2.5 -- speed
    end
  end 
  if player.x < enemy.x then -- left
    if collision:cc(enemy.x - 3.5, enemy.y, 24, 32) == false then  
      enemy.x = enemy.x - 2.5 -- speed
    end
  end
  if player.y > enemy.y then -- down
    if collision:cc(enemy.x, enemy.y + 3.5, 24, 32) == false then  
      enemy.y = enemy.y + 2.5 -- speed
    end
  end
  if player.x > enemy.x then -- right
    if collision:cc(enemy.x + 3.5, enemy.y, 24, 32) == false then  
      enemy.x = enemy.x + 2.5 -- speed
    end
  end
end

                                       -- First Set  (2 & 3)                                             Second Set  (5)                                              Third Set  (6)                                          Fourth Set  (9 & 10)
if cc(player.x, player.y, 27, 32,   135, 0, 118, 55) == true or cc(player.x, player.y, 27, 32,   330, 0, 45, 55) == true or cc(player.x, player.y, 27, 32,   458, 0, 50, 55) == true or cc(player.x, player.y, 27, 32,   581, 0, 128, 55) == true then
  player.x = 373      -- Teleports you back to spawn
  player.y = 468
end

if cc(player.x, player.y, 27, 32,   64, 0, 60, 55) == true or cc(player.x, player.y, 27, 32,   256, 0, 60, 55) == true or cc(player.x, player.y, 27, 32,   384, 0, 60, 55) == true then
  player.x = 373      -- Teleports you back to spawn
  player.y = 468
  message = "Ouch... That hurt, I probably shouldn't go through there again."   -- Prints warning
  timer = 200
  player.hp = player.hp - 20      -- Take 20 hp from player's health
  end
  -- message timer
  if timer < 0 then   
    message = ""
  else
    timer = timer - 1     -- subtracting from timer value to make warning dissapear
  end

  if cc(player.x, player.y, 27, 32,   512, 0, 60, 55) == true or love.keyboard.isDown('escape') or player.hp <= 0 then
    love.exitModule()     -- Ends the game
  end
end




function love.draw()

  map:draw()
  collision:draw()    

  if moving == true then    -- Smooths aniimation
    player.walk:draw(player.spritesheet, player.x + 15, player.y, 0, flip, 2, 9)
  else
    love.graphics.draw(player.img, player.x + 15, player.y, 0, 2, 2, 9)
  end
  love.graphics.print(message,  player.x - 180, player.y - 20)    -- Prints warning
  love.graphics.print(player.hp, 0, 0)      -- Prints player's health


  love.graphics.draw(enemy.img, enemy.x - 12, enemy.y- 48/4)


end

local Map = require 'core/map'
local Util = require 'core/util'
local anim8 = require 'core/anim8'
local gamera = require 'core/gamera'

function love.load()
  -- Shop objects
  potion = {
    price = 100,
    description = "Increase health",
    stat = "hp",
    modifier = 5, 
  }

  player = {
    img = love.graphics.newImage('assets-1/player/base/octopode_4.png'),
    x = 64,
    y  = 64,
    w = 44,
    h = 44,
    hp = 10,
    gp = 0,
    s = 4
  }

  Hpfull = love.graphics.newImage('assets-1/player/hp_bar/full.png')
  Hp9 = love.graphics.newImage('assets-1/player/hp_bar/9.png')
  Hp8 = love.graphics.newImage('assets-1/player/hp_bar/8.png')
  Hp7 = love.graphics.newImage('assets-1/player/hp_bar/7.png')
  Hp6 = love.graphics.newImage('assets-1/player/hp_bar/6.png')
  Hp5 = love.graphics.newImage('assets-1/player/hp_bar/5.png')
  Hp4 = love.graphics.newImage('assets-1/player/hp_bar/4.png')
  Hp3 = love.graphics.newImage('assets-1/player/hp_bar/3.png')
  Hp2 = love.graphics.newImage('assets-1/player/hp_bar/2.png')
  Hp1 = love.graphics.newImage('assets-1/player/hp_bar/critical.png')
  Hpempty = love.graphics.newImage('assets-1/player/hp_bar/empty.png')



  
  w0 = love.graphics.newImage('assets-1/dungeon/wall/catacombs_0.png')
  w1 = love.graphics.newImage('assets-1/dungeon/wall/catacombs_1.png')
  w2 = love.graphics.newImage('assets-1/dungeon/wall/catacombs_2.png')
  f = love.graphics.newImage('assets-1/dungeon/floor/floor_vines_0.png')
  
  dl = love.graphics.newImage('assets-1/dungeon/doors/gate_runed_left.png')
  dr = love.graphics.newImage('assets-1/dungeon/doors/gate_runed_right.png')

  s1 = love.graphics.newImage('assets-1/monster/vault/vault_guard.png')
  s2 = love.graphics.newImage('assets-2/dc-mon/undead/vampire.png')
  s3 = love.graphics.newImage('assets-1/monster/holy/angel.png')
  s4 = love.graphics.newImage('assets-1/monster/undead/skeletal_warrior.png')

  --grid = anim8.newGrid(16, 16, spritesheet:getWidth(), spritesheet:getHeight())
  --walk = anim8.newAnimation(grid('1-6', 2), 0.2)

  background = {
    {f, f, f, f, f, f, f, f, f, f, f, f, f},
    {f, f, f, f, f, f, f, f, f, f, f, f, f},
    {f, f, f, f, f, f, f, f, f, f, f, f, f},
    {f, f, f, f, f, f, f, f, f, f, f, f, f},
    {f, f, f, f, f, f, f, f, f, f, f, f, f},
    {f, f, f, f, f, f, f, f, f, f, f, f, f},
    {f, f, f, f, f, f, f, f, f, f, f, f, f},
    {f, f, f, f, f, f, f, f, f, f, f, f, f},
    {f, f, f, f, f, f, f, f, f, f, f, f, f},
    {f, f, f, f, f, f, f, f, f, f, f, f, f},
    {f, f, f, f, f, f, f, f, f, f, f, f, f},
    {f, f, f, f, f, f, f, f, f, f, f, f, f},
  }
  layer1 = {
    {w1, w1, w1, w1, w1, w1, w1, w1, w1, w1, w1, w1},
    {w1, "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil", w1},
    {w1, "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil", w1},
    {w1, "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil", w1},
    {w1, "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil", w1},
    {w1, "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil"},
    {w1, "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil"},
    {w1, "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil", w1},
    {w1, "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil", w1},
    {w1, "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil", w1},
    {w1, "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil", w1},
    {w1, w1, w1, w1, w1, w1, w1, w1, w1, w1, w1, w1},
  }

  door = {
    {w1,  },
    {"nil",  },
    {"nil",  },
    {"nil",  },
    {"nil",  },
    {"nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil", dl, },
    {"nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil", dr, },
  }
  cam = gamera.new(0, 0, 768, 768) 
  
  map = Map:new(background)
  mapc = Map:new(layer1)
  doorr = Map:new(door)

  
end


function love.update(dt)
    --walk:update(dt)
  
    if love.keyboard.isDown('up' or 'w') then
      if mapc:cc(player.x , player.y - player.s, player.w, player.h) == false then
        player.y = player.y - player.s
      end
    end
    if love.keyboard.isDown('down' or 's') then
      if mapc:cc(player.x, player.y + player.s, player.w, player.h) == false then
        player.y = player.y + player.s
      end
    end
    if love.keyboard.isDown('right' or 'd') then
      if mapc:cc(player.x + player.s, player.y, player.w, player.h) == false then
        player.x = player.x + player.s
      end
    end
    if love.keyboard.isDown('left' or 'a') then
      if mapc:cc(player.x - player.s, player.y, player.w, player.h) == false then
        player.x = player.x - player.s
      end
    end
    if doorr:cc(player.x, player.y, player.w, player.h) then
      love.exitModule()
    end
    cam:setPosition(player.x, player.y)
  

end


function love.draw()
  cam:draw(function(l, t, w, h)
    map:draw()
    mapc:draw()
    doorr:draw()
    --walk:draw(spritesheet, 400, 300)
    love.graphics.draw(player.img, player.x - 10, player.y - 10)
    love.graphics.draw(s1, 512, 128)
    love.graphics.draw(s2, 192, 192)
    love.graphics.draw(s3, 512, 448)
    love.graphics.draw(s4, 192, 448)
    if player.hp == 10 then
      love.graphics.draw(Hpfull, player.x, player.y - 20)
    end
    if player.hp == 9 then
      love.graphics.draw(Hp9, player.x, player.y - 20)
      end
    if player.hp == 8 then
      love.graphics.draw(Hp8, player.x, player.y - 20)
    end
    if player.hp == 7 then
      love.graphics.draw(Hp7, player.x, player.y - 20)
    end
    if player.hp == 6 then
      love.graphics.draw(Hp6, player.x, player.y - 20)
    end
    if player.hp == 5 then
      love.graphics.draw(Hp5, player.x, player.y - 20)
    end
    if player.hp == 4 then
      love.graphics.draw(Hp4, player.x, player.y - 20)
    end
    if player.hp == 3 then
      love.graphics.draw(Hp3, player.x, player.y - 20)
    end
    if player.hp == 2 then
      love.graphics.draw(Hp2, player.x, player.y - 20)
    end
    if player.hp == 1 then
      love.graphics.draw(Hp1, player.x, player.y - 20)
    end
    if player.hp == 0 then
      love.graphics.draw(Hpempty, player.x, player.y - 20)
    end
  end)
end
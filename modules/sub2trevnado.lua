local Map = require 'core/map'
local Util = require 'core/util'
local anim8 = require 'core/anim8'
local gamera = require 'core/gamera'

function love.load()
  
  w0 = love.graphics.newImage('assets-1/dungeon/wall/catacombs_0.png')
  w1 = love.graphics.newImage('assets-1/dungeon/wall/catacombs_1.png')
  w2 = love.graphics.newImage('assets-1/dungeon/wall/catacombs_2.png')
  f = love.graphics.newImage('assets-1/dungeon/floor/floor_vines_0.png')
  
  dl = love.graphics.newImage('assets-1/dungeon/doors/gate_runed_left.png')
  dr = love.graphics.newImage('assets-1/dungeon/doors/gate_runed_right.png')

  s1 = love.graphics.newImage('assets-1/monster/vault/vault_guard.png')
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

  s = 4
  x = 64
  y = 64
  w = 64
  h = 64
  hp = 100
  playerImg = love.graphics.newImage('assets-1/player/base/octopode_4.png')
end


function love.update(dt)
    --walk:update(dt)
  
    if love.keyboard.isDown('up' or 'w') then
      if mapc:cc(x, y - s, w, h) == false then
        y = y - s
      end
    end
    if love.keyboard.isDown('down' or 's') then
      if mapc:cc(x, y + s, w, h) == false then
        y = y + s
      end
    end
    if love.keyboard.isDown('right' or 'd') then
      if mapc:cc(x + s, y, w, h) == false then
        x = x + s
      end
    end
    if love.keyboard.isDown('left' or 'a') then
      if mapc:cc(x - s, y, w, h) == false then
        x = x - s
      end
    end
    if doorr:cc(x, y, w, h) then
      love.exitModule()
    end
    cam:setPosition(x, y)
  

end


function love.draw()
  cam:draw(function(l, t, w, h)
    map:draw()
    mapc:draw()
    doorr:draw()
    --walk:draw(spritesheet, 400, 300)
    love.graphics.draw(playerImg, x, y)
    

  end)
end
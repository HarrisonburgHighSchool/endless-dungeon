
local Map = require 'core/map'
love.graphics.setDefaultFilter('nearest', 'nearest')
local Map = require 'core/map'
local gamera = require 'core/gamera'
local Util = require 'core/util'

function love.load()
  x = 100
  y = 100
  w = 64   -- The player's width is 64
  h = 64   -- The player's height is 64
  hp = 100 -- Set the player's HP to 100 at the start of the game

map = Map:new(5, 5) -- Create a 5 x 5 map object named "map"

indian = {

  x = 100,
  y = 100,
  img = love.graphics.newImage('assets-1/player/body/PixelArt.png')

  }

indian2 = {

  x = 100,
  y = 100,
  img = love.graphics.newImage('assets-1/player/body/PixelArt.png')


}


  cam = gamera.new(0, 0, 2000, 2000)
  floorTile = love.graphics.newImage('assets-1/dungeon/floor/grass/grass_flowers_red_1.png')
  tree = love.graphics.newImage('assets-1/dungeon/trees/mangrove_3.png')
  --gate = love.graphics.newImage('assets-1/dungeon/gateways/bazaar_gone.png')
  --floor = love.graphics.newImage('assets-1/dungeon/floor/black_cobalt_1.png')


  tree = love.graphics.newImage('assets-1/dungeon/trees/mangrove_3.png')
    tree = {
      {tree, tree, tree, tree, tree, tree, tree, 'nil', tree, 'nil', tree, tree, tree, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', tree, tree, 'nil', 'nil', },
      {'nil', tree, tree, tree, 'nil', tree, tree, 'nil', tree, 'nil', tree, tree, tree, tree, 'nil', tree, tree, 'nil', tree, tree, 'nil', 'nil', 'nil', 'nil',  },
      {'nil','nil', 'nil', tree, 'nil', tree, tree, 'nil', tree, 'nil', tree, tree, tree, tree, 'nil', tree, tree, 'nil', tree, tree, tree, 'nil', tree, tree,  },
      {'nil', 'nil', 'nil', 'nil', 'nil', 'nil', tree, 'nil', tree, 'nil', tree, tree, tree, tree, 'nil', tree, tree, 'nil', tree, tree, tree, 'nil', 'nil', 'nil',  },
      {tree, 'nil', tree, tree, 'nil', tree, tree, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil',  },
      {tree, tree, 'nil', tree, 'nil', tree, tree, tree, tree, tree, 'nil', tree, tree, tree, 'nil', tree, tree, tree, 'nil', tree, tree, 'nil', tree, tree,  },
      {tree, tree, 'nil', tree, 'nil', 'nil', 'nil', 'nil', tree, tree, 'nil', tree, tree, tree, 'nil', tree, tree, tree, 'nil', tree, tree, 'nil', 'nil', 'nil',},
      {tree, tree, 'nil', tree, tree, 'nil', 'nil', tree, tree, tree, 'nil', tree, tree, tree, 'nil', tree, tree, tree, 'nil', tree, tree, 'nil', tree, tree,  },
      {tree, tree, 'nil', 'nil', 'nil', 'nil', 'nil', tree, tree, tree, 'nil', tree, tree, tree, 'nil', tree, tree, tree, 'nil', tree, tree, 'nil', tree, tree,  },
      {tree, tree, tree, tree, tree, 'nil', 'nil', tree, tree, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil','nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil',  },
      {tree, 'nil', tree, 'nil', 'nil', tree, tree, 'nil', tree, 'nil', tree, tree, 'nil', tree, 'nil', 'nil', tree, 'nil', tree, 'nil', 'nil', 'nil', tree, 'nil',  },
      {tree, 'nil', tree, 'nil', 'nil', tree, 'nil', 'nil', 'nil', tree, 'nil', 'nil', tree, 'nil', 'nil', tree, tree, tree, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil',  },
      {tree, 'nil', 'nil', tree, tree, 'nil', tree, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil',  },
      -- {'nil', 'nil', 'nil', tree, tree, 'nil', tree, tree, 'nil', tree, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', tree, tree, tree, tree, tree,  },
      -- {tree, tree, tree, tree, tree, 'nil', tree, tree, 'nil', tree, tree, tree, tree, 'nil', tree, tree, tree, tree, tree, 'nil', tree, tree, tree, tree,  },
      -- {tree, tree, tree, tree, tree, 'nil', tree, tree, 'nil', tree, tree, tree, 'nil', tree, tree, tree, tree, tree, tree, 'nil', 'nil', 'nil', tree, tree,  },
      -- {tree, 'nil', tree, tree, tree, 'nil', 'nil', 'nil', tree, tree, tree, 'nil', tree, tree, tree, tree, tree, tree, tree, 'nil', tree, 'nil', tree, tree,  },
      -- {tree, 'nil', tree, tree, tree, 'nil', 'nil', 'nil', tree, tree, 'nil', tree, tree, tree, tree, tree, tree, tree, tree, 'nil', tree, tree, tree, tree,  },
      -- {tree, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', tree, tree, 'nil', tree, tree, tree, tree, tree, tree, tree, tree, tree, 'nil', tree, tree, tree, tree,  },
      -- {tree, 'nil', tree, tree, tree, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', tree, tree, tree,  },
      -- {'nil', 'nil', tree, tree, tree, 'nil', 'nil', tree, 'nil', tree, tree, 'nil', tree, 'nil', tree, tree, 'nil', tree, 'nil', tree, tree, tree, 'nil', tree,  },
      -- {'nil', 'nil', tree, tree, tree, tree, 'nil', tree, 'nil', tree, tree, 'nil', tree, tree, 'nil', tree, 'nil', tree, 'nil', tree, tree, tree, 'nil', tree,  },
      -- {'nil', 'nil', tree, tree, tree, tree, tree, tree, 'nil', tree, tree, 'nil', tree, tree, 'nil', tree, 'nil', tree, 'nil', 'nil', 'nil', tree, 'nil', tree,  },
      -- {'nil', 'nil', 'nil', tree, tree, tree, tree, tree, 'nil', tree, tree, 'nil', tree, tree, 'nil', tree, 'nil', tree, tree, tree, 'nil', tree, 'nil', tree,  },
      -- {'nil', 'nil', 'nil', tree, tree, tree, tree, tree, 'nil', tree, tree, 'nil', tree, tree, 'nil', tree, 'nil', tree, tree, tree, 'nil', tree, 'nil', tree,  },







    }






  template = { --a 3 x 3 map with the altar texture in the middle
               {floorTile, floorTile, floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile},
               {floorTile, floorTile, floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile},
               {floorTile, floorTile, floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile},
               {floorTile, floorTile, floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile},
               {floorTile, floorTile, floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile},
               {floorTile, floorTile, floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile},
               {floorTile, floorTile, floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile},
               {floorTile, floorTile, floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile},
               {floorTile, floorTile, floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile},
               {floorTile, floorTile, floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile},
               {floorTile, floorTile, floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile},
               {floorTile, floorTile, floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile},
               {floorTile, floorTile, floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile},
               {floorTile, floorTile, floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile},
               {floorTile, floorTile, floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile},
               {floorTile, floorTile, floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile},
               {floorTile, floorTile, floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile},
               {floorTile, floorTile, floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile},
               {floorTile, floorTile, floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile},
               {floorTile, floorTile, floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile},
               {floorTile, floorTile, floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile},
               {floorTile, floorTile, floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile},
               {floorTile, floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile},
               {floorTile, floorTile, floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile},
               {floorTile, floorTile, floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile},
               {floorTile, floorTile, floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile},
               {floorTile, floorTile, floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile},
               {floorTile, floorTile, floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile},
               {floorTile, floorTile, floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile},
               {floorTile, floorTile, floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile},
               {floorTile, floorTile, floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile},
               {floorTile, floorTile, floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile},
               {floorTile, floorTile, floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile},
               {floorTile, floorTile, floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile,floorTile},




             }






  map = Map:new(template)
  collide = Map:new(tree, 32)

  x = 400
  y = 300
  playerImg = love.graphics.newImage('assets-1/player/body/PixelArt copy 2.png')






cam:setPosition(400, 400)



  img = love.graphics.newImage('assets-1/player/base/octopode_1.png')
  x = 400
  y = 300



end


function love.update(dt)

  mapc = map:cc(x, y, 64, 64)
  debug = tostring(mapc)
  if love.keyboard.isDown('right') then
    if collide:cc(x + 3 + 16, y, 16, 30) == false then
      x = x + 3
    end
  end
  if love.keyboard.isDown('left') then
    if collide:cc(x - 3, y, 16, 16) == false then
      x = x - 3
   end
  end
  if love.keyboard.isDown('up') then
    if collide:cc(x, y - 3, 16, 16) == false then
      y = y - 3
    end
  end
  if love.keyboard.isDown('down') then
    if collide:cc(x, y + 3, 16, 16) == false then
      y = y + 3
    end
  end
  if x > indian.x then
        indian.x = indian.x + 1
  end

  if x < indian.x then
       indian.x = indian.x - 1
  end

  if y < indian.y then
      indian.y = indian.y - 1
  end

  if y > indian.y then
      indian.y = indian.y + 1
  end

  if x > indian2.x then
        indian2.x = indian2.x + 1
  end

  if x < indian2.x then
       indian2.x = indian2.x - 1
  end

  if y < indian2.y then
      indian2.y = indian2.y - 1
  end

  if y > indian2.y then
      indian2.y = indian2.y + 1
  end

indian.x = indian.x + 1
indian.y = indian.y + 1
indian2.x = indian.x + 1
indian2.y = indian.y + 1

  if love.keyboard.isDown('k') then
    love.exitModule()

  end
end




function love.draw()
  cam:draw(function(l, t, w, h)
  --map:draw()
collide:draw()
  love.graphics.draw(playerImg, x, y, 0, 0.04)


  love.graphics.rectangle('line', x + 16, y, 16, 0)
--  love.graphics.draw(indian.img, indian.x, indian.y)
--  love.graphics.draw(indian2.img, indian2.x, indian2.y)

  end)
end

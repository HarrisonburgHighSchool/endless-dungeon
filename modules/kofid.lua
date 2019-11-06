
local Map = require 'core/map'
--love.graphics.setDefaultFilter('nearest', 'nearest')
local Map = require 'core/map'
local gamera = require 'core/gamera'
local Util = require 'core/util'





function love.load()
  ex = 5

map = Map:new(5, 5) -- Create a 5 x 5 map object named "map"



  cam = gamera.new(0, 0, 2000, 2000)
  floorTile = love.graphics.newImage('assets-1/dungeon/floor/grass/grass_flowers_red_1.png')
  tree = love.graphics.newImage('assets-1/dungeon/trees/mangrove_3.png')

  gate = love.graphics.newImage('assets-1/dungeon/gateways/portal_unknown.png')
  scroll = love.graphics.newImage('assets-1/item/scroll/scroll-red.png')
  indian = love.graphics.newImage('assets-1/player/body/PixelArt.png')
  tree = love.graphics.newImage('assets-1/dungeon/trees/mangrove_3.png')
  pikachu = love.graphics.newImage('assets-1/player/body/PixelArt copy 2.png')
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
      {'nil', 'nil', tree, tree, 'nil', 'nil', tree, 'nil', tree, 'nil', tree, tree, 'nil', tree, 'nil', 'nil', tree, 'nil', tree, 'nil', 'nil', 'nil', tree, 'nil',  },
      {'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', tree, tree, 'nil', 'nil', tree, 'nil', tree, 'nil', 'nil', 'nil', tree, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil',  },
      {tree, 'nil', 'nil', tree, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil',  },
      --{'nil', 'nil', 'nil', tree, tree, 'nil', tree, tree, 'nil', tree, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', tree, tree, tree, tree, tree,  },
      {tree, tree, tree, tree, tree, 'nil', tree, tree, 'nil', tree, tree, tree, tree, 'nil', tree, tree, tree, tree, tree, 'nil', tree, tree, tree, tree,  },
      {'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', tree, 'nil', 'nil', 'nil', tree, tree, tree, tree, tree, 'nil', 'nil', 'nil', tree, tree,  },
      {tree, 'nil', tree, tree, tree, 'nil', 'nil', 'nil', tree, tree, tree, 'nil', tree, tree, tree, tree, tree, tree, tree, 'nil', tree, 'nil', tree, tree,  },
      {tree, 'nil', tree, tree, tree, 'nil', 'nil', 'nil', tree, tree, 'nil', tree, tree, tree, tree, tree, tree, tree, tree, 'nil', tree, tree, tree, tree,  },
      {tree, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', tree, tree, 'nil', tree, tree, tree, tree, tree, tree, tree, tree, tree, 'nil', tree, tree, tree, tree,  },
      {tree, 'nil', tree, tree, tree, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', tree, tree, tree,  },
      {'nil', 'nil', tree, tree, tree, 'nil', 'nil', tree, 'nil', tree, tree, 'nil', tree, 'nil', tree, tree, 'nil', tree, 'nil', tree, tree, tree, 'nil', tree,  },
      {'nil', 'nil', tree, tree, tree, tree, 'nil', tree, 'nil', tree, tree, 'nil', tree, tree, 'nil', tree, 'nil', tree, 'nil', tree, tree, tree, 'nil', tree,  },
      {'nil', 'nil', tree, tree, tree, tree, tree, tree, 'nil', tree, tree, 'nil', tree, tree, 'nil', tree, 'nil', tree, 'nil', 'nil', 'nil', tree, 'nil', tree,  },
      {'nil', 'nil', 'nil', tree, tree, tree, tree, tree, 'nil', tree, tree, 'nil', tree, tree, 'nil', tree, 'nil', tree, tree, tree, 'nil', tree, 'nil', tree,  },
      {'nil', 'nil', 'nil', tree, tree, tree, tree, tree, 'nil', tree, tree, 'nil', tree, tree, 'nil', tree, 'nil', tree, tree, tree, 'nil', tree, 'nil', tree,  },







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




             }






  map = Map:new(template)
  collide = Map:new(tree, 32)




  indian = {
    x = 100,
    y = 100,
    img = love.graphics.newImage('assets-1/player/body/PixelArt copy 2.png')
  }


  scroll = {
    x = 100,
    y = 100,


  }

pikachu = {
    x = 100,
    y = 100,


}


end



function love.update(dt)


  if love.keyboard.isDown('right') then
    if collide:cc(x + 3, y, 9, 9) == false then
      x = x + 3
    end
  end
  if love.keyboard.isDown('left') then
    if collide:cc(x - 3, y, 9, 9) == false then
      x = x - 3
   end
  end
  if love.keyboard.isDown('up') then
    if collide:cc(x, y - 3, 9, 9) == false then
      y = y - 3
    end
  end
  if love.keyboard.isDown('down') then
    if collide:cc(x, y + 3, 9, 9) == false then
      y = y + 3
    end
  end


  if cc(scroll.x, scroll.y, 9, 9, 700, 0, 64, 64) then

    love.exitModule()
  end
  if  ex < 1 then
    direction = 'right'
  end
  if ex > 1 then
    direction ='left'
  end
  if direction == 'right' then
    ex = ex + 1
  end
  if direction == 'left' then
    ex = ex - 1
  end






function love.draw()
  cam:draw(function(l, t, w, h)
  map:draw()
  collide:draw()
  love.graphics.draw(pikachu.img, pikachu.x, pikachu.y, 0, 0.04)
  --love.graphics.draw(gate, x, y, 0, 0.04)
  love.graphics.draw(indian.img, indian.x, indian.y, 0, 0)
  love.graphics.draw(scroll, 700, 0, 0, 2)



  love.graphics.rectangle('line', x + 9, y, 9, 0)

  end)

  end
end

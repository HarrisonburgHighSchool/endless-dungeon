local class = require 'core/middleclass'
local Tile = require 'core/tile'
local Map = class('Map')

function Map:constructor(xSize, ySize)
  local template
  self.matrix = {}
  self.x = 0
  self.y = 0
  if type(xSize) == 'table' then
    template = xSize
    --Render table as map
  end
  if not template then
    for x = 1, xSize do
      self.matrix[x] = {}
      for y = 1, ySize do
        self.matrix[x][y] = Tile:new((x-1)*64, (y-1)*64)
      end
    end
  else
    for x = 1, #template do
      if type(template[1]) == 'table' then
        self.matrix[x] = {}
        for y = 1, #template[1] do
          if type(template[x][y]) == 'string' then
            local img = love.graphics.newImage(template[x][y])
            self.matrix[x][y] = Tile:new((x-1)*img:getWidth(), (y-1)*img:getWidth(), img)
          else
            local img = template[x][y]
            self.matrix[x][y] = Tile:new((x-1)*img:getWidth(), (y-1)*img:getWidth(), img)
          end
        end
      else
        if type(template[x][y]) == 'string' then
          local img = template[x]
          self.matrix[x] = Tile:new((x-1)*img:getWidth(), y, img)
        else
          local img = love.graphics.newImage(template[x])
          self.matrix[x] = Tile:new((x-1)*img:getWidth(), y, img)
        end
      end
    end
  end
end

function Map:draw()
  for x = 1, #self.matrix do
    for y = 1, #self.matrix[1] do
      self.matrix[x][y]:draw()
    end
  end
end

return Map
  
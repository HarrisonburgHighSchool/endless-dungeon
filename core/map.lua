local Tile = require 'core/tile'

local Map = {}

function Map:new(xSize, ySize)
  local template
  local map = {
    matrix = {},
    x = 0,
    y = 0,
  }
  if type(xSize) == 'table' then
    template = xSize
    --Render table as map
  else
    for x = 1, xSize do
      map.matrix[x] = {}
      for y = 1, ySize do
        map.matrix[x][y] = Tile:new((x-1)*64, (y-1)*64)
      end
    end
  end
  setmetatable(map, self)
  self.__index = self
  return map
end

function Map:draw()
  for x = 1, #self.matrix do
    for y = 1, #self.matrix[1] do
      self.matrix[x][y]:draw()
    end
  end
end

return Map
  
local class = require 'core/middleclass'
local Tile = require 'core/tile'
local Map = class('Map')

function Map:constructor(xSize, ySize, x, y)
  local template
  self.matrix = {}
  self.x = x or 0
  self.y = y or 0
  self.scale = 1
  if type(xSize) == 'table' then
    template = xSize
    --Render table as map
  end
  if not template then
    for x = 1, xSize do
      self.matrix[x] = {}
      for y = 1, ySize do
        self.matrix[x][y] = Tile:new((x-1)*64 + self.x, (y-1)*64 + self.y)
      end
    end
  else
    for x = 1, #template do
      if type(template[1]) == 'table' then
        self.matrix[x] = {}
        for y = 1, #template[1] do
          if type(template[x][y]) == 'string' then
            local img = love.graphics.newImage(template[x][y])
            self.matrix[x][y] = Tile:new(((x-1)*img:getWidth() + self.x) * self.scale, ((y-1)*img:getHeight() + self.y) * self.scale, img)
          else
            local img = template[x][y]
            self.matrix[x][y] = Tile:new(((x-1)*img:getWidth() + self.x) * self.scale, ((y-1)*img:getHeight() + self.y) * self.scale, img)
          end
        end
      else
        if type(template[x][y]) == 'string' then
          local img = template[x]
          self.matrix[x] = Tile:new(((x-1)*img:getWidth() + self.x) * self.scale, (y + self.y) * self.scale, img)
        else
          local img = love.graphics.newImage(template[x])
          self.matrix[x] = Tile:new(((x-1)*img:getWidth() + self.x) * self.scale, (y + self.y) * self.scale, img)
        end
      end
    end
  end
end

function Map:move(dx, dy)
  self.x = dx
  self.y = dy
  for x = 1, #self.matrix do
    if type(self.matrix[x]) == 'table' then
      for y = 1, #self.matrix[x] do
        local tileX, tileY = self.matrix[x][y]:getCoords()
        self.matrix[x][y]:move(tileX + dx, tileY + dy)
      end
    else
      self.matrix[x]:scoot(x, y)
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

function Map:changeScale(mult)
  self.scale = mult
  for x = 1, #self.matrix do
    if type(self.matrix[x]) == 'table' then
      for y = 1, #self.matrix[x] do
        self.matrix[x][y]:changeScale(mult)
        self.matrix[x][y]:move(((x-1)*self.matrix[x][y].img:getWidth() + self.x) * self.scale, ((y-1)*self.matrix[x][y].img:getHeight() + self.y) * self.scale)
      end
    else
      self.matrix[x]:changeScale(mult)
      self.matrix[x]:move(((x-1)*self.matrix[x][y].img:getWidth() + self.x) * self.scale, (y + self.y) * self.scale)
    end
  end
end

return Map
  
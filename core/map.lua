local class = require 'core/middleclass'
local Tile = require 'core/tile'
local Util = require 'core/util'
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
    if ySize then
      self.gridsize = ySize
    end
  end
  if not template then
    -- Use the default texture
    for x = 1, xSize do
      self.matrix[x] = {}
      for y = 1, ySize do
        self.matrix[x][y] = Tile:new((x-1)*64 + self.x, (y-1)*64 + self.y)
      end
    end
  end
  if template then
    -- Check to see if 2D or 1D
    if type(template[1]) == 'table' then -- it's a 2D table
      local img
      -- Get the image to measure
      if type(template[1][1]) == 'string' then
        img = love.graphics.newImage(template[1][1])
      else
        img = template[1][1]
      end
      -- Measure the image
      local w
      local h
      if self.gridsize then
        w = self.gridsize
        h = self.gridsize
      else
        w = img:getWidth()
        h = img:getHeight()
      end
      -- Create the matrix
      self:createTwoD(template, w, h)
    else -- it's a 1D table
      local img
      -- Get the image to measure
      if type(template[1]) == 'string' then
        img = love.graphics.newImage(template[1])
      else
        img = template[1]
      end
      -- Measure the img
      local w = img:getWidth()
      local h = img:getHeight()
      -- Create the matrix
      self:createOneD(template, w, h)
    end
  end
  if x then
    self:move(x, 0)
  end
  if y then
    self:move(0, y)
  end
end

function Map:createOneD(template, w, h)
  for x = 1, #template do
    local img
    if type(template[x]) == 'string' then
      img = love.graphics.newImage(template[x])
    else
      img = template[x]
    end
    self.matrix[x] = Tile:new(((x-1)*w + self.x) * self.scale, self.y * self.scale, img)
    if self.matrix[x].img:getWidth() ~= w then
      self.matrix[x]:changeScale(w/self.matrix[x].img:getWidth())
    end
  end
end

function Map:createTwoD(template, w, h)
  for x = 1, #template do
    self.matrix[x] = {}
    for y = 1, #template[x] do
      local img
      if type(template[x][y]) == 'string' then
        img = love.graphics.newImage(template[x][y])
      else
        img = template[x][y]
      end
      self.matrix[x][y] = Tile:new(((x-1)*w + self.x) * self.scale, ((y-1)*h + self.y) * self.scale, img)
      if self.matrix[x][y].img:getWidth() ~= w and self.gridsize == nil then
        self.matrix[x][y]:changeScale(w/self.matrix[x][y].img:getWidth())
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
    for y = 1, #self.matrix[x] do
      self.matrix[x][y]:draw()
    end
  end
end

function Map:cc(x, y, w, h)
  local result = false
  local count = 0
  -- for x = 1, #self.matrix do
  --   for y = 1, #self.matrix[x] do
  for b = 1, #self.matrix do
    for v = 1, #self.matrix[b] do
      if cc(x, y, w, h, self.matrix[b][v].x, self.matrix[b][v].y, 64, 64) then
      result = true
      end
    end
  end
  --   end
  -- end
  return result
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

local class = require 'core/middleclass'

local Tile = class('Tile')

function Tile:constructor(x, y, img)
  self.x = x
  self.y = y
  self.scale = 1
  if not img then
    self.img = love.graphics.newImage('assets-1/transparent.png')
  else
    self.img = img
  end
  self.w = self.img:getWidth()
  self.h = self.img:getHeight()
end

function Tile:draw()
  love.graphics.draw(self.img, self.x, self.y, 0, self.scale)
end

function Tile:move(x, y)
  self.x = x
  self.y = y
end

function Tile:getCoords()
  return self.x, self.y
end

function Tile:changeScale(mult)
  self.scale = mult
end

return Tile

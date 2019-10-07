local class = require 'core/middleclass'

local Entity = class('Entity')

function Entity:constructor(img, x, y)
  if type(img) == 'string' then
    self.img = love.graphics.newImage(img)
  else
    self.img = img
  end
  self.x = 400
  self.y = 300
  self.w = self.img:getWidth()
  self.h = self.img:getHeight()
end

function Entity:draw()
  love.graphics.draw(self.img, self.x, self.y)
end

return Entity

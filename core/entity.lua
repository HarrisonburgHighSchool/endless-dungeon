local class = require 'core/middleclass'

local Entity = class('Entity')

function Entity:constructor(img, x, y)
  self.img = img
  self.x = x
  self.y = y
end

function Entity:draw()
  love.graphics.draw(self.img, self.x, self.y)
end

return Entity

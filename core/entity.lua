local class = require 'core/middleclass'

local Entity = class('Entity')

function Entity:constructor()
  self.img = love.graphics.newImage('assets-1/player/base/octopode_1.png')
  self.x = 400
  self.y = 300
end

function Entity:draw()
  love.graphics.draw(self.img, self.x, self.y)
end

return Entity

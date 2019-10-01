local class = require 'core/middleclass'

local Tile = class('Tile')

function Tile:constructor(x, y)
  self.x = x
  self.y = y
  self.img = love.graphics.newImage('assets-1/dungeon/floor/cobble_blood_1.png')
end

function Tile:draw()
  love.graphics.draw(self.img, self.x, self.y)
end

return Tile

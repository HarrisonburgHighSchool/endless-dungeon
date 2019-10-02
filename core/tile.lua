local class = require 'core/middleclass'

local Tile = class('Tile')

function Tile:constructor(x, y, img)
  self.x = x
  self.y = y
  if not img then
    self.img = love.graphics.newImage('assets-1/dungeon/floor/cobble_blood_1.png')
  else
    self.img = img
  end
end

function Tile:draw()
  love.graphics.draw(self.img, self.x, self.y)
end

return Tile

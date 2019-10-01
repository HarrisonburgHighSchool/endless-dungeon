local Tile = {}

function Tile:new(x, y)
  local tile = {
    x = x,
    y = y,
    img = love.graphics.newImage('assets-1/dungeon/floor/cobble_blood_1.png')
  }
  setmetatable(tile, self)
  self.__index = self
  return tile
end

function Tile:draw()
  love.graphics.draw(self.img, self.x, self.y)
end

return Tile

local Entity = {}

function Entity:new(spritesheet, x, y)
  local entity = {
    img = love.graphics.newImage(spritesheet);
    x = x,
    y = y,
    state = 'rest',
  }
  setmetatable(entity, self)
  self.__index = self
  return entity
end

function Entity:draw()
  love.graphics.draw(self.img, self.x, self.y)
end

return Entity

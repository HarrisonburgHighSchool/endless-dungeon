require 'core/require'

modules = love.filesystem.getDirectoryItems('modules')

for i = 1, #modules do
  modules[i] = string.gsub(modules[i], ".lua", "")
end

local n = love.math.random(1, #modules)
require('modules/'..modules[n])
table.remove(modules, n)

function love.exitModule()
  love.load = nil
  love.update = nil
  love.draw = nil
  love.keypressed = nil
  if #modules >=1 then
    local index = love.math.random(1, #modules)
    local m = 'modules/'..modules[index]
    require(m)
    table.remove(modules, index)
    love.load()
  else
    love.event.quit()
  end
end


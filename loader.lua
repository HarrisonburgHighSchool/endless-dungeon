
-- /////////////////////////////////////////////////////////////////////////
-- If you want to load a specific module, change LOAD_MODULE from nil to the name of the module


LOAD_MODULE = nil                                                                                                                                                                                                                                                                                                                                                                                                                                                                   -- change this to the name of your file if you want to test your file


-- /////////////////////////////////////////////////////////////////////////



-- DON'T CHANGE ANYTHING BELOW THIS POINT!!!
-- DON'T CHANGE ANYTHING BELOW THIS POINT!!!
-- DON'T CHANGE ANYTHING BELOW THIS POINT!!!
-- DON'T CHANGE ANYTHING BELOW THIS POINT!!!
-- DON'T CHANGE ANYTHING BELOW THIS POINT!!!
require 'core/require'
modules = love.filesystem.getDirectoryItems('modules')

for i = 1, #modules do
  modules[i] = string.gsub(modules[i], ".lua", "")
end

local n = love.math.random(1, #modules)
if LOAD_MODULE then
  require('modules/'..LOAD_MODULE)
else
  require('modules/'..modules[n])
  table.remove(modules, n)
end

function love.exitModule()
  love.load = nil
  love.update = nil
  love.draw = nil
  love.keypressed = nil
  if #modules >=1 then
    local m
    if LOAD_MODULE then
      m = 'modules/'..LOAD_MODULE
    else
      local index = love.math.random(1, #modules)
      m = 'modules/'..modules[index]
      table.remove(modules, index)
    end
    require(m)
  end
  if love.load then
    love.load()
  else
    love.event.quit()
  end
end

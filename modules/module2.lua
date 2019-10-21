function love.load()

end

function love.update()

end

function love.draw()
  love.graphics.print('helllo')
end

function love.keypressed(key)
  if key == 'escape' then
    love.exitModule()
  end
end
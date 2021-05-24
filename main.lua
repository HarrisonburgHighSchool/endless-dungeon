require 'loader'

local anim8 = require 'anim8'

function love.load()
    heroImage = love.graphics.newImage('Stuwalk.png')
    local g = anim8.newGrid(16, 16, heroImage:getWidth(), heroImage:getHeight())
    heroAnim = anim8.newAnimation(g('1-6',1), 0.1) -- frame info, speed
end


function love.update(dt)
    heroAnim:update(dt)
end


function love.draw()
    heroAnim:draw(heroImage, 100, 200, 0, 8)
end
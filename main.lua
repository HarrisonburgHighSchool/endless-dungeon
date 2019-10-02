local Map = require 'core/map'
local Entity = require 'core/entity'

function love.load()
  x = 400
  y = 300
  playerImg = love.graphics.newImage('assets-1/player/base/octopode_1.png')
  gate = love.graphics.newImage('assets-1/dungeon/gateways/enter_depths.png')
  cobalt = love.graphics.newImage('assets-1/dungeon/floor/black_cobalt_9.png')
  cobalt2 = love.graphics.newImage('assets-1/dungeon/floor/cage_3.png')
  cobalt3 = love.graphics.newImage('assets-1/dungeon/floor/green_bones_12.png')
  ent = love.graphics.newImage('assets-1/monster/boggart.png')


  mapTemplate = {
    {cobalt, cobalt2, cobalt, cobalt2, cobalt3, cobalt3, cobalt2, cobalt, cobalt2, cobalt},
    {cobalt2, cobalt, cobalt2, cobalt2, cobalt, cobalt, cobalt2, cobalt2, cobalt, cobalt2},
    {cobalt, cobalt2, cobalt, cobalt2, cobalt3, cobalt3, cobalt2, cobalt, cobalt2, cobalt},
    {cobalt2, cobalt, cobalt2, cobalt2, cobalt, cobalt, cobalt2, cobalt2, cobalt, cobalt2},
    {cobalt, cobalt2, cobalt, cobalt2, cobalt3, cobalt3, cobalt2, cobalt, cobalt2, cobalt},
    {cobalt2, cobalt, cobalt2, cobalt2, cobalt, cobalt, cobalt2, cobalt2, cobalt, cobalt2},
    {cobalt, cobalt2, cobalt, cobalt2, cobalt3, cobalt3, cobalt2, cobalt, cobalt2, cobalt},
    {cobalt2, cobalt, cobalt2, cobalt2, cobalt, cobalt, cobalt2, cobalt2, cobalt, cobalt2},
    {cobalt, cobalt2, cobalt, cobalt2, cobalt3, cobalt3, cobalt2, cobalt, cobalt2, cobalt},
    {cobalt2, cobalt, cobalt2, cobalt2, cobalt, cobalt, cobalt2, cobalt2, cobalt, cobalt2},
    {cobalt, cobalt2, cobalt, cobalt2, cobalt3, cobalt3, cobalt2, cobalt, cobalt2, cobalt},
    {cobalt2, cobalt, cobalt2, cobalt2, cobalt, cobalt, cobalt2, cobalt2, cobalt, cobalt2},
    {cobalt, cobalt2, cobalt, cobalt2, cobalt3, cobalt3, cobalt2, cobalt, cobalt2, cobalt},
  }


  entity = Entity:new(ent, 200, 200)
  map = Map:new(mapTemplate)

end

function love.update(dt)

  if love.keyboard.isDown('right') then
  x = x + 5
  end

  if love.keyboard.isDown('left') then
  x = x - 5
  end

  if love.keyboard.isDown('up') then
  y = y - 5
  end

  if love.keyboard.isDown('down') then
  y = y + 5
  end



end

function love.draw()
  love.graphics.print('Hello, world!', 0, 0)
  map:draw()
  love.graphics.draw(playerImg, x, y)
    love.graphics.draw(gate, 400, 570)
    entity:draw()
end

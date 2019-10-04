local Map = require 'core/map'
local Entity = require 'core/entity'
local gamera = require 'core/gamera'



function love.load()
  x = 400
  y = 300
  l = 0
  t = 0
  w = 0
  h = 0
  X1 = 400
  Y1 = 300
  playerImg = love.graphics.newImage('assets-1/player/base/octopode_1.png')
  gate = love.graphics.newImage('assets-1/dungeon/gateways/enter_depths.png')
  cobalt = love.graphics.newImage('assets-1/dungeon/floor/black_cobalt_9.png')
  cobalt2 = love.graphics.newImage('assets-1/dungeon/floor/cage_3.png')
  cobalt3 = love.graphics.newImage('assets-1/dungeon/floor/green_bones_12.png')
  ent = love.graphics.newImage('assets-1/monster/boggart.png')
  love.graphics.setDefaultFilter('nearest', 'nearest')

  cam = gamera.new(-1000, -1000, 2000, 2000)

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


  cam:setPosition(X1, Y1)


  if love.keyboard.isDown('right') then
  x = x + 5
  X1 = X1 + 5
  end

  if love.keyboard.isDown('left') then
  x = x - 5
  X1 = X1 - 5
  end

  if love.keyboard.isDown('up') then
  y = y - 5
  Y1 = Y1 - 5
  end

  if love.keyboard.isDown('down') then
  y = y + 5
  Y1 = Y1 + 5
  end




end

function love.draw()

 cam:draw(function(l, t, w, h)

  map:draw()
  entity:draw()
  love.graphics.print('Level 1, Teaching Level!', 0, 0)
  love.graphics.draw(playerImg, x, y)
  love.graphics.draw(gate, 400, 570)

  end)

end

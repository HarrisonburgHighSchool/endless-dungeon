local Map = require 'core/map'
local gamera = require 'core/gamera'
function love.load()


  cam = gamera.new(0, 0, 2000, 2000) --


  ex = 100
  ey = 100
  eimg = love.graphics.newImage('assets-1/player/base/octopode_4.png')

hp = 100

  x = 400
  y = 300

  playerImg = love.graphics.newImage('assets-1/player/base/octopode_1.png')

  floorTile = love.graphics.newImage('assets-1/dungeon/doors/gate_sealed_left.png')
    altar     = love.graphics.newImage('assets-1/dungeon/doors/gate_sealed_right.png')
    template = { --a 3 x 3 map with the altar texture in the middle

                  {floorTile, floorTile, floorTile, altar, floorTile, floorTile, floorTile, altar, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, altar, floorTile, floorTile, floorTile, altar, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile,},
                  {floorTile, floorTile, floorTile, altar, floorTile, floorTile, floorTile, altar. floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, altar, floorTile, floorTile, floorTile, altar, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile,},
                  {floorTile, floorTile, floorTile, altar, floorTile, floorTile, floorTile, altar, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, altar, floorTile, floorTile, floorTile, altar, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile,},
                  {floorTile, floorTile, floorTile, altar, floorTile, floorTile, floorTile, altar, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, altar, floorTile, floorTile, floorTile, altar, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile,},

                                    {floorTile, floorTile, floorTile, altar, floorTile, floorTile, floorTile, altar, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, altar, floorTile, floorTile, floorTile, altar, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile,},
                                    {floorTile, floorTile, floorTile, altar, floorTile, floorTile, floorTile, altar. floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, altar, floorTile, floorTile, floorTile, altar, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile,},
                                    {floorTile, floorTile, floorTile, altar, floorTile, floorTile, floorTile, altar, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, altar, floorTile, floorTile, floorTile, altar, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile,},
                                    {floorTile, floorTile, floorTile, altar, floorTile, floorTile, floorTile, altar, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, altar, floorTile, floorTile, floorTile, altar, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile,},

                                                      {floorTile, floorTile, floorTile, altar, floorTile, floorTile, floorTile, altar, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, altar, floorTile, floorTile, floorTile, altar, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile,},
                                                      {floorTile, floorTile, floorTile, altar, floorTile, floorTile, floorTile, altar. floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, altar, floorTile, floorTile, floorTile, altar, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile,},
                                                      {floorTile, floorTile, floorTile, altar, floorTile, floorTile, floorTile, altar, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, altar, floorTile, floorTile, floorTile, altar, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile,},
                                                      {floorTile, floorTile, floorTile, altar, floorTile, floorTile, floorTile, altar, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, altar, floorTile, floorTile, floorTile, altar, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile,},
                                                      {floorTile, floorTile, floorTile, altar, floorTile, floorTile, floorTile, altar. floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, altar, floorTile, floorTile, floorTile, altar, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile,},
                                                      {floorTile, floorTile, floorTile, altar, floorTile, floorTile, floorTile, altar, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, altar, floorTile, floorTile, floorTile, altar, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile,},
                                                      {floorTile, floorTile, floorTile, altar, floorTile, floorTile, floorTile, altar, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, altar, floorTile, floorTile, floorTile, altar, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile,},

                                                      {floorTile, floorTile, floorTile, altar, floorTile, floorTile, floorTile, altar, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, altar, floorTile, floorTile, floorTile, altar, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile,},
                  {floorTile, floorTile, floorTile, altar, floorTile,floorTile, floorTile, altar},  {floorTile, floorTile, floorTile, altar, floorTile, floorTile, floorTile, altar, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, altar, floorTile, floorTile, floorTile, altar, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile,},
                    {floorTile, floorTile, floorTile, altar, floorTile, floorTile, floorTile, altar. floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, altar, floorTile, floorTile, floorTile, altar, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile,},
                    {floorTile, floorTile, floorTile, altar, floorTile, floorTile, floorTile, altar, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, altar, floorTile, floorTile, floorTile, altar, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile,},


                    {floorTile, floorTile, floorTile, altar, floorTile, floorTile, floorTile, altar, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, altar, floorTile, floorTile, floorTile, altar, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile,},

                    {floorTile, floorTile, floorTile, altar, floorTile, floorTile, floorTile, altar, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, altar, floorTile, floorTile, floorTile, altar, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile,},
                    {floorTile, floorTile, floorTile, altar, floorTile, floorTile, floorTile, altar. floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, altar, floorTile, floorTile, floorTile, altar, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile,},
                    {floorTile, floorTile, floorTile, altar, floorTile, floorTile, floorTile, altar, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, altar, floorTile, floorTile, floorTile, altar, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile,},
                    {floorTile, floorTile, floorTile, altar, floorTile, floorTile, floorTile, altar, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile, altar, floorTile, floorTile, floorTile, altar, floorTile, floorTile, floorTile, floorTile, floorTile, floorTile,},
                  {floorTile, floorTile, floorTile, altar, floorTile, floorTile, floorTile, altar},
                  {floorTile, floorTile, floorTile, altar, floorTile, floorTile, floorTile, altar},
                  {floorTile, floorTile, floorTile, altar, floorTile, floorTile, floorTile, altar},
                  {floorTile, floorTile, floorTile, altar, floorTile, floorTile, floorTile, altar},
                  {floorTile, floorTile, floorTile, altar, floorTile, floorTile, floorTile, altar},
                  {floorTile, floorTile, floorTile, altar, floorTile, floorTile, floorTile, altar},
                  {floorTile, floorTile, floorTile, altar, floorTile, floorTile, floorTile, altar},
                  {floorTile, floorTile, floorTile, altar, floorTile, floorTile, floorTile, altar},
                  {floorTile, floorTile, floorTile, altar, floorTile, floorTile, floorTile, altar},
                  {floorTile, floorTile, floorTile, altar, floorTile, floorTile, floorTile, altar},
                  {floorTile, floorTile, floorTile, altar, floorTile, floorTile, floorTile, altar},
                  {floorTile, floorTile, floorTile, altar, floorTile, floorTile, floorTile, altar},
                  {floorTile, floorTile, floorTile, altar, floorTile, floorTile, floorTile, altar},
                  {floorTile, floorTile, floorTile, altar, floorTile, floorTile, floorTile, altar},
                  {floorTile, floorTile, floorTile, altar, floorTile, floorTile, floorTile, altar},
                  {floorTile, floorTile, floorTile, altar, floorTile, floorTile, floorTile, altar},
                  {floorTile, floorTile, floorTile, altar, floorTile, floorTile, floorTile, altar},
}

    map = Map:new(template)

end

function love.update(dt)
  cam:setPosition(x, y)
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

if x > ex then
  ex = ex + 3
end

if x < ex then
  ex = ex - 3
end


if y < ey then
  ey = ey - 3
end

if y > ey then
  ey = ey + 3
end


if  x > 80 and x < 100 and y > 300 and y < 320  then
  love.exitModule()
end


if y > ey - 10 and y < ey + 10 and x > ex - 10 and x < ex + 10 then
  hp = hp - 1
end


end

function love.draw()

  cam:draw(function(l, t, w, h)

if hp > 0 then
    map:draw()
    love.graphics.print('Hello, world!', 0, 0)
    love.graphics.draw(playerImg, x, y)
    love.graphics.draw(eimg, ex, ey)
love.graphics.print(hp, x + 10, y - 15)
love.graphics.rectangle('line', 90, 310, 64, 64)
love.graphics.rectangle('line', 200, 300, 64, 64)
love.graphics.rectangle('line', 300, 300, 64, 64)
end


  end)






end

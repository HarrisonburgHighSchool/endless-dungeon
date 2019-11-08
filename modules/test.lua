function love.load()
    enemies = {}
    for i = 1, 3 do
        enemies[i] = newEnemy(100 * i, 100)
    end

    x = 400
    y = 300
end


function love.update(dt)
    for i = 1, 3 do
        --if enemy_draw == true then
          c = dist(enemies[i].x, enemies[i].y, x, y)
          a = y - enemies[i].y
          b = x - enemies[i].x
          speed = 3
          cRatio = speed/c
          dy = a * cRatio
          dx = b * cRatio
          enemies[i].x = enemies[i].x + dx
          enemies[i].y = enemies[i].y + dy
      
        --end
    end
end

function love.draw()
    for i = 1, 3 do
        love.graphics.draw(enemies[i].img, enemies[i].x, enemies[i].y)
    end
end


function newEnemy(xpos, ypos)
    local enemy = {
      x = xpos,
      y = ypos,
      img = love.graphics.newImage('assets-2/dc-mon/demons/chaos_spawn.png')
    }
  
    return enemy
end

function dist ( x1, y1, x2, y2 )
    local dx = x1 - x2
    local dy = y1 - y2
    return math.sqrt ( dx * dx + dy * dy )
end

character = require("character")
worldgen = require("worldgen")

function love.load()
    
end

function love.update(dt)
    
end

function love.draw()
    love.graphics.print(player.pos.y, 0, 0)
    love.graphics.draw(player.sprite, player.pos.x, player.pos.y)
    drawLevel(1)
end

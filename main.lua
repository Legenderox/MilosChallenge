character = require("character")
worldgen = require("worldgen")

function love.load()

end

function love.update(dt)
    update_player(dt)
end

function love.draw()
    love.graphics.print(player.pos.y, 0, 0)
    love.graphics.setColor(1,1,1)
    love.graphics.draw(player.sprite, player.pos.x, player.pos.y)
    drawLevel(current_level)
end

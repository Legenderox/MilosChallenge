character = require("character")
worldgen = require("worldgen")

function love.load()

end

function love.update(dt)
    update_player(dt)
end

function love.draw()
    if player.dead then
        love.graphics.setColor(1,0,0)
        love.graphics.print("you died lmao!", WIDTH/2, HEIGHT/2)
    else
        love.graphics.print(player.pos.y, 0, 0)
        love.graphics.setColor(1,1,1)
        love.graphics.draw(player.sprite, player.pos.x, player.pos.y)
        drawLevel(1)
    end
end

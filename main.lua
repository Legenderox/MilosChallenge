require("character")

function love.load()

end

function love.update(dt)
    update_player(dt)
end

function love.draw()
    love.graphics.print(player.pos.y, 0, 0)
    love.graphics.draw(player.sprite, player.pos.x, player.pos.y)
end

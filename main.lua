function love.load()

end

function love.update(dt)
    update_player(dt)
end

function love.draw()
    love.graphics.draw(player.sprite, player.x, player.y)
end

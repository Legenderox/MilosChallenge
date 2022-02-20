character = require("character")
worldgen = require("worldgen")

function love.load()

end

function love.update(dt)
    update_player(dt)
end

function love.draw()
    if player.dead then
        love.graphics.print(player.pos.y, 0, 0)
        love.graphics.setColor(1,1,1)
        love.graphics.draw(deadSprite, player.pos.x, player.pos.y)
        drawLevel(current_level)
        love.timer.sleep(2)
        player.sprite = defaultSprite
        goToStart()
        love.audio.play(mainTheme_source)
        player.dead = false
    else 
        love.graphics.print(player.pos.y, 0, 0)
        love.graphics.setColor(1,1,1)
        love.graphics.draw(player.sprite, player.pos.x, player.pos.y)
        drawLevel(current_level)
    end
end

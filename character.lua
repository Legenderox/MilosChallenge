player = {
    x = 0,
    y = 0,
    xvel = 0,
    yvel = 0,
    sprite = love.graphics.newImage("player.png")
}

function update_player(dt, player)
    if love.keyboard.isDown("right") then
        player.xvel = player.xvel + dt
    elseif love.keyboard.isDown("left") then
        player.xvel = player.xvel - dt
    elseif love.keyboard.isDown("space") then
        player.yvel
    end
end

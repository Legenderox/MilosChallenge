vector = require("vector")

player = {
    pos = vector.new(0, 0),
    vel = vector.new(0, 0),
    width = 32,
    height = 64,
    midair = true,
    sprite = love.graphics.newImage("player.png")
}

function update_positions(dt)
    if player.pos.y >= HEIGHT - player.height then
        player.midair = false
        player.vel.y = 0
        -- don't clip into the ground please thank you
        player.pos.y = HEIGHT - player.height
    end

    -- gravity
    if player.midair then
        player.vel.y = player.vel.y + 1
        player.vel.y = math.min(player.vel.y, 10)
    -- friction
    elseif not player.midair then
        player.vel.x = player.vel.x * 0.8
        if math.abs(player.vel.x) < 0.001 then
            player.vel.x = 0
        end
        -- since we're on the ground we can move
        if love.keyboard.isDown("right") then
            player.vel.x = player.vel.x + 50 * dt
            player.vel.x = math.min(player.vel.x, 5)
        elseif love.keyboard.isDown("left") then
            player.vel.x = player.vel.x - 50 * dt
            player.vel.x = math.max(player.vel.x, -5)
        end

        if love.keyboard.isDown("space") then
            player.vel.y = -15
            player.midair = true
        end
    end

    player.pos.y = player.pos.y + player.vel.y
    player.pos.x = player.pos.x + player.vel.x
end

function update_player(dt)
    update_positions(dt)
    -- collision checking
end

vector = require("vector")
collision = require("collision")
worldgen = require("worldgen")
tableUtil = require("tableUtil")

player = {
    pos = vector.new(0, 0),
    vel = vector.new(0, 0),
    width = 32,
    height = 64,
    midair = true,
    sprite = love.graphics.newImage("player.png")
}
local prevPlayer

local collisionCallbacks = {
    start = function()
        canCollide()
    end,
    goal = function()
        canCollide()
        love.timer.sleep(.5)

    end,
    killblock = function()
        
    end,
    platform = function()
        canCollide()
    end,
}

function canCollide( ... )
    -- general collision callback to prevent clipping
    
    if player.vel.y ~= 0 then 
        player.pos.y = prevPlayer.pos.y
        player.vel.y = 0 
        player.midair = false
    end
end

function handle_collisions()
    local level = levels[current_level]
    local collided = false

    for name, settings in pairs(level) do
        if collide_check(player, settings) then
            collided = true
            local callback = collisionCallbacks[settings.type]
            if not callback then print("Cannot find collision callback for type: ".. settings.type) end
            callback()
        end
    end

    if not collided then player.midair = true end
end

function update_positions(dt)
    if player.pos.y >= HEIGHT - player.height then
        player.midair = false
        player.vel.y = 0
        -- don't clip into the ground please thank you
        player.pos.y = HEIGHT - player.height
    end

    -- gravity
    if player.midair then
        player.vel.y = player.vel.y + 100 * dt
        player.vel.y = math.min(player.vel.y, 10)
    -- friction
    elseif not player.midair then
        player.vel.x = player.vel.x * 0.8
        if math.abs(player.vel.x) < 0.001 then
            player.vel.x = 0
        end
        -- since we're on the ground we can move
        if love.keyboard.isDown("d") then
            player.vel.x = player.vel.x + 50 * dt
            player.vel.x = math.min(player.vel.x, 5)
        elseif love.keyboard.isDown("a") then
            player.vel.x = player.vel.x - 50 * dt
            player.vel.x = math.max(player.vel.x, -5)
        end

        if love.keyboard.isDown("space") then
            player.vel.y = -15
            player.midair = true
        end
    end

    player.pos = player.pos + player.vel
end

function update_player(dt)
    update_positions(dt)
    
    -- collision checking
    handle_collisions(dt)

    prevPlayer = CopyTable(player)
end

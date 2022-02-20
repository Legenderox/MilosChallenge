vector = require("vector")
collision = require("collision")
worldgen = require("worldgen")
tableUtil = require("tableUtil")

defaultSprite = love.graphics.newImage("player.png")
deadSprite = love.graphics.newImage("dead.png")

player = {
    pos = vector.new(0, 0),
    vel = vector.new(0, 0),
    orientation = 0,
    width = 32,
    height = 64,
    midair = true,
    dead = false,
    sprite = defaultSprite
}
local prevPlayer

mainTheme_source = love.audio.newSource("mainTheme1.mp3", "stream")
death_source = love.audio.newSource("death.mp3", "stream")
love.audio.play(mainTheme_source)

local collisionCallbacks = {
    start = function(prop)
        canCollide(prop)
    end,
    goal = function(prop)
        canCollide(prop)
        player.midair = false
        player.vel = vector.new(0,0)
        nextLevel()
        goToStart()
    end,
    killblock = function()
        love.audio.play(death_source)
        love.audio.pause(mainTheme_source)
        player.midair = false
        player.vel = vector.new(0,0)
        player.dead = true
    end,
    platform = function(prop)
        canCollide(prop)
    end,
}

function goToStart( ... )
    local level = levels[current_level]
    local start = level.start
    if not start then print("level: ".. tostring(current_level).. " does not have start!") return end
    player.pos = start.pos - vector.new(0,player.height + 10)
end

function canCollide(prop)
    -- general collision callback to prevent clipping

    if player.vel.y ~= 0 then
        if is_above(prevPlayer, prop) then
            player.pos.y = prevPlayer.pos.y
            player.vel.y = 0
            player.midair = false
        elseif is_below(prevPlayer, prop) then
            player.pos.y = prevPlayer.pos.y
            player.vel.y = 0
            player.midair = true
        else
            player.pos.x = prevPlayer.pos.x
            player.vel.x = 0
            player.midair = true
        end
    end
end

function handle_collisions()
    local level = levels[current_level]
    local collided = false

    for name, prop in pairs(level) do
        if collide_check(player, prop) then
            collided = true
            local callback = collisionCallbacks[prop.type]
            if not callback then print("Cannot find collision callback for type: ".. prop.type) end
            callback(prop)
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
        player.vel.x = player.vel.x * 0.9
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
            player.vel.y = -20
            player.midair = true
        end
    end

    player.pos = player.pos + player.vel * 50 * dt
end

function update_player(dt)
    update_positions(dt)

    -- collision checking
    handle_collisions(dt)

    prevPlayer = CopyTable(player)
end

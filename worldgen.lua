local vector = require("vector")
local character = require("character")

current_level = 1

props = {
    template = {
        
    },
    start = {

    },
    goal = {

    },
    platform = {

    },
    killblock = {

    },
}

levels = {
    [1] = {
        start = {
            type = "start",
            pos = vector.new(50,600),
            height = 10,
            width = 50,
            color = {0,1,0}, -- r,g,b
        },
        goal = {
            type = "goal",
            pos = vector.new(550,100),
            height = 10,
            width = 50,
            color = {1,0,0}, -- r,g,b
        },
    },
    [2] = {
        start = {
            type = "start",
            pos = vector.new(50,50),
            height = 10,
            width = 10,
            color = {1,1,1}, -- r,g,b
        },
    }
}

function drawProp(settings)
    love.graphics.setColor(unpack(settings.color))
    love.graphics.rectangle("fill", settings.pos.x, settings.pos.y, settings.width, settings.height)
end

function drawLevel(level)
    -- level: Int

    local levelDetails = levels[level]

    -- drawing props
    for name, settings in pairs(levelDetails) do
        drawProp(settings)
    end
end
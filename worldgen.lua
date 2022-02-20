local vector = require("vector")

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
            pos = vector.new(0,300),
            height = 10,
            width = 50,
            color = {0,1,0}, -- r,g,b
        },
        goal = {
            type = "goal",
            pos = vector.new(590,300),
            height = 10,
            width = 50,
            color = {1, 0.952, 0.101}, -- r,g,b
        },
        killFloor = {
            type = "killblock",
            pos = vector.new(0,620),
            height = 20,
            width = 640,
            color = {1,0,0}, -- r,g,b
        },
        block1 = {
            type = "platform",
            pos = vector.new(150,300),
            height = 10,
            width = 50,
            color = {1, 1, 1}, -- r,g,b
        },
        block2 = {
            type = "platform",
            pos = vector.new(300,300),
            height = 10,
            width = 50,
            color = {1, 1, 1}, -- r,g,b
        },
        block3 = {
            type = "platform",
            pos = vector.new(450,300),
            height = 10,
            width = 50,
            color = {1, 1, 1}, -- r,g,b
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

function nextLevel()
    current_level = current_level + 1
    drawLevel(current_level)
end
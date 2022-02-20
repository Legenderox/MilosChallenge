resources = {}

function love.load()
    resources.player = love.graphics.newImage("player.png")
end

function love.update(dt)

end

function love.draw()
    love.graphics.print("hello", WIDTH/2, HEIGHT/2)
    love.graphics.draw(resources.player, 0, 0)
end

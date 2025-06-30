local Vector = require("base.vector")
local Player = require("player")

-- 游戏启动时，只会调用 1 次
-- 在这里加载游戏资源，初始化变量和配置
function love.load()
    player = Player.new()

    player.position.x = 400
    player.position.y = 300

    player.speed = 100
end

-- 每一帧调用一次
-- @param dt 即 delta time, 距离上一帧的时间差
function love.update(dt)
    local dir = Vector(0, 0)
    if love.keyboard.isDown("d") then
        dir = dir + Vector(1, 0)
    end
    if love.keyboard.isDown("a") then
        dir = dir + Vector(-1, 0)
    end
    if love.keyboard.isDown("w") then
        dir = dir + Vector(0, -1)
    end
    if love.keyboard.isDown("s") then
        dir = dir + Vector(0, 1)
    end
    dir = dir:normalize()
    player:move(dir * player.speed * dt)
end

-- update() 之后调用，完成渲染工作。所有对 `love.graphics.draw` 的调用只有在这个回调里才会生效
function love.draw()
    love.graphics.rectangle("line", player.position.x, player.position.y, player.width, player.height, player.radius)
end
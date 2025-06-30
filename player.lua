
local Vector = require("base.vector")

local Player = {}

function Player.new()
    -- 常量
    local player = {
        width = 50,
        height = 80,
        radius = 8
    }
    -- 属性
    player.speed = 100

    -- 变量
    player.position = Vector(0, 0)
    return setmetatable(player, {__index = Player})
end

function Player:move(v)
    self.position = self.position + v
end

return Player

local Class = require("base.class")
local Vector = require("base.vector")

local Player = Class()

function Player:init()
    -- 常量
    self.width = 50
    self.height = 80
    self.radius = 8
    -- 属性
    self.speed = 100

    -- 变量
    self.position = Vector(0, 0) -- 玩家位置
end

function Player:move(v)
    self.position = self.position + v
end

return Player
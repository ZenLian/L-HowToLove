-- Simple Class implementation in Lua, **NO** inheritance

local Class = {}
Class.__index = Class

function Class:init(...)
    error("Class:init() is not implemented!")
end

local function call(_, ...)
    local O = {}
    O.__index = O
    return setmetatable(O, {
        __call = function (_, ...)
            local instance = setmetatable({}, O)
            instance:init(...)
            return instance
        end,
        __index = Class
    })
end

return setmetatable(Class, {
    __call = call,
})
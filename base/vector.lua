
local Class = require("base.class")

local Vector = Class()

function Vector:init(x, y)
    self.x = x or 0
    self.y = y or 0
end

function Vector.__add(a, b)
    return Vector(a.x + b.x, a.y + b.y)
end

function Vector.__sub(a, b)
    return Vector(a.x - b.x, a.y - b.y)
end

function Vector.__mul(a, b)
    if type(a) == "number" then
        return Vector(b.x * a, b.y * a)
    elseif type(b) == "number" then
        return Vector(a.x * b, a.y * b)
    else
        error("Can only multiply vector by scalar")
    end
end

function Vector.__div(a, b)
    if type(b) == "number" then
       return Vector(a.x / b, a.y / b)
    else
       error("Invalid argument types for vector division.")
    end
end

function Vector.__eq(a, b)
	return a.x == b.x and a.y == b.y
end

function Vector.__ne(a, b)
	return not Vector.__eq(a, b)
end

function Vector.__unm(a)
	return Vector(-a.x, -a.y)
end

function Vector.__lt(a, b)
    return a.x < b.x and a.y < b.y
end

function Vector.__le(a, b)
    return a.x <= b.x and a.y <= b.y
end

function Vector.__tostring(v)
    return "(" .. v.x .. ", " .. v.y .. ")"
end

function Vector.distance(a, b)
    return (a - b):len()
end

---
--- Class functions
---

function Vector:len()
    return math.sqrt(self.x * self.x + self.y * self.y)
end

function Vector:normalize()
    local len = self:len()
    if len > 0 then
        self.x, self.y = self.x / len, self.y / len
    end
    return self
end

function Vector:angle()
    return math.atan(self.y, self.x)
end

function Vector:dot(v)
    return self.x * v.x + self.y * v.y
end

-- return setmetatable(Vector, {
--     __call = function (_, ...)
--         local v = setmetatable({}, Vector)
--         v:init(...)
--         return v
--     end
-- })
return Vector
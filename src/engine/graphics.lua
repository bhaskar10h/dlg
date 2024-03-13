-- Extensions to love.graphics

local std = require "lib.std"

-- Draw a filled or outlined rectangle with rounded corners
function love.graphics.roundedRect(mode, bounds, radius)
    local x1, y1, x2, y2 = bounds.x1, bounds.y1, bounds.x2, bounds.y2
    local r = radius or 0

    love.graphics.rectangle(mode, x1 + r, y1, x2 - x1 - 2 * r, y2 - y1)
    love.graphics.rectangle(mode, x1, y1 + r, r, y2 - y1 - 2 * r)
    love.graphics.rectangle(mode, x2 - r, y1 + r, r, y2 - y1 - 2 * r)

    love.graphics.arc(mode, x1 + r, y1 + r, r, math.pi, math.pi * 1.5)
    love.graphics.arc(mode, x2 - r, y1 + r, r, math.pi * 1.5, 0)
    love.graphics.arc(mode, x1 + r, y2 - r, r, math.pi * 0.5, math.pi)
    love.graphics.arc(mode, x2 - r, y2 - r, r, 0, math.pi * 0.5)
end

-- Draw a line with an arrowhead at the end
function love.graphics.arrowLine(x1, y1, x2, y2, arrowSize)
    love.graphics.line(x1, y1, x2, y2)

    local angle = math.atan2(y2 - y1, x2 - x1)
    local arrowX = x2 - arrowSize * math.cos(angle)
    local arrowY = y2 - arrowSize * math.sin(angle)

    local arrowSide1X = arrowX - arrowSize * math.cos(angle - math.pi / 6)
    local arrowSide1Y = arrowY - arrowSize * math.sin(angle - math.pi / 6)

    local arrowSide2X = arrowX - arrowSize * math.cos(angle + math.pi / 6)
    local arrowSide2Y = arrowY - arrowSize * math.sin(angle + math.pi / 6)

    love.graphics.line(x2, y2, arrowSide1X, arrowSide1Y)
    love.graphics.line(x2, y2, arrowSide2X, arrowSide2Y)
end

-- Draw a circle
function love.graphics.circleWithBounds(mode, bounds)
    local radius = math.min(bounds.x2 - bounds.x1, bounds.y2 - bounds.y1) / 2
    local centerX = bounds.x1 + (bounds.x2 - bounds.x1) / 2
    local centerY = bounds.y1 + (bounds.y2 - bounds.y1) / 2
    love.graphics.circle(mode, centerX, centerY, radius)
end

-- Set color with HSV values
function love.graphics.setColorHSV(h, s, v, a)
    local r, g, b = std.hsvToRgb(h, s, v)
    love.graphics.setColor(r / 255, g / 255, b / 255, a and a / 255 or 1)
end

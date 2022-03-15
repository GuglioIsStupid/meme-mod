--[[----------------------------------------------------------------------------
This file is part of Friday Night Funkin' Rewritten

Copyright (C) 2021  HTV04

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <https://www.gnu.org/licenses/>.
------------------------------------------------------------------------------]]

return graphics.newSprite(
	love.graphics.newImage(graphics.imagePath("small/boyfriend")),
	-- Automatically generated from bfPixel.xml
	{
		{x = 0, y = 0, width = 2, height = 3, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 1: BF IDLE 1
        {x = 3, y = 0, width = 2, height = 3, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 2: BF IDLE 2
		{x = 6, y = 0, width = 3, height = 3, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 3: BF LEFT
        {x = 10, y = 0, width = 2, height = 3, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 4: BF DOWN
        {x = 13, y = 0, width = 2, height = 3, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 5: BF UP
        {x = 16, y = 0, width = 2, height = 3, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 6: BF RIGHT
        {x = 0, y = 4, width = 3, height = 3, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 7: BF LEFT MISS
        {x = 4, y = 4, width = 2, height = 3, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 8: BF DOWN MISS
        {x = 7, y = 4, width = 2, height = 3, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 9: BF UP MISS
        {x = 10, y = 4, width = 2, height = 3, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0} -- 10: BF RIGHT MISS
	},
	{
		["miss down"] = {start = 8, stop = 8, speed = 24, offsetX = -1, offsetY = 0},
		["down"] = {start = 4, stop = 4, speed = 24, offsetX = -1, offsetY = 0},
		["idle"] = {start = 1, stop = 2, speed = 12, offsetX = 0, offsetY = 0},
		["miss left"] = {start = 7, stop = 7, speed = 24, offsetX = 1, offsetY = 0},
		["left"] = {start = 3, stop = 3, speed = 24, offsetX = 1, offsetY = 0},
		["miss right"] = {start = 10, stop = 10, speed = 24, offsetX = 0, offsetY = 0},
		["right"] = {start = 6, stop = 6, speed = 24, offsetX = 0, offsetY = 0},
		["miss up"] = {start = 9, stop = 9, speed = 24, offsetX = -1, offsetY = 0},
		["up"] = {start = 5, stop = 5, speed = 24, offsetX = -1, offsetY = 0}
	},
	"idle",
	false
)

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
	love.graphics.newImage(graphics.imagePath("small/senpai")),
    -- Made by fucking me (Guglio)
	{
		{x = 1, y = 1, width = 2, height = 4, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 1: Senpai IDLE
		{x = 8, y = 1, width = 2, height = 4, offsetX = -1, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 2: Senpai LEFT
        {x = 11, y = 1, width = 2, height = 3, offsetX = 0, offsetY = 1, offsetWidth = 0, offsetHeight = 0}, -- 3: Senpai DOWN
        {x = 14, y = 1, width = 2, height = 4, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 4: Senpai UP
        {x = 4, y = 1, width = 3, height = 4, offsetX = 1, offsetY = 0, offsetWidth = 0, offsetHeight = 0} -- 5: Senpai RIGHT
	},
	{
        ["idle"] = {start = 1, stop = 1, speed = 12, offsetX = 0, offsetY = 0},
        ["left"] = {start = 2, stop = 2, speed = 24, offsetX = 0, offsetY = 0},
		["down"] = {start = 3, stop = 3, speed = 24, offsetX = 0, offsetY = 0},
        ["up"] = {start = 4, stop = 4, speed = 24, offsetX = 0, offsetY = 0},
		["right"] = {start = 5, stop = 5, speed = 24, offsetX = 0, offsetY = 0}
	},
	"idle",
	false
)

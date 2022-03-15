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
    images.icons,
	{
		{x = 0, y = 0, width = 150, height = 150, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 1: Boyfriend
		{x = 150, y = 0, width = 150, height = 150, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 2: Boyfriend Losing
		{x = 300, y = 0, width = 150, height = 150, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 3: Skip and Pump
		{x = 450, y = 0, width = 150, height = 150, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 4: Skid and Pump Losing
		{x = 600, y = 0, width = 150, height = 150, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 5: Pico
		{x = 750, y = 0, width = 150, height = 150, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 6: Pico Losing
		{x = 900, y = 0, width = 150, height = 150, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 7: Mommy Mearest
		{x = 1050, y = 0, width = 150, height = 150, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 8: Mommy Mearest Losing
		{x = 1200, y = 0, width = 150, height = 150, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 9: Tankman
		{x = 1350, y = 0, width = 150, height = 150, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 10: Tankman Losing
		{x = 0, y = 150, width = 150, height = 150, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 11: Unknown
		{x = 150, y = 150, width = 150, height = 150, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 12: Unknown Losing
		{x = 300, y = 150, width = 150, height = 150, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 13: Daddy Dearest
		{x = 450, y = 150, width = 150, height = 150, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 14: Daddy Dearest Losing
		{x = 600, y = 150, width = 150, height = 150, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 15: Boyfriend (Old)
		{x = 750, y = 150, width = 150, height = 150, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 16: Boyfriend Losing (Old)
		{x = 900, y = 150, width = 150, height = 150, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 17: Girlfriend
		{x = 1050, y = 150, width = 150, height = 150, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 18: Daddy Dearest and Mommy Mearest
		{x = 1200, y = 150, width = 150, height = 150, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 19: Daddy Dearest and Mommy Mearest Losing
		{x = 1350, y = 150, width = 150, height = 150, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 20: Monster
		{x = 0, y = 300, width = 150, height = 150, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 21: Monster Losing
		{x = 150, y = 300, width = 150, height = 150, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 22: Boyfriend (Pixel)
		{x = 300, y = 300, width = 150, height = 150, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 23: Senpai
		{x = 450, y = 300, width = 150, height = 150, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 24: Spirit
		{x = 600, y = 300, width = 150, height = 150, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 25: Amor
		{x = 750, y = 300, width = 150, height = 150, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 26: Amor losing
		{x = 1050, y = 300, width = 150, height = 150, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 27: Bob
		{x = 1350, y = 300, width = 150, height = 150, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 28: Bob losing
		{x = 0, y = 450, width = 150, height = 150, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 29: Bosip
		{x = 300, y = 450, width = 150, height = 150, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 30: Bosip losing
		{x = 900, y = 450, width = 150, height = 150, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 31: Bluskys
		{x = 1050, y = 450, width = 150, height = 150, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 32: Bluskys Losing
		{x = 1200, y = 450, width = 150, height = 150, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 33: Mini
		{x = 1350, y = 450, width = 150, height = 150, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 34: Mini Losing
		{x = 0, y = 600, width = 150, height = 150, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 35: Jghost
		{x = 150, y = 600, width = 150, height = 150, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 36: Jghost Losing
		{x = 300, y = 600, width = 150, height = 150, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 37: Gloopy
		{x = 450, y = 600, width = 150, height = 150, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 38: Gloopy Losing
		{x = 600, y = 600, width = 150, height = 150, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 39: Dumb Gloopy
		{x = 750, y = 600, width = 150, height = 150, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 40: Dumb Gloopy Losing
		{x = 900, y = 600, width = 150, height = 150, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 41: Ron
		{x = 1050, y = 600, width = 150, height = 150, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 42: Ron Losing
		{x = 600, y = 450, width = 150, height = 150, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 43: GF Losing
		{x = 0, y = 750, width = 150, height = 150, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 44: Girlfriend Cool
		{x = 150, y = 750, width = 150, height = 150, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 45: Girlfriend Cool Losing
		{x = 900, y = 750, width = 150, height = 150, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 46: Bob Cool
		{x = 1050, y = 750, width = 150, height = 150, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 47: Bob Cool Losing
		{x = 600, y = 750, width = 150, height = 150, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 48: Bosip Cool
		{x = 750, y = 750, width = 150, height = 150, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 49: Bosip Cool Losing
		{x = 1200, y = 750, width = 150, height = 150, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 50: Amor Cool
		{x = 1350, y = 750, width = 150, height = 150, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 51: Amor Cool Losing
		{x = 300, y = 750, width = 150, height = 150, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 52: Boyfriend Cool
		{x = 450, y = 750, width = 150, height = 150, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0} -- 53: Boyfriend Cool Losing

	},
	{
		["boyfriend"] = {start = 1, stop = 1, speed = 0, offsetX = 0, offsetY = 0},
		["boyfriend losing"] = {start = 2, stop = 2, speed = 0, offsetX = 0, offsetY = 0},
		["skid and pump"] = {start = 3, stop = 3, speed = 0, offsetX = 0, offsetY = 0},
		["skid and pump losing"] = {start = 4, stop = 4, speed = 0, offsetX = 0, offsetY = 0},
		["pico"] = {start = 5, stop = 5, speed = 0, offsetX = 0, offsetY = 0},
		["pico losing"] = {start = 6, stop = 6, speed = 0, offsetX = 0, offsetY = 0},
		["mommy mearest"] = {start = 7, stop = 7, speed = 0, offsetX = 0, offsetY = 0},
		["mommy mearest losing"] = {start = 8, stop = 8, speed = 0, offsetX = 0, offsetY = 0},
		["tankman"] = {start = 9, stop = 9, speed = 0, offsetX = 0, offsetY = 0},
		["tankman losing"] = {start = 10, stop = 10, speed = 0, offsetX = 0, offsetY = 0},
		["unknown"] = {start = 11, stop = 11, speed = 0, offsetX = 0, offsetY = 0},
		["unknown losing"] = {start = 12, stop = 12, speed = 0, offsetX = 0, offsetY = 0},
		["daddy dearest"] = {start = 13, stop = 13, speed = 0, offsetX = 0, offsetY = 0},
		["daddy dearest losing"] = {start = 14, stop = 14, speed = 0, offsetX = 0, offsetY = 0},
		["boyfriend (old)"] = {start = 15, stop = 15, speed = 0, offsetX = 0, offsetY = 0},
		["boyfrined losing (old)"] = {start = 16, stop = 16, speed = 0, offsetX = 0, offsetY = 0},
		["girlfriend"] = {start = 17, stop = 17, speed = 0, offsetX = 0, offsetY = 0},
		["dearest duo"] = {start = 18, stop = 18, speed = 0, offsetX = 0, offsetY = 0},
		["dearest duo losing"] = {start = 19, stop = 19, speed = 0, offsetX = 0, offsetY = 0},
		["monster"] = {start = 20, stop = 20, speed = 0, offsetX = 0, offsetY = 0},
		["monster losing"] = {start = 21, stop = 21, speed = 0, offsetX = 0, offsetY = 0},
		["boyfriend (pixel)"] = {start = 22, stop = 22, speed = 0, offsetX = 0, offsetY = 0},
		["senpai"] = {start = 23, stop = 23, speed = 0, offsetX = 0, offsetY = 0},
		["spirit"] = {start = 24, stop = 24, speed = 0, offsetX = 0, offsetY = 0},
		["gar"] = {start = 25, stop = 25, speed = 0, offsetX = 0, offsetY = 0},
		["gar losing"] = {start = 26, stop = 26, speed = 0, offsetX = 0, offsetY = 0},
		["bob"] = {start = 27, stop = 27, speed = 0, offsetX = 0, offsetY = 0},
		["bob losing"] = {start = 28, stop = 28, speed = 0, offsetX = 0, offsetY = 0},
		["bosip"] = {start = 29, stop = 29, speed = 0, offsetX = 0, offsetY = 0},
		["bosip losing"] = {start = 30, stop = 30, speed = 0, offsetX = 0, offsetY = 0},
		["bluskys"] = {start = 31, stop = 31, speed = 0, offsetX = 0, offsetY = 0},
		["bluskys losing"] = {start = 32, stop = 32, speed = 0, offsetX = 0, offsetY = 0},
		["mini"] = {start = 33, stop = 33, speed = 0, offsetX = 0, offsetY = 0},
		["mini losing"] = {start = 34, stop = 34, speed = 0, offsetX = 0, offsetY = 0},
		["jghost"] = {start = 35, stop = 35, speed = 0, offsetX = 0, offsetY = 0},
		["jghost losing"] = {start = 36, stop = 36, speed = 0, offsetX = 0, offsetY = 0},
		["ash"] = {start = 37, stop = 37, speed = 0, offsetX = 0, offsetY = 0},
		["ash losing"] = {start = 38, stop = 38, speed = 0, offsetX = 0, offsetY = 0},
		["gloopy"] = {start = 39, stop = 39, speed = 0, offsetX = 0, offsetY = 0},
		["gloopy losing"] = {start = 40, stop = 40, speed = 0, offsetX = 0, offsetY = 0},
		["dumb gloopy"] = {start = 41, stop = 41, speed = 0, offsetX = 0, offsetY = 0},
		["dumb gloopy losing"] = {start = 42, stop = 42, speed = 0, offsetX = 0, offsetY = 0},
		["ron"] = {start = 41, stop = 41, speed = 0, offsetX = 0, offsetY = 0},
		["ron losing"] = {start = 42, stop = 42, speed = 0, offsetX = 0, offsetY = 0},
		["girlfriend losing"] = {start = 43, stop = 43, speed = 0, offsetX = 0, offsetY = 0},
		["girlfriend cool"] = {start = 44, stop = 44, speed = 0, offsetX = 0, offsetY = 0},
		["girlfriend cool losing"] = {start = 45, stop = 45, speed = 0, offsetX = 0, offsetY = 0},
		["bob cool"] = {start = 46, stop = 46, speed = 0, offsetX = 0, offsetY = 0},
		["bob cool losing"] = {start = 47, stop = 47, speed = 0, offsetX = 0, offsetY = 0},
		["bosip cool"] = {start = 48, stop = 48, speed = 0, offsetX = 0, offsetY = 0},
		["bosip cool losing"] = {start = 49, stop = 49, speed = 0, offsetX = 0, offsetY = 0},
		["amor cool"] = {start = 50, stop = 50, speed = 0, offsetX = 0, offsetY = 0},
		["amor cool losing"] = {start = 51, stop = 51, speed = 0, offsetX = 0, offsetY = 0},
		["boyfriend cool"] = {start = 52, stop = 52, speed = 0, offsetX = 0, offsetY = 0},
		["boyfriend cool losing"] = {start = 53, stop = 53, speed = 0, offsetX = 0, offsetY = 0}
	},
	"boyfriend",
	false
)
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

local gameLeft
local gameDown
local gameUp
local gameRight

if love.system.getOS() == "NX" then
	if settings.dfjk then
		gameLeft = {"axis:leftx-", "axis:rightx-", "button:dpleft", "button:x", "key:d", "key:left"}
		gameDown = {"axis:lefty+", "axis:righty+","button:dpdown", "button:a", "key:f", "key:down"}
		gameUp = {"axis:lefty-", "axis:righty-","button:dpup", "button:y", "key:j", "key:up"}
		gameRight = {"axis:leftx+", "axis:rightx+", "button:dpright", "button:b", "key:k", "key:right"}
		oneK = {"button:a", "key:space"}
		b = {"key:b"}
		t = {"key:t"}
		j = {"key:j"}
		four = {"key:4"}
		one = {"key:1"}
		m = {"key:m"}
		g = {"key:g"}
		z = {"key:z"}
		five = {"key:5"}
		oneK_other_arrows = {}
	
	else
		gameLeft = {"axis:leftx-", "axis:rightx-", "button:dpleft", "button:x", "key:a", "key:left"}
		gameDown = {"axis:lefty+", "axis:righty+", "button:dpdown", "button:a", "key:s", "key:down"}
		gameUp = {"axis:lefty-", "axis:righty-", "button:dpup", "button:y", "key:w", "key:up"}
		gameRight = {"axis:leftx+", "axis:rightx+", "button:dpright", "button:b", "key:d", "key:right"}
		oneK = {"button:a", "key:space"}
		b = {"key:b"}
		t = {"key:t"}
		j = {"key:j"}
		four = {"key:4"}
		one = {"key:1"}
		m = {"key:m"}
		g = {"key:g"}
		z = {"key:z"}
		five = {"key:5"}
		oneK_other_arrows = {}
	end

	return baton.new {
		controls = {
			left = {"axis:leftx-", "button:dpleft", "key:left"},
			down = {"axis:lefty+", "button:dpdown", "key:down"},
			up = {"axis:lefty-", "button:dpup", "key:up"},
			right = {"axis:leftx+", "button:dpright", "key:right"},
			confirm = {"button:b", "key:return"},
			back = {"button:a", "key:escape"},
			funnyThing = {"button:back", "key:7"},

			gameLeft = gameLeft,
			gameDown = gameDown,
			gameUp = gameUp,
			gameRight = gameRight,
			oneK = oneK,
			oneK_other_arrows = oneK_other_arrows,
			b = b,
			t = t,
			j = j,
			four = four,
			one = one,
			m = m,
			g = g,
			z = z,
			five = five,
			gameBack = {"button:start", "key:escape"},
		},
		joystick = love.joystick.getJoysticks()[1]
	}
else
	if settings.dfjk then
		gameLeft = {"key:d", "key:left", "axis:leftx-", "axis:rightx-", "button:dpleft", "button:x"}
		gameDown = {"key:f", "key:down", "axis:lefty+", "axis:righty+", "button:dpdown", "button:a"}
		gameUp = {"key:j", "key:up", "axis:lefty-", "axis:righty-", "button:dpup", "button:y"}
		gameRight = {"key:k", "key:right", "axis:leftx+", "axis:rightx+", "button:dpright", "button:b"}
		oneK = {"key:space", "button:a"}
		b = {"key:b"}
		t = {"key:t"}
		j = {"key:j"}
		four = {"key:4"}
		one = {"key:1"}
		m = {"key:m"}
		g = {"key:g"}
		z = {"key:z"}
		five = {"key:5"}
		oneK_other_arrows = {}
	else
		gameLeft = {"key:a", "key:left", "axis:leftx-", "axis:rightx-", "button:dpleft", "button:x"}
		gameDown = {"key:s", "key:down", "axis:lefty+", "axis:righty+", "button:dpdown", "button:a"}
		gameUp = {"key:w", "key:up", "axis:lefty-", "axis:righty-", "button:dpup", "button:y"}
		gameRight = {"key:d", "key:right", "axis:leftx+", "axis:rightx+", "button:dpright", "button:b"}
		oneK = {"key:space", "button:a"}
		b = {"key:b"}
		t = {"key:t"}
		j = {"key:j"}
		four = {"key:4"}
		one = {"key:1"}
		m = {"key:m"}
		g = {"key:g"}
		z = {"key:z"}
		five = {"key:5"}
		oneK_other_arrows = {}
	end

	return baton.new {
		controls = {
			left = {"key:left", "axis:leftx-", "button:dpleft"},
			down = {"key:down", "axis:lefty+", "button:dpdown"},
			up = {"key:up", "axis:lefty-", "button:dpup"},
			right = {"key:right", "axis:leftx+", "button:dpright"},
			confirm = {"key:return", "button:a"},
			back = {"key:escape", "button:b"},
			funnyThing = {"key:7", "button:back"},

			gameLeft = gameLeft,
			gameDown = gameDown,
			gameUp = gameUp,
			gameRight = gameRight,
			oneK = oneK,
			oneK_other_arrows = oneK_other_arrows,
			b = b,
			t = t,
			j = j,
			four = four,
			one = one,
			m = m,
			g = g,
			z = z,
			five = five,
			gameBack = {"key:escape", "button:start"},
		},
		joystick = love.joystick.getJoysticks()[1]
	}
end
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

local leftFunc, rightFunc, confirmFunc, backFunc, drawFunc

local menuState

local menuNum = 1

local weekNum = 1
local songNum, songAppend
local songDifficulty = 2

local titleBG = graphics.newImage(love.graphics.newImage(graphics.imagePath("menu/secret-title-bg")))
local logo = graphics.newImage(love.graphics.newImage(graphics.imagePath("menu/secret-logo")))


logo.sizeX, logo.sizeY = 0.6, 0.6

local girlfriendTitle = love.filesystem.load("sprites/week7/tankmanCaptain.lua")()
girlfriendTitle:animate("idle", true)

local menuNames = {
	"Story Mode",
	"Freeplay",
	"This is totally credits"
}

local weekMeta7 = {
	{
		"Week 7",
		{
			"Ugh",
			"Guns",
			"Stress"
		}
	}
--	{
--		"Fucked up in the crib",
--		{
--			"Fucked up in the crib"
--		}
--	},
--	{
--		"Below Average 1K",
--		{
--			"WOOOOOOOOOOOOOOOOOOOO",
--			"Sonic 1 Intro",
--			"Scott The Woz",
--			"Endless but it ends immediately",
--			"Mr Beast Burger",
--			"amogus",
--			"lmao"
--		}
--	},
--	{
--		"Victory",
--		{
--			"Victory"
--		}
--	},
--	{
--		"Lost Silver",
--		{
--			"Monochrome"
--		}
--	},
--	{
--		"Friday Night Fuckshit 2",
--		{
--			"Fucked Up In The Crib......again (we are running out of ideas)"
--		}
--	},
--	{
--		"Garcello",
--		{
--			"Nerves",
--			"Headache",
--			"Release",
--			"Fading"
--		}
--	},
--	{
--		"Quaver  [CREDITS TO PIANOLUIGI FOR CHARTING THESE SONGS]",
--		{
--		"Princess of Winter",
--	
--			"Flowering Night",
--			"Csikos Post"
--		}
--	}
}
local difficultyStrs = {
	"-easy",
	"",
	"-hard"
}

local selectSound = love.audio.newSource("sounds/menu/select.ogg", "static")
local confirmSound = love.audio.newSource("sounds/menu/confirm.ogg", "static")

local music = love.audio.newSource("music/menu/menu.ogg", "stream")

local function switchMenu(menu)
	
	if menu == 4 then
		Gamestate.switch(dietzNuts)

		return switchMenu(1)
	elseif menu == 3 then
		function leftFunc()
			if menuState == 3 then
				songDifficulty = (songDifficulty > 1) and songDifficulty - 1 or 3
			elseif menuState == 2 then
				songNum = (songNum > 1) and songNum - 1 or #weekMeta7[weekNum][2]
			else
				weekNum = (weekNum > 1) and weekNum - 1 or #weekMeta7
			end
		end
		function rightFunc()
			if menuState == 3 then
				songDifficulty = (songDifficulty < 3) and songDifficulty + 1 or 1
			elseif menuState == 2 then
				songNum = (songNum < #weekMeta7[weekNum][2]) and songNum + 1 or 1
			else
				weekNum = (weekNum < #weekMeta7) and weekNum + 1 or 1
			end
		end
		function confirmFunc()
			if menuState == 3 then
				music:stop()

				status.setLoading(true)

				graphics.fadeOut(
					0.5,
					function()
						songAppend = difficultyStrs[songDifficulty]

						storyMode = false

						Gamestate.switch(week7Data[weekNum], songNum, songAppend)

						status.setLoading(false)
					end
				)
			else
				if menuState == 1 then
					songNum = 1
				end

				menuState = menuState + 1
			end
		end
		function backFunc()
			if menuState == 1 then
				switchMenu(1)
			else
				menuState = menuState - 1
			end
		end
		function drawFunc()
			graphics.setColor(1, 1, 0)
			if menuState == 3 then
				if songDifficulty == 3 then
					love.graphics.printf("Choose a difficulty: < Hard >", -640, 285, 853, "center", nil, 1.5, 1.5)
				elseif songDifficulty == 2 then
					love.graphics.printf("Choose a difficulty: < Normal >", -640, 285, 853, "center", nil, 1.5, 1.5)
				else
					love.graphics.printf("Choose a difficulty: < Easy >", -640, 285, 853, "center", nil, 1.5, 1.5)
				end
			elseif menuState == 2 then
				love.graphics.printf("Choose a song: < " .. weekMeta7[weekNum][2][songNum] .. " >", -640, 285, 853, "center", nil, 1.5, 1.5)
			else
				love.graphics.printf("Choose a week: < " .. weekMeta7[weekNum][1] .. " >", -640, 285, 853, "center", nil, 1.5, 1.5)
			end
			graphics.setColor(1, 1, 1)

			if input:getActiveDevice() == "joy" then
				love.graphics.printf("Left Stick/D-Pad: Select | A: Confirm | B: Back", -640, 350, 1280, "center", nil, 1, 1)
			else
				love.graphics.printf("Arrow Keys: Select | Enter: Confirm | Escape: Back", -640, 350, 1280, "center", nil, 1, 1)
			end
		end
	elseif menu == 2 then
		weekNum = 1
		songNum = 1

		function leftFunc()
			if menuState == 2 then
				songDifficulty = (songDifficulty > 1) and songDifficulty - 1 or 3
			else
				weekNum = (weekNum > 1) and weekNum - 1 or #weekMeta7
			end
		end
		function rightFunc()
			if menuState == 2 then
				songDifficulty = (songDifficulty < 3) and songDifficulty + 1 or 1
			else
				weekNum = (weekNum < #weekMeta7) and weekNum + 1 or 1
			end
		end
		function confirmFunc()
			if menuState == 2 then
				music:stop()

				status.setLoading(true)

				graphics.fadeOut(
					0.5,
					function()
						songAppend = difficultyStrs[songDifficulty]

						storyMode = true

						Gamestate.switch(week7Data[weekNum], songNum, songAppend)

						status.setLoading(false)
					end
				)
			else
				menuState = menuState + 1
			end
		end
		function backFunc()
			if menuState == 1 then
				switchMenu(1)
			else
				menuState = menuState - 1
			end
		end
		function drawFunc()
			graphics.setColor(1, 1, 0)
			if menuState == 2 then
				if songDifficulty == 3 then
					love.graphics.printf("Choose a difficulty: < Hard >", -640, 285, 853, "center", nil, 1.5, 1.5)
				elseif songDifficulty == 2 then
					love.graphics.printf("Choose a difficulty: < Normal >", -640, 285, 853, "center", nil, 1.5, 1.5)
				else
					love.graphics.printf("Choose a difficulty: < Easy >", -640, 285, 853, "center", nil, 1.5, 1.5)
				end
			else
				love.graphics.printf("Choose a week: < " .. weekMeta7[weekNum][1] .. " >", -640, 285, 853, "center", nil, 1.5, 1.5)
			end
			graphics.setColor(1, 1, 1)

			if input:getActiveDevice() == "joy" then
				love.graphics.printf("Left Stick/D-Pad: Select | A: Confirm | B: Back", -640, 350, 1280, "center", nil, 1, 1)
			else
				love.graphics.printf("Arrow Keys: Select | Enter: Confirm | Escape: Back", -640, 350, 1280, "center", nil, 1, 1)
			end
		end
	else
		function leftFunc()
			menuNum = (menuNum > 1) and menuNum - 1 or #menuNames
		end
		function rightFunc()
			menuNum = (menuNum < #menuNames) and menuNum + 1 or 1
		end
		function confirmFunc()
			switchMenu(menuNum + 1)
		end
		function backFunc()
			graphics.fadeOut(0.5, love.event.quit)
		end
		function drawFunc()
			graphics.setColor(1, 1, 0)
			love.graphics.printf("< " .. menuNames[menuNum] .. " >", -640, 285, 853, "center", nil, 1.5, 1.5)
			graphics.setColor(1, 1, 1)

			if input:getActiveDevice() == "joy" then
				love.graphics.printf("Left Stick/D-Pad: Select | A: Confirm | B: Exit", -640, 350, 1280, "center", nil, 1, 1)
			else
				love.graphics.printf("Arrow Keys: Select | Enter: Confirm | Escape: Exit", -640, 350, 1280, "center", nil, 1, 1)
			end
		end
	end

	menuState = 1
end

logo.x, logo.y = -325, 0

girlfriendTitle.x, girlfriendTitle.y = 300, -40

music:setLooping(true)

return {
	enter = function(self, previous)
		normalMenu = false
		songNum = 0

		switchMenu(1)

		graphics.setFade(0)
		graphics.fadeIn(0.5)

		music:play()
	end,

	update = function(self, dt)
		girlfriendTitle:update(dt)

		if not graphics.isFading() then
			if input:pressed("left") then
				audio.playSound(selectSound)

				leftFunc()
			elseif input:pressed("right") then
				audio.playSound(selectSound)

				rightFunc()
			elseif input:pressed("confirm") then
				audio.playSound(confirmSound)

				confirmFunc()
			elseif input:pressed("back") then
				audio.playSound(selectSound)

				backFunc()
			end
		end
	end,

	draw = function(self)
		love.graphics.push()
			love.graphics.translate(graphics.getWidth() / 2, graphics.getHeight() / 2)

			titleBG:draw()

			love.graphics.push()
				love.graphics.scale(cam.sizeX, cam.sizeY)

				logo:draw()

				girlfriendTitle:draw()

				drawFunc()
			love.graphics.pop()
		love.graphics.pop()
	end,

	leave = function(self)
		music:stop()

		Timer.clear()
	end
}

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

local song, difficulty

local sky, city, cityWindows, behindTrain, street
local winColors, winColor

return {
	enter = function(self, from, songNum, songAppend)
		crib:enter()

		song = songNum
		difficulty = songAppend

		cam.sizeX, cam.sizeY = 1, 1
		camScale.x, camScale.y = 1, 1


		video = love.graphics.newVideo("videos/mario.ogv")
    

		enemy = love.filesystem.load("sprites/monster.lua")()

		girlfriend.x, girlfriend.y = -70, -140
		enemy.x, enemy.y = -480, 50
		enemy.sizeX = 1 -- Reverse, reverse! NO WE DONT WANT TO REVERSE YOU YOURE NOT PICO
		boyfriend.x, boyfriend.y = 165, 50

		enemyIcon:animate("pico", false)

		self:load()
	end,

	load = function(self)
		crib:load()

		voices = love.audio.newSource("music/BALLS/Inst.ogg", "stream")
		inst = nil

		self:initUI()

		crib:setupCountdown()
	end,

	initUI = function(self)
		crib:initUI()

		crib:generateNotes(love.filesystem.load("charts/BALLS/crib.lua")())
		
	end,

	update = function(self, dt)
		crib:update(dt)

		if health >= 80 then
			if enemyIcon:getAnimName() == "monster" then
				enemyIcon:animate("monster losing", false)
			end
		else
			if enemyIcon:getAnimName() == "monster losing" then
				enemyIcon:animate("monster", false)
			end
		end

		if not countingDown and voices:isPlaying() and not video:isPlaying() then
			video:play()
		end

		cam.x, cam.y = girlfriend.x + 180, girlfriend.y + 275

		if not (countingDown or graphics.isFading()) and not voices:isPlaying() then
			if storyMode and song < 1 then
				song = song + 1

				self:load()
			else
				status.setLoading(true)

				graphics.fadeOut(
					0.5,
					function()
						Gamestate.switch(secretMenu)

						status.setLoading(false)
					end
				)
			end
		end

		crib:updateUI(dt)
	end,

	draw = function(self)

		love.graphics.push()
			love.graphics.draw(video, 200, 0)
			crib:drawRating(0.9)
		love.graphics.pop()

		crib:drawUI()
	end,

	leave = function(self)
		video:pause()
		video:release()
		video = nil

		crib:leave()
	end
}

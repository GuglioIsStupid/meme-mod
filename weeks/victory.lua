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

local stageBack, stageFront, curtains

return {
	enter = function(self, from, songNum, songAppend)
		victory:enter()

		song = songNum
		difficulty = songAppend

		background = graphics.newImage(love.graphics.newImage(graphics.imagePath("victory/stageback")))

		enemy = love.filesystem.load("sprites/victory/black.lua")()
		boyfriend = love.filesystem.load("sprites/boyfriend.lua")()
		fakeBoyfriend = love.filesystem.load("sprites/victory/death.lua")()

		girlfriend.x, girlfriend.y = 30, -90
		enemy.x, enemy.y = -290, 55
		boyfriend.x, boyfriend.y = 290, 55
		fakeBoyfriend.x, fakeBoyfriend.y = 290, 55

		enemyIcon:animate("monster losing", false)
		boyfriendIcon:animate("mommy mearest", false)

		self:load()
	end,

	load = function(self)
		victory:load()

		if song == 3 then
			inst = love.audio.newSource("music/matt/showdown/showdown_Inst.ogg", "stream")
			voices = love.audio.newSource("music/matt/showdown/showdown_Voices.ogg", "stream")
		elseif song == 2 then
			inst = love.audio.newSource("music/matt/engarde/engarde_Inst.ogg", "stream")
			voices = love.audio.newSource("music/matt/engarde/engarde_Voices.ogg", "stream")
		else
			inst = love.audio.newSource("music/victory/Inst.ogg", "stream")
			voices = love.audio.newSource("music/victory/Voices.ogg", "stream")
		end

		self:initUI()

		victory:setupCountdown()
	end,

	initUI = function(self)
		victory:initUI()

		if song == 3 then
			victory:generateNotes(love.filesystem.load("charts/matt/showdown/showdown" .. difficulty .. ".lua")())
		elseif song == 2 then
			victory:generateNotes(love.filesystem.load("charts/matt/engarde/engarde" .. difficulty .. ".lua")())
		else
			victory:generateNotes(love.filesystem.load("charts/victory/defeat.lua")())
		end
	end,

	update = function(self, dt)
		victory:update(dt)

		if song == 4 and musicThres ~= oldMusicThres and math.fmod(absMusicTime + 500, 480000 / bpm) < 100 then -- JUST SET IT TO A SONG AFTER THE LAST SONG AND THEN IT WONT DO ANYTHING
			victory:safeAnimate(boyfriend, "hey", false, 3)
		end

		if health >= 80 then
			if enemyIcon:getAnimName() == "monster losing" then
				enemyIcon:animate("boyfriend (pixel)", false)
				boyfriendIcon:animate("tankman", false)
			end
		else
			if enemyIcon:getAnimName() == "boyfriend (pixel)" then
				enemyIcon:animate("monster losing", false)
				boyfriendIcon:animate("mommy mearest", false)
			end
		end

		if not (countingDown or graphics.isFading()) and not (inst:isPlaying() and voices:isPlaying()) then
			if storyMode and song < 1 then
				song = song + 1

				self:load()
			else
				status.setLoading(true)

				graphics.fadeOut(
					0.5,
					function()
						Gamestate.switch(menu)

						status.setLoading(false)
					end
				)
			end
		end

		victory:updateUI(dt)
	end,

	draw = function(self)
		love.graphics.push()
			love.graphics.translate(graphics.getWidth() / 2, graphics.getHeight() / 2)
			love.graphics.scale(cam.sizeX, cam.sizeY)

			love.graphics.push()
				love.graphics.translate(cam.x * 0.9, cam.y * 0.9)

				background:draw()

			love.graphics.pop()
			love.graphics.push()
				love.graphics.translate(cam.x, cam.y)

				enemy:draw()
				boyfriend:draw()
			love.graphics.pop()
			love.graphics.push()
				love.graphics.translate(cam.x * 1.1, cam.y * 1.1)

			love.graphics.pop()
			victory:drawRating(0.9)
		love.graphics.pop()

		victory:drawUI()
	end,

	leave = function(self)
		stageBack = nil
		stageFront = nil
		curtains = nil

		victory:leave()
	end
}

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
		weeks1:enter()

		song = songNum
		difficulty = songAppend

		stageBack = graphics.newImage(love.graphics.newImage(graphics.imagePath("original/week1/stage-back")))
		stageFront = graphics.newImage(love.graphics.newImage(graphics.imagePath("original/week1/stage-front")))
		curtains = graphics.newImage(love.graphics.newImage(graphics.imagePath("original/week1/curtains")))

		stageFront.y = 400
		curtains.y = -100

		enemy = love.filesystem.load("sprites/original/week1/daddy-dearest.lua")()

		girlfriend.x, girlfriend.y = 30, -90
		enemy.x, enemy.y = -380, -110
		boyfriend.x, boyfriend.y = 260, 100

		enemyIcon:animate("daddy dearest losing", false)

		self:load()
	end,

	load = function(self)
		weeks1:load()

		if song == 3 then
			inst = love.audio.newSource("music/original/week1/dadbattle-inst.ogg", "stream")
			voices = love.audio.newSource("music/original/week1/dadbattle-voices.ogg", "stream")
		elseif song == 2 then
			inst = love.audio.newSource("music/original/week1/fresh-inst.ogg", "stream")
			voices = love.audio.newSource("music/original/week1/fresh-voices.ogg", "stream")
		else
			inst = love.audio.newSource("music/original/week1/bopeebo-inst.ogg", "stream")
			voices = love.audio.newSource("music/original/week1/bopeebo-voices.ogg", "stream")
		end

		self:initUI()

		weeks1:setupCountdown()
	end,

	initUI = function(self)
		weeks1:initUI()

		if song == 3 then
			weeks1:generateNotes(love.filesystem.load("charts/original/week1/dadbattle" .. difficulty .. ".lua")())
		elseif song == 2 then
			weeks1:generateNotes(love.filesystem.load("charts/original/week1/fresh" .. difficulty .. ".lua")())
		else
			weeks1:generateNotes(love.filesystem.load("charts/original/week1/bopeebo" .. difficulty .. ".lua")())
		end
	end,

	update = function(self, dt)
		weeks1:update(dt)

		if song == 1 and musicThres ~= oldMusicThres and math.fmod(absMusicTime + 500, 480000 / bpm) < 100 then
			weeks1:safeAnimate(boyfriend, "hey", false, 3)
			tutorial:safeAnimate(girlfriend, "cheer", false, 1)
		end

		if health >= 80 then
			if enemyIcon:getAnimName() == "daddy dearest losing" then
				enemyIcon:animate("daddy dearest losing", false)
			end
		else
			if enemyIcon:getAnimName() == "daddy dearest losing" then
				enemyIcon:animate("daddy dearest losing", false)
			end
		end

		if not (countingDown or graphics.isFading()) and not (inst:isPlaying() and voices:isPlaying()) then
			if storyMode and song < 3 then
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

		weeks1:updateUI(dt)
	end,

	draw = function(self)
		love.graphics.push()
			love.graphics.translate(graphics.getWidth() / 2, graphics.getHeight() / 2)
			love.graphics.scale(cam.sizeX, cam.sizeY)

			love.graphics.push()
				love.graphics.translate(cam.x * 0.9, cam.y * 0.9)

				stageBack:draw()
				stageFront:draw()

				girlfriend:draw()
			love.graphics.pop()
			love.graphics.push()
				love.graphics.translate(cam.x, cam.y)

				enemy:draw()
				boyfriend:draw()

				if boyfriend:getAnimName() == "hey" then
					love.graphics.printf(
						"Press the space bar",
						-300,
						0,
						450,
						"right",
						nil,
						1,
						1
					)
				end

			love.graphics.pop()
			love.graphics.push()
				love.graphics.translate(cam.x * 1.1, cam.y * 1.1)

				curtains:draw()
			love.graphics.pop()
			weeks1:drawRating(0.9)
		love.graphics.pop()

		weeks1:drawUI()
	end,

	leave = function(self)
		stageBack = nil
		stageFront = nil
		curtains = nil

		weeks1:leave()
	end
}

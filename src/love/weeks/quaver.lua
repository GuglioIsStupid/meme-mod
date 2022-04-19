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
		quaver:enter()

		song = 1
		difficulty = songAppend

		background = graphics.newImage(love.graphics.newImage(graphics.imagePath("quaver/oneBg")))
		underlay = graphics.newImage(love.graphics.newImage(graphics.imagePath("quaver/underlay")))

		enemy = love.filesystem.load("sprites/monster.lua")()
		boyfriend = love.filesystem.load("sprites/boyfriend.lua")()
		enemy.sizeX, enemy.sizeY = 0.8, 0.8
		boyfriend.sizeX, boyfriend.sizeY = 0.8, 0.8

		girlfriend.x, girlfriend.y = 30, -90
		enemy.x, enemy.y = -290, 55
		boyfriend.x, boyfriend.y = 290, 55
		underlay.x = 150
		underlay.sizeX = 1.4

		enemyIcon:animate("monster losing", false)
		boyfriendIcon:animate("mommy mearest", false)

		self:load()
	end,

	load = function(self)
		quaver:load()

		if song == 3 then
			inst = love.audio.newSource("music/quaver/two/Inst.ogg", "stream")
			voices = love.audio.newSource("music/quaver/two/Voices.ogg", "stream")
			background = graphics.newImage(love.graphics.newImage(graphics.imagePath("quaver/twoBg")))
		elseif song == 2 then
			inst = love.audio.newSource("music/quaver/three/Inst.ogg", "stream")
			voices = love.audio.newSource("music/quaver/three/Voices.ogg", "stream")
			background = graphics.newImage(love.graphics.newImage(graphics.imagePath("quaver/threeBg")))
		else
			inst = love.audio.newSource("music/quaver/one/Inst.ogg", "stream")
			voices = love.audio.newSource("music/quaver/one/Voices.ogg", "stream")
		end

		
		self:initUI()

		quaver:setupCountdown()
	end,

	initUI = function(self)
		quaver:initUI()


		if song == 3 then
			quaver:generateNotes(love.filesystem.load("charts/quaver/two.lua")())
		elseif song == 2 then
			quaver:generateNotes(love.filesystem.load("charts/quaver/three.lua")())
		else
			quaver:generateNotes(love.filesystem.load("charts/quaver/one.lua")())
		end

	end,

	update = function(self, dt)
		quaver:update(dt)

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

		quaver:updateUI(dt)
	end,

	draw = function(self)
		love.graphics.push()
			love.graphics.translate(graphics.getWidth() / 2, graphics.getHeight() / 2)
			love.graphics.scale(cam.sizeX, cam.sizeY)

			love.graphics.push()
				love.graphics.translate(cam.x * 0.9, cam.y * 0.9)

				background:draw()
				underlay:draw()

			love.graphics.pop()
			love.graphics.push()
				love.graphics.translate(cam.x, cam.y)

			love.graphics.pop()
			love.graphics.push()
				love.graphics.translate(cam.x * 1.1, cam.y * 1.1)

			love.graphics.pop()
			quaver:drawRating(0.9)
		love.graphics.pop()

		quaver:drawUI()
	end,

	leave = function(self)
		stageBack = nil
		stageFront = nil
		curtains = nil

		quaver:leave()
	end
}

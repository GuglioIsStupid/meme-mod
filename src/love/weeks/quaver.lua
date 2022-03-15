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

		song = songNum
		difficulty = songAppend

		background = graphics.newImage(love.graphics.newImage(graphics.imagePath("quaver/bg")))
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

		inst = love.audio.newSource("music/quaver/Inst.ogg", "stream")
		voices = love.audio.newSource("music/quaver/Voices.ogg", "stream")
		
		self:initUI()

		quaver:setupCountdown()
	end,

	initUI = function(self)
		quaver:initUI()

		quaver:generateNotes(love.filesystem.load("charts/quaver/bopeebo.lua")())
	end,

	update = function(self, dt)
		quaver:update(dt)

		if not (countingDown or graphics.isFading()) and not (inst:isPlaying() and voices:isPlaying()) then
			status.setLoading(true)

			graphics.fadeOut(
				0.5,
				function()
					Gamestate.switch(menu)

					status.setLoading(false)
				end
			)
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

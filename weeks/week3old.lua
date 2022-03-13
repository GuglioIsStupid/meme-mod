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
		weeks:enter()

		song = songNum
		difficulty = songAppend

		cam.sizeX, cam.sizeY = 1, 1
		camScale.x, camScale.y = 1, 1

		winColors = {
			{0, 0, 255}, -- Blue -- damn why does it work like this
			{251, 51, 245}, -- Magenta
			{255, 0, 0}, -- Red
			{251, 166, 51}, -- Yellow
			{0, 255, 0}, -- Green

		}
		winColor = 1

		video = love.graphics.newVideo("videos/fuckedUpInTheCrib.ogv")
        

		sky = graphics.newImage(love.graphics.newImage(graphics.imagePath("week3/sky")))
		city = graphics.newImage(love.graphics.newImage(graphics.imagePath("week3/city")))
		cityWindows = graphics.newImage(love.graphics.newImage(graphics.imagePath("week3/city-windows")))
		behindTrain = graphics.newImage(love.graphics.newImage(graphics.imagePath("week3/behind-train")))
		street = graphics.newImage(love.graphics.newImage(graphics.imagePath("week3/street")))

		behindTrain.y = -100
		behindTrain.sizeX, behindTrain.sizeY = 1.25, 1.25
		street.y = -100
		street.sizeX, street.sizeY = 1.25, 1.25

		enemy = love.filesystem.load("sprites/monster.lua")()

		girlfriend.x, girlfriend.y = -70, -140
		enemy.x, enemy.y = -480, 50
		enemy.sizeX = 1 -- Reverse, reverse! Reverse, reverse again!
		boyfriend.x, boyfriend.y = 165, 50

		enemyIcon:animate("pico", false)

		self:load()
	end,

	load = function(self)
		weeks:load()

		voices = love.audio.newSource("music/BALLS/Inst.ogg", "stream")
		inst = nil

		self:initUI()

		weeks:setupCountdown()
	end,

	initUI = function(self)
		weeks:initUI()

		weeks:generateNotes(love.filesystem.load("charts/BALLS/crib.lua")())
		
	end,

	update = function(self, dt)
		weeks:update(dt)

		if musicThres ~= oldMusicThres and math.fmod(absMusicTime, 240000 / bpm) < 100 then
			winColor = winColor + 1

			if winColor > 5 then
				winColor = 1
			end
		end


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
						Gamestate.switch(menu)

						status.setLoading(false)
					end
				)
			end
		end

		weeks:updateUI(dt)
	end,

	draw = function(self)
		local curWinColor = winColors[winColor]

		love.graphics.push()
			love.graphics.translate(graphics.getWidth() / 2, graphics.getHeight() / 2)
			love.graphics.scale(cam.sizeX, cam.sizeY)
			

			love.graphics.push()
				love.graphics.translate(cam.x * 0.25, cam.y * 0.25)

				sky:draw()
			love.graphics.pop()
			love.graphics.push()
				love.graphics.translate(cam.x * 0.5, cam.y * 0.5)

				city:draw()
				graphics.setColor(curWinColor[1] / 255, curWinColor[2] / 255, curWinColor[3] / 255)
				cityWindows:draw()
				graphics.setColor(1, 1, 1)
			love.graphics.pop()
			love.graphics.push()
				love.graphics.translate(cam.x * 0.9, cam.y * 0.9)

				behindTrain:draw()
				street:draw()

				girlfriend:draw()
			love.graphics.pop()
			love.graphics.push()
				love.graphics.translate(cam.x, cam.y)

				enemy:draw()
				boyfriend:draw()
				if video:isPlaying() then
					love.graphics.setColor(1, 1, 1, 0.6)
					love.graphics.draw(video, -750, -490)
					love.graphics.setColor(1, 1, 1, 1)
				end
			love.graphics.pop()
			weeks:drawRating(0.9)
		love.graphics.pop()

		weeks:drawUI()
	end,

	leave = function(self)
		sky = nil
		city = nil
		cityWindows = nil
		behindTrain = nil
		street = nil
		video = nil

		weeks:leave()
	end
}

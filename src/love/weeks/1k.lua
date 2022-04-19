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
		oneK:enter()

		song = 1

		enemy = love.filesystem.load("sprites/girlfriend.lua")()

		video = love.graphics.newVideo("videos/pleaseTakeAShower.ogv")

		girlfriend.x, girlfriend.y = 30, -90
		enemy.x, enemy.y = -380, -110
		boyfriend.x, boyfriend.y = 260, 100

		enemyIcon:animate("daddy dearest losing", false)

		self:load()
	end,

	load = function(self)
		oneK:load()

		if song == 7 then
			inst = love.audio.newSource("music/week1/lmao-voices.ogg", "stream")
			voices = love.audio.newSource("music/week1/lmao-silence.ogg", "stream")
		elseif song == 6 then
			inst = love.audio.newSource("music/week1/amogus-voices.ogg", "stream")
			voices = love.audio.newSource("music/week1/amogus-silence.ogg", "stream")
		elseif song == 5 then
			inst = love.audio.newSource("music/week1/beast-burger-voices.ogg", "stream")
			voices = love.audio.newSource("music/week1/beast-burger-silence.ogg", "stream")
		elseif song == 4 then
			inst = love.audio.newSource("music/week1/end-voices.ogg", "stream")
			voices = love.audio.newSource("music/week1/end-silence.ogg", "stream")
		elseif song == 3 then
			inst = love.audio.newSource("music/week1/scott-the-woz-voices.ogg", "stream")
			voices = love.audio.newSource("music/week1/scott-the-woz-silence.ogg", "stream")
		elseif song == 2 then
			inst = love.audio.newSource("music/week1/sonic-voices.ogg", "stream")
			voices = love.audio.newSource("music/week1/sonic-silence.ogg", "stream")
		else
			inst = love.audio.newSource("music/week1/woo-voices.ogg", "stream")
			voices = love.audio.newSource("music/week1/woo-silence.ogg", "stream")
		end
		video:rewind()
		video:play()

		self:initUI()

		oneK:setupCountdown()
	end,

	initUI = function(self)
		oneK:initUI()

		if song == 7 then
			oneK:generateNotes(love.filesystem.load("charts/week1/lmao.lua")())
		elseif song == 6 then
			oneK:generateNotes(love.filesystem.load("charts/week1/amogus.lua")())
		elseif song == 5 then
			oneK:generateNotes(love.filesystem.load("charts/week1/beast-burger.lua")())
		elseif song == 4 then
			oneK:generateNotes(love.filesystem.load("charts/week1/end.lua")())
		elseif song == 3 then
			oneK:generateNotes(love.filesystem.load("charts/week1/scott.lua")())
		elseif song == 2 then
			oneK:generateNotes(love.filesystem.load("charts/week1/sonic.lua")())
		else
			oneK:generateNotes(love.filesystem.load("charts/week1/woo.lua")())
		end
	end,

	update = function(self, dt)
		oneK:update(dt)

		if health >= 80 then
			if enemyIcon:getAnimName() == "daddy dearest losing" then
				enemyIcon:animate("daddy dearest losing", false)
			end
		else
			if enemyIcon:getAnimName() == "daddy dearest losing" then
				enemyIcon:animate("daddy dearest losing", false)
			end
		end

		if not video:isPlaying() then
			video:rewind()
			video:play()
		end

		if not (countingDown or graphics.isFading()) and not (inst:isPlaying() and voices:isPlaying()) then
			if storyMode and song < 7 then
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

		oneK:updateUI(dt)
	end,

	draw = function(self)
		love.graphics.push()
			love.graphics.translate(graphics.getWidth() / 2, graphics.getHeight() / 2)
			love.graphics.scale(cam.sizeX, cam.sizeY)

			love.graphics.push()
				love.graphics.translate(cam.x * 0, cam.y * 0)

			love.graphics.pop()
			love.graphics.push()
				love.graphics.translate(cam.x, cam.y)
				love.graphics.draw(video, -150, -175)

			love.graphics.pop()
			love.graphics.push()
				love.graphics.translate(cam.x * 0, cam.y * 0)

			love.graphics.pop()
			oneK:drawRating(0.9)
		love.graphics.pop()

		oneK:drawUI()
	end,

	leave = function(self)

		oneK:leave()
	end
}

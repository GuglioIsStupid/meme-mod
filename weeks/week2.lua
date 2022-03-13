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
		week7:enter()

		song = songNum
		difficulty = songAppend

		stageBack = graphics.newImage(love.graphics.newImage(graphics.imagePath("week7/tankSky")))
		stageFront = graphics.newImage(love.graphics.newImage(graphics.imagePath("week7/tankGround")))

		stageBack.sizeX, stageBack.sizeY = 1.3, 1.3
		stageFront.sizeX, stageFront.sizeY = 1.3, 1.3


		stageFront.y = 100
		girlfriend = love.filesystem.load("sprites/week7/gfTankmen.lua")()
		enemy = love.filesystem.load("sprites/week7/tankmanCaptain.lua")()
		skittles = love.filesystem.load("sprites/week7/tankWatchtower.lua")()
		smokeLeft = love.filesystem.load("sprites/week7/smokeLeft.lua")()
		smokeRight = love.filesystem.load("sprites/week7/smokeRight.lua")()
		fakeBoyfriend = love.filesystem.load("sprites/boyfriend.lua")() -- Used for game over
		tank0 = love.filesystem.load("sprites/week7/tank0.lua")()
		tank1 = love.filesystem.load("sprites/week7/tank1.lua")()
		tank2 = love.filesystem.load("sprites/week7/tank2.lua")()
		tank3 = love.filesystem.load("sprites/week7/tank3.lua")()
		tank4 = love.filesystem.load("sprites/week7/tank4.lua")()
		tank5 = love.filesystem.load("sprites/week7/tank5.lua")()
		picoSpeaker = love.filesystem.load("sprites/week7/picoSpeaker.lua")()

		picoSpeaker.x, picoSpeaker.y = 105, 160
		girlfriend.x, girlfriend.y = 15, 190
		enemy.x, enemy.y = -560, 370
		boyfriend.x, boyfriend.y = 460, 370
		fakeBoyfriend.x, fakeBoyfriend.y = 460, 370
		tank0.x, tank0.y = -1000, 550
		tank1.x, tank1.y = -675, 680
		tank2.x, tank2.y = -250, 550
		tank3.x, tank3.y = 250, 680
		tank4.x, tank4.y = 675, 550
		tank5.x, tank5.y = 1000, 550 
		smokeLeft.x, smokeLeft.y = -1000, 250
		smokeRight.x, smokeRight.y = 1000, 250
		skittles.x, skittles.y = -670, 250

		enemy.sizeX = -1

		enemyIcon:animate("skid and pump losing", false)
		skittles:animate("anim", true) --fuck you
		smokeLeft:animate("anim", true)
		smokeRight:animate("anim", true)
		tank0:animate("anim", true)
		tank1:animate("anim", true)
		tank2:animate("anim", true)
		tank3:animate("anim", true)
		tank4:animate("anim", true)
		tank5:animate("anim", true)

		self:load()
	end,

	load = function(self)
		week7:load()

		if song == 3 then
			--enemy = love.filesystem.load("sprites/week7/tankmanCaptainStress.lua")()
			--enemy.x, enemy.y = -580, 370
			--OK FINE
			--I'LL DO IT GUGLIO'S WAY
			
			boyfriend = love.filesystem.load("sprites/week7/bfAndGF.lua")()
			boyfriend.x, boyfriend.y = 380, 410
			fakeBoyfriend = love.filesystem.load("sprites/week7/gfdead.lua")()
			fakeBoyfriend.x, fakeBoyfriend.y = 380, 410

			inst = love.audio.newSource("music/week1/Stress_Inst.ogg", "stream")
			voices = love.audio.newSource("music/week1/Stress_Voices.ogg", "stream")
		elseif song == 2 then
			inst = love.audio.newSource("music/week1/Guns_Inst.ogg", "stream")
			voices = love.audio.newSource("music/week1/Guns_Voices.ogg", "stream")
		else
			inst = love.audio.newSource("music/week1/Ugh_Inst.ogg", "stream")
			voices = love.audio.newSource("music/week1/Ugh_Voices.ogg", "stream")
		end

		self:initUI()

		week7:setupCountdown()
	end,

	initUI = function(self)
		week7:initUI()

		if song == 3 then
			week7:generateNotes(love.filesystem.load("charts/week7/stress" .. difficulty .. ".lua")())
		elseif song == 2 then
			week7:generateNotes(love.filesystem.load("charts/week7/guns" .. difficulty .. ".lua")())
		else
			week7:generateNotes(love.filesystem.load("charts/week7/ugh" .. difficulty .. ".lua")())
		end
	end,

	update = function(self, dt)
		if song == 3 then
			if musicTime >= 62083 then
				if musicTime <= 62100 then
					enemy:animate("good", false)
				end
			end
		end

		week7:update(dt)
		skittles:update(dt) --fuck you
		smokeLeft:update(dt)
		smokeRight:update(dt)
		tank0:update(dt)
		tank1:update(dt)
		tank2:update(dt)
		tank3:update(dt)
		tank4:update(dt)
		tank5:update(dt)

		if song == 4 and musicThres ~= oldMusicThres and math.fmod(absMusicTime + 500, 480000 / bpm) < 100 then
			week7:safeAnimate(boyfriend, "hey", false, 3)
		end 
		--[[
			Fuck you clothing hanger

			- Guglio
		]]

		if health >= 80 then
			if enemyIcon:getAnimName() == "skid and pump losing" then
				enemyIcon:animate("pico", false)
			end
		else
			if enemyIcon:getAnimName() == "pico" then
				enemyIcon:animate("skid and pump losing", false)
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

		week7:updateUI(dt)
	end,

	draw = function(self)
		love.graphics.push()
			love.graphics.translate(graphics.getWidth() / 2, graphics.getHeight() / 2)
			love.graphics.scale(cam.sizeX, cam.sizeY)

			love.graphics.push()
				love.graphics.translate(cam.x * 0.9, cam.y * 0.9)

				stageBack:draw()
				skittles:draw()
				smokeLeft:draw()
				smokeRight:draw()
				stageFront:draw()
				if song ~= 3 then
					girlfriend:draw()
				else
					picoSpeaker:draw()
				end
			love.graphics.pop()
			love.graphics.push()
				love.graphics.translate(cam.x, cam.y)

				enemy:draw()
				boyfriend:draw()
				tank0:draw()
				tank1:draw()
				tank2:draw()
				tank3:draw()
				tank4:draw()
				tank5:draw()
			love.graphics.pop()
			love.graphics.push()
				love.graphics.translate(cam.x * 1.1, cam.y * 1.1)

			love.graphics.pop()
			week7:drawRating(0.9)
		love.graphics.pop()

		week7:drawUI()
	end,

	leave = function(self)
		stageBack = nil
		stageFront = nil
		tank0 = nil
		tank1 = nil
		tank2 = nil
		tank3 = nil
		tank4 = nil
		tank5 = nil
		smokeLeft = nil
		smokeRight = nil
		skittles = nil
		picoSpeaker = nil

		week7:leave()
	end
}

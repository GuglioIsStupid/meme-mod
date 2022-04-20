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

local sunset

local bgLimo, limoDancer, limo

return {
	enter = function(self, from, songNum, songAppend)
		bpm = 100

		enemyFrameTimer = 0
		boyfriendFrameTimer = 0

		sounds = {
			countdown = {
				three = love.audio.newSource("sounds/countdown-3.ogg", "static"),
				two = love.audio.newSource("sounds/countdown-2.ogg", "static"),
				one = love.audio.newSource("sounds/countdown-1.ogg", "static"),
				go = love.audio.newSource("sounds/countdown-go.ogg", "static")
			},
			miss = {
				love.audio.newSource("sounds/miss1.ogg", "static"),
				love.audio.newSource("sounds/miss2.ogg", "static"),
				love.audio.newSource("sounds/miss3.ogg", "static")
			},
			death = love.audio.newSource("sounds/death.ogg", "static")
		}

		images = {
			icons = love.graphics.newImage(graphics.imagePath("icons")),
			notes = love.graphics.newImage(graphics.imagePath("notes")),
			numbers = love.graphics.newImage(graphics.imagePath("numbers"))
		}

		sprites = {
			icons = love.filesystem.load("sprites/icons.lua"),
			numbers = love.filesystem.load("sprites/numbers.lua")
		}

		song = songNum
		difficulty = songAppend

		sunset = graphics.newImage(love.graphics.newImage(graphics.imagePath("original/week4/sunset")))
		jKey = graphics.newImage(love.graphics.newImage(graphics.imagePath("week4/jKey")))

		bgLimo = love.filesystem.load("sprites/week4/bg-limo.lua")()
		limoDancer = love.filesystem.load("sprites/week4/limo-dancer.lua")()
		girlfriend = love.filesystem.load("sprites/week4/girlfriend.lua")()
		limo = love.filesystem.load("sprites/week4/limo.lua")()
		enemy = love.filesystem.load("sprites/week4/mommy-mearest.lua")()
		enemyTwo = love.filesystem.load("sprites/week4/mommy-mearest.lua")()
		boyfriend = love.filesystem.load("sprites/week4/boyfriend.lua")()
		boyfriendTwo = love.filesystem.load("sprites/week4/boyfriend.lua")()
		rating = love.filesystem.load("sprites/rating.lua")()
		fakeBoyfriend = love.filesystem.load("sprites/boyfriend.lua")() -- Used for game over

		fakeBoyfriend.x, fakeBoyfriend.y = 350, -100
		bgLimo.y = 250
		jKey.y = 240
		jKey.x = 220
		jKey.sizeX, jKey.sizeY = 0.5, 0.5
		bgLimo.x = 0
		limoDancer.y = -130
		girlfriend.x, girlfriend.y = 30, -50
		limo.y = 375
		limo.x = 0
		enemy.x, enemy.y = -380, -10
		enemyTwo.x, enemyTwo.y = -380, -10
		boyfriend.x, boyfriend.y = 340, -100
		boyfriendTwo.x, boyfriendTwo.y = 340, -100

		rating = love.filesystem.load("sprites/rating.lua")()

		rating.sizeX, rating.sizeY = 0.75, 0.75
		numbers = {}
		for i = 1, 3 do
			numbers[i] = sprites.numbers()

			numbers[i].sizeX, numbers[i].sizeY = 0.5, 0.5
		end

		enemyIcon = sprites.icons()
		boyfriendIcon = sprites.icons()

		if settings.downscroll then
			enemyIcon.y = -400
			boyfriendIcon.y = -400
		else
			enemyIcon.y = 350
			boyfriendIcon.y = 350
		end
		enemyIcon.sizeX, enemyIcon.sizeY = 1.5, 1.5
		boyfriendIcon.sizeX, boyfriendIcon.sizeY = -1.5, 1.5

		countdownFade = {}
		countdown = love.filesystem.load("sprites/countdown.lua")()

		enemyIcon:animate("daddy dearest losing", false)

		self:load()
	end,

	load = function(self)
		weeksFour:load()

		if song == 3 then
			inst = love.audio.newSource("music/week4/milf-inst.ogg", "stream")
			voices = love.audio.newSource("music/week4/milf-voices.ogg", "stream")
		elseif song == 2 then
			inst = love.audio.newSource("music/week4/high-inst.ogg", "stream")
			voices = love.audio.newSource("music/week4/high-voices.ogg", "stream")
		else
			inst = love.audio.newSource("music/week4/satin-panties-inst.ogg", "stream")
			voices = love.audio.newSource("music/week4/satin-panties-voices.ogg", "stream")
		end

		self:initUI()

		weeksFour:setupCountdown()
	end,

	initUI = function(self)
		weeksFour:initUI()

		if song == 3 then
			weeksFour:generateNotes(love.filesystem.load("charts/week4/milf" .. difficulty .. ".lua")())
		elseif song == 2 then
			weeksFour:generateNotes(love.filesystem.load("charts/week4/high" .. difficulty .. ".lua")())
		else
			weeksFour:generateNotes(love.filesystem.load("charts/week4/satin-panties" .. difficulty .. ".lua")())
		end
	end,

	update = function(self, dt)



		if musicTime > 60000 and limo.x == 0 then
			Timer.tween(4, limo, {x = 10000, y = bgLimo.y}, "in-quad")
			Timer.tween(4, boyfriendTwo, {x = 10000, y = boyfriendTwo.y}, "in-quad")
			Timer.tween(4, enemyTwo, {x = 10000, y = enemyTwo.y}, "in-quad")
			Timer.tween(4, girlfriend, {x = 10000, y = girlfriend.y}, "in-quad")
		end
		weeksFour:update(dt)


		if input:pressed("j") then
			Gamestate.switch(oneK_Week)
		end
		-- Hardcoded M.I.L.F camera scaling
		if song == 3 and musicTime > 56000 and musicTime < 67000 and musicThres ~= oldMusicThres and math.fmod(absMusicTime, 60000 / bpm) < 100 then
			if camScaleTimer then Timer.cancel(camScaleTimer) end

			camScaleTimer = Timer.tween((60 / bpm) / 16, cam, {sizeX = camScale.x * 1.05, sizeY = camScale.y * 1.05}, "out-quad", function() camScaleTimer = Timer.tween((60 / bpm), cam, {sizeX = camScale.x, sizeY = camScale.y}, "out-quad") end)
		end

		bgLimo:update(dt)
		limoDancer:update(dt)
		limo:update(dt)

		if musicThres ~= oldMusicThres and math.fmod(absMusicTime, 120000 / bpm) < 100 then
			limoDancer:animate("anim", false)

			limoDancer:setAnimSpeed(14.4 / (60 / bpm))
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

		weeksFour:updateUI(dt)
	end,

	draw = function(self)
		love.graphics.push()
			love.graphics.translate(graphics.getWidth() / 2, graphics.getHeight() / 2)
			love.graphics.scale(cam.sizeX, cam.sizeY)

			love.graphics.push()
				love.graphics.translate(cam.x * 0.5, cam.y * 0.5)

				sunset:draw()

				bgLimo:draw()
				for i = -475, 725, 400 do
					limoDancer.x = i

					limoDancer:draw()
				end
			love.graphics.pop()
			love.graphics.push()
				love.graphics.translate(cam.x, cam.y)

				jKey:draw()
				girlfriend:draw()
				limo:draw()
				enemyTwo:draw()
				boyfriendTwo:draw()
			--	enemy:draw()
				--boyfriend:draw()
			love.graphics.pop()
			weeksFour:drawRating(1)
		love.graphics.pop()

		weeksFour:drawUI()
	end,

	leave = function()
		sunset = nil

		bgLimo = nil
		limoDancer = nil
		limo = nil

		weeksFour:leave()
	end
}

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

local canvas, font

local song, difficulty

local sky, school, street, treesBack

local petals, trees, freaks

return {
	enter = function(self, from, songNum, songAppend)
		love.graphics.setDefaultFilter("nearest")

		status.setNoResize(true)

		canvas = love.graphics.newCanvas(16, 9)
		font = love.graphics.newFont("fonts/pixel_small.fnt")

		weekSmall:enter()

		song = songNum
		difficulty = songAppend

		cam.sizeX, cam.sizeY = 1, 1
		camScale.x, camScale.y = 1, 1

		if song ~= 3 then
			sky = graphics.newImage(love.graphics.newImage(graphics.imagePath("original/week6/sky")))
			school = graphics.newImage(love.graphics.newImage(graphics.imagePath("original/week6/school")))
			street = graphics.newImage(love.graphics.newImage(graphics.imagePath("original/week6/street")))
			treesBack = graphics.newImage(love.graphics.newImage(graphics.imagePath("original/week6/trees-back")))

			trees = love.filesystem.load("sprites/original/week6/trees.lua")()
			petals = love.filesystem.load("sprites/original/week6/petals.lua")()
			freaks = love.filesystem.load("sprites/original/week6/freaks.lua")()

			sky.y = 1
			school.y = 1
		end

		boyfriend.x, boyfriend.y = 12, 6
		fakeBoyfriend.x, fakeBoyfriend.y = -12, 4

		enemyIcon:animate("senpai", false)

		self:load()
	end,

	load = function(self)
		if song == 3 then
			school = love.filesystem.load("sprites/original/week6/evil-school.lua")()
			enemy = love.filesystem.load("sprites/original/week6/spirit.lua")()

			enemyIcon:animate("spirit", false)
		elseif song == 2 then
			enemy = love.filesystem.load("sprites/original/week6/senpai-angry.lua")()

			freaks:animate("dissuaded", true)
		else
			enemy = love.filesystem.load("sprites/original/week6/senpai.lua")()
		end

		weekSmall:load()

		if song == 3 then
			inst = love.audio.newSource("music/original/week6/thorns-inst.ogg", "stream")
			voices = love.audio.newSource("music/original/week6/thorns-voices.ogg", "stream")
		elseif song == 2 then
			inst = love.audio.newSource("music/original/week6/roses-inst.ogg", "stream")
			voices = love.audio.newSource("music/original/week6/roses-voices.ogg", "stream")
		else
			inst = love.audio.newSource("music/original/week6/senpai-inst.ogg", "stream")
			voices = love.audio.newSource("music/original/week6/senpai-voices.ogg", "stream")
		end
		enemy.x, enemy.y = -50, 0

		self:initUI()

		weekSmall:setupCountdown()
	end,

	initUI = function(self)
		weekSmall:initUI()

		if song == 3 then
			weekSmall:generateNotes(love.filesystem.load("charts/small/thorns" .. difficulty .. ".lua")())
		elseif song == 2 then
			weekSmall:generateNotes(love.filesystem.load("charts/small/roses" .. difficulty .. ".lua")())
		else
			weekSmall:generateNotes(love.filesystem.load("charts/small/senpai" .. difficulty .. ".lua")())
		end
	end,

	update = function(self, dt)
		graphics.screenBase(16, 9)

		weekSmall:update(dt)

		if song == 3 then
			school:update(dt)
		else
			trees:update(dt)
			petals:update(dt)
			freaks:update(dt)
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

		weekSmall:updateUI(dt, canvas)
	end,

	draw = function(self)
		local canvasScale

		love.graphics.setFont(font)
		graphics.screenBase(16, 9)
		love.graphics.setCanvas(canvas)
			love.graphics.clear()

			love.graphics.push()
				love.graphics.translate(128, 72)
				love.graphics.scale(cam.sizeX, cam.sizeY)

				love.graphics.push()
					love.graphics.translate(math.floor(cam.x * 0.9), math.floor(cam.y * 0.9))

				love.graphics.pop()
				love.graphics.push()
					love.graphics.translate(math.floor(cam.x), math.floor(cam.y))

                    trees:draw()

                   
				love.graphics.pop()
				weekSmall:drawRating()
			love.graphics.pop()
            boyfriend:draw()

			weekSmall:drawUI()
		love.graphics.setCanvas()
		graphics.screenBase(love.graphics.getWidth(), love.graphics.getHeight())

		canvasScale = math.min(math.floor(graphics.getWidth() / 16), math.floor(graphics.getHeight() / 9))
		if canvasScale < 1 then canvasScale = math.min(graphics.getWidth() / 16, graphics.getHeight() / 9) end

		love.graphics.draw(canvas, graphics.getWidth() / 2, graphics.getHeight() / 2, nil, canvasScale, canvasScale, 8, 4.5)
	end,

	leave = function(self)
		canvas = nil
		font = nil

		sky = nil
		school = nil
		street = nil

		weekSmall:leave()

		status.setNoResize(false)

		love.graphics.setDefaultFilter("linear")
	end
}
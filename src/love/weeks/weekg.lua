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

local stageBack, stageFront

return {
	enter = function(self, from, songNum, songAppend)
		weeksGar:enter()

        tightBars = false

		song = songNum
		difficulty = songAppend

		stageBack = graphics.newImage(love.graphics.newImage(graphics.imagePath("garcello/alley-back")))
		stageFront = graphics.newImage(love.graphics.newImage(graphics.imagePath("garcello/alley")))
        garSleeping = graphics.newImage(love.graphics.newImage(graphics.imagePath("garcello/garcello-sleeping")))
		bfSleeping = graphics.newImage(love.graphics.newImage(graphics.imagePath("garcello/bf-sleeping")))

        garSleeping.x = -360 -- yeah they are just sleeping (do not look at the game over screen)
		garSleeping.y = 200
		bfSleeping.x, bfSleeping.y = 400, 200
		
		fakeBoyfriend = love.filesystem.load("sprites/garcello/dead.lua")() 

		girlfriend.x, girlfriend.y = 50, -90

		self:load()
	end,

	load = function(self)
		weeksGar:load()

        fading = 1

        if song == 6 then
            scene = love.filesystem.load("sprites/garcello/scene.lua")() -- IM SORRY I KNOW YOU PUT A LOT OF EFFORT INTO MAKING THIS WORK IM SORRY FOR JUST REMOVING IT	
			scene.x, scene.y = 320, 180                                  -- :/
            --                                                              It's actually not that hard
			scene:animate("scene", false)

            sceneIsPlaying = true

			garCough = love.audio.newSource("sounds/garcello/garcello-dies.ogg", "stream")
        elseif song == 4 then
            inst = love.audio.newSource("music/garcello/fading-inst.ogg", "stream")
			voices = love.audio.newSource("music/garcello/fading-voices.ogg", "stream")

            stageBack = graphics.newImage(love.graphics.newImage(graphics.imagePath("garcello/alley-back-rise")))
		    stageFront = graphics.newImage(love.graphics.newImage(graphics.imagePath("garcello/alley-rise")))

		elseif song == 3 then
			inst = love.audio.newSource("music/garcello/release-inst.ogg", "stream")
			voices = love.audio.newSource("music/garcello/release-voices.ogg", "stream")

            frontSmoke = love.filesystem.load("sprites/garcello/smoke.lua")()
			backSmoke = love.filesystem.load("sprites/garcello/smoke.lua")()

			frontSmoke.x, frontSmoke.y = -50, -175
			backSmoke.x, backSmoke.y = -100, -200
            sceneIsPlaying = false

            stageBack = graphics.newImage(love.graphics.newImage(graphics.imagePath("garcello/alley-back-alt")))
		    stageFront = graphics.newImage(love.graphics.newImage(graphics.imagePath("garcello/alley-alt")))

		elseif song == 2 then
			inst = love.audio.newSource("music/garcello/nerves-inst.ogg", "stream")
			voices = love.audio.newSource("music/garcello/nerves-voices.ogg", "stream")

		else
			inst = love.audio.newSource("music/garcello/headache-inst.ogg", "stream")
			voices = love.audio.newSource("music/garcello/headache-voices.ogg", "stream")

		end

		self:initUI()

		weeksGar:setupCountdown()
	end,

	initUI = function(self)
		weeksGar:initUI()
        if song == 4 then
            weeksGar:generateNotes(love.filesystem.load("charts/garcello/fading.lua")())
        elseif song == 3 then
			weeksGar:generateNotes(love.filesystem.load("charts/garcello/release.lua")())
		elseif song == 2 then
			weeksGar:generateNotes(love.filesystem.load("charts/garcello/nerves.lua")())
		else
			weeksGar:generateNotes(love.filesystem.load("charts/garcello/headache.lua")())
		end
	end,

	update = function(self, dt)
		weeksGar:update(dt)

		--cam.x, cam.y = girlfriend.x, girlfriend.y

        if song == 3 then
            backSmoke:update(dt)
			frontSmoke:update(dt)
            
            if musicTime >= 104707 and tightBars ~= true then
				tightBars = true
			end
        elseif song == 5 then
			penis = 1000 -- ???????
		end

		if not (countingDown or graphics.isFading()) and not (inst:isPlaying() and voices:isPlaying()) then
			if storyMode and song < 4 then
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

		if song ~= 5 then weeksGar:updateUI(dt) end
	end,

	draw = function(self)
        if song == 6 then
            love.graphics.push()
                graphics.setColor(fading, fading, fading, 1)
                love.graphics.scale(2, 2)
                scene:draw()
                graphics.setColor(1, 1, 1, 1)
            love.graphics.pop()
        else
            love.graphics.push()
                love.graphics.translate(graphics.getWidth() / 2, graphics.getHeight() / 2)
                love.graphics.scale(cam.sizeX, cam.sizeY)

                love.graphics.push()
                    love.graphics.translate(cam.x * 0.9, cam.y * 0.9)

                    stageBack:draw()
                    if song == 3 then
                        graphics.setColor(1, 1, 1, 0.5)
                        love.graphics.push()

                            love.graphics.scale(1.3, 1.3)
                            backSmoke:draw()
                            
                        love.graphics.pop()
                        graphics.setColor(1,1,1,1)
                    end

                    stageFront:draw()


                    girlfriend:draw()
					garSleeping:draw()
					bfSleeping:draw()
                love.graphics.pop()
                love.graphics.push()
                    love.graphics.translate(cam.x, cam.y)

                    if song == 4 and musicTime >= 36000 then
						graphics.setColor(1, 1, 1, fading)
						if fading > 0 then fading = fading - 0.0045 end
					end

                love.graphics.pop()
                love.graphics.push()
                    love.graphics.translate(cam.x * 1.1, cam.y * 1.1)

                love.graphics.pop()
                if song == 3 then
					love.graphics.push()
						love.graphics.translate(cam.x, cam.y)
						love.graphics.scale(1.7, 1.6)
						graphics.setColor(1, 1, 1, 0.7)
						frontSmoke:draw()
					love.graphics.pop()
				end
                weeksGar:drawRating(0.9)
            love.graphics.pop()

            weeksGar:drawUI()
        end
	end,

	leave = function(self)
		stageBack = nil
		stageFront = nil

		weeksGar:leave()
	end
}

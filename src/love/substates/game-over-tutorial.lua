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

local fromState

return {
	enter = function(self, from)
		local boyfriend = fakeBoyfriend or boyfriend
		
		video = love.graphics.newVideo("videos/noMoreFnf.ogv")

		fromState = from

		if inst then inst:stop() end
		voices:stop()

		audio.playSound(sounds["death"])
		video:play()

		boyfriend:animate("dies", false)

		Timer.clear()

		Timer.tween(
			2,
			cam,
			{x = -boyfriend.x, y = -boyfriend.y, sizeX = camScale.x, sizeY = camScale.y},
			"out-quad",
			function()
				boyfriend:animate("dead", true)
			end
		)
	end,

	update = function(self, dt)

		local boyfriend = fakeBoyfriend or boyfriend

		if not graphics.isFading() then
			if video:isPlaying() then
				bruh = 1
			else
				Gamestate.switch(quaverWeek)
			end
		end

		boyfriend:update(dt)
	end,

	draw = function(self)
		local boyfriend = fakeBoyfriend or boyfriend

		love.graphics.push()
			love.graphics.translate(graphics.getWidth() / 2, graphics.getHeight() / 2)

			love.graphics.push()
				love.graphics.scale(cam.sizeX, cam.sizeY)
				love.graphics.translate(cam.x, cam.y)

				love.graphics.draw(video, 25, -250)
			love.graphics.pop()
		love.graphics.pop()
	end
}

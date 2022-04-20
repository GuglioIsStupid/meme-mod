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

local qdeath = love.audio.newSource("sounds/qdeath.ogg", "static")

return {
	enter = function(self, from)
		local boyfriend = fakeBoyfriend or boyfriend

		fromState = from

		fading = 0

		if inst then inst:stop() end
		voices:stop()

		qdeath:play()


		Timer.clear()

		Timer.tween(
			2,
			cam,
			{x = -boyfriend.x, y = -boyfriend.y, sizeX = camScale.x, sizeY = camScale.y},
			"out-quad"
		)
	end,

	update = function(self, dt)

		if not graphics.isFading() then
			if input:pressed("confirm") then
				if inst then inst:stop() end -- In case inst is nil and "confirm" is pressed before game over music starts

				inst = love.audio.newSource("music/game-over-end.ogg", "stream")
				inst:play()

				Timer.clear()



				graphics.fadeOut(
					3,
					function()
						Gamestate.pop()

						fromState:load()
					end
				)
			elseif input:pressed("gameBack") then
				status.setLoading(true)

				graphics.fadeOut(
					0.5,
					function()
						Gamestate.pop()

						Gamestate.switch(menu)

						status.setLoading(false)
					end
				)
			end
		end

		boyfriend:update(dt)
	end,

	draw = function(self)

		love.graphics.push()
			love.graphics.translate(graphics.getWidth() / 2, graphics.getHeight() / 2)

			love.graphics.push()
				love.graphics.scale(cam.sizeX, cam.sizeY)
				love.graphics.translate(cam.x, cam.y)


				graphics.setColor(1, 0, 0, fading)
				if fading < 1 then fading = fading + 0.9 * delta end
				love.graphics.rectangle("fill", -10000, -10000, 100000, 100000)
			love.graphics.pop()
		love.graphics.pop()
	end
}

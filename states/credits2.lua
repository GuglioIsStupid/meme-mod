local backFunc

local selectSound = love.audio.newSource("sounds/menu/select.ogg", "static")


local credits = graphics.newImage(love.graphics.newImage(graphics.imagePath("menu/credits/pogger_credits")))

return {
	enter = function(self, previous)
		menu:setMusicVolume()
		songNum = 0

		graphics.setFade(0)
		graphics.fadeIn(0.5)

	end,

	update = function(self, dt)

		if not graphics.isFading() then
			if input:pressed("back") then
				audio.playSound(selectSound)

				Gamestate.switch(menu)				
			end
		end
	end,
	draw = function(self)
		love.graphics.push()
			love.graphics.translate(graphics.getWidth() / 2, graphics.getHeight() / 2)

			credits:draw()

			love.graphics.push()
				love.graphics.scale(cam.sizeX, cam.sizeY)
			love.graphics.pop()
		love.graphics.pop()
	end
}

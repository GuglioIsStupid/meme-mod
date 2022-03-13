local backFunc

local selectSound = love.audio.newSource("sounds/menu/select.ogg", "static")


return {
	enter = function(self, previous)
		character = graphics.newImage(love.graphics.newImage(graphics.imagePath("fnaf/endo")))
		character.sizeX, character.sizeY = 0.6, 0.6
		bg = graphics.newImage(love.graphics.newImage(graphics.imagePath("fnaf/bg")))
		menu:setMusicVolume()
		songNum = 0

		graphics.setFade(0)
		graphics.fadeIn(0.5)

	end,

	update = function(self, dt)

		if not graphics.isFading() then
			if input:pressed("back") then
				audio.playSound(selectSound)

				love.event.quit()			
			end
		end
		
		if not graphics.isFading() then
			if input:pressed("confirm") then
				audio.playSound(selectSound)

				Gamestate.switch(windup)				
			end
		end

	end,
	draw = function(self)
		love.graphics.push()
			love.graphics.translate(graphics.getWidth() / 2, graphics.getHeight() / 2)

			bg:draw()
			character:draw()
			love.graphics.push()
				love.graphics.scale(cam.sizeX, cam.sizeY)
			love.graphics.pop()
		love.graphics.pop()
	end,
	leave = function(self)
		bg = nil
		character = nil


	end
}

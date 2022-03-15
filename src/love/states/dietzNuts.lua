local backFunc

local selectSound = love.audio.newSource("sounds/menu/select.ogg", "static")

return {
	enter = function(self, previous)
        menu:stopMusic()
		songNum = 0


        video = love.graphics.newVideo("videos/dietznuts.ogv")
        video:play()

		graphics.setFade(0)
		graphics.fadeIn(0.5)

	end,

	update = function(self, dt)

		if not graphics.isFading() then
			if input:pressed("back") then
				video:pause()
                menu:playMusic()
				audio.playSound(selectSound)

				Gamestate.switch(menu)	
			end
		end
		if not video:isPlaying() then
			Gamestate.switch(menu)	
		end
	end,
	draw = function(self)
		love.graphics.push()
			love.graphics.translate(graphics.getWidth() / 2, graphics.getHeight() / 2)

			love.graphics.draw(video, -690, -375)

			love.graphics.push()
				love.graphics.scale(cam.sizeX, cam.sizeY)
			love.graphics.pop()
		love.graphics.pop()
	end
}

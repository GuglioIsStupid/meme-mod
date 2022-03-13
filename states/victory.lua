local backFunc

local selectSound = love.audio.newSource("sounds/menu/select.ogg", "static")
boyfriend = love.filesystem.load("sprites/boyfriend.lua")()
boyfriend:animate("idle", true)

return {
	enter = function(self, previous)


		boyfriend.x, boyfriend.y = 0, 100
		boyfriend.sizeX, boyfriend.sizeY = 0.7

        menu:stopMusic()
		songNum = 0


        video = love.graphics.newVideo("videos/victory.ogv")
        video:play()

		graphics.setFade(0)
		graphics.fadeIn(0.5)

	end,

	safeAnimate = function(self, sprite, animName, loopAnim, timerID)
		sprite:animate(animName, loopAnim)

		spriteTimers[timerID] = 12
	end,

	update = function(self, dt)
		boyfriend:update(dt)

		if spriteTimers[3] == 0 then
			self:safeAnimate(boyfriend, "idle", false, 3)
		end

		if not video:isPlaying() then
			Gamestate.switch(victoryWeek)	
		end
	end,
	draw = function(self)
		love.graphics.push()
			love.graphics.translate(graphics.getWidth() / 2, graphics.getHeight() / 2)

			love.graphics.draw(video, -690, -375)
			boyfriend:draw()

			love.graphics.push()
				love.graphics.scale(cam.sizeX, cam.sizeY)
			love.graphics.pop()
		love.graphics.pop()
	end
}

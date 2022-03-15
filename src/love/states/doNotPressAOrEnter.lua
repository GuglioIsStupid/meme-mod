local fakeCrashImage

local function switchMenu(menu)
    if love.system.getOS() == "Windows" then
		love.mouse.setVisible(false)
        love.window.setFullscreen(true)
    end
end

local fakeCrashImage = graphics.newImage(love.graphics.newImage(graphics.imagePath("menu/" .. systemOS)))
if love.system.getOS() ~= "Windows" then
    fakeCrashImage.sizeY = 1.06
    fakeCrashImage.sizeX = 1.01
else
    fakeCrashImage.sizeX = 0.7
    fakeCrashImage.sizeY = 0.8
end

return {
	enter = function(self, previous)
		songNum = 0
		cam.sizeX, cam.sizeY = 0.9, 0.9
		camScale.x, camScale.y = 0.9, 0.9
		switchMenu(1)
		graphics.setFade(1)
		graphics.fadeIn(0.5) 
        
	end,

	update = function(self, dt)
		if input:pressed("confirm") then
            if love.system.getOS() == "Windows" then
                love.window.setFullscreen(false)
				love.mouse.setVisible(true)
                lovesize.set(1280, 720)
            end
            Gamestate.switch(secretMenu)
        end
		
	end,

	draw = function(self)
		love.graphics.push()
			love.graphics.translate(graphics.getWidth() / 2, graphics.getHeight() / 2)
                fakeCrashImage:draw()

			love.graphics.push()
				love.graphics.scale(cam.sizeX, cam.sizeY)

			love.graphics.pop()
		love.graphics.pop()
	end,

	leave = function(self)

		Timer.clear()
	end
}
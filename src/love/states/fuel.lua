local backFunc
local selectSound = love.audio.newSource("sounds/menu/select.ogg", "static")
local task = love.audio.newSource("sounds/amogus/task.ogg", "static")
local fuel = graphics.newImage(love.graphics.newImage(graphics.imagePath("among/fuel")))
local amongFuel = graphics.newImage(love.graphics.newImage(graphics.imagePath("among/amongFuelTwo")))
local layer = graphics.newImage(love.graphics.newImage(graphics.imagePath("among/layer")))
local yellow = graphics.newImage(love.graphics.newImage(graphics.imagePath("among/yellow")))
local completed = graphics.newImage(love.graphics.newImage(graphics.imagePath("among/taskCompleted")))
return {
	enter = function(self, previous)
		taskFinished = false
		amongFuel.sizeX, amongFuel.sizeY = 0.65, 0.65
		layer.sizeX, layer.sizeY = 0.701111, 0.701111  -- literally bruh without those ones it is 1 pixel off and it bothered me i had to fix it
		yellow.y = 500
		yellow.x = -50
		yellow.sizeX = 3.755
		layer.y = 270
		layer.x = 5
		fuel.x = 50
		songNum = 0
		completed.y = 380
		completed.sizeX, completed.sizeY = 0.355, 0.355
		mouseX, mouseY = love.mouse.getX(), love.mouse.getY()  -- gugio dumb
		graphics.setFade(0)
		graphics.fadeIn(0.5)
	end,
	update = function(self, dt)
		mouseX, mouseY = love.mouse.getX(), love.mouse.getY()
		if not graphics.isFading() then
			if (input:pressed("gameClick")) and (mouseX >= 860 and mouseX <= 1085) and (mouseY >= 520 and mouseY <= 940) or input:press("confirm") or input:pressed("oneK") then
				Timer.tween(3.4, yellow, {x = yellow.x, y = -65}, "linear")
			end
		end
		if not graphics.isFading() then
			if input:pressed("back") then
				Gamestate.switch(menu)
			end
		end
		if yellow.y < -60 then
			if completed.y == 380 then
				Timer.tween(0.8, completed, {x = completed.x, y = -380}, "out-in-quint")
			end	
			if not taskFinished then
				task:play()
				taskFinished = true
			end
		end
	end,
	draw = function(self)
		love.graphics.push()
			love.graphics.translate(graphics.getWidth() / 2, graphics.getHeight() / 2)
			amongFuel:draw()
			love.graphics.setColor(0, 0, 0)
			love.graphics.rectangle("fill", -240, -300, 350, 600)
			love.graphics.setColor(1, 1, 1)
			yellow:draw()
			fuel:draw()
			layer:draw()
			love.graphics.setColor(0, 0, 0)
			love.graphics.rectangle("fill", -400, 348, 1000, 100)
			love.graphics.setColor(1, 1, 1)
			completed:draw()
			love.graphics.push()
				love.graphics.scale(cam.sizeX, cam.sizeY)
			love.graphics.pop()
		love.graphics.pop()
	end
}

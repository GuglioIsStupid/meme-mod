--[[----------------------------------------------------------------------------
Friday Night Funkin' Rewritten v1.1.0 beta 2

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

function love.load()
	local curOS = love.system.getOS()
	if love.system.getOS() ~= "Windows" then -- I forgor why this was here but then I rember
		systemOS = "nonWindows" -- Loads fake love crash
	else
		systemOS = "windows" -- Loads fake windows crash
	end



	--super secret setting dont tell anyone 
	disablePHIntro = false

	--load sounds
	selectSound = love.audio.newSource("sounds/menu/select.ogg", "static")

	-- Load libraries
	baton = require "lib.baton"
	ini = require "lib.ini"
	lovesize = require "lib.lovesize"
	Gamestate = require "lib.gamestate"
	Timer = require "lib.timer"

	-- Load modules
	status = require "modules.status"
	audio = require "modules.audio"
	graphics = require "modules.graphics"

	-- Load settings
	settings = require "settings"
	input = require "input"

	-- Load states
	clickStart = require "states.click-start"
	debugMenu = require "states.debug-menu"
	menu = require "states.menu"
	menuCredits = require "states.menuCredits"
	secretMenu = require "states.SecretMenuPlaceholder"
	secretMenuCrash = require "states.doNotPressAOrEnter"
	dietzNuts = require "states.dietzNuts"
	--credits2 = require "states.credits2" no longer needed because i became un stupid :)
	--crash = require "states.No_More_Friday_Night_Funkin" -- THIS STILL NEEDS TO BE CHANGED TO LOAD QUAVER WEEK BUT I HAVE NO IDEA HOW TOO (WHAT EVEN IS THIS)
	gMenu = require "states.garcelloMenu/menu"
	gWeekMenu = require "states.garcelloMenu/menuWeek"
	gMainMenu = require "states.garcelloMenu/menuSelect"
	gFreeplay = require "states.garcelloMenu/menuFreeplay"
	amogus = require "states.amogus"
	amogusDead = require "states.amogusDead"
	victoryVideo = require "states.victory"
	fuel = require "states.fuel"
	
	--load easter egg weeks (THESE ARE SECRET GET THE FUCK OUT OF HERE)
	quaverWeek = require "weeks.quaver"
	victoryWeek = require "weeks.victory"
	oneK_Week = require "weeks.1k"
	cribWeek = require "weeks.week3"
	garcelloWeek = require "weeks.weekg"
	fuckedUpInTheCrib = require "weeks.week3"
	tinyResolutionWeek = require "weeks.myDickIfItWasAScreenResolution"

	--load week states (because theres a lot lmfao)
	weeks = require "states.weeks/week"
	weeksPixel = require "states.weeks/weeks-pixel"
	oneK = require "states.weeks/oneK"
	week7 = require "states.weeks/weeks7"
	SP = require "states.weeks/weeksSP"
	WU = require "states.weeks/weeksWU"
	crib = require "states.weeks/crib"
	victory = require "states.weeks/victory"
	tutorial = require "states.weeks/tutorial"
	quaver = require "states.weeks/quaver"
	weeksGar = require "states.weeks/weekG"
	weeks2 = require "states.weeks/week2"
	weeks1 = require "states.weeks/week1"
	weekSmall = require "states.weeks/myDickSizeIfItWasAScreenResolution" -- (this is referring to Guglio's dick size, not CH's)
	weeksFour = require "states.weeks/weeksFour"

	fileExists = love.filesystem.getInfo("SUS/OH MY GOD ITS THE IMPOSTER FROM AMONG US.png")
	if not fileExists then
		--load the fucking fnaf security breach secret gallery easter egg thing
		gallery = require "states.fnaf/gallery" --:skull: the way this works is so bad but im not fixing it
		freddy = require "states.fnaf/freddy"
		chica = require "states.fnaf/chica"
		roxy = require "states.fnaf/roxy"
		monty = require "states.fnaf/monty"
		staff = require "states.fnaf/staff"
		dj = require "states.fnaf/dj"
		windup = require "states.fnaf/windup"
		sun = require "states.fnaf/sun"
		moon = require "states.fnaf/moon"
		spring = require "states.fnaf/spring"
		floor = require "states.fnaf/floor"
		skeleton = require "states.fnaf/endo" 
	end


	-- Load substates
	gameOver = require "substates.game-over"
	gameOverPixel = require "substates.game-over-pixel"
	gameOverTankman = require "substates.game-over-tankman"
	gameOverTutorial = require "substates.game-over-tutorial"
	gameOverGarcello = require "substates.game-over-garcello"
	fakeGameOver = require "substates.fake-game-over"
	gameOverQ = require "substates.game-over-quaver"

	-- Load week data
	weekData = {
		require "weeks.original/tutorial",
		require "weeks.original/week1",
		require "weeks.original/week2",
		require "weeks.original/week3",
		require "weeks.original/week4",
		require "weeks.original/week5",
		require "weeks.original/week6"
	}
	week7Data = { -- FUCKING PLACEHOLDERS I STILL NEED TO REMOVE
		require "weeks.week2",
	--	require "weeks.week3",
	--	require "weeks.1k",
	--	require "weeks.victory",
	--	require "weeks.monochrome", --this is so bad
	--	require "weeks.fridayNightFuckshit2", --this is also so bad
	--	require "weeks.weekg",
	--	require "weeks.quaver"
	}
	weekDataG = {
		require "weeks.original/tutorial",
		require "weeks.original/week1",
		require "weeks.original/week2",
		require "weeks.original/week3",
		require "weeks.original/week4",
		require "weeks.original/week5",
		require "weeks.original/week6",
		require "weeks.weekg"
	}

	
	-- LÖVE init
	if curOS == "OS X" then
		love.window.setIcon(love.image.newImageData("icons/macos.png"))
	else
		love.window.setIcon(love.image.newImageData("icons/default.png"))
	end

	lovesize.set(1280, 720)

	-- Variables
	font = love.graphics.newFont("fonts/vcr.ttf", 24)
	qfont = love.graphics.newFont("fonts/quaverFont.ttf", 55)

	weekNum = 1
	songDifficulty = 2

	spriteTimers = {
		0, -- Girlfriend
		0, -- Enemy
		0 -- Boyfriend
	}

	storyMode = false
	countingDown = false

	cam = {x = 0, y = 0, sizeX = 0.9, sizeY = 0.9}
	camScale = {x = 0.9, y = 0.9}
	uiScale = {x = 0.7, y = 0.7}

	musicTime = 0
	health = 0

	if curOS == "Web" then
		Gamestate.switch(clickStart)
	else
		if not fileExists then
			Gamestate.switch(gallery)
		else
			if disablePHIntro then
				Gamestate.switch(menu)
			else
				Gamestate.switch(clickStart)
			end
		end
	end
end

function love.resize(width, height)
	lovesize.resize(width, height)
end

function love.keypressed(key)
    if key == "6" then
        love.filesystem.createDirectory("screenshots")
        love.graphics.captureScreenshot("screenshots/" .. os.time() .. ".png")

    elseif key == "8" then
        Gamestate.switch(debugMenu)

    elseif key == "-" then
        if volume < 0.2 then
            love.audio.setVolume(0)

        elseif volume ~= 0 then
            audio.playSound(selectSound)
            love.audio.setVolume(volume - 0.1)
        end

    elseif key == "=" then
        audio.playSound(selectSound)
        love.audio.setVolume(volume + 0.1)

    elseif key == "0" then
        if volume ~= 0 then
            lastVolume = volume
            love.audio.setVolume(0)

        elseif volume == 0 then
            love.audio.setVolume(lastVolume)
        end

    else

        Gamestate.keypressed(key)
    end
end

function love.mousepressed(x, y, button, istouch, presses)
	Gamestate.mousepressed(x, y, button, istouch, presses)
end

function love.update(dt)
	volume = love.audio.getVolume()
	dt = math.min(dt, 1 / 30)

	input:update()

	if status.getNoResize() then
		Gamestate.update(dt)
	else
		love.graphics.setFont(font)
		graphics.screenBase(lovesize.getWidth(), lovesize.getHeight())
		graphics.setColor(1, 1, 1) -- Fade effect on
		Gamestate.update(dt)
		love.graphics.setColor(1, 1, 1) -- Fade effect off
		graphics.screenBase(love.graphics.getWidth(), love.graphics.getHeight())
		love.graphics.setFont(font)
	end

	Timer.update(dt)
end

function love.draw()
	love.graphics.setFont(font)
	if status.getNoResize() then
		graphics.setColor(1, 1, 1) -- Fade effect on
		Gamestate.draw()
		love.graphics.setColor(1, 1, 1) -- Fade effect off
		love.graphics.setFont(font)

		if status.getLoading() then
			love.graphics.print("Loading...", graphics.getWidth() - 175, graphics.getHeight() - 50)
		end
	else
		graphics.screenBase(lovesize.getWidth(), lovesize.getHeight())
		lovesize.begin()
			graphics.setColor(1, 1, 1) -- Fade effect on
			Gamestate.draw()
			love.graphics.setColor(1, 1, 1) -- Fade effect off
			love.graphics.setFont(font)

			if status.getLoading() then
				love.graphics.print("Loading...", lovesize.getWidth() - 175, lovesize.getHeight() - 50)
			end
		lovesize.finish()
	end
	graphics.screenBase(love.graphics.getWidth(), love.graphics.getHeight())

	-- Debug output
	if settings.showDebug then
		love.graphics.print(status.getDebugStr(settings.showDebug), 5, 5, nil, 0.5, 0.5)
	end
end

return graphics.newSprite(
	images.notes,
	{
		{x = 0, y = 0, width = 1, height = 1, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 1: Left Arrow
		{x = 0, y = 2, width = 1, height = 1, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 2: Left Arrow On
		{x = 0, y = 4, width = 1, height = 1, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 3: Left Arrow Press
		{x = 0, y = 6, width = 1, height = 1, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 4: Left Arrow Confirm 1
		{x = 0, y = 8, width = 1, height = 1, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 5: Left Arrow Confirm 2
		{x = 0, y = 10, width = 1, height = 1, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 6: Left Hold
		{x = 0, y = 10, width = 1, height = 1, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0} -- 7: Left End
	},
	{
		["off"] = {start = 1, stop = 1, speed = 0, offsetX = 0, offsetY = 0},
		["on"] = {start = 2, stop = 2, speed = 0, offsetX = 0, offsetY = 0},
		["press"] = {start = 3, stop = 3, speed = 0, offsetX = 0, offsetY = 0},
		["confirm"] = {start = 4, stop = 5, speed = 24, offsetX = 0, offsetY = 0},
		["hold"] = {start = 6, stop = 6, speed = 0, offsetX = 0, offsetY = 0},
		["end"] = {start = 7, stop = 7, speed = 0, offsetX = 0, offsetY = 0}
	},
	"off",
	false,
	{
		floored = true
	}
)

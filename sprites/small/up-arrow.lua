return graphics.newSprite(
	images.notes,
	{
		{x = 4, y = 0, width = 1, height = 1, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 1: Up Arrow
		{x = 4, y = 2, width = 1, height = 1, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 2: Up Arrow On
		{x = 4, y = 4, width = 1, height = 1, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 3: Up Arrow Press
		{x = 4, y = 6, width = 1, height = 1, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 4: Up Arrow Confirm 1
		{x = 4, y = 8, width = 1, height = 1, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 5: Up Arrow Confirm 2
		{x = 4, y = 10, width = 1, height = 1, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 6: Up Hold
		{x = 4, y = 10, width = 1, height = 1, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0} -- 7: Up End
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

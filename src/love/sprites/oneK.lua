return graphics.newSprite(
	images.notesok,
	{
		{x = 2, y = 2, width = 152, height = 152, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 4: arrowUP0000
		{x = 974, y = 177, width = 168, height = 168, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 41: up confirm0000
		{x = 974, y = 177, width = 168, height = 168, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 42: up confirm0001
		{x = 1144, y = 177, width = 158, height = 158, offsetX = -5, offsetY = -5, offsetWidth = 168, offsetHeight = 168}, -- 43: up confirm0002
		{x = 1144, y = 177, width = 158, height = 158, offsetX = -5, offsetY = -5, offsetWidth = 168, offsetHeight = 168}, -- 44: up confirm0003
		{x = 1304, y = 177, width = 134, height = 134, offsetX = -2, offsetY = -2, offsetWidth = 139, offsetHeight = 139}, -- 45: up press0000
		{x = 1304, y = 177, width = 134, height = 134, offsetX = -2, offsetY = -2, offsetWidth = 139, offsetHeight = 139}, -- 46: up press0001
		{x = 1440, y = 177, width = 139, height = 139, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 47: up press0002
		{x = 1440, y = 177, width = 139, height = 139, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 48: up press0003
		{x = 1235, y = 2, width = 50, height = 64, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 18: green tail0000
		{x = 1029, y = 2, width = 152, height = 152, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 16: green alone0000
		{x = 1183, y = 2, width = 50, height = 44, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0} -- 17: green hold0000
	},
	{
		["off"] = {start = 1, stop = 1, speed = 0, offsetX = 0, offsetY = 0},
		["confirm"] = {start = 2, stop = 2, speed = 24, offsetX = 0, offsetY = 0},
		["press"] = {start = 9, stop = 9, speed = 24, offsetX = 0, offsetY = 0},
		["end"] = {start = 10, stop = 10, speed = 0, offsetX = 0, offsetY = 0},
		["on"] = {start = 11, stop = 11, speed = 0, offsetX = 0, offsetY = 0},
		["hold"] = {start = 12, stop = 12, speed = 0, offsetX = 0, offsetY = 0}
	},
	"off",
	false
)
require("hotkeys"):init()

hs.loadSpoon("ConfigReloader")

local services = {}

function services:aerospace()
	os.execute("/opt/homebrew/bin/aerospace reload-config")
end

function services:sketchybar()
	os.execute("/opt/homebrew/bin/brew services restart sketchybar")
end

function services:borders()
	os.execute("/opt/homebrew/bin/brew services restart borders")
end

spoon.ConfigReloader.config = {
	{
		path = os.getenv("HOME") .. "/.aerospace.toml",
		command = services.aerospace,
	},
	{
		path = os.getenv("HOME") .. "/.config/sketchybar",
		command = services.sketchybar,
	},
}
spoon.ConfigReloader:start()

for _, reload in pairs(services) do
	reload()
end

hs.alert.show("Config Loaded")

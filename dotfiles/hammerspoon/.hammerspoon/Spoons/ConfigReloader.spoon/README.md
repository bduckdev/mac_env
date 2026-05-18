# ConfigReloader.spoon

Simple extension for [Hammerspoon](https://github.com/Hammerspoon/hammerspoon) to reload configs for a given application using watchers.

## Example Config

```
hs.loadSpoon("ConfigReloader")
spoon.ConfigReloader.config = {
	{
		path = os.getenv("HOME") .. "/.aerospace.toml",
		command = function()
			os.execute("/opt/homebrew/bin/aerospace reload-config")
		end,
	},
}
spoon.ConfigReloader:start()
```

## Installation and Usage

1. Clone the repo to your hammerspoon config directory

```
git clone https://github.com/bduckdev/ConfigReloader.spoon ~/.hammerspoon/spoons/ConfigReloader.spoon
```

2. Initialize inside your `init.lua`. By default it's going to watch for your ~/.hammerspoon directory.

```
hs.loadSpoon("ConfigReloader")
spoon.ConfigReloader:start()
```

3. Add your own programs inside init.lua:

```
spoon.ConfigReloader.config = {
	{
		path = os.getenv("HOME") .. "/.aerospace.toml",
		command = function()
			os.execute("/opt/homebrew/bin/aerospace reload-config")
		end,
	},
}
```

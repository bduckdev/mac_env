-- reloads configs for a given application using watchers
reloader = {}

--[[
config for reloader
path = location of config to be watched
command = command to be executed when config is changed

example:

reloader.config = {
    {
        path = "/path/to/config/dir",
        command = function()
        	print("foo")
        end
    }
]]
reloader.config = {}

function reloader:start()
	self.watchers = {}
	-- add hammerspoon by default
	self.config[#self.config + 1] = {
		path = os.getenv("HOME") .. "/.hammerspoon/",
		command = hs.reload,
	}

	for _, item in pairs(self.config) do
		self:add_watcher(item)
	end
end

function reloader:add_watcher(item)
	local ok = pcall(function()
		assert(type(item.path) == "string", 'Path must be of type "string"')
		assert(type(item.command) == "function", 'Command must be of type "function"')
	end)

	if ok then
		self.watchers[#self.watchers + 1] = hs.pathwatcher.new(item.path, item.command):start()
		hs.printf("[ConfigReloader] Watcher for path %s successfully initialized", item.path)
	else
		hs.printf("[ConfigReloader] Invalid config for watcher %s: %s", item.path, item.command)
	end
end

return reloader

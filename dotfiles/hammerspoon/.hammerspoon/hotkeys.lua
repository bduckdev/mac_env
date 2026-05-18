hotkeys = {}

hotkeys.bindings = {
	{
		modifier = { "cmd", "alt", "ctrl" },
		key = "R",
		action = function()
			hs.reload()
		end,
	},
}

function hotkeys:init()
	for _, binding in pairs(hotkeys.bindings) do
		hs.hotkey.bind(binding.modifier, binding.key, binding.action)
	end
end

return hotkeys

local wezterm = require("wezterm")
local colors = require("lua/cyberdream")

local config = {
	font = wezterm.font("JetBrains Mono"),
	line_height = 1.15,
	font_size = 28,
	max_fps = 165,

	-- Remove scroll bar, window decorations, etc.
	window_decorations = "RESIZE",
	enable_scroll_bar = false,
	enable_tab_bar = false,

	-- Tab bar options
	tab_bar_at_bottom = true,
	hide_tab_bar_if_only_one_tab = false,
	use_fancy_tab_bar = false,
	tab_and_split_indices_are_zero_based = false,

	colors = colors,

	-- mouse settings
	dpi = 96.0,
	hide_mouse_cursor_when_typing = true,

	-- window settings
	window_background_opacity = 0.6,
	macos_window_background_blur = 20,
	window_close_confirmation = "NeverPrompt",
	window_padding = {
		left = 12,
		right = 12,
		top = 12,
		bottom = 12,
	},
	--default_prog = { "/bin/zsh" },
}

return config

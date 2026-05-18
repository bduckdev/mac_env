local wezterm = require("wezterm")

local config = {
	font = wezterm.font("JetBrains Mono"),
	font_size = 28,
	line_height = 1.15,

	-- Remove scroll bar, window decorations, etc.
	--[[
	window_decorations = "RESIZE",
	enable_tab_bar = false,
	enable_scroll_bar = false,
    ]]

	-- Tab bar options
	tab_bar_at_bottom = true,
	hide_tab_bar_if_only_one_tab = false,
	use_fancy_tab_bar = false,
	tab_and_split_indices_are_zero_based = false,

	-- Color schemes, pick your favorite one! there are lots of cool ones
	--color_scheme = "Rose Pine"
	--color_scheme = "Dracula",
	--color_scheme = "Galaxy",
	--color_scheme = "Campbell (Gogh)",
	--color_scheme = "Kanagawa (Gogh)",
	--color_scheme = "Gruvbox (Gogh)",
	color_scheme = "Catppuccin Mocha",

	-- mouse settings
	dpi = 96.0,
	hide_mouse_cursor_when_typing = true,

	-- window settings
	window_background_opacity = 0.6,
	window_close_confirmation = "NeverPrompt",
	window_padding = {
		left = 12,
		right = 12,
		top = 12,
		bottom = 12,
	},
	max_fps = 120,
	default_prog = { "/usr/bin/zsh" },
}

return config

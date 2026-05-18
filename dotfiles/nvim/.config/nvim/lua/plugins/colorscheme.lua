return {
	{
		"NTBBloodbath/doom-one.nvim",
		name = "doom-one",
		priority = 1000,
		lazy = false,
		setup = function()
			-- Add color to cursor
			vim.g.doom_one_cursor_coloring = true
			-- Set :terminal colors
			vim.g.doom_one_terminal_colors = true
			-- Enable italic comments
			vim.g.doom_one_italic_comments = true
			-- Enable TS support
			vim.g.doom_one_enable_treesitter = true
			-- Color whole diagnostic text or only underline
			vim.g.doom_one_diagnostics_text_color = true
			-- Enable transparent background
			vim.g.doom_one_transparent_background = false

			--[[
			-- Pumblend transparency
			vim.g.doom_one_pumblend_enable = false
			vim.g.doom_one_pumblend_transparency = 20
            ]]

			-- Plugins integration
			--[[
            vim.g.doom_one_plugin_neorg = true
            vim.g.doom_one_plugin_barbar = false
            vim.g.doom_one_plugin_telescope = false
            vim.g.doom_one_plugin_neogit = true
            vim.g.doom_one_plugin_nvim_tree = true
            vim.g.doom_one_plugin_dashboard = true
            vim.g.doom_one_plugin_startify = true
            vim.g.doom_one_plugin_whichkey = true
            vim.g.doom_one_plugin_indent_blankline = true
            vim.g.doom_one_plugin_vim_illuminate = true
            vim.g.doom_one_plugin_lspsaga = false
            ]]
		end,
	},
	{
		{
			"scottmckendry/cyberdream.nvim",
			lazy = false,
			priority = 1000,
			config = function()
				require("cyberdream").setup({
					-- Recommended - see "Configuring" below for more config options
					transparent = true,
					italic_comments = true,
					hide_fillchars = true,
					borderless_telescope = false,
					terminal_colors = true,
					theme = {
						hightlights = {
							LineNrBelow = { fg = "#FFFFFF", bg = "NONE" },
						},
					},
				})
				vim.cmd("colorscheme cyberdream") -- set the colorscheme
			end,
		},
	},
	{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },
}

return {
	{
		"folke/snacks.nvim",
		priority = 1000,
		dependencies = { "echasnovski/mini.icons" },
		lazy = false,
		opts = {
			bigfile = { enabled = true },
			dashboard = {
				enabled = true,
				sections = {
					{
						pane = 1,
						{ section = "header" },
						{
							text = {
								{ "  ", hl = "SnacksDashboardIcon" },
								{ "gibe files", hl = "SnacksDashboardDesc", width = 56 },
								{ ".", hl = "SnacksDashboardKey" },
							},
							action = ":Oil .",
							key = ".",
							gap = 1,
							padding = 1,
						},
						{ section = "keys", gap = 1, padding = 1 },
						{ section = "startup" },
					},
					{
						section = "terminal",
						cmd = "pokemon-colorscripts -n giratina -f origin --no-title; sleep .1",
						--	random = 10,
						pane = 2,
						--indent = 4,
						height = 30,
					},
					--{
					--	section = "terminal",
					--	cmd = "chafa ~/Pictures/feet-lmao-4_no-bg.png --format symbols --symbols vhalf --stretch",
					--	pane = 1,
					--	indent = 4,
					--	height = 24,
					--},
				},
			},
			notifier = { enabled = true },
			quickfile = { enabled = true },
			statuscolumn = { enabled = true },
			words = { enabled = true },
		},
		keys = {
			{
				"<leader>xn",
				function()
					Snacks.notifier.show_history()
				end,
				desc = "Notification History",
			},
			{
				"<C-g>",
				function()
					Snacks.lazygit()
				end,
				desc = "LazyGit",
			},
		},
	},
}

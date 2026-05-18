return {
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local builtin = require("telescope.builtin")
			require("telescope").setup({
				defaults = {
					file_ignore_patterns = { "node_modules/" },
				},
			})
			vim.keymap.set("n", "<leader>pf", builtin.find_files, {})
			vim.keymap.set("n", "<C-p>", builtin.git_files, {})
			vim.keymap.set("n", "<leader>ps", builtin.live_grep, {})
			vim.keymap.set("n", "<leader>pb", builtin.buffers, {})
			vim.keymap.set("n", "<leader><leader>h", ":Telescope help_tags<CR>")
		end,
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		config = function()
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
			})
			require("telescope").load_extension("ui-select")
			require("telescope").load_extension("harpoon")
		end,
	},
	{
		"jonarrien/telescope-cmdline.nvim",
		config = function()
			require("telescope").load_extension("cmdline")
			require("telescope").setup({
				extensions = {
					cmdline = {
						picker = {
							layout_config = {
								width = 125,
								height = 25,
							},
							output_pane = {
								enabled = true,
							},
						},
						mappings = {
							complete = "<Tab>",
							run_selection = "<C-CR>",
							run_input = "<CR>",
						},
					},
				},
			})
			vim.api.nvim_set_keymap(
				"n",
				"<leader><leader>",
				":silent Telescope cmdline<CR>",
				{ noremap = true, desc = "Command Line" }
			)
		end,
	},
}

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
			local actions = require("telescope.actions")
			local action_state = require("telescope.actions.state")

			local function find_directory()
				builtin.find_files({
					prompt_title = "Directories",
					find_command = {
						"fd",
						"--type",
						"d",
						"--hidden",
						"--exclude",
						".git",
					},
					attach_mappings = function(prompt_bufnr, map)
						actions.select_default:replace(function()
							actions.close(prompt_bufnr)

							local selection = action_state.get_selected_entry()
							vim.cmd("Oil " .. vim.fn.fnameescape(selection.path))
						end)

						return true
					end,
				})
			end

			vim.api.nvim_create_user_command("TelescopeFindDirectory", find_directory, {})
			vim.keymap.set("n", "<leader>fd", "<cmd>TelescopeFindDirectory<CR>", {
				desc = "Find directory in Oil",
			})
			vim.keymap.set("n", "<leader>ff", "<cmd>:Telescope find_files hidden=true<CR>", {})
			vim.keymap.set("n", "<C-p>", builtin.git_files, {})
			vim.keymap.set("n", "<leader>fs", builtin.live_grep, {})
			vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
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

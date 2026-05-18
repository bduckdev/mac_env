return {
	{
		--	"github/copilot.vim",
	},
	{
		"codota/tabnine-nvim",
		build = "./dl_binaries.sh",
		config = function()
			require("tabnine").setup({
				disable_auto_comment = true,
				accept_keymap = "<Tab>",
				dismiss_keymap = "<C-]>",
				debounce_ms = 800,
				suggestion_color = { gui = "#31748f", cterm = 244 },
				exclude_filetypes = { "TelescopePrompt", "NvimTree" },
				log_file_path = nil, -- absolute path to Tabnine log file
			})
			vim.keymap.set("n", "<leader>vai", function()
				require("tabnine.status").toggle_tabnine()
				print(require("tabnine.status").status())
			end)
		end,
	},
}

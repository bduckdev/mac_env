return {
	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		build = "cd app && yarn install",
		init = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
		ft = { "markdown" },
		config = function()
			vim.api.nvim_create_autocmd("BufEnter", {
				group = vim.api.nvim_create_augroup("msword", { clear = true }),
				pattern = "*.md",
				callback = function()
					vim.opt.formatoptions = "t1"
					vim.opt.tabstop = 5
					vim.opt.softtabstop = 5
					vim.opt.shiftwidth = 5
					vim.opt.autoindent = false
					vim.opt.spell = true
					vim.opt.spelllang = "en_us"
					vim.opt.textwidth = 80
					vim.opt.expandtab = true
					vim.opt.wrap = true
					vim.opt.linebreak = true
					vim.opt.colorcolumn = ""
					print("Toggled markdown")
				end,
			})
			vim.api.nvim_create_autocmd("BufLeave", {
				group = vim.api.nvim_create_augroup("mswordleave", { clear = true }),
				pattern = "*.md",
				callback = function()
					vim.cmd.source("~/.config/nvim/bduck/set.lua")
				end,
			})
		end,
	},
}

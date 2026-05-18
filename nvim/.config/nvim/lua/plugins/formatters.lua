return {
	{
		"nvimtools/none-ls.nvim",
		config = function()
			local null_ls = require("null-ls")

			null_ls.setup({
				sources = {
					-- lua
					null_ls.builtins.formatting.stylua,
					-- js
					null_ls.builtins.formatting.prettierd,
					-- python
					null_ls.builtins.formatting.black,
					--ocaml
					null_ls.builtins.formatting.ocamlformat,
					-- shell scripts
					null_ls.builtins.formatting.shfmt,
					-- go
					null_ls.builtins.formatting.gofumpt,
					-- rustfmt
					--null_ls.builtins.formatting.rustfmt,
				},
			})

			vim.api.nvim_create_autocmd("BufWritePre", {
				callback = function()
					vim.lsp.buf.format()
				end,
			})
		end,
	},
	{
		"MunifTanjim/eslint.nvim",
		config = function()
			local null_ls = require("null-ls")
			local eslint = require("eslint")

			null_ls.setup()

			eslint.setup({
				bin = "eslint", -- or `eslint_d`
				code_actions = {
					enable = true,
					apply_on_save = {
						enable = true,
						types = { "directive", "problem", "suggestion", "layout" },
					},
					disable_rule_comment = {
						enable = true,
						location = "separate_line", -- or `same_line`
					},
				},
				diagnostics = {
					enable = true,
					report_unused_disable_directives = false,
					run_on = "type", -- or `save`
				},
			})
		end,
	},
	{
		"kkoomen/vim-doge",
	},
}

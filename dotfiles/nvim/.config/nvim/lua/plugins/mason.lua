return {
	{
		"williamboman/mason-lspconfig.nvim",
		opts = {
			ensure_installed = {
				"lua_ls",
				"ts_ls",
				"rust_analyzer",
				"gopls",
				"cssls",
				"templ",
				"emmet_language_server",
				"html",
				"htmx",
				"tailwindcss",
				"pyright",
				"clangd",
				"bashls",
				"prismals",
				"svelte",
				"zls",
				"postgres_lsp",
			},
		},
		dependencies = {
			{
				"williamboman/mason.nvim",
				opts = {
					ui = {
						icons = {
							package_installed = "✓",
							package_pending = "➜",
							package_uninstalled = "✗",
						},
					},
				},
			},
			"neovim/nvim-lspconfig",
		},
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		dependencies = { "mason-org/mason.nvim" },
		config = function()
			require("mason-tool-installer").setup({
				ensure_installed = {
					"prettierd",
					"stylua",
					"shellcheck",
					"revive",
					"shfmt",
					"isort",
					"black",
					"eslint_d",
				},
			})
		end,
	},
}

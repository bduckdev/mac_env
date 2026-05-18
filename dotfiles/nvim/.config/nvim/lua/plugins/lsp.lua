return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		opts = {
			auto_install = true,
		},
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "ts_ls", "rust_analyzer", "gopls" },
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local servers = {
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
				"ocamllsp",
				"hls",
				"clangd",
				"bashls",
				"prismals",
				"svelte",
				"zls",
			}
			for _, server in pairs(servers) do
				vim.lsp.enable(server)
			end

			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, {})
			vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, {})
			vim.keymap.set("n", "[d", vim.diagnostic.goto_next, {})
			vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, {})
			vim.keymap.set("n", "<leader>vca", vim.lsp.buf.code_action, {})
			vim.keymap.set("n", "<leader>vrr", vim.lsp.buf.references, {})
			vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename, {})
			vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, {})
		end,
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		config = function()
			require("mason-tool-installer").setup({
				ensure_installed = {
					"prettierd",
					"eslint",
					"stylua",
					"shellcheck",
					"revive",
					"shfmt",
				},
			})
		end,
	},
}

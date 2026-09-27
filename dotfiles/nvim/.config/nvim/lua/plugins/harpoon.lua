local harpoon_tabline_show_hint = false

return {
	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		dependencies = { "nvim-lua/plenary.nvim", { "echasnovski/mini.icons", opts = {} } },

		config = function()
			local harpoon = require("harpoon")

			harpoon:setup({
				settings = {
					save_on_toggle = true,
					sync_on_ui_close = true,
				},
			})

			vim.o.tabline = "%!v:lua.HarpoonTabline()"

			vim.keymap.set("n", "<leader>a", function()
				harpoon:list():add()
				vim.cmd("redrawtabline")
			end, { desc = "Harpoon - add buffer" })

			vim.keymap.set("n", "<C-e>", function()
				harpoon.ui:toggle_quick_menu(harpoon:list())
				vim.cmd("redrawtabline")
				vim.cmd("redrawtabline")
			end, { desc = "Harpoon - Menu" })

			vim.keymap.set("n", "<leader>hp", function()
				harpoon:list():prev({ ui_nav_wrap = true })
				vim.cmd("redrawtabline")
			end, { desc = "Harpoon - Switch to previous mark" })

			vim.keymap.set("n", "<leader>hn", function()
				harpoon:list():next({ ui_nav_wrap = true })
				vim.cmd("redrawtabline")
			end, { desc = "Harpoon - Switch to next mark" })

			-- Keys to navigate between marks
			local harpoon_mark_keys = { "<C-h>", "<C-t>", "<C-n>", "<C-s>" }

			local function harpoon_mark_bind(keybind, tag_idx)
				return vim.keymap.set("n", keybind, function()
					harpoon:list():select(tag_idx)
					vim.cmd("redrawtabline")
				end, { desc = "Harpoon - Switch to tag " .. tag_idx })
			end

			for i, key in ipairs(harpoon_mark_keys) do
				harpoon_mark_bind(key, i)
			end

			-- Setup tabline
			vim.o.showtabline = 2

			_G.HarpoonTabline = function()
				local list = harpoon:list()
				local current = vim.fn.expand("%:p")
				local parts = {}
				local icons = require("mini.icons")

				for i, item in ipairs(list.items) do
					if item.value and item.value ~= "" then
						local fullpath = vim.fn.fnamemodify(item.value, ":p")
						local name = vim.fn.fnamemodify(item.value, ":t")

						local icon = icons.get("file", fullpath)

						-- Escape % because tabline treats it specially
						name = name:gsub("%%", "%%%%")

						-- Highlights from lualine
						local hl = fullpath == current and "%#lualine_a_normal#" or "%#lualine_c_normal#"

						if i <= #harpoon_mark_keys and harpoon_tabline_show_hint then
							local key_label = harpoon_mark_keys[i]:match("([%w])[^%w]*$")
							table.insert(parts, string.format("%s %s: %s %s ", hl, harpoon_mark_keys[i], icon, name))
						else
							table.insert(parts, string.format("%s %s %s ", hl, icon, name))
						end
					end
				end

				table.insert(parts, "%#TabLineFill#%=")

				return table.concat(parts)
			end

			vim.api.nvim_set_hl(0, "HarpoonWindow", { link = "Normal" })
			vim.api.nvim_set_hl(0, "HarpoonBorder", { link = "Normal" })
			vim.api.nvim_create_autocmd("User", {
				pattern = "SnacksDashboardOpened",
				callback = function()
					vim.o.showtabline, vim.o.laststatus = 2, 2
				end,
			})
		end,
	},
}

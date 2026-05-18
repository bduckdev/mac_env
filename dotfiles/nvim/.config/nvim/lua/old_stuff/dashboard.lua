return {
    "goolord/alpha-nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        local alpha = require("alpha")
        local dashboard = require("alpha.themes.dashboard")

        dashboard.section.header.val = {
            [[                                                                       ]],
            [[                                                                       ]],
            [[                                                                       ]],
            [[                                                                       ]],
            [[                                                                       ]],
            [[                                                                       ]],
            [[                                                                     ]],
            [[       ████ ██████           █████      ██                     ]],
            [[      ███████████             █████                             ]],
            [[      █████████ ███████████████████ ███   ███████████   ]],
            [[     █████████  ███    █████████████ █████ ██████████████   ]],
            [[    █████████ ██████████ █████████ █████ █████ ████ █████   ]],
            [[  ███████████ ███    ███ █████████ █████ █████ ████ █████  ]],
            [[ ██████  █████████████████████ ████ █████ █████ ████ ██████ ]],
            [[                                                                       ]],
            [[                                                                       ]],
            [[                                                                       ]],
        }
        dashboard.section.buttons.val = {
            dashboard.button("SPC p f", "󰱼  Find file"),
            dashboard.button(
                "SPC v l s",
                "󰤘  Most Recent Buffer",
                ":SessionManager load_current_dir_session<CR>",
                { silent = true }
            ),
            dashboard.button("SPC p v", "  Current Directory"),

            dashboard.button("", ""),
            dashboard.button("b g", "  Vim Be Good", ":VimBeGood<CR>"),
            dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
            dashboard.button("t", "  View TODOS.md", ":e ./TODOS.md<CR>"),
            dashboard.button("r", "  View README.md", ":e ./README.md<CR>"),
            dashboard.button("q", "󰅚  Quit NVIM", ":q<CR>"),
        }
        alpha.setup(dashboard.opts)
        vim.keymap.set("n", "<leader>dd", vim.cmd.Alpha)
    end,
}

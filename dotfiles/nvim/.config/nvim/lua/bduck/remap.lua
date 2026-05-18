vim.g.mapleader = " "
--vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- search and replace

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader><leader>s", [[:,$s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- tmux-sessionizer

vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

-- lazygit
-- vim.keymap.set("n", "<C-g>", "<cmd>silent !tmux neww lazygit<CR>")

-- make executable and run
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- go to global todos
vim.keymap.set("n", "gt", ":e ~/TODOS.md<CR>")

-- go back + go foward
vim.keymap.set("n", "gb", ":bprev<CR>")
vim.keymap.set("n", "gf", ":bnext<CR>")

vim.api.nvim_create_user_command("Norel", function()
	vim.opt.relativenumber = false
end, {})

vim.api.nvim_create_user_command("Yesrel", function()
	vim.opt.relativenumber = true
end, {})

vim.keymap.set("n", "<leader>t", ":tab term<cr>")
vim.keymap.set("t", "<leader>t", "<c-d>")

-- window navigation
--vim.keymap.set("n", "<C-h>", ":wincmd h<CR>")
--vim.keymap.set("n", "<C-j>", ":wincmd j<CR>")
--vim.keymap.set("n", "<C-k>", ":wincmd k<CR>")
--vim.keymap.set("n", "<C-l>", ":wincmd l<CR>")

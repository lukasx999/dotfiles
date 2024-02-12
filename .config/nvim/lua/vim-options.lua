local keymap = vim.api.nvim_set_keymap
local default_opts = { noremap = true, silent = true }
local expr_opts = { noremap = true, expr = true, silent = true }


vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.g.mapleader = " " --set leader to space

vim.wo.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true

keymap("n", "<ESC>", ":nohlsearch<Bar>:echo<CR>", default_opts) --remove search highlighting when pressing ESC
keymap("n", "k", "v:count == 0 ? 'gk' : 'k'", expr_opts) --remap j and k to gj and gk
keymap("n", "j", "v:count == 0 ? 'gj' : 'j'", expr_opts)

--vim.api.nvim_set_option("clipboard","unnamed")
vim.cmd("set clipboard+=unnamedplus") --always copy to + register when using yy
--vim.opt.clipboard = "unnamedplus" -- allows neovim to access the system clipboard
vim.opt.ignorecase = true --ignore case in search patterns

--enable transparency at start
vim.api.nvim_create_autocmd("VimEnter", {
	callback = function()
		vim.cmd("hi normal guibg=none")
	end,
})

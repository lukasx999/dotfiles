local keymap = vim.api.nvim_set_keymap
local default_opts = { noremap = true, silent = true }
local expr_opts = { noremap = true, expr = true, silent = true }

--vim.g.localvimrc_sandbox = 0 --disable lvimrc sandboxing

vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")

vim.cmd("set scrolloff=10") --keep cursor centered

vim.g.mapleader = " " --set leader to space

vim.wo.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true

-- options for nvim tree
--vim.opt.termguicolors = true
--vim.g.loaded_netrw = 1
--vim.g.loaded_netrwPlugin = 1

keymap("n", "<ESC>", ":nohlsearch<Bar>:echo<CR>", default_opts) --remove search highlighting when pressing ESC


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

--keymap("n", "k", "v:count == 0 ? 'gk' : 'k'", expr_opts) --remap j and k to gj and gk
--keymap("n", "j", "v:count == 0 ? 'gj' : 'j'", expr_opts)

keymap("n", "j", "gj", {})
keymap("n", "k", "gk", {})

--exit terminal with ESC (:tnoremap <esc> <...>)
vim.keymap.set('t', '<Esc>', [[<C-\><C-n>]])

--open a terminal (:vertical resize -50<CR>)
keymap("n", "<leader>t", ":vsp<CR>:term<CR><C-w><C-r>i", {silent = true})

--vim.keymap.set('n', '<C-t>', ":ToggleTerm<CR>", {silent = true})

--some other stuff
keymap("n", "<leader>o", "o<Esc>", {silent = true})
keymap("n", "<leader><Space>", "/<++><CR>xxxxi", {silent = true}) --placeholders

--spellcheck
keymap("n", "<leader>s", ":setlocal spell! spelllang=en_us<CR>", {silent = true})


--[[
vim.o.path = vim.o.path .. ' , ' ..
'usr/local/include,' ..
'usr/include,'
]]



--[[
--
-- :sp {path} to split horizontally
-- :vsp {path} to split vertically
-- :e or :edit {path} to change file
-- :new {path} to create new buffer, if already open, create horizontal split
-- :vnew {path} same for vertical split
-- Ctrl+w to cycle throw windows fowards
-- Ctrl+W to cycle throw windows backwards
-- :quit to close window
-- :term or :terminal for opening terminal
--
--]]

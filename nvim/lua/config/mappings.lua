vim.g.mapleader      = " "
vim.g.maplocalleader = " "

vim.keymap.set("n", "j", "gj", { silent = true })
vim.keymap.set("n", "k", "gk", { silent = true })

-- Delete word with Ctrl-Backspace
vim.keymap.set("i", "<C-BS>", "<C-W>", {}) -- non-tmux
vim.keymap.set("i", "<C-h>",  "<C-W>", {}) -- tmux

-- Exit terminal
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Remove search highlighting
vim.keymap.set('n', '<Esc>', '<cmd>noh<CR>')

vim.keymap.set("n", "<C-z>", "<C-y>", { silent = true }) -- quertz sucks

-- Quickfix List
vim.keymap.set("n", "<leader>q", "<cmd>cope<CR>", { silent = true, desc = "Open Quickfixlist"         })
vim.keymap.set("n", "[q", "<cmd>cp<CR>",          { silent = true, desc = "Next Item in Quickfix"     })
vim.keymap.set("n", "]q", "<cmd>cn<CR>",          { silent = true, desc = "Previous Item in Quickfix" })

-- keep visual selection when using >/<
vim.keymap.set("v", ">", ">gv", { silent = true })
vim.keymap.set("v", "<", "<gv", { silent = true })

-- centering cursor:
vim.keymap.set("n", "<C-d>", "<C-d>zz", { silent = true })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { silent = true })
vim.keymap.set("n", "<C-f>", "<C-f>zz", { silent = true })
vim.keymap.set("n", "<C-b>", "<C-b>zz", { silent = true })
vim.keymap.set("n", "n",     "nzzzv",   { silent = true })
vim.keymap.set("n", "N",     "Nzzzv",   { silent = true })
-- vim.keymap.set("i", "jk",    "<ESC>",   { silent = true })

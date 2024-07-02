

-- remove search highlighting when pressing ESC
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')


-- exit terminal mode with double escape
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })


-- delete words with control + backspace
vim.keymap.set("i", "<C-BS>", "<C-W>", {}) -- for non tmux
vim.keymap.set("i", "<C-h>", "<C-W>", {}) -- for tmux



-- open and close folds with space
-- vim.keymap.set('n', '<Space>', 'za', { desc = 'Toggle folds' })



-- move around in insert mode
-- vim.keymap.set("i", "<C-S-j>", "<Down>", {})
-- vim.keymap.set("i", "<C-S-k>", "<Up>", {})
-- vim.keymap.set("i", "<C-S-h>", "<Left>", {})
-- vim.keymap.set("i", "<C-S-l>", "<Right>", {})



-- Keybinds
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- General
vim.keymap.set("n", "j", "gj", {})
vim.keymap.set("n", "k", "gk", {})

vim.keymap.set("n", "§", "w:!", {})  -- open shell prompt



vim.keymap.set("n", "ZW", "<cmd>w<CR>", { desc = "Write file" })

vim.keymap.set("n", "ZA", ":", { desc = "All" })
vim.keymap.set("n", "ZAQ", "<cmd>qa!<CR>", { desc = "Quit all" })
vim.keymap.set("n", "ZAW", "<cmd>wa<CR>", { desc = "Write all" })
vim.keymap.set("n", "ZAZ", "<cmd>wqa<CR>", { desc = "Write all, Quit all" })


vim.keymap.set("n", "<leader>n", ":", { desc = "Misc" })
vim.keymap.set("n", "<leader>t", ":", { desc = "Toggle Options" })
vim.keymap.set('n', '<leader>m', ":", { desc = "Move in Context" })

-- Windows
vim.keymap.set("n", "<leader>w", ":", { desc = "Windows" })

vim.keymap.set("n", "<leader>wc", "<cmd>q!<CR>", { desc = "Close Window" })
vim.keymap.set("n", "<leader>wv", "<cmd>vsp<CR>", { desc = "Vertical split" })
vim.keymap.set("n", "<leader>ws", "<cmd>sp<CR>", { desc = "Horizontal split" })



vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Focus down" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Focus up" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Focus right" })
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Focus left" })



vim.keymap.set("n", "<C-S-j>", "<C-w>+", { desc = "Resize down" })
vim.keymap.set("n", "<C-S-k>", "<C-w>-", { desc = "Resize up" })
-- TODO dont work
--vim.keymap.set("n", "<C-S-l>", "<C-w>>", { desc = "Resize right" })
--vim.keymap.set("n", "<C-S-h>", "<C-w><", { desc = "Resize left" })




vim.keymap.set("n", "<leader>wj", "<cmd>wincmd j<CR>", { desc = "Focus down" })
vim.keymap.set("n", "<leader>wk", "<cmd>wincmd k<CR>", { desc = "Focus up" })
vim.keymap.set("n", "<leader>wh", "<cmd>wincmd h<CR>", { desc = "Focus left" })
vim.keymap.set("n", "<leader>wl", "<cmd>wincmd l<CR>", { desc = "Focus right" })

vim.keymap.set("n", "<leader>wJ", "<cmd>wincmd J<CR>", { desc = "Move down" })
vim.keymap.set("n", "<leader>wK", "<cmd>wincmd K<CR>", { desc = "Move up" })
vim.keymap.set("n", "<leader>wH", "<cmd>wincmd H<CR>", { desc = "Move left" })
vim.keymap.set("n", "<leader>wL", "<cmd>wincmd L<CR>", { desc = "Move right" })

vim.keymap.set("n", "<leader>wr", ":", { desc = "resize windows" })
vim.keymap.set("n", "<leader>wrj", "<cmd>wincmd +<CR>", { desc = "Resize down" })
vim.keymap.set("n", "<leader>wrk", "<cmd>wincmd -<CR>", { desc = "Resize up" })
vim.keymap.set("n", "<leader>wrh", "<cmd>wincmd ><CR>", { desc = "Resize left" })
vim.keymap.set("n", "<leader>wrl", "<cmd>wincmd <<CR>", { desc = "Resize right" })

vim.keymap.set("n", "<leader>ww", "<cmd>wincmd w<CR>", { desc = "Cycle prev window" })
vim.keymap.set("n", "<leader>wW", "<cmd>wincmd W<CR>", { desc = "Cycle next window" })




-- Buffers
vim.keymap.set("n", "<leader>b", ":", { desc = "buffers" })

vim.keymap.set("n", "<leader>bs", "<cmd>buffers<CR>", { desc = "buffers" })
-- bb buffer list in plugins

-- vim.keymap.set("n", "<leader>bn", "<cmd>bnext<CR>", { desc = "next" })
-- vim.keymap.set("n", "<leader>bp", "<cmd>bprev<CR>", { desc = "prev" })
--vim.keymap.set("n", "<leader>bc", "<cmd>bd<CR>", { desc = "close" })

vim.keymap.set("n", "<leader>bh", "<cmd>bnext<CR>", { desc = "Next" })
vim.keymap.set("n", "<leader>bl", "<cmd>bprev<CR>", { desc = "Previous" })
vim.keymap.set("n", "<leader>bk", "<cmd>bnext<CR>", { desc = "Next" })
vim.keymap.set("n", "<leader>bj", "<cmd>bprev<CR>", { desc = "Previous" })

vim.keymap.set("n", "<C-n>", "<cmd>bnext<CR>", { desc = "Next" })
vim.keymap.set("n", "<C-p>", "<cmd>bprev<CR>", { desc = "Previous" })

vim.keymap.set("n", "<leader>bc", "<cmd>bd!<CR>", { desc = "Close Buffer" })


-- better C-w commands
vim.keymap.set("n", "<C-w>q", "<cmd>q!<CR>", { desc = "Quit Window" })
vim.keymap.set("n", "<C-w>c", "<cmd>bd!<CR>", { desc = "Delete Buffer" })
vim.keymap.set("n", "<Tab>", "<cmd>bnext<CR>", { desc = "Next Buffer" })
vim.keymap.set("n", "<C-w>b", "<cmd>bnext<CR>", { desc = "Next Buffer" })
vim.keymap.set("n", "<C-w>B", "<cmd>bprev<CR>", { desc = "Previous Buffer" })

-- TODO fix
-- vim.keymap.set("n", "<C-.>", "<cmd>bnext<CR>", { desc = "Next Buffer" })
-- vim.keymap.set("n", "<C-,>", "<cmd>bprev<CR>", { desc = "Previous Buffer" })

vim.keymap.set("n", "<leader>bn", "<cmd>ene<CR>", { desc = "New Unnamed Buffer" })

-- <leader>bl / <leader>bs for buffer menu -> plugins.lua


-- vim.keymap.set("n", "<leader>bq", "<cmd>qa!<CR>", { desc = "quit all" })
-- vim.keymap.set("n", "<leader>bw", "<cmd>wa<CR>", { desc = "write all" })




-- Tabs
--vim.keymap.set("n", "<leader>wt", ":tabNext<CR>", { desc = "goto next tab" })
--vim.keymap.set("n", "<leader>wT", ":tabprevious<CR>", { desc = "goto prev tab" })

-- leader w...windows b...buffers t...tabs


-- Toggle
vim.keymap.set("n", "<leader>tf", "<cmd>set foldmethod=manual<CR>", { desc = "Foldmethod" })
vim.keymap.set("n", "<leader>tw", "<cmd>set wrap!<CR>", { desc = "Line wrapping" })
vim.keymap.set("n", "<leader>tc", "<cmd>set cursorcolumn!<CR>", { desc = "Cursorcolumn" })
vim.keymap.set("n", "<leader>tI", "<cmd>set cursorline!<CR>", { desc = "Cursorline" })
vim.keymap.set("n", "<leader>tl", "<cmd>set number!<CR><cmd>set relativenumber!<CR>", { desc = "Line numbers" })
--vim.keymap.set("n", "<leader>te", "<cmd>Barbecue toggle<CR>", { desc = "barbecue" })


vim.keymap.set("n", "<leader>tO", "<cmd>execute 'set colorcolumn=' . (&colorcolumn == '' ? '80' : '')<CR>", { desc = "Colorcolumn", silent = true })





-- Toogle diagnostics
local diagnostics_active = true
local toggle_diagnostics = function()
  diagnostics_active = not diagnostics_active
  if diagnostics_active then
    --vim.api.nvim_echo({ { "Show diagnostics" } }, false, {})
    vim.diagnostic.enable()
  else
    --vim.api.nvim_echo({ { "Disable diagnostics" } }, false, {})
    vim.diagnostic.disable()
  end
end


-- minimize ui
local toggle_all = function()
    toggle_diagnostics()
    vim.cmd("set number!")
    vim.cmd("set relativenumber!")
    vim.cmd("IBLToggle")
    vim.cmd("ColorizerToggle")
    vim.cmd("BeaconToggle")
    vim.cmd("GitGutterDisable")
    vim.cmd("Lspsaga winbar_toggle")
    vim.cmd("ScrollbarToggle")
    --vim.cmd("execute 'set colorcolumn=' . (&colorcolumn == '' ? '80' : '') ")
end


-- additional toggles for zen mode
Toggle_Zen = function()
    toggle_diagnostics()
    vim.cmd("IBLToggle")
    vim.cmd("ColorizerToggle")
    vim.cmd("BeaconToggle")
    vim.cmd("GitGutterDisable")
    vim.cmd("Lspsaga winbar_toggle")
    vim.cmd("ScrollbarToggle")
end



-- minimize ui
vim.keymap.set("n", "<leader>tm", toggle_all, { desc = "Minimize UI", silent = true })

-- toggle LSP
vim.keymap.set("n", "<leader>ll", toggle_diagnostics, { desc = "Toggle LSP", silent = true })


-- move lines around -- mini.move!
-- vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { silent = true })
-- vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { silent = true })



-- keep visual selection when using >/<
vim.keymap.set("v", ">", ">gv", { silent = true })
vim.keymap.set("v", "<", "<gv", { silent = true })



-- centering cursor on:
-- half page up/down
vim.keymap.set("n", "<C-d>", "<C-d>zz", { silent = true })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { silent = true })

vim.keymap.set("n", "<C-f>", "<C-f>zz", { silent = true })
vim.keymap.set("n", "<C-b>", "<C-b>zz", { silent = true })

-- other mappings:
-- C-e C-y move screen without moving cursor


-- search
vim.keymap.set("n", "n", "nzzzv", { silent = true })
vim.keymap.set("n", "N", "Nzzzv", { silent = true })



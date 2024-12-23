local map = vim.keymap.set


-- open and close folds with space
-- vim.keymap.set('n', '<Space>', 'za', { desc = 'Toggle folds' })



-- Keybinds

-- Leader
-- Map leader to space
vim.g.mapleader      = " "
vim.g.maplocalleader = " "

-- General
map("n", "j", "gj", { silent = true })
map("n", "k", "gk", { silent = true })

-- Command mode
-- Delete with C-BS
vim.api.nvim_set_keymap("c", "<c-h>",  [[ wildmenumode() ? "c-h>" : "<C-w>"     ]], { noremap = true, expr = true })  -- for tmux
vim.api.nvim_set_keymap("c", "<c-BS>", [[ wildmenumode() ? "c-BS>" : "<C-w>"    ]], { noremap = true, expr = true })  -- for non-tmux

vim.api.nvim_set_keymap("c", "<M-b>",  [[ wildmenumode() ? "M-b>" : "<C-Left>"  ]], { noremap = true, expr = true })
vim.api.nvim_set_keymap("c", "<M-f>",  [[ wildmenumode() ? "M-f>" : "<C-Right>" ]], { noremap = true, expr = true })
vim.api.nvim_set_keymap("c", "<C-n>",  [[ wildmenumode() ? "M-b>" : "<C-Down>"  ]], { noremap = true, expr = true })
vim.api.nvim_set_keymap("c", "<C-p>",  [[ wildmenumode() ? "M-f>" : "<C-Up>"    ]], { noremap = true, expr = true })



-- Delete words with control + backspace
vim.keymap.set("i", "<C-BS>", "<C-W>", {}) -- for non-tmux
vim.keymap.set("i", "<C-h>",  "<C-W>", {}) -- for tmux


-- Remove search highlighting when pressing ESC
vim.keymap.set('n', '<Esc>', '<cmd>noh<CR>')


-- Exit terminal mode with double escape
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })



-- Windows
vim.keymap.set("n", "<leader>wc", "<cmd>q!<CR>",       { desc = "Close Window"       })
vim.keymap.set("n", "<leader>wv", "<cmd>vsp<CR>",      { desc = "Vertical split"     })
vim.keymap.set("n", "<leader>ws", "<cmd>sp<CR>",       { desc = "Horizontal split"   })

vim.keymap.set("n", "<C-j>",      "<C-w>j",            { desc = "Focus down"         })
vim.keymap.set("n", "<C-k>",      "<C-w>k",            { desc = "Focus up"           })
vim.keymap.set("n", "<C-l>",      "<C-w>l",            { desc = "Focus right"        })
vim.keymap.set("n", "<C-h>",      "<C-w>h",            { desc = "Focus left"         })

vim.keymap.set("n", "<C-S-j>",    "<C-w>+",            { desc = "Resize down"        })
vim.keymap.set("n", "<C-S-k>",    "<C-w>-",            { desc = "Resize up"          })




vim.keymap.set("n", "<leader>wj", "<cmd>wincmd j<CR>", { desc = "Focus down"         })
vim.keymap.set("n", "<leader>wk", "<cmd>wincmd k<CR>", { desc = "Focus up"           })
vim.keymap.set("n", "<leader>wh", "<cmd>wincmd h<CR>", { desc = "Focus left"         })
vim.keymap.set("n", "<leader>wl", "<cmd>wincmd l<CR>", { desc = "Focus right"        })

vim.keymap.set("n", "<leader>wJ", "<cmd>wincmd J<CR>", { desc = "Move down"          })
vim.keymap.set("n", "<leader>wK", "<cmd>wincmd K<CR>", { desc = "Move up"            })
vim.keymap.set("n", "<leader>wH", "<cmd>wincmd H<CR>", { desc = "Move left"          })
vim.keymap.set("n", "<leader>wL", "<cmd>wincmd L<CR>", { desc = "Move right"         })



-- Buffers
vim.keymap.set("n", "<leader>bh", "<cmd>bnext<CR>",    { desc = "Next"               })
vim.keymap.set("n", "<leader>bl", "<cmd>bprev<CR>",    { desc = "Previous"           })
vim.keymap.set("n", "<leader>bk", "<cmd>bnext<CR>",    { desc = "Next"               })
vim.keymap.set("n", "<leader>bj", "<cmd>bprev<CR>",    { desc = "Previous"           })
vim.keymap.set("n", "<leader>bc", "<cmd>bw!<CR>",      { desc = "Close Buffer"       })
vim.keymap.set("n", "<C-n>",      "<cmd>bnext<CR>",    { desc = "Next"               })
vim.keymap.set("n", "<C-p>",      "<cmd>bprev<CR>",    { desc = "Previous"           })


-- better C-w commands
vim.keymap.set("n", "<C-w>q",     "<cmd>q!<CR>",       { desc = "Quit Window"        })
vim.keymap.set("n", "<C-w>c",     "<cmd>bd!<CR>",      { desc = "Delete Buffer"      })
vim.keymap.set("n", "<Tab>",      "<cmd>bnext<CR>",    { desc = "Next Buffer"        })
vim.keymap.set("n", "<C-w>b",     "<cmd>bnext<CR>",    { desc = "Next Buffer"        })
vim.keymap.set("n", "<C-w>B",     "<cmd>bprev<CR>",    { desc = "Previous Buffer"    })

vim.keymap.set("n", "<leader>bn", "<cmd>ene<CR>",      { desc = "New Unnamed Buffer" })



-- Toggle
vim.keymap.set("n", "<leader>tf", "<cmd>set foldmethod=manual<CR>",                   { desc = "Foldmethod"    })
vim.keymap.set("n", "<leader>tw", "<cmd>set wrap!<CR>",                               { desc = "Line wrapping" })
vim.keymap.set("n", "<leader>tc", "<cmd>set cursorcolumn!<CR>",                       { desc = "Cursorcolumn"  })
vim.keymap.set("n", "<leader>tI", "<cmd>set cursorline!<CR>",                         { desc = "Cursorline"    })
vim.keymap.set("n", "<leader>tl", "<cmd>set number!<CR><cmd>set relativenumber!<CR>", { desc = "Line numbers"  })


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
    -- vim.cmd("Lspsaga winbar_toggle")
    ---@diagnostic disable-next-line: undefined-field
    if vim.opt.laststatus._value == 3 then vim.cmd "set laststatus=0" else vim.cmd "set laststatus=3" end

end

-- minimize ui
vim.keymap.set("n", "<leader>tm", toggle_all, { desc = "Minimize UI", silent = true })

-- toggle LSP
vim.keymap.set("n", "<leader>ll", toggle_diagnostics, { desc = "Toggle LSP", silent = true })


-- move lines around -- mini.move!
-- vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { silent = true })
-- vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { silent = true })

vim.keymap.set("n", "<leader>p", [["0p]])

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


vim.keymap.set("n", "<C-z>", "<C-y>", { silent = true })


-- Executing Lua
vim.keymap.set("n", "<leader>X", "<cmd>so %<CR>",   { silent = true, desc = "Execute current file" })
vim.keymap.set("n", "<leader>x", ":.lua<CR>",       { silent = true, desc = "Execute current line" })
vim.keymap.set("v", "<leader>x", ":lua<CR>",        { silent = true, desc = "Execute current visual selection" })

vim.keymap.set("n", "<leader>i", "gg=G''zz",          { silent = true, desc = "Auto-Indent entire file" })

local function augroup(name)
    return vim.api.nvim_create_augroup(name, { clear = true })
end



-- Restore cursor
vim.api.nvim_create_autocmd('BufWinEnter', {
    group   = augroup('restore-cursor'),
    command = [[silent! norm! g`"]]
})

-- Terminal
vim.api.nvim_create_autocmd('TermOpen', {
    group    = augroup('term-open'),
    callback = function()
        vim.opt.number = false
        vim.opt.relativenumber = false
        vim.cmd "startinsert"
    end
})

-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
    group    = augroup('highlight-yank'),
    callback = function()
        vim.highlight.on_yank()
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    group    = augroup('qf-preview'),
    pattern  = { "qf" },
    callback = function(event)
        -- Preview qflist entry like outline.nvim
        vim.keymap.set("n", "o", "<CR><C-w>p", { buffer = event.buf, silent = true })
        -- Close with enter
        vim.keymap.set("n", "<CR>", "<CR><C-w>p<CMD>q<CR>", { buffer = event.buf, silent = true })
    end,
})

-- close some filetypes with q
vim.api.nvim_create_autocmd("FileType", {
    group   = augroup('close-with-q'),
    pattern = {
        "vim", -- C-f in cmd mode
        "oil",
        "help",
        "lspinfo",
        "notify",
        "qf",
        "query",
        "checkhealth",
    },
    callback = function(event)

        if vim.bo.filetype == "vim" then
            vim.keymap.set("n", "q", "<cmd>q<CR>", { buffer = event.buf, silent = true })
        else
            vim.keymap.set("n", "q", "<cmd>bw<CR>", { buffer = event.buf, silent = true })
        end

    end,
})

-- Follow tags in help pages with Return
vim.api.nvim_create_autocmd("FileType", {
    group   = augroup('help-follow-tags'),
    pattern = {
        "help",
    },
    callback = function()
        vim.keymap.set("n", "<CR>", "<C-]>")
    end,
})

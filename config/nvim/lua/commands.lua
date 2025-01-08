-- Goto config directory
vim.api.nvim_create_user_command(
    "GotoConfig",
    function(args)
        local configdir = vim.fn.stdpath("config")
        vim.fn.chdir(configdir);
    end,
    {}
)

-- Delete all buffers except current
vim.api.nvim_create_user_command(
    "DeleteAllBuffersExceptCurrent",
    [[%bd|e#]],
    { bang = false, nargs = "*" }
)

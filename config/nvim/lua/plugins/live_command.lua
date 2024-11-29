return {
    "smjonas/live-command.nvim",
    enabled = true,
    config = function()
        require("live-command").setup({
            commands = {
                Norm = { cmd = "norm" },
            },
        })

        -- Replaces `norm` with `Norm` in command mode
        vim.cmd[[cnoreabbrev norm Norm]]

    end,
}

return {
    "smjonas/live-command.nvim",
    config = function()

        vim.cmd "cnoreabbrev norm Norm"

        require("live-command").setup {
            commands = {
                Norm = { cmd = "norm" },
            },
        }

    end,
}

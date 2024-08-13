return {
    "smjonas/live-command.nvim",
    enabled = true,
    config = function()
        require("live-command").setup({
            commands = {
                Norm = { cmd = "norm" },
            },
        })
    end,
}

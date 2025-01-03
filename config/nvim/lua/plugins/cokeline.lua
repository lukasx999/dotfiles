return {
    "willothy/nvim-cokeline",
    enabled = true,
    dependencies = {
        "nvim-lua/plenary.nvim",        -- Required for v0.4.0+
        "nvim-tree/nvim-web-devicons", -- If you want devicons
        "stevearc/resession.nvim"       -- Optional, for persistent history
    },
    config = function()

        require("cokeline").setup({

            show_if_buffers_are_at_least = 1,

        })

    end,
}

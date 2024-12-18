return {
    "folke/trouble.nvim",
    opts = {}, -- for default options, refer to the configuration section for custom setup.
    cmd = "Trouble",
    keys = {},
    config = function()

        require("trouble").setup({})
        vim.keymap.set("n", "<leader>lt", function()
            require("trouble").toggle()
        end, { desc = "Trouble" })

    end,
}

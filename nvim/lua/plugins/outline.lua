return {
    "hedyhli/outline.nvim",
    dependencies = "onsails/lspkind.nvim",
    config = function()

        vim.keymap.set("n", "<leader>lo", "<cmd>Outline<CR>", { desc = "Toggle Outline" })

        require("outline").setup {

            outline_items = {
                show_symbol_details = true,
                show_symbol_lineno = true,
            },

            outline_window = {
                auto_jump      = false,
                position       = 'right',
                auto_close     = true,
                center_on_jump = true,
            },

            preview_window = {
                auto_preview = false,
            },

            symbols = {
                icon_source = 'lspkind',
            },

        }

    end,
}

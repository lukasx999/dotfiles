return {
    "nvimdev/lspsaga.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
    config = function()
        require("lspsaga").setup({
            -- vim.keymap.set({ "n", "t" }, "<leader>tt", "<cmd>Lspsaga term_toggle<CR>", { desc = "Terminal" }),

            symbol_in_winbar = {  -- alternative to barbecue nvim

                enable = false,
                separator = " › ",
                hide_keyword = false,
                color_mode = true,
                show_file = true,
                folder_level = 1,
                delay = 300,
            },

            -- rename = {
            --     in_select = true,
            --     keys = {
            --         quit = "<esc>",
            --     },
            -- },

            -- code_action = {
            --     num_shortcut = true,
            --     show_server_name = false,
            --     keys = {
            --         quit = "<esc>",
            --     },
            -- },

            -- definition = {
            --     keys = {
            --         quit = "q",
            --     },
            -- },

            hover = {
                max_width = 0.9,
                max_height = 0.8,
            },

            lightbulb = {
                enable = false,
            },


            outline = {
                win_position = "right",
                auto_close = true,
                auto_preview = true,
                detail = true,

                keys = {
                    jump = "<CR>",
                    quit = "q",
                    toggle_or_jump = "o",
                },
            },

            -- beacon = {
            --     border = "single",
            --     frequency = 7,
            --     scroll_down = "<C-f>",
            --     scroll_up = "<C-b>",
            -- },
        })
    end,
}

    return {
        "nvimdev/lspsaga.nvim",
        dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
        config = function()
            require("lspsaga").setup({
                vim.keymap.set({ "n", "t" }, "<leader>tt", "<cmd>Lspsaga term_toggle<CR>", { desc = "Terminal" }),
                vim.keymap.set("n", "<leader>lR", "<cmd>Lspsaga project_replace<CR>", { desc = "Project replace" }),

                symbol_in_winbar = {  -- alternative to barbecue nvim

                    --vim.keymap.set("n", "<leader>te", "<cmd>Lspsaga winbar_toggle<CR>", { desc = "Winbar" }),
                    enable = true,
                    separator = " › ",
                    hide_keyword = false,
                    color_mode = true,
                    show_file = true,
                    folder_level = 1,
                    delay = 300,
                },

                rename = {
                    vim.keymap.set("n", "<leader>lr", "<cmd>Lspsaga rename<CR>", { desc = "Rename" }),
                    in_select = true,
                    keys = {
                        quit = "<esc>",
                    },
                },

                code_action = {
                    vim.keymap.set("n", "<leader>la", "<cmd>Lspsaga code_action<CR>", { desc = "Code actions" }),
                    num_shortcut = true,
                    show_server_name = false,
                    keys = {
                        quit = "<esc>",
                    },
                },

                definition = {
                    vim.keymap.set("n", "<leader>lD", "<cmd>Lspsaga peek_definition<CR>", { desc = "Peek definition" }),
                    vim.keymap.set("n", "<leader>ld", "<cmd>Lspsaga goto_definition<CR>", { desc = "Goto definition" }),
                    --vim.keymap.set( "n", "<leader>lT", "<cmd>Lspsaga peek_type_definition<CR>", { desc = "Peek type definition" }),
                    --vim.keymap.set("n", "<leader>ld", "<cmd>Lspsaga goto_type_definition<CR>", { desc = "Goto type definition" }),
                    keys = {
                        quit = "q",
                    },
                },

                hover = {
                    vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", { desc = "Hover" }),
                    max_width = 0.9,
                    max_height = 0.8,
                },

                lightbulb = {
                    enable = false,
                },

                outline = {
                    vim.keymap.set("n", "<leader>lo", "<cmd>Lspsaga outline<CR>", { desc = "Outline" }),
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

                beacon = {
                    border = "single",
                    frequency = 7,
                    scroll_down = "<C-f>",
                    scroll_up = "<C-b>",
                },
            })
        end,
    }

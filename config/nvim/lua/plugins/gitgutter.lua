    return {

            'airblade/vim-gitgutter',
            config = function()
                vim.keymap.set("n", "<leader>tG", "<cmd>GitGutterToggle<CR>", { desc = "Git Gutter", silent = true })
            end,

    }

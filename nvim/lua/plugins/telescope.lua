return {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
    dependencies = {
        'nvim-telescope/telescope-ui-select.nvim',
        'nvim-lua/plenary.nvim',
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
        { "nvim-tree/nvim-web-devicons", opts = {} },
    },

    config = function()

        local builtin = require('telescope.builtin')
        local actions = require("telescope.actions")

        vim.keymap.set('n', '<leader>ff', builtin.find_files,  { desc = 'Telescope find files'  })
        vim.keymap.set('n', '<C-p>',      builtin.find_files,  { desc = 'Telescope find files'  })
        vim.keymap.set('n', '<leader>fg', builtin.live_grep,   { desc = 'Telescope live grep'   })
        vim.keymap.set('n', '<leader>fo', builtin.oldfiles,    { desc = 'Telescope old files'   })
        vim.keymap.set('n', '<leader>fb', builtin.buffers,     { desc = 'Telescope buffers'     })
        vim.keymap.set('n', '<leader>fh', builtin.help_tags,   { desc = 'Telescope help tags'   })
        vim.keymap.set('n', '<leader>fc', builtin.colorscheme, { desc = 'Telescope colorscheme' })
        vim.keymap.set('n', '<leader>fp', builtin.git_files,   { desc = 'Telescope git files'   })

        require("telescope").setup({

            defaults = require('telescope.themes').get_ivy({

                results_title = false,
                -- preview_title = false,

                -- TODO: show hidden files
                -- hidden = true,

                layout_config = {
                    height = 0.35
                },

                mappings = {
                    i = {
                        -- ["<C-z>"] = action_layout.toggle_preview,
                        -- ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
                        ["<C-f>"] = actions.preview_scrolling_down,
                        ["<C-b>"] = actions.preview_scrolling_up,
                        ["<C-h>"] = { "<c-s-w>", type = "command" }, -- Delete word with Control backspace
                        ["<C-u>"] = false,
                        ["<C-d>"] = false,
                        ["<esc>"] = actions.close,
                    },
                },

            }),

            extensions = {
                fzf = {
                    fuzzy = true,
                    override_generic_sorter = true,
                    override_file_sorter = true,
                    case_mode = "smart_case",
                }
            }



        })

        require('telescope').load_extension('fzf')
        require("telescope").load_extension("ui-select")

    end

}

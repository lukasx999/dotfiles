    return {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.8",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope-ui-select.nvim",
            { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },

        },

        config = function()

            local actions        = require("telescope.actions")
            local builtin        = require("telescope.builtin")
            local extensions     = require("telescope").extensions
            local load_extension = require("telescope").load_extension

            -- local ivy_theme_config = {
            --     theme         = "ivy",
            --     previewer     = true,
            --     layout_config = { height = 0.3 },
            --     preview_title = "",
            --     results_title = "",
            -- },


            vim.keymap.set("n", "<leader>ff",       builtin.find_files,  { desc = "Find files"   })
            vim.keymap.set("n", "<leader>fo",       builtin.oldfiles,    { desc = "Recent files" })
            vim.keymap.set("n", "<leader>fg",       builtin.live_grep,   { desc = "Live grep"    })
            vim.keymap.set("n", "<leader>fs",       builtin.grep_string, { desc = "Grep string"  })
            vim.keymap.set("n", "<leader>fh",       builtin.help_tags,   { desc = "Help tags"    })
            vim.keymap.set("n", "<leader>fc",       builtin.commands,    { desc = "Commands"     })
            vim.keymap.set("n", "<leader>ft",       builtin.colorscheme, { desc = "Set theme"    })
            vim.keymap.set('n', '<leader>fb',       builtin.buffers,     { desc = "buffers"      })
            vim.keymap.set('n', '<leader><leader>', builtin.buffers,     { desc = "buffers"      })

            require("telescope").setup({

                defaults = require('telescope.themes').get_ivy({

                    results_title = "",
                    layout_config = { height = 0.55 },
                    mappings = {
                        i = {
                            ["<C-k>"] = actions.move_selection_previous,
                            ["<C-j>"] = actions.move_selection_next,
                            ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
                            ["<esc>"] = actions.close,
                            ["<C-h>"] = { "<c-s-w>", type = "command" }, -- Delete word with Control backspace
                        },
                    },

                }),

                pickers = {
                    find_files = {
                    },
                    -- find_files = {
                    --     -- `hidden = true` will still show the inside of `.git/` as it's not `.gitignore`d.
                    --     -- find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
                    --     -- path_display = { "smart" }, -- shorten, hidden, tail, absolute, smart, truncate
                    --     -- dynamic_preview_title = false,
                    --
                    --     -- Also find directories, not just files
                    --     find_command  = {"fd", "--type", "f", "--type", "d"},
                    --     theme         = "ivy",
                    --     previewer     = true,
                    --     layout_config = { height = 0.3 }, -- 0.5
                    --     preview_title = "",
                    --     results_title = "",
                    --     wrap_results  = false,
                    --
                    --     hidden    = true,
                    --     border    = true,
                    --     -- prompt_title = "",
                    --
                    -- },
                },

                extensions = {

                    fzf = {},
                    -- fzf = {
                    --     fuzzy = true,                    -- false will only do exact matching
                    --     override_generic_sorter = true,  -- override the generic sorter default: true
                    --     override_file_sorter    = true,  -- override the file sorter default: true
                    --     case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                    --     -- case_mode = "ignore_case",        -- or "ignore_case" or "respect_case"
                    --     -- the default case_mode is "smart_case"
                    -- },

                    -- ["ui-select"] = {
                    --     require("telescope.themes").get_dropdown({ --[[ even more opts]] }),
                    --     -- require("telescope.themes").get_ivy({}),
                    -- },


                },
            })

            load_extension("ui-select")
            load_extension("fzf")

        end,
    }

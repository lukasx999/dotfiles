    return {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.6",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope-ui-select.nvim",
            { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
            {
                "nvim-telescope/telescope-file-browser.nvim",
                dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
            }

        },
        config = function()

            local actions = require("telescope.actions")
            local builtin = require("telescope.builtin")
            local extensions = require("telescope").extensions



            -- local ivy = require('telescope.themes').get_ivy()  -- set ivy theme




            vim.keymap.set("n", "<leader>f", ":", { desc = "telescope" })

            vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
            vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Live grep" })
            vim.keymap.set("n", "<leader>fs", builtin.grep_string, { desc = "Grep string" })
            --vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = "buffers" })

            vim.keymap.set("n", "<leader>bb", builtin.buffers, { desc = "List Buffers" })
            vim.keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "Buffers" })

            vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Help tags" })

            --vim.keymap.set("n", "<leader>fo", "<cmd>Telescope oldfiles<CR>", { desc = "old files" })
            vim.keymap.set("n", "<leader>fo", builtin.oldfiles, { desc = "Recent files" })

            vim.keymap.set("n", "<leader>fc", builtin.commands, { desc = "Commands" })
            vim.keymap.set("n", "<leader>fC", builtin.command_history, { desc = "Command history" })
            vim.keymap.set("n", "<leader>ft", builtin.colorscheme, { desc = "Set theme" })
            vim.keymap.set("n", "<leader>fH", builtin.highlights, { desc = "Highlight groups" })

            vim.keymap.set("n", "<leader>fi", "<cmd>Telescope file_browser<CR>", { desc = "Browse files" })




            require("telescope").setup({
                defaults = {


                    -- Prefixes
                    prompt_prefix = " ",  -- "> "
                    selection_caret = " ",
                    -- entry_prefix = "  ",


                    -- Ignore files bigger than a threshold
                    preview = {
                        filesize_limit = 0.1, -- MB
                    },


                    -- -- cheap dired theme
                    -- layout_strategy = 'bottom_pane',
                    layout_config = {
                        -- preview_cutoff = 10,
                    --     height = 0.4,
                    },
                    -- border = true,
                    -- sorting_strategy = "ascending",





                    mappings = {
                        i = {
                            ["<C-k>"] = actions.move_selection_previous,
                            ["<C-j>"] = actions.move_selection_next,
                            --["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist
                            ["<esc>"] = actions.close, -- close on first esc press
                        },
                    },



                },



                pickers = {


                    find_files = {
                        -- `hidden = true` will still show the inside of `.git/` as it's not `.gitignore`d.
                        -- find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },

                        -- wrap_results = false,
                        -- path_display = { "smart" }, -- shorten, hidden, tail, absolute, smart, truncate

                        -- borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
                        -- dynamic_preview_title = false,


                        theme     = "ivy",
                        previewer = true,
                        layout_config = { height = 0.5 },
                        preview_title = "",
                        results_title = "",

                        hidden    = true,
                        border    = true,

                        -- prompt_title = "",


                    },



                    oldfiles = {
                        theme = "ivy",
                        previewer = true,
                        layout_config = { height = 0.5 },
                        preview_title = "",
                        results_title = "",
                    },

                    live_grep = {
                        theme = "ivy",
                        previewer = true,
                        layout_config = { height = 0.5 },
                        preview_title = "",
                        results_title = "",
                    },

                    marks = {
                        theme = "ivy",
                        previewer = true,
                        layout_config = { height = 0.5 },
                        preview_title = "",
                        results_title = "",
                    },

                    keymaps = {
                        theme = "ivy",
                        previewer = true,
                        layout_config = { height = 0.5 },
                        preview_title = "",
                        results_title = "",
                    },

                    grep_string = {
                        theme = "ivy",
                        previewer = true,
                        layout_config = { height = 0.5 },
                        preview_title = "",
                        results_title = "",
                    },

                    buffers = {
                        theme = "ivy",
                        previewer = true,
                        layout_config = { height = 0.5 },
                        preview_title = "",
                        results_title = "",
                    },

                    help_tags = {
                        theme = "ivy",
                        previewer = true,
                        layout_config = { height = 0.5 },
                        preview_title = "",
                        results_title = "",
                    },

                    commands = {
                        theme = "ivy",
                        previewer = true,
                        layout_config = { height = 0.5 },
                        preview_title = "",
                        results_title = "",
                    },

                    command_history = {
                        theme = "ivy",
                        previewer = true,
                        layout_config = { height = 0.5 },
                        preview_title = "",
                        results_title = "",
                    },

                    colorscheme = {
                        theme = "ivy",
                        previewer = true,
                        layout_config = { height = 0.5 },
                        preview_title = "",
                        results_title = "",
                    },

                    highlights  = {
                        theme = "ivy",
                        previewer = true,
                        layout_config = { height = 0.5 },
                        preview_title = "",
                        results_title = "",
                    },


                },




                extensions = {

                    file_browser = {
                        theme = "ivy",
                        previewer = true,
                        layout_config = { height = 0.5 },
                        preview_title = "",
                        results_title = "",
                    },


                    fzf = {
                        fuzzy = false,                    -- false will only do exact matching
                        override_generic_sorter = true,  -- override the generic sorter default: true
                        override_file_sorter = true,     -- override the file sorter default: true
                        case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                        -- case_mode = "ignore_case",        -- or "ignore_case" or "respect_case"
                        -- the default case_mode is "smart_case"
                    },


                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown({ --[[ even more opts]] }),
                        -- require("telescope.themes").get_ivy({}),
                    },



                },
            })

            require("telescope").load_extension("file_browser")
            require("telescope").load_extension("fzf")
            require("telescope").load_extension("ui-select")
            require("telescope").load_extension("noice")
            --require("telescope").load_extension("harpoon")

        end,
    }

    return {

        {
            'andymass/vim-matchup',  -- Better %
            enabled = true,
            config = function()
                vim.cmd[[let g:matchup_matchparen_enabled = 0]]
            end,
        },

        {
            "nvim-treesitter/nvim-treesitter",
            dependencies = {
                "nvim-treesitter/nvim-treesitter-textobjects",
            },
            --event = "VeryLazy",
            cmd = "TSUpdate",
            config = function()
                --vim.cmd(":silent TSUpdate")
                require("nvim-treesitter.configs").setup({

                    matchup = {
                        enable = true,
                    },

                    ensure_installed = {
                        "c",
                        "cpp",
                        "vim",
                        "vimdoc",
                        "lua",
                        "ini",
                        "json",
                        "arduino",
                        "nix",
                        "vim",
                        "vimdoc",
                        "query",
                        "bash",
                        "css",
                        "asm",
                        "html",
                        "rasi",
                        "markdown",
                        "markdown_inline",
                        "regex",
                    },

                    auto_install = true,

                    highlight = {
                        enable = true,
                        additional_vim_regex_highlighting = true,
                    },

                    incremental_selection = {
                        enable = true,
                        keymaps = {
                            -- Annoying as hell!
                            -- init_selection = '<CR>',
                            -- scope_incremental = '<CR>',
                            -- node_incremental = '<TAB>',
                            -- node_decremental = '<S-TAB>',
                        },
                    },


                    indent = {
                        enable = true,
                    },

                    textobjects = {

                        move = {
                            enable = true,
                            goto_next_start = {
                                ["<leader>mf"] = { query = "@function.outer",    desc = "next function"    },
                                ["<leader>mc"] = { query = "@class.outer",       desc = "next class"       },
                                ["<leader>md"] = { query = "@conditional.outer", desc = "next conditional" },
                                ["<leader>ml"] = { query = "@loop.outer",        desc = "next loop"        },
                            },
                            goto_previous_start = {
                                ["<leader>mF"] = { query = "@function.outer",    desc = "previous function"    },
                                ["<leader>mC"] = { query = "@class.outer",       desc = "previous class"       },
                                ["<leader>mD"] = { query = "@conditional.outer", desc = "previous conditional" },
                                ["<leader>mL"] = { query = "@loop.outer",        desc = "previous loop"        },
                            },
                        },

                        select = {
                            enable = true,

                            -- Automatically jump forward to textobj, similar to targets.vim
                            lookahead = true,

                            keymaps = {
                                ["af"] = { query = "@function.outer",    desc = "outer function"    },
                                ["if"] = { query = "@function.inner",    desc = "inner function"    },
                                ["ac"] = { query = "@class.outer",       desc = "outer class"       },
                                ["ic"] = { query = "@class.inner",       desc = "inner class"       },
                                ["ad"] = { query = "@conditional.outer", desc = "outer conditional" },
                                ["id"] = { query = "@conditional.inner", desc = "inner conditional" },
                                ["al"] = { query = "@loop.outer",        desc = "outer loop"        },
                                ["il"] = { query = "@loop.inner",        desc = "inner loop"        },
                                -- ["ab"] = { query = "@block.outer",       desc = "outer block"       },
                                -- ["ib"] = { query = "@block.inner",       desc = "inner block"       },
                                ["am"] = { query = "@comment.outer",     desc = "outer comment"     },
                                ["im"] = { query = "@comment.inner",     desc = "inner comment"     },
                            },
                            selection_modes = {
                                ["@function.outer"]    = "V",
                                ["@function.inner"]    = "V",
                                ["@class.outer"]       = "V",
                                ["@class.inner"]       = "V",
                                ["@conditional.outer"] = "V",
                                ["@conditional.inner"] = "V",
                                ["@loop.outer"]        = "V",
                                ["@loop.inner"]        = "V",
                                -- ["@block.outer"]        = "V",
                                -- ["@block.inner"]        = "V",
                                ["@comment.outer"]     = "V",
                                ["@comment.inner"]     = "V",
                            },
                            -- If you set this to `true` (default is `false`) then any textobject is
                            -- extended to include preceding or succeeding whitespace. Succeeding
                            -- whitespace has priority in order to act similarly to eg the built-in
                            -- `ap`.

                            --include_surrounding_whitespace = true,
                        },
                    },
                })
            end,
        },




        {
            "windwp/nvim-ts-autotag",  -- auto close html/jsx tags
            config = function()
                require('nvim-ts-autotag').setup({
                    opts = {
                        -- Defaults
                        enable_close = true, -- Auto close tags
                        enable_rename = true, -- Auto rename pairs of tags
                        enable_close_on_slash = false -- Auto close on trailing </
                    },
                    -- Also override individual filetype configs, these take priority.
                    -- Empty by default, useful if one of the "opts" global settings
                    -- doesn't work well in a specific filetype
                    per_filetype = {
                        ["html"] = {
                            enable_close = false
                        }
                    }
                })
            end,
        },


        {
            "nvim-treesitter/nvim-treesitter-context",
            config = function()
                vim.api.nvim_set_hl(0, "TreesitterContextBottom", { bg = "none" })

                vim.keymap.set("n", "<leader>tC", "<cmd>TSContextToggle<CR>", { desc = "Context" })

                vim.keymap.set("n", "<leader>lc", function()
                    require("treesitter-context").go_to_context(vim.v.count1)
                end, { desc = "go to Context", silent = true })

                require("treesitter-context").setup({
                    enable = true,
                    --max_lines = 0,
                    max_lines = 1,
                    multiline_threshold = 20,
                    line_numbers = true,
                    trim_scope = "outer",
                    mode = "cursor",
                })
            end,
        },






    }

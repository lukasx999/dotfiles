    return {



        {
            "0xAdk/full_visual_line.nvim",
            --keys = 'V',
            enabled = false,
            config = function()
                require("full_visual_line").setup({})
            end,
        },



        {
            "RRethy/vim-illuminate",
            enabled = false,
            config = function()


                vim.keymap.set("n", "<leader>tI", "<cmd>IlluminateToggle<CR>", { desc = "Illuminate" })


                -- default configuration
                require('illuminate').configure({
                    -- providers: provider used to get references in the buffer, ordered by priority
                    providers = {
                        'lsp',
                        'treesitter',
                        'regex',
                    },
                    -- delay: delay in milliseconds

                    --delay = 100,
                    delay = 120,
                    --delay = 0,

                    -- filetype_overrides: filetype specific overrides.
                    -- The keys are strings to represent the filetype while the values are tables that
                    -- supports the same keys passed to .configure except for filetypes_denylist and filetypes_allowlist
                    filetype_overrides = {},
                    -- filetypes_denylist: filetypes to not illuminate, this overrides filetypes_allowlist
                    filetypes_denylist = {
                        'dirbuf',
                        'dirvish',
                        'fugitive',
                        "oil",

                        "alpha",
                        "NvimTree",
                        "lazy",
                        "neogitstatus",
                        "Trouble",
                        "lir",
                        "Outline",
                        "spectre_panel",
                        "toggleterm",
                        "DressingSelect",
                        "TelescopePrompt",
                    },

                    -- under_cursor: whether or not to illuminate under the cursor
                    under_cursor = true,

                    -- case_insensitive_regex: sets regex case sensitivity
                    case_insensitive_regex = false,

                })


            end,
        },



        {
            "xiyaowong/transparent.nvim",
            enabled = false;
            config = function()
                vim.keymap.set("n", "<leader>tT", "<cmd>TransparentToggle<CR>", { desc = "Transparency" })

                require('transparent').clear_prefix('BufferLine')
                require('transparent').clear_prefix('NeoTree')
                --require('transparent').clear_prefix('lualine')

                require("transparent").setup({ -- Optional, you don't have to run setup.
                    groups = { -- table: default groups
                        'Normal', 'NormalNC', 'Comment', 'Constant', 'Special', 'Identifier',
                        'Statement', 'PreProc', 'Type', 'Underlined', 'Todo', 'String', 'Function',
                        'Conditional', 'Repeat', 'Operator', 'Structure', 'LineNr', 'NonText',
                        'SignColumn', 'CursorLine', 'CursorLineNr', 'StatusLine', 'StatusLineNC',
                        'EndOfBuffer',
                    },
                    extra_groups = {'BufferLineFill', 'NeoTreeNormal', 'TreesitterContextBottom', 'TreesitterContext', 'TreesitterContextLineNumber' ,'barbecue_normal', 'barbecue_context', 'barbecue_separator', 'barbecue_context_field', 'barbecue_context_key'}, -- table: additional groups that should be cleared
                    exclude_groups = {'CursorLine'}, -- table: groups you don't want to clear
                })
            end,
        },






    }

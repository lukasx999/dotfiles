    return {



        {
            "0xAdk/full_visual_line.nvim",
            --keys = 'V',
            config = function()
                require("full_visual_line").setup({})
            end,
        },



        -- {
        --     "DanilaMihailov/beacon.nvim",
        --     config = function()
        --         vim.keymap.set("n", "<leader>tb", "<cmd>BeaconToggle<CR>", { desc = "Beacon" })
        --     end,
        -- },




        -- {
        --     "stevearc/dressing.nvim",
        --     opts = {},
        --     config = function()
        --         require("dressing").setup({
        --             backend = { "telescope", "fzf_lua", "fzf", "builtin", "nui" },
        --         })
        --     end,
        -- },





        {
            "RRethy/vim-illuminate",
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




        -- {
        --     'gen740/SmoothCursor.nvim',
        --     config = function()
        --         vim.keymap.set("n", "<leader>ts", "<cmd>SmoothCursorToggle<CR>", { desc = "Smooth Cursor" })
        --         require('smoothcursor').setup({
        --             type = "default",           -- Cursor movement calculation method, choose "default", "exp" (exponential) or "matrix".
        --             -- type = "matrix",
        --
        --             cursor = "",              -- Cursor shape (requires Nerd Font). Disabled in fancy mode.
        --             texthl = "SmoothCursor",   -- Highlight group. Default is { bg = nil, fg = "#FFD400" }. Disabled in fancy mode.
        --             linehl = nil,              -- Highlights the line under the cursor, similar to 'cursorline'. "CursorLine" is recommended. Disabled in fancy mode.
        --
        --             fancy = {
        --                 enable = true,        -- enable fancy mode
        --                 --head = { cursor = "▷", texthl = "SmoothCursor", linehl = nil }, -- false to disable fancy head
        --                 head = { cursor = "▷", texthl = "SmoothCursorAqua", linehl = nil }, -- false to disable fancy head
        --                 body = {
        --                     -- SmoothCursorWhite
        --                     -- { cursor = "󰝥", texthl = "SmoothCursorRed" },
        --                     -- { cursor = "󰝥", texthl = "SmoothCursorOrange" },
        --                     -- { cursor = "●", texthl = "SmoothCursorYellow" },
        --                     -- { cursor = "●", texthl = "SmoothCursorGreen" },
        --                     -- { cursor = "•", texthl = "SmoothCursorAqua" },
        --                     -- { cursor = ".", texthl = "SmoothCursorBlue" },
        --                     -- { cursor = ".", texthl = "SmoothCursorPurple" },
        --
        --                     { cursor = "󰝥", texthl = "SmoothCursorWhite" },
        --                     { cursor = "󰝥", texthl = "SmoothCursorWhite" },
        --                     { cursor = "●", texthl = "SmoothCursorWhite" },
        --                     { cursor = "●", texthl = "SmoothCursorWhite" },
        --                     { cursor = "•", texthl = "SmoothCursorWhite" },
        --                     { cursor = ".", texthl = "SmoothCursorWhite" },
        --                     { cursor = ".", texthl = "SmoothCursorWhite" },
        --                 },
        --                 tail = { cursor = nil, texthl = "SmoothCursor" } -- false to disable fancy tail
        --             },
        --
        --             matrix = {  -- Loaded when 'type' is set to "matrix"
        --                 head = {
        --                     -- Picks a random character from this list for the cursor text
        --                     cursor = require('smoothcursor.matrix_chars'),
        --                     -- Picks a random highlight from this list for the cursor text
        --                     texthl = {
        --                         'SmoothCursor',
        --                     },
        --                     linehl = nil,  -- No line highlight for the head
        --                 },
        --                 body = {
        --                     length = 6,  -- Specifies the length of the cursor body
        --                     -- Picks a random character from this list for the cursor body text
        --                     cursor = require('smoothcursor.matrix_chars'),
        --                     -- Picks a random highlight from this list for each segment of the cursor body
        --                     texthl = {
        --                         'SmoothCursorGreen',
        --                     },
        --                 },
        --                 tail = {
        --                     -- Picks a random character from this list for the cursor tail (if any)
        --                     cursor = nil,
        --                     -- Picks a random highlight from this list for the cursor tail
        --                     texthl = {
        --                         'SmoothCursor',
        --                     },
        --                 },
        --                 unstop = false,  -- Determines if the cursor should stop or not (false means it will stop)
        --             },
        --
        --             autostart = true,           -- Automatically start SmoothCursor
        --             always_redraw = true,       -- Redraw the screen on each update
        --             flyin_effect = nil,         -- Choose "bottom" or "top" for flying effect
        --             speed = 25,                 -- Max speed is 100 to stick with your current position
        --             intervals = 35,             -- Update intervals in milliseconds
        --             priority = 10,              -- Set marker priority
        --             timeout = 3000,             -- Timeout for animations in milliseconds
        --             threshold = 3,              -- Animate only if cursor moves more than this many lines
        --             max_threshold = nil,         -- If you move more than this many lines, don't animate (if `nil`, deactivate check)
        --             disable_float_win = false,  -- Disable in floating windows
        --             enabled_filetypes = nil,    -- Enable only for specific file types, e.g., { "lua", "vim" }
        --             disabled_filetypes = nil,   -- Disable for these file types, ignored if enabled_filetypes is set. e.g., { "TelescopePrompt", "NvimTree" }
        --             -- Show the position of the latest input mode positions. 
        --             -- A value of "enter" means the position will be updated when entering the mode.
        --             -- A value of "leave" means the position will be updated when leaving the mode.
        --             -- `nil` = disabled
        --             show_last_positions = nil,
        --         })
        --
        --     end
        -- },






    }

    return {


        {
            'numToStr/Comment.nvim',
            opts = {},
            lazy = false,
            config = function()
                require('Comment').setup({
                    padding = true,
                    sticky = true,
                    ignore = nil,
                    toggler = {
                        line = 'gcc',
                        block = 'gbc',
                    },
                    opleader = {
                        line = 'gc',
                        block = 'gb',
                    },
                    extra = {
                        above = 'gcO',
                        below = 'gco',
                        eol = 'gcA',
                    },
                    mappings = {
                        basic = true,
                        extra = true,
                    },
                    pre_hook = nil,
                    post_hook = nil,
                })
            end,
        },




        {
            "windwp/nvim-autopairs",
            event = "InsertEnter",
            config = function()
                -- nvim cmp integration
                -- If you want insert `(` after select function or method item
                local cmp_autopairs = require("nvim-autopairs.completion.cmp")
                local cmp = require("cmp")
                cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())



                -- Use Treesitter to check for pairs
                local npairs = require("nvim-autopairs")
                local Rule = require('nvim-autopairs.rule')

                npairs.setup({
                    check_ts = true,
                    ts_config = {
                        lua = {'string'},-- it will not add a pair on that treesitter node
                        javascript = {'template_string'},
                        java = false,-- don't check treesitter on java
                    }
                })

                local ts_conds = require('nvim-autopairs.ts-conds')


                -- press % => %% only while inside a comment or string
                npairs.add_rules({
                    Rule("%", "%", "lua")
                        :with_pair(ts_conds.is_ts_node({'string','comment'})),
                    Rule("$", "$", "lua")
                        :with_pair(ts_conds.is_not_ts_node({'function'}))
                })











                
                require("nvim-autopairs").setup({
                    -- Settings
                    disable_filetype = { "TelescopePrompt", "vim" },
                    disable_in_macro = true,  -- disable when recording or executing a macro
                    disable_in_visualblock = false, -- disable when insert after visual block mode
                    disable_in_replace_mode = true,
                    ignored_next_char = [=[[%w%%%'%[%"%.%`%$]]=],
                    enable_moveright = true,
                    enable_afterquote = true,  -- add bracket pairs after quote
                    enable_check_bracket_line = true,  --- check bracket in same line
                    enable_bracket_in_quote = true,
                    enable_abbr = false, -- trigger abbreviation
                    break_undo = true, -- switch for basic rule break undo sequence
                    check_ts = false,
                    map_cr = true,
                    map_bs = true,  -- map the <BS> key
                    map_c_h = false,  -- Map the, <C-h> key to delete a pair
                    map_c_w = false, -- map <c-w> to delete a pair if possible






                })
            end,
        },




        {
        "nat-418/boole.nvim",
        config = function()
            require("boole").setup({
                mappings = {
                    increment = "<C-a>",
                    decrement = "<C-x>",
                },
                -- User defined loops
                additions = {

                },
                allow_caps_additions = {
                    { "foo", "bar", "baz", "qux", "quux" },
                    { "tic", "tac", "toe" },
                    { "up", "down" },
                    { "x", "y" },
                    { "width", "height" },
                    { "left", "right" },
                    { "top", "bottom" },
                    { "zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine", "ten" },

                    --{ "enable", "disable" },
                    -- enable → disable
                    -- Enable → Disable
                    -- ENABLE → DISABLE
                },
            })
        end,
        },



    }

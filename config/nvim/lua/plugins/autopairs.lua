return {
    "windwp/nvim-autopairs",
    enabled = false,
    event = "InsertEnter",
    config = function()
        -- nvim cmp integration
        -- If you want insert `(` after select function or method item
        local cmp_autopairs = require("nvim-autopairs.completion.cmp")
        local cmp = require("cmp")
        cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

        local ts_conds = require('nvim-autopairs.ts-conds')
        local Rule = require("nvim-autopairs.rule")
        local npairs = require("nvim-autopairs")

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
            check_ts = true,  -- treesitter
            map_cr = true,
            map_bs = true,  -- map the <BS> key
            map_c_h = false,  -- Map the, <C-h> key to delete a pair
            map_c_w = false, -- map <c-w> to delete a pair if possible
        })


        -- Custom pairs
        npairs.add_rules({
            -- Rule("/", "/", {"javascriptreact", "javascript", "typescript", "typescriptreact"}),
            -- Rule("<", ">", {"javascriptreact", "typescriptreact"}),
            -- Rule("<", ">", {"cpp"}),
            Rule("*", "*", {"markdown"}),
            Rule("_", "_", {"markdown"}),
            -- Rule("/*", "*/", {"cpp", "c", "javascript", "javascriptreact"}),
        })

    end,
}

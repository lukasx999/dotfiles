return {
    "hedyhli/outline.nvim",
    lazy = true,
    cmd = { "Outline", "OutlineOpen" },
    keys = {
          { "<leader>lo", "<cmd>Outline<CR>", desc = "Toggle code outline" },
      },
    opts = {},

    config = function()
        require("outline").setup({

            -- Blend cursor in with cursorline
            -- outline_window = {
            --     show_cursorline = true,
            --     hide_cursor = true,
            -- },

            -- Hide extra info to the right (after symbol name)
            outline_items = {
                show_symbol_details = false,
            },

            preview_window = {
                auto_preview = false,
                live = true,  -- press K again to jump into window and edit
            },

            outline_window = {
                auto_jump = false,  -- auto jump to code (live)
                position = 'right',
                auto_close = false,  -- auto close when jumped with <cr>
                center_on_jump = true,
            },

            symbols = {
                -- Include all except String and Constant:
                --   filter = { 'String', 'Constant', exclude = true }
                -- Only include Package, Module, and Function:
                --   filter = { 'Package', 'Module', 'Function' }
                -- See more examples below.
                filter = nil,

                -- 3rd party source for fetching icons. This is used as a fallback if
                -- icon_fetcher returned an empty string.
                -- Currently supported values: 'lspkind'
                icon_source = 'lspkind',  -- default: nil
            },


            keymaps = {
                show_help = '?',
                close = {'<Esc>', 'q'},
                goto_location = '<Cr>',
                -- Jump to symbol under cursor but keep focus on outline window.
                peek_location = 'o',
                -- Visit location in code and close outline immediately
                goto_and_close = '<S-Cr>',
                -- Change cursor position of outline window to match current location in code.
                -- 'Opposite' of goto/peek_location.
                restore_location = '<C-g>',
                -- Open LSP/provider-dependent symbol hover information
                hover_symbol = '<C-space>',
                -- Preview location code of the symbol under cursor
                toggle_preview = 'K',

                -- These fold actions are collapsing tree nodes, not code folding
                fold = 'h',
                unfold = 'l',
                fold_toggle = '<Tab>',
                -- Toggle folds for all nodes.
                fold_toggle_all = '<S-Tab>',
                fold_all = 'W',
                unfold_all = 'E',
                fold_reset = 'R',

                -- Temporary auto jump
                down_and_jump = '<C-j>',
                up_and_jump = '<C-k>',
            },


        })

    end,

}

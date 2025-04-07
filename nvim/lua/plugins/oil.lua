return {
    'stevearc/oil.nvim',
    lazy = false,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()

        vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })


        -- for colored permissions
        local permission_hlgroups = {
            ['-'] = 'NonText',
            ['r'] = 'DiagnosticSignWarn',
            ['w'] = 'DiagnosticSignError',
            ['x'] = 'DiagnosticSignOk',
            ['s'] = '@boolean', -- Setuid
            ['t'] = '@boolean', -- Sticky bit
        }

        local columns_config = {
            -- TODO: link
            -- { "type", icons = { file = "-", directory = "d", fifo = '|' }, highlight = "Special" },
            { "type" },
            {
                "permissions",
                highlight = function(permission_str)
                    local hls = {}
                    for i = 1, #permission_str do
                        local char = permission_str:sub(i, i)
                        table.insert(hls, { permission_hlgroups[char], i - 1, i })
                    end
                    return hls
                end,
            },
            { "size",  highlight = "Special" },
            { "mtime", highlight = "Number"  },
            { "icon", add_padding = false, },
        }


        require("oil").setup {
            columns = columns_config,
            constrain_cursor = "name",  -- editable
            experimental_watch_for_changes = true,
            use_default_keymaps = true,

            keymaps = {
                ["_"] = false,
                ["<C-p>"] = false,
                ["<C-i>"] = "actions.preview",
            },

            win_options = {
                colorcolumn = "0",
            },

        }

    end

}

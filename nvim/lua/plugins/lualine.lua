return {
    'nvim-lualine/lualine.nvim',
    enabled = true,
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()

        require('lualine').setup {
            options = {
                icons_enabled = true,
                theme = 'auto',
                globalstatus = true,
                -- component_separators = { left = '', right = ''},
                -- section_separators = { left = '', right = ''},
                component_separators = { left = '', right = ''},
                section_separators = { left = '', right = ''},
            },


            sections = {
                lualine_a = {
                    {
                        'mode',
                        fmt = function(str)
                            return str:sub(1, 3):lower()
                        end,
                    },
                },

                lualine_b = { 'branch', 'diff', 'diagnostics' },
                lualine_c = { 'filename', 'filesize' },
                lualine_x = { 'filetype'  },
                lualine_y = { 'selectioncount', 'progress' },
                lualine_z = { 'location' }
            },

            extensions = {
                'quickfix',
                'oil',
                'lazy',
                'man',
                'mason',
                'symbols-outline',
            },


        }

    end
}

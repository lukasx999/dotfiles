return {
    'nvim-lualine/lualine.nvim',
    enabled = true,
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()

        local function linecount()
            local loc = vim.api.nvim_buf_line_count(0)
            return loc
        end

        require'lualine'.setup {
            options = {
                icons_enabled = true,
                theme = 'auto',
                globalstatus = true,
                -- component_separators = { left = '', right = ''},
                -- section_separators = { left = '', right = ''},
                component_separators = { left = '', right = '' },
                section_separators   = { left = '', right = '' },
            },

            sections = {
                lualine_a = {
                    {
                        'mode',
                        fmt = function(str)
                            return str:sub(1, 1):lower()
                        end,
                    },
                },

                -- lualine_b = { 'branch', 'diff', 'diagnostics' },
                lualine_b = { },
                -- lualine_c = { 'filename', 'filesize' },
                lualine_c = { 'filename' },
                lualine_x = { 'filetype' },
                -- lualine_y = { 'selectioncount', 'progress' },
                lualine_y = { 'selectioncount', linecount },
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

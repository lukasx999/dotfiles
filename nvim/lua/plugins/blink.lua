return {
    'saghen/blink.cmp',
    -- dependencies = 'rafamadriz/friendly-snippets',
    version = '*',
    opts = {
        keymap = {
            preset = 'default',
            ['<C-z>'] = { 'select_and_accept' },
        },


        appearance = {
            use_nvim_cmp_as_default = true,
            nerd_font_variant = 'mono'
        },

        sources = {
            default = { 'lsp', 'path', 'snippets', 'buffer' },
            cmdline = {}, -- disable cmdline completion
        },

        completion = {
            documentation = {
                auto_show = true,
            },

            ghost_text = {
                enabled = true,
            },
        },

        signature = { enabled = true }

    },
    opts_extend = { "sources.default" }
}

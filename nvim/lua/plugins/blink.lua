return {
    'saghen/blink.cmp',
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

        cmdline = { enabled = false },

        sources = {
            default = { 'lsp', 'path', 'buffer' },
        },

        completion = {
            accept = {
                auto_brackets = {
                    enabled = false,

                    semantic_token_resolution = {
                        enabled = false,
                    }

                },
            },

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

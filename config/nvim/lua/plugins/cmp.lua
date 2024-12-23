return {
    'saghen/blink.cmp',
    lazy = false,
    dependencies = 'rafamadriz/friendly-snippets',
    version = '*',

    opts = {

        keymap = {
            preset = 'default',

            ['<C-space>'] = { 'show', 'show_documentation', 'hide_documentation' },
            ['<C-e>']     = { 'hide' },
            ['<C-y>']     = { 'select_and_accept' },
            ['<C-z>']     = { 'select_and_accept' },

            ['<C-p>']     = { 'select_prev', 'fallback' },
            ['<C-n>']     = { 'select_next', 'fallback' },

            ['<C-b>']     = { 'scroll_documentation_up',   'fallback' },
            ['<C-f>']     = { 'scroll_documentation_down', 'fallback' },

            ['<Tab>']     = { 'snippet_forward',  'fallback' },
            ['<S-Tab>']   = { 'snippet_backward', 'fallback' },
        },



        list = {
            max_items = 200,
            selection = 'preselect',
            cycle = {
                from_bottom = true,
                from_top = true,
            },
        },


        completion = {

            menu = {
                min_width  = 15,
                max_height = 10,
                border     = 'none',
                winblend   = 5, -- 0 is fully opaque
                scrolloff  = 2,
                scrollbar  = true,

                draw = {
                    padding    = 1,
                    gap        = 1,
                    treesitter = { 'lsp' },
                    columns    = { { 'kind_icon' }, { 'label', 'label_description', gap = 1 } },
                },
            },

            documentation = {
                auto_show = true,
            },

            ghost_text = {
                enabled = true,
            },

        },

        appearance = {
            use_nvim_cmp_as_default = true,
            nerd_font_variant       = 'mono'
        },

        sources = {
            default = { 'lsp', 'path', 'snippets', 'buffer' },
            cmdline = {},
        },

        signature = { enabled = true }
    },

}





--[[
    return {

    {
    "L3MON4D3/LuaSnip",
    -- follow latest release.
    version = "v2.*",     -- Replace <CurrentMajor> by the latest released major (first number of latest release)
    -- install jsregexp (optional!).
    build = "make install_jsregexp",
    dependencies = { "rafamadriz/friendly-snippets" },
    },


    {
    "hrsh7th/nvim-cmp",
    dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "saadparwaiz1/cmp_luasnip",
    "onsails/lspkind.nvim",     -- vs-code like pictograms

    "ray-x/cmp-treesitter",

    "hrsh7th/cmp-nvim-lsp-signature-help",

    "hrsh7th/cmp-nvim-lsp-document-symbol",

    -- "hrsh7th/cmp-emoji",
    -- "hrsh7th/cmp-calc",
    -- "SergioRibera/cmp-dotenv",
    -- "dmitmel/cmp-cmdline-history",

    -- 'andersevenrud/cmp-tmux',
    -- 'tamago324/cmp-zsh',
    -- 'Shougo/deol.nvim',

    -- otter.nvim for embedded languages (eg: markdown)
    },
    --event = "InsertEnter",
    config = function()
    local cmp     = require("cmp")
    local lspkind = require("lspkind")
    local luasnip = require("luasnip")

    -- loads vscode style snippets from installed plugins (e.g. friendly-snippets)
    require("luasnip.loaders.from_vscode").lazy_load()

    cmp.setup({

    -- dont automatically select the first item
    preselect = cmp.PreselectMode.None,

    view = {
    -- entries = "custom" -- can be "custom", "wildmenu" or "native"
    entries = {
    name = "custom",
    follow_cursor = true,
    },
    docs = {
    -- auto_open = false,
    }
    },


    experimental = {
    ghost_text = true,
    },

    -- completion = {
    --     autocomplete = false
    -- },


    snippet = {
    expand = function(args)
    luasnip.lsp_expand(args.body)
    end,
    },


    window = {
    --completion = cmp.config.window.bordered(),
    completion = cmp.config.window.bordered({
    scrollbar = false,
    scrolloff = 3,
    -- side_padding = 15,
    -- max_width
    -- max_height
    -- col_offset -- offsets window to the cursor
    -- scrolloff
    -- winblend
    -- border -- (table)
    }),

    documentation = cmp.config.window.bordered({
    -- scrollbar = true,
    }),
    -- documentation = false,
    },

    -- override for simple ui
    window = {
    completion = {
    scrollbar = false,
    scrolloff = 3,
    -- side_padding = 1,
    },
    },



    mapping = cmp.mapping.preset.insert({
    ["<C-k>"] = cmp.mapping.select_prev_item(),       -- previous suggestion
    ["<C-j>"] = cmp.mapping.select_next_item(),       -- next suggestion

    ["<Tab>"] = cmp.mapping.select_next_item(),       -- next suggestion
    ["<S-Tab>"] = cmp.mapping.select_prev_item(),     -- previous suggestion

    -- ["<C-b>"] = cmp.mapping.open_docs(),
    -- ["<C-b>"] = cmp.mapping.close_docs(),
    -- ["<C-b>"] = cmp.mapping.complete_common_string(),

    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),

    ["<C-e>"] = cmp.mapping.abort(),
    ["<C-y>"] = cmp.mapping.confirm({ select = true }),     -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.

    ["<C-Space>"] = cmp.mapping.complete(),  -- Open completion window
    ["<C-c>"] = cmp.mapping.abort(),  -- old: "<Esc>"


    ["<CR>"] = cmp.mapping.confirm({ select = false }),     -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    -- ["<C-CR>"] = cmp.mapping.confirm({ select = true }),     -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    -- ["<C-Space>"] = cmp.mapping.confirm({ select = true }),     -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.

    -- ['<C-g>'] = function()
    --     if cmp.visible_docs() then
    --         cmp.close_docs()
    --     else
    --         cmp.open_docs()
    --     end
    -- end



    }),
    sources = cmp.config.sources({
    { name = "nvim_lsp" },
    { name = "path" },
    { name = "luasnip" },
    { name = "buffer" },
    { name = "treesitter" },
    { name = "nvim_lsp_signature_help" },
    }),

    formatting = {
    format = lspkind.cmp_format({
    -- mode = "symbol_text",     -- text_symbol, symbol, text, symbol_text
    mode = "symbol",     -- text_symbol, symbol, text, symbol_text
    preset = "default",       -- codicons, default

    maxwidth = 25,  -- default: 50

    ellipsis_char = "...",
    show_labelDetails = true,
    menu = {
    buffer = "[Buf]",
    nvim_lsp = "[LSP]",
    luasnip = "[LSnip]",
    nvim_lua = "[Lua]",
    latex_symbols = "[LaTeX]",
    treesitter = "[TS]",
    },
    }),
    },


    })

    -- Set configuration for specific filetype.
    cmp.setup.filetype("gitcommit", {
    sources = cmp.config.sources({
    { name = "git" },     -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
    { name = "buffer" },
    }),
    })

    -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
    cmp.setup.cmdline({ "/", "?" }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
    { name = 'nvim_lsp_document_symbol' },
    { name = "buffer" },
    }),
    })




    -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
    cmp.setup.cmdline(":", {
    mapping = cmp.mapping.preset.cmdline(),

    sources = cmp.config.sources({
    { name = "path" },
    { name = "cmdline" },
    --{ name = "cmdline_history" },

    --{ name = "calc" },
    --{ name = "zsh" },
    }),
    matching = { disallow_symbol_nonprefix_matching = false },
    })




    -- Gleiches Diagnosefenster auf cmp.config.window.bordered() setzen
    -- vim.cmd(':set winhighlight=' .. cmp.config.window.bordered().winhighlight)





    end,
    },



    }
    ]]

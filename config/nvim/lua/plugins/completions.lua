    return {


        {
            "L3MON4D3/LuaSnip",
            -- follow latest release.
            version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
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
                "onsails/lspkind.nvim", -- vs-code like pictograms

                "hrsh7th/cmp-calc",
                "ray-x/cmp-treesitter",
                "SergioRibera/cmp-dotenv",

                "dmitmel/cmp-cmdline-history",

                'andersevenrud/cmp-tmux',
                'tamago324/cmp-zsh',
                'Shougo/deol.nvim',

                -- otter.nvim for embedded languages (eg: markdown)
            },
            --event = "InsertEnter",
            config = function()
                local cmp = require("cmp")
                local lspkind = require("lspkind")
                local luasnip = require("luasnip")

                -- loads vscode style snippets from installed plugins (e.g. friendly-snippets)
                require("luasnip.loaders.from_vscode").lazy_load()

                cmp.setup({
                    snippet = {
                        expand = function(args)
                            luasnip.lsp_expand(args.body)
                        end,
                    },
                    window = {
                        --completion = cmp.config.window.bordered(),
                        completion = cmp.config.window.bordered({
                            scrollbar = false,
                        }),

                        documentation = cmp.config.window.bordered(),
                        -- documentation = false,
                    },

                    mapping = cmp.mapping.preset.insert({
                        ["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
                        ["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion

                        ["<Tab>"] = cmp.mapping.select_next_item(), -- next suggestion
                        ["<S-Tab>"] = cmp.mapping.select_prev_item(), -- previous suggestion

                        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                        ["<C-f>"] = cmp.mapping.scroll_docs(4),

                        ["<C-e>"] = cmp.mapping.abort(),
                        ["<C-y>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.

                        ["<C-Space>"] = cmp.mapping.complete(),
                        ["<C-c>"] = cmp.mapping.abort(),

                        --["<Esc>"] = cmp.mapping.abort(),

                        ["<CR>"] = cmp.mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.

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
                        -- { name = "calc" },
                        -- { name = "dotenv" },
                    }),
                    formatting = {
                        format = lspkind.cmp_format({
                            mode = "symbol_text", -- text_symbol, symbol, text, symbol_text
                            preset = "default",   -- codicons, default

                            --maxwidth = 50,
                            maxwidth = 25,

                            ellipsis_char = "...",
                            show_labelDetails = true,
                            menu = {
                                buffer = "[Buffer]",
                                nvim_lsp = "[LSP]",
                                luasnip = "[LuaSnip]",
                                nvim_lua = "[Lua]",
                                latex_symbols = "[Latex]",

                                calc = "[Calc]",
                                treesitter = "[Treesitter]",
                                dotenv = "[Dotenv]",
                            },
                        }),
                    },
                })

                -- Set configuration for specific filetype.
                cmp.setup.filetype("gitcommit", {
                    sources = cmp.config.sources({
                        { name = "git" }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
                        { name = "buffer" },
                    }),
                })

                -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
                cmp.setup.cmdline({ "/", "?" }, {
                    mapping = cmp.mapping.preset.cmdline(),
                    sources = {
                        { name = "buffer" },
                    },
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
            end,
        },



    }

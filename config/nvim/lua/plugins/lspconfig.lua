

local lsp = vim.lsp.buf
local tele = require("telescope.builtin")
local map = vim.keymap.set

    return {
        ------------------------------------------------------------------------
        -- Keymaps
        {

            --[[ Not used


            -- Inferior to outline.nvim
            map("n", "<leader>lo", "<cmd>Lspsaga outline<CR>",                  { desc = "Outline"                       }),


            -- Lists all symbols - Does the same as outline.nvim
            map("n", "<leader>lS", tele.lsp_document_symbols,                   { desc = "List all symbols"              }),


            -- Puts all symbols into a quickfix list - Does the same as outline.nvim
            map("n", "<leader>ls", lsp.document_symbol,                         { desc = "List all symbols"              }),


            -- Puts all occurances of current symbol in quickfix list - No preview
            map("n", "<leader>lR", lsp.references,                   { desc = "References of symbol"          }),


            -- Goto definition, if theres more than one, open list in telescope
            -- Doesnt really work? What the hell?
            map('n', '<leader>lx', tele.lsp_type_definitions,                { desc = 'references'                    }),
            map('n', '<leader>le', tele.lsp_definitions,                     { desc = 'goto definition'               }),


            -- Doesnt work (No diagnostics found)
            map("n", "<leader>lx", tele.diagnostics,                         { desc = "diagnostics"                   }),

            -- Doesnt work (not supported by current server (Python))
            map( "n", "<leader>li", tele.lsp_implementations,                { desc = "Implementations"               }),


            -- Opens popup
            map("n", "<leader>lr", "<cmd>Lspsaga rename<CR>",                { desc = "Rename"                        }),

            -- Opens popup (kinda broken ui)
            map("n", "<leader>lA", "<cmd>Lspsaga code_action<CR>",           { desc = "Code actions"                  }),

            -- Doesnt work?
            map("n", "<leader>lx", "<cmd>Lspsaga project_replace<CR>",       { desc = "Project replace"               }),

            -- Dont need it
            map("n", "<leader>te", "<cmd>Lspsaga winbar_toggle<CR>",         { desc = "Winbar"                        }),

            -- Currently using Lspsaga version
            map("n", "<leader>ld", lsp.definition,                           { desc = "Goto Definition"               }),
            map("n", "<leader>lT", lsp.type_definition,                      { desc = "Goto type definition"          }),

            -- Crashes (On Python project)
            map("n", "<leader>lD", tele.lsp_dynamic_workspace_symbols,       { desc = "List all symbols in workspace" }),


            ]]


            -- General
            map("n", "<leader>lr", lsp.rename,                              { desc = "Rename symbol"                 }),
            map("n", "<leader>lf", lsp.format,                              { desc = "Format buffer"                 }),
            map("n", "<leader>la", lsp.code_action,                         { desc = "Code action"                   }),

            -- Goto
            -- Will open popup for every definition
            map("n", "<leader>ld", "<cmd>Lspsaga goto_definition<CR>",      { desc = "Goto definition"               }),
            map("n", "<leader>lT", "<cmd>Lspsaga goto_type_definition<CR>", { desc = "Goto type definition"          }),

            -- Shows symbols in all files of workspace
            map('n', '<leader>ls', tele.lsp_workspace_symbols,              { desc = 'List workspace symbols'        }),

            -- Show all occurances of current symbol
            map("n", "<leader>lR", lsp.references,                          { desc = "References of symbol"          }),
            -- map('n', '<leader>lR', tele.lsp_references,                     { desc = 'Show References of symbol'     }),


            -- Peek
            -- map("n", "K",          "<cmd>Lspsaga hover_doc<CR>",            { desc = "Hover"                         }),
            map("n", "K",          lsp.hover,                               { desc = "Hover"                         }),
            map("n", "<leader>lp", "<cmd>Lspsaga peek_definition<CR>",      { desc = "Peek definition"               }),
            map("n", "<leader>lP", "<cmd>Lspsaga peek_type_definition<CR>", { desc = "Peek type definition"          }),
        },




        {
        "neovim/nvim-lspconfig",
        config = function()
            local icons = {
                hint = "󰌶 ",
                warn = "󰀪 ",
                error = "󰅚 ",
                info = " ",
            }

            -- icons in sign column
            -- local signs = { Error = icons['error'], Warn = icons['warn'], Hint = icons['hint'], Info = icons['info'] }
            -- for type, icon in pairs(signs) do
            --     local hl = "DiagnosticSign" .. type
            --     vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
            -- end


            local lspconfig = require("lspconfig")

            -- lspconfig.clangd.setup({
            --     cmd = {
            --         "clangd",
            --         "--background-index",
            --         "--suggest-missing-includes",
            --         "--clang-tidy",
            --         "-Wall",
            --         "--header-insertion=iwyu"
            --     },
            --     -- on_init = custom_init,
            --     -- on_attach = function() end,
            --     filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto", "hpp" },
            --
            -- })



            vim.diagnostic.config({
                signs = true,
                underline = true,
                update_in_insert = false,
                severity_sort = false,

                --virtual_text = false,
                virtual_text = {
                    source = "if_many",
                    --prefix = "󰍉", --   󰄛 ■          󰍉
                    spacing = 5,
                    --suffix = "suffix",




                    -- Change virtual text icons
                    -- prefix = function(diagnostic)
                    --     if diagnostic.severity == vim.diagnostic.severity.ERROR then
                    --         --return ""
                    --         return icons['error']
                    --     elseif diagnostic.severity == vim.diagnostic.severity.WARN then
                    --         --return ""
                    --         return icons['warn']
                    --     elseif diagnostic.severity == vim.diagnostic.severity.INFO then
                    --         --return ""
                    --         return icons['info']
                    --     else
                    --         --return ""
                    --         return icons['hint']
                    --     end
                    -- end,




                },
            })

            --vim.api.nvim_set_hl(0,"DiagnosticVirtualTextPrefixError",{fg="none", bg="none"})




        end,
        },


        {
            "nvimdev/lspsaga.nvim",
            dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
            config = function()
                require("lspsaga").setup({
                    -- vim.keymap.set({ "n", "t" }, "<leader>tt", "<cmd>Lspsaga term_toggle<CR>", { desc = "Terminal" }),

                    symbol_in_winbar = {  -- alternative to barbecue nvim

                        enable = false,
                        separator = " › ",
                        hide_keyword = false,
                        color_mode = true,
                        show_file = true,
                        folder_level = 1,
                        delay = 300,
                    },

                    -- rename = {
                    --     in_select = true,
                    --     keys = {
                    --         quit = "<esc>",
                    --     },
                    -- },

                    -- code_action = {
                    --     num_shortcut = true,
                    --     show_server_name = false,
                    --     keys = {
                    --         quit = "<esc>",
                    --     },
                    -- },

                    -- definition = {
                    --     keys = {
                    --         quit = "q",
                    --     },
                    -- },

                    hover = {
                        max_width = 0.9,
                        max_height = 0.8,
                    },

                    lightbulb = {
                        enable = false,
                    },


                    outline = {
                        win_position = "right",
                        auto_close = true,
                        auto_preview = true,
                        detail = true,

                        keys = {
                            jump = "<CR>",
                            quit = "q",
                            toggle_or_jump = "o",
                        },
                    },

                    -- beacon = {
                    --     border = "single",
                    --     frequency = 7,
                    --     scroll_down = "<C-f>",
                    --     scroll_up = "<C-b>",
                    -- },
                })
            end,
        },






    }


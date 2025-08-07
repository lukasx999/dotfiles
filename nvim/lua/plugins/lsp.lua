return {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
        "neovim/nvim-lspconfig",
        "williamboman/mason.nvim",
    },
    config = function()


        -- order: mason -> mason-lspconfig -> lspconfig
        require("mason").setup()
        require("mason-lspconfig").setup {
            automatic_installation = true,
            ensure_installed = {
                -- "clangd",
                -- "rust_analyzer",
            },
        }

        vim.lsp.config('rust-analyzer', {
            settings = {
                ['rust-analyzer'] = {
                    check = {
                        command = "clippy",
                    },
                    checkOnSave = true,
                }
            }
        })

        require'lspconfig'.glsl_analyzer.setup{}

        vim.lsp.config('clangd', {
            filetypes = { "c", "h", "cpp", "hpp", "cc", "hh" },
            cmd = {
                "clangd",
                "--background-index",
                "--suggest-missing-includes",
                "--clang-tidy",

                "--clang-tidy-checks=*",
                "--background-index",
                "-j=12",

                "--log=verbose",
                "--header-insertion=never"
            },
            init_options = {
                fallbackFlags = {
                    "-Wall",
                    "-Wextra",
                    "-std=c++23",
                    "-pedantic",
                },
            },

        })

        vim.lsp.config('*', {
            capabilities = {
                textDocument = {
                    completion = {
                        completionItem = {
                            snippetSupport = false,
                        }
                    }
                }
            }
        })

        -- vim.lsp.inlay_hint.enable(true)

        vim.diagnostic.config {
            underline        = false,
            update_in_insert = false,

            -- virtual_lines    = true,
            -- virtual_text     = false,

            -- -- redundant when using virtual_lines
            virtual_text     = {
                source = "if_many",
                -- spacing = 5,
            },
            severity_sort = true,
            signs = {
                text = {
                    [vim.diagnostic.severity.ERROR] = "󰌶 ",
                    [vim.diagnostic.severity.WARN]  = "󰀪 ",
                    [vim.diagnostic.severity.INFO]  = "󰅚 ",
                    [vim.diagnostic.severity.HINT]  = " ",
                },
                numhl = {
                    [vim.diagnostic.severity.ERROR] = "ErrorMsg",
                    [vim.diagnostic.severity.WARN]  = "WarningMsg",
                    [vim.diagnostic.severity.INFO]  = "InfoMsg",
                    [vim.diagnostic.severity.HINT]  = "HintMsg",
                },
            }

        }

        -- local builtin = require('telescope.builtin')

        vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename,                  { desc = "Rename symbol"        })
        vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format,                  { desc = "Format buffer"        })
        vim.keymap.set("n", "<leader>la", vim.lsp.buf.code_action,             { desc = "Code action"          })
        vim.keymap.set("n", "<leader>ld", vim.lsp.buf.definition,              { desc = "Definition"           })
        vim.keymap.set("n", "<leader>lD", vim.lsp.buf.declaration,             { desc = "Declaration"          })
        vim.keymap.set("n", "<leader>li", vim.lsp.buf.implementation,          { desc = "Implementation"       })
        vim.keymap.set("n", "<leader>lc", vim.lsp.buf.incoming_calls,          { desc = "Call Sites"           })
        vim.keymap.set("n", "<leader>lC", vim.lsp.buf.outgoing_calls,          { desc = "Outgoing Calls"       })
        vim.keymap.set("n", "<leader>lt", vim.lsp.buf.type_definition,         { desc = "Type Definition"      })
        vim.keymap.set("n", "<leader>lT", vim.lsp.buf.typehierarchy,           { desc = "Type Hierarchy"       })
        vim.keymap.set('n', '<leader>lq', vim.lsp.buf.workspace_symbol,        { desc = "Workspace Symbols"    })
        -- vim.keymap.set('n', '<leader>lS', builtin.lsp_workspace_symbols,        { desc = "Workspace Symbols"    })
        vim.keymap.set("n", "<leader>lR", vim.lsp.buf.references,              { desc = "References"           })
        vim.keymap.set("n", "K",          vim.lsp.buf.hover,                   { desc = "Hover"                })

        vim.keymap.set("n", "<leader>lm", "<cmd>Man<CR>",                      { desc = "Open Man Page"        })
        vim.keymap.set("n", "<leader>ls", "<cmd>LspClangdSwitchSourceHeader<CR>", { desc = "Switch Source-Header" })

        vim.keymap.set("n", "<leader>lQ", function()
            vim.diagnostic.setqflist({ open = true, severity = vim.diagnostic.severity.ERROR })
        end, { desc = "Diagnostics to qflist" })

        vim.keymap.set("n", "<leader>ll", function()
            vim.diagnostic.enable(not vim.diagnostic.is_enabled())
        end, { desc = "Toggle Diagnostics" })

        vim.keymap.set("n", "<leader>lF", function()
            vim.diagnostic.open_float()
        end, { desc = "Open Float" })

        vim.keymap.set("n", "<C-k>", function()
            vim.diagnostic.open_float()
        end, { desc = "Open Float" })

        vim.keymap.set("n", "<leader>lh", function()

            -- Toggle inlay hints
            vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())

            -- Toggle virtual lines
            local conf = vim.diagnostic.config()
            conf.virtual_lines = not vim.diagnostic.config().virtual_lines
            vim.diagnostic.config(conf)

        end, { desc = "Toggle Virtual Lines and Inlay Hints" })





    end
}



local function configure_clangd()
    require("lspconfig").clangd.setup({
        filetypes = { "c", "h", "cpp", "hpp" },
        cmd = {
            "clangd",
            "--background-index",
            "--suggest-missing-includes",
            "--clang-tidy",
            "--log=verbose",
            "--header-insertion=never"
        },
        init_options = {
            fallbackFlags = {
                "-Wall",
                "-Wextra",
                "-pedantic",
            },
        },
    })
end



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
                "clangd",
                "rust_analyzer",
                "lua_ls",
                "ts_ls",
                "jedi_language_server",
                "glsl_analyzer",
                "bashls",
            },
            handlers = {
                -- server_name is lspconfig server name, not mason package name

                -- default handler
                function(server_name)
                    require("lspconfig")[server_name].setup {}
                end,

                ["clangd"] = configure_clangd,
                -- ["ts_ls"]         = configure_tsls,
                -- ["gopls"]         = configure_gopls,
                -- ["rust_analyzer"] = configure_rust,
            }
        }


        vim.lsp.inlay_hint.enable(false)

        vim.diagnostic.config {
            underline = false,
            -- update_in_insert = false,
            -- signs = true,
            virtual_text = {
                source = "if_many",
                -- spacing = 5,
            },
        }

        local icons = {
            Hint  = "󰌶 ",
            Warn  = "󰀪 ",
            Error = "󰅚 ",
            Info  = " ",
        }

        for type, icon in pairs(icons) do
            local hl = "DiagnosticSign" .. type
            vim.fn.sign_define(hl, {
                text   = icon,
                texthl = hl,
                numhl  = hl
            })
        end

        vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename,                  { desc = "Rename symbol"        })
        vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format,                  { desc = "Format buffer"        })
        vim.keymap.set("n", "<leader>la", vim.lsp.buf.code_action,             { desc = "Code action"          })
        vim.keymap.set("n", "<leader>ld", vim.lsp.buf.definition,              { desc = "Definition"           })
        vim.keymap.set("n", "<leader>lD", vim.lsp.buf.declaration,             { desc = "Declaration"          })
        vim.keymap.set("n", "<leader>li", vim.lsp.buf.implementation,          { desc = "implementation"       })
        vim.keymap.set("n", "<leader>lc", vim.lsp.buf.incoming_calls,          { desc = "Call Sites"           })
        vim.keymap.set("n", "<leader>lC", vim.lsp.buf.outgoing_calls,          { desc = "Outgoing Calls"       })
        vim.keymap.set("n", "<leader>lt", vim.lsp.buf.type_definition,         { desc = "Type Definition"      })
        vim.keymap.set("n", "<leader>lT", vim.lsp.buf.typehierarchy,           { desc = "Type Hierarchy"       })
        vim.keymap.set('n', '<leader>lS', vim.lsp.buf.workspace_symbol,        { desc = "Workspace Symbols"    })
        vim.keymap.set("n", "<leader>lR", vim.lsp.buf.references,              { desc = "References"           })
        vim.keymap.set("n", "K",          vim.lsp.buf.hover,                   { desc = "Hover"                })
        vim.keymap.set("n", "<leader>lm", "<cmd>Man<CR>",                      { desc = "Open Man Page"        })
        vim.keymap.set("n", "<leader>ls", "<cmd>ClangdSwitchSourceHeader<CR>", { desc = "Switch Source-Header" })

        vim.keymap.set("n", "<leader>lh", function()
            vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
        end, { desc = "Toggle Inlay Hints" })

        vim.keymap.set("n", "<leader>lq", function()
            vim.diagnostic.setqflist({ open = true })
        end, { desc = "Diagnostics to qflist" })

        vim.keymap.set("n", "<leader>ll", function()
            vim.diagnostic.enable(not vim.diagnostic.is_enabled())
        end, { desc = "Toggle Diagnostics" })





    end
}

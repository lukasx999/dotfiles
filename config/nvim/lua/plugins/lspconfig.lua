    return {
        "neovim/nvim-lspconfig",
        config = function()
            local icons = {
                hint = "󰌶 ",
                warn = "󰀪 ",
                error = "󰅚 ",
                info = " ",
            }

            -- icons in sign column
            --local signs = { Error = "󰅚 ", Warn = "󰀪 ", Hint = "󰌶 ", Info = " " }
            local signs = { Error = icons['error'], Warn = icons['warn'], Hint = icons['hint'], Info = icons['info'] }
            for type, icon in pairs(signs) do
                local hl = "DiagnosticSign" .. type
                vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
            end


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


            vim.keymap.set("n", "<leader>l", ":", { desc = "LSP" })

            -- toggle diagnostics: <leader>ll -> options.lua

            vim.keymap.set("n", "<leader>lI", "<cmd>LspInfo<CR>", { desc = "Info" })

            vim.keymap.set("n", "<leader>lh", vim.lsp.buf.hover, { desc = "Hover (old)" })
            --vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "hover" })

            vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format, { desc = "Format buffer" })
            vim.keymap.set("n", "<leader>lb", vim.lsp.buf.references, { desc = "References" })
            --vim.keymap.set('n', '<leader>lb', require("telescope.builtin").lsp_references, { desc = 'references' })
            vim.keymap.set(
                "n",
                "<leader>li",
                require("telescope.builtin").lsp_implementations,
                { desc = "Implementations" }
            )

            vim.keymap.set(
                "n",
                "<leader>lT",
                require("telescope.builtin").filetypes,
                { desc = "Set filetype" }
            )


            --[[
            vim.keymap.set("n", "<leader>ld", vim.lsp.buf.definition, { desc = "goto Definition" })
            vim.keymap.set('n', '<leader>le', require("telescope.builtin").lsp_definitions, { desc = 'goto definition' })
            vim.keymap.set("n", "<leader>lA", vim.lsp.buf.code_action, { desc = "Code actions (old)" })
            vim.keymap.set("n", "<leader>lR", vim.lsp.buf.rename, { desc = "Global rename" })
            vim.keymap.set("n", "<leader>ld", require("telescope.builtin").diagnostics, { desc = "diagnostics" })
            ]]


            vim.keymap.set(
                "n",
                "<leader>ls",
                require("telescope.builtin").lsp_document_symbols,
                { desc = "Find symbols" }
            )
            vim.keymap.set(
                "n",
                "<leader>lS",
                require("telescope.builtin").lsp_dynamic_workspace_symbols,
                { desc = "Find symbols in the entire project" }
            )
        end,
    }


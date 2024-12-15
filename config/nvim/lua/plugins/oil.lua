return {
    'stevearc/oil.nvim',
    opts = {},
    -- Optional dependencies
    dependencies = { "nvim-tree/nvim-web-devicons" },


    config = function()

        local oil = require("oil")

        vim.keymap.set("n", "-", function()
            oil.open()
            -- oil.discard_all_changes()
        end, { desc = "Open parent directory" })



        -- Run a shell command on the current selected file
        local function runcmd()

            local bufnr = vim.api.nvim_get_current_buf()
            local dir = oil.get_current_dir(bufnr)

            local input = vim.fn.input("Command: ")
            if input == "" then return end

            local current = oil.get_cursor_entry()

            local cmd = string.format("%s %s%s", input, dir, current.name)
            Create_scratch_buffer(cmd)

        end

        vim.keymap.set("n", "ö", runcmd)

        -- for colored permissions
        local permission_hlgroups = {
            ['-'] = 'NonText',
            ['r'] = 'DiagnosticSignWarn',
            ['w'] = 'DiagnosticSignError',
            ['x'] = 'DiagnosticSignOk',
        }


        -- for toggeling detailed view
        local detail = true


        -- Split
        vim.keymap.set("n", "+", function()
            vim.cmd.vnew()
            vim.api.nvim_win_set_width(0, 40)

            -- open in non detailed view
            require("oil").set_columns({ "icon" })
            detail = false
            require("oil").open()
        end)




        local columns_config = {
            {
                "permissions",
                highlight = function(permission_str)
                    local hls = {}
                    for i = 1, #permission_str do
                        local char = permission_str:sub(i, i)
                        table.insert(hls, { permission_hlgroups[char], i - 1, i })
                    end
                    return hls
                end,
            },
            -- { "type", icons = { file = "f", directory = "d" } },
            { "size",  highlight = "Special" },
            { "mtime", highlight = "Number"  },
            {
                'icon',
                add_padding = false,
            },
        }



        require("oil").setup({


            -- will replace netrw
            default_file_explorer = true,
            -- Id is automatically added at the beginning, and name at the end
            -- See :help oil-columns

            columns = columns_config,


            -- Buffer-local options to use for oil buffers
            buf_options = {
                buflisted = false,
                bufhidden = "hide",
            },

            -- Window-local options to use for oil buffers
            win_options = {
                -- number = true,
                -- relativenumber = true,
                -- colorcolumn = 0,

                wrap          = false,
                signcolumn    = "no",
                cursorcolumn  = false,
                foldcolumn    = "0",
                spell         = false,
                list          = false,
                conceallevel  = 3,
                concealcursor = "nvic",
            },
            -- Send deleted files to the trash instead of permanently deleting them (:help oil-trash)
            delete_to_trash = true,
            -- Skip the confirmation popup for simple operations (:help oil.skip_confirm_for_simple_edits)
            skip_confirm_for_simple_edits = false,
            -- Selecting a new/moved/renamed file or directory will prompt you to save changes first
            -- (:help prompt_save_on_select_new_entry)
            prompt_save_on_select_new_entry = true,
            -- Oil will automatically delete hidden buffers after this delay
            -- You can set the delay to false to disable cleanup entirely
            -- Note that the cleanup process only starts when none of the oil buffers are currently displayed
            cleanup_delay_ms = 2000,
            lsp_file_methods = {
                -- Time to wait for LSP file operations to complete before skipping
                timeout_ms = 1000,
                -- Set to true to autosave buffers that are updated with LSP willRenameFiles
                -- Set to "unmodified" to only save unmodified buffers
                autosave_changes = false,
            },



            -- Set to `false` to disable, or "name" to keep it on the file names
            constrain_cursor = "name",  -- editable



            -- Set to true to watch the filesystem for changes and reload oil
            experimental_watch_for_changes = true,


            -- Keymaps in oil buffer. Can be any value that `vim.keymap.set` accepts OR a table of keymap
            -- options with a `callback` (e.g. { callback = function() ... end, desc = "", mode = "n" })
            -- Additionally, if it is a string that matches "actions.<name>",
            -- it will use the mapping at require("oil.actions").<name>
            -- Set to `false` to remove a keymap
            -- See :help oil-actions for a list of all available actions
            keymaps = {
                ["g?"]    = "actions.show_help",
                ["<CR>"]  = "actions.select",
                ["<C-s>"] = { "actions.select", opts = { vertical = true }, desc = "Open the entry in a vertical split" },
                ["<C-h>"] = { "actions.select", opts = { horizontal = true }, desc = "Open the entry in a horizontal split" },
                ["<C-t>"] = { "actions.select", opts = { tab = true }, desc = "Open the entry in new tab" },
                -- ["<C-p>"] = "actions.preview",
                ["gz"]    = "actions.preview",
                ["<C-c>"] = "actions.close",
                ["<C-l>"] = "actions.refresh",
                ["-"]     = "actions.parent",
                -- ["_"] = "actions.open_cwd",
                ["`"]     = "actions.cd",
                ["~"]     = { "actions.cd", opts = { scope = "tab" }, desc = ":tcd to the current oil directory" },
                ["gs"]    = "actions.change_sort",
                ["gx"]    = "actions.open_external",
                ["g."]    = "actions.toggle_hidden",
                ["g\\"]   = "actions.toggle_trash",

                ["gd"]    = {
                    desc = "Toggle file detail view",
                    callback = function()
                        detail = not detail
                        if detail then
                            require("oil").set_columns(columns_config)
                        else
                            require("oil").set_columns({ "icon" })
                        end
                    end,
                },

            },

            -- Set to false to disable all of the above keymaps
            use_default_keymaps = false,

            view_options = {
                show_hidden = true,

                -- This function defines what is considered a "hidden" file
                is_hidden_file = function(name, bufnr)
                    return vim.startswith(name, ".")
                end,

                -- This function defines what will never be shown, even when `show_hidden` is set
                is_always_hidden = function(name, bufnr)
                    -- return false
                    return name == '..'
                end,

                -- Sort file names in a more intuitive order for humans. Is less performant,
                -- so you may want to set to false if you work with large directories.
                natural_order = true,
                sort = {
                    -- sort order can be "asc" or "desc"
                    -- see :help oil-columns to see which columns are sortable
                    { "type", "asc" },
                    { "name", "asc" },
                },
            },
            -- Configuration for the floating keymaps help window
            keymaps_help = {
                border = "rounded",
            },
        })


    end,


}

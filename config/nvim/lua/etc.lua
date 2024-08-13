
local pickers = require "telescope.pickers"
local finders = require "telescope.finders"
local conf = require("telescope.config").values

local actions = require "telescope.actions"
local action_state = require "telescope.actions.state"

Mypicker = function(opts)
    opts = opts or {}
    pickers.new(opts, {
        prompt_title = "mypicker",
        finder = finders.new_table {

            results = {"foo", "bar", "baz" },

            attach_mappings = function(prompt_bufnr, map)
                actions.select_default:replace(function()
                    actions.close(prompt_bufnr)
                    local selection = action_state.get_selected_entry()
                    -- print(vim.inspect(selection))
                    vim.api.nvim_put({ selection[1] }, "", false, true)
                end)
                return true
            end,



        },
        sorter = conf.generic_sorter(opts),
    }):find()

end



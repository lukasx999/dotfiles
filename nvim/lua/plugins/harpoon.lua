return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()

        local hp = require("harpoon")
        hp:setup()

        vim.keymap.set("n", "<leader>ha", function() hp:list():add() end)
        vim.keymap.set("n", "<leader>hl", function() hp.ui:toggle_quick_menu(hp:list()) end)

        vim.keymap.set("n", "<M-1>", function() hp:list():select(1) end)
        vim.keymap.set("n", "<M-2>", function() hp:list():select(2) end)
        vim.keymap.set("n", "<M-3>", function() hp:list():select(3) end)
        vim.keymap.set("n", "<M-4>", function() hp:list():select(4) end)
        vim.keymap.set("n", "<M-5>", function() hp:list():select(5) end)
        vim.keymap.set("n", "<M-6>", function() hp:list():select(6) end)
        vim.keymap.set("n", "<M-7>", function() hp:list():select(7) end)
        vim.keymap.set("n", "<M-8>", function() hp:list():select(8) end)
        vim.keymap.set("n", "<M-9>", function() hp:list():select(9) end)

        -- vim.keymap.set("n", "<C-n>", function() hp:list():next() end)
        -- vim.keymap.set("n", "<C-p>", function() hp:list():prev() end)

        local hp_ext = require("harpoon.extensions")
        hp:extend(hp_ext.builtins.highlight_current_file())

    end
}

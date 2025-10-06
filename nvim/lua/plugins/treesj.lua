return {
    'Wansmer/treesj',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    config = function()

        vim.keymap.set("n", "<leader>t", require'treesj'.toggle, { desc = "toggle joining/splitting blocks" });

        require'treesj'.setup {
            use_default_keymaps = false,
        }

    end,
}

return {
 {'akinsho/toggleterm.nvim', version = "*", config = true},

  vim.keymap.set('n', '<C-t>', ':ToggleTerm<CR>', {silent = true}) --Neotree show file explorer
}

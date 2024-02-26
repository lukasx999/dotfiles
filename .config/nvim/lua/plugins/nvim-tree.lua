return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()

    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1
    vim.opt.termguicolors = true

    vim.keymap.set('n', '<C-m>', ':NvimTreeFindFileToggle<CR>', {silent = true}) -- Toggle tree 
    vim.keymap.set('n', '<C-n>', ':NvimTreeFocus<CR>', {silent = true}) -- Focus tree



    require("nvim-tree").setup({

         sort = {
            sorter = "case_sensitive",
          },
          view = {
            width = 30,
          },
          renderer = {
            group_empty = true,
          },
          filters = {
            dotfiles = true,
          },

    })
  end,
}

return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },

    config = function()
      vim.keymap.set('n', '<C-n>', ':Neotree filesystem reveal left <CR>', {silent = true}) --Neotree show file explorer
      vim.keymap.set('n', '<C-m>', ':Neotree toggle <CR>', {silent = true}) --Neotree show file explorer

require('neo-tree').setup {

  --[[

--always show hidden files (keybind is H)

 filesystem = {
      filtered_items = {
	 visible = true,
	 show_hidden_count = true,
	 hide_dotfiles = false,
	 hide_gitignored = true,
	 hide_by_name = {
	   -- '.git',
	   -- '.DS_Store',
	   -- 'thumbs.db',
	 },
	never_show = {},
      },
    }

    ]]
}

    end
  }

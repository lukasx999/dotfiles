return {
  "nvim-lualine/lualine.nvim",
  config = function()
    require('lualine').setup({
    options = {
      theme = 'catppuccin',
      icons_enabled = true,
      component_separators = { left = '', right = ''},
      section_separators = { left = '', right = ''},
      --section_separators = '',
      --component_separators = ''
    }
    })
  end
}

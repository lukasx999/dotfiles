local wezterm = require 'wezterm'
local config = {
enable_tab_bar = true,
hide_tab_bar_if_only_one_tab = false,
tab_bar_at_bottom = false,
use_fancy_tab_bar = false,
--tab_max_width = 
}




config.color_scheme = 'Catppuccin Mocha'
config.font = wezterm.font('JetBrains Mono', { weight = 'Bold', italic = true })
--config.font = wezterm.font 'JetBrainsMono NerdFont'
config.font_size = 12
config.font_shaper = 'Harfbuzz'

config.enable_scroll_bar = true
config.window_background_opacity = 0.9
config.text_background_opacity = 0.3

--config.default_prog = { '/usr/bin/zsh' }
--config.default_cwd = "/some/path"


config.window_frame = {
  font = wezterm.font { family = 'JetBrainsMono Nerd Font', weight = 'Bold' },
  font_size = 12.0,
}


config.window_padding = {
  left = '1cell',
  right = '1cell',
  top = '0.5cell',
  bottom = '0.5cell',
}


return config

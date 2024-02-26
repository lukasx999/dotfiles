vim.o.guifont = "JetBrainsMono Nerd Font:h16" --neovide Font
vim.opt.linespace = 0
vim.g.neovide_scale_factor = 1.0
vim.g.neovide_padding_top = 20
vim.g.neovide_padding_bottom = 0
vim.g.neovide_padding_right = 0
vim.g.neovide_padding_left = 0

local alpha = function()
  return string.format("%x", math.floor(255 * vim.g.transparency or 0.8))
end
vim.g.neovide_transparency = 0.85
vim.g.transparency = 0.85 --0.8
--vim.g.neovide_background_color = "#2e3440" .. alpha()
vim.g.neovide_hide_mouse_when_typing = false
vim.g.neovide_theme = 'dark'

vim.g.neovide_refresh_rate = 180
vim.g.neovide_cursor_animation_length = 0.09 --0.13
vim.g.neovide_cursor_trail_size = 0.6 --0.8
vim.g.neovide_cursor_antialiasing = true
vim.g.neovide_cursor_animate_in_insert_mode = true
vim.g.neovide_cursor_animate_command_line = true
vim.g.neovide_cursor_vfx_mode = "wireframe" --railgun, torpedo, pixiedust, sonicboom, ripple, wireframe, 
vim.g.neovide_cursor_vfx_opacity = 200.0
vim.g.neovide_cursor_vfx_particle_lifetime = 1.2
vim.g.neovide_cursor_vfx_particle_density = 7.0
vim.g.neovide_cursor_vfx_particle_speed = 10.0
vim.g.neovide_cursor_vfx_particle_phase = 1.5 --only for railgun
vim.g.neovide_cursor_vfx_particle_curl = 1.0 --only for railgun

vim.opt.guicursor = "" -- cursor is block in all modes

vim.opt.number         = true
vim.opt.relativenumber = true
vim.opt.cursorline     = true
vim.opt.wrap           = false
vim.opt.clipboard      = "unnamedplus"

vim.opt.expandtab      = true
vim.opt.tabstop        = 4
vim.opt.shiftwidth     = 4
vim.opt.softtabstop    = 4
vim.opt.smartindent    = true

vim.opt.splitbelow     = true
vim.opt.splitright     = true
vim.opt.colorcolumn    = "80"

vim.opt.laststatus     = 3 -- global status bar
vim.opt.showmode       = true
vim.opt.ruler          = false
vim.opt.showcmd        = false

vim.opt.ignorecase     = true
vim.opt.smartcase      = true

vim.opt.inccommand     = "split"
vim.opt.scrolloff      = 5
vim.opt.virtualedit    = "block"
vim.opt.autochdir      = true
vim.opt.termguicolors  = true

vim.opt.incsearch      = true
vim.opt.hlsearch       = true

vim.opt.linebreak       = true -- cut off last char at a sensible location (only when using wrap)
-- vim.opt.signcolumn = "yes" -- no - left empty column

vim.opt.shortmess:append "IW"
-- I: disable splashscreen
-- W: disable "written" message


vim.opt.list      = true
vim.opt.listchars = {
    -- eol      = '↲',
    tab      = '» ',
    trail    = '·',
    extends  = '<',
    precedes = '>',
    conceal  = '┊',
    nbsp     = '␣',
}

vim.opt.showmode = false -- dont show `-- INSERT --` text
-- vim.opt.cmdheight = 0 -- message line
vim.opt.cmdwinheight = 1 -- height of <C-f> window in command mode

-- No auto comments on new line
vim.cmd "autocmd FileType * set formatoptions-=cro"

-- automatically backup files
vim.opt.backup    = true
vim.opt.backupdir = os.getenv("HOME") .. "/.vim/backupdir"

-- automatically save undo history
vim.opt.undofile = true
vim.opt.undodir  = os.getenv("HOME") .. "/.vim/undodir"

vim.cmd("colorscheme rose-pine-moon")
-- vim.cmd("colorscheme kanagawa-dragon")
-- vim.cmd("colorscheme duskfox")

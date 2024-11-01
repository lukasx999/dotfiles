
-- vim.opt.guicursor = { 'a:ver25' }  -- cursor is beam in all modes
-- vim.opt.guicursor = "" -- cursor is block in all modes

vim.opt.number         = true
vim.opt.relativenumber = true
vim.opt.numberwidth    = 4

vim.opt.cursorline     = true
vim.o.cursorlineopt    = "both"  -- both, number, screenline
vim.opt.cursorcolumn   = false
vim.opt.splitbelow     = true
vim.opt.splitright     = true
vim.opt.wrap           = false

vim.opt.expandtab      = true -- convert tabs to spaces
vim.opt.tabstop        = 4 -- only for opening/closing files
vim.opt.shiftwidth     = 4 -- 2 (tab size)
vim.opt.softtabstop    = 4
vim.opt.smartindent    = true




-- experimental
vim.opt.swapfile     = false
vim.opt.signcolumn   = "yes" -- no - left empty column

vim.opt.updatetime   = 250 --write to disk
vim.opt.timeoutlen   = 600 -- which-key popup -- old: 300

vim.g.have_nerd_font = true
vim.opt.mouse        = 'a'  -- Enable mouse
vim.opt.breakindent  = true  -- preserve indent on wrapped lines for blocks of text


-- whitespaces
vim.opt.list      = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
--vim.opt.listchars = { trail = '·' }


-- go to previous/next line with h,l,left arrow and right arrow
-- vim.opt.whichwrap:append "<>[]hl"


-- automatically backup files
vim.opt.backup    = true
vim.opt.backupdir = os.getenv("HOME") .. "/.vim/backupdir"

-- automatically save undo history
vim.opt.undofile = true
vim.opt.undodir  = os.getenv("HOME") .. "/.vim/undodir"




-- sync system clipboard
vim.opt.clipboard     = "unnamedplus"
vim.opt.scrolloff     = 8
vim.opt.virtualedit   = "block" -- keep highlighting on lines that are not of the same length, in visual block mode
vim.opt.inccommand    = "split" -- create new window for search results in global sub (%s)
vim.opt.ignorecase    = true
vim.opt.smartcase     = true
vim.opt.termguicolors = true -- better, gui-like colors


-- disable nvim splashscreen
-- vim.opt.shortmess:append "sI"
vim.opt.shortmess:append "IW"
-- I ... disable splashscreen
-- W ... disable "written" message



vim.opt.colorcolumn = "80"






---- Auto indent on empty line.
--[[
vim.keymap.set('n', 'i', function ()
    return string.match(vim.api.nvim_get_current_line(), '%g') == nil
        and 'cc' or 'i'
end, {expr=true, noremap=true})
]]



-- USE TREESITTER BASED FOLDING
-- old
-- vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
-- vim.opt.foldtext = "v:lua.vim.treesitter.foldtext()"


vim.wo.foldmethod = "expr"
vim.wo.foldexpr   = "nvim_treesitter#foldexpr()"

-- Dont collapse folds on start
vim.cmd"set nofoldenable"
vim.cmd"set foldlevelstart=99"

-- FOLD SETTINGS

-- without numbers
-- vim.wo.foldtext = [[substitute(getline(v:foldstart),'\\t',repeat('\ ',&tabstop),'g').' ... '.trim(getline(v:foldend)) ]]

-- w/ number of lines
-- vim.o.foldtext = [[substitute(getline(v:foldstart),'\\t',repeat('\ ',&tabstop),'g').' ... '.trim(getline(v:foldend)) . ' (' . (v:foldend - v:foldstart + 1) . ' lines)']]
-- vim.opt.fillchars = "fold: "  -- Remove dotted chars

-- vim.wo.foldnestmax = 3
-- vim.wo.foldminlines = 1



-- Remember folds
vim.api.nvim_create_autocmd({"BufWinLeave"}, {
  pattern = {"*.*"},
  desc = "save view (folds), when closing file",
  command = "mkview",
})
vim.api.nvim_create_autocmd({"BufWinEnter"}, {
  pattern = {"*.*"},
  desc = "load view (folds), when opening file",
  command = "silent! loadview"
})




-- No auto comments on new line
vim.cmd([[autocmd FileType * set formatoptions-=ro]])



vim.opt.laststatus = 3  -- global status bar
vim.opt.showmode   = false -- disable mode indicator (using lualine)
vim.opt.ruler      = false -- bottom right numbers
vim.opt.showcmd    = false -- bottom right output of keys

vim.opt.autochdir  = true  -- automatically change cwd to root of file



-- autostart commands
--[[
vim.api.nvim_create_autocmd("VimEnter", {
    command = "",
})
--]]



vim.opt.incsearch = true -- start searching before pressing enter
vim.opt.hlsearch  = true  -- Highlight search results

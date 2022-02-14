-- configurations for plugins and filetype specifics
require('plugins')
require('filetype')
require('keymaps')

local opt = vim.opt
local cmd = vim.cmd
local home = os.getenv('HOME')

-- default things everyone does
opt.encoding = "utf-8"
opt.hidden = true
-- line numbers
opt.number = true
opt.relativenumber = true

--signcolumn
opt.signcolumn = "yes"

-- mouse and clipboard support
opt.mouse = "a"
opt.clipboard = "unnamedplus"

-- visible whitespace
opt.listchars = {eol = ' ', tab = '▸ ', trail = '·'}
opt.list = true

-- tabs to spaces and length of tab
local tablength = 4
opt.shiftwidth = tablength
opt.tabstop = tablength
opt.expandtab = true

-- start scrolling
opt.scrolloff=12

-- signcolumn for git changes, errors etc
--opt.signcolumn = "yes"

-- History
opt.history = 200
opt.undofile = true
opt.undodir = home .. "/.config/nvim/undo"
opt.backup = true
opt.backupdir = home ..'/.config/nvim/backup'
opt.writebackup = true

-- Remove trailing whitespace on save
cmd([[ autocmd BufWritePre * %s/\s\+$//e ]])

-- Remember last position in file
cmd([[ au BufReadPost,BufEnter * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif]])

-- Colorscheme
cmd([[ colorscheme lush_wal ]])
opt.termguicolors = true
-- Syntax on
cmd([[ syntax on ]])
-- make comments cursive
cmd([[ highlight Comment cterm=italic ]])

cmd [[ hi Pmenu ctermbg=0 ]]



-- fold settings
vim.wo.foldmethod = "expr"
vim.wo.foldexpr = "nvim_treesitter#foldexpr()"
vim.wo.foldtext =
    [[substitute(getline(v:foldstart),'\\t',repeat('\ ',&tabstop),'g').'...'.trim(getline(v:foldend)) ]]
vim.wo.fillchars = "fold:\\"
vim.wo.foldnestmax = 3
vim.wo.foldminlines = 1

cmd [[ autocmd BufReadPost,FileReadPost,BufEnter * :normal zR " unfold by default ]]

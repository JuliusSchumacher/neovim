-- install packer if not already present
local install_path = vim.fn.stdpath("data") ..
                         "/site/pack/packer/start/packer.nvim"
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    print("Installing packer...")
    vim.fn.system({
        "git", "clone", "https://github.com/wbthomason/packer.nvim",
        install_path
    })
    vim.cmd("packadd packer.nvim")
    print("Installed packer!")
    require("plugins")
    print("Installing plugins... Restart nvim after installation is complete")
    require("packer").sync()

    -- don't do anything else
    return
end

require("plugins")
require("filetype")
require("keymaps")

local opt = vim.opt
local cmd = vim.cmd
local home = os.getenv("HOME")

-- timeout
opt.timeoutlen = 500
opt.updatetime = 100

-- line numbers
opt.number = true
opt.relativenumber = true

-- mouse and clipboard support
opt.mouse = "a"
opt.clipboard = "unnamedplus"

-- visible whitespace
opt.listchars = {eol = " ", tab = "▸ ", trail = "·"}
opt.list = true

-- tabs to spaces and length of tab
local tablength = 4
opt.shiftwidth = tablength
opt.tabstop = tablength
opt.expandtab = true

-- start scrolling
opt.scrolloff = 8

-- History
opt.history = 200
opt.undofile = true
opt.undodir = home .. "/.config/nvim/undo"
opt.backup = true
opt.backupdir = home .. "/.config/nvim/backup"
opt.writebackup = true

-- Remove trailing whitespace on save
cmd([[ autocmd BufWritePre * %s/\s\+$//e ]])

-- Colorscheme
cmd([[ colorscheme lush_wal ]])
opt.termguicolors = true
-- Syntax on
cmd([[ syntax on ]])
-- make comments cursive
cmd([[ highlight Comment cterm=italic ]])

cmd([[ hi Pmenu ctermbg=0 ]])

opt.cursorline = true

-- Don't insert an extra space after a period when joining lines with J.
opt.joinspaces = false

-- Instead of failing a command because of unsaved changes, raise a dialogue asking if you wish to save changed files.
opt.confirm = true

-- reload changed files
opt.autoread = true
opt.updatecount = 750
cmd([[ autocmd CursorHold * checktime ]])

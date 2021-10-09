local opt = vim.opt
local g = vim.g
local cmd = vim.api.nvim_command
local map = vim.api.nvim_set_keymap

local opts = { noremap=true, silent=true }

g.mapleader = " "

-- tree
map('n', '<C-n>', ':NvimTreeToggle<CR>', {noremap = true, silent = true})

-- w/q aliases
cmd([[
    cnoreabbrev W! w!
    cnoreabbrev Q! q!
    cnoreabbrev Qall! qall!
    cnoreabbrev Wq wq
    cnoreabbrev Wa wa
    cnoreabbrev wQ wq
    cnoreabbrev WQ wq
    cnoreabbrev W w
    cnoreabbrev Q q
    cnoreabbrev Qall qall
]])


-- bufferline
map('', '<TAB>', ':BufferLineCycleNext<CR>', {noremap = true, silent = true})
map('', '<S-TAB>', ':BufferLineCyclePrev<CR>', {noremap = true, silent = true})
map('n', '<leader>q', ':bw<CR>', {noremap = true, silent = true})

-- restart
map('n', '<leader>r', ':Reload<CR>',{noremap = true})

-- edit init.lua
map('n', '<leader>ev', ':edit $MYVIMRC<CR>',{noremap = true, silent = true})

-- lsp-config
-- See `:help vim.lsp.*` for documentation on any of the below functions
map('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
map('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
map('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
map('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
map('n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
map('n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
map('n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
map('n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
map('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
map('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
map('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
map('n', '<leader>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
map('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
map('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)


-- gitsigns
map('n', '<leader>hs', '<cmd>lua require"gitsigns".stage_hunk()<CR>', opts)
map('v', '<leader>hs', '<cmd>lua require"gitsigns".stage_hunk({vim.fn.line("."), vim.fn.line("v")})<CR>', opts)
map('n', '<leader>hu', '<cmd>lua require"gitsigns".undo_stage_hunk()<CR>', opts)
map('n', '<leader>hr', '<cmd>lua require"gitsigns".reset_hunk()<CR>', opts)
map('v', '<leader>hr', '<cmd>lua require"gitsigns".reset_hunk({vim.fn.line("."), vim.fn.line("v")})<CR>', opts)
map('n', '<leader>hR', '<cmd>lua require"gitsigns".reset_buffer()<CR>', opts)
map('n', '<leader>hp', '<cmd>lua require"gitsigns".preview_hunk()<CR>', opts)
map('n', '<leader>hb', '<cmd>lua require"gitsigns".blame_line(true)<CR>', opts)
map('n', '<leader>hS', '<cmd>lua require"gitsigns".stage_buffer()<CR>', opts)
map('n', '<leader>hU', '<cmd>lua require"gitsigns".reset_buffer_index()<CR>', opts)

-- Text objects
map('o', 'ih', ':<C-U>lua require"gitsigns.actions".select_hunk()<CR>', opts)
map('x', 'ih', ':<C-U>lua require"gitsigns.actions".select_hunk()<CR>', opts)


-- telescope
map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
map('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
map('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
map('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
map('n', '<leader>fs', '<cmd>lua require("telescope.builtin").lsp_document_symbols()<CR>', opts)
map('n', '<leader>fS', '<cmd>lua require("telescope.builtin").lsp_workspace_symbols()<CR>', opts)
map('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
map('v', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
map('n', '<leader>dg', '<cmd>lua require("telescope.builtin").lsp_document_diagnostics()<CR>', opts)
map('n', '<leader>dG', '<cmd>lua require("telescope.builtin").lsp_workspace_diagnostics()<CR>', opts)
map('n', '<leader>D', '<cmd>lua require("telescope.builtin").lsp_type_definitions()<CR>', opts)
map('n', '<leader>fm', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)

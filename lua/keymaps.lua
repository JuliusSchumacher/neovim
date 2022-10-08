local opt = vim.opt
local g = vim.g
local cmd = vim.api.nvim_command
local map = vim.api.nvim_set_keymap

local opts = { noremap=true, silent=true }

g.mapleader = " "

-- tree
map('n', '<C-n>', ':Neotree reveal toggle<CR>', opts)

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

map('n', 'zz', 'za', opts)

-- buffers
map('n', '<leader>q', ':bw<CR>', opts)
map('n', '<leader>fb', '<cmd>Telescope buffers<CR>', opts)

-- edit init.lua
map('n', '<leader>ev', ':edit $MYVIMRC<CR>', opts)
map('n', '<leader>sv', ':source $MYVIMRC<CR>', opts)

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
map('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
map('n', '<leader>e', '<cmd>Lspsaga show_line_diagnostics<CR>', opts)
map('n', '<leader>ca', '<cmd>Lspsaga code_action<CR>', opts)
map('v', '<leader>ca', '<cmd>Lspsaga code_action<CR>', opts)
vim.keymap.set("n", "<leader>rn", function ()
    return ":IncRename " .. vim.fn.expand("<cword>")
end, { expr = true, silent = true })


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
map('n', '<leader>fS', '<cmd>lua require("telescope.builtin").lsp_document_symbols()<CR>', opts)
map('n', '<leader>fs', '<cmd>lua require("telescope.builtin").lsp_dynamic_workspace_symbols()<CR>', opts)
map('n', '<leader>dg', '<cmd>lua require("telescope.builtin").diagnostics(require("telescope.themes").get_dropdown({}))<CR>', opts)
map('n', '<leader>D', '<cmd>lua require("telescope.builtin").lsp_type_definitions()<CR>', opts)
map('n', '<leader>fm', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
map('n', '<leader>ff', '<cmd>lua require("telescope.builtin").find_files()<CR>', opts)
map('n', '<leader>rg', '<cmd>lua require("telescope.builtin").live_grep()<CR>', opts)
map('n', '<leader>rG', '<cmd>lua require("telescope.builtin").grep_string()<CR>', opts)

-- dap
map('n', '<F5>', '<cmd>lua require("dap").continue()<CR>', opts)
map('n', '<F6>', '<cmd>lua require("dap").terminate()<CR>', opts)
map('n', '<F8>', '<cmd>lua require("dap").toggle_breakpoint()<CR>', opts)
map('n', '<leader>bp', '<cmd>lua require("dap").toggle_breakpoint()<CR>', opts)
map('n', '<F10>', '<cmd>lua require("dap").step_over()<CR>', opts)
map('n', '<F11>', '<cmd>lua require("dap").step_into()<CR>', opts)
map('n', '<F12>', '<cmd>lua require("dap").step_out()<CR>', opts)


map('n', '<leader>ur', '<cmd>DapToggleRepl<CR>', opts)
map('n', '<leader>uo', '<cmd>lua require("dapui").toggle()<CR>', opts)
map('n', '<M-k>', '<cmd>lua require("dapui").eval()<CR>', opts)
map('v', '<M-k>', '<cmd>lua require("dapui").eval()<CR>', opts)



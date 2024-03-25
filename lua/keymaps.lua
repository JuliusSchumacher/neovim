local g = vim.g
local cmd = vim.api.nvim_command
local map = vim.keymap.set

local opts = {noremap = true, silent = true}

g.mapleader = " "

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

-- move around
map('n', '<C-h>', '<C-w>h', opts)
map('n', '<C-j>', '<C-w>j', opts)
map('n', '<C-k>', '<C-w>k', opts)
map('n', '<C-l>', '<C-w>l', opts)

-- buffers
map('n', '<leader>q', ':bw<CR>', opts)

-- edit init.lua
map('n', '<leader>ev', ':edit $MYVIMRC<CR>', opts)
map('n', '<leader>sv', ':source $MYVIMRC<CR>', opts)

-- lsp-config
-- See `:help vim.lsp.*` for documentation on any of the below functions
map('n', 'K', function() vim.lsp.buf.hover() end, opts)
map('n', 'gd', function() vim.lsp.buf.definition() end, opts)
map('n', 'gD', function() vim.lsp.buf.declaration() end, opts)
map('n', 'gr', function() vim.lsp.buf.references() end, opts)
map('n', 'gi', function() vim.lsp.buf.implementation() end, opts)
map('n', '<leader>D', function() vim.lsp.buf.type_definition() end, opts)
map('n', '<leader>rn', function() vim.lsp.buf.rename() end, opts)
map('n', '<leader>e', function() require"lsp_lines".toggle() end, opts)
map('n', '<leader>ca', '<cmd>CodeActionMenu<CR>', opts)
map('v', '<leader>ca', '<cmd>CodeActionMenu<CR>', opts)
vim.g.code_action_menu_show_details = true
vim.g.code_action_menu_show_diff = true

-- gitsigns
local gitsigns = require('gitsigns')
local gitsigns_actions = require('gitsigns.actions')
map('n', '<leader>hs', function() gitsigns.stage_hunk() end, opts)
map('v', '<leader>hs',
    function() gitsigns.stage_hunk({vim.fn.line("."), vim.fn.line("v")}) end,
    opts)
map('n', '<leader>hu', function() gitsigns.undo_stage_hunk() end, opts)
map('n', '<leader>hr', function() gitsigns.reset_hunk() end, opts)
map('v', '<leader>hr',
    function() gitsigns.reset_hunk({vim.fn.line("."), vim.fn.line("v")}) end,
    opts)
map('n', '<leader>hR', function() gitsigns.reset_buffer() end, opts)
map('n', '<leader>hS', function() gitsigns.stage_buffer() end, opts)
map('n', '<leader>hU', function() gitsigns.reset_buffer_index() end, opts)

-- Text objects
map('o', 'ih', function() gitsigns_actions.select_hunk() end, opts)
map('x', 'ih', function() gitsigns_actions.select_hunk() end, opts)

-- telescope
local telescope = require("telescope.builtin")
local ts_theme = require("telescope.themes")
map('n', '<leader>S', function() telescope.lsp_document_symbols() end, opts)
map('n', '<leader>s', function() telescope.lsp_dynamic_workspace_symbols() end,
    opts)
map('n', '<leader>dg',
    function() telescope.diagnostics(ts_theme.get_dropdown({})) end, opts)
map('n', '<leader>D', function() telescope.lsp_type_definitions() end, opts)
map('n', '<leader>f',
    function() telescope.find_files(ts_theme.get_dropdown({})) end, opts)
map('n', '<leader>b',
    function() telescope.buffers(ts_theme.get_dropdown({})) end, opts)
map('n', '<leader>rg', function() telescope.live_grep() end, opts)
map('n', '<leader>rG', function() telescope.grep_string() end, opts)
map('n', '<leader><leader>', function() telescope.resume() end, opts)

-- dap
local dap = require('dap')
local dapui = require('dapui')
map('n', '<F5>', function() dap.continue() end, opts)
map('n', '<F8>', function() dap.toggle_breakpoint() end, opts)
map('n', '<F10>', function() dap.step_over() end, opts)
map('n', '<F11>', function() dap.step_into() end, opts)
map('n', '<F12>', function() dap.step_out() end, opts)

map('n', '<leader>ur', '<cmd>DapToggleRepl<CR>', opts)
---@diagnostic disable-next-line: missing-parameter
map('n', '<leader>uo', function() dapui.toggle() end, opts)
map('n', '<M-k>', function() dapui.eval() end, opts)
map('v', '<M-k>', function() dapui.eval() end, opts)

-- tree
local neotree = require('neo-tree.command')
map('n', '<C-n>',
    function() neotree.execute({toggle = true, position = 'left'}) end, opts)

-- dbee
local dbee = require('dbee')
map('n', '<leader>db', function() dbee.toggle() end, opts)
map('n', '<leader>dc', function() dbee.close() end, opts)
map('n', '<leader>ds', function()
    vim.ui.input('Filename:', function(filename)
        local file = vim.fn.expand('~/') .. filename
        print(file)
        dbee.store('csv', 'file', {extra_arg = file})
    end)
end, opts)

-- harpoon
local harpoon_ui = require('harpoon.ui')
local harpoon_mark = require('harpoon.mark')
map('n', '<leader>hh', '<cmd>Telescope harpoon marks<CR>', opts)
map('n', '<leader>ma', function() harpoon_mark.add_file() end, opts)
map('n', '<leader>n', function() harpoon_ui.nav_next() end, opts)
map('n', '<leader>p', function() harpoon_ui.nav_prev() end, opts)


map("n", "[d", require("delimited").goto_prev, opts)
map("n", "]d", require("delimited").goto_next, opts)
map("n", "[D", function()
    require("delimited").goto_prev({ severity = vim.diagnostic.severity.ERROR })
end, opts)
map("n", "]D", function()
    require("delimited").goto_next({ severity = vim.diagnostic.severity.ERROR })
end, opts)

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

-- smart tab
local t = function(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

_G.smart_tab = function()
    if vim.fn.pumvisible() == 1 then
        return t'<C-n>'
    else
        return t'<Tab>'
    end
end

map(
    'i',
    '<Tab>',
    'v:lua.smart_tab()',
    {noremap = true, expr = true}
)

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

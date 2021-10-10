local cmp = require('cmp')
local lspkind = require('lspkind')
local luasnip = require('luasnip')
local tabnine = require('cmp_tabnine.config')

tabnine:setup({
    max_lines = 1000;
})

cmp.setup{
    sources = {
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'buffer' },
        { name = 'path' },
        { name = 'cmp_tabnine' },
    },

    formatting = {
        format = lspkind.cmp_format({with_text = true, maxwidth = 50})
    },
    mapping = {
        ['<Tab>'] = function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
                vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<Plug>luasnip-expand-or-jump', true, true, true), '')
            else
                fallback()
            end
        end,
        ['<CR>'] = cmp.mapping.confirm({ select = false }),
        ['<C-Space>'] = cmp.mapping.complete(),
    },
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },
}

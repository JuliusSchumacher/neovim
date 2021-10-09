local cmp = require('cmp')
local lspkind = require('lspkind')

cmp.setup{
    sources = {
        { name = 'nvim_lsp' },
        { name = 'omnisharp' },

        -- For vsnip user.
        -- { name = 'vsnip' },

        -- For luasnip user.
        { name = 'luasnip' },

        -- For ultisnips user.
        -- { name = 'ultisnips' },

        { name = 'buffer' },
    },

    formatting = {
        format = lspkind.cmp_format({with_text = false, maxwidth = 50})
    },
    mapping = {
        ['<Tab>'] = function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            else
                fallback()
            end
        end,
        ['<CR>'] = cmp.mapping.confirm({ select = false }),
    },
    snippet = {
        expand = function(args)
            -- For `vsnip` user.
            -- vim.fn["vsnip#anonymous"](args.body)

            -- For `luasnip` user.
            require('luasnip').lsp_expand(args.body)

            -- For `ultisnips` user.
            -- vim.fn["UltiSnips#Anon"](args.body)
        end,
    },
}

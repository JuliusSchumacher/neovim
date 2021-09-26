local cmp = require'cmp'

cmp.setup({
sources = {
  { name = 'nvim_lsp' },
  { name = 'omnisharp' },

  -- For vsnip user.
  -- { name = 'vsnip' },

  -- For luasnip user.
  -- { name = 'luasnip' },

  -- For ultisnips user.
  -- { name = 'ultisnips' },

  { name = 'buffer' },
}
})

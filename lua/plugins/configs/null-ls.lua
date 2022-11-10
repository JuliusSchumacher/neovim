local null_ls = require('null-ls')

null_ls.setup({
  sources = {
    require('null-ls').builtins.formatting.prettier.with({
      only_local = 'node_modules/.bin'
    })
  },
  on_attach = function(client, bufnr)
    if client.server_capabilities.documentFormattingProvider then

    end
  end,
})



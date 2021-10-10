local cfg = {
  bind = true, -- This is mandatory, otherwise border config won't get registered.
  extra_trigger_chars = {"(", ","},
}

require'lsp_signature'.setup(cfg) -- no need to specify bufnr if you don't use toggle_key

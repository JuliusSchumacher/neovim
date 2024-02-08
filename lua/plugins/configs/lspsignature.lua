local cfg = {
    bind = true, -- This is mandatory, otherwise border config won't get registered.
    extra_trigger_chars = {"(", ","},
    handler_opts = {
        border = "double" -- double, single, shadow, none
    }
}

require'lsp_signature'.setup(cfg) -- no need to specify bufnr if you don't use toggle_key

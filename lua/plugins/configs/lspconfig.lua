local signs = {Error = ' ', Warn = ' ', Info = ' ', Hint = '󰌵 '}
for type, icon in pairs(signs) do
    local hl = 'DiagnosticSign' .. type
    vim.fn.sign_define(hl, {text = icon, texthl = hl, numhl = hl, priority = 0})
end

vim.diagnostic.config({
    signs = true,
    update_in_insert = false,
    underline = true,
    severity_sort = true,
    virtual_text = {severity = vim.diagnostic.severity.ERROR, source = true},
    virtual_lines = false
})

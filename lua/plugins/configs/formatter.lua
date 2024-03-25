local util = require("formatter.util")
local plenary = require("plenary")

require("formatter").setup({
    filetype = {
        -- lua = {require("formatter.filetypes.lua").luaformat},
        typescript = {require("formatter.filetypes.typescript").prettier},
        html = {require("formatter.filetypes.html").prettier},
        css = {require("formatter.filetypes.css").prettier},
        graphql = {require("formatter.filetypes.graphql").prettier},
        yaml = {require("formatter.filetypes.yaml").prettier},
        typescriptreact = {require("formatter.filetypes.typescript").prettier},
        php = {
            function()
                local file = plenary.path:new(vim.api.nvim_buf_get_name(0))
                                 :make_relative()
                return {
                    exe = "php-cs-fixer",
                    args = {"fix", file},
                    stdin = false,
                    no_append = true
                }
            end
        }
    }
})

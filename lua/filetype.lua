local lsp = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp
    .protocol
    .make_client_capabilities())

-- format on save
vim.api.nvim_create_autocmd({ "BufWritePost" }, {
    pattern = "*",
    callback = function() vim.cmd("FormatWrite") end
})

-- lua
local lua_ls_binary_path = vim.fn.exepath("lua-language-server")
local lua_ls_root_path = vim.fn.fnamemodify(lua_ls_binary_path, ":h:h:h")

local runtime_path = vim.split(package.path, ";")
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

lsp.lua_ls.setup({
    cmd = { lua_ls_binary_path, "-E", lua_ls_root_path .. "/main.lua" },
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = "LuaJIT",
                -- Setup your lua path
                path = runtime_path
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = { "vim" }
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = vim.api.nvim_get_runtime_file("", true)
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = { enable = false }
        }
    },
    capabilities = capabilities
})

-- csharp
local pid = vim.fn.getpid()
local omnisharp_bin = "/usr/bin/omnisharp"
lsp.omnisharp.setup({
    cmd = { omnisharp_bin, "--languageserver", "--hostPID", tostring(pid) },
    capabilities = capabilities
})

-- yaml
lsp.yamlls.setup({ capabilities = capabilities })

-- terraform
require("lspconfig").terraformls.setup({})

-- css
require("lspconfig").cssls.setup({
    capabilities = capabilities,
    cmd = { "vscode-css-languageserver", "--stdio" }
})

require("lspconfig").html.setup({
    capabilities = capabilities,
    cmd = { "vscode-html-languageserver", "--stdio" }
})

-- powershell
require("lspconfig").powershell_es.setup({
    bundle_path = "/home/julius/.config/nvim/ps/"
    -- shell = "powershell.exe"
})

-- sql
require("lspconfig").sqls.setup({
    cmd = { "/usr/sbin/sqls", "-config", "~/.config/sqls/config.yml" },
    on_attach = function(client, bufnr)
        require("sqls").on_attach(client, bufnr)
    end
})

-- latex
require("lspconfig").texlab.setup({
    settings = {
        texlab = {
            build = {
                args = {
                    "-xelatex", "-interaction=nonstopmode", "-synctex=1", "%f"
                },
                onSave = true
            }
        }
    }
})

-- python
lsp.pylsp.setup({})

-- typescript
-- handled by https://github.com/pmizio/typescript-tools.nvim
-- lsp.tsserver.setup({})

-- eslint
lsp.eslint.setup({
    filetypes = {
        "javascript", "javascriptreact", "javascript.jsx", "typescript",
        "typescriptreact", "typescript.tsx", "vue", "svelte", "astro", "html"
    }
})

-- angular
lsp.angularls.setup({ capabilities = capabilities })

-- ruby
lsp.solargraph.setup({})

-- php
lsp.intelephense.setup({
    init_options = {
        licenceKey = "/home/julius/.config/intelephense/licence.txt"
    },
    capabilities = capabilities
})
--[[ lsp.psalm.setup({
    cmd = {
        'psalm', "--language-server", "-r=/var/www/html",
        "--map-folder=/var/www/html:" .. vim.fn.getcwd(),
        "--config=/var/www/html/psalm.xml"
    },
    capabilities = capabilities
}) ]]

-- graphql
lsp.graphql.setup({
    capabilities = capabilities,
    cmd = {
        "/usr/bin/graphql-lsp", "server", "-m", "stream",
        "-s=http://localhost/hyperion/Graphql"
    },
    root_dir = lsp.util.root_pattern("package.json", ".git")
})

-- bash
lsp.bashls.setup({})

-- java
vim.api.nvim_create_autocmd("BufRead", {
    pattern = "*.java",
    callback = function()
        local config = {
            cmd = { "/usr/bin/jdtls" },
            root_dir = vim.fs.dirname(vim.fs.find({ "gradlew", ".git", "mvnw" },
                { upward = true })[1]),
            init_options = {
                settings = {
                    java = {
                        implementationsCodeLens = { enabled = true },
                        imports = { -- <- this
                            gradle = {
                                enabled = true,
                                wrapper = {
                                    enabled = true,
                                    checksums = {
                                        {
                                            sha256 = "e2b82129ab64751fd40437007bd2f7f2afb3c6e41a9198e628650b22d5824a14",
                                            allowed = true
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        require("jdtls").start_or_attach(config)
    end
})

-- json
lsp.jsonls.setup({})

-- swift
lsp.sourcekit.setup({})

-- R
lsp.r_language_server.setup {}

lsp.typos_lsp.setup({
    capabilities = capabilities
})

-- tailwindcss
lsp.tailwindcss.setup{}

---@diagnostic disable: undefined-global
require("packer").startup(function()
    use "wbthomason/packer.nvim"

    use {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
        config = function()
            require("nvim-treesitter.configs").setup({
                highlight = {enable = true},
                indent = {enable = true}
            })
        end
    }

    use "tpope/vim-repeat"
    use "tpope/vim-sensible"
    use "tpope/vim-surround"
    use "b3nj5m1n/kommentary"
    use "jiangmiao/auto-pairs"
    use "alvan/vim-closetag"
    use "michaeljsmith/vim-indent-object"

    use {
        "norcalli/nvim-colorizer.lua",
        config = function() require("colorizer").setup() end
    }

    -- Theming
    use "rktjmp/lush.nvim"
    use "juliusschumacher/wal.vim"
    use "juliusschumacher/lush_wal"
    use "wuelnerdotexe/vim-enfocado"
    use "rebelot/kanagawa.nvim"
    use "ellisonleao/gruvbox.nvim"

    use {
        "lukas-reineke/indent-blankline.nvim",
        config = function()
            require("ibl").setup {
                indent = {
                    smart_indent_cap = true,
                    highlight = "IndentBlankline",
                    char = "│"
                },
                exclude = {
                    filetypes = {
                        "help", "terminal", "dashboard", "packer", "lspinfo",
                        "TelescopePrompt", "TelescopeResults"
                    },
                    buftypes = {"terminal"}
                },
                scope = {highlight = "IndentBlanklineScope"}
            }
        end
    }

    use {
        "lewis6991/gitsigns.nvim",
        requires = {"nvim-lua/plenary.nvim"},
        config = function() require("plugins.configs.gitsigns") end
    }

    use "tpope/vim-fugitive"
    use "junegunn/gv.vim"

    use {
        "freddiehaddad/feline.nvim",
        config = function() require("plugins.configs.feline") end
    }

    use {
        "neovim/nvim-lspconfig",
        config = function() require("plugins.configs.lspconfig") end
    }

    use {"weilbith/nvim-code-action-menu", cmd = "CodeActionMenu"}

    use {"onsails/lspkind-nvim"}

    use {
        "ray-x/lsp_signature.nvim",
        config = function() require("plugins.configs.lspsignature") end
    }

    use "L3MON4D3/LuaSnip"

    use "hrsh7th/cmp-calc"
    use "hrsh7th/cmp-path"
    use "hrsh7th/cmp-nvim-lsp"
    use "hrsh7th/cmp-buffer"
    use {
        "https://github.com/hrsh7th/nvim-cmp",
        config = function() require("plugins.configs.cmp") end
    }

    use "famiu/nvim-reload"

    use {"nvim-telescope/telescope-fzy-native.nvim", run = "make"}

    use {"gbrlsnchs/telescope-lsp-handlers.nvim"}

    use {
        "rcarriga/nvim-dap-ui",
        requires = {"mfussenegger/nvim-dap"},
        config = function() require("plugins.configs.dap") end
    }

    use {"theHamsta/nvim-dap-virtual-text"}

    use {"nvim-telescope/telescope-dap.nvim"}

    use "mfussenegger/nvim-dap-python"

    use {
        "nvim-telescope/telescope.nvim",
        requires = {"nvim-lua/plenary.nvim"},
        config = function()
            require("plugins.configs.telescope")
            require("telescope").load_extension("lsp_handlers")
            require("telescope").load_extension("fzy_native")
            require("telescope").load_extension("dap")
        end
    }

    use {
        "rmagatti/auto-session",
        config = function()
            require("auto-session").setup {
                auto_save_enabled = true,
                auto_restore_enabled = true,
                auto_session_enable_last_session = true
            }
        end
    }

    use_rocks "fzy-lua-native"
    use {
        "gelguy/wilder.nvim",
        rocks = {"fzy-lua-native"},
        run = ":UpdateRemotePlugins",
        config = function() require("plugins.configs.wilder") end
    }

    use {"iamcco/markdown-preview.nvim", run = ":call mkdp#util#install()"}

    use "Darazaki/indent-o-matic"

    use "hashivim/vim-terraform"

    use "ggandor/lightspeed.nvim"

    use "cyberkov/openhab-vim"

    use {
        "lewis6991/spellsitter.nvim",
        config = function() require("spellsitter").setup() end
    }

    use {
        "rcarriga/nvim-notify",
        config = function()
            local notify = require("notify")
            notify.setup({
                background_colour = "Normal",
                fps = 30,
                icons = {
                    DEBUG = "",
                    ERROR = "",
                    INFO = "",
                    TRACE = "✎",
                    WARN = ""
                },
                level = 2,
                minimum_width = 50,
                render = "minimal",
                stages = "slide",
                timeout = 1000
            })
            vim.notify = notify
        end
    }

    use {
        "stevearc/dressing.nvim",
        config = function()
            require("dressing").setup({
                input = {
                    override = function(conf)
                        conf.col = -1
                        conf.row = 0
                        return conf
                    end
                }
            })
        end
    }

    use {
        "smjonas/inc-rename.nvim",
        config = function()
            require("inc_rename").setup({input_buffer_type = "dressing"})
        end
    }

    use {"kevinhwang91/nvim-ufo", requires = "kevinhwang91/promise-async"}

    use {
        "j-hui/fidget.nvim",
        tag = "legacy",
        config = function() require("fidget").setup() end
    }

    use {
        "simrat39/rust-tools.nvim",
        requires = "nvim-lua/plenary.nvim",
        config = function()
            -- Update this path
            local extension_path = "/usr/lib/codelldb/"
            local codelldb_path = extension_path .. "adapter/codelldb"
            local liblldb_path = extension_path .. "lldb/lib/liblldb.so"

            local opts = {
                dap = {
                    adapter = require("rust-tools.dap").get_codelldb_adapter(
                        codelldb_path, liblldb_path)
                }
            }

            -- Normal setup
            require("rust-tools").setup(opts)
        end
    }

    use {
        "folke/which-key.nvim", -- Spacemacs style popup for keybindings
        config = function() require("which-key").setup({}) end
    }

    use {
        "ziontee113/color-picker.nvim",
        config = function() require("color-picker") end
    }

    use {"mxsdev/nvim-dap-vscode-js", requires = {"mfussenegger/nvim-dap"}}

    use {
        "microsoft/vscode-js-debug",
        opt = true,
        run = "npm install --legacy-peer-deps && npm run compile"
    }
    use {
        "microsoft/vscode-chrome-debug",
        opt = true,
        run = "npm install && npm run compile"
    }

    use "suketa/nvim-dap-ruby"

    use {
        "glepnir/lspsaga.nvim",
        branch = "main",
        config = function()
            require("lspsaga").setup({
                lightbulb = {sign_priority = 10, virtual_text = false}
            })
        end
    }

    use {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v2.x",
        requires = {
            "nvim-lua/plenary.nvim", "kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim"
        },
        config = function()
            vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])
            require("neo-tree").setup({
                close_if_last_window = true,
                source_selector = {winbar = false, statusline = false}
            })
        end
    }

    use {
        "jose-elias-alvarez/null-ls.nvim",
        config = function() require("plugins.configs.null-ls") end,
        requires = {"nvim-lua/plenary.nvim"}
    }

    use {
        "MunifTanjim/prettier.nvim",
        requires = {"jose-elias-alvarez/null-ls.nvim"},
        config = function()
            local prettier = require("prettier")

            prettier.setup({
                bin = "prettier", -- or `'prettierd'` (v0.22+)
                filetypes = {
                    "css", "graphql", "html", "javascript", "javascriptreact",
                    "json", "less", "markdown", "scss", "typescript",
                    "typescriptreact", "yaml"
                }
            })
        end
    }
    use {
        "vladdoster/remember.nvim",
        config = function() require("remember") end
    }
    use {
        "simrat39/symbols-outline.nvim",
        config = function() require("symbols-outline").setup() end
    }

    use {
        "nvim-telescope/telescope-frecency.nvim",
        config = function()
            require("telescope").load_extension("frecency")
        end,
        requires = {"kkharji/sqlite.lua"}
    }

    use {
        "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
        config = function() require("lsp_lines").setup() end
    }
    use "echasnovski/mini.nvim"

    use {
        "LukasPietzschmann/telescope-sessions",
        requires = {"LukasPietzschmann/sessions.nvim"}
    }

    use {"takac/vim-hardtime", config = function() end}

    use {"nanotee/sqls.nvim"}

    use {
        "pwntester/octo.nvim",
        requires = {
            "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim",
            "kyazdani42/nvim-web-devicons"
        },
        config = function() require("octo").setup() end
    }

    use {
        "zbirenbaum/copilot.lua",
        config = function()
            require("copilot").setup({
                suggestion = {enabled = false},
                panel = {enabled = false}
            })
        end
    }

    use {
        "zbirenbaum/copilot-cmp",
        after = {"copilot.lua"},
        config = function() require("copilot_cmp").setup() end
    }

    use {"mfussenegger/nvim-jdtls"}

    use {
        "mhartington/formatter.nvim",
        config = function() require("plugins.configs.formatter") end
    }

    use {
        "pmizio/typescript-tools.nvim",
        requires = {"nvim-lua/plenary.nvim", "neovim/nvim-lspconfig"},
        config = function() require("typescript-tools").setup({}) end
    }

    use {"elkowar/yuck.vim"}

    use {
        "kndndrj/nvim-dbee",
        requires = {"MunifTanjim/nui.nvim"},
        run = function()
            -- Install tries to automatically detect the install method.
            -- if it fails, try calling it with one of these parameters:
            --    "curl", "wget", "bitsadmin", "go"
            require("dbee").install()
        end,
        config = function()
            require("dbee").setup {
                lazy = true,
                sources = {
                    require("dbee.sources").FileSource:new(vim.fn.stdpath(
                                                               "cache") ..
                                                               "/dbee/persistence.json")
                }

            }
        end
    }

    use {
        "akinsho/toggleterm.nvim",
        config = function()
            require("toggleterm").setup {
                open_mapping = [[<LEADER>t]],
                direction = 'float',
                float_opts = {border = 'rounded'},
                insert_mappings = false
            }
        end
    }

    use {'ThePrimeagen/harpoon', requires = {'nvim-lua/plenary.nvim'}}

end)

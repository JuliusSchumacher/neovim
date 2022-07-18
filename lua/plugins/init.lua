---@diagnostic disable: undefined-global
require('packer').startup(function()

    use 'wbthomason/packer.nvim'

    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}

    use 'tpope/vim-repeat'
    use 'tpope/vim-sensible'
    use 'tpope/vim-surround'
    -- use 'tpope/vim-commentary'
    use 'b3nj5m1n/kommentary'
    use 'jiangmiao/auto-pairs'
    use 'alvan/vim-closetag'
    use 'michaeljsmith/vim-indent-object'

    use {
        'norcalli/nvim-colorizer.lua',
        config = function()
            require("colorizer").setup()
        end
    }


    use {
        'kyazdani42/nvim-tree.lua',
        requires = 'kyazdani42/nvim-web-devicons',
        config = function()
            require'nvim-tree'.setup {
                diagnostics         = { enable = true },
                disable_netrw       = true,
                hijack_netrw        = true,
                open_on_setup       = false,
                ignore_ft_on_setup  = {},
                open_on_tab         = false,
                hijack_cursor       = false,
                update_cwd          = false, update_focused_file = {
                    enable      = false,
                    update_cwd  = false,
                    ignore_list = {}
                },
                system_open = {
                    cmd  = nil,
                    args = {}
                },
            }
            require('plugins.configs.nvimtree')
        end
    }

    -- Theming
    use 'rktjmp/lush.nvim'
    use 'juliusschumacher/wal.vim'
    use "juliusschumacher/lush_wal"
    use 'wuelnerdotexe/vim-enfocado'

    use {
        "lukas-reineke/indent-blankline.nvim",
        config = function()
            require("indent_blankline").setup {
                indentLine_enabled = 1,
                char = "▏",
                filetype_exclude = {
                    "help",
                    "terminal",
                    "dashboard",
                    "packer",
                    "lspinfo",
                    "TelescopePrompt",
                    "TelescopeResults",
                },
                buftype_exclude = { "terminal" },
                show_trailing_blankline_indent = false,
                show_first_indent_level = false,
                show_current_context = true,
            }
        end
    }

    use {
        'lewis6991/gitsigns.nvim',
        requires = {
        'nvim-lua/plenary.nvim'
        },
        config = function()
            require('plugins.configs.gitsigns')
        end
    }

    use 'tpope/vim-fugitive'
    use 'junegunn/gv.vim'


    use {
        'famiu/feline.nvim',
        config = function()
            require('plugins.configs.feline')
        end
    }

    use {
        'neovim/nvim-lspconfig',
        config = function()
            require('plugins.configs.lspconfig')
        end
    }

    use {
        'weilbith/nvim-code-action-menu',
        cmd = 'CodeActionMenu',
    }

    use {
        'onsails/lspkind-nvim'
    }

    use {
        'ray-x/lsp_signature.nvim',
        config = function()
            require('plugins.configs.lspsignature')
        end
    }

    use 'L3MON4D3/LuaSnip'

    use 'hrsh7th/cmp-calc'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use {
        'tzachar/cmp-tabnine',
        run='./install.sh',
    }

    use {
        'https://github.com/hrsh7th/nvim-cmp',
        config = function()
            require('plugins.configs.cmp')
        end
    }

    use {
        'akinsho/bufferline.nvim',
        requires = 'kyazdani42/nvim-web-devicons',
        config = function()
            require('plugins.configs.bufferline')
        end
    }

    use 'famiu/nvim-reload'

    use {
        'nvim-telescope/telescope-fzf-native.nvim',
        run = 'make',
        }

    use {
        'gbrlsnchs/telescope-lsp-handlers.nvim',
    }

    use {
        "rcarriga/nvim-dap-ui",
        requires = {"mfussenegger/nvim-dap"},
        config = function()
            require('plugins.configs.dap')
        end
    }

    use {
        'theHamsta/nvim-dap-virtual-text'
    }

    use {
        'nvim-telescope/telescope-dap.nvim'
    }

    use 'mfussenegger/nvim-dap-python'


    use {
        'nvim-telescope/telescope.nvim',
        requires = { 'nvim-lua/plenary.nvim' },
        config = function()
            require('telescope').setup({
                extensions = {
                    lsp_handlers = {
                        code_action = {
                            telescope = require("telescope.themes").get_dropdown({}),
                        },
                    },
                },
            })
            require('telescope').load_extension('lsp_handlers')
            require('telescope').load_extension('fzf')
            require('telescope').load_extension('dap')
        end
    }

    use 'rmagatti/auto-session'

    use_rocks 'fzy-lua-native'
    use {
        'gelguy/wilder.nvim',
        rocks = { 'fzy-lua-native' },
        run = ':UpdateRemotePlugins',
        config = function ()
            require('plugins.configs.wilder')
        end
    }


    use {
        'iamcco/markdown-preview.nvim',
        run = ':call mkdp#util#install()'
    }

    use 'Darazaki/indent-o-matic'

    use 'hashivim/vim-terraform'

    use 'ggandor/lightspeed.nvim'

    use 'tpope/vim-dadbod'

    use 'kristijanhusak/vim-dadbod-ui'

    use 'cyberkov/openhab-vim'

    use {
        'lewis6991/spellsitter.nvim',
        config = function()
            require('spellsitter').setup()
        end
    }

    use {
        'rcarriga/nvim-notify',

        config = function()
            local notify = require("notify")
            notify.setup {
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
                render = "default",
                stages = "slide",
                timeout = 5000
              }
        ;
            vim.notify = notify
        end
    }

    use {
        'stevearc/dressing.nvim',
        config = function()
            require("dressing").setup {
                input = {
                    override = function(conf)
                        conf.col = -1
                        conf.row = 0
                        return conf
                    end,
                },
            }
        end
    }

    use {
        "smjonas/inc-rename.nvim",
        config = function()
            require("inc_rename").setup()
        end,
    }

    use {
        'kevinhwang91/nvim-ufo',
        requires = 'kevinhwang91/promise-async'
    }

    use {
        'j-hui/fidget.nvim',
        config = function()
            require'fidget'.setup()
        end
    }


end)

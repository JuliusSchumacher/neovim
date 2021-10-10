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
    use 'ap/vim-css-color'

    use {
        'kyazdani42/nvim-tree.lua',
        requires = 'kyazdani42/nvim-web-devicons',
        config = function()
            require('plugins.configs.nvimtree')
            require'nvim-tree'.setup {
                lsp_diagnostics     = true,
                disable_netrw       = true,
                hijack_netrw        = true,
                open_on_setup       = false,
                ignore_ft_on_setup  = {},
                auto_close          = true,
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
        end
    }

    -- Theming
    use 'rktjmp/lush.nvim'
    use 'juliusschumacher/wal.vim'
    use "juliusschumacher/lush_wal"

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

    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'

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
        'nvim-telescope/telescope-dap.nvim'
    }

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

    use {
        'mfussenegger/nvim-dap',
        config = function()
            require('plugins.configs.dap')
        end
    }

    use 'rmagatti/auto-session'

    use 'gelguy/wilder.nvim'

end)

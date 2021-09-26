require('packer').startup(function()

    use 'wbthomason/packer.nvim'

    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}

    use 'tpope/vim-repeat'
    use 'tpope/vim-sensible'
    use 'tpope/vim-surround'
    use 'tpope/vim-commentary'
    use 'jiangmiao/auto-pairs'
    use 'alvan/vim-closetag'
    use 'michaeljsmith/vim-indent-object'

    use {
        'kyazdani42/nvim-tree.lua',
        requires = 'kyazdani42/nvim-web-devicons',
        config = function()
            require('plugins.configs.nvimtree')
            require'nvim-tree'.setup {
                disable_netrw       = true,
                hijack_netrw        = true,
                open_on_setup       = false,
                ignore_ft_on_setup  = {},
                auto_close          = true,
                open_on_tab         = false,
                hijack_cursor       = false,
                update_cwd          = false,
                update_focused_file = {
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

    use 'juliusschumacher/wal.vim'
    use 'noahfrederick/vim-noctu'
    use 'jsit/disco.vim'

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

    use 'famiu/feline.nvim'

    use {
        'neovim/nvim-lspconfig',
        config = function()
            require('plugins.configs.lspconfig')
        end
    }

    use {
        'onsails/lspkind-nvim',
        config = function()
            require('lspkind').init({
                with_text = true,
                preset = 'default'
            })

        end
    }

    use {
        'ray-x/lsp_signature.nvim',
        config = function()
            require('plugins.configs.lspsignature')
        end
    }

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

    -- use 'omnisharp/omnisharp-vim'
    -- use 'nickspoons/vim-sharpenup'
    -- use 'dense-analysis/ale'


end)

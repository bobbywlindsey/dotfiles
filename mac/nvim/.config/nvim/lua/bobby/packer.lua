-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use 'preservim/nerdtree'

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.8',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    use({
        'rose-pine/neovim',
        as = 'rose-pine',
        config = function()
            vim.cmd('colorscheme rose-pine')
        end
    })
    use { "catppuccin/nvim", as = "catppuccin" }

    use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
    use {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        requires = { { "nvim-lua/plenary.nvim" } }
    }
    use('mbbill/undotree')
    use('tpope/vim-fugitive')

    use({
        'MeanderingProgrammer/render-markdown.nvim',
        after = { 'nvim-treesitter' },
        requires = { 'echasnovski/mini.nvim', opt = true },
    })

    -- Managed LSPs w/ Mason
    use {
        "williamboman/mason.nvim",
        run = ":MasonUpdate",
    }

    use {
        "williamboman/mason-lspconfig.nvim",
        requires = {
            { "mason-org/mason.nvim", opts = {} },
            "neovim/nvim-lspconfig",
        },
    }

    -- Manage LSP server tools
    use {
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        requires = { "williamboman/mason.nvim" },
    }

    use({
        "neovim/nvim-lspconfig",
        requires = {
            "saghen/blink.cmp",
            {
                "folke/lazydev.nvim",
                ft = "lua",
                opts = {
                    library = {
                        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
                    },
                },
            },
        },
    })

    use {
        "saghen/blink.cmp",
        requires = {
            "rafamadriz/friendly-snippets"
        },
    }

    use {
        requires = {
            "echasnovski/mini.icons",
            'nvim-tree/nvim-web-devicons'
        },
        "folke/which-key.nvim",
    }

    use("christoomey/vim-tmux-navigator")
    use {
        "vim-test/vim-test",
        requires = {
            "preservim/vimux"
        }
    }
end)

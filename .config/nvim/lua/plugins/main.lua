return require'packer'.startup(function()
    use 'wbthomason/packer.nvim'
    use 'kyazdani42/nvim-web-devicons'
    use 'kyazdani42/nvim-tree.lua'
    use 'nvim-lualine/lualine.nvim'
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }
    use 'neovim/nvim-lspconfig'
    use 'tami5/lspsaga.nvim'
    use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
    use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
    use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
    use 'L3MON4D3/LuaSnip' -- Snippets plugin
    use 'akinsho/bufferline.nvim'
    use {
        'nvim-telescope/telescope.nvim',
        requires = { {'nvim-lua/plenary.nvim'} }
    }
    use 'tpope/vim-surround'
    use 'folke/trouble.nvim' 
    use 'tpope/vim-commentary'
    use {
      "windwp/nvim-autopairs",
    }
    use 'sainnhe/sonokai'
end)

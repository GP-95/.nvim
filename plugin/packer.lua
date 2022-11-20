local vim = vim
local execute = vim.api.nvim_command
local fn = vim.fn

-- ensure that packer is installed
local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
    execute 'packadd packer.nvim'
end
vim.cmd('packadd packer.nvim')
local packer = require'packer'
local util = require'packer.util'
packer.init({
  package_root = util.join_paths(vim.fn.stdpath('data'), 'site', 'pack')
})

--- startup and add configure plugins
packer.startup(function(use)
    use 'wbthomason/packer.nvim'

	-- Treesitter
    use 'nvim-treesitter/nvim-treesitter-context'
    use 'nvim-treesitter/nvim-treesitter'
    use 'sheerun/vim-polyglot'

	-- Formatting
    use {'mhartington/formatter.nvim'}
    use {'MunifTanjim/prettier.nvim'}
    use 'windwp/nvim-ts-autotag'
    use 'windwp/nvim-autopairs'
    use 'tpope/vim-surround'

    use {
      'numToStr/Comment.nvim',
      config = function()
        require('Comment').setup()
      end
    }

	-- Theme
    use 'tjdevries/colorbuddy.nvim'
    use 'folke/tokyonight.nvim'
    use 'lukas-reineke/indent-blankline.nvim'

	-- Interface
    use 'kevinhwang91/nvim-hlslens'
    use 'petertriho/nvim-scrollbar'
    use 'glepnir/dashboard-nvim'
    use 'mbbill/undotree'
    use 'j-hui/fidget.nvim'

    use {
      'sindrets/diffview.nvim',
      requires = {
        'nvim-lua/plenary.nvim'
      }
    }

    use {
        'nvim-lualine/lualine.nvim',
        requires = {
            'kyazdani42/nvim-web-devicons',
            opt = true
        }
    }

    use {
      'akinsho/bufferline.nvim',
      tag = 'v2.*',
      requires = 'kyazdani42/nvim-web-devicons'
    }

    use {
      'akinsho/toggleterm.nvim',
      tag = '*',
      config = function()
        require('toggleterm').setup()
      end
    }

    use {
      'airblade/vim-gitgutter'
    }

    use {
      'folke/trouble.nvim',
      requires = 'kyazdani42/nvim-web-devicons'
    }

	-- LSP
    use 'neovim/nvim-lspconfig'
    use 'williamboman/mason.nvim'
    use 'williamboman/mason-lspconfig.nvim'
    use 'RRethy/vim-illuminate'
    use ({
      'jose-elias-alvarez/null-ls.nvim',
      config = function()
        require('null-ls').setup()
      end,
      requires = { "nvim-lua/plenary.nvim" }
    })

    -- LSP extensions
    use { 'L3MON4D3/LuaSnip' }
    use { 'saadparwaiz1/cmp_luasnip' }
    use "rafamadriz/friendly-snippets"
    use 'folke/neodev.nvim'
    use 'onsails/lspkind.nvim'
    use 'simrat39/rust-tools.nvim'
    use {
      'hrsh7th/nvim-cmp',
      requires = {
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-nvim-lua',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-nvim-lsp-signature-help',
      }
    }

    use {
      'saecki/crates.nvim',
      tag = 'v0.3.0',
      requires = {
        'nvim-lua/plenary.nvim'
      },
      config = function()
        require('crates').setup()
      end
    }

    -- Telescope
    use 'nvim-lua/telescope.nvim'
    use {
      'nvim-telescope/telescope-fzf-native.nvim',
      run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
    }

    -- Debugging
    use 'mfussenegger/nvim-dap'
    use {
      'rcarriga/nvim-dap-ui',
      requires = {
        'mfussenegger/nvim-dap'
      }
    }


    -- Utility / random
    use 'nvim-lua/popup.nvim'
    use 'nvim-lua/plenary.nvim'
    use 'jremmen/vim-ripgrep'
    use 'tpope/vim-fugitive'
end
)

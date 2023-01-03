return require("packer").startup(function(use)
	-- Package manager
	use("wbthomason/packer.nvim")

	-- Treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})

	use({
		"VonHeikemen/lsp-zero.nvim",
		requires = {
			-- LSP Support
			{ "neovim/nvim-lspconfig" },
			{ "williamboman/mason.nvim" },
			{ "williamboman/mason-lspconfig.nvim" },

			-- Autocompletion
			{ "hrsh7th/nvim-cmp" },
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-path" },
			{ "saadparwaiz1/cmp_luasnip" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "hrsh7th/cmp-nvim-lua" },

			-- Snippets
			{ "L3MON4D3/LuaSnip" },
			{ "rafamadriz/friendly-snippets" },
		},
	})

	-- Rust
	use({
		"saecki/crates.nvim",
		tag = "v0.3.0",
		requires = { "nvim-lua/plenary.nvim" },
		config = function()
			require("crates").setup()
		end,
	})
	use("simrat39/rust-tools.nvim")

	-- Fuzzy finder
	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.0",
		requires = { "nvim-lua/plenary.nvim" },
	})

	-- Theme
	use("folke/tokyonight.nvim")
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons" },
	})
	use("lewis6991/gitsigns.nvim")
	use("petertriho/nvim-scrollbar")

	-- Utilities
	use("mbbill/undotree")
	use("akinsho/toggleterm.nvim")
	use("tpope/vim-fugitive")
	use("terrortylor/nvim-comment")
	use("j-hui/fidget.nvim")
	use("yamatsum/nvim-cursorline")
	use("jose-elias-alvarez/null-ls.nvim")
    use('f-person/git-blame.nvim')
end)

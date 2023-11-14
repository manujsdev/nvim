local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

local ok, packer = pcall(require, "packer")
if not ok then
	return
end

packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" }) -- Using a floating window
		end,
	},
})

return packer.startup(function(use)
	use("wbthomason/packer.nvim")
	-- Generics
	use("nvim-lua/plenary.nvim")
	use("lewis6991/impatient.nvim")

	-- My colorscheme`
	use("ellisonleao/gruvbox.nvim")
	use("sainnhe/gruvbox-material")

	-- File explorer
	use({
		"nvim-tree/nvim-tree.lua",
		requires = {
			"nvim-tree/nvim-web-devicons", -- optional, for file icons
		},
		tag = "nightly", -- optional, updated every week.
	})

	use("nvim-lualine/lualine.nvim") -- a statusline

	use({ "akinsho/bufferline.nvim", tag = "v2.*", requires = "kyazdani42/nvim-web-devicons" })

	use({ "nvim-telescope/telescope.nvim", tag = "0.1.0" })

	-- CMP
	use({
		"hrsh7th/nvim-cmp",
		requires = {
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-nvim-lua",
			"onsails/lspkind-nvim",
			"hrsh7th/cmp-vsnip",
			"hrsh7th/vim-vsnip",
			"saadparwaiz1/cmp_luasnip",
			"L3MON4D3/LuaSnip",
			"rafamadriz/friendly-snippets",
		},
	})

	-- LSP
	use({
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
	})

	-- Treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
	})
	--	use({
	--	"nvim-treesitter/nvim-treesitter",
	--run = function()
	--		require("nvim-treesitter.install").update({ with_sync = true })
	--	end,
	--})
	use("p00f/nvim-ts-rainbow")
	use("nvim-treesitter/playground")

	-- Git
	use("lewis6991/gitsigns.nvim")
	use({ "sindrets/diffview.nvim", requires = "nvim-lua/plenary.nvim" })

	-- Project
	use("ahmedkhalf/project.nvim")
	use("goolord/alpha-nvim")

	-- Utils
	use("windwp/nvim-autopairs") -- "", '', {}, [], ()
	use("norcalli/nvim-colorizer.lua") -- colorizer the colors
	use("lukas-reineke/indent-blankline.nvim") -- adds indentation guides to all lines (including empty lines)
	use("jose-elias-alvarez/null-ls.nvim")

	-- codeium AI
	use("Exafunction/codeium.vim")

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if packer_bootstrap then
		require("packer").sync()
	end
end)

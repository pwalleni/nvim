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
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

local status, packer = pcall(require, "packer")
if not status then
	return
end

return packer.startup(function(use)
	use("wbthomason/packer.nvim")

	use("nvim-lua/plenary.nvim")

	--  use("Mofiqul/dracula.nvim")
	-- use("bluz71/vim-nightfly-guicolors")
	use({ "ellisonleao/gruvbox.nvim" })

	-- use("christoomey/vim-tmux-navigator")

	-- use("szw/vim-maximizer")

	use("tpope/vim-surround")

	use("vim-scripts/ReplaceWithRegister")

	use("numToStr/Comment.nvim")

	use("kyazdani42/nvim-web-devicons")

	use("nvim-lualine/lualine.nvim")

	-- fuzzy finding
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
	use({ "nvim-telescope/telescope.nvim", branch = "0.1.x" })

	-- autocompletion
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")

	-- snippets
	use("L3MON4D3/LuaSnip")
	use("saadparwaiz1/cmp_luasnip")
	use("rafamadriz/friendly-snippets")

	-- LSP managing and installing servers
	use({ "williamboman/mason.nvim" })
	use("williamboman/mason-lspconfig.nvim")

	-- LSP configuring servers
	use("neovim/nvim-lspconfig")
	use("hrsh7th/cmp-nvim-lsp")
	use("onsails/lspkind.nvim")

	-- formating and linting
	use("jose-elias-alvarez/null-ls.nvim")
	use("jayp0521/mason-null-ls.nvim")

	-- formating and linting
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			require("nvim-treesitter.install").update({ with_sync = true })
		end,
	})

	-- auto closing
	use("windwp/nvim-ts-autotag")

	-- gitsigns
	use("lewis6991/gitsigns.nvim")

	-- markdownpreview
	use({
		"iamcco/markdown-preview.nvim",
		run = "cd app && npm install",
		setup = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
		ft = { "markdown" },
	})

	-- undo tree
	use("mbbill/undotree")

	-- trouble pane
	use({
		"folke/trouble.nvim",
		config = function()
			require("trouble").setup({
				mode = "document_diagnostics",
				height = 20,
				auto_open = true,
			})
		end,
	})

	-- which key
	use({
		"folke/which-key.nvim",
		config = function()
			require("which-key").setup({
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			})
		end,
	})

	-- zen mode
	use({
		"folke/zen-mode.nvim",
		config = function()
			require("zen-mode").setup({
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			})
		end,
	})

	if packer_boostrap then
		require("packer").sync()
	end
end)

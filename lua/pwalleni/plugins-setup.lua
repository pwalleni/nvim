-- plugins-setup.lua
-- This file initializes and configures all plugins using lazy.nvim

-- Lazy.nvim bootstrap
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- Setup plugins
require("lazy").setup({
	-- Plugin Manager
	"folke/lazy.nvim",

	-- Dependencies
	{ "nvim-lua/plenary.nvim" },

	-- UI
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("lualine").setup()
		end,
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		opts = {
			indent = {
				char = "┊", -- change to "│", "┆", "┊", "¦", or anything you like
			},
			scope = {
				enabled = true,
				show_start = true,
				show_end = true,
			},
			exclude = {
				filetypes = { "help", "lazy", "Trouble", "lspinfo" },
				buftypes = { "terminal", "nofile" },
			},
		},
	},
	{
		"ellisonleao/gruvbox.nvim",
		priority = 1000, -- makes sure this runs before most others
		lazy = false, -- load immediately (not on event)
	},

	-- Telescope
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("telescope").setup()
		end,
	},

	-- Treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter.configs").setup({
				highlight = { enable = true },
			})
		end,
	},

	-- Git
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()
		end,
	},

	-- Comment
	{
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	},

	-- Autocompletion
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-cmdline",
		},
		config = function()
			require("pwalleni.plugins.nvim-cmp")
		end,
	},

	-- LSP
	{
		"neovim/nvim-lspconfig",
		config = function()
			require("pwalleni.plugins.lsp.lspconfig")
		end,
	},
	{
		"nvimdev/lspsaga.nvim",
		config = function()
			require("pwalleni.plugins.lsp.lspsaga")
		end,
	},
	{
		"williamboman/mason.nvim",
		build = ":MasonUpdate",
		config = function()
			require("pwalleni.plugins.lsp.mason")
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = { "williamboman/mason.nvim" },
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"ts_ls",
					"marksman",
					"html",
					"lua_ls",
					"vale_ls",
				},
			})
		end,
	},
	{
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("trouble").setup()
		end,
	},

	-- 🧼 REPLACEMENT FOR null-ls
	{
		"nvimtools/none-ls.nvim", -- Fork of null-ls
		config = function()
			require("pwalleni.plugins.lsp.none-ls")
		end,
	},

	-- Optionally add your snippets here
}, {
	ui = {
		border = "rounded",
	},
})

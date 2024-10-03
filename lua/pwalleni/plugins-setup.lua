return {

	{
		"prettier/vim-prettier",
		run = "yarn install", -- or 'npm install'
		ft = { "javascript", "typescript", "css", "less", "scss", "json", "graphql", "vue", "html", "python" },
		config = function()
			-- Optional: you can add key mappings or other configurations here
			vim.cmd([[nnoremap <leader>p :Prettier<CR>]])
		end,
	},

	{
		"junegunn/vim-easy-align",
	},

	{
		"kyazdani42/nvim-web-devicons",
	},

	{
		"echasnovski/mini.icons",
	},

	{
		"iamcco/markdown-preview.nvim",
		run = "cd app && npm install",
		setup = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
		ft = { "markdown" },
	},

	{
		"folke/which-key.nvim",
	},

	{
		"neovim/nvim-lspconfig",
		config = function()
			require("pwalleni.plugins.lsp.lspconfig")
		end,
	},

	-- Telescope FZF Native Extension
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		build = "make",
	},

	-- Colorscheme
	{
		"morhetz/gruvbox",
		config = function()
			vim.cmd("colorscheme gruvbox")
		end,
	},

	-- LSP Plugins
	{
		"williamboman/mason.nvim",
		config = function()
			require("pwalleni.plugins.lsp.mason")
		end,
	},
	{
		"glepnir/lspsaga.nvim",
		config = function()
			require("pwalleni.plugins.lsp.lspsaga")
		end,
	},
	{
		"jose-elias-alvarez/null-ls.nvim",
		config = function()
			require("pwalleni.plugins.lsp.null-ls")
		end,
	},
	{
		"jay-babu/mason-null-ls.nvim",
		dependencies = {
			"williamboman/mason.nvim",
			"jose-elias-alvarez/null-ls.nvim",
		},
		config = function()
			require("mason-null-ls").setup({
				ensure_installed = nil,
				automatic_installation = true,
				automatic_setup = false,
			})
		end,
	},

	-- Completion and Snippets
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			{
				"L3MON4D3/LuaSnip",
				event = "LspAttach",
				dependencies = { "rafamadriz/friendly-snippets" },
				version = "v2.*",
				build = "make install_jsregexp",
				init = function()
					require("luasnip.loaders.from_vscode").lazy_load()
					require("luasnip.loaders.from_vscode").lazy_load({ paths = { "./snippets" } })
				end,
			},

			"saadparwaiz1/cmp_luasnip",
		},
		config = function()
			require("pwalleni.plugins.nvim-cmp")
		end,
	},

	-- Other Plugins
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			require("pwalleni.plugins.treesitter")
		end,
	},
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("pwalleni.plugins.gitsigns")
		end,
	},
	{
		"numToStr/Comment.nvim",
		config = function()
			require("pwalleni.plugins.comment")
		end,
	},
	{
		"nvim-lualine/lualine.nvim",
		config = function()
			require("pwalleni.plugins.lualine")
		end,
	},
	{
		"nvim-telescope/telescope.nvim",
		config = function()
			require("pwalleni.plugins.telescope")
		end,
	},

	{
		"folke/trouble.nvim",
		opts = {}, -- for default options, refer to the configuration section for custom setup.
		cmd = "Trouble",
		keys = {
			{
				"<leader>tt",
				"<cmd>Trouble diagnostics toggle<cr>",
				desc = "Diagnostics (Trouble)",
			},
			{
				"<leader>xX",
				"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
				desc = "Buffer Diagnostics (Trouble)",
			},
			{
				"<leader>cs",
				"<cmd>Trouble symbols toggle focus=false<cr>",
				desc = "Symbols (Trouble)",
			},
			{
				"<leader>cl",
				"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
				desc = "LSP Definitions / references / ... (Trouble)",
			},
			{
				"<leader>xL",
				"<cmd>Trouble loclist toggle<cr>",
				desc = "Location List (Trouble)",
			},
			{
				"<leader>xQ",
				"<cmd>Trouble qflist toggle<cr>",
				desc = "Quickfix List (Trouble)",
			},
		},
	},
}

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
                        require("pwalleni.plugins.lualine")
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
		dependencies = { 
			"nvim-lua/plenary.nvim",
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		},
		config = function()
			require("pwalleni.plugins.telescope")
		end,
	},

	-- Treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			require("pwalleni.plugins.treesitter")
		end,
	},

	-- Git
        {
                "lewis6991/gitsigns.nvim",
                config = function()
                        require("pwalleni.plugins.gitsigns")
                end,
        },

	-- Comment
        {
                "numToStr/Comment.nvim",
                config = function()
                        require("pwalleni.plugins.comment")
                end,
        },

	-- File Tree
	{
		"nvim-tree/nvim-tree.lua",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			-- disable netrw at the very start of your init.lua
			vim.g.loaded_netrw = 1
			vim.g.loaded_netrwPlugin = 1
			
			require("nvim-tree").setup({
				sort_by = "case_sensitive",
				view = {
					width = 30,
					side = "left",
				},
				renderer = {
					group_empty = true,
					icons = {
						show = {
							file = true,
							folder = true,
							folder_arrow = true,
							git = true,
						},
					},
				},
				filters = {
					dotfiles = false,
					custom = { ".git", "node_modules", ".cache" },
				},
				git = {
					enable = true,
					ignore = false,
				},
				actions = {
					open_file = {
						quit_on_open = false,
					},
				},
			})
		end,
	},

	-- Markdown Preview
	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		ft = { "markdown" },
		build = function() vim.fn["mkdp#util#install"]() end,
		config = function()
			vim.g.mkdp_auto_start = 0
			vim.g.mkdp_auto_close = 1
			vim.g.mkdp_refresh_slow = 0
			vim.g.mkdp_command_for_global = 0
			vim.g.mkdp_open_to_the_world = 0
			vim.g.mkdp_open_ip = ''
			vim.g.mkdp_browser = ''
			vim.g.mkdp_echo_preview_url = 0
			vim.g.mkdp_browserfunc = ''
			vim.g.mkdp_preview_options = {
				mkit = {},
				katex = {},
				uml = {},
				maid = {},
				disable_sync_scroll = 0,
				sync_scroll_type = 'middle',
				hide_yaml_meta = 1,
				sequence_diagrams = {},
				flowchart_diagrams = {},
				content_editable = false,
				disable_filename = 0
			}
			vim.g.mkdp_markdown_css = ''
			vim.g.mkdp_highlight_css = ''
			vim.g.mkdp_port = ''
			vim.g.mkdp_page_title = '「${name}」'
		end,
	},

	-- Markdown Table Tools
	{
		"dhruvasagar/vim-table-mode",
		ft = { "markdown" },
		config = function()
			vim.g.table_mode_corner = '|'
			vim.g.table_mode_corner_corner = '|'
			vim.g.table_mode_header_fillchar = '-'
		end,
	},

	-- YAML Support
	{
		"cuducos/yaml.nvim",
		ft = { "yaml" },
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-telescope/telescope.nvim",
		},
	},

	-- Markdown utilities
	{
		"jakewvincent/mkdnflow.nvim",
		ft = "markdown",
		config = function()
			require("mkdnflow").setup({
				modules = {
					bib = true,
					buffers = true,
					conceal = true,
					cursor = true,
					folds = true,
					fzf = false,
					links = true,
					lists = true,
					maps = true,
					paths = true,
					tables = true,
					yaml = false
				},
				filetypes = {md = true, rmd = true, markdown = true},
				create_dirs = true,
				perspective = {
					priority = 'first',
					fallback = 'current',
					root_tell = false,
					nvim_wd_heel = false,
					update = false
				},
				wrap = false,
				silent = false,
				links = {
					style = 'markdown',
					name_is_source = false,
					conceal = false,
					context = 0,
					implicit_extension = nil,
					transform_implicit = false,
					transform_explicit = function(text)
						text = text:gsub(" ", "-")
						text = text:lower()
						return(text)
					end
				},
				new_file_template = {
					use_template = false,
					template = "# {{ title }}"
				},
				to_do = {
					symbols = {' ', '-', 'X'},
					update_parents = true,
					not_started = ' ',
					in_progress = '-',
					complete = 'X'
				},
				tables = {
					trim_whitespace = true,
					format_on_move = true,
					auto_extend_rows = false,
					auto_extend_cols = false,
				},
				mappings = {
					MkdnEnter = {{'n', 'v'}, '<CR>'},
					MkdnTab = false,
					MkdnSTab = false,
					MkdnNextLink = {'n', '<Tab>'},
					MkdnPrevLink = {'n', '<S-Tab>'},
					MkdnNextHeading = {'n', ']]'},
					MkdnPrevHeading = {'n', '[['},
					MkdnGoBack = {'n', '<BS>'},
					MkdnGoForward = {'n', '<Del>'},
					MkdnCreateLink = false,
					MkdnCreateLinkFromClipboard = {{'n', 'v'}, '<leader>p'},
					MkdnFollowLink = false,
					MkdnDestroyLink = {'n', '<M-CR>'},
					MkdnTagSpan = {'v', '<M-CR>'},
					MkdnMoveSource = {'n', '<F2>'},
					MkdnIncreaseHeading = {'n', '+'},
					MkdnDecreaseHeading = {'n', '-'},
					MkdnToggleToDo = {{'n', 'v'}, '<C-Space>'},
					MkdnNewListItem = false,
					MkdnNewListItemBelowInsert = {'n', 'o'},
					MkdnNewListItemAboveInsert = {'n', 'O'},
					MkdnExtendList = false,
					MkdnUpdateNumbering = {'n', '<leader>nn'},
					MkdnTableNextCell = {'i', '<Tab>'},
					MkdnTablePrevCell = {'i', '<S-Tab>'},
					MkdnTableNextRow = false,
					MkdnTablePrevRow = {'i', '<M-CR>'},
					MkdnTableNewRowBelow = {'n', '<leader>ir'},
					MkdnTableNewRowAbove = {'n', '<leader>iR'},
					MkdnTableNewColAfter = {'n', '<leader>ic'},
					MkdnTableNewColBefore = {'n', '<leader>iC'},
					MkdnFoldSection = {'n', '<leader>f'},
					MkdnUnfoldSection = {'n', '<leader>F'},
				}
			})
		end,
	},

	-- Better syntax highlighting for markdown
	{
		"preservim/vim-markdown",
		ft = "markdown",
		config = function()
			vim.g.vim_markdown_folding_disabled = 1
			vim.g.vim_markdown_conceal = 2
			vim.g.vim_markdown_conceal_code_blocks = 0
			vim.g.vim_markdown_math = 1
			vim.g.vim_markdown_toml_frontmatter = 1
			vim.g.vim_markdown_frontmatter = 1
			vim.g.vim_markdown_strikethrough = 1
			vim.g.vim_markdown_autowrite = 1
			vim.g.vim_markdown_edit_url_in = 'tab'
			vim.g.vim_markdown_follow_anchor = 1
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
					"yamlls",
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

require("nvim-treesitter.configs").setup({
	-- A list of parser names, or "all"
	ensure_installed = {
		"lua",
		"vim",
		"vimdoc",
		"markdown",
		"markdown_inline",
		"yaml",
		"json",
		"html",
		"css",
		"javascript",
		"typescript",
		"python",
		"bash",
		"toml",
		"dockerfile",
		"gitignore",
	},

	-- Install parsers synchronously (only applied to `ensure_installed`)
	sync_install = false,

	-- Automatically install missing parsers when entering buffer
	auto_install = true,

	highlight = {
		enable = true,
		-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
		-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
		-- Using this option may slow down your editor, and you may see some duplicate highlights.
		-- Instead of true it can also be a list of languages
		additional_vim_regex_highlighting = { "markdown" },
	},

	indent = {
		enable = true,
		-- Disable for markdown to avoid conflicts with vim-markdown
		disable = { "markdown" },
	},

	autotag = { 
		enable = true 
	},

	-- Incremental selection based on the named nodes from the grammar
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "<C-space>",
			node_incremental = "<C-space>",
			scope_incremental = "<C-s>",
			node_decremental = "<M-space>",
		},
	},
})

-- Set mapleader
vim.g.mapleader = " "

-- Initialize Lazy.nvim
require("pwalleni.plugins-setup")

-- Source additional core configuration
require("pwalleni.core.colorscheme")
require("pwalleni.core.keymaps")
require("pwalleni.core.options")
require("pwalleni.core.autocmds")

-- Load snippets
require("pwalleni.snippets.diataxis_snippets")
require("pwalleni.snippets.mkdocs_admonition_snippets")
require("pwalleni.snippets.techdocs_snippets")

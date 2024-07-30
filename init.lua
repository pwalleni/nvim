-- Set mapleader
vim.g.mapleader = " "

-- Load lazy.nvim
vim.cmd("packadd lazy.nvim")

-- Initialize Lazy.nvim
require("lazy").setup("pwalleni.plugins-setup")

-- Source additional core configuration
require("pwalleni.core.colorscheme")
require("pwalleni.core.keymaps")
require("pwalleni.core.options")

-- Set colorscheme
vim.cmd("colorscheme gruvbox")

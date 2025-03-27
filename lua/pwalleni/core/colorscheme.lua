local ok, _ = pcall(vim.cmd, "colorscheme gruvbox")
if not ok then
	vim.notify("Colorscheme 'gruvbox' not found!", vim.log.levels.WARN)
end

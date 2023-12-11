local status, treesitter = pcall(require, "nvim-treesitter.configs")
if not status then
	return
end

treesitter.setup({
	highlight = { enable = true },
	indent = { enable = true },
	autotag = { enable = true },
	ensure_installed = {
		"json",
		"markdown",
		"yaml",
		"html",
		"lua",
		"vim",
		"dockerfile",
		"gitignore",
	},
	auto_install = true,
})

require("mason").setup()

-- Setup Mason LSP bridge
require("mason-lspconfig").setup({
	ensure_installed = {
		"ts_ls",
		"marksman",
		"html",
		"lua_ls",
		"vale_ls",
	},
})

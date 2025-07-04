local lspconfig_status, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status then
	return
end

local cmp_nvim_lsp_status, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_nvim_lsp_status then
	return
end

local keymap = vim.keymap

-- enable keybinds only when LSP is active
local on_attach = function(client, bufnr)
	local opts = { noremap = true, silent = true, buffer = bufnr }

	keymap.set("n", "gf", "<cmd>Lspsaga lsp_finder<CR>", opts)
	keymap.set("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
	keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<CR>", opts)
	keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
	keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts)
	keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts)
	keymap.set("n", "<leader>D", "<cmd>Lspsaga show_line_diagnostics<CR>", opts)
	keymap.set("n", "<leader>d", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts)
	keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts)
	keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)
	keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts)
	keymap.set("n", "<leader>o", "<cmd>LSoutlineToggle<CR>", opts)

	-- TypeScript-specific
	if client.name == "tsserver" then
		keymap.set("n", "<leader>rf", ":TypescriptRenameFile<CR>", opts)
		keymap.set("n", "<leader>oi", ":TypescriptOrganizeImports<CR>", opts)
		keymap.set("n", "<leader>ru", ":TypescriptRemoveUnused<CR>", opts)
	end
end

-- Completion capabilities
local capabilities = cmp_nvim_lsp.default_capabilities()

-- Configure diagnostic UI
vim.diagnostic.config({
	virtual_text = {
		prefix = "●",
		source = "always",
	},
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = " ",
			[vim.diagnostic.severity.WARN] = " ",
			[vim.diagnostic.severity.HINT] = " ",
			[vim.diagnostic.severity.INFO] = " ",
		},
	},
	underline = true,
	update_in_insert = false,
	severity_sort = true,
})

-- Markdown LSP
lspconfig.marksman.setup({
	capabilities = capabilities,
	cmd = { "marksman", "server" },
	filetypes = { "markdown" },
	root_dir = lspconfig.util.root_pattern(".git", ".marksman", ".marksman.toml", ".marksman.json"),
	on_attach = on_attach,
})

-- HTML
lspconfig["html"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

-- Lua
lspconfig["lua_ls"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.stdpath("config") .. "/lua"] = true,
				},
			},
		},
	},
})

-- Vale
lspconfig.vale_ls.setup({
	cmd = { "/Users/PWALLENI/.local/share/nvim/mason/bin/vale-ls" },
	filetypes = { "markdown", "text", "asciidoc", "rst" },
	root_dir = lspconfig.util.root_pattern(".vale.ini", ".git"),
	on_attach = on_attach,
})

-- YAML
lspconfig["yamlls"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
	settings = {
		yaml = {
			schemas = {
				["https://json.schemastore.org/mkdocs-1.0.json"] = "mkdocs.yml",
				["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
			},
			validate = true,
			completion = true,
			hover = true,
		},
	},
})

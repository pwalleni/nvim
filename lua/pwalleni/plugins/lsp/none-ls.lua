-- import null-ls plugin safely
local setup, null_ls = pcall(require, "null-ls")
if not setup then
	return
end

-- for conciseness
local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

-- enable virtual text diagnostics (inline)
vim.diagnostic.config({
	virtual_text = {
		prefix = "●", -- could be "●", "■", "▶", or ""
		source = "if_many", -- always / if_many / false
	},
	signs = true,
	underline = true,
	update_in_insert = false,
	severity_sort = true,
})

-- to setup format on save
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

-- configure null_ls
null_ls.setup({
	sources = {
		formatting.prettier,
		formatting.stylua,
		formatting.black,
		formatting.markdownlint,
		diagnostics.markdownlint,
	},
	on_attach = function(current_client, bufnr)
                -- diagnostic debug
                vim.notify("Formatter client name: " .. current_client.name, vim.log.levels.DEBUG)

                vim.api.nvim_buf_set_option(bufnr, "formatexpr", "")

		if current_client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.format({
						filter = function(client)
							-- patch: make sure we match the actual name
							return client.name == "null-ls" or client.name == "none-ls"
						end,
						bufnr = bufnr,
					})
				end,
			})
		end
	end,
})

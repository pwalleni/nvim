-- Auto open Trouble when diagnostics first a-- Markdown-specific settings
vim.api.nvim_create_autocmd("FileType", {
	pattern = "markdown",
	callback = function()
		-- Better wrapping for markdown
		vim.opt_local.linebreak = true
		vim.opt_local.wrap = true
		vim.opt_local.textwidth = 80
		vim.opt_local.conceallevel = 2
		
		-- Set markdown-specific options
		vim.opt_local.spell = true
		vim.opt_local.spelllang = "en_us"
	end,
}),files
vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		local bufnr = args.buf
		local ft = vim.api.nvim_get_option_value("filetype", { buf = bufnr })
		if ft ~= "markdown" then
			return
		end

		local group = vim.api.nvim_create_augroup("OpenTroubleOnce", { clear = true })
		vim.api.nvim_create_autocmd("DiagnosticChanged", {
			group = group,
			buffer = bufnr,
			callback = function()
				local diags = vim.diagnostic.get(bufnr)
				if #diags > 0 then
					vim.schedule(function()
						vim.cmd("Trouble diagnostics")
					end)
					-- Remove autocmd after opening once
					vim.api.nvim_del_augroup_by_id(group)
				end
			end,
		})
	end,
})

vim.diagnostic.config({
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = " ",
			[vim.diagnostic.severity.WARN] = " ",
			[vim.diagnostic.severity.HINT] = " ",
			[vim.diagnostic.severity.INFO] = " ",
		},
	},
	virtual_text = {
		prefix = "●",
		source = "if_many",
	},
	underline = true,
	update_in_insert = false,
	severity_sort = true,
})

-- Markdown-specific settings
vim.api.nvim_create_autocmd("FileType", {
	pattern = "markdown",
	callback = function()
		-- Better wrapping for markdown
		vim.opt_local.linebreak = true
		vim.opt_local.wrap = true
		vim.opt_local.textwidth = 80
		vim.opt_local.conceallevel = 2
		
		-- Enable table mode by default for markdown
		vim.cmd("TableModeEnable")
		
		-- Set markdown-specific options
		vim.opt_local.spell = true
		vim.opt_local.spelllang = "en_us"
	end,
})

-- YAML-specific settings for MkDocs
vim.api.nvim_create_autocmd("FileType", {
	pattern = "yaml",
	callback = function()
		vim.opt_local.tabstop = 2
		vim.opt_local.shiftwidth = 2
		vim.opt_local.expandtab = true
	end,
})

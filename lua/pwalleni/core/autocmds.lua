-- Auto open Trouble when diagnostics first appear in markdown files
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

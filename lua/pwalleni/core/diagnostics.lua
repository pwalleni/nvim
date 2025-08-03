local M = {}

function M.setup()
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
end

return M


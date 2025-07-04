local telescope = require("telescope")
local actions = require("telescope.actions")

telescope.setup({
	defaults = {
		mappings = {
			i = {
				["<C-j>"] = actions.move_selection_next,
				["<C-k>"] = actions.move_selection_previous,
				["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
				["<C-c>"] = actions.close,
				["<CR>"] = actions.select_default,
				["<C-s>"] = actions.select_horizontal,
				["<C-v>"] = actions.select_vertical,
			},
			n = {
				["<C-j>"] = actions.move_selection_next,
				["<C-k>"] = actions.move_selection_previous,
				["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
				["<C-c>"] = actions.close,
				["<CR>"] = actions.select_default,
				["<C-s>"] = actions.select_horizontal,
				["<C-v>"] = actions.select_vertical,
			},
		},
	},
	pickers = {
		-- Default configuration for builtin pickers goes here:
		-- picker_name = {
		--   picker_config_key = value,
		--   ...
		-- }
		-- Now the picker_config_key will be applied every time you call this
		-- builtin picker
	},
	extensions = {
		fzf = {
			fuzzy = true, -- false will only do exact matching
			override_generic_sorter = true, -- override the generic sorter
			override_file_sorter = true, -- override the file sorter
			case_mode = "smart_case", -- or "ignore_case" or "respect_case"
			-- the default case_mode is "smart_case"
		},
		-- Add other extensions here
	},
})

-- Load extensions
telescope.load_extension("fzf")

-- Custom pickers for TechDocs
local builtin = require('telescope.builtin')

-- Find markdown files
vim.keymap.set('n', '<leader>fmd', function()
	builtin.find_files({
		prompt_title = "Find Markdown Files",
		find_command = { "find", ".", "-name", "*.md", "-type", "f" },
	})
end, { desc = "Find Markdown Files" })

-- Search in markdown files only
vim.keymap.set('n', '<leader>smd', function()
	builtin.live_grep({
		prompt_title = "Search in Markdown",
		type_filter = "markdown",
		glob_pattern = "*.md",
	})
end, { desc = "Search in Markdown Files" })

-- Find mkdocs.yml files
vim.keymap.set('n', '<leader>fmk', function()
	builtin.find_files({
		prompt_title = "Find MkDocs Config",
		find_command = { "find", ".", "-name", "mkdocs.yml", "-o", "-name", "mkdocs.yaml", "-type", "f" },
	})
end, { desc = "Find MkDocs Config" })

local keymap = vim.keymap -- for conciseness

-- general keymaps

keymap.set("i", "jk", "<ESC>", { desc = "Exit Insert Mode" })

keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear Search Highlight" })

keymap.set("n", "x", '"_x', { desc = "Delete Character Without Yanking" }) -- delete but don't place in buffer

keymap.set("n", "<C-k>", "gqip", { desc = "Rewrap Paragraph" }) -- rewrap paragraph

keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment Number" }) -- increment number under cursor
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement Number" }) -- decrease number under cursor

keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split Window Vertically" }) -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split Window Horizontally" }) -- split windows horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Equalize Window Sizes" }) -- make split windows equal width
keymap.set("n", "<leader>sx", ":close<CR>", { desc = "Close Current Split" }) -- close current split window

keymap.set("n", "<leader>to", ":tabnew<CR>", { desc = "Open New Tab" }) -- open new tab
keymap.set("n", "<leader>tx", ":tabclose<CR>", { desc = "Close Current Tab" }) -- close current tab
keymap.set("n", "<leader>tn", ":tabn<CR>", { desc = "Go to Next Tab" }) -- go to next tab
keymap.set("n", "<leader>tp", ":tabp<CR>", { desc = "Go to Previous Tab" }) -- go to previous tab

-- plugin keymaps

-- telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Find Files" })
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Live Grep" })
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Grep String" })
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "List Buffers" })
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { desc = "Help Tags" })
keymap.set("n", "<leader>fk", "<cmd>Telescope keymaps<cr>", { desc = "List Keymaps" })

-- File tree
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { desc = "Toggle File Tree" })
keymap.set("n", "<leader>ef", ":NvimTreeFindFileToggle<CR>", { desc = "Toggle File Tree on Current File" })

-- Markdown preview
keymap.set("n", "<leader>mp", ":MarkdownPreviewToggle<CR>", { desc = "Toggle Markdown Preview" })

-- Table mode
keymap.set("n", "<leader>tm", ":TableModeToggle<CR>", { desc = "Toggle Table Mode" })
keymap.set("n", "<leader>tt", ":Tableize<CR>", { desc = "Convert to Table" })
keymap.set("v", "<leader>tt", ":Tableize<CR>", { desc = "Convert Selection to Table" })

-- Spell checking keymaps

keymap.set("n", "<leader>sn", "]s", { noremap = true, silent = true, desc = "Next Misspelled Word" })
keymap.set("n", "<leader>sp", "[s", { noremap = true, silent = true, desc = "Previous Misspelled Word" })
keymap.set("n", "<leader>ss", "z=", { noremap = true, silent = true, desc = "Show Spelling Suggestions" })
keymap.set("n", "<leader>sa", "zg", { noremap = true, silent = true, desc = "Add Word to Good List" })
keymap.set("n", "<leader>sw", "zw", { noremap = true, silent = true, desc = "Mark Word as Bad" })

-- Markdown navigation and editing
keymap.set("n", "<leader>mf", ":MkdnFollowLink<CR>", { desc = "Follow Markdown Link" })
keymap.set("n", "<leader>mb", ":MkdnGoBack<CR>", { desc = "Go Back in Markdown Navigation" })
keymap.set("n", "<leader>mc", ":MkdnCreateLink<CR>", { desc = "Create Markdown Link" })
keymap.set("v", "<leader>mc", ":MkdnCreateLink<CR>", { desc = "Create Markdown Link from Selection" })
keymap.set("n", "<leader>md", ":MkdnDestroyLink<CR>", { desc = "Destroy Markdown Link" })
keymap.set("n", "<leader>mt", ":MkdnToggleToDo<CR>", { desc = "Toggle Todo Item" })
keymap.set("v", "<leader>mt", ":MkdnToggleToDo<CR>", { desc = "Toggle Todo Items" })

-- Heading manipulation
keymap.set("n", "<leader>mh+", ":MkdnIncreaseHeading<CR>", { desc = "Increase Heading Level" })
keymap.set("n", "<leader>mh-", ":MkdnDecreaseHeading<CR>", { desc = "Decrease Heading Level" })

-- YAML telescope integration
keymap.set("n", "<leader>fy", ":Telescope yaml_schema<CR>", { desc = "Find YAML Schema" })

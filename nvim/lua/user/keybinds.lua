local vim = vim
vim.api.nvim_set_keymap("", "<Space>", "<Nop>", { silent = true, noremap = true})

-- redo
vim.api.nvim_set_keymap("n", "<S-u>", ":redo<CR>", { silent = true, noremap = true, desc = "redo"})

-- Resize with arrows
vim.api.nvim_set_keymap("n", "<C-Up>", ":resize +2<CR>", { silent = true, noremap = true, desc = "Increase window horizontally"})
vim.api.nvim_set_keymap("n", "<C-Down>", ":resize -2<CR>", { silent = true, noremap = true, desc = "Decrease window horizontally"})
vim.api.nvim_set_keymap("n", "<C-Left>", ":vertical resize -2<CR>", { silent = true, noremap = true, desc = "Increase window verticaly"})
vim.api.nvim_set_keymap("n", "<C-Right>", ":vertical resize +2<CR>", { silent = true, noremap = true, desc = "Decrease window verticaly"})

-- fast scrolling
vim.api.nvim_set_keymap("n", "<C-U>", "<C-U>zz", { silent = true, noremap = true, desc = "Scroll up"})
vim.api.nvim_set_keymap("n", "<C-D>", "<C-D>zz", { silent = true, noremap = true, desc = "Scroll down"})
vim.api.nvim_set_keymap("n", "n", "nzzzv", { silent = true, noremap = true, desc = "Next highlight"})
vim.api.nvim_set_keymap("n", "N", "Nzzzv", { silent = true, noremap = true, desc = "Previous highlight"})

-- saving files and exiting nvim
vim.api.nvim_set_keymap("n", "<leader>w", ":w<CR>", { silent = true, noremap = true, desc = "save"})
vim.api.nvim_set_keymap("n", "<leader>q", ":q<CR>", { silent = true, noremap = true, desc = "quit window"})
vim.api.nvim_set_keymap("n", "<leader>Q", ":qa<CR>", { silent = true, noremap = true, desc = "quit all windows"})


vim.api.nvim_set_keymap("n", "<leader>v", ":vsplit<CR>", { silent = true, noremap = true, desc = "Vertical split"})
vim.api.nvim_set_keymap("n", "<leader>V", ":split<CR>", { silent = true, noremap = true, desc = "Horizontal split"})

vim.api.nvim_set_keymap("n", "<leader>h", ":nohlsearch<CR>", { silent = true, noremap = true, desc = "hide search"})
vim.api.nvim_set_keymap("n", "<", "<<", { silent = true, noremap = true, desc = "de-indent"})
vim.api.nvim_set_keymap("n", ">", ">>", { silent = true, noremap = true, desc = "indent"})

-- WSL workaround for visual block mode
vim.api.nvim_set_keymap("n", "<M-v>", "<C-v>", { silent = true, noremap = true, desc = "enter visual block mode"})
-- WSL workaround for pasting
vim.api.nvim_set_keymap("n", "<leader>rw", ":%s/\\r//g<cr>", { silent = true, noremap = true, desc = "remove ^M from buffer"})

-- Visual --
-- Stay in indent mode
vim.api.nvim_set_keymap("v", "<", "<gv", { silent = true, noremap = true, desc = "de-indent"})
vim.api.nvim_set_keymap("v", ">", ">gv", { silent = true, noremap = true, desc = "indent"})

-- Move text up and down
vim.api.nvim_set_keymap("v", "<C-j>", ":m '>+1<CR>gv=gv", { silent = true, noremap = true, desc = "move selected text down"})
vim.api.nvim_set_keymap("v", "<C-k>", ":m '<-2<CR>gv=gv", { silent = true, noremap = true, desc = "move selected text up"})
vim.api.nvim_set_keymap("v", "p", '"_dP', { silent = true, noremap = true, desc = "visual paste"})

vim.api.nvim_set_keymap("n", "<leader>y", '"+y', { silent = true, noremap = true, desc = "Copy to system clipboard"})
vim.api.nvim_set_keymap("n", "<leader>Y", '"+Y', { silent = true, noremap = true, desc = "Copy line to system clipboard"})
vim.api.nvim_set_keymap("n", "<leader>p", '"+p', { silent = true, noremap = true, desc = "Paste from system clipboard"})
vim.api.nvim_set_keymap("n", "<leader>P", '"+P', { silent = true, noremap = true, desc = "Paste from system clipboard"})
vim.api.nvim_set_keymap("v", "<leader>y", '"+y', { silent = true, noremap = true, desc = "Copy to system clipboard"})
vim.api.nvim_set_keymap("v", "<leader>p", '"+p', { silent = true, noremap = true, desc = "Paste from system clipboard"})

-- Visual Block --
-- Move text up and down
vim.api.nvim_set_keymap("x", "<A-j>", ":m '>+1<CR>gv=gv", { silent = true, noremap = true, desc = "move selected text down"})
vim.api.nvim_set_keymap("x", "<A-k>", ":m '<-2<CR>gv=gv", { silent = true, noremap = true, desc = "move selected text up"})

-- Terminal --
-- Better terminal navigation
vim.api.nvim_set_keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", { silent = true, desc = "Focus left window" })
vim.api.nvim_set_keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", { silent = true, desc = "Focus bottom window" })
vim.api.nvim_set_keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", { silent = true, desc = "Focus upper window" })
vim.api.nvim_set_keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", { silent = true, desc = "Focus right window" })

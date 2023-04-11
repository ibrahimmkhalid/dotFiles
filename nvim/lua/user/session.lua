local keymap_opts = { noremap = true, silent = true }
local keymap = vim.keymap.set
local cf = require("user.custom_functions")

keymap("n", "<leader>ss", cf.save_session, keymap_opts)

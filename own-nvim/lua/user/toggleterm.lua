local status_ok, toggleterm = pcall(require, "toggleterm")
if not status_ok then
  return
end

toggleterm.setup {
  open_mapping = [[<c-\>]],
}

local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

local Terminal = require('toggleterm.terminal').Terminal
local _term_commands = {
  htop = "h",
  node = "n",
  python = "p",
}

_g_terms = {}

for k, v in pairs(_term_commands) do
  _g_terms[k] = Terminal:new({cmd = k, hidden = true, direction = "float"})
  keymap("n", "<leader>t" .. v, "<cmd>lua _g_terms."..k..":toggle()<cr>", opts)
end

keymap("t", "<Esc>", "<C-\\><C-n>", opts)
keymap("t", "<C-h>", "<c-\\><c-n><c-w>h", opts)
keymap("t", "<C-j>", "<c-\\><c-n><c-w>j", opts)
keymap("t", "<C-k>", "<c-\\><c-n><c-w>k", opts)
keymap("t", "<C-l>", "<c-\\><c-n><c-w>l", opts)

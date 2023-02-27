local status_ok, toggleterm = pcall(require, "toggleterm")
if not status_ok then
  return
end

toggleterm.setup {
  open_mapping = [[<c-\>]],
  direction = 'float'
}

local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

local Terminal = require('toggleterm.terminal').Terminal
local _term_commands = {
  h = "htop",
  n = "node",
  p = "python",
  g = "lazygit",
}

M_terms = {}

for k, v in pairs(_term_commands) do
  M_terms[v] = Terminal:new({cmd = v, hidden = true, direction = "float"})
  keymap("n", "<leader>t" .. k, "<cmd>lua M_terms."..v..":toggle()<cr>", opts)
end
keymap("n", "<leader>tf", "<cmd>ToggleTerm direction=float<cr>", opts)
keymap("n", "<leader>th", "<cmd>ToggleTerm direction=horizontal size=20<cr>", opts)
keymap("n", "<leader>tv", "<cmd>ToggleTerm direction=vertical size=100<cr>", opts)

keymap("t", "<Esc>", "<C-\\><C-n>", opts)
keymap("t", "<C-h>", "<c-\\><c-n><c-w>h", opts)
keymap("t", "<C-j>", "<c-\\><c-n><c-w>j", opts)
keymap("t", "<C-k>", "<c-\\><c-n><c-w>k", opts)
keymap("t", "<C-l>", "<c-\\><c-n><c-w>l", opts)

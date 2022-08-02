local status_ok, gitsigns = pcall(require, "gitsigns")
if not status_ok then
  return
end

gitsigns.setup()

local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

-- git anvigation
keymap('n', '<leader>gh', '<Cmd>Gitsigns reset_hunk<CR>', opts)
keymap('n', '<leader>gb', '<Cmd>Gitsigns reset_buffer<CR>', opts)
keymap('n', '<leader>gH', '<Cmd>Gitsigns stage_hunk<CR>', opts)
keymap('n', '<leader>gB', '<Cmd>Gitsigns stage_buffer<CR>', opts)
keymap('n', '<leader>gp', '<Cmd>Gitsigns preview_hunk<CR>', opts)
keymap('n', '<leader>gk', '<Cmd>Gitsigns prev_hunk<CR>', opts)
keymap('n', '<leader>gj', '<Cmd>Gitsigns next_hunk<CR>', opts)
keymap('n', '<leader>gl', '<Cmd>Gitsigns blame_line<CR>', opts)

local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

-- Goto buffer in position...
keymap('n', '<A-1>', '<Cmd>BufferGoto 1<CR>', opts)
keymap('n', '<A-2>', '<Cmd>BufferGoto 2<CR>', opts)
keymap('n', '<A-3>', '<Cmd>BufferGoto 3<CR>', opts)
keymap('n', '<A-4>', '<Cmd>BufferGoto 4<CR>', opts)
keymap('n', '<A-5>', '<Cmd>BufferGoto 5<CR>', opts)
keymap('n', '<A-6>', '<Cmd>BufferGoto 6<CR>', opts)
keymap('n', '<A-7>', '<Cmd>BufferGoto 7<CR>', opts)
keymap('n', '<A-8>', '<Cmd>BufferGoto 8<CR>', opts)
keymap('n', '<A-9>', '<Cmd>BufferGoto 9<CR>', opts)
keymap('n', '<A-0>', '<Cmd>BufferLast<CR>', opts)

keymap("n", "<S-l>", "<Cmd>BufferNext<CR>", opts)
keymap("n", "<S-h>", "<Cmd>BufferPrevious<CR>", opts)

-- Close buffers keybinds
keymap('n', '<leader>c', '<Cmd>BufferClose<CR>', opts)
keymap('n', '<leader>bl', '<Cmd>BufferCloseBuffersRight<CR>', opts)
keymap('n', '<leader>bh', '<Cmd>BufferCloseBuffersLeft<CR>', opts)
keymap('n', '<leader>bc', '<Cmd>BufferCloseAllButCurrent<CR>', opts)
keymap('n', '<leader>bL', '<Cmd>BufferMoveNext<CR>', opts)
keymap('n', '<leader>bH', '<Cmd>BufferMovePrevious<CR>', opts)
keymap('n', '<leader>bb', '<Cmd>BufferMove<CR>', opts)

local bar_status_ok, bar = pcall(require, "bufferline")
if not bar_status_ok then
  return
end

bar.setup {
  maximum_length = 45
}


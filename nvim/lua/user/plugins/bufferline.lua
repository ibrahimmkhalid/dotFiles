return {
  "romgrk/barbar.nvim",
  version = '^1.0.0',
  opts = {
    maximum_length = 45,
  },
  config = function()
    vim.api.nvim_set_keymap('n', '<A-1>', '<Cmd>BufferGoto 1<CR>',
      { silent = true, noremap = true, desc = "Goto buffer 1" })
    vim.api.nvim_set_keymap('n', '<A-2>', '<Cmd>BufferGoto 2<CR>',
      { silent = true, noremap = true, desc = "Goto buffer 2" })
    vim.api.nvim_set_keymap('n', '<A-3>', '<Cmd>BufferGoto 3<CR>',
      { silent = true, noremap = true, desc = "Goto buffer 3" })
    vim.api.nvim_set_keymap('n', '<A-4>', '<Cmd>BufferGoto 4<CR>',
      { silent = true, noremap = true, desc = "Goto buffer 4" })
    vim.api.nvim_set_keymap('n', '<A-5>', '<Cmd>BufferGoto 5<CR>',
      { silent = true, noremap = true, desc = "Goto buffer 5" })
    vim.api.nvim_set_keymap('n', '<A-6>', '<Cmd>BufferGoto 6<CR>',
      { silent = true, noremap = true, desc = "Goto buffer 6" })
    vim.api.nvim_set_keymap('n', '<A-7>', '<Cmd>BufferGoto 7<CR>',
      { silent = true, noremap = true, desc = "Goto buffer 7" })
    vim.api.nvim_set_keymap('n', '<A-8>', '<Cmd>BufferGoto 8<CR>',
      { silent = true, noremap = true, desc = "Goto buffer 8" })
    vim.api.nvim_set_keymap('n', '<A-9>', '<Cmd>BufferGoto 9<CR>',
      { silent = true, noremap = true, desc = "Goto buffer 9" })
    vim.api.nvim_set_keymap('n', '<A-0>', '<Cmd>BufferLast<CR>',
      { silent = true, noremap = true, desc = "Goto last buffer" })

    vim.api.nvim_set_keymap("n", "<S-l>", "<Cmd>BufferNext<CR>",
      { silent = true, noremap = true, desc = "Goto next buffer" })
    vim.api.nvim_set_keymap("n", "<S-h>", "<Cmd>BufferPrevious<CR>",
      { silent = true, noremap = true, desc = "Goto last buffer" })

    vim.api.nvim_set_keymap('n', '<leader>c', '<Cmd>BufferClose<CR>',
      { silent = true, noremap = true, desc = "Close buffer" })
    vim.api.nvim_set_keymap('n', '<leader>bL', '<Cmd>BufferCloseBuffersRight<CR>',
      { silent = true, noremap = true, desc = "Close all buffers right" })
    vim.api.nvim_set_keymap('n', '<leader>bH', '<Cmd>BufferCloseBuffersLeft<CR>',
      { silent = true, noremap = true, desc = "Close all buffers left" })
    vim.api.nvim_set_keymap('n', '<leader>bc', '<Cmd>BufferCloseAllButCurrent<CR>',
      { silent = true, noremap = true, desc = "Close all other buffers" })
    vim.api.nvim_set_keymap('n', '<leader>bl', '<Cmd>BufferMoveNext<CR>',
      { silent = true, noremap = true, desc = "Move buffer to right" })
    vim.api.nvim_set_keymap('n', '<leader>bh', '<Cmd>BufferMovePrevious<CR>',
      { silent = true, noremap = true, desc = "Move buffer to left" })
  end
}

return {
  "romgrk/barbar.nvim",
  version="1.6.2",
  config = function()
    require("bufferline").setup({
      maximum_length = 45
    })
    Keymap('n', '<A-1>', '<Cmd>BufferGoto 1<CR>', "Goto buffer 1")
    Keymap('n', '<A-2>', '<Cmd>BufferGoto 2<CR>', "Goto buffer 2")
    Keymap('n', '<A-3>', '<Cmd>BufferGoto 3<CR>', "Goto buffer 3")
    Keymap('n', '<A-4>', '<Cmd>BufferGoto 4<CR>', "Goto buffer 4")
    Keymap('n', '<A-5>', '<Cmd>BufferGoto 5<CR>', "Goto buffer 5")
    Keymap('n', '<A-6>', '<Cmd>BufferGoto 6<CR>', "Goto buffer 6")
    Keymap('n', '<A-7>', '<Cmd>BufferGoto 7<CR>', "Goto buffer 7")
    Keymap('n', '<A-8>', '<Cmd>BufferGoto 8<CR>', "Goto buffer 8")
    Keymap('n', '<A-9>', '<Cmd>BufferGoto 9<CR>', "Goto buffer 9")
    Keymap('n', '<A-0>', '<Cmd>BufferLast<CR>', "Goto last buffer")

    Keymap("n", "<S-l>", "<Cmd>BufferNext<CR>", "Goto next buffer")
    Keymap("n", "<S-h>", "<Cmd>BufferPrevious<CR>", "Goto last buffer")

    Keymap('n', '<leader>c', '<Cmd>BufferClose<CR>', "Close buffer")
    Keymap('n', '<leader>bL', '<Cmd>BufferCloseBuffersRight<CR>', "Close all buffers right")
    Keymap('n', '<leader>bH', '<Cmd>BufferCloseBuffersLeft<CR>', "Close all buffers left")
    Keymap('n', '<leader>bc', '<Cmd>BufferCloseAllButCurrent<CR>', "Close all other buffers")
    Keymap('n', '<leader>bl', '<Cmd>BufferMoveNext<CR>', "Move buffer to right")
    Keymap('n', '<leader>bh', '<Cmd>BufferMovePrevious<CR>', "Move buffer to left")
  end
}

return {
  "tpope/vim-fugitive",
  dependencies = {
    "lewis6991/gitsigns.nvim",
  },
  config = function()
    -- gitsigns
    require("gitsigns").setup()

    Keymap('n', '<leader>gh', '<Cmd>Gitsigns reset_hunk<CR>', "Reset current hunk")
    Keymap('n', '<leader>gb', '<Cmd>Gitsigns reset_buffer<CR>', "Reset current buffer")
    Keymap('n', '<leader>gH', '<Cmd>Gitsigns stage_hunk<CR>', "Stage current hunk")
    Keymap('n', '<leader>gB', '<Cmd>Gitsigns stage_buffer<CR>', "Stage current buffer")
    Keymap('n', '<leader>gp', '<Cmd>Gitsigns preview_hunk<CR>', "Preview changes")
    Keymap('n', '<leader>gk', '<Cmd>Gitsigns prev_hunk<CR>', "Go to previous change")
    Keymap('n', '<leader>gj', '<Cmd>Gitsigns next_hunk<CR>', "Go to next change")
    Keymap('n', '<leader>gl', '<Cmd>Gitsigns blame_line<CR>', "git blame")

    -- fugitive
    Keymap('n', '<leader>gg', '<Cmd>Git<CR>', "git blame")
  end
}

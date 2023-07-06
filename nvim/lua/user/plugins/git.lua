return {
  "NeogitOrg/neogit",
  dependencies = {
    "lewis6991/gitsigns.nvim",
    "tpope/vim-fugitive",
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
    Keymap('n', '<leader>gd', '<Cmd>Gitsigns diffthis<CR>', "Git diff")

    -- fugitive
    Keymap('n', '<leader>gu', '<Cmd>Git push<CR>', "Git push")
    Keymap('n', '<leader>gU', '<Cmd>Git pull<CR>', "Git pull")
    Keymap('n', '<leader>gl', '<Cmd>Git blame<CR>', "Git blame")

    -- neogit
    Keymap('n', '<leader>gg', '<Cmd>Neogit kind=vsplit<CR>', "Open git window")
  end
}

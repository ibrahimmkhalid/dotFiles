return {
  "NeogitOrg/neogit",
  dependencies = {
    "lewis6991/gitsigns.nvim",
    "tpope/vim-fugitive",
  },
  config = function()
    -- gitsigns
    require("gitsigns").setup()
    require("neogit").setup({
      disable_commit_confirmation = true,
    })

    vim.api.nvim_set_keymap('n', '<leader>gh', '<Cmd>Gitsigns reset_hunk<CR>', { silent = true, noremap = true, desc = "Reset current hunk"})
    vim.api.nvim_set_keymap('n', '<leader>gb', '<Cmd>Gitsigns reset_buffer<CR>', { silent = true, noremap = true, desc = "Reset current buffer"})
    vim.api.nvim_set_keymap('n', '<leader>gH', '<Cmd>Gitsigns stage_hunk<CR>', { silent = true, noremap = true, desc = "Stage current hunk"})
    vim.api.nvim_set_keymap('n', '<leader>gB', '<Cmd>Gitsigns stage_buffer<CR>', { silent = true, noremap = true, desc = "Stage current buffer"})
    vim.api.nvim_set_keymap('n', '<leader>gp', '<Cmd>Gitsigns preview_hunk<CR>', { silent = true, noremap = true, desc = "Preview changes"})
    vim.api.nvim_set_keymap('n', '<leader>gk', '<Cmd>Gitsigns prev_hunk<CR>', { silent = true, noremap = true, desc = "Go to previous change"})
    vim.api.nvim_set_keymap('n', '<leader>gj', '<Cmd>Gitsigns next_hunk<CR>', { silent = true, noremap = true, desc = "Go to next change"})
    vim.api.nvim_set_keymap('n', '<leader>gd', '<Cmd>Gitsigns diffthis<CR>', { silent = true, noremap = true, desc = "Git diff"})

    -- fugitive
    vim.api.nvim_set_keymap('n', '<leader>gu', '<Cmd>Git push<CR>', { silent = true, noremap = true, desc = "Git push"})
    vim.api.nvim_set_keymap('n', '<leader>gU', '<Cmd>Git pull<CR>', { silent = true, noremap = true, desc = "Git pull"})
    vim.api.nvim_set_keymap('n', '<leader>gl', '<Cmd>Git blame<CR>', { silent = true, noremap = true, desc = "Git blame"})

    -- neogit
    vim.api.nvim_set_keymap('n', '<leader>gg', '<Cmd>Neogit kind=vsplit<CR>', { silent = true, noremap = true, desc = "Open git window"})
  end
}

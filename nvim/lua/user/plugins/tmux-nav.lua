return {
  "christoomey/vim-tmux-navigator",
  lazy = false,
  config = function()
    vim.api.nvim_set_keymap("n", "<C-h>", ":TmuxNavigateLeft<CR>", { silent = true, noremap = true, desc = "Focus left window or tmux pane"})
    vim.api.nvim_set_keymap("n", "<C-j>", ":TmuxNavigateDown<CR>", { silent = true, noremap = true, desc = "Focus bottom window or tmux pane"})
    vim.api.nvim_set_keymap("n", "<C-k>", ":TmuxNavigateUp<CR>", { silent = true, noremap = true, desc = "Focus upper window or tmux pane"})
    vim.api.nvim_set_keymap("n", "<C-l>", ":TmuxNavigateRight<CR>", { silent = true, noremap = true, desc = "Focus right window or tmux pane"})
  end
}

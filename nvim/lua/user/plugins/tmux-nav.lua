return {
  "christoomey/vim-tmux-navigator",
  lazy = false,
  config = function()
    Keymap("n", "<C-h>", ":TmuxNavigateLeft<CR>", "Focus left window or tmux pane")
    Keymap("n", "<C-j>", ":TmuxNavigateDown<CR>", "Focus bottom window or tmux pane")
    Keymap("n", "<C-k>", ":TmuxNavigateUp<CR>", "Focus upper window or tmux pane")
    Keymap("n", "<C-l>", ":TmuxNavigateRight<CR>", "Focus right window or tmux pane")
  end
}

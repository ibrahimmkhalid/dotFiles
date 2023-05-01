return {
  "tpope/vim-fugitive",
  config = function ()
    Keymap('n', '<leader>gg', '<Cmd>Git<CR>', "git blame")
  end
}

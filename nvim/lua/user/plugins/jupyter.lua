return {
  "untitled-ai/jupyter_ascending.vim",
  ft = "python",
  init = function()
    vim.g.jupyter_ascending_default_mappings = false
  end,
  config = function()
    vim.api.nvim_set_keymap("n", "<leader>jx", "<Cmd>w<CR><Cmd>call jupyter_ascending#execute()<CR>",
      { silent = true, noremap = true, desc = "Run current jupyter cell" })
    vim.api.nvim_set_keymap("n", "<leader>jv",
      "<Cmd>w<CR><Cmd>call jupyter_ascending#execute()<CR>o<CR><Esc>0i# %%<CR>",
      { silent = true, noremap = true, desc = "Run current jupyter cell and move down" })
    vim.api.nvim_set_keymap("n", "<leader>ja", "<Cmd>w<CR><Cmd>call jupyter_ascending#execute_all()<CR>",
      { silent = true, noremap = true, desc = "Run jupyter notebook" })
    vim.api.nvim_set_keymap("n", "<leader>jr", "<Cmd>w<CR><Cmd>call jupyter_ascending#restart()<CR>",
      { silent = true, noremap = true, desc = "Restart Jupyter notebook" })
    vim.api.nvim_set_keymap("n", "<leader>jc", "<Cmd>w<CR>o<CR><Esc>0i# %%<CR>",
      { silent = true, noremap = true, desc = "New code block" })
    vim.api.nvim_set_keymap("n", "<leader>jm", "<Cmd>w<CR>o<CR><Esc>0i# %% [markdown]<CR># ",
      { silent = true, noremap = true, desc = "New markdown block" })

    vim.api.nvim_set_keymap("n", "<leader>jj", "/# %%<CR>j<Cmd>nohl<CR>",
      { silent = true, noremap = true, desc = "Jump to next cell" })
    vim.api.nvim_set_keymap("n", "<leader>jk", "/# %%<CR>NNj<Cmd>nohl<CR>",
      { silent = true, noremap = true, desc = "Jump to previous cell" })
  end
}

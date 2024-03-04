return {
  "untitled-ai/jupyter_ascending.vim",
  init = function ()
    vim.g.jupyter_ascending_default_mappings = false
  end,
  config = function ()
    vim.api.nvim_set_keymap("n", "<leader>jx", "<Cmd>w<CR><Cmd>call jupyter_ascending#execute()<CR>", { silent = true, noremap = true, desc = "Run current jupyter cell"})
    vim.api.nvim_set_keymap("n", "<leader>ja", "<Cmd>w<CR><Cmd>call jupyter_ascending#execute_all()<CR>", { silent = true, noremap = true, desc = "Run jupyter notebook"})
    vim.api.nvim_set_keymap("n", "<leader>jr", "<Cmd>w<CR><Cmd>call jupyter_ascending#restart()<CR>", { silent = true, noremap = true, desc = "Restart Jupyter notebook"})
    vim.api.nvim_set_keymap("n", "<leader>jc", "<Cmd>w<CR>o<CR><Esc>0i# %%<CR>", { silent = true, noremap = true, desc = "New code block"})
    vim.api.nvim_set_keymap("n", "<leader>jm", "<Cmd>w<CR>o<CR><Esc>0i# %% [markdown]<CR># ", { silent = true, noremap = true, desc = "New markdown block"})
  end
}

return {
  "untitled-ai/jupyter_ascending.vim",
  init = function ()
    vim.g.jupyter_ascending_default_mappings = false
  end,
  config = function ()
    Keymap("n", "<leader>jx", "<Cmd>call jupyter_ascending#execute()<CR>", "Run current jupyter cell")
    Keymap("n", "<leader>ja", "<Cmd>call jupyter_ascending#execute_all()<CR>", "Run jupyter notebook")
    Keymap("n", "<leader>jr", "<Cmd>call jupyter_ascending#restart()<CR>", "Restart Jupyter notebook")
    Keymap("n", "<leader>jc", "o<CR># %%<CR>", "New code block")
    Keymap("n", "<leader>jm", "o<CR># %% [markdown]<CR># ", "New markdown block")
  end
}

return {
  "mbbill/undotree",
  config = function ()
    Keymap("n", "<leader>u", ":UndotreeToggle<cr>", "Open undo tree")
    vim.g.undotree_WindowLayout = 4
    vim.g.undotree_SplitWidth = 50
    vim.g.undotree_DiffpanelHeight = 15
  end
}

return {
  "mbbill/undotree",
  config = function ()
    vim.api.nvim_set_keymap("n", "<leader>u", ":UndotreeToggle<cr>", { silent = true, noremap = true, desc = "Open undo tree"})
    vim.g.undotree_WindowLayout = 4
    vim.g.undotree_SplitWidth = 50
    vim.g.undotree_DiffpanelHeight = 15
  end
}

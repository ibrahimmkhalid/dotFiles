return {
  "github/copilot.vim",
  config = function ()
    vim.g.copilot_assume_mapped = true
    vim.g.copilot_no_tab_map = true
    vim.g.copilot_no_maps = true
    vim.g.copilot_filetypes = {
      markdown = false,
      gitcommit = false,
      gitrebase = false,
      xml = false,
      json = false,
    }
    vim.api.nvim_set_keymap("i", "<C-y>", 'copilot#Accept("\\<CR>")', { replace_keycodes = false, expr = true, noremap = false })
    vim.api.nvim_set_keymap("i", "<C-l>", '<Plug>(copilot-accept-word)', { noremap = false })
    vim.api.nvim_set_keymap("i", "<C-j>", '<Plug>(copilot-next)', { noremap = false })
    vim.api.nvim_set_keymap("i", "<C-k>", '<Plug>(copilot-previous)', { noremap = false })
    vim.api.nvim_set_keymap("i", "<M-/>", '<Plug>(copilot-suggest)', { noremap = false })
    vim.api.nvim_set_keymap("i", "<C-e>", '<Plug>(copilot-dismiss)', { noremap = false })
  end
}

return {
  "iamcco/markdown-preview.nvim",
  build = "cd app && npm install && git reset --hard",
  config = function()
    vim.g.mkdp_filetypes = { "markdown" }
  end,
  ft = { "markdown" }
}

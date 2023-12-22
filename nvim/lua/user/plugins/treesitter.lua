return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = {
    "HiPhish/rainbow-delimiters.nvim",
    "JoosepAlviste/nvim-ts-context-commentstring",
    "nvim-treesitter/playground",
  },
  build = function()
    pcall(vim.cmd, 'TSUpdate')
  end,
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = { "python", "lua" },
      sync_install = false,
      ignore_install = { "" }, -- List of parsers to ignore installing
    })
    require('ts_context_commentstring').setup({
      enable_autocmd = false
    })
    require('rainbow-delimiters.setup').setup()
  end
}

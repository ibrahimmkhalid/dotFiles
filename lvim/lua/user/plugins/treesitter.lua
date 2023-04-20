return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = {
    "p00f/nvim-ts-rainbow",
    "JoosepAlviste/nvim-ts-context-commentstring",
  },
  build = function()
    pcall(vim.cmd, 'TSUpdate')
  end,
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = "python",
      sync_install = false,
      ignore_install = { "" }, -- List of parsers to ignore installing
      autopairs = {
        enable = true
      },
      highlight = {
        enable = true, -- false will disable the whole extension
        disable = { "" }, -- list of language that will be disabled
        additional_vim_regex_highlighting = true,
      },
      indent = { enable = true },
      rainbow = {
        enable = true,
        extended_mode = true,
        max_file_lines = nil,
      },
      context_commentstring = {
        enable = true,
        enable_autocmd = true
      }
    })
  end
}

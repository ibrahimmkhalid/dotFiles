return {
  "neovim/nvim-lspconfig",
  dependencies = {
    {
      'williamboman/mason.nvim',
      build = function()
        pcall(vim.cmd, 'MasonUpdate')
      end,
    },
    { 'williamboman/mason-lspconfig.nvim' },

    -- autocompletion
    { 'hrsh7th/nvim-cmp',
      lazy = false
    },
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'hrsh7th/cmp-buffer' },
    { 'hrsh7th/cmp-path' },
    { 'hrsh7th/cmp-emoji' },
    { 'saadparwaiz1/cmp_luasnip' },
    { 'hrsh7th/cmp-nvim-lua' },

    -- snippets
    { 'L3MON4D3/LuaSnip' },
    { 'rafamadriz/friendly-snippets' },

    -- etc
    { 'windwp/nvim-autopairs' },
  },
  config = function()
    require("user.plugins.lsp.cmp")
    require("user.plugins.lsp.lsp")
    require("user.plugins.lsp.autopairs")
    require("user.plugins.lsp.options")
  end
}

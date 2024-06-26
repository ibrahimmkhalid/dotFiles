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

    -- ensure installed
    { 'WhoIsSethDaniel/mason-tool-installer.nvim' },

    -- autocompletion
    { 'hrsh7th/nvim-cmp' },
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'hrsh7th/cmp-buffer' },
    { 'hrsh7th/cmp-path' },
    { 'hrsh7th/cmp-emoji' },
    { 'saadparwaiz1/cmp_luasnip' },
    { 'hrsh7th/cmp-nvim-lua' },
    { 'onsails/lspkind.nvim' },

    -- snippets
    { 'L3MON4D3/LuaSnip' },
    { 'rafamadriz/friendly-snippets' },

    -- etc
    { 'windwp/nvim-autopairs' },

    -- dap
    { 'mfussenegger/nvim-dap' },
    { 'jay-babu/mason-nvim-dap.nvim' },
    { 'rcarriga/nvim-dap-ui' },
    { 'nvim-neotest/nvim-nio' },
  },
  config = function()
    require("user.plugins.lsp.mason-installer")
    require("user.plugins.lsp.cmp")
    require("user.plugins.lsp.lsp")
    require("user.plugins.lsp.dap")
    require("user.plugins.lsp.autopairs")
    require("user.plugins.lsp.options")
    require("user.plugins.lsp.snippets")
  end
}

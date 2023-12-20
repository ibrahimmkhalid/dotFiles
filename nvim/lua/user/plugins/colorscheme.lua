return {
  -- color schemes
  "ellisonleao/gruvbox.nvim",
  "folke/tokyonight.nvim",
  "sainnhe/gruvbox-material",
  "rebelot/kanagawa.nvim",
  "Mofiqul/vscode.nvim",
  "catppuccin/nvim",
  "olimorris/onedarkpro.nvim",
  "marko-cerovac/material.nvim",
  "sainnhe/edge",
  "rose-pine/neovim",
  {
    -- install any one specific color scheme here to use the lazy.nvim config option
    -- TODO: find a better way to do this
    "neanias/everforest-nvim",
    lazy = false,
    priority = 1000,
    config = function()
      local colorscheme = "everforest"
      local background = "light"
      local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
      if not status_ok then
        vim.notify("colorscheme " .. colorscheme .. " not found!")
      else
        local everforest = require("everforest")
        vim.opt.background = background
        everforest.setup({
          background = "hard"
        })
        everforest.load()
      end
    end
  }
}

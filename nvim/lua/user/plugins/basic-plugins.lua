return {
  "nvim-lua/popup.nvim",
  "nvim-lua/plenary.nvim",
  "nvim-tree/nvim-web-devicons",
  {
    "ellisonleao/gruvbox.nvim",
    "folke/tokyonight.nvim",
    "sainnhe/gruvbox-material",
    "rebelot/kanagawa.nvim",
    {
      "sainnhe/everforest",
      lazy = false,
      priority = 1000,
      config = function()
        local colorscheme = "everforest"
        local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
        if not status_ok then
          vim.notify("colorscheme " .. colorscheme .. " not found!")
        end
      end
    }
  },
}

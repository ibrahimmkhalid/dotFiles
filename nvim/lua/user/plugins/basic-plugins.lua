return {
  "nvim-lua/popup.nvim",
  "nvim-lua/plenary.nvim",
  "nvim-tree/nvim-web-devicons",
  {
    "sainnhe/everforest",
    lazy = false,
    priority = 1000,
    dependencies = {
      "ellisonleao/gruvbox.nvim",
      "folke/tokyonight.nvim",
      "sainnhe/gruvbox-material",
      "rebelot/kanagawa.nvim",
    },
    config = function()
      local colorscheme = "everforest"
      local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
      if not status_ok then
        vim.notify("colorscheme " .. colorscheme .. " not found!")
      end
    end
  },
}

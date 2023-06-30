return {
  "nvim-lua/popup.nvim",
  "nvim-lua/plenary.nvim",
  "nvim-tree/nvim-web-devicons",
  {
    "sainnhe/everforest",
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
  {
    "yamatsum/nvim-cursorline",
    config = function()
      local function getVisualHighlightColor()
        local visual_hl = vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID('Visual')), 'bg')
        return visual_hl
      end

      local bg_color = getVisualHighlightColor()

      local hl_attr = {}
      if bg_color == '' then
        hl_attr = {
          underline = true
        }
      else
        hl_attr = {
          underline = false,
          bg = bg_color
        }
      end

      require('nvim-cursorline').setup {
        cursorline = {
          enable = false,
        },
        cursorword = {
          enable = true,
          hl = hl_attr,
        }
      }
    end
  }
}

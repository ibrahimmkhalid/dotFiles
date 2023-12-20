return {
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

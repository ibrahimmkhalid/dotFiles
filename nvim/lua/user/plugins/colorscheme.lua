return {
  "neanias/everforest-nvim",
  lazy = false,
  priority = 1000,
  config = function()
    local is_global_dark_mode = function ()
      local colormode_file = "~/._.color-mode"
      vim.cmd("silent !touch " .. colormode_file)
      local status = vim.fn.system("cat " .. colormode_file)
      if status == "dark\n" then
        return true
      else
        return false
      end
    end

    local colorscheme = "everforest"
    local background = "light"
    if is_global_dark_mode() then
      background = "dark"
    end
    local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
    if not status_ok then
      vim.notify("colorscheme " .. colorscheme .. " not found!")
    else
      local everforest = require("everforest")
      vim.opt.background = background

      local everforest_hardness = "hard"
      if background == "dark" then
        everforest_hardness = "medium"
      end

      everforest.setup({
        background = everforest_hardness
      })
      everforest.load()
    end
  end
}

local options = {
  number = true,
  relativenumber = true,
  clipboard = "unnamedplus",
  cmdheight = 2,
  termguicolors = true,
  fileencoding = "utf-8",
  ignorecase = true,
  mouse = "a",
  showmode = false,
  showtabline = 2,
  smartcase = true,
  smartindent = true,
  splitbelow = true,
  splitright = true,
  undofile = false,
  expandtab = true,
  shiftwidth = 2,
  tabstop = 2,
  wrap = false
}


for k, v in pairs(options) do
  vim.opt[k] = v
end

vim.cmd "set whichwrap+=<,>,[,],h,l"


local colorscheme = "tokyonight"
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end

local status_ok, colorizer = pcall(require, "colorizer")
if not status_ok then
  return
end

colorizer.setup()

--local status_ok, transparent = pcall(require, "transparent")
--if not status_ok then
--  return
--end
--
--transparent.setup({
--  enable = true,
--})

local status_ok, impatient = pcall(require, "impatient")
if not status_ok then
  return
end

impatient.enable_profile()


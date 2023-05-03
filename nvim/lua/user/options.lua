local vim = vim
local options = {
  number = true,
  relativenumber = true,
  cmdheight = 2,
  termguicolors = true,
  fileencoding = "utf-8",
  ignorecase = true,
  mouse = "a",
  scrolloff = 10,
  showmode = false,
  showtabline = 2,
  signcolumn = "yes",
  smartcase = true,
  smartindent = true,
  splitbelow = true,
  splitright = true,
  undofile = true,
  updatetime = 250,
  expandtab = true,
  shiftwidth = 2,
  tabstop = 2,
  wrap = false,
  whichwrap = "<,>,[,],h,l",
}


for k, v in pairs(options) do
  vim.opt[k] = v
end

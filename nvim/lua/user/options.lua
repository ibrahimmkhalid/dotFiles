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

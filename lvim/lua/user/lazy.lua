local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

local lazy_opts = {}

local lazy_plugins = {
  "nvim-lua/popup.nvim",
  "nvim-lua/plenary.nvim",
  "ellisonleao/gruvbox.nvim",
  "folke/tokyonight.nvim",
  "sainnhe/gruvbox-material",
  "sainnhe/everforest",
  "rebelot/kanagawa.nvim",
  "nvim-tree/nvim-web-devicons",
}


require('lazy').setup(lazy_plugins, lazy_opts)

vim.api.nvim_set_keymap("", "<Space>", "<Nop>", { noremap = true, silent = true })
vim.g.mapleader = " "
vim.g.maplocalleader = " "

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
  { import = "user.plugins.basic-plugins" },
  { import = "user.plugins.copilot"},
  { import = "user.plugins.git" },
  { import = "user.plugins.lsp.main" },
  { import = "user.plugins.neotree" },
  { import = "user.plugins.undotree" },
  { import = "user.plugins.treesitter" },
  { import = "user.plugins.colorizer" },
  { import = "user.plugins.telescope" },
  { import = "user.plugins.jupyter" },
  { import = "user.plugins.lualine" },
  { import = "user.plugins.bufferline" },
  { import = "user.plugins.toggleterm" },
  { import = "user.plugins.nvim-ufo" },
  { import = "user.plugins.comments" },
  { import = "user.plugins.cursorline" },
  { import = "user.plugins.harpoon" },
  { import = "user.plugins.markdown" },
  { import = "user.plugins.impatient" },
  { import = "user.plugins.tmux-nav" },
  { import = "user.plugins.which-key" },
}

require("user.options")
require('lazy').setup(lazy_plugins, lazy_opts)
require("user.keybinds")
require("user.session")

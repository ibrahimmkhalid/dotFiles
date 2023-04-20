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
  { import = "user.plugins.impatient" },
  { import = "user.plugins.which-key" },
  { import = "user.plugins.colorizer" },
  { import = "user.plugins.lsp-cmp" },
  { import = "user.plugins.neotree" },
  { import = "user.plugins.treesitter" },
  { import = "user.plugins.telescope" },
  { import = "user.plugins.lualine" },
  { import = "user.plugins.bufferline" },
  { import = "user.plugins.toggleterm" },
  { import = "user.plugins.nvim-ufo" },
  { import = "user.plugins.autopairs" },
  { import = "user.plugins.comments" },
  { import = "user.plugins.reach" },
  { import = "user.plugins.gitsigns" },
  { import = "user.plugins.markdown"},
  { import = "user.plugins.alpha"},
}


require('lazy').setup(lazy_plugins, lazy_opts)

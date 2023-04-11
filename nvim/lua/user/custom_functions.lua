local M = {}
local vim = vim

function M.open_dot_files()
  local file_path = "~/repos/ibrahimmkhalid/dotFiles/zshrc"
  vim.cmd("cd " .. vim.fn.fnamemodify(file_path, ":h"))
  vim.cmd("edit " .. file_path)
end

function M.open_nvim_config()
  local file_path = "~/repos/ibrahimmkhalid/dotFiles/nvim/init.lua"
  vim.cmd("cd " .. vim.fn.fnamemodify(file_path, ":h"))
  vim.cmd("edit " .. file_path)
  file_path = "~/repos/ibrahimmkhalid/dotFiles/nvim/lua/user/plugins.lua"
  vim.cmd("edit " .. file_path)
end

return M

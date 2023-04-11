local M = {}
local vim = vim

local keymap = vim.keymap.set
local keymap_opts = { noremap = true, silent = true }
keymap("n", "<leader>d", ":source %<CR>", keymap_opts)

function M.convert_name_to_path(name)
  local path = string.gsub(name, "__----__", "/")
  return path
end

function M.convert_path_to_name(path)
  local name = string.gsub(path, "/", "__--__")
  return name
end

function M.convert_path_to_read(path)
  local read = string.match(path, "/([^/]+)$")
  return read
end

function M.does_session_exist(name)
  local session_path = "~/.local/share/nvim/session/"
  local session_file = session_path .. name
  local stat = vim.loop.fs_stat(session_file)
  return stat and stat.type == "file"
end

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

function M.save_session()
  local cwd = vim.fn.getcwd()
  local name = M.convert_path_to_name(cwd)
  local session_path = "~/.local/share/nvim/session/"
  local session_file = session_path .. name
  vim.cmd("mks! " .. session_file)
end

return M

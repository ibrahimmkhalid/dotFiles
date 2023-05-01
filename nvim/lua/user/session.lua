local Path = require("plenary.path")

local function convert_name_to_path(name)
  local path = string.gsub(name, "__----__", "/")
  return path
end

local function convert_path_to_name(path)
  local name = string.gsub(path, "/", "__--__")
  return name
end

local function convert_path_to_read(path)
  local read = string.match(path, "/([^/]+)$")
  return read
end
local function save_session()
  local cwd = vim.fn.getcwd()
  local name = convert_path_to_name(cwd)
  local session_path = "~/.local/share/nvim/session/"
  local session_file = session_path .. name
  vim.cmd("mks! " .. session_file)
  print("Session saved!")
end

local function load_session()
  local cwd = vim.fn.getcwd()
  local name = convert_path_to_name(cwd)
  local session_path = "~/.local/share/nvim/session/"
  local session_file = session_path .. name
  local file = Path:new(session_file)
  session_file = file:expand()
  file = Path:new(session_file)
  if file:exists() then
    vim.cmd("source " .. session_file)
  else
    print("No session to load")
  end
end
local function autosave_existing_sessions()
  local cwd = vim.fn.getcwd()
  local name = convert_path_to_name(cwd)
  local session_path = "~/.local/share/nvim/session/"
  local session_file = session_path .. name
  local file = Path:new(session_file)
  session_file = file:expand()
  file = Path:new(session_file)
  if file:exists() then
    vim.cmd("mks! " .. session_file)
  end
end

local function delete_session()
  local cwd = vim.fn.getcwd()
  local name = convert_path_to_name(cwd)
  local session_path = "~/.local/share/nvim/session/"
  local session_file = session_path .. name
  local file = Path:new(session_file)
  session_file = file:expand()
  file = Path:new(session_file)
  if file:exists() then
    file:rm()
    print("Session deleted")
  else
    print("No session to delete")
  end
end

Keymap("n", "<leader>ss", save_session, "Save session")
Keymap("n", "<leader>sf", load_session, "Load session")
--[[ Keymap("n", "<leader>sa", ":Alpha<CR>", "Home screen") ]]
Keymap("n", "<leader>sd", delete_session, "Delete session")
vim.api.nvim_create_autocmd({ "VimLeave" }, {
  callback = autosave_existing_sessions
})

--[[ local M = {} ]]
--[[]]
--[[ function M.get_sessions() ]]
--[[   local handle = io.popen("ls -t ~/.local/share/nvim/session") ]]
--[[   local sessions_files = handle:read("*a") ]]
--[[   handle:close() ]]
--[[   local sessions = vim.split(sessions_files, "\n") ]]
--[[   local readable_session = {} ]]
--[[   for i, session in ipairs(sessions) do ]]
--[[     if #session > 0 then ]]
--[[       local path = convert_name_to_path(session) ]]
--[[       local name = convert_path_to_read(path) ]]
--[[       readable_session[i] = { ]]
--[[         name = name, ]]
--[[         file = session ]]
--[[       } ]]
--[[     end ]]
--[[     if i >= 5 then break end ]]
--[[   end ]]
--[[   return readable_session ]]
--[[ end ]]
--[[]]
--[[ return M ]]

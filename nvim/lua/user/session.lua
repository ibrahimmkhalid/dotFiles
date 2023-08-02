local Path = require("plenary.path")

local M = {}

local function convert_path_to_name(path)
  local name = string.gsub(path, "/", "__--__")
  return name
end

function M.save_session()
  local cwd = vim.fn.getcwd()
  local name = convert_path_to_name(cwd)
  local session_path = "~/.local/share/nvim/session/"
  local session_file = session_path .. name
  vim.cmd("mks! " .. session_file)
  print("Session saved!")
end

function M.load_session()
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


function M.delete_session()
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

vim.api.nvim_set_keymap("n", "<leader>ss", "<Cmd>lua require('user.session').save_session()<cr>", { silent = true, noremap = true, desc = "Save session"})
vim.api.nvim_set_keymap("n", "<leader>sf", "<Cmd>lua require('user.session').load_session()<cr>", { silent = true, noremap = true, desc = "Load session"})
vim.api.nvim_set_keymap("n", "<leader>sd", "<Cmd>lua require('user.session').delete_session()<cr>", { silent = true, noremap = true, desc = "Delete session"})

vim.api.nvim_create_autocmd({ "VimLeave" }, {
  callback = autosave_existing_sessions
})

return M

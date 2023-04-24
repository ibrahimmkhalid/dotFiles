local M = {}
local vim = vim

function M.open_dot_files()
  local file_path = "~/repos/ibrahimmkhalid/dotFiles/zshrc"
  vim.cmd("cd " .. vim.fn.fnamemodify(file_path, ":h"))
  vim.cmd("edit " .. file_path)
end

function M.open_dir()
  vim.ui.input({
      prompt = "Enter path: ",
      completion = "dir"
    },
    function(path)
      if type(path) == "nil" then
        return
      end
      local Path = require("plenary.path")
      local file = Path:new(path)
      path = file:expand()
      file = Path:new(path)
      if file:exists() and file:is_dir() then
        if string.sub(path, -1) == "/" then
          path = string.sub(path, 1, -2)
        end
        path = file:absolute()
        vim.cmd("edit " .. path)
        vim.cmd("cd " .. path)
      end
    end
  )
end

function M.open_nvim_config()
  local file_path = "~/repos/ibrahimmkhalid/dotFiles/nvim/init.lua"
  vim.cmd("cd " .. vim.fn.fnamemodify(file_path, ":h"))
  vim.cmd("edit " .. file_path)
  file_path = "~/repos/ibrahimmkhalid/dotFiles/nvim/lua/user/etc.lua"
  vim.cmd("edit " .. file_path)
  file_path = "~/repos/ibrahimmkhalid/dotFiles/nvim/lua/user/options.lua"
  vim.cmd("edit " .. file_path)
  file_path = "~/repos/ibrahimmkhalid/dotFiles/nvim/lua/user/keybinds.lua"
  vim.cmd("edit " .. file_path)
  file_path = "~/repos/ibrahimmkhalid/dotFiles/nvim/lua/user/lazy.lua"
  vim.cmd("edit " .. file_path)
end

function M.get_lsp_name()
  local msg = 'No Active Lsp'
  local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
  local clients = vim.lsp.get_active_clients()
  if next(clients) == nil then
    return msg
  end
  for _, client in ipairs(clients) do
    local filetypes = client.config.filetypes
    if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
      return client.name
    end
  end
  return msg
end

return M

vim.api.nvim_set_keymap("", "<Space>", "<Nop>", { noremap = true, silent = true })
vim.g.mapleader = " "
vim.g.maplocalleader = " "

function Keymap(mode, lhs, rhs, desc)
  if type(rhs) == "string" then
    vim.api.nvim_set_keymap(mode, lhs, rhs, {
      noremap = true,
      silent = true,
      desc = desc
    })
  else
    vim.api.nvim_set_keymap(mode, lhs, "", {
      noremap = true,
      silent = true,
      desc = desc,
      callback = function()
        rhs()
      end
    })
  end
end

require("user.options")
require("user.lazy")
require("user.keybinds")

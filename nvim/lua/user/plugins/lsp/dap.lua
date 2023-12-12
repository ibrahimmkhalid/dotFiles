local dap = require("dap")
local dapui = require("dapui")
require("mason-nvim-dap").setup({
  ensure_installed = { "python", "codelldb" }
})

dapui.setup({})

local function debug_start()
  dapui.open({})
end

local function debug_end()
  dapui.close({})
end

dap.listeners.after.event_initialized["dapui_config"] = function()
  debug_start()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  debug_end()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  vim.fn.input("Press Enter to continue...")
  debug_end()
end

dap.adapters.codelldb = {
  type = 'server',
  port = "${port}",
  executable = {
    command = 'codelldb',
    args = { "--port", "${port}" },
  }
}

dap.configurations.rust = {
  {
    name = "Rust debug",
    type = "codelldb",
    request = "launch",
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/target/debug/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = true,
    showDisassembly = "never",
  },
}

vim.api.nvim_set_keymap('n', '<leader>dP', '<Cmd>lua require("dap").clear_breakpoints()<cr>',
  { silent = true, noremap = true, desc = "Clear all breakpoints" })
vim.api.nvim_set_keymap('n', '<leader>dd', '<Cmd>lua require("dap").continue()<cr>',
  { silent = true, noremap = true, desc = "Debug start/continue" })
vim.api.nvim_set_keymap('n', '<leader>dn', '<Cmd>lua require("dap").continue()<cr>',
  { silent = true, noremap = true, desc = "Debug start/continue" })
vim.api.nvim_set_keymap('n', '<leader>dr', '<Cmd>lua require("dap").restart()<cr>',
  { silent = true, noremap = true, desc = "Debug restart" })
vim.api.nvim_set_keymap('n', '<leader>dq', '<Cmd>lua require("dap").terminate()<cr>',
  { silent = true, noremap = true, desc = "End debugging" })
vim.api.nvim_set_keymap('n', '<leader>dp', '<Cmd>lua require("dap").toggle_breakpoint()<cr>',
  { silent = true, noremap = true, desc = "Toggle breakpoint" })
vim.api.nvim_set_keymap('n', '<leader>di', '<Cmd>lua require("dap").step_into()<cr>',
  { silent = true, noremap = true, desc = "Step into" })
vim.api.nvim_set_keymap('n', '<leader>do', '<Cmd>lua require("dap").step_over()<cr>',
  { silent = true, noremap = true, desc = "Step over" })
vim.api.nvim_set_keymap('n', '<leader>du', '<Cmd>lua require("dap").step_out()<cr>',
  { silent = true, noremap = true, desc = "Step out" })

local dap = require("dap")
local dapui = require("dapui")
require("mason-nvim-dap").setup({
  ensure_installed = { "python" }
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
  debug_end()
end

dap.adapters.python = {
  type = 'executable',
  command = 'debugpy-adapter',
  args = {},
}

dap.configurations.python = {
  {
    type = 'python',
    request = 'launch',
    name = "Launch file",
    program = "${file}",
    pythonPath = "python"
  }
}

Keymap('n', '<leader>dP', dap.clear_breakpoints, "Clear all breakpoints")
Keymap('n', '<leader>dd', dap.continue, "Debug start/continue")
Keymap('n', '<leader>dr', dap.restart, "Debug restart")
Keymap('n', '<leader>dq', dap.terminate, "End debugging")
Keymap('n', '<leader>dp', dap.toggle_breakpoint, "Toggle breakpoint")
Keymap('n', '<leader>di', dap.step_into, "Step into")
Keymap('n', '<leader>do', dap.step_over, "Step over")
Keymap('n', '<leader>du', dap.step_out, "Step out")

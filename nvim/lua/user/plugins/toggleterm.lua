return {
  "akinsho/toggleterm.nvim",
  version = "v2.*",
  config = function()
    require("toggleterm").setup({
      open_mapping = [[<c-\>]],
      direction = 'float',
    })
    local Terminal = require('toggleterm.terminal').Terminal
    local _term_commands = {
      H = "htop",
      n = "node",
      p = "python",
      g = "lazygit",
    }

    M_terms = {}

    for k, v in pairs(_term_commands) do
      M_terms[v] = Terminal:new({ cmd = v, hidden = true, direction = "float" })
      vim.api.nvim_set_keymap("n", "<leader>t" .. k, "<cmd>lua M_terms." .. v .. ":toggle()<cr>", { silent = true, noremap = true, desc = "Open " .. v .. " in terminal" })
    end

    vim.api.nvim_set_keymap("n", "<leader>tf", "<cmd>ToggleTerm direction=float<cr>", { silent = true, noremap = true, desc = "Open floating terminal"})
    vim.api.nvim_set_keymap("n", "<leader>th", "<cmd>ToggleTerm direction=horizontal size=20<cr>", { silent = true, noremap = true, desc = "Open bottom terminal"})
    vim.api.nvim_set_keymap("n", "<leader>tv", "<cmd>ToggleTerm direction=vertical size=100<cr>", { silent = true, noremap = true, desc = "Open side terminal"})

    vim.api.nvim_set_keymap("t", "<Esc>", "<C-\\><C-n>", { silent = true, noremap = true })
    vim.api.nvim_set_keymap("t", "<C-h>", "<c-\\><c-n><c-w>h", { silent = true, noremap = true })
    vim.api.nvim_set_keymap("t", "<C-j>", "<c-\\><c-n><c-w>j", { silent = true, noremap = true })
    vim.api.nvim_set_keymap("t", "<C-k>", "<c-\\><c-n><c-w>k", { silent = true, noremap = true })
    vim.api.nvim_set_keymap("t", "<C-l>", "<c-\\><c-n><c-w>l", { silent = true, noremap = true })
  end
}

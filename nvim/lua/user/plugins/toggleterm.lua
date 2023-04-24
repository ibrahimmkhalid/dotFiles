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
      Keymap("n", "<leader>t" .. k, "<cmd>lua M_terms." .. v .. ":toggle()<cr>", "Open " .. v .. " in terminal")
    end

    Keymap("n", "<leader>tf", "<cmd>ToggleTerm direction=float<cr>", "Open floating terminal")
    Keymap("n", "<leader>th", "<cmd>ToggleTerm direction=horizontal size=20<cr>", "Open bottom terminal")
    Keymap("n", "<leader>tv", "<cmd>ToggleTerm direction=vertical size=100<cr>", "Open side terminal")

    Keymap("t", "<Esc>", "<C-\\><C-n>", "")
    Keymap("t", "<C-h>", "<c-\\><c-n><c-w>h", "")
    Keymap("t", "<C-j>", "<c-\\><c-n><c-w>j", "")
    Keymap("t", "<C-k>", "<c-\\><c-n><c-w>k", "")
    Keymap("t", "<C-l>", "<c-\\><c-n><c-w>l", "")
  end
}

local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  return
end

local actions = require "telescope.actions"

telescope.setup {
  defaults = {
    sorting_strategy = "ascending",
    layout_strategy = "horizontal",
    layout_config = {
      horizontal = {
        prompt_position = "top",
        preview_width = 0.6,
      },
      vertical = {
        mirror = false,
      },
      width = 0.90,
      height = 0.80,
      preview_cutoff = 120,
    },
    mappings = {
      i = {
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ["<M-j>"] = actions.preview_scrolling_down,
        ["<M-k>"] = actions.preview_scrolling_up,
      }
    }
  }
}


local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

keymap("n", "<leader>f", ":Telescope find_files<cr>", opts)
keymap("n", "<leader>F", ":Telescope live_grep<cr>", opts)

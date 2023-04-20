return {
  "nvim-telescope/telescope.nvim",
  version = "0.1.1",
  config = function()
    local actions = require("telescope.actions")
    require("telescope").setup({
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
    })
  end
}

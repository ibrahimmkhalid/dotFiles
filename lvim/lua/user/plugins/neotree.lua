return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v2.x",
  dependencies = {
    "MunifTanjim/nui.nvim"
  },
  config = function()
    require("neo-tree").setup({
      close_if_last_window = true,
      default_component_configs = {
        git_status = {
          symbols = {
            added = "",
            deleted = "",
            modified = "",
            renamed = "➜",
            untracked = "★",
            ignored = "◌",
            unstaged = "✗",
            staged = "✓",
            conflict = "",
          },
        },
      },
      window = {
        position = "right",
        width = 50,
        mapping_options = {
          noremap = true,
          nowait = true,
        },
        mappings = {
          ["n"] = {
            "toggle_node",
            nowait = true,
          },
          ["Z"] = "expand_all_nodes",
          ["m"] = {
            "move",
            config = {
              show_path = "relative"
            }
          },
          ["q"] = "close_window",
          ["R"] = "refresh",
          ["?"] = "show_help",
          ["<leader>V"] = "open_split",
          ["<leader>v"] = "open_vsplit",
          ["<"] = "prev_source",
          [">"] = "next_source",
        }
      },
      filesystem = {
        filtered_items = {
          visible = false,
          hide_dotfiles = true,
          hide_gitignored = true,
          hide_by_name = {
            ".DS_Store",
            "thumbs.db",
            "node_modules",
            "__pycache__",
          },
        },
        window = {
          mappings = {
            ["."] = "set_root",
            ["H"] = "toggle_hidden",
            ["<leader>gk"] = "prev_git_modified",
            ["<leader>gj"] = "next_git_modified",
          }
        },
        follow_current_file = true,
        hijack_netrw_behavior = "open_current",
        use_libuv_file_watcher = true,
      },
      git_status = {
        window = {
          position = "float"
        }
      }
    })

    Keymap("n", "<leader>e", ":NeoTreeFocusToggle<cr>", "Open file tree")
  end
}

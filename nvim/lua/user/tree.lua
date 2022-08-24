
local status_ok, tree = pcall(require, "neo-tree")
if not status_ok then
  return
end

tree.setup {
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
      ["<space>"] = {
          "toggle_node",
          nowait = false,
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
}

local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

keymap("n", "<leader>e", ":NeoTreeFocusToggle<cr>", opts)


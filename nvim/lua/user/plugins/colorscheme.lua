return {
  "neanias/everforest-nvim",
  lazy = false,
  priority = 1000,
  config = function()
    local COLOR_MODE_FILE = vim.fn.expand("~/._.color-mode")
    local uv = vim.uv or vim.loop
    local everforest = require("everforest")

    local function apply_color_mode()
      local f = io.open(COLOR_MODE_FILE, "r")
      if not f then
        return
      end
      local mode = vim.trim(f:read("*a") or "")
      f:close()

      vim.schedule(function()
        local bg = (mode == "light") and "light" or "dark"
        local hardness = (bg == "dark") and "medium" or "hard"

        vim.o.background = bg
        everforest.setup({ background = hardness })
        everforest.load()
      end)
    end

    local function start_watching()
      local dir = vim.fn.fnamemodify(COLOR_MODE_FILE, ":h")
      local target = vim.fn.fnamemodify(COLOR_MODE_FILE, ":t")

      local handle = uv.new_fs_event()
      if not handle then
        vim.notify(
          "color-mode-watcher: failed to create fs_event",
          vim.log.levels.WARN
        )
        return
      end

      handle:start(dir, {}, function(err, filename, _events)
        if err or filename ~= target then
          return
        end
        apply_color_mode()
      end)

      vim.api.nvim_create_autocmd("VimLeavePre", {
        callback = function()
          if not handle:is_closing() then
            handle:close()
          end
        end,
      })
    end

    if vim.fn.filereadable(COLOR_MODE_FILE) == 0 then
      local f = io.open(COLOR_MODE_FILE, "w")
      if f then
        f:write("dark\n")
        f:close()
      end
    end

    local f = io.open(COLOR_MODE_FILE, "r")
    local mode = "dark"
    if f then
      mode = vim.trim(f:read("*a") or "")
      f:close()
    end

    local bg = (mode == "light") and "light" or "dark"
    local hardness = (bg == "dark") and "medium" or "hard"

    vim.o.background = bg
    everforest.setup({ background = hardness })
    everforest.load()

    start_watching()
  end,
}

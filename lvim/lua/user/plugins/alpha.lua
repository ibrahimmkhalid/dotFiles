return {
  "goolord/alpha-nvim",
  config = function()
    local alpha = require("alpha")
    local plenary_path = require("plenary.path")
    local session_manager = require("user.session")
    local vim = vim
    local leader = "SPC"
    local if_nil = vim.F.if_nil
    local default_mru_ignore = { "gitcommit" }
    local mru_opts = {
      ignore = function(path, ext)
        return (string.find(path, "COMMIT_EDITMSG")) or (vim.tbl_contains(default_mru_ignore, ext))
      end,
      autocd = true
    }

    --- @param sc string
    --- @param txt string
    --- @param keybind string? optional
    --- @param keybind_opts table? optional
    local function button(sc, txt, keybind, keybind_opts)
      local sc_ = sc:gsub("%s", ""):gsub(leader, "<leader>")

      local opts = {
        position = "left",
        shortcut = "[" .. sc .. "] ",
        cursor = 1,
        align_shortcut = "left",
        hl_shortcut = { { "Operator", 0, 1 }, { "Number", 1, #sc + 1 }, { "Operator", #sc + 1, #sc + 2 } },
        shrink_margin = false,
      }
      if keybind then
        keybind_opts = if_nil(keybind_opts, { noremap = true, silent = true, nowait = true })
        opts.keymap = { "n", sc_, keybind, keybind_opts }
      end

      local function on_press()
        local key = vim.api.nvim_replace_termcodes(keybind .. "<Ignore>", true, false, true)
        vim.api.nvim_feedkeys(key, "t", false)
      end

      return {
        type = "button",
        val = txt,
        on_press = on_press,
        opts = opts,
      }
    end


    local function get_extension(fn)
      local match = fn:match("^.+(%..+)$")
      local ext = ""
      if match ~= nil then
        ext = match:sub(2)
      end
      return ext
    end


    local function file_button(fn, sc, short_fn, autocd)
      short_fn = short_fn or fn
      local ico_txt
      local fb_hl = {}

      ico_txt = " "
      local cd_cmd = (autocd and " | cd %:p:h" or "")
      local file_button_el = button(sc, ico_txt .. short_fn, "<cmd>e " .. fn .. cd_cmd .. " <CR>")
      local fn_start = short_fn:match(".*[/\\]")
      if fn_start ~= nil then
        table.insert(fb_hl, { "Comment", #ico_txt - 2, #fn_start + #ico_txt })
      end
      file_button_el.opts.hl = fb_hl
      return file_button_el
    end

    --- @param start number
    --- @param cwd string? optional
    --- @param items_number number? optional number of items to generate, default = 10
    local function mru(start, cwd, items_number, opts)
      opts = opts or mru_opts
      items_number = if_nil(items_number, 10)

      local oldfiles = {}
      for _, v in pairs(vim.v.oldfiles) do
        if #oldfiles == items_number then
          break
        end
        local cwd_cond
        if not cwd then
          cwd_cond = true
        else
          cwd_cond = vim.startswith(v, cwd)
        end
        local ignore = (opts.ignore and opts.ignore(v, get_extension(v))) or false
        if (vim.fn.filereadable(v) == 1) and cwd_cond and not ignore then
          oldfiles[#oldfiles + 1] = v
        end
      end
      local target_width = 100

      local tbl = {}
      for i, fn in ipairs(oldfiles) do
        local short_fn
        if cwd then
          short_fn = vim.fn.fnamemodify(fn, ":.")
        else
          short_fn = vim.fn.fnamemodify(fn, ":~")
        end

        if #short_fn > target_width then
          short_fn = plenary_path.new(short_fn):shorten(1, { -2, -1 })
          if #short_fn > target_width then
            short_fn = plenary_path.new(short_fn):shorten(1, { -1 })
          end
        end

        local shortcut = tostring(i + start)

        local file_button_el = file_button(fn, shortcut, short_fn, opts.autocd)
        tbl[i] = file_button_el
      end
      return {
        type = "group",
        val = tbl,
        opts = {},
      }
    end

    local function session_buttons()
      local sessions = session_manager.get_sessions()
      local buttons = {}
      local button_keymaps = { "u", "i", "o", "p", "y" }
      for i, session in ipairs(sessions) do
        local button_tmp = button(button_keymaps[i], session.name,
          ":source ~/.local/share/nvim/session/" .. session.file .. "<CR>")
        table.insert(buttons, button_tmp)
      end
      return buttons
    end

    local header = {
      type = "text",
      val = {
        [[███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗]],
        [[████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║]],
        [[██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║]],
        [[██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║]],
        [[██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║]],
        [[╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝]],
      },
      opts = {
        position = "left",
        hl = "Type",
      },
    }

    local sessions = {
      type = "group",
      opts = { spacing = 1 },
      val = {
        { type = "text", val = "Sessions", opts = { position = "left", hl = "SpecialComment" } },
        {
          type = "group",
          opts = { inherit = { position = "left" } },
          val = session_buttons(),
        },
      },
    }

    local section_mru = {
      type = "group",
      val = {
        {
          type = "text",
          val = "Recent files",
          opts = {
            hl = "SpecialComment",
            shrink_margin = false,
            position = "left",
          },
        },
        { type = "padding", val = 1 },
        {
          type = "group",
          val = function()
            return { mru(0) }
          end,
          opts = { shrink_margin = false },
        },
      },
    }

    local buttons = {
      type = "group",
      val = {
        { type = "text",    val = "Commands", opts = { hl = "SpecialComment", position = "left" } },
        { type = "padding", val = 1 },
        button("e", "New file", "<cmd>ene<CR>"),
        button("f", "Find file current dir", ":Telescope find_files<CR>"),
        button("g", "Live grep current dir", ":Telescope live_grep<CR>"),
        button("c", "NeoVim Configuration", ":lua require'user.etc'.open_lvim_config()<CR>"),
        button("s", "Sync plugins", "<cmd>Lazy sync<CR>"),
        button("q", "Quit", "<cmd>qa<CR>"),
      },
      position = "left",
    }

    local config = {
      layout = {
        { type = "padding", val = 2 },
        header,
        { type = "padding", val = 2 },
        sessions,
        { type = "padding", val = 2 },
        section_mru,
        { type = "padding", val = 2 },
        buttons,
      },
      opts = {
        margin = 5,
        setup = function()
          vim.api.nvim_create_autocmd('DirChanged', {
            pattern = '*',
            group = "alpha_temp",
            callback = function() alpha.redraw() end,
          })
        end,
      },
    }
    alpha.setup(config)
  end
}

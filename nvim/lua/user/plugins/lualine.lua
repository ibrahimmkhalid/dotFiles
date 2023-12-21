return {
  "nvim-lualine/lualine.nvim",
  config = function()
    local function get_lsp_name()
      local msg = 'No Active Lsp'
      local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
      local clients = vim.lsp.get_active_clients()
      if next(clients) == nil then
        return msg
      end
      for _, client in ipairs(clients) do
        local filetypes = client.config.filetypes
        if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
          return client.name
        end
      end
      return msg
    end

    local function get_copilot_status()
      local status = false
      local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
      if not buf_ft or buf_ft == '' then
        return status
      end

      if vim.g.ibrahimmkhalid_copilot_indicator == true then
        local copilot_allowed_on_ft = true
        for ft, _ in pairs(vim.g.copilot_filetypes) do
          if ft == buf_ft then
            copilot_allowed_on_ft = false
            break
          end
        end

        if copilot_allowed_on_ft then
          status = true
        end
      end
      return status
    end

    require("lualine").setup({
      options = {
        icons_enabled = true,
        theme = 'auto',
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
        disabled_filetypes = {
          statusline = {},
          winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = false,
        refresh = {
          statusline = 1000,
          tabline = 1000,
          winbar = 1000,
        }
      },
      sections = {
        lualine_a = { 'branch' },
        lualine_b = { 'diff', 'diagnostics' },
        lualine_c = { { 'filename', path = 1 } },
        lualine_x = { {
          get_lsp_name,
          icon = ' LSP:',
        }, 'filetype', {
          function()
            return "Copilot enabled"
          end,
          cond = get_copilot_status,
          icon = ''
        } },
        lualine_y = { 'progress' },
        lualine_z = { 'location' }
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { { 'filename', path = 1 } },
        lualine_x = { 'location' },
        lualine_y = {},
        lualine_z = {}
      },
      tabline = {},
      winbar = {},
      inactive_winbar = {},
      extensions = {}
    })
  end
}

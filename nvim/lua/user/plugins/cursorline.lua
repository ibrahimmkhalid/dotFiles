return {
  "ibrahimmkhalid/nvim-cursorline",
  branch = "bugfix-unsafe-check-on-cursorword-id",
  config = function()
    local function getVisualHighlightColor()
      local visual_hl = vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID('Visual')), 'bg')
      return visual_hl
    end

    local bg_color = getVisualHighlightColor()

    local hl_attr = {}
    if bg_color == '' then
      hl_attr = {
        underline = true
      }
    else
      hl_attr = {
        underline = false,
        bg = bg_color
      }
    end

    require('nvim-cursorline').setup {
      cursorline = {
        enable = false,
      },
      cursorword = {
        enable = true,
        hl = hl_attr,
      }
    }
  end
}

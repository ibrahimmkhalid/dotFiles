return {
  "akinsho/toggleterm.nvim",
  version = "v2.*",
  config = function ()
    require("toggleterm").setup({
      open_mapping = [[<c-\>]],
      direction = 'float',
    })
  end
}

return {
  "romgrk/barbar.nvim",
  config = function ()
    require("bufferline").setup({
      maximum_length = 45
    })
  end
}

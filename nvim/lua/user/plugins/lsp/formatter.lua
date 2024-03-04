local util = require("formatter.util")

require("formatter").setup {
  filetype = {
    python = {
      require("formatter.filetypes.python").black,
    },
    ["*"] = {
      require("formatter.filetypes.any").remove_trailing_whitespace
    }
  }
}

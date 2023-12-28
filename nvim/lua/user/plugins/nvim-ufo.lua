return {
  "kevinhwang91/nvim-ufo",
  dependencies = {
    "kevinhwang91/promise-async"
  },
  config = function()
    local ufo = require("ufo")

    ufo.setup({
      provider_selector = function(bufnr, filetype, buftype)
        return { 'treesitter' }
      end
    })
    vim.o.foldcolumn = '0'
    vim.o.foldlevel = 99
    vim.o.foldlevelstart = 99
    vim.o.foldenable = false

    vim.api.nvim_set_keymap('n', 'zR', '<Cmd>lua require("ufo").openAllFolds()<cr>',
      { silent = true, noremap = true, desc = "Open all folds" })
    vim.api.nvim_set_keymap('n', 'zM', '<Cmd>lua require("ufo").closeAllFolds()<cr>',
      { silent = true, noremap = true, desc = "Close all folds" })

    vim.api.nvim_set_keymap('n', 'zk', '', {
      callback = function()
        local winid = ufo.peekFoldedLinesUnderCursor()
        if not winid then
          vim.lsp.buf.hover()
        end
      end,
      desc = "peek fold",
      silent = true,
      noremap = true
    })
  end
}

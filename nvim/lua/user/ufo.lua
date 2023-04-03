local status_ok, ufo = pcall(require, "ufo")
if not status_ok then
  return
end

ufo.setup({
  provider_selector = function(bufnr, filetype, buftype)
        return {'treesitter', 'indent'}
    end
})


vim.o.foldcolumn = '0'
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
vim.o.foldenable = false

vim.keymap.set('n', 'zR', ufo.openAllFolds)
vim.keymap.set('n', 'zM', ufo.closeAllFolds)


vim.keymap.set('n', 'gk', function()
    local winid = ufo.peekFoldedLinesUnderCursor()
    if not winid then
        vim.lsp.buf.hover()
    end
end)

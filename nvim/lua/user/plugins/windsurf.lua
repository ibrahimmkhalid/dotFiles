return {
  "Exafunction/windsurf.vim",
  event = "BufEnter",
  config = function()
    vim.g.codeium_disable_bindings = 1
    vim.g.codeium_manual = true
    vim.keymap.set('i', '<C-y>', function() return vim.fn['codeium#Accept']() end, { expr = true, silent = true })
    vim.keymap.set('i', '<M-y>',
      function()
        vim.schedule(function() vim.fn['codeium#CycleOrComplete']() end, { silent = true })
        return vim.fn['codeium#AcceptNextLine']() .. "<CR>"
      end,
      { expr = true, silent = true })
    vim.keymap.set('i', '<M-j>', function() return vim.fn['codeium#CycleOrComplete']() end,
      { expr = true, silent = true })
    vim.keymap.set('i', '<M-k>', function() return vim.fn['codeium#CycleCompletions'](-1) end,
      { expr = true, silent = true })
    vim.keymap.set('i', '<C-e>', function() return vim.fn['codeium#Clear']() end, { expr = true, silent = true })
  end
}

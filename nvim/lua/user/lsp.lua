local status_ok, lsp = pcall(require, "lsp-zero")
if not status_ok then
  return
end

lsp.preset({
  name = 'lsp-compe',
})

lsp.set_preferences({
  suggest_lsp_servers = false,
  sign_icons = {
    error = "",
    warn = "",
    hint = "",
    info = ""
  }
})


local config = {
  -- disable virtual text
  virtual_text = false,
  update_in_insert = true,
  underline = true,
  severity_sort = true,
  float = {
    focusable = false,
    style = "minimal",
    border = "rounded",
    source = "always",
    header = "",
    prefix = "",
  },
}

vim.diagnostic.config(config)

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
  border = "rounded",
})

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
  border = "rounded",
})

local function lsp_highlight_document(client)
  -- Set autocommands conditional on server_capabilities
  if client.server_capabilities.document_highlight then
    vim.api.nvim_exec(
      [[
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]],
      false
    )
  end
end

lsp.on_attach(function(client, bufrn)
  local opts = { noremap = true, silent = true, buffer = bufrn }

  vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
  vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
  vim.keymap.set("n", "gk", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
  vim.keymap.set("n", "gF", "<cmd>lua vim.lsp.buf.formatting_sync()<CR>", opts)
  vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
  vim.keymap.set("n", "gK", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
  vim.keymap.set("n", "gR", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
  vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
  vim.keymap.set("n", "ga", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
  vim.keymap.set("n", "gn", '<cmd>lua vim.diagnostic.goto_next({ border = "rounded" })<CR>', opts)
  vim.keymap.set("n", "gN", '<cmd>lua vim.diagnostic.goto_prev({ border = "rounded" })<CR>', opts)
  vim.keymap.set("n", "gl", '<cmd>lua vim.diagnostic.open_float({ border = "rounded" })<CR>', opts)
  vim.cmd [[ command! Format execute 'lua vim.lsp.buf.format()' ]]

  if client.server_capabilities.document_highlight then
    vim.api.nvim_exec(
      [[
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]],
      false
    )
  end

  lsp_highlight_document(client)
end)

lsp.setup()

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

lsp.ensure_installed({
  "bashls",
  "clangd",
  "eslint",
  "intelephense",
  "lua_ls",
  "marksman",
  "pyright",
  "rust_analyzer",
  "sqlls",
  "tsserver",
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

local function lsp_highlight_document(client, bufnr)
  if client.server_capabilities.documentHighlightProvider then
    local gid = vim.api.nvim_create_augroup("lsp_document_highlight", {clear = true})
    vim.api.nvim_create_autocmd("CursorHold" , {
      group = gid,
      buffer = bufnr,
      callback = function ()
        vim.lsp.buf.document_highlight()
      end
    })

    vim.api.nvim_create_autocmd("CursorMoved" , {
      group = gid,
      buffer = bufnr,
      callback = function ()
        vim.lsp.buf.clear_references()
      end
    })
  end
end

lsp.on_attach(function(client, bufrn)
  local opts = { noremap = true, silent = true, buffer = bufrn }

  vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
  vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
  vim.keymap.set("n", "gk", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
  vim.keymap.set("n", "gF", "<cmd>lua vim.lsp.buf.format()<CR>", opts)
  vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
  vim.keymap.set("n", "gK", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
  vim.keymap.set("n", "gR", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
  vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
  vim.keymap.set("n", "ga", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
  vim.keymap.set("n", "gn", '<cmd>lua vim.diagnostic.goto_next({ border = "rounded" })<CR>', opts)
  vim.keymap.set("n", "gN", '<cmd>lua vim.diagnostic.goto_prev({ border = "rounded" })<CR>', opts)
  vim.keymap.set("n", "gl", '<cmd>lua vim.diagnostic.open_float({ border = "rounded" })<CR>', opts)

  lsp_highlight_document(client, bufrn)
end)

lsp.setup()

require('mason').setup()

require('mason-lspconfig').setup({
  ensure_installed = {
    "bashls",
    "clangd",
    "eslint",
    "intelephense",
    "lua_ls",
    "marksman",
    "jedi_language_server",
    "rust_analyzer",
    "sqlls",
    "tsserver",
  }
})

local lspconfig = require('lspconfig')

local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()
local lsp_attach = function(client, bufnr)
  local keymap = vim.api.nvim_buf_set_keymap

  keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>",
    { noremap = true, silent = true, desc = "Go to declaration" })

  keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>",
    { noremap = true, silent = true, desc = "Go to definition" })

  keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>",
    { noremap = true, silent = true, desc = "Information" })

  keymap(bufnr, "n", "gF", "<cmd>lua vim.lsp.buf.format()<CR>", { noremap = true, silent = true, desc = "Format" })

  keymap(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>",
    { noremap = true, silent = true, desc = "Go to implementation" })

  keymap(bufnr, "n", "gK", "<cmd>lua vim.lsp.buf.signature_help()<CR>",
    { noremap = true, silent = true, desc = "Signature Help" })

  keymap(bufnr, "n", "gR", "<cmd>lua vim.lsp.buf.rename()<CR>", { noremap = true, silent = true, desc = "Rename" })

  keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>",
    { noremap = true, silent = true, desc = "Find references" })

  keymap(bufnr, "n", "ga", "<cmd>lua vim.lsp.buf.code_action()<CR>",
    { noremap = true, silent = true, desc = "Code action" })

  keymap(bufnr, "n", "go", "<cmd>lua vim.lsp.buf.type_definition()<CR>",
    { noremap = true, silent = true, desc = "Type definition" })

  keymap(bufnr, "n", "gn", '<cmd>lua vim.diagnostic.goto_next({ border = "rounded" })<CR>',
    { noremap = true, silent = true, desc = "Go to next diagnostic" })

  keymap(bufnr, "n", "gN", '<cmd>lua vim.diagnostic.goto_prev({ border = "rounded" })<CR>',
    { noremap = true, silent = true, desc = "Go to previous disagnostic" })

  keymap(bufnr, "n", "gl", '<cmd>lua vim.diagnostic.open_float({ border = "rounded" })<CR>',
    { noremap = true, silent = true, desc = "Open Float" })
end

require('mason-lspconfig').setup_handlers({
  function(server_name)
    lspconfig[server_name].setup({
      on_attach = lsp_attach,
      capabilities = lsp_capabilities,
    })
  end,
})

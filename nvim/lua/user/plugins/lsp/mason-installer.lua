require('mason-tool-installer').setup {
  ensure_installed = {
    "bashls",
    "clangd",
    "eslint",
    "lua_ls",
    "marksman",
    "pyright",
    "rust_analyzer",
    "sqlls",
    "tsserver",
    "black",
    "texlab",
    "codelldb",
    "debugpy",
    "gopls",
    "tailwindcss",
  },
}

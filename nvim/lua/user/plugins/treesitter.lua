return {
  "romus204/tree-sitter-manager.nvim",
  dependencies = {
  },
  config = function()
    require("tree-sitter-manager").setup({
      ensure_installed = {"python", "lua", "javascript", "typescript" },
      auto_install = true,
    })
  end
}

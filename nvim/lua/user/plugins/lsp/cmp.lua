local cmp = require("cmp")
local luasnip = require("luasnip")

require("luasnip/loaders/from_vscode").lazy_load()

local lspkind = require('lspkind')
cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body) -- For `luasnip` users.
    end,
  },
  mapping = {
    ["<Up>"] = cmp.mapping.select_prev_item(),
    ["<Down>"] = cmp.mapping.select_next_item(),
    ["<C-k>"] = cmp.mapping.select_prev_item(),
    ["<C-j>"] = cmp.mapping.select_next_item(),
    ["<M-k>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i" }),
    ["<M-j>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i" }),
    ["<C-C>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
    ["<C-e>"] = cmp.mapping {
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    },
    ["<C-y>"] = cmp.mapping.confirm { select = false },
  },
  formatting = {
    fields = { "kind", "abbr", "menu" },
    format = lspkind.cmp_format({
      mode = 'symbol', -- show only symbol annotations
      before = function (entry, vim_item)
        vim_item.menu = ({
          nvim_lsp = "[LSP]",
          luasnip = "[Snippet]",
          buffer = "[Buffer]",
          emoji = "[Emoji]",
          path = "[Path]",
        })[entry.source.name]
        return vim_item
      end
    })
  },
  sources = {
    { name = "nvim_lsp" },
    { name = "luasnip" },
    { name = "buffer" },
    { name = "emoji" },
    { name = "path" },
  },
  confirm_opts = {
    behavior = cmp.ConfirmBehavior.Replace,
    select = false,
  },
  window = {
    documentation = {
      border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
    },
  },
  experimental = {
    ghost_text = false,
    native_menu = false,
  },
}

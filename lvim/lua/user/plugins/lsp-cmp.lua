return {
  'VonHeikemen/lsp-zero.nvim',
  branch = 'v2.x',
  dependencies = {
    -- LSP Support
    { 'neovim/nvim-lspconfig' }, -- Required
    {
      -- Optional
      'williamboman/mason.nvim',
      build = function()
        pcall(vim.cmd, 'MasonUpdate')
      end,
    },
    { 'williamboman/mason-lspconfig.nvim' }, -- Optional

    -- Autocompletion
    { 'hrsh7th/nvim-cmp' },         -- Required
    { 'hrsh7th/cmp-nvim-lsp' },     -- Required
    { 'hrsh7th/cmp-buffer' },       -- Optional
    { 'hrsh7th/cmp-path' },         -- Optional
    { 'hrsh7th/cmp-emoji' },        -- Emoji completions
    { 'saadparwaiz1/cmp_luasnip' }, -- Optional
    { 'hrsh7th/cmp-nvim-lua' },     -- Optional

    -- Snippets
    { 'L3MON4D3/LuaSnip' },             -- Required
    { 'rafamadriz/friendly-snippets' }, -- Optional
  },
  config = function()
    -- lsp --
    local lsp = require("lsp-zero")
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
        local gid = vim.api.nvim_create_augroup("lsp_document_highlight", { clear = true })
        vim.api.nvim_create_autocmd("CursorHold", {
          group = gid,
          buffer = bufnr,
          callback = function()
            vim.lsp.buf.document_highlight()
          end
        })

        vim.api.nvim_create_autocmd("CursorMoved", {
          group = gid,
          buffer = bufnr,
          callback = function()
            vim.lsp.buf.clear_references()
          end
        })
      end
    end

    lsp.on_attach(function(client, bufrn)
      local keymap = vim.api.nvim_buf_set_keymap
      keymap(bufrn, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>",
      { noremap = true, silent = true, desc = "Go to declaration" })
      keymap(bufrn, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>",
      { noremap = true, silent = true, desc = "Go to definition" })
      keymap(bufrn, "n", "gk", "<cmd>lua vim.lsp.buf.hover()<CR>",
      { noremap = true, silent = true, desc = "Information" })
      keymap(bufrn, "n", "gF", "<cmd>lua vim.lsp.buf.format()<CR>", { noremap = true, silent = true, desc = "Format" })
      keymap(bufrn, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>",
      { noremap = true, silent = true, desc = "Go to implementation" })
      keymap(bufrn, "n", "gK", "<cmd>lua vim.lsp.buf.signature_help()<CR>",
      { noremap = true, silent = true, desc = "Signature Help" })
      keymap(bufrn, "n", "gR", "<cmd>lua vim.lsp.buf.rename()<CR>", { noremap = true, silent = true, desc = "Rename" })
      keymap(bufrn, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>",
      { noremap = true, silent = true, desc = "Find references" })
      keymap(bufrn, "n", "ga", "<cmd>lua vim.lsp.buf.code_action()<CR>",
      { noremap = true, silent = true, desc = "Code action" })
      keymap(bufrn, "n", "go", "<cmd>lua vim.lsp.buf.type_definition()<CR>",
      { noremap = true, silent = true, desc = "Type definition" })
      keymap(bufrn, "n", "gn", '<cmd>lua vim.diagnostic.goto_next({ border = "rounded" })<CR>',
      { noremap = true, silent = true, desc = "Go to next diagnostic" })
      keymap(bufrn, "n", "gN", '<cmd>lua vim.diagnostic.goto_prev({ border = "rounded" })<CR>',
      { noremap = true, silent = true, desc = "Go to previous disagnostic" })
      keymap(bufrn, "n", "gl", '<cmd>lua vim.diagnostic.open_float({ border = "rounded" })<CR>',
      { noremap = true, silent = true, desc = "Open Float" })
      lsp_highlight_document(client, bufrn)
    end)

    lsp.setup()

    -- cmp --
    local cmp_status_ok, cmp = pcall(require, "cmp")
    if not cmp_status_ok then
      return
    end

    local snip_status_ok, luasnip = pcall(require, "luasnip")
    if not snip_status_ok then
      return
    end

    require("luasnip/loaders/from_vscode").lazy_load()

    local check_backspace = function()
      local col = vim.fn.col "." - 1
      return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
    end

    local kind_icons = {
      Text = "",
      Method = "m",
      Function = "",
      Constructor = "",
      Field = "",
      Variable = "",
      Class = "",
      Interface = "",
      Module = "",
      Property = "",
      Unit = "",
      Value = "",
      Enum = "",
      Keyword = "",
      Snippet = "",
      Color = "",
      File = "",
      Reference = "",
      Folder = "",
      EnumMember = "",
      Constant = "",
      Struct = "",
      Event = "",
      Operator = "",
      TypeParameter = "",
    }

    cmp.setup {
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body) -- For `luasnip` users.
        end,
      },
      mapping = {
        ["<C-k>"] = cmp.mapping.select_prev_item(),
        ["<C-j>"] = cmp.mapping.select_next_item(),
        ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
        ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
        ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
        ["<C-y>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
        ["<C-e>"] = cmp.mapping {
          i = cmp.mapping.abort(),
          c = cmp.mapping.close(),
        },
        ["<CR>"] = cmp.mapping.confirm { select = false },
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expandable() then
            luasnip.expand()
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          elseif check_backspace() then
            fallback()
          else
            fallback()
          end
        end, {
          "i",
          "s",
        }),
        ["<C-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, {
          "i",
          "s",
        }),
      },
      formatting = {
        fields = { "kind", "abbr", "menu" },
        format = function(entry, vim_item)
          -- Kind icons
          vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
          vim_item.menu = ({
            nvim_lsp = "[LSP]",
            luasnip = "[Snippet]",
            buffer = "[Buffer]",
            emoji = "[Emoji]",
            path = "[Path]",
          })[entry.source.name]
          return vim_item
        end,
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
  end
}

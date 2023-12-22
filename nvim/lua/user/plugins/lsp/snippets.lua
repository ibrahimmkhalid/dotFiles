local ls = require("luasnip")

local s = ls.s
local t = ls.text_node

ls.add_snippets( "lua", {
    s({name="DAP Configuration for Python", trig="dappython"}, { t({
      "local dap = require(\"dap\")",
      "dap.adapters.python = {",
      "  type = \"executable\",",
      "  command = \"debugpy-adapter\",",
      "  args = {},",
      "}",
      "dap.configurations.python = {",
      "  {",
      "    type = \"python\",",
      "    request = \"launch\",",
      "    name = \"Launch file\",",
      "    program = \"${file}\",",
      "    pythonPath = \"python\"",
      "  }",
      "}",
    })})
  }
)

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

ls.add_snippets( "all", {
    s({name="Basic project environment for python", trig="pyproj"}, { t({
      "source ~/pyenv_sjsu/bin/activate",
    })}),
    s({name="Basic project environment for python on wayland", trig="pyprojgui"}, { t({
      "source ~/pyenv_sjsu/bin/activate",
      "export QT_QPA_PLATFORM=wayland",
    })})
  }
)

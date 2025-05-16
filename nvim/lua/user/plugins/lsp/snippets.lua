local ls = require("luasnip")

local s = ls.s
local t = ls.text_node

ls.add_snippets("lua", {
  s({ name = "DAP Configuration for Python", trig = "dappython" }, { t({
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
  }) })
}
)

ls.add_snippets("python", {
  s({ name = "Load base_path for data applications", trig = "loadenv" }, { t({
    "try:",
    "    from google.colab import drive",
    "",
    "    drive.mount('/content/drive')",
    "    base_path = 'REPLACE ME'",
    "    print('Running on google colab')",
    "except:",
    "    import dotenv",
    "    import os",
    "",
    "    dotenv.load_dotenv()",
    "    base_path = os.getenv('DATASET_BASE_PATH', './data')",
    "    print('Running on local instance')",
    "print('Base path:', base_path)",
    "",
    "# %%",
  }) })
})

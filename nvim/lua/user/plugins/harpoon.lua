return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  config = function()
    local harpoon = require("harpoon")
    harpoon:setup({
      settings = {
        save_on_toggle = true,
        sync_on_ui_close = true,
      }
    })

    vim.api.nvim_set_keymap("n", "<leader>mm", "", { silent = true, noremap = true, desc = "Open harpoon list", callback = function ()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end})

    vim.api.nvim_set_keymap("n", "<leader>ma", "", { silent = true, noremap = true, desc = "Append to harpoon list", callback = function ()
      harpoon:list():append()
    end})

    vim.api.nvim_set_keymap("n", "<leader>mq", "", { silent = true, noremap = true, desc = "Harpoon item 1", callback = function ()
      harpoon:list():select(1)
    end})

    vim.api.nvim_set_keymap("n", "<leader>mw", "", { silent = true, noremap = true, desc = "Harpoon item 2", callback = function ()
      harpoon:list():select(2)
    end})

    vim.api.nvim_set_keymap("n", "<leader>me", "", { silent = true, noremap = true, desc = "Harpoon item 3", callback = function ()
      harpoon:list():select(3)
    end})

    vim.api.nvim_set_keymap("n", "<leader>mr", "", { silent = true, noremap = true, desc = "Harpoon item 4", callback = function ()
      harpoon:list():select(4)
    end})

    vim.api.nvim_set_keymap("n", "<leader>mt", "", { silent = true, noremap = true, desc = "Harpoon item 5", callback = function ()
      harpoon:list():select(5)
    end})

  end
}
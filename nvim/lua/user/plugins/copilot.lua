return {
  "github/copilot.vim",
  config = function ()
    vim.g.copilot_assume_mapped = true
    vim.g.copilot_no_tab_map = true
    vim.g.copilot_no_maps = true
    vim.g.copilot_filetypes = {
      ["markdown"] = false,
      ["txt"] = false,
      ["ini"] = false,
      ["gitcommit"] = false,
      ["gitrebase"] = false,
      ["xml"] = false,
      ["json"] = false,
      ["help"] = false,
      ["harpoon"] = false,
      ["neo-tree"] = false,
      ["NeogitStatus"] = false,
      ["NeogitCommitMessage"] = false,
    }

    local check_copilot_global_status = function ()
      local status_file = "~/.local/share/nvim/copilot_status"
      vim.cmd("silent !touch " .. status_file)
      local status = vim.fn.system("cat " .. status_file)
      if status == "1\n" then
        return true
      else
        return false
      end
    end

    _G.toggle_copilot_global_status = function ()
      local status = check_copilot_global_status()
      local status_file = "~/.local/share/nvim/copilot_status"
      if status then
        vim.cmd("silent !echo 0 > " .. status_file)
        vim.cmd("Copilot disable")
        vim.g.ibrahimmkhalid_copilot_indicator = false
      else
        vim.cmd("silent !echo 1 > " .. status_file)
        vim.cmd("Copilot enable")
        vim.g.ibrahimmkhalid_copilot_indicator = true
      end
    end


    vim.api.nvim_create_autocmd("VimEnter", {
      callback = function ()
        local status = check_copilot_global_status()
        if status then
          vim.g.ibrahimmkhalid_copilot_indicator = true
        else
          vim.g.ibrahimmkhalid_copilot_indicator = false
        end
      end
    })

    vim.api.nvim_set_keymap("i", "<C-y>", 'copilot#Accept("\\<CR>")', { replace_keycodes = false, expr = true, noremap = false, silent = true })
    vim.api.nvim_set_keymap("i", "<C-l>", '<Plug>(copilot-accept-word)', { noremap = false, silent = true })
    vim.api.nvim_set_keymap("i", "<C-j>", '<Plug>(copilot-next)', { noremap = false, silent = true })
    vim.api.nvim_set_keymap("i", "<C-k>", '<Plug>(copilot-previous)', { noremap = false, silent = true })
    vim.api.nvim_set_keymap("i", "<M-/>", '<Plug>(copilot-suggest)', { noremap = false, silent = true })
    vim.api.nvim_set_keymap("i", "<C-e>", '<Plug>(copilot-dismiss)', { noremap = false, silent = true })
    vim.api.nvim_set_keymap("n", "<leader>agi", ":lua toggle_copilot_global_status()<CR>", { noremap = true, silent = true, desc = "Toggle Artificial Github Intelligence" })
  end
}

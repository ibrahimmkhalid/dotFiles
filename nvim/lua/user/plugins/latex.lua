return {
  'lervag/vimtex',
  config = function()
    -- check if running in WSL by checking if powershell.exe is found with 'which'
    local is_wsl = vim.fn.system('which powershell.exe') ~= ''
    if is_wsl then
      vim.g.vimtex_view_general_viewer = '/home/ibrahim/.local/bin/SumatraPDF_synctex.sh'
      vim.g.vimtex_view_general_options = '-reuse-instance -forward-search @tex @line @pdf'
    else
      vim.g.vimtex_view_method = 'zathura'
    end
  end
}

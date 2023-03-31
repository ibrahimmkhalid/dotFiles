local status_ok, which = pcall(require, "which-key")
if not status_ok then
  return
end

vim.o.timeout = true
vim.o.timeoutlen = 250

which.setup()

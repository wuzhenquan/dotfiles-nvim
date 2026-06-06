require("clipboard")

-- line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Tab
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

-- Sync with system clipboard
vim.opt.clipboard = "unnamedplus"

-- Sync standard yank with this clipboard
vim.opt.clipboard = "unnamedplus"

-- Debug
-- vim.lsp.set_log_level("debug")

require("config.lazy")

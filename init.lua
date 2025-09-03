-- line numbers
vim.opt.number=true
vim.opt.relativenumber=true

-- Tab
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

-- Debug
-- vim.lsp.set_log_level("debug")


require("config.lazy")

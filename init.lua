-- line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Tab
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

-- Sync with system clipboard
vim.opt.clipboard = "unnamedplus"

-- Force OSC 52 for clipboard (works over SSH)
vim.g.clipboard = {
  name = "OSC 52",
  copy = {
    ["+"] = require("vim.ui.clipboard.osc52").copy("+"),
    ["*"] = require("vim.ui.clipboard.osc52").copy("*"),
  },
  paste = {
    ["+"] = require("vim.ui.clipboard.osc52").paste("+"),
    ["*"] = require("vim.ui.clipboard.osc52").paste("*"),
  },
}

-- Sync standard yank with this clipboard
vim.opt.clipboard = "unnamedplus"

-- Debug
-- vim.lsp.set_log_level("debug")

require("config.lazy")

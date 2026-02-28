-- the base client capabilities
local base = vim.lsp.protocol.make_client_capabilities()

-- tell lsp I can support folding
base.textDocument.foldingRange = {
  dynamicRegistration = false,
  lineFoldingOnly = true,
}

return base

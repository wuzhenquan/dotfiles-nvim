-- the base client capabilities
local base = vim.lsp.protocol.make_client_capabilities()

-- tell lsp I can support folding
base.textDocument.foldingRange = {
  dynamicRegistration = false,
  lineFoldingOnly = true,
}

-- the final capabilities table
local capabilities = require("blink.cmp").get_lsp_capabilities(base)

return capabilities

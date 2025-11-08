local capabilities = vim.lsp.protocol.make_client_capabilities()
-- I can support folding!
capabilities.textDocument.foldingRange = {
  dynamicRegistration = false,
  lineFoldingOnly = true,
}
return capabilities

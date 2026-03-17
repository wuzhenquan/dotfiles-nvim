return {
  {
    "folke/lazydev.nvim",
    ft = "lua", -- only load when editing Lua files
    opts = {
      library = {
        -- Tell the language server to load snacks types when it sees the global `Snacks`
        { path = "snacks.nvim", words = { "Snacks" } },
      },
    },
  },
}

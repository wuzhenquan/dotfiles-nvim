return {
  "folke/snacks.nvim",
  opts = {
    picker = {
      actions = {
        trouble_open = function(...) return require("trouble.sources.snacks").actions.trouble_open.action(...) end,
      },
      win = {
        input = {
          keys = {
            ["<c-t>"] = {
              "trouble_open",
              mode = { "n", "i" },
            },
          },
        },
      },
    },
  },
}

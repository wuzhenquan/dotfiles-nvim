return {
  "rachartier/tiny-code-action.nvim",
  dependencies = {
    { "nvim-lua/plenary.nvim" }, -- Required utility library
  },
  event = "LspAttach",
  opts = {
    backend = "vim", -- "vim" is the simplest backend (no extra installs needed); avoid having to install the delta tool
  },
  keys = {
    {
      "<leader>ca",
      function() require("tiny-code-action").code_action({}) end,
      mode = { "n", "x" }, -- "n" for normal, "x" for visual mode
      desc = "Tiny Code Action",
    },
  },
}

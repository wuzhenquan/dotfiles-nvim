return {
  {
    "folke/todo-comments.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {}, -- use default highlights/keywords
    keys = {
      {
        "<leader>st",
        function() Snacks.picker.todo_comments() end,
        desc = "Todo (Snacks)",
      },
      {
        "<leader>sT",
        function() Snacks.picker.todo_comments({ keywords = { "TODO", "FIX", "FIXME" } }) end,
        desc = "Todo/Fix/Fixme (Snacks)",
      },
    },
  },
}
-- TODO: Refactor this function
-- FIXME: This crashes on invalid input
-- HACK: Temporary workaround

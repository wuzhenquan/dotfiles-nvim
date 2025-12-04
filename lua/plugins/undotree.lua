return {
  {
    "XXiaoA/atone.nvim",
    cmd = "Atone",
    opts = {}, -- your configuration here
    keys = {
      { "<leader>uu", "<cmd>Atone toggle<cr>", desc = "Undotree toggle" },
      { "<leader>uf", "<cmd>Atone focus<cr>", desc = "Undotree focus" },
      { "<leader>ux", "<cmd>Atone close<cr>", desc = "Undotree close" },
    },
  },
}

return {
  {
    "sainnhe/gruvbox-material",
    priority = 1000,
    lazy = false, -- load during startup
    config = function()
      -- 🌙 Set background and options before applying the theme
      vim.o.background = "dark" -- or "light"
      vim.g.gruvbox_material_background = "hard" -- "soft", "medium", or "hard"
      vim.g.gruvbox_material_foreground = "material" -- or "mix" / "original"
      vim.g.gruvbox_material_enable_italic = 1
      vim.g.gruvbox_material_ui_contrast = "high"
      vim.g.gruvbox_material_better_performance = 1

      vim.cmd.colorscheme("gruvbox-material")
    end,
  },
}

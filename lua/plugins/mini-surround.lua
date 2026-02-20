return {

  {
    "echasnovski/mini.surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy", -- Loads the plugin after startup so mappings like 'ys' are available

    opts = {
      mappings = {
        add = "gsa", -- Add surrounding in Normal and Visual mode
        delete = "gsd", -- Delete surrounding
        find = "gsf", -- Find right surrounding
        find_left = "gsF", -- Find left surrounding
        highlight = "gsh", -- Highlight surrounding
        replace = "gsr", -- Replace surrounding
        update_n_lines = "gsn", -- Update `n_lines`

        suffix_last = "l", -- Suffix to search with "prev" method
        suffix_next = "n", -- Suffix to search with "next" method
      },
      search_method = "cover_or_next",
    },
  },
}

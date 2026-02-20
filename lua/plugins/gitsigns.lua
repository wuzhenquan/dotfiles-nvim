return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    signs = {
      add = { text = "┃" },
      change = { text = "┃" },
      delete = { text = "_" },
      topdelete = { text = "‾" },
      changedelete = { text = "~" },
      untracked = { text = "┆" },
    },
    signs_staged = {
      add = { text = "┃" },
      change = { text = "┃" },
      delete = { text = "_" },
      topdelete = { text = "‾" },
      changedelete = { text = "~" },
      untracked = { text = "┆" },
    },
    signs_staged_enable = true,
    signcolumn = true, -- Toggle with :Gitsigns toggle_signs
    numhl = false, -- Toggle with :Gitsigns toggle_numhl
    linehl = false, -- Toggle with :Gitsigns toggle_linehl
    word_diff = false, -- Toggle with :Gitsigns toggle_word_diff
    watch_gitdir = {
      follow_files = true,
    },
    auto_attach = true,
    attach_to_untracked = false,
    current_line_blame = false, -- Toggle with :Gitsigns toggle_current_line_blame
    current_line_blame_opts = {
      virt_text = true,
      virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
      delay = 1000,
      ignore_whitespace = false,
      virt_text_priority = 100,
      use_focus = true,
    },
    current_line_blame_formatter = ", - ",
    sign_priority = 6,
    update_debounce = 100,
    status_formatter = nil, -- Use default
    max_file_length = 40000,
    preview_config = {
      -- Options passed to nvim_open_win
      style = "minimal",
      relative = "cursor",
      row = 0,
      col = 1,
    },

    on_attach = function(bufnr)
      local gitsigns = require("gitsigns")

      local function map(mode, l, r, opts)
        opts = opts or {}
        opts.buffer = bufnr
        vim.keymap.set(mode, l, r, opts)
      end

      -- Navigation
      map("n", "]c", function()
        if vim.wo.diff then
          vim.cmd.normal({ "]c", bang = true })
        else
          gitsigns.nav_hunk("next")
        end
      end)

      map("n", "[c", function()
        if vim.wo.diff then
          vim.cmd.normal({ "[c", bang = true })
        else
          gitsigns.nav_hunk("prev")
        end
      end)

      -- Normal + visual: stage/reset hunk
      map("n", "<leader>gs", gitsigns.stage_hunk, { desc = "Git stage hunk" })
      map(
        "v",
        "<leader>gs",
        function() gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") }) end,
        { desc = "Git stage hunk" }
      )

      map("n", "<leader>gr", gitsigns.reset_hunk, { desc = "Git reset hunk" })
      map(
        "v",
        "<leader>gr",
        function() gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") }) end,
        { desc = "Git reset hunk" }
      )

      -- Buffer-level
      map("n", "<leader>gS", gitsigns.stage_buffer, { desc = "Git stage buffer" })
      map("n", "<leader>gR", gitsigns.reset_buffer, { desc = "Git reset buffer" })

      -- Preview / diff / blame
      map("n", "<leader>gp", gitsigns.preview_hunk, { desc = "Git preview hunk" })
      map("n", "<leader>gi", gitsigns.preview_hunk_inline, { desc = "Git preview hunk inline" })
      map("n", "<leader>gb", function() gitsigns.blame_line({ full = true }) end, { desc = "Git blame line" })
      map("n", "<leader>gd", gitsigns.diffthis, { desc = "Git diff this" })
      map("n", "<leader>gD", function() gitsigns.diffthis("~") end, { desc = "Git diff this ~" })

      -- Quickfix
      map("n", "<leader>gQ", function() gitsigns.setqflist("all") end, { desc = "Git hunks to quickfix (all)" })
      map("n", "<leader>gq", gitsigns.setqflist, { desc = "Git hunks to quickfix" })

      -- Toggles (t-prefix is common in LazyVim)
      map("n", "<leader>tb", gitsigns.toggle_current_line_blame, { desc = "Toggle git line blame" })
      map("n", "<leader>tw", gitsigns.toggle_word_diff, { desc = "Toggle git word diff" })

      -- Text object (this is fine as-is)
      map({ "o", "x" }, "ih", gitsigns.select_hunk, { desc = "Git hunk textobject" })
    end,
  },
}

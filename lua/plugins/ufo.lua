return {
  {
    'kevinhwang91/nvim-ufo',
    dependencies = { "kevinhwang91/promise-async" },

    -- Run early so folds behave before buffers open
    config = function()
      vim.opt.foldcolumn = '1'

      -- must run after plugin loads
      vim.opt.foldlevel = 99
      vim.opt.foldlevelstart = 99
      vim.opt.foldenable = true

      require('ufo').setup()
    end,

    -- Lazy keymaps that call ufo APIs
    keys = {
      { "zR", function() require("ufo").openAllFolds() end, desc = "UFO: open all folds" },
      { "zM", function() require("ufo").closeAllFolds() end, desc = "UFO: close all folds" },
      { "zr", function() require("ufo").openFoldsExceptKinds() end, desc = "UFO: open folds except kinds" },
      { "zm", function() require("ufo").closeFoldsWith() end, desc = "UFO: close folds with level" },
      {
        "K",
        function()
          local winid = require("ufo").peekFoldedLinesUnderCursor()
          if not winid then
            -- Prefer your LSP hover if available
            if vim.lsp.buf.hover then
              vim.lsp.buf.hover()
            end
          end
        end,
        desc = "UFO: 👀 peek folded (fallback hover)",
      },
    },
  }
}

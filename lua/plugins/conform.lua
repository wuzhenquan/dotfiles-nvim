return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  keys = {
    {
      -- Customize or remove this keymap to your liking
      "<leader>f",
      function()
        require("conform").format({ async = true })
      end,
      mode = "",
      desc = "Format buffer",
    },
  },
  -- This will provide type hinting with LuaLS
  ---@module "conform"
  ---@type conform.setupOpts
  opts = {
    -- GENERAL SETTINGS
    default_format_opts = {
      lsp_format = "fallback", -- Use LSP formatting if no formatter is available
    },
    format_on_save = { timeout_ms = 500 },

    -- FILETYPE MAPPINGS
    formatters_by_ft = (function()
      -- Web Development (Try prettierd first, fallback to prettier)
      local web_formatters = { "prettierd", "prettier", stop_after_first = true }
      return {
        lua = { "stylua" },

        javascript = web_formatters,
        typescript = web_formatters,
        javascriptreact = web_formatters, -- JSX
        typescriptreact = web_formatters, -- TSX
        html = web_formatters,
        css = web_formatters,
        json = web_formatters,
        yaml = web_formatters,
        markdown = web_formatters,

        -- Universal Trimming (Runs on ALL files)
        ["*"] = { "trim_whitespace" },
      }
    end)(),

    -- CUSTOM CONFIGURATIONS
    formatters = {
      shfmt = { append_args = { "-i", "2" } },

      -- STYLUA: Uses CLI args to find your global TOML config
      stylua = {
        prepend_args = {
          -- Note: Stylua uses --config-path, not --config
          "--config-path",
          vim.fn.expand("~/.config/nvim/utils/formatters/.stylua.toml"),
        },
      },

      -- PRETTIERD (Primary): Uses env var to find your global TOML config
      prettierd = {
        env = {
          PRETTIERD_DEFAULT_CONFIG = vim.fn.expand("~/.config/nvim/utils/formatters/.prettierrc.toml"),
        },
      },

      -- PRETTIER (Backup): Uses CLI args to find the same TOML config
      prettier = {
        prepend_args = {
          "--config",
          vim.fn.expand("~/.config/nvim/utils/formatters/.prettierrc.toml"),
          -- This ensures your global file overrides built-in defaults,
          -- but Project-specific .prettierrc files will still win if they exist.
          "--config-precedence",
          "file-override",
        },
      },
    },

    init = function()
      -- If you want the formatexpr, here is the place to set it
      vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
    end,
  },
}

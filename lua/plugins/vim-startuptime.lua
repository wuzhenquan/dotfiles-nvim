return {
  {
    "dstein64/vim-startuptime",
    cmd = "StartupTime", -- This implies lazy = true AND creates the command trigger
    init = function() vim.g.startuptime_tries = 10 end,
  },
}

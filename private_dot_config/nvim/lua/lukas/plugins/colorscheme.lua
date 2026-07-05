return {
  {
    "oonamo/ef-themes.nvim",
    priority = 1000, -- Loads this before other plugins.
    config = function(_, opts)
      require("ef-themes")
      vim.cmd("colorscheme ef-dark")
    end,
  }
}

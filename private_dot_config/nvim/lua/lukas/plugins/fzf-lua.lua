return {
  "ibhagwan/fzf-lua",
  -- optional for icon support
  dependencies = { "nvim-tree/nvim-web-devicons" },
  -- or if using mini.icons/mini.nvim
  -- dependencies = { "nvim-mini/mini.icons" },
  ---@module "fzf-lua"
  ---@type fzf-lua.Config|{}
  ---@diagnostic disable: missing-fields
  opts = {},
  ---@diagnostic enable: missing-fields
  keys = {
    { "<leader>ff", "<cmd>FzfLua files<cr>", desc = "Find files (fuzzy)" },
    { "<leader>fg", "<cmd>FzfLua live_grep<cr>", desc = "Live grep (fuzzy)" },
    { "<leader>fb", "<cmd>FzfLua buffers<cr>", desc = "Find buffers (fuzzy)" },
    { "<leader>fh", "<cmd>FzfLua help_tags<cr>", desc = "Find help tags(fuzzy)" },
  }
}

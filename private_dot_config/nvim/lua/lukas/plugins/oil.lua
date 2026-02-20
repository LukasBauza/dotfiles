return {
  "stevearc/oil.nvim",
  name = "oil",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    default_file_explorer = true,
    delete_to_trash = true,
    view_options = {
      show_hiddent = true,
    }
  },
  keys = {
    { "<leader>fe", "<CMD>Oil --float<CR>", desc = "Open parent directory." }
  }
}

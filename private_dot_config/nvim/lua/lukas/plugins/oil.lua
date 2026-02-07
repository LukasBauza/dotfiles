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
  config = function(_, opts)
    require("oil").setup(opts)

    vim.keymap.set("n", "<leader>fe", "<CMD>Oil<CR>", { desc = "Toggle float oil." })
  end
}

return {
  "kdheepak/lazygit.nvim",
  name = "lazygit",
  cmd = {
    "LazyGit",
    "LazyGitConfig",
    "LazyGitCurrentFile",
    "LazyGitFilter",
    "LazyGitFilterCurrentFile"
  },
  -- For floating window border decorations.
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  keys = {
    { "<leader>ge", "<CMD>LazyGit<CR>", desc = "Open lazy git." }
  }
}

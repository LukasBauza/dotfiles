return {
  "nvim-mini/mini.pairs",
  name = "mini.pairs",
  event = { "InsertEnter" },

  config = function()
    require("mini.pairs").setup()
  end
}

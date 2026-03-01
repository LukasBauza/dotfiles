return {
	"ibhagwan/fzf-lua",
	name = "fzf-lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	---@module "fzf-lua"
	---@type fzf-lua.config|{}
	---@diagnostic disable: missing-fields
	opts = {},
	keys = {
		{
			"<leader>ff",
			function()
				require("fzf-lua").files()
			end,
			desc = "Find files.",
		},
		{
			"<leader>gl",
			function()
				require("fzf-lua").live_grep()
			end,
			desc = "Live grep.",
		},
		{
			"<leader>bf",
			function()
				require("fzf-lua").buffers()
			end,
			desc = "Find buffers.",
		},
	},
	---@diagnostic enable: missing-fields
}

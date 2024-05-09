return {
	"nvim-tree/nvim-tree.lua",
	version = "*",
	lazy = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		require("nvim-tree").setup({
			view = {
				width = 30,
				side = "left", -- left, right
				float = {
					enable = true, -- floating
					open_win_config = {
						relative = "editor",
						border = "rounded",
						width = 100,
						height = 30,
						row = math.floor((vim.o.lines - 30) / 2),
						col = math.floor((vim.o.columns - 100) / 2),
					},
				},
			},
		})
	end,
}

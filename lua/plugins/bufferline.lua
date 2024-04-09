return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = "nvim-tree/nvim-web-devicons",
	config = function()
		local bufferline = require("bufferline")
		bufferline.setup({
			options = {
				indicator = {
					-- icon = "▎", -- this should be omitted if indicator style is not 'icon'
					style = "none" --  "icon" | "underline" | "none",
				},
			},
		})
	end,
}

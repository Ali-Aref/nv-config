return {
	"numToStr/Comment.nvim",
	lazy = false,
	opts = {
		-- add any options here
	},
	config = function()
		require("Comment").setup({
			toggler = {  -- normal mode
				line = "<leader>/",
				block = "gbc",
			},
			opleader = {  -- visual mode
				line = "<leader>/",
				block = "gb",
			},
		})
	end,
}

return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = "nvim-tree/nvim-web-devicons",
	config = function()
		local bufferline = require("bufferline")
		bufferline.setup({
			options = {
				show_buffer_icons = true,
				show_close_icon = true,
				show_buffer_close_icons = true,
				color_icons = true, -- whether or not to add the filetype icon highlights
				separator_style = "thick", -- options are: "slant" "slope" "thick" "thin"
				indicator = {
					-- icon = "▎", -- this should be omitted if indicator style is not 'icon'
					style = "icon" --  "icon" | "underline" | "none",
				},
			},
		})
		-- bufferline
		vim.keymap.set("n", "<Tab>", ":BufferLineCycleNext<CR>", { desc = "To next buffer" })
		vim.keymap.set("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", { desc = "To prev buffer" })
	end,
}

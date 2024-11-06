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
				separator_style = { "", "" }, -- options are: "slant" "slope" "thick" "thin", { 'any', 'any' }
				indicator = {
					-- icon = "", -- this should be omitted if indicator style is not 'icon'
					-- icon = "", -- this should be omitted if indicator style is not 'icon'
					style = "none" --  "icon" | "underline" | "none",
				},
			-- to disable diagnostics comment this section
			-- diagnostics = "nvim_lsp", -- "nvim_lsp" | "coc"
			-- diagnostics_indicator = function(count, level)
			-- 		local icon = level:match("error") and " " or " "
			-- 		return " " .. icon .. count
			-- end,
			},
		})
		-- bufferline
		vim.keymap.set("n", "<Tab>", ":BufferLineCycleNext<CR>", { desc = "To next buffer" })
		vim.keymap.set("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", { desc = "To prev buffer" })
	end,
}

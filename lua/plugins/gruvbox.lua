return {
	"ellisonleao/gruvbox.nvim",
	priority = 1000,
	config = function()
		require("gruvbox").setup({
			terminal_colors = true, -- add neovim terminal colors
			undercurl = false,
			underline = true,
			bold = true,
			italic = {
				strings = true,
				emphasis = true,
				comments = true,
				operators = false,
				folds = true,
			},
			strikethrough = false,
			invert_selection = false,
			invert_signs = false,
			invert_tabline = false,
			invert_intend_guides = false,
			inverse = false, -- invert background for search, diffs, statuslines and errors
			contrast = "hard", -- can be "hard", "soft" or empty string
			palette_overrides = {},
			overrides = {
				SpellBad = { undercurl = true, sp = "#ff0000" }, -- underline miss-spelled words
				-- -- remove borders
				-- Normal = { bg = "#282828" },
				-- VertSplit = { bg = "#282828", fg = "#282828" }, 
				-- StatusLine = { bg = "#282828", fg = "#282828" },
				-- StatusLineNC = { bg = "#282828", fg = "#282828" },
				-- WinSeparator = { bg = "#282828", fg = "#282828" },
			},
			dim_inactive = false,
			transparent_mode = true,
		})
	end,
}

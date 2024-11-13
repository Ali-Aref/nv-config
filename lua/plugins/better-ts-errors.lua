return {
	{
		"OlegGulevskyy/better-ts-errors.nvim",
		dependencies = { "MunifTanjim/nui.nvim" },
		config = function()
			require("better-ts-errors").setup({
				keymaps = {
					toggle = "gL", -- Toggling keymap
					-- go_to_definition = "<C-g><C-l>", -- Go to problematic type from popup window
				},
			})
		end,
	},
	{
		"MunifTanjim/nui.nvim",
		lazy = false,
	},
}

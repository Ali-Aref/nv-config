return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local configs = require("conform")
		configs.setup({
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "isort", "black" },
				html = { "prettier" },
				javascript = { "prettier" },
				javascriptreact = { "prettier" },
				typescript = { "prettier" },
				typescriptreact = { "prettier" },
			},
			formatter_configs = {
				prettier = {
					options = {
						printWidth = 75, -- Example line length for Prettier
					},
				},
				black = {
					options = {
						line_length = 75, -- Example line length for Black
					},
				},
			},
		})
	end,
}

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
		})
	end,
}

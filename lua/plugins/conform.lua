return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "isort", "black" },
				html = { "prettier" },
				javascript = { "prettier" },
				javascriptreact = { "prettier" },
				typescript = { "prettier" },
				typescriptreact = { "prettier" },
			},
			formatters = {
				prettier = {
					command = "prettier --print-width 90 --stdin-filepath %:p",
				},
				black = {
					command = "black --line-length 75 -",
				},
			},
		})
	end,
}

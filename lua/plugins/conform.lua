return {
	"stevearc/conform.nvim",
	-- event = { "BufReadPre", "BufNewFile" },
	lazy = true,
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "isort", "black" },
				html = { "prettier" },
				javascript = { "prettier" },
				javascriptreact = { "prettier" },
				typescript = { "prettier" },
				typescriptreact = { "prettier" },
				-- ["*"] = { "codespell" },
			},
			formatters = {
				prettier = {
					prepend_args = { "--print-width", "75" },
				},
				black = {
					prepend_args = { "--line-length", "75" },
				},
				-- eslint = {
				-- 	exe = "eslint",  -- Path to ESLint executable
				-- 	args = { "--fix" },  -- Arguments to pass to ESLint
				-- 	cwd = function(params) return params.root  -- Set working directory to the project root
				-- 	end,
				-- }
			},
		})
	end,
}

return {
	{
		'nvim-telescope/telescope.nvim',
		tag = '0.1.8',
		dependencies = { 'nvim-lua/plenary.nvim' },
		config = function()
			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<leader>fa", builtin.git_files, { desc = "Find all files" })
			vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
			vim.keymap.set("n", "<leader>fw", builtin.live_grep, { desc = "Live grep " })
			vim.keymap.set("n", "<leader>fW", builtin.grep_string, { desc = "Grep string under cursor" })
			vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Find buffer" })
			vim.keymap.set("n", "<leader>fc", builtin.colorscheme, { desc = "Choose color scheme" })
			-- lsp features
			vim.keymap.set("n", "<leader>fr", builtin.lsp_references, { desc = "Find LSP reference from under cursor" })
			vim.keymap.set("n", "<leader>fs", builtin.lsp_document_symbols, { desc = "Find LSP document symbols" })
			vim.keymap.set("n", "<leader>fS", builtin.lsp_workspace_symbols, { desc = "Find LSP workspace symbols" })
			vim.keymap.set("n", "<leader>fd", function()
				builtin.diagnostics({ bufnr = 0 })
			end, { desc = "Find diagnostics for current buffer" })
			vim.keymap.set("n", "<leader>fD", builtin.diagnostics, { desc = "Find diagnostics for all buffers" })
		end,
	},
	-- telescope ui for quick actions
	{
		'nvim-telescope/telescope-ui-select.nvim',
		config = function()
			require("telescope").setup {
				extensions = {
					["ui-select"] = { require("telescope.themes").get_dropdown {}
					}
				}
			}
			require("telescope").load_extension("ui-select")
		end,
	}
}

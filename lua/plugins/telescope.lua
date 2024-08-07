return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.6",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		require("telescope").setup({
			defaults = {
				-- don't manually ignore files, so that you can find it using <leader>fa
				-- if they are not ignored, you should install ripgrep
				-- file_ignore_patterns = { "node_modules", "env", ".env", ".git" },
				
				-- Default configuration for telescope goes here:
				-- config_key = value,
				mappings = {
					n = {
						-- map actions.which_key to <C-h> (default: <C-/>)
						-- actions.which_key shows the mappings for your picker,
						-- e.g. git_{create, delete, ...}_branch for the git_branches picker
						["<C-h>"] = "which_key",
					},
				},
			},
			pickers = {
				live_grep = { theme = "ivy" },
				grep_string = { theme = "ivy" },
				lsp_references = { theme = "ivy" },
				lsp_document_symbols = { theme = "cursor" },
				lsp_workspace_symbols = { theme = "ivy" },
				diagnostics = { theme = "ivy" }
			},
			extensions = {
				-- Your extension configuration goes here:
				-- extension_name = {
				--   extension_config_key = value,
				-- }
				-- please take a look at the readme of the extension you want to configure
			},
		}) -- end setup
	end,
}

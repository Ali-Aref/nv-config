return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local excluded_filetypes = { "NvimTree", "TelescopePrompt", "spectre_panel", "FTerm" }
		require("lualine").setup({
			options = {
				icons_enabled = true,
				theme = "auto",
				component_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },
				always_divide_middle = true,
				always_show_tabline = true,
				globalstatus = true,
				refresh = {
					statusline = 100,
					tabline = 100,
					winbar = 100,
				},
				disabled_filetypes = {
					statusline = {},
					winbar = {},
				},
				ignore_focus = excluded_filetypes,
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "diff", "diagnostics" },
				lualine_c = { "filename" },
				lualine_x = { "filetype" },
				lualine_y = { "progress" },
				lualine_z = { "location" },
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { "filename" },
				lualine_x = { "location" },
				lualine_y = {},
				lualine_z = {},
			},
			tabline = {
				lualine_a = {
					{
						"buffers",
						use_mode_colors = false,
						show_filename_only = true,
						hide_filename_extension = false,
						show_modified_status = true,
						-- max_length = vim.o.columns * 2 / 3, -- Maximum width of buffers component,
						filetype_names = {
							TelescopePrompt = "Telescope",
							dashboard = "Dashboard",
							FTerm = "Terminal",
						}, -- Shows specific buffer name for that filetype ( { `filetype` = `buffer_name`, ... } )
						symbols = {
							modified = " ●",
							alternate_file = "#",
							directory = "",
						},
					},
				},
				lualine_b = {},
				lualine_c = {},
				lualine_x = {},
				lualine_y = { "tabs" },
				lualine_z = { "branch" },
			},
			winbar = {},
			inactive_winbar = {},
			extensions = {},
		})
	end,
}

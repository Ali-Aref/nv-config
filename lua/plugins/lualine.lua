return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local excluded_filetypes = { "NvimTree", "TelescopePrompt", "spectre_panel", "FTerm" }
		local custom_theme = require("lualine.themes.gruvbox")
		custom_theme.normal.c.bg = nil
		custom_theme.insert.c.bg = nil
		custom_theme.visual.c.bg = nil
		custom_theme.replace.c.bg = nil
		custom_theme.command.c.bg = nil

		local function buffer_count()
			local buffers = vim.api.nvim_list_bufs()
			local count = 0
			for _, buf in ipairs(buffers) do
				if vim.api.nvim_buf_is_loaded(buf) and vim.fn.buflisted(buf) == 1 then
					count = count + 1
				end
			end
			return count
		end

		require("lualine").setup({
			options = {
				theme = custom_theme,
				--        
				section_separators = { left = "", right = "" },
				-- │ ┊      
				component_separators = { left = "", right = "" },
				globalstatus = true,
				disabled_filetypes = { statusline = { "dashboard", "alpha", "starter", "snacks_dashboard" } },
				refresh = {
					statusline = 300,
				},
				ignore_focus = excluded_filetypes,
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "diff", "diagnostics" },
				lualine_c = { "filename" },
				lualine_x = {
					{
						function()
							local clients = vim.lsp.get_active_clients({ bufnr = 0 })
							if #clients == 0 then
								return "No LSP"
							end
							local client_names = {}
							for _, client in ipairs(clients) do
								table.insert(client_names, client.name)
							end
							return table.concat(client_names, ", ")
						end,
						icon = "󱐋",
						-- color = { fg = "cyan", bg = nil },
					},
					"filetype",
				},
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
						draw_empty = true, -- Makes the section take as much space as possible
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
							alternate_file = "",
							directory = "",
						},
						-- buffers_color = {
						-- 	-- Same values as the general color option can be used here.
						-- 	active = "lualine_a_normal", -- Color for active buffer.
						-- 	inactive = "lualine_c_inactive", -- Color for inactive buffer.
						-- },
					},
				},
				lualine_b = {},
				lualine_c = {},
				lualine_x = {},
				lualine_y = { buffer_count },
				lualine_z = { "branch" },
			},
			winbar = {},
			inactive_winbar = {},
			extensions = {},
		})
	end,
}

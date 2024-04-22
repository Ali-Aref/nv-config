return {
	{
		"vhyrro/luarocks.nvim",
		priority = 1000,
		config = true,
	},
	{
		"rest-nvim/rest.nvim",
		ft = "http",
		dependencies = { "luarocks.nvim" },
		config = function()
			require("rest-nvim").setup({
				client = "curl",
				env_file = ".env",
				env_pattern = "\\.env$",
				env_edit_command = "tabedit",
				encode_url = true,
				skip_ssl_verification = false,
				custom_dynamic_variables = {},
				result = {
					split = {
						horizontal = false,
						in_place = true,
						stay_in_current_window_after_split = true,
					},
				},
			})
		end,
	},
}

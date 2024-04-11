return {
	{ "VonHeikemen/lsp-zero.nvim", branch = "v3.x" },
	{ "neovim/nvim-lspconfig" },
	{ "hrsh7th/cmp-nvim-lsp" },
	{ "hrsh7th/nvim-cmp" },
	{
		"L3MON4D3/LuaSnip",
		dependencies = {
			{ "rafamadriz/friendly-snippets" },
			{ "saadparwaiz1/cmp_luasnip" },  -- to make friendly snippets work with cmp
		},
		config = function()
			-- lazy load friendly snippets
			require('luasnip.loaders.from_vscode').lazy_load()
		end,
	},
}

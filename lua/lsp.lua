local lsp_zero = require("lsp-zero")

lsp_zero.on_attach(function(client, bufnr)
	lsp_zero.default_keymaps({ buffer = bufnr })
end)

-- for lanugage server check
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md

-- auto complete
local cmp = require("cmp")

cmp.setup({
	mapping = {
		["<CR>"] = cmp.mapping.confirm({ select = false }),
		["<C-e>"] = cmp.mapping.abort(),
		["<Tab>"] = cmp.mapping.select_next_item({ behavior = "select" }),
		["<S-Tab>"] = cmp.mapping.select_prev_item({ behavior = "select" }),
	},
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},
	formatting = {
		-- fields = { "menu", "abbr", "kind" },
	},
	sources = {
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
	},
})

-- tsserver
require("lspconfig").tsserver.setup({
	filetypes = {
		"javascript",
		"typescript",
		"javascriptreact",
		"typescriptreact",
	},
})

-- pyright
require("lspconfig").pyright.setup({})

-- vscode-langservers-extracted
require("lspconfig").eslint.setup({})
require("lspconfig").jsonls.setup({})
require("lspconfig").cssls.setup({})
require("lspconfig").html.setup({})

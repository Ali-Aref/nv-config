local lsp_zero = require("lsp-zero")

lsp_zero.on_attach(function(client, bufnr)
	lsp_zero.default_keymaps({ buffer = bufnr })
end)

lsp_zero.set_sign_icons({
	error = "✘",
	warn = "▲",
	hint = "⚑",
	info = "»",
})

-- auto complete
local cmp = require("cmp")
local cmp_action = require("lsp-zero").cmp_action()

cmp.setup({
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},
	sources = {
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
	},
	mapping = {
		["<CR>"] = cmp.mapping.confirm({ select = false }),
		["<Tab>"] = cmp.mapping.select_next_item({ behavior = "select" }),
		["<S-Tab>"] = cmp.mapping.select_prev_item({ behavior = "select" }),
		["<C-l>"] = cmp_action.luasnip_supertab(), -- mv cursor
		["<C-h>"] = cmp_action.luasnip_shift_supertab(), -- mv cursor
		["<C-e>"] = cmp.mapping.abort(),
	},
	formatting = require("lsp-zero").cmp_format({ details = true }),
})

-- lsp mappings
vim.api.nvim_create_autocmd("LspAttach", {
	desc = "LSP actions",
	callback = function(event)
		local opts = { buffer = event.buf }
		vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
		vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
		vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)
		vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)
		vim.keymap.set("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>", opts)
		vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", opts)
		vim.keymap.set("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts)
		vim.keymap.set("n", "<F2>", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
		vim.keymap.set({ "n", "x" }, "<F3>", "<cmd>lua vim.lsp.buf.format({async = true})<cr>", opts)
		vim.keymap.set("n", "<F4>", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
		vim.keymap.set("n", "gl", "<cmd>lua vim.diagnostic.open_float()<cr>", opts)
		vim.keymap.set("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<cr>", opts)
		vim.keymap.set("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<cr>", opts)
	end,
})
local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()

-- for lanugage server check
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md

-- tsserver
require("lspconfig").tsserver.setup({
	capabilities = lsp_capabilities,
	filetypes = {
		"javascript",
		"typescript",
		"javascriptreact",
		"typescriptreact",
	},
})

-- pyright
require("lspconfig").pyright.setup({ capabilities = lsp_capabilities })

-- vscode-langservers-extracted
require("lspconfig").eslint.setup({ capabilities = lsp_capabilities })
require("lspconfig").jsonls.setup({ capabilities = lsp_capabilities })
require("lspconfig").cssls.setup({ capabilities = lsp_capabilities })
require("lspconfig").html.setup({ capabilities = lsp_capabilities })

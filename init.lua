local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })
--
-- setting norwap
-- vim.wo.wrap = false
vim.wo.number = false

-- adding other snippets
-- require'luasnip'.filetype_extend("python", {"django"})
-- require'luasnip'.filetype_extend("javaScript", {"react-ts"})
vim.g.vscode_snippets_path = "/home/ali/.config/nvim/lua/custom/snippets/"

-- disbale inline diagnostics
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
      virtual_text = false,
    }
)

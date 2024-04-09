-- jj to esc
vim.keymap.set("i", "jj", "<esc>")

-- paste what you have copied
vim.keymap.set("x", "<leader>p", '"_DP')

-- move selected block
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- kill current buffer
vim.keymap.set("n", "<leader>x", "<cmd>bnext<CR><cmd>bd#<CR>", { desc = "Close buffer" })
-- vim.keymap.set('n', '<leader>x', function()
--     local current_buf = vim.api.nvim_get_current_buf()
--     local next_buf = vim.api.nvim_list_bufs()[current_buf + 1] or vim.api.nvim_list_bufs()[current_buf - 1]
--     if next_buf then
--         vim.api.nvim_buf_delete(current_buf, { force = true })
--         vim.api.nvim_set_current_buf(next_buf)
--     else
--         vim.api.nvim_buf_delete(current_buf, { force = true })
--         vim.api.nvim_command('enew')
--     end
-- end, { desc = "Close buffer and switch to next/previous" })

-- navigate to panes
vim.keymap.set("n", "<A-h>", "<C-w>h", { desc = "Move left" })
vim.keymap.set("n", "<A-l>", "<C-w>l", { desc = "Move right" })
vim.keymap.set("n", "<A-k>", "<C-w>k", { desc = "Move up" })
vim.keymap.set("n", "<A-j>", "<C-w>j", { desc = "Move down" })

-- conform
vim.keymap.set({ "n", "v" }, "<leader>fm", function()
	require("conform").format({
		lsp_fallback = true,
	})
end, { desc = "Format your file." })

-- telescope
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>fa", builtin.git_files, { desc = "Find all files" })
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
vim.keymap.set("n", "<leader>fw", builtin.live_grep, { desc = "Live grep " })
vim.keymap.set("n", "<leader>fg", builtin.grep_string, { desc = "Grep string under cursor" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Find buffer" })
vim.keymap.set("n", "<leader>fc", builtin.colorscheme, { desc = "Choose color scheme" })
--lsp
vim.keymap.set("n", "<leader>fr", builtin.lsp_references, { desc = "Find LSP reference from under cursor" })
vim.keymap.set("n", "<leader>fs", builtin.lsp_document_symbols, { desc = "Find LSP document symbols" })
vim.keymap.set("n", "<leader>fS", builtin.lsp_workspace_symbols, { desc = "Find LSP workspace symbols" })

-- nvim tree
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { desc = "Toggle Files" })

-- bufferline
vim.keymap.set("n", "<Tab>", ":BufferLineCycleNext<CR>", { desc = "To next buffer" })
vim.keymap.set("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", { desc = "To prev buffer" })


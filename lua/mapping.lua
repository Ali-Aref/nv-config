-- jj to esc
vim.keymap.set("i", "jj", "<esc>")

-- paste what you have copied
vim.keymap.set("n", "<leader>p", '"_DP')

-- map ; to : 
vim.keymap.set("n", ";", ':')

-- move selected block
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- kill current buffer
vim.keymap.set("n", "<leader>x", "<cmd>bnext<CR><cmd>bd#<CR>", { desc = "Close buffer" })

-- toggle spell checking
vim.keymap.set("n", "gS", "<cmd>setlocal spell!<cr>", { desc = "Toggle spell checking" })

-- navigate to panes
vim.keymap.set("n", "<A-h>", "<C-w>h", { desc = "Move left" })
vim.keymap.set("n", "<A-l>", "<C-w>l", { desc = "Move right" })
vim.keymap.set("n", "<A-k>", "<C-w>k", { desc = "Move up" })
vim.keymap.set("n", "<A-j>", "<C-w>j", { desc = "Move down" })

-- resize panes
vim.keymap.set("n", "<leader>h", "<cmd>vertical resize -10<CR>", { desc = "Shrink pane vertically" })
vim.keymap.set("n", "<leader>l", "<cmd>vertical resize +10<CR>", { desc = "Gorw pane vertically" })
vim.keymap.set("n", "<leader>j", "<cmd>resize +5<CR>", { desc = "Grow pane horizontally" })
vim.keymap.set("n", "<leader>k", "<cmd>resize -5<CR>", { desc = "Shrink pane horizontally" })

-- conform
vim.keymap.set({ "n", "v" }, "<leader>fm", function()
	require("conform").format({
		lsp_fallback = true,
		timeout_ms = 3000, -- 3 seconds
	})
end, { desc = "Format your file." })

-- telescope
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>fa", builtin.git_files, { desc = "Find all files" })
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
vim.keymap.set("n", "<leader>fw", builtin.live_grep, { desc = "Live grep " })
vim.keymap.set("n", "<leader>fW", builtin.grep_string, { desc = "Grep string under cursor" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Find buffer" })
vim.keymap.set("n", "<leader>fc", builtin.colorscheme, { desc = "Choose color scheme" })
--lsp
vim.keymap.set("n", "<leader>fr", builtin.lsp_references, { desc = "Find LSP reference from under cursor" })
vim.keymap.set("n", "<leader>fs", builtin.lsp_document_symbols, { desc = "Find LSP document symbols" })
vim.keymap.set("n", "<leader>fS", builtin.lsp_workspace_symbols, { desc = "Find LSP workspace symbols" })
vim.keymap.set("n", "<leader>fd", function() builtin.diagnostics({ bufnr = 0 }) end, { desc = "Find diagnostics for current buffer" })
vim.keymap.set("n", "<leader>fD", builtin.diagnostics, { desc = "Find diagnostics for all buffers" })
--global search and replace
vim.keymap.set("n", "<leader>fgs", '<cmd>lua require("spectre").toggle()<CR>', { desc = "Toggle Spectre", })
vim.keymap.set("n", "<leader>fgw", '<cmd>lua require("spectre").open_visual({select_word=true})<CR>', { desc = "Search current word", })

-- nvim tree
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { desc = "Toggle Files" })

-- bufferline
vim.keymap.set("n", "<Tab>", ":BufferLineCycleNext<CR>", { desc = "To next buffer" })
vim.keymap.set("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", { desc = "To prev buffer" })

-- quickfix
vim.keymap.set("n", "<leader>q", ":copen<CR>", { desc = "Open quickfix" })
vim.keymap.set("n", "<leader>Q", ":cclose<CR>", { desc = "Close quickfix" })

-- mkview & loadview
vim.keymap.set("n", "<C-m>m", ":mkview<CR>", { desc = "Make view" })
vim.keymap.set("n", "<C-m>l", ":loadview<CR>", { desc = "Load view" })

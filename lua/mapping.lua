-- jj to esc
vim.keymap.set("i", "jj", "<esc>")

-- paste what you have copied
vim.keymap.set("n", "<leader>p", '"_DP')

-- map ; to :
vim.keymap.set("n", ";", ":")

-- map noh to esc
vim.keymap.set("n": "<esc>", "<cmd>:noh<CR>")

-- move selected block
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- kill current buffer
vim.keymap.set("n", "<leader>x", "<cmd>bprev<CR><cmd>bd#<CR>", { desc = "Close buffer" })

-- toggle spell checking
vim.keymap.set("n", "gS", "<cmd>setlocal spell!<cr>", { desc = "Toggle spell checking" })

-- navigate to panes
vim.keymap.set("n", "<A-h>", "<C-w>h", { desc = "Move left" })
vim.keymap.set("n", "<A-l>", "<C-w>l", { desc = "Move right" })
vim.keymap.set("n", "<A-k>", "<C-w>k", { desc = "Move up" })
vim.keymap.set("n", "<A-j>", "<C-w>j", { desc = "Move down" })

-- resize panes
vim.keymap.set("n", "<C-Left>", "<cmd>vertical resize -10<CR>", { desc = "Shrink pane vertically" })
vim.keymap.set("n", "<C-Right>", "<cmd>vertical resize +10<CR>", { desc = "Gorw pane vertically" })
vim.keymap.set("n", "<C-Down>", "<cmd>resize +5<CR>", { desc = "Grow pane horizontally" })
vim.keymap.set("n", "<C-Up>", "<cmd>resize -5<CR>", { desc = "Shrink pane horizontally" })

-- conform
vim.keymap.set({ "n", "v" }, "<leader>fm", function()
	require("conform").format({
		lsp_fallback = false,
		timeout_ms = 5000, -- 3 seconds
	})
end, { desc = "Format your file." })

-- toggle line numbers
vim.keymap.set("n", "<leader>n", function()
	local number_enabled = vim.o.number
	local relativenumber_enabled = vim.o.relativenumber
	if number_enabled or relativenumber_enabled then
		vim.cmd("set norelativenumber")
		vim.cmd("set nonumber")
	else
		vim.cmd("set relativenumber")
		vim.cmd("set number")
	end
end, { desc = "Toggle line numbers" })

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
vim.keymap.set("n", "<leader>fd", function()
	builtin.diagnostics({ bufnr = 0 })
end, { desc = "Find diagnostics for current buffer" })
vim.keymap.set("n", "<leader>fD", builtin.diagnostics, { desc = "Find diagnostics for all buffers" })
--global search and replace
vim.keymap.set("n", "<leader>fgs", '<cmd>lua require("spectre").toggle()<CR>', { desc = "Toggle Spectre" })
vim.keymap.set(
	"n",
	"<leader>fgw",
	'<cmd>lua require("spectre").open_visual({select_word=true})<CR>',
	{ desc = "Search current word" }
)

-- nvim tree
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { desc = "Toggle Files" })

-- bufferline
vim.keymap.set("n", "<Tab>", ":BufferLineCycleNext<CR>", { desc = "To next buffer" })
vim.keymap.set("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", { desc = "To prev buffer" })

-- mkview & loadview
-- vim.keymap.set("n", "<C-m>m", ":mkview<CR>", { desc = "Make view" })
-- vim.keymap.set("n", "<C-m>l", ":loadview<CR>", { desc = "Load view" })

-- clipboard
vim.opt.clipboard = "unnamedplus"

-- wrap
vim.opt.wrap = false
vim.opt.termguicolors = true

-- tabs
vim.o.tabstop = 2 -- Set tab spacing to 2 spaces
vim.o.shiftwidth = 2 -- Set the number of spaces used for each level of indentation
vim.o.softtabstop = 2 -- Set the number of spaces to insert when the Tab key is pressed

-- linenumber
vim.opt.number = true
vim.opt.relativenumber = true

-- split new pane to right
vim.opt.splitright = true

-- vim.opt.guicursor = "" -- normal mode cursor
vim.opt.cursorline = false -- highlight the current line

-- sepll check
vim.opt.spell = false
vim.opt.spelllang = "en_us"
vim.opt.showmode = true -- Shows a message for misspelled words

vim.diagnostic.config {
    virtual_text = false, -- Disable inline diagnostics
		-- setting window border for diagnostic
		float = {
			border = "rounded", -- options: "none", "single", "double", "rounded", "solid", "shadow"
		},
		signs = {
			text = {
				[vim.diagnostic.severity.ERROR] = '✘',
				[vim.diagnostic.severity.WARN] = '▲',
				[vim.diagnostic.severity.HINT] = '⚑',
				[vim.diagnostic.severity.INFO] = '»',
			},
		},
}


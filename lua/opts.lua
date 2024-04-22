-- leader key
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.diagnostic.config {
    virtual_text = false, -- Disable inline diagnostics
    signs = true,        -- Disable diagnostic signs
}

-- sepll check
vim.opt.spell = true
vim.opt.spelllang = "en_us"
-- vim.opt.showmode = "underline"  -- Underlines misspelled words
vim.opt.showmode = true        -- Shows a message for misspelled words

-- vim.opt.guicursor = "" -- normal mode cursor

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.wrap = false
vim.opt.termguicolors = true

-- split new pane to right
vim.opt.splitright = true

-- clipboard
vim.opt.clipboard = "unnamedplus"

-- tabs
vim.o.tabstop = 2 -- Set tab spacing to 2 spaces
vim.o.shiftwidth = 2 -- Set the number of spaces used for each level of indentation
vim.o.softtabstop = 2 -- Set the number of spaces to insert when the Tab key is pressed

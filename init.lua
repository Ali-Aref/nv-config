require("opts")

-- bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")
require("lsp")
require("mapping")

-- framework snippets
require("luasnip").filetype_extend("python", { "django" })

-- theme
-- vim.cmd("colorscheme nord")
vim.o.background = "dark" -- dark/light gruvbox dark mode
vim.cmd("colorscheme gruvbox")
